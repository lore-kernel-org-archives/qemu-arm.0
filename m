Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3001ECD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:11:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNw40-0002ES-NA; Fri, 15 May 2026 13:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw3n-00029U-Jp
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:10:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw3i-0003Eu-Kp
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:10:49 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FB9QT63671116
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yaexKdP8aFOkNbSjtVSSIRAFv+nEuAO6vvgGnDE3ikI=; b=adCxhJjVIT49ZGaa
 /Ky7hOBaF8PKQGrYYLsri/tLr0CoiS0jAAk91uC84kxtAgt9S19BBbETpqkfAjfB
 rPumVCAHuC5FpXxv167O0bcDmXGdEKdq3KWIzGb0nI90hvBovhdXGz6Zy7zqlcaA
 Fl2X/1tGqkl6pYAG2xq0IP4rkM5tCyfTqj7hbSFSPNSAeeriGxkjRdtD9XER/2Hv
 qZ8nINL/mUK7ZSGI+8MNoY7cjavactQeW/a56OFymLm90LcKj0qMV6YMryuOto0o
 UPb/tmrvYA9GxsNQ4Wia6c69rme5Lk9X0lfZpR9PXgFE5a7wwgVbqw7zJ1I3P5Cl
 bxo6yQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s4753-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:10:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2bdd327d970so632708eec.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778865044; x=1779469844; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yaexKdP8aFOkNbSjtVSSIRAFv+nEuAO6vvgGnDE3ikI=;
 b=PWUMDrz+hT6eGeGTV4bzbU6UV0sHZxLEIYT2+GeYqmU2+pt0q4voA/58anbpV5yg+C
 vqYno+N6gx4YGHiVb0DEaQro8FlaBWCXzgC5cmgZNYJFNT9iHpH8hv7QywwrByjQP8Ox
 OiQM1IHv/QbD97Soz2PDXPZn5m6CguNMho/MjNTY8evGGseKmCvLa71vm7veR0GWxMYg
 YGOh/wT/rzckdlEzK2wX2HevxEJa6X5jLrRDTZsNYahTO+5TPiHIGjYs5TdD88SP7F/A
 GnssjskXA9qEUffm1kmwZsucyISctVgIfNxCD+BwiuvEtumR2ayXfN9Oi2iFu1IIXCPK
 zmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865044; x=1779469844;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yaexKdP8aFOkNbSjtVSSIRAFv+nEuAO6vvgGnDE3ikI=;
 b=IW2ZFc/o/0ifMhceBEwtDsj0kxUdBv2EwLwjZU+f4UIv45cxz+ropdbzFRrlyL5Nf7
 6WoyR6bcyRgB3LY35bEZRydGCv8nFdo3hzu1nulXuOnhU5aUArAXM8/b1btxkeYYDv4o
 VQacxrkW6wBw9TEeZepQBKmGGUEL/+jFnNUdmqsL2jImoyYWipqKkuDPRb7CjL54yFu2
 dpnZ5JpNtvKm2vmyw8aGYBnHLV2eRaJl5VFOZhKEzetw3AM2GtQ5jd4N0+lFIQsaELtk
 +/PtFNhnWVW/7AVxNJvd8l0HwwHdIzp3ORGihh984nvZc5xVxnRMGgQLcbEPm3Ur1IMR
 yRUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8echNIUjR1XcDlJpZgIFAA68qGx/tFr3A8a+QPBphqLbd3vUjd9vOPZM+g7dHO77UXmrRQM+xz5g==@nongnu.org
X-Gm-Message-State: AOJu0YzmuxEPdskhKn7LHI0bZz5QQrmzm283xn0wtsJ7VU53x0vajO5T
 RIF8+NSkFZlRPBbC+0Z9uk9FQZ1gW94AW+2Tc6G0Vn4WKRb1ARVsOwtJjH2wuL0CpJoSNFFL40O
 EE4tm9RPQOEMcxe5A2+eYaXkgYnG0Vzq7jPDN7/09NWKXnHATInUELK8=
X-Gm-Gg: Acq92OEmhY8pPN+K3i9ohDMzUnGrsmn/MjRgb+SWgsr5LhcNT70uFRY5RuNfi5IRNMC
 0QkgAvh6fWTP4cuJp7e/aULZf0K44unnpda7UyutHhrZQDgPlScGkl5MUvNTtB+mhgPCZbS7VE0
 jf3J8u2tXJL0dA5uAhug4W62EoDNxiNxnXTC3cpZswRsRPK6hpQBpfUskVTSukwjx83KRpd3PVU
 hp/ANdU3EDgF2g+gjqFNr+bqyoMmuZnGS1EH5pu42TcA/nc8Ko9A1T3QAV9CAwKQgPjXRs2/QTA
 9LlNu9H7pMX0cXkhmj72W68eA/nb9vqxSB31lr/tPztoffYHPMX0HYWAvTYVp/gyjPDp+mloyPM
 1xHz6K+lHb/9t39PfWpt4+UFAQ00Hv1yzuNB10KTppkT5WZ5nW9FR8YE76wx+1L4jRRMvpcErPD
 uPxOw7/16uHxnRJQ==
X-Received: by 2002:a05:7300:a286:b0:2ca:bd22:6102 with SMTP id
 5a478bee46e88-30261d786a6mr4012134eec.14.1778865043620; 
 Fri, 15 May 2026 10:10:43 -0700 (PDT)
X-Received: by 2002:a05:7300:a286:b0:2ca:bd22:6102 with SMTP id
 5a478bee46e88-30261d786a6mr4012112eec.14.1778865043040; 
 Fri, 15 May 2026 10:10:43 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30296dcb6e9sm8892617eec.16.2026.05.15.10.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:10:42 -0700 (PDT)
Message-ID: <8f5c6dc6-9686-492e-89bd-cd90de04256b@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:10:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/20] target/arm: Use make_ccsidr(LEGACY) in 32 bit
 'max' CPU type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-14-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfX/zMh3IqD4MLI
 V1FqKYncWZCvX2Ur6+pJ29oWZTaGdIMVXgmQ3jv6oCsD2Qqhd5gnUO2s9YpJvgpqwUETrxnrNjb
 d7X7GD+xuHoboNrv4tbF2u0X68HBdidsCr5L+4gDRsWxJEFZjiu1XHBWJjmGtVYzWfkKezGBzBe
 um1dPhi9MaJwV9uJJofa5hbln5lQ1eETHwr3UfB5o8pnmAoK90ChLD34TKOACqldjnKNCOHpH9y
 Wt9b1yS6VwDClLfoqrMLfIqidwn2h0+gCdtrPQsIkg/evG94NFPrTGuAi/Cd6cN8LY4eXZaHQds
 ZhU64G/QYiAKDeFf7kWdiXDiy30SYL6gxFQzYwaNSc7FEib+L88boKzQPZMEXafsS6dGHJEiB9y
 /P7l1nB/7v5qDndulAucy5byhdhsxF5RuFEoplpexii1tn5xmHM53KygV63NQkmeo89+uTMvfX7
 usUYrIQLJHNmTC36FrQ==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a075394 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ElV25bcJYSdYIwaG-RAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EyxWDJJa048TGNI-CkAJNoows3lelUL1
X-Proofpoint-ORIG-GUID: EyxWDJJa048TGNI-CkAJNoows3lelUL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150175
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> Commit 676624d757a ("target/arm/tcg: refine cache descriptions
> with a wrapper") added the make_ccsidr() helper. Use it. Besides
> being simpler to review, it also makes arm_max_initfn() more in
> line which aarch64_a57_initfn(), which it almost duplicates.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/tcg/cpu32.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

