Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B86DCD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 17:51:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQU24-0004WW-Kz; Fri, 22 May 2026 13:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQU22-0004Vf-NE
 for qemu-arm@nongnu.org; Fri, 22 May 2026 13:51:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQU20-0007rJ-Mn
 for qemu-arm@nongnu.org; Fri, 22 May 2026 13:51:34 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MBwF5b1297937
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 17:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kMXpJ7jxIt3gHnppSLF/heM4Ho5OPJAxJVHJD3For8g=; b=VWwZRtswyM/nBAJN
 EoBM+SLF5T037w6Ji118Qw6X/LX744x1lSW/0FZf/tpmnLAr4qIH59NiYMnxxjyF
 IIHrK1IZD68oKpV8c1d5gGrDh/lSZ78IB1WBtoy+CPPwX7oirLqSxNoOwJIOZdPJ
 tP3eGEs+KUyec1n/qccXfn1nYWPnAgc51EegUOkbU4rjfBaTMF0X51UzH1XAOgOP
 06iF+Ry5r4S0fGHqIa+RacJLQUsEs1jqD7RFVQXMIblPyNElHp/tBun49Yr16h/I
 wq7NzuCYnNnBf0tx9jytpd0W4mYhNsTl02lPGjE6Zu1yOq2G71S2tIDegZhnvWnd
 gAHvmw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0c9p7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 17:51:30 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-13536592ebeso4231707c88.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779472289; x=1780077089; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kMXpJ7jxIt3gHnppSLF/heM4Ho5OPJAxJVHJD3For8g=;
 b=eq20J/sx/sTzxWixRIyW8dpTdUgoe8idiULhZfX3rB96vLZ9snRcjdInSkD9XBl0KI
 gWOYMjX/Sqq4vRsSJ0wzj6vG/ZSjZIUs3VhgIodRRHaSgV1Cl61All2GRK5WEhTWd8/1
 IhDccBcJtxmawhjkT+OR3vgn387Cy51PIGzzFxkLbNa9IiXe7WGnIsQZXJRO7ip6mumo
 bdFhEY2QFjXM8xsdXNxwgiInHSFxPgHtuePhFZaYREcZXUgAEjhCaux2Cm85pfdc0BCU
 YhpHmKtq+7Tij8Rchy+O262K1dML40rG/YPNnRh4BhF0/jTLNBV98uVlGPHEh899M4bz
 8gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779472289; x=1780077089;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kMXpJ7jxIt3gHnppSLF/heM4Ho5OPJAxJVHJD3For8g=;
 b=lLi9L6eqq5UbAaN9izrkTl3vrkK3oPnfi6JBa8uI7DfMd4FFZK6/R3eiuG+3cztruq
 IGfvvUqeChFsUYhaYDEk3l800wIgIPTRAUKRGfYitElW6ktGyRep4xSgDMFqmctwF4Ny
 onFA2jzg7Mo5mI6ayqOyP4t58I66ESNil+6LV/DZvSkIckVwX+wu8qovksAF5Jq0Z+5v
 OAp4kvIqcRrWO4PCnjxkcUy6epWkhP+7wVskDn5pQDij8QnZKv3Nb+Y2ufKBDrsYs827
 Mntz7KqECzzlS/JVVqloOfzhDKv2I6+PLS3eAHjzao+JCM8i/EQjPf8LVVyO6nEzryUF
 GwUw==
X-Forwarded-Encrypted: i=1;
 AFNElJ91kxcXsVIOMY5hUOwNlEqvAFdyDMgvBgKNHO7fb64H5sT/i2RHnXe/GGEwq8UWQIkuBMfk8A/X3w==@nongnu.org
X-Gm-Message-State: AOJu0YzT1hMO+jXsIyPa4pbpGM7mLoG1wrxr0TVQ5uz4lfUQsQuTNZ95
 Jw8yp+P2eAXr3ay8XxCAIfVEi5zRylxOpKKfRfiRhxUIaZVpvsU9j3hgZNWVJKTILy5DV5dZ5nx
 s/+A2eIAByb+BKAfxjjMsqXjJlDoDUfYaAjgtzhLbRu8HB1Db7sBGsVw=
