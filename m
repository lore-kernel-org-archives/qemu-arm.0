Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A552FCD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 16:59:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wacZB-0005DB-Dk; Fri, 19 Jun 2026 12:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wacZ4-0005AD-SS
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 12:59:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wacZ1-00086L-CG
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 12:59:33 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65JDCMj7746407
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 16:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HwNEIA2cbeU7mRJtRIRuJ4Ski0E/xamvU7Rf3lapWVA=; b=DNUAZ0gVWvXvSnVu
 f5m4z9vvGzFK5G1ywlR+m6YyxqQ5UObdZJuDdpFdDYemGwYCfbQFGS6PnER5Z4X1
 iDPfRSBxmtBu7Xbi9qp0VkzVKbKYZLZxziBSuzYKvE2DZu99MrPWNqXsQQ7zT6vb
 9SICUhHm3s9yAgdKFlu7KQyJkM5QMmX6hlL1KKkekMvbIy4OXrRlUvI0OkxZA3la
 UlxdDJGlSGHrSyKuBnrzYzaUHV1t9H54H1+sekshRusdhyuyaNOItgomi0/rJ0w2
 KBFqcUw0KcpPTkG/9zdo9F0osjN4+GpT2G5r9KPeBRFYZwPfxh8jQOmuMIlShWrT
 4RUtfQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sc722-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 16:59:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-138156c0492so7884826c88.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781888366; x=1782493166; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HwNEIA2cbeU7mRJtRIRuJ4Ski0E/xamvU7Rf3lapWVA=;
 b=BXgQxMgkgIceTZjZaGw6ITxJYCC+RBzmxlULV1gCDJY5mAl1dIGKVE8HsyZZJVf8Tk
 ZjcMrilgs3a2lkql9rX7I961adqAm++NMbC0Qzc1h8gx17ZKs3fMc/cZl/Woh4Ga9irX
 vOzqmw854iM3638PzrvV1ZARbXVCECKkW2JvHlu7yEBrd+RzcvFKeilCa+IY8luxmP89
 AE+Cw9yN7t/9y9y88XTjiZcF2HEvM6GD8cnB5y462CPk/QDkfg3Iz6BBuw864DQoRwzH
 TWv5amNc9XUyNXr/uxnP9aMVwxLL3BEdFWB14ZbCn9X5Z96Pk7IsseEz2ALkEsWA+QWn
 sv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781888366; x=1782493166;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HwNEIA2cbeU7mRJtRIRuJ4Ski0E/xamvU7Rf3lapWVA=;
 b=nBgfAMgD5k2vhpmri/udm0oH+nNAJ+BgV4NGKMvN9cYSbYV5cJVA8klVuP9khaECLI
 3Ais/IM5NLJKC3ied2NIkX178fuFmBTBMQBUU5i46tl6g7gPpKDSRdPC3BCU/Nh6GpG1
 YvL4K3ofnc7QuNwu84A70ZEnrJxLg4So7HoiC5UNW84tMsV3KDgoN/gCQGibOPRiB5/H
 iA/NGNejJ3dDQX8KtD2kQjvXn9tOGdQMDP9WTziRtQPeGbldcnnqfqL9QpjOMeyU/JK0
 NOI+l9vf4aETBiOyU2P0JIUG6ZJWm1U3IYlYJNSZtSJzo4sjMZyxKTt46lVFiXrd3dSo
 ciBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+AtInGng++AlTFnV4liBhVlL1KsG7xzN03HVgp2W2WH0pWXwzHxFCTse4cublyyGyji6RiGBB9Zg==@nongnu.org
X-Gm-Message-State: AOJu0Ywt8WvGPlAJRCVlP9DYQ8oe8GvuOOo5F1iCmc+ZXYW9XYu+JXA+
 rdFDItjKXBmIWV+BeXA9Bf8NNPVobiCpKHVg1jsQaDb4sHdG/hjFGn7lJ5PkcoqXhCxicVWqk1H
 Kk8f+gw6d/gLLUbCIUqKywIFOE5X/Rh+bwpND7gVx6NfX7vf31LrU+yM=
