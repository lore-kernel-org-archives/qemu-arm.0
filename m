Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DFDCA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 20:27:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEYEO-0001UX-Vu; Wed, 07 Oct 2026 16:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYEN-0001U3-VR
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:27:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYEL-0003S1-ON
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:27:15 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697JNTn14001832
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 20:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rAQAjUKjEn5izqfqSW5vgeKY5VbCOuoaS/Qgj2sWGKQ=; b=KC2zk2W1BVd9fI6K
 Qb5U6/PwAdTLFurwmj1MWKeAPpSb4i3lUdKYI9ZQpKmFjoB08LzYxS5wHbH8T4As
 tjYDXXSNhgakgJJdvyTSrVK+61jxS1e0jL2E+IBxN+8rY5SEIgNNi06YjDNb5ek1
 lv3GWZ6jp8GWgVk+Jsj7ZbBBcxJ1WwtIHA3Bn6xgCoJOaORwNLtZ6+M4VyrIl2+6
 rhe5xLuAFWLtWdZOrRbBByaByGZd/SUWn1nf+/2qwBkzj7Wtn3GA7M52iLHsx/JQ
 7vx5O34euyIzrdlvvqnyhNWYWjXzpccI6YECC61OZFKjKXElmPneA6aWtPC6vDR0
 tsmyKQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5tu80hqx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 20:27:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-151ba226e1bso6530017c88.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 13:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791404832; x=1792009632; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rAQAjUKjEn5izqfqSW5vgeKY5VbCOuoaS/Qgj2sWGKQ=;
 b=Mg3oMeIrCzVYXlD4Aksuz+wMOiey6l/XWVOStFswR+gJ1Ekt2Rq6CtIsi+y3Yr15EW
 cVCsWorfBzabMMTunHbouTU161tX92CpJQtHY9PNpLYJxKWijZ20Ahi0HWDLSeGkTyWZ
 7VwImIR/+Wx61VF+GyAtNfr1WZ3BfdSeNW9pwDYBHaATuXwvilXXAQBY/dJwYsrIV1dE
 RY+xjhTAxwo/QlGbGkDTVwgidNH1ExWkRPfoQ6yBnsUp44/8qtEhEeq4RBkAh5J1yBpg
 qv3TZwd58e3MaSvCvQCuc0j4JhoA0STNWi5wdOwvOAQG5c6H4aLzP+bwCXdB7Sjzcx6J
 7KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791404832; x=1792009632;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rAQAjUKjEn5izqfqSW5vgeKY5VbCOuoaS/Qgj2sWGKQ=;
 b=v1jpuxZ5Ar8uDJbE/u2K5VsekwMC/yEGO87odzSYYqMi7X3NGQHTDSmjezyMzoklYv
 90b9OidLMo71c0ga9bXFNLHFZWot/Zw+6KwMYYZiEdSd69aHAPMefmMZg34NkjIKeeU3
 yrjtSeu68XtrROT3EkGi7bLVMDM7KfgBaxy9rjQyKyJ54zKiScvAas3/NIcifXnWkzOq
 Usfml8gQu/xhkrPW37MUpKzNVFaigkhnqUGRDVq6N6stBmLUundgm+H5NeCA9XhLisVM
 MkU0Hdu7Ub6sipfJjA7VnSI3B6SaeHLjDqJvTx7XUefg9ua+ydRM+SgOwc7DYW3gLqc1
 F8qg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLdNYYf0JiLVqyFI0YZbRQ4BQgazd6/WmCOX/z5ghiNa7ppUBJHZrnnrDHqcSsGU37dmAZCAs6qg==@nongnu.org
X-Gm-Message-State: AFuF++ndhEjuFT2BTYKmBNTDQ5Z7I6PvgSskUkwtjycRf7CDy9LGUlm6
 lED5U6ty7vHSpwU0yQhE6257g61uSgfSTI1mrgis2GrqUgzctwOOrmjhXI+ea/uHO9KMdgSnqtT
 Ra5mX7E9ST3FJKS+hQFffgiLtBUQ8au3JCb6W0i/FSp1HhwwN48gdyZE=
