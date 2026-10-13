Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7C4CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 11:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGaet-0002l5-CD; Tue, 13 Oct 2026 07:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGaer-0002kc-DZ
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 07:27:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGaep-0004As-JG
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 07:27:01 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D94Ax9483146
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 11:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 meU4xqtQvfFk9wsDGe2IxnFiPI9aCSinYcXkiuvfWmM=; b=imGXdAF/HZ218krA
 fKEmwl7h9CMsE4oubx8HARx+OLeQ/dEkNI766gpA1NilIMJyOsbxBk0zDBy+3+Uc
 P5rSegDU25vw+U48JQb4k3qaub0z3c2Cs5ULymgNAtqfVxPIZ6fukt370xGyADnn
 D8JSDsNTg/dKcJZjuuQwDmmikj080Ige32nV9ItK7W3GWuM90RQmC1fe1mSriKvG
 W1v9xutXMkfyLttBlIOyl3rju1l6tJ5Jus9MlnR5Ttjgj3fAKlvYQvBYjBd34kfT
 Fom4XE7EdvCKmcOoKl9P/HZZF64MALbgPwIe/Xx1NB5cUmnkYr+zmIz1g4xMz/pH
 V8F1Mg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8kma-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 11:26:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cbacbb996so467134885a.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791890817; x=1792495617; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=meU4xqtQvfFk9wsDGe2IxnFiPI9aCSinYcXkiuvfWmM=;
 b=TDI4KMrhKr1qUPjNC1+gqItDi9tH8n2LPQmPOFtGqB32m3tYLjwrshMvGSEDDEQTiU
 0abKVnWPjoWfmusoXG/VM+gh8Lc7SIili/4ms2+s/vwS32+8tB8y8q9RDBwJJETts4hi
 I7beklMXSHv8yp+UXcJSbT/boBeOxDQq6/ka7U6fjp7wi3s1BohZ/FEPP91Yk9HCtOj3
 CL/rIcc2heHkotXh+olBqP1+hrqlOi+kqGIgHkcQ/ixbyCIwOrcTskFpM1pqK80TpHqE
 uA+y2FBF1v+2tINUL9HG5jiX47Ae89Q5319QuGSzO33a2ZTL4XONJFeUQ2ETJxbe6by+
 ZYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791890817; x=1792495617;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=meU4xqtQvfFk9wsDGe2IxnFiPI9aCSinYcXkiuvfWmM=;
 b=jRGPAXmL7/xkp8bD2vZLWimAqavD0k5/fuZL37eoq0mBpB8MI/WnN7tOp8hXHx5wgG
 BY3c0amSqKe7pqA+q8/hlfXo2ajqYHf+FcbIt1YqlORgiV06Mp8tRdQUkJnS1iy9tqvh
 jQP62OOnEHr4svgYQn2udVryI2tsVQmuGkihwg1JtqdEb7Zd9zkbTDai34m8nu1dLtRp
 vM8tYCgHwpCjOHHKAzLIJfOhT/aPMnewkFuJbzZiekJAi8A5qOwEFFp+ji2kDMo0SKWj
 ke5Pog5ebAgXlQgcfUSacI0hkMyKcUsX0EoJ6lnNT0Zma/Xjsywhc5pe5bX6QjiUTHZs
 y4aQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwOOFnGFq7/gCY5G9M6+jAmyuT1xSKJ11HXSZCI/NtLI95OhscbtmUnHY8363Fl3KnlQJ5P7U606g==@nongnu.org
X-Gm-Message-State: AFq9FYKRLHLpsLYaC9CnF7q8rmrEgwYuVVDH/HOhLPpnOuEcZD3Sa7lF
 VIGEywLObtRKCao5X+IsPX6o5fnRCaEqUPinjAwKt8RIXSBmQX0WiRaDX6RB76tRfehjf2RfE4O
 CYTHKZfphq4WH7oJ5qlW11KI/mkDr2WLAFymeNkhGI6eNLZJ2d64Ic5DF84gdg2VyRw==