X-Gm-Gg: Acq92OGls5K/Jr5h0ubexRq935Vp3wa5zojtP+GrjHUoE2OHRgCi9JMPwOnbGfb+mTx
 736eqze+a1YoAiS4QueqGRz3sOqrG6L3d7KDsB8GyO4Pe46XojiYzdqxKMKfLTWzPMIEvP8gATI
 tDyeBmj/d2gPxp3Imt6JGDEGNGhauX34JM7HMKSsYEMztkdmEz80LgsPAIfbqVKp09jKgNpkHFx
 +EHadUHF2bf8lRD8CeEtd06k0SsIgYEDPKfGnZIKg4kIsHP5eHkaC16g3rXbaJps00enDG/jaPP
 iZf8ARJzFX7K1o7+2vO5g4aQWICF93sy1DDfQ6RZoyp36cpJAplCkbl7vLYts1Xc4gbHuEY90QR
 R8drZe2eTicHek0r4HxpExBvymErh6Ri+C+OLNIOqzp8QgnzXW6uCoLPWNqwnZhX4UvokvS6e6/
 GiXO7hf1ZOOVNc5g==
X-Received: by 2002:a05:7022:41a3:b0:12c:4928:e57f with SMTP id
 a92af1059eb24-1365fb3f877mr1939679c88.25.1779472289347; 
 Fri, 22 May 2026 10:51:29 -0700 (PDT)
X-Received: by 2002:a05:7022:41a3:b0:12c:4928:e57f with SMTP id
 a92af1059eb24-1365fb3f877mr1939647c88.25.1779472288724; 
 Fri, 22 May 2026 10:51:28 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1366a509602sm1524058c88.8.2026.05.22.10.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 10:51:28 -0700 (PDT)
Message-ID: <a44de4ea-7daf-473c-b29c-4ca11867fc3b@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:51:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] ci: drop cirrus MacOS build
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-6-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260521131739.540157-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3OCBTYWx0ZWRfX5k+JqGV64ZAx
 Gi8bS4UzAnKiTn6ZN48CZbB0GlK+/XILFyuKJ0dM7k453Oi+SKvrlGSgrYaGiQVfPRSJulPVK22
 s+iYfuR5V1L97GtqSaPy9J6Ylgmdnr9F4qzb95A2+kcDEZlwg2PJzeUGYqvJiWeixW2Tus76Nqf
 7F0aREHBYESvQU9QX+4GK5AUUz+wPI7ZMFix8htZAeHZ//JPz7/0RJY6VHHz9LO6aHiIvEdhUuB
 EbV+56D3j89gHugoK7fJwNGugPoTJqSjuOHQVtvHChUydbn9d1i3rYiq7GCUvPe30GzG29rllWX
 uXlMUcoXyMGtKB+4KU0RoIe9+AzixXDpI694sPmcaR1+Kb7TPn4i/6MrcgqtHx16pq4zhpHb+ln
 cjdJ9/sw9sl6EnAlRqc3IQbhJ58P52fRaMLRzlcrbNaCYpFcwKtDqQ0bembpkn1m7xO1yzGfw04
 Sz9rkVwsOJ8VGZyB/mA==
X-Proofpoint-GUID: Vvr6YNCGp3zyy-qYKz8HltiVO3h6TAAR
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a1097a2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QT7MPOEWVwL0aNmAcgEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Vvr6YNCGp3zyy-qYKz8HltiVO3h6TAAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220178
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/21/2026 6:17 AM, Alex Bennée wrote:
> CirrusCI is closing down soon so time to migrate.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/lcitool/refresh             |  1 -
>  .gitlab-ci.d/cirrus.yml           | 14 --------------
>  .gitlab-ci.d/cirrus/macos-14.vars | 16 ----------------
>  3 files changed, 31 deletions(-)
>  delete mode 100644 .gitlab-ci.d/cirrus/macos-14.vars
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

