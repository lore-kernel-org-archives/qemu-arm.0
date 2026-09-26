Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63696C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 09:31:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAOk4-0004OL-96; Sat, 26 Sep 2026 05:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAOk2-0004O4-CI
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 05:30:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAOk0-0007ig-IF
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 05:30:46 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68Q6OakJ3267653
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 09:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vIT4lhn9+EDCtg43Y7HYDGKZZ87+GEHLMrThB2dIdZM=; b=OekqcCGNk37qOa2S
 WgNnxsyWlqZ+aVLVi4pjtifHkrSnwD207+8fNp+Ohwrf3dtFFU4r1RCWVvO4S7C9
 1bEq6DOiK7sYxrm5jYfq4L62nABW1vR07IIlxxbIyuMjY80myaPbqEMkDQ5lRXyS
 NTFhwE+ph3jhH7sGDHCR54Hf34f7UZYQC2bgU69N+sAVXR3aWQ4hqTQtnu0uL4P1
 b3mgurJAbma5/ioovKBruNQ7MK4osA8mvTsZ17zvh+Wk1pjUKzubAQSvAVUCqSOB
 MlG/dMC9lveZ6LDXwYDyxrt+sZl6Rw7B4qElf6eZczwRUGCndzuvGI4YP3II7uNG
 SIA/ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp0whc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 09:30:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93c444b438aso319818385a.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790415042; x=1791019842; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vIT4lhn9+EDCtg43Y7HYDGKZZ87+GEHLMrThB2dIdZM=;
 b=fDw23qDHXhjhSoJKTq52CEKQ0bsJlVUwCI0Hy4MCS73ZP84G1v5KTVOEUEqhwRGHWl
 RPXlATP2M5UO1aZyRSfgSywbtsoKh5VLIUAPzRi/ODCWuTwfFmse1lgbMTolQX1FYWXm
 Me+Ev4WzdDlKLBgW2IXtxRAtIdRgldTOFu4+FLjsXi0wRRQfkWX6Fy3rMwXx4MmUsRx9
 O3cZaz45u3UYHX3CuRPnl1fA9qiBu44TfMREGl6OLXdpNoLmA8nmAVdcuafizysbAfjA
 +FBiSia8Un0qHnVzJLRfqjxCSAJSZkvH/t7wcGK49imcZncBtbfxRWexrxwCrk200aMO
 HKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790415042; x=1791019842;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vIT4lhn9+EDCtg43Y7HYDGKZZ87+GEHLMrThB2dIdZM=;
 b=dTV5WynxaFe7u4QhLTvN6piZB7tiLP/xv32ZsPdFzcSXuupNTbmmIakk5aTxJim+Ip
 RZY/rilet9R6QjYTWobsbfJ5DDt5ooW6X1xyVys1YLtjqqBR+xZliPnaO0/Ihi1eZVwH
 UqKiOJ/B0vPYSHdWLpeqLaaDlMrS+MinxnWBMtcCPQyAk+DOUW5rjCDOO0BFIJkY47xO
 rwNqOXSW5ol31PwszipFC7cN0LU5ebwCW5jQ0AKFhmYQCDRPC9AsCC+CkdjGi2PjlmwY
 MlR0/Uq33b7PdP70dQ7LuP8oKwLCWQECAns9GHEK8JEr2d2AICSee+p15si+gg983kGt
 VHjA==
X-Gm-Message-State: AFuF++loPoAEUqYLSA9ns2kgPKWt15IHn6zGFe41OrhEYJeMw4b7ZGW1
 sjG1Cr5KRflZnSp80po4h2/wJAoxOBmN/ty0ch1Zi0ndIcOyf/irzMtNSEGgQSQL1ge4jxLilwk
 ByQPeV3hcbHiOSm9MqtZ0OdUOXqvd5KotDuI7T2haoJFWDqMxU7D/5qE=
X-Gm-Gg: AYBFou0TZEgoupLtUHG//tmHJ40NpcVPE14m5YGqmHk3g2uXI+hldxY8Z5iDxNAQPyt
 PEZ1kXkBlfQi9I2G3dU5Viq7xlC80oMcBHfrhi/laIa/6vpgxG2dJSP84NbAUJi/vIQvixt2mRs
 UcIyrGEIAdN/Go3EhSWEHgbv26s9bFXXO3tcLQmJjTWnjWCqfokIFwStCNGzysPsYqXOywd2PIj
 xtdxMvXR1iZeWcxvd/qW/K5gJO4wTsXkTygSHzFYp5xUCF9djY3RRGjSq0441FKvBiWZOIxuEtv
 vQCu8tgMTIDHolmbSAx7MOQ6QxRfEFSmczjSlyzOLOYmhnJNj/OVZ3/FoBN64GTQAFd2yTMWagZ
 dG8HX5b7HwPUL2DTKm5cnF/vQ9UZaFankfg==
