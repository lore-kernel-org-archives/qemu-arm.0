Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC852C531D0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 06:52:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woFCM-0001XQ-6W; Mon, 27 Jul 2026 02:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woFCI-0001WE-FC
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 02:52:22 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woFCG-0002WS-Rq
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 02:52:22 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66R1fg1O2571733
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 06:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P4AqPdOubjMGezsb+ZDGfsh6kbF9dVPJsDS7GTfQLeo=; b=HrumFTcr2Gf/2Jfe
 Rjk4jk57FjFCUAicuP4LxGOvgxmCHTkHCgurlwn0poxXP8mB0IvhI305aA50+1wC
 1t/0UXZ4DhGub3kvqEN+povMm5jkdP4LV9LYhHVoY1c01AUS+ISxkEfx3H5CqhIH
 ec+AxyoaNfTSXzq6nJCVtTj9K3Z20xh+buX6KA9ZOXMwHO4NlQif6WlWAr6svCqo
 GYf2gmGBP47whUdrlSG5qCq/Dza5A0kRXPXt5N10Q0c4NscuPjxLbPX3Wrpl2V1D
 SoAJncZtQMbBMcgES96HuYh9HVe8MnNoxj6fr/5+zC7Nx/0f+JH9A43lIii/ICiB
 ZablDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3scyjr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 06:52:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso29612141cf.0
 for <qemu-arm@nongnu.org>; Sun, 26 Jul 2026 23:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785135137; x=1785739937; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=P4AqPdOubjMGezsb+ZDGfsh6kbF9dVPJsDS7GTfQLeo=;
 b=HuGV7m8tO0F4WvrJVoMJ/SuLI1RF87zjpNQDgONfRpd6yIWeIaAe0MvJm6m9s6cJFk
 ZNii3iQrpMy//yxhix15g4kiRITUOheFgFVmVGI+/D9PH3VliOOMflRv8eP/bH6wpyMq
 3RMSxq8xRV/y+71b7O0nSkM7Vc2aaQq/UI3YywUfry0QmVuYQz+DAB8O0FLNb2VrgL2f
 IdEsShv6ausEFOxfskg3L8v4Emx/RRsZjDLVlXGPV2WDQv25DUDLik5XLkiLT3oSmKYL
 XvfUjTUK1sY/CFqYcbAWTqtOCegIf91oSgePoPuQeaKo/bSPjc7+7EQyzGiH07lYVaPb
 jBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785135137; x=1785739937;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P4AqPdOubjMGezsb+ZDGfsh6kbF9dVPJsDS7GTfQLeo=;
 b=aDpqpjsuxQrcHTPb7bYjXerxARRadyD5yQNqytI381R8UXPQG2De3x7sVet71ANuk0
 ef/qaDFcb3t21q9CYVF9q78+nJvqr/ZnNPyHc7BL90+YaUsBQ2sGbrVFYfJXfnOLo16d
 bD0WIMmf8wR2mWF3MOjDCeiiqnC7n5Lmwwg8D+c9mPcVRmvn51QriNzVD1ZVxkmI2R02
 J85CDqdIabP2+K6AilmwG8jubA+3s0zKKCdk/L51Q5nZ22kmB+XeUYtCJpbeKKJ3EiK1
 qO7myxM9xg61Z5BUfvSJk0qVbpUj/8A450iz5yhGON0KtpBWhokXVZtfwbMbR4eu/3jn
 Pt5A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp9rPn8pR0GZnW6Iwd33Q5Plt2lzykQXV+uWVsOG4gU5FchysCwjNLTJZEFJeqI6KAKcUEsWSNjfA==@nongnu.org
X-Gm-Message-State: AOJu0Yy1dP25E4DF2Qwc+rI2waoeMOYDNSk6kfYftJuoiPKcRbNKqQRn
 yjEyCubrFx+eLVEhiLO6vOw9+Aimr3NbFMP54ubCtCxCp0Izd09kRgjGS2H0W54m8dyzhLRYIep
 5Vr1gPOhz7Mr7FPrme4znDD2RTmCxlVcDed6A4NYcwhLMBftuBGuRCG4=
X-Gm-Gg: AR+sD13nWGfjecKlK4S3k5n9k6ZhxQ+79fClsxqCxU8Z+mSNbhLcg2FHRQVlTcZBb82
 Hoku2MK5Wit2DsXSLgqTFY4siVeK9OKfXrmBWZKoF2A4hrAF/O2m5jo68Mw34HK+B1lgZpVaXx0
 m92dIA4+r6MOdtBpMeMvD2KDF9ASl+jAt2Kp8nBrXZzny6ZowPGs2geZn2twZjQ4+O8bxYDEYcM
 ElC9UqoISYSBxO2zfiEEdckcy33fGKJ+DVNriUP3FLUwulDwb3n3CmT/IvUjZ1E58vZSZ5L+c3D
 i4xPMrXVGC4VgnchQfkqBdoWco/td5eh38cwIJz0zzt9zDQob8uvlesgDGk31D0LJXWxgOrmrRS
 twelKLC8DM2U5tSuGG07eInaaohSLfw1M7IfGAwjlHbmSix4LzW8=