X-Gm-Gg: AfdE7ckLGzsl11K0r0sr1QK530aCvxhonrBkom2Hwcv9CnIVb6crZnAjczk+TzHv+dR
 M26zGvbFN2hx4blb7F9GLOWq61iG49VJO1YpbDxESgMoZnkJ9BS0Oyd1VqPpUZGW9aOUzj8wRYX
 bq8xEqBGsPaV9iMF6WZdf5wPMfyJJyGtQfldCuLipFPCcq8usVhxRpLDBs1D9pewekQp0M/s9mV
 J33ALgsn6VapBiPrrMD7Su06chnZA/JRDl+Mleun/auQTYxLB4xfi4vLiWjpn46Ded0VAL61BpG
 mb3MSiysq6TDjO2iWmwU4oPmhzmDigx2pgN4o54/wSGMVY+I2Ygb6lOm0X8JsQDOSYiFYzEgv1H
 bNt5k9dy8GR0/70G8PFlIDzgl1h5oUAtwNJ3mw4UWL+Kgon8hImD2rEPFeXWoMf68gy3Ww6ZIoP
 oKlGw=
X-Received: by 2002:a05:7022:6ba5:b0:12a:6fb7:87e3 with SMTP id
 a92af1059eb24-139a505080cmr1526686c88.31.1781888366261; 
 Fri, 19 Jun 2026 09:59:26 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba5:b0:12a:6fb7:87e3 with SMTP id
 a92af1059eb24-139a505080cmr1526666c88.31.1781888365749; 
 Fri, 19 Jun 2026 09:59:25 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-139a34a266asm2080245c88.5.2026.06.19.09.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 09:59:25 -0700 (PDT)
Message-ID: <2e793fc8-b83e-4c42-93b2-aad833e39838@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 09:59:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] gitlab: remove build target hacks
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Cleber Rosa <crosa@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>
References: <20260619155657.944220-1-alex.bennee@linaro.org>
 <20260619155657.944220-7-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260619155657.944220-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2D_tpAnJwvKAO0-The08UxQMBvVGn59B
X-Proofpoint-ORIG-GUID: 2D_tpAnJwvKAO0-The08UxQMBvVGn59B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE2MSBTYWx0ZWRfX8hQ0vzx68eb3
 5A9LXpAEd9CXFFfbT4n6woS0zGLyQp1RPSpTpe/52cNWmg40OySmbkJLcEYal4lOxxqLbGUsRds
 zETVoNc7yEUd4QMZ8rK0VcNgON3wD+1m36G7+QIqMjga84oGaJi1K/Kyv6yXbuBHw/9jJQpdFgB
 Q8OeXv1GIwLzRqVKnPYjRIO3uDkCus5/eUGRE8w6jNRBW1oNYO/pl+btG1JnDeO9SQ89iv4Ll5U
 kTQQRBxqR/8E2umg3pONADPRGRC16QIXvXAkr72cRFZCCWOdPNAwj2DTKBLcvETFtJwRTFH9qYR
 hXtOSPLv2hyKgY2repoEheqcV4FSfuUY8dsK6HjgoXqusImbczuKxa3d/HdGfS15VY+JanMN/Vp
 xQ/gQl1n5ByyPI6yClzjLflLvNSb2vpjrXnaUPqhMLU1pkjOVmrq6TKrooSOCTSLN0bNnN1q59m
 k0vNcLnctQYvghRWhtA==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a35756f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rg4mmxDJhifrDXa0jkoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE2MSBTYWx0ZWRfX9Du/thjHoGYg
 sYfUU/AVsvY3Aol66eewFH1QL+zKQwA5B0xof4sZYuzNKGG4SrvgbLycxothiMYx8S++ISf6q+n
 X7K+JSncaQTPbWQWKfttbWxmdPWOOW0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190161
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 6/19/2026 8:56 AM, Alex Bennée wrote:
> Since eef29e060dc (meson: build macOS signed binary as part of the
> default target) we should be able to do a plain build and everything
> just work.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/macos.yml | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