X-Received: by 2002:a05:620a:40cc:b0:93c:2c15:e510 with SMTP id
 af79cd13be357-93c43ca4b3cmr882438385a.37.1790415042216; 
 Sat, 26 Sep 2026 02:30:42 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:93c:2c15:e510 with SMTP id
 af79cd13be357-93c43ca4b3cmr882435585a.37.1790415041683; 
 Sat, 26 Sep 2026 02:30:41 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4c8dsm229820295e9.3.2026.09.26.02.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2026 02:30:40 -0700 (PDT)
Message-ID: <507fb835-61a8-4e66-80f4-1ae6f07a5bf1@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 11:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/bcm2835_cprman: correct register index in test
 for mux update
Content-Language: en-US
To: Jonathan Gilbert <logic@deltaq.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Luc Michel <luc@lmichel.fr>
References: <20260925100726.1546566-1-logic@deltaq.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925100726.1546566-1-logic@deltaq.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzNyBTYWx0ZWRfXwk3/WgjTmr83
 KzJBpOz8JOCofjv57ufx6ciPt2okWTuej8vvyEGq7BM8p/hEWGHY1Af0Rv1OPrZayEfJY9C34II
 i/syb1XnQcCPH02Dv09zwQihhxe8t0onScXEuxMsGzk1sNyrpdP2tH7ArI92M4U54Sgic2SVFjj
 J3bBtQbvy3GkiqApycOH14TEbYvwtuoUBAB7pYbisPavhEOHJuVCOmIyLWjNqH+3fegu2TRmM1M
 CqBQjqCQpkHPluxlkTBz5vpHTpGB+sgLRHpJ2KGs5vWizwu31wpAVMCqJKRr3bQOSLm7lbGHMNd
 WOgIXYkGRmnze/p5tuVJOzhMIX1fT193vsvRG8Ep7XLMNoZlp3FFJhY8aviytOY1kqSCG5sXJ5u
 iNwF1Znonlr3rCJ5O/wCk5dCFo4TBOAZX5exHdJvdl7OObE00C1iE+Ju9+UItn+pi0r0AGh57jg
 FD5bkt/vgeKc5uda8LA==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab790c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=-ISfGIX_AAAA:8 a=QlAFhZc9Q7uiVK9XYwMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=6K80JWTZPwV2TOQbRzu6:22
X-Proofpoint-GUID: 5vhqDpYz2yfpCENUkXHIkKydkHnzzl_4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzNyBTYWx0ZWRfX2NaJmfe1xEYf
 GZd7U5I62naWtf2kkkgQ8JJWg0GWVcP1IpaDAcD4fJk4xDlNEcLO9LriSoe91Su1uUo1EV+LT4C
 7sf5wRB19czG+jP9pG6lkIvtsrmaWPw=
X-Proofpoint-ORIG-GUID: 5vhqDpYz2yfpCENUkXHIkKydkHnzzl_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260037
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

Cc'ing Luc

On 25/9/26 12:07, Jonathan Gilbert wrote:
> After each register write handled by cprman_write, function update_mux
> checks each of the clocks to see whether the supplied register index
> applies to it, calling clock_mux_update if so. Each clock has two
> registers, so it needs to check the base cm_offset for CM_CTL and then
> the next slot for CM_DIV. But, it was checking for cm_offset plus 4, as
> though it were a byte offset when it's a logical index.
> 
> Signed-off-by: Jonathan Gilbert <logic@deltaq.org>
> ---
>   hw/misc/bcm2835_cprman.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> index 8220f7a6b4..f9a77ff9bb 100644
> --- a/hw/misc/bcm2835_cprman.c
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -508,7 +508,7 @@ static inline void update_mux_from_cm(BCM2835CprmanState *s, size_t idx)
>   
>       for (i = 0; i < CPRMAN_NUM_CLOCK_MUX; i++) {
>           if ((CLOCK_MUX_INIT_INFO[i].cm_offset == idx) ||
> -            (CLOCK_MUX_INIT_INFO[i].cm_offset + 4 == idx)) {
> +            (CLOCK_MUX_INIT_INFO[i].cm_offset + 1 == idx)) {
>               /* matches CM_CTL or CM_DIV mux register */
>               clock_mux_update(&s->clock_muxes[i]);
>               return;


