Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E00ECC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 11:05:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGaKB-0002KL-WD; Tue, 13 Oct 2026 07:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGaK5-0002JD-Tw
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 07:05:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGaK1-0000TN-V5
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 07:05:32 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D9r4Gu173984
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 11:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EYJj/eqr8QHHHAq6NLSO8h7WjDyQuYjBHyH/Hpwg2fY=; b=j3ZhGojFWQL9153c
 DFct0X7ruB/FVFIjmPC0qc+9ZuO6RCzHbPN3iLgkoMhEH5P5MP5hV2sUrYgn8UO/
 mh9XJgNYQ2+ad34y43GKZbmN5FzZRm9DYb7VGJevOCVZtke+2oKO6LW0q1Pl4VFj
 NYdlM/f9f61bhPyXoVyxGFcrvbCYT843VgIlfE/3zzSJ33jlbCquGhGRSMqPL5MG
 FF3gBMy6iyOBWAdx9decp8Shk6fVqAZCXiTReygnUvPCwOq8Tn8ro1Iv5xcVd0k2
 rnRTSpQvkCdCj+gxk598L+MJFxH0X3XF06mwhNuwvL544o+K9YDHVcjtMvvxOFQ1
 IMnMHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqsngc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 11:05:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93caa0ce0cdso311614285a.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 04:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791889526; x=1792494326; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EYJj/eqr8QHHHAq6NLSO8h7WjDyQuYjBHyH/Hpwg2fY=;
 b=SFYJ+35VzI0LaurLc0nLwWUWWrZZi2FmBnsb343UCP1KkMvQE0X1Im4nqSSiAgn+35
 5rYMT4zZugvTsGwUsNui/aXNnxM7tVAw7+IaXN3inboSrdDMtcrOgt43HudtdHe4iOkF
 Bn5zuHU8LBq3eKLUjTeIS9aY1P+Cceb2mmXma1C8T5FYRErxafr4YtQjXsVpT+m3e0da
 1aIHOPVzHZrAuinb1uoB7wdPW+b2m3awSEZU2idZFl1M26rJgKARNzSNDjVc8ecd4O0D
 Elg46P/B26PR3vKTvE2SsR+maVTVwpR0yyjs1tAn2MyV8kzklIXZUaTRkQxU4rcMSatI
 /wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791889526; x=1792494326;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=EYJj/eqr8QHHHAq6NLSO8h7WjDyQuYjBHyH/Hpwg2fY=;
 b=Snr6L9XXBoULMg3XHA5IkFwEjCJQFWQ/NnEIf90WrYE2xIN7qDW+GWrYTJY/h7lRo+
 3/mJTybmBF4km/cSIIdSxerJuIboO3mLB+qlazCoC1oeVqGQmczkVh23d7ez8Msa6hin
 siexANeGut9/y+kHZlv2WwZUERIMeXulc75O7dnkExdt1FslnBoNbgtSSN/PrXgoDDbw
 wfPy/5/OpDtacDb5C11Vv1vX/Vg1+FUx+cKFDEW33+QUDA6mLRkuB1S/VsLz/XSLq99M
 SPLRNJPNpWbhvVy1SNYXK6V97C2bVTXhGABE2qL9hlpceMJYgb4S+d/BzIz/PBKY59Yq
 YrUA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwblBFxf+m9n+Yhm9YquP+/lZPHvdwhUJeWgjfXtOuf40JbZxppMH/LJ8Q7FboAf+ANQCXqpI3HNg==@nongnu.org
X-Gm-Message-State: AFq9FYJwWzT93jC2dQpDqumKtiyqXyi+3xUh7sEmscExVuaaN5GbahLc
 4CCsjtnNBVOrDrYipxzybNVIAFiOMuPZkDfVnP6/wRu9uumwuc4NQNUpPIiLRSqmHBZ0GsVGlSF
 mlykIUPgU/1yb5fZ3OkJedLim3IHKhL7+Gu+GVKoo5Ixy/bB6fXKVSBg=