X-Received: by 2002:ac8:5a09:0:b0:51a:8c97:937c with SMTP id
 d75a77b69052e-529a8713ddfmr72098671cf.68.1785135137115; 
 Sun, 26 Jul 2026 23:52:17 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:51a:8c97:937c with SMTP id
 d75a77b69052e-529a8713ddfmr72098561cf.68.1785135136637; 
 Sun, 26 Jul 2026 23:52:16 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b4866ddbsm231697825e9.7.2026.07.26.23.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2026 23:52:16 -0700 (PDT)
Message-ID: <bb57f3db-eb96-4ced-aef3-3546055cad4d@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 08:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/arm/raspi4b: fix guest never seeing more than ~1
 GiB of RAM
Content-Language: en-US
To: Marcelo Manzo <marcelomanzo@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>
References: <20260726144112.56321-1-marcelomanzo@gmail.com>
 <20260726144112.56321-2-marcelomanzo@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260726144112.56321-2-marcelomanzo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2NiBTYWx0ZWRfXx0gDpeC5NvcS
 kJId3ias7DffKcC1OFvwMOc5TiQ8hoKleXrbEG8OQ2Em0M0uhlpiXHmacO+CZBQuax/OcBdZxZz
 /lZn7Pny/9NJsH0G/6oPYca5jZaonFl6bw30+/MNE9sklTeNqYixgRRi3peactH94NYSFUJSnyd
 E2LuStLpWMqspRrvAezwTIflGoXFls2uEjdMVSFo9BgiEzyixWpIdA/N5jK8cJyNtz53YXFzOw9
 sU2rXbldgneHvF4oo2/k5GUY8Vx47N9bKiJAWxkMB62Ez9uLoOtwORbKpfKqvMSkT9UEamLduuI
 CXj5FNrfY+77ZAf0VHdl+eNPHgmqi3YcyzS/k+BrPDKS654guV4AXf4qp9OLdrgY4kntLIYqFCA
 yaoUzJU0XL9X1Ck5aTR0fTr7lOIL08kivPnCpDIKHTM+BAZVoE4FHwuyD27smUESrS3kxmvs7Yn
 ofkd9tkOAyJzkNZhlQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2NiBTYWx0ZWRfX49cUEyLxWNhA
 V/rmf1MjDEe9vry2oROaMiBD44txjKRWwnrOK4amiJ1quZuZCusMXclz/qo2NIDaJBeEJ8mz8qr
 hkcqqD99kPGVbHv6W3b2A7Ux4Ig5icI=
X-Proofpoint-ORIG-GUID: idx1BPUF64a5zKGjbHypc9kAW9tq6CzM
X-Proofpoint-GUID: idx1BPUF64a5zKGjbHypc9kAW9tq6CzM
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a670022 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=sMf9ggfI_TTS4PY1ofMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270066
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Hi Marcelo,

On 26/7/26 16:41, Marcelo Manzo wrote:
> raspi4_modify_dtb() decides whether to add a second memory node above
> the 1 GiB peripheral hole by checking info->ram_size -- but that field
> is the boot loader's RAM budget for loading the kernel/initrd/dtb
> image, itself always capped to at most UPPER_RAM_BASE - vcram_size by
> raspi_base_machine_init(). Since that capped value can never exceed
> UPPER_RAM_BASE by construction, the condition was never true for any
> raspi4b configuration, and the second node was never added: the guest
> never saw more than ~1 GiB of its nominal RAM, regardless of the
> machine's actual size.
> 
> board_ram_size(info->board_id), computed one line above in the same
> function, is the value that was actually needed -- the board's real
> total RAM, not the boot loader's own budget for where it's allowed to
> place the kernel image.
> 
> Confirmed via direct measurement inside the guest ("free -h" /
> /proc/meminfo) on raspi4b's default 2 GiB configuration, before and
> after:
> 
>      before: MemTotal:  943524 kB (~921 MiB)
>      after:  MemTotal: 1905824 kB (~1861 MiB)
> 
> Also verified against two real, unmodified Raspberry Pi OS releases
> (Debian 11/Bullseye and Debian 13/Trixie): both now report ~1.8 GiB of
> usable RAM instead of ~900 MiB, with clean boots, working SSH, and no
> kernel errors on either.
> 
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---
>   hw/arm/raspi4b.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
> index b92840e1b6..ca246ebb35 100644
> --- a/hw/arm/raspi4b.c
> +++ b/hw/arm/raspi4b.c
> @@ -64,7 +64,19 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
>   
>       ram_size = board_ram_size(info->board_id);
>   
> -    if (info->ram_size > UPPER_RAM_BASE) {
> +    /*
> +     * Bug: this used to compare info->ram_size (the boot-loader's RAM
> +     * budget for loading the kernel/initrd/dtb, itself capped to at most
> +     * UPPER_RAM_BASE - vcram_size by raspi_base_machine_init()) rather
> +     * than the board's actual total RAM computed just above. Since that
> +     * capped value can never exceed UPPER_RAM_BASE by construction, this
> +     * condition was never true for any raspi4b configuration -- the
> +     * second memory node was never added, and the guest never saw more
> +     * than ~1 GiB regardless of the machine's nominal RAM size. Confirmed
> +     * via direct measurement: default -m 2G returns ~916 MiB from
> +     * "free -h" inside the guest, not 2 GiB.
> +     */

No need to add this comment in the code, we already have the git
history. With the comment removed:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +    if (ram_size > UPPER_RAM_BASE) {
>           raspi_add_memory_node(fdt, UPPER_RAM_BASE, ram_size - UPPER_RAM_BASE);
>       }
>   }