X-Gm-Gg: AYBFou2D43QrSNh5g8342rt9mBxPXxjnkTTXvE+6DCu8u1GUW0kUySRTZDxMGveTIED
 0Paf92hgh8w3rLfs19a3IPf0ud/sHau3iwLKSv9pLeNqspviHDeXx/2DebN/byu4JJPKDqxdAVq
 cXKlJDmmr2NFA/mzm+7R//aSy2U5YSWUDls0u1O89EtZUTVRKQ4myPQg/BlGSry4Tr4U0TPw59E
 RpwCDf25ZjIRNakOYLG5Oz3g4J8B9gOg7boh+smfUzGpgwwM0GX0P29w3zwNWJuld36HPwXhpKy
 4adQXeU6GSeDNEBCWjKZGqFDVRKDFv/G2nQQMoIlhkJtrCkwPT7R3RVMOKfAEfALOcEEZH5XjoY
 hM2AEV/PvjuDrY8JiKMDZymdTNGNmFVVohw==
X-Received: by 2002:a05:620a:4692:b0:93c:5b11:d44c with SMTP id
 af79cd13be357-93ebd0cb2a3mr1932394085a.1.1791890817416; 
 Tue, 13 Oct 2026 04:26:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4692:b0:93c:5b11:d44c with SMTP id
 af79cd13be357-93ebd0cb2a3mr1932392685a.1.1791890816983; 
 Tue, 13 Oct 2026 04:26:56 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be8c5e7sm447990815e9.4.2026.10.13.04.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 04:26:56 -0700 (PDT)
Message-ID: <98415c6b-cf23-4576-9c07-7f833daa4ba8@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/86] target/arm: GICv5 cpuif: Implement ICV_CR0_EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-25-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261013083933.1024405-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2T9apApUyACAeVvYWUa1Nt0GrzrQWNE5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX/0O3r62Wlq/x
 vlieAmm69JT0QfPsDvTtI1QHZOR1KbqrjP8ull/9M74j9tVGHrIKOCIl5bZi9Gq4x6Uo5YKMtwW
 L/SYvBedz1Hdx2M0Umip2YDn51m8ubY=
X-Proofpoint-ORIG-GUID: 2T9apApUyACAeVvYWUa1Nt0GrzrQWNE5
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace1582 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=hlWRNKTsWnwO4BYjXMUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfXzZH0VCiRfGTV
 7pwdd/s8Z+LCG+QrGkZUqhQByHR8QTlpMNSANPr4cEXrySKSM1xcKR77y7mSv61qH0KYhvZFeU1
 H7c8MwM7UgLNNrmT+8hgFVBgT/cQTPJcfqt0ch/YYF54CZ9mE8OV03XHRVNJAlxNRGXWEh5yXqt
 zOqjmfHhfPgMvEVabDdjuReTe+Uvq17CN+aOypRs0A3Jevac3c+348l7NM3Z3DjX+kvzVq4c7Fu
 dC+aE001ulLmW4yyCdvRd0DPED/uT7zFX6Kxp6pkaMtmK2uJH2lBXKezHz+qilUQgI14Gq19+Ve
 7FW/cFipu6QBFp+4PCBF7Ed4132NaaMwk97KavweD5pv/R9us4eNA3DNeDLM7XeY5KRWg04yL3k
 YSB20HsCxIKoqFt1hjuAsvjBpPLUFrvH/hDvftVKi/MsgmVSuF+xmWM8P1oj2WNF1DRp1IivJiZ
 0reBWCtzgvSQpMv5m9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130045
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 13/10/26 10:38, Peter Maydell wrote:
> Implement the redirection of the ICC_CR0_EL1 encoding to the
> hypervisor guest's view ICV_CR0_EL1.  This has only one bit in it,
> the enable (EN) bit, which is stored in ICH_VMCR_EL2.EN at the
> same bit location (0).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/gicv5-cpuif.c | 41 +++++++++++++++++++++++++-----------
>   1 file changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
> index b183c8a6e79..247cefd9e68 100644
> --- a/target/arm/tcg/gicv5-cpuif.c
> +++ b/target/arm/tcg/gicv5-cpuif.c
> @@ -67,6 +67,9 @@ FIELD(ICC_HPPIR_EL1, ID, 0, 24)
>   FIELD(ICC_HPPIR_EL1, TYPE, 29, 3)
>   FIELD(ICC_HPPIR_EL1, HPPIV, 32, 1)
>   
> +FIELD(ICH_VMCR_EL2, EN, 0, 1)
> +FIELD(ICH_VMCR_EL2, VMPR, 27, 5)

s/VMPR/VPMR/ "Virtual Priority Mask Register"