X-Gm-Gg: AYBFou0k4WZcGxbAe/xAkl0dcqcFG62QbZP1a77roilADB5ir8JvfReyFPjb89anei4
 za3fOQCF04yQOPOFAJ8hz6LjCUnpxhrp1so34LlRHw97SNWli80ksP5tzfrH0TzN8sMmgFPPZiB
 ITrh7Lbgq55OnwXFex9uGPHACukew7rWecK5DRmJJABVk7iJDfD0nbpF4DYF9rRk+t4D6Oi2I0z
 tugr7X99q+tqIUhY00RZSOYCpe4at5yVFskh8c/EL96HnTWnZsuRQB4RjynM3lguDg2XzjyFEtb
 ZatSz1x/V3/Yta922hPvLqt0fIBd4YNVtKhwnZH1WeIaj5phJmW4ufwaKGhMILK/oneDLQLsms3
 BCYyGAEN4j3X9Gjwl228TK6EbefTwEDXD7Q==
X-Received: by 2002:a05:620a:2b8a:b0:93d:78e0:30b2 with SMTP id
 af79cd13be357-93ebd210a33mr1912991385a.29.1791889523761; 
 Tue, 13 Oct 2026 04:05:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8a:b0:93d:78e0:30b2 with SMTP id
 af79cd13be357-93ebd210a33mr1912984285a.29.1791889523136; 
 Tue, 13 Oct 2026 04:05:23 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac52d3sm4419126f8f.43.2026.10.13.04.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 04:05:13 -0700 (PDT)
Message-ID: <58c816ff-3678-479a-b8b0-df1f22a78486@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 49/86] hw/intc: Move GICv5 register and data definitions
 into a header
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-50-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261013083933.1024405-50-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oa3mtXRorVXP6RO85m5CAf4AKwZILbIH
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace1077 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=D2GPF_12Wmj2I9D7mq0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NCBTYWx0ZWRfX3FzBmjojrK9/
 ZYAZGDSCcwtrtGYpvpIoyObgWYsyVE7C6Q3XZa8q6JPsEygbwr4y9A8JinAr59mz3ZpEKKM4Dll
 3NOz3x2K6BNgjFGG1Wzb6zZwAICEdkM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NCBTYWx0ZWRfX41uJpl2S/Ahd
 wWk3T45ljoRIXVVto4fjLLsj/vr1GRiacvjP1o6KwIc5R3TfnvMJM4rwSrYzrdGZhYwEoJBPsJy
 fK8nwJUSdZ2KxaCNRIH5WC3yDIQUdZqbQ9SUy8BOOiLM+bhWQ/m13SqXxjRgBdYKziLo/Ru8IHe
 QywL+gp4kbOEODcrPAPYN88b4Ni+pKu5uPLjyKxAFmmeLuYxBd8DhyZBmVBzpe4udHzYa1czYk3
 VOXa2lSA80LapfWCz91j4ctgrXaC+zV0kBSzo5xUTt/U8NhtuNzg4qUj4SDG53I4oZLLEU/y528
 k43glHt/wHRFLXTowrsLgb00qWebL8hNvqU98c8q1UQAuFQ5qarABbIrzz2B/SXkBqGKsWV8P7Y
 DSogcMO6S82lVdnmxlm3wJsRPASnJ/UucIPcfwP9dXNpILvL1cptFWf34zDlJFGz00IqTPPTwpq
 7yc8YWJlgfQVp7gtHJg==
X-Proofpoint-ORIG-GUID: oa3mtXRorVXP6RO85m5CAf4AKwZILbIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130044
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=unavailable autolearn_force=no
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
> We put the definitions of GICv5 IRS registers and guest-memory data
> structures directly into arm_gicv5.c.  It turns out that there are a
> few cases where we would like them outside that file (for instance
> register reset is handled in arm_gicv5_common.c).
> 
> Move the definitions to their own header file.

There are pre-existing typo worth fixing before moving IMO.

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c              | 270 +----------------------------
>   include/hw/intc/arm_gicv5_regs.h | 286 +++++++++++++++++++++++++++++++
>   2 files changed, 287 insertions(+), 269 deletions(-)
>   create mode 100644 include/hw/intc/arm_gicv5_regs.h


> -REG64(IRS_VPE_SELR, 0x240)
> -    FIELD(IRS_VPE_SELR, VM_ID, 0, 16)
> -    FIELD(IRS_VPE_SELR, VPE_ID, 32, 16)
> -    FIELD(IRS_VPE_SELR, S, 63, 1)
> -
> -REG64(IRS_VPE_DBR, 0x248)
> -    FIELD(IRS_VPE_DBR, INTID, 0, 24)
> -    FIELD(IRS_VPE_DBR, DBPM, 32, 5)
> -    FIELD(IRS_VPE_DBR, REQ_DB, 62, 1)
> -    FIELD(IRS_VPE_DBR, DBV, 63, 1)
> -
> -REG32(IRS_VPE_HPPIR, 0x250)

