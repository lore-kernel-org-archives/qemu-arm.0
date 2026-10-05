Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89577CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 13:07:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDiOn-0001XQ-G5; Mon, 05 Oct 2026 09:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDiOZ-0001UL-9B
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 09:06:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDiOX-0002sB-LB
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 09:06:18 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFPE51892646
 for <qemu-arm@nongnu.org>; Mon, 5 Oct 2026 13:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=; b=dpawgZD59/svzDvA
 5eyEAYiHv2bphtiWRdbm98p0zG4ASH7l9aodoZmPfNdd9tJZXy1OgTlyU/IBuDZI
 HMoU5QtoRKm4WWYYjGkRVIu1onMT3aNaKjFdeORaxQ9KGGWvk7g8jZ5eG9bQcg6l
 Gf3TSvWV7AFgw+CAeYalbTi18XoYO/gSdKTdMkfUR2S0/S8AGWtKTTWzthENpTrd
 LqOcWwW73dMW5+BZ2mOf3MWnIBjri23EfBFOfeg9ZkxvyelGJkDLQekPerJpZoBv
 v7glvw/Dat37P7uQkZJALSWGl7jvLJKVjZetBltp5/j/4JRQq2KXoeQ15N3aX1xq
 ar9oeg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudxrh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 13:06:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-98c6374b678so1169607241.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791205574; x=1791810374; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=;
 b=g5Cx83D5stos0gxNU15npIEX1sGZNY42Cgo6EpxiVrSmqLZ/Y2u1QtWovE8Lr5mj5m
 hQvOJRr4dYhygDCdoJiXoOMpurQ4r71XeHHQAwZlm2XUi7qyvvUzNniYG6DQrXbsAbO2
 FqUnKC6viPD44KtTRFRrABS8kOXjXyjsEpOV/1YedUDKIeQy2RFojxWB782UL4p2KWB/
 Wa4Lb+t8Vh9PAiGjoNmQs/+i1fLeRg4fiJHh6DlpuRhCq77XRiYTUt1E07zNCpZpiORh
 rK7HyI73GCSnaD+2LkMCGUKhRDSbWb+7Ee3cjt72OlaHPePWkUSuPSex7KQaCW9yk1IY
 rjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791205574; x=1791810374;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=;
 b=TGzBl+LzDAh6AnElECnGn40Jj/ddfjxPyNRbn3xIRWuZhhCekREWSDECx69qrApLDB
 3Sw8ahWFj7TVoT9NOz5CteX0eA5DHAgi6S074B4teLvYVZi44Gd6hSTkj1XEAYps+fXL
 wc3mFm1cknSk4u+DrEexrvyniiLY45Xa6cOJwv2dx2qmIC5XLL2TdW16BYPh5I+SthP0
 AWVNG2wPkBttPEwDk0N0gVSBvP5YZIgZAhIy2QQOe8WRzA+bxUbOOCIeeFehIsZi9a6S
 jxeBBlGlVnbItvK9S1KPAP01RUt2MMi1yaBa6zVHU2j0TzGhQ94z4oM06/PpqGT4LKnE
 LjUg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz/PLVFNVvpcJf5Ce2l9/KDA50K+SvPLR+Yp5iVF/MrWG+wQY8CII5NNdyUgHOcxYeyxOaijhAKAQ==@nongnu.org
X-Gm-Message-State: AFq9FYJs5xemCltqXwTn3gOvOQyjqyb0ViVYzQuIsMk0M1PnI/yLZ9Na
 7BQDdP82E1NDgy5smm+9pkkBKFPB22BPvZR4VjYyanCHlAM3EQEMmyBmCFuE4r1hDiBWRXaleEj
 uP6trTLJJO1QTOT2vEeCwoV79iyc9JgmWQfAqWyh6nVI6tsOHmOXc+mE=