X-Gm-Gg: AYBFou2J+zk+NuYM3aO8A0zCOZ3VE/DT+j8l9/RH45Z7G0J8YjgBXtguMbPH/eyv6J6
 ZuTbLs3+A3lHSVH3hoUAecXhnddEf/F+X12y1Bd8+FY3tagRynINpGSOpBW5orC6qGZmhgKzAUx
 d3+8gXSpjAOcgfk1KKjLqkE0XtGsLhfj3z0oioQ1KQRDQZ8A6AVaE5rx7aXBqBijQ8imZIdEaYb
 TytxT2UE7rOfQdv55kIuFirzpEP6n5Px99AcAykfZMyBNUnhQD6v7BJvU7ZOcMaMKYk+xvoINLi
 vxcoVmidOPJvNluu2RGA/cjgPV70cmEUU+6lyGSmhbLUU5F4kk/ut0kwddKyH+SkbWTLbZGYh0d
 X+eYk6EH6o/V+XWvEd9ojm/PQDY7+J8Bl3Rb1MUAZKM/xlSsEnLtfEzPyDB9MeDWeJJWb0g==
X-Received: by 2002:a05:701b:424b:20b0:15a:4155:3d9a with SMTP id
 a92af1059eb24-16208ebdf3emr3699784c88.47.1791404831341; 
 Wed, 07 Oct 2026 13:27:11 -0700 (PDT)
X-Received: by 2002:a05:701b:424b:20b0:15a:4155:3d9a with SMTP id
 a92af1059eb24-16208ebdf3emr3699712c88.47.1791404830418; 
 Wed, 07 Oct 2026 13:27:10 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1615f1ac8c5sm15257082c88.2.2026.10.07.13.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 13:27:10 -0700 (PDT)
Message-ID: <9a8dbc3c-0e95-4e90-8258-46ab97e36f54@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:27:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] target-info: rename target-info-impl.h to
 target-info-def.h
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-4-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007115253.328-4-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wWetoRYFaAe8OItrgR94_6_G1SUCZYyt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MSBTYWx0ZWRfX3BRyvdrNqde0
 NnExjPDcA+2C4zUBchcRDUz9Gw6NsujdjftEB01n0mG/5z7rISwc8ojT+fEnG0l6yRhqrdHAJw4
 ZW5XV6IoY5vLV7bxc0OQ0JfryN4KiC4=
X-Authority-Analysis: v=2.4 cv=H75OUOYi c=1 sm=1 tr=0 ts=6ac6ab20 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=q9Cd_0kJNfd5aEMf_B4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MSBTYWx0ZWRfXxKAeeLoWTkbW
 a28EEAaAEPi9gdkfOnBdkol2ZnxAyY08/Ik86qoR4JHMkbzY4jBnw4Kyvvm9iMMjQ6Q0wkpi5xx
 MDnAFHNiPX//Eqb03KXvFkKJtHj1IPa/u3AXftRT05nLRT5BptHk7H5KxskSSeHO1s+ZqXiAb85
 jO8ng6zULU3m4HCase9Oi7SqrSP/A5yAWha31FoT8twiOtOegnzn9w9j8hE309RONoyq6mCG2S9
 gryOr8YxxXOFMYjtHB+cLhBfcWJ3dUGSiyLxK7IZ0W+coO0diYJVidJnqKUBdsH6hmNSjt7dkZ1
 mZ/ALNCQKi+JgXFdEz9tg4oOKa0475C5jhCgahfPWh14NBcWn0misXwqcWENUnoYEZuqHdmThcx
 YOsqsJ0KtxqoJiirlf5rNIKLFQs8vk7KbaFI3H6Yc5S+UnXqhzvBurnkIkjorqD7f3u9vOf4gLz
 GhqYQRAnffTl2vDMD4Q==
X-Proofpoint-GUID: wWetoRYFaAe8OItrgR94_6_G1SUCZYyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070081
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/7/2026 4:48 AM, Yonggang Luo wrote:
> Rename the TargetInfo structure header and its include guard.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/qemu/{target-info-impl.h => target-info-def.h} | 4 ++--
>  include/qemu/target-info-qom.h                         | 2 +-
>  page-vary-common.c                                     | 2 +-
>  page-vary-system.c                                     | 2 +-
>  target-info-def.c                                      | 2 +-
>  target-info-qom.c                                      | 2 +-
>  target-info.c                                          | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
>  rename include/qemu/{target-info-impl.h => target-info-def.h} (94%)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