Pre-existing (or maybe that changed since previous releases)
this register is 64-bit.

> -    FIELD(IRS_VPE_HPPIR, ID, 0, 24)
> -    FIELD(IRS_VPE_HPPIR, TYPE, 29, 3)
> -    FIELD(IRS_VPE_HPPIR, HPPIV, 32, 1)

(thus the expanded HPPIV definitions might be wrong).

> -REG32(IRS_VPE_CR0, 0x258)
> -    FIELD(IRS_VPE_CR0, DPS, 0, 1)
> -
> -REG32(IRS_VPE_STATUSR, 0x25c)
> -    FIELD(IRS_VPE_STATUSR, IDLE, 0, 1)
> -    FIELD(IRS_VPE_STATUSR, V, 1, 1)

[...]

> -REG32(IRS_MEC_IDR, 0x340)
> -    FIELD(IRS_MEC_IDR, MECIDSIZE, 0, 4)
> -
> -REG32(IRS_MEC_MECID_R, 0x344)
> -    FIELD(IRS_MEC_MICID_R, MECID, 0, 16)

Pre-existing s/IRS_MEC_MECID_R/IRS_MEC_MICID_R/ typo?

> -
> -REG32(IRS_MPAM_IDR, 0x380)
> -    FIELD(IRS_MPAM_IDR, PARTID_MAX, 0, 16)
> -    FIELD(IRS_MPAM_IDR, PMG_MAX, 16, 8)
> -    FIELD(IRS_MPAM_IDR, HAS_MPAM_SP, 24, 1)
> -
> -REG32(IRS_MPAM_PARTID_R, 0x384)
> -    FIELD(IRS_MPAM_IDR, PARTID, 0, 16)
> -    FIELD(IRS_MPAM_IDR, PMG, 16, 8)
> -    FIELD(IRS_MPAM_IDR, MPAM_SP, 24, 2)
> -    FIELD(IRS_MPAM_IDR, IDLE, 31, 1)

s/IRS_MPAM_IDR/IRS_MPAM_PARTID_R/ typo!

> -
> -REG64(IRS_SWERR_STATUSR, 0x3c0)
> -    FIELD(IRS_SWERR_STATUSR, V, 0, 1)
> -    FIELD(IRS_SWERR_STATUSR, S0V, 1, 1)
> -    FIELD(IRS_SWERR_STATUSR, S1V, 2, 1)
> -    FIELD(IRS_SWERR_STATUSR, OF, 3, 1)
> -    FIELD(IRS_SWERR_STATUSR, EC, 16, 8)
> -    FIELD(IRS_SWERR_STATUSR, IMP_EC, 24, 8)
> -
> -REG64(IRS_SWERR_SYNDROMER0, 0x3c8)
> -    FIELD(IRS_SWERR_SYNDROMER0, VM_ID, 0, 16)
> -    FIELD(IRS_SWERR_SYNDROMER0, ID, 32, 24)
> -    FIELD(IRS_SWERR_SYNDROMER0, TYPE, 60, 3)
> -    FIELD(IRS_SWERR_SYNDROMER0, VIRTUAL, 63, 1)
> -
> -REG64(IRS_SWERR_SYNDROMER1, 0x3d0)
> -    FIELD(IRS_SWERR_SYNDROMER2, ADDR, 3, 53)

s/IRS_SWERR_SYNDROMER1/IRS_SWERR_SYNDROMER2/ typo?

> -
> -REG32(IRS_IDREGS, 0xffd0)
> -REG32(IRS_DEVARCH, 0xffbc)
> -
> -FIELD(L1_ISTE, VALID, 0, 1)
> -FIELD(L1_ISTE, L2_ADDR, 12, 44)
> -
> -FIELD(L2_ISTE, PENDING, 0, 1)
> -FIELD(L2_ISTE, ACTIVE, 1, 1)
> -FIELD(L2_ISTE, HM, 2, 1)
> -FIELD(L2_ISTE, ENABLE, 3, 1)
> -FIELD(L2_ISTE, IRM, 4, 1)
> -FIELD(L2_ISTE, HWU, 9, 2)
> -FIELD(L2_ISTE, PRIORITY, 11, 5)
> -FIELD(L2_ISTE, IAFFID, 16, 16)