X-Gm-Gg: AYBFou3uwhJN7QC1cEFvhxra63ngDbn0SXW0VazxvAyQ707fG+Ri3prmCf6L0DOrol2
 /UqHNIB5LbgYfXQvn/1OfyhupXqssY3xofncsBvNf5fWmxhnSXbtCVCewRLsGDIy6+OXSKQR0ko
 KukMqA4EvdcIrJiwzCNz+DJYzZPM1xgSzkQhu1FrPFTZ8WvgWyCuotiYyS9d5nkY6tJucCdrBKU
 ParN823+8c5SjPZ+QAQ5hnGUhyJzlJuh7Sj3GyfXWo5RdgpvRI4SQZ3uDawZtopYtqPxAECpeW4
 NzBmFyhrooEOqFrqzbwYH1UWmW2PoA1g5pItphnoXbuwOA9iyPqZG25Mp1LIlIp7+4+uzPUiyuo
 4m5Ish44u8J1eU67FfT0dvwiF2qD9wAaDdA==
X-Received: by 2002:a05:6102:148c:b0:7bc:696f:a5fb with SMTP id
 ada2fe7eead31-7c0f5baadd7mr2929692137.29.1791205572715; 
 Mon, 05 Oct 2026 06:06:12 -0700 (PDT)
X-Received: by 2002:a05:6102:148c:b0:7bc:696f:a5fb with SMTP id
 ada2fe7eead31-7c0f5baadd7mr2929564137.29.1791205570734; 
 Mon, 05 Oct 2026 06:06:10 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6229ce17sm3389247f8f.29.2026.10.05.06.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:06:10 -0700 (PDT)
Message-ID: <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911143627.2743803-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfX9GgotpXEUJyF
 VAZaIpQk7G91wZLT9lNYK8kBgsdb4dhj5bHRBbpnm9d0RDpHkpqZxsLNgGkDvBlebPiQjN3LrYp
 G1zkjJbBoBEPD1kv+T0LJQfcFznqPbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfX6OK44tT6BjYT
 JLkhgepHxbrHbKTn/3hNH9nnO0beo2EB/JGz0exb6FT6lz9qEx29E2Lg+CHIpu5/1tLYLwPmonE
 393wD1/olnabnpJ38l9BLcvsQ1+NqViQtrabXZmnWXazIosi5nAVpczKq+HjT8OInKuleEZL1jz
 NDHGS8MR2VfJk9kzeSaExIA5EHZoU1JdM8mBewAxoK2R14iyyqGeQR6I7m4GLeUTKaPI41rK+YJ
 OqIVqhp3x0mNGa/IzUCyAMPGny8lRIqfAdACP3o4B+V6S8NTfUPkauUV1bso+VRXz86hSc0MVby
 1+3VUptg4Rr4cczP2Ft3+gSQCzoTKF/Vrw4jryBKxz8OZurly/bxx4pNg/2qHL+kSxg4qQUwEzJ
 mTS3DmprfqiR1x3B1ANW5GX9XiGi9fOmzeWr32bRgaaVPyrLhr36L5D+Yy9UWXRXDFsE9qC+Q4X
 VeSmoitX4TrNrsHpXVg==
X-Proofpoint-GUID: Qm9NIN-2w0dOgNCbwd-ECaAK8l-s8aLb
X-Proofpoint-ORIG-GUID: Qm9NIN-2w0dOgNCbwd-ECaAK8l-s8aLb
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac3a0c7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=tVdpVsJRxwjYG60tULUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050051
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

Hi,

On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> The versioned machine types are typically present for use in
> virtualization use cases and can be expected to provide a security
> barrier. The only exceptions are the m68k versioned machine types
> which are only used with TCG. There are also a handful of other
> machines declared secure in docs/system/security.rst, notably
> the Xen machine variants and microvm.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c              | 1 +
>   hw/arm/xen-pvh.c           | 1 +
>   hw/i386/microvm.c          | 1 +
>   hw/i386/pc_piix.c          | 4 ++--
>   hw/i386/xen/xen-pvh.c      | 1 +
>   hw/loongarch/virt.c        | 2 ++
>   hw/ppc/spapr.c             | 1 +
>   hw/riscv/virt.c            | 1 +
>   hw/s390x/s390-virtio-ccw.c | 1 +
>   hw/xen/xen-pvh-common.c    | 1 +
>   hw/xenpv/xen_machine_pv.c  | 2 +-
>   include/hw/i386/pc.h       | 1 +
>   12 files changed, 14 insertions(+), 3 deletions(-)

This patch should be split per machine / area of maintenance,
so maintainers can officially Ack their commitment to security
boundary for their machine.

I'm not sure LoongArch / RISCV / PPC are. If this was previously
discussed, then pointer to the public discussions should be listed
in the patch description.

Regards,

Phil.

