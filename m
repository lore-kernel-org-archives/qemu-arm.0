Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62163C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 22:56:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whbBY-0000Cb-NI; Wed, 08 Jul 2026 18:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whbBV-0000CD-2I
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 18:56:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whbBR-0000nw-Rf
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 18:56:03 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668KtjX83908068
 for <qemu-arm@nongnu.org>; Wed, 8 Jul 2026 22:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0Uv2pZuL/Fh8jKalInzeeuhohX/Ms8fnM/HEgSoHQr8=; b=j+bae57juXvWfJRB
 oqCesX1tfF2usBvBDxEPkLib8uNe3jJbMQEWAHD9zcWMavC2MVRZsyQKLZc7nF+y
 Nd2/wNbgEmfxKvrMK7RycJbTwEbnMwXZhwBdRBy+oIocXF7p5F9ueKmEY9No3s9o
 I379XWcRv1c8sZYxbl37GIZ1r/QAo9aV5cXos+8i4ZZddHSweDCZNFVsANKgITp/
 rQk00cDwd7/ZBIIrgngpmFF82fjvICvZk6vztqXwhPK+OwoZQ/ASymSe0IJ3w3f6
 h4jWwOpMrYquMMdU7pOvOfI0/zytcWj31khh8HpjJ17v8iwdBZBKxa9X+zXkshGn
 Q6fc2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq31s64-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 22:55:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8ec3314f65fso17693786d6.3
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783551359; x=1784156159; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0Uv2pZuL/Fh8jKalInzeeuhohX/Ms8fnM/HEgSoHQr8=;
 b=T5X8PXiW+1STWo0k+N1p4jXNFnu/dwdVIbmvSZXESr2lUsiv+HFxNekg891XdHF3j8
 8iY55zKiIwsb9FOxzvtMukFdBjMEcyt0rB6VkHUm1q5rjIAhaSaTEK7vLrY7QR6TKQeQ
 jQpknA1tqT6S+3CYJDnHi0xBxZeZnK8NAmeajQhCpW6+rIP8XCkjZqlslH55UIk6yaID
 Aj8T8OrwVzjGY3zEtwnAk8uoYiqgggI8bUPRBL0W3uWpSWFtWFAwrjteTyldf8SPLGFG
 DGMUa4ujJXMh1l5+zM1TbIkzTnSndZj0bHA22v1wp/CxHjIIq2wUevutI/b+WsJs3nps
 GplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783551359; x=1784156159;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0Uv2pZuL/Fh8jKalInzeeuhohX/Ms8fnM/HEgSoHQr8=;
 b=TtyHligBSrUr92pAoI7nQAFXIEWiNf0sRO8uSkhfweE/U0ZOcogMRgktpCeRD06exu
 m/jfXf0izozG9VvZgvemnG2cFmd9XswbH5jyIrYq7OzaD6OaVYXbyo/jcWTDOAy7GeJj
 L0niCXWBK26Q3Wy0Njb/2m8wnXP9YPEOwTAnZAOdZ2OlaAbHzfxXS8VdJS1rPWm/xkvi
 ibDhGGzBGb271UJeoym3I5jAset/5xZ0PALwXPsyjiQSeFaij25/xQ3if0c8dvFifV/v
 dO36KA9/G0FsQwEhqMKQuw39/eLIF3KKC3nvvQEDihaL9h/EggKiOeIg8ztmWgqrqV08
 0rKg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp9KAMKHUi41614HgdfQ80vLs/XiEwsw73EnpIkKwTN1I8Exapx199kPfyIH3sgOjAaPO+/q/WIlA==@nongnu.org
X-Gm-Message-State: AOJu0Ywnx+8II5rVrn0htzt1usJZYbYwd5AjR7i1k83InS7EMWLSiRxp
 2vOEeNgq502+wQPa9PectE95x2zJfg90UM7iDI2QabbHK1xzg6YDQa66EY97o+oBpp4Lx9KLSHQ
 55pw4Z2JoBixex6+6XgkqYWGMv+/HQWn8+EnPVslBICGUN+2OI6K3pzY=
X-Gm-Gg: AfdE7cnZ52P063UWSNKB3K26MaBhbYaq3FGMtv/htBKQcnwFL9V6wg1ON0XbekCqkpv
 z0amBpfAJpNPIOvrV/dAMNfyXuX/sGpxEyeFedbqeqrmJZvCeuh/4ulL998gUsP0iF0Cxc9mMsQ
 yWnTw35hp+gpw89TrWBKnxroiR1tHZdRZcWh6gTb0dfFGsV0z2DQVFJq6BQ49PkuadD905/d294
 HiQXH6ccV6y1474BsstvorSZGVgFjY9QyCtcxoedn3NdTbWcShD8Cvtak55IuzDKV8bFxa6LiJ8
 IhPzQp3DTzow9a3EXk9Vlqk2NqbX4N9iqdKDr76tFE7Fz0GwzAnviwqSM5Wn+ltfK+dEs+xXwFT
 VuxOjE8bpQG0qooRPgOzkWJnkYO6rQHxBmI93DKacu7rTTLkjxu2lzGXXJzz99w==
X-Received: by 2002:ac8:7f87:0:b0:51a:8c97:9391 with SMTP id
 d75a77b69052e-51c8b572217mr52220911cf.72.1783551358794; 
 Wed, 08 Jul 2026 15:55:58 -0700 (PDT)
X-Received: by 2002:ac8:7f87:0:b0:51a:8c97:9391 with SMTP id
 d75a77b69052e-51c8b572217mr52220511cf.72.1783551358214; 
 Wed, 08 Jul 2026 15:55:58 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6fb526sm13058095e9.15.2026.07.08.15.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 15:55:57 -0700 (PDT)
Message-ID: <2d7d578e-9187-4751-97ea-5a9b13ee84ad@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 00:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] docs: Add support vbootrom and update Manual
 boot for ast2700fc
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mark Burton <mburton@qti.qualcomm.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kane Chen <kane_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Troy Lee <leetroy@gmail.com>
References: <20260708092023.3826159-1-jamin_lin@aspeedtech.com>
 <20260708092023.3826159-11-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260708092023.3826159-11-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: X_z8a6PMMuEeuEN7oqMAfWlGCJKMnpDy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDIyNSBTYWx0ZWRfX+SDD0aIrJ8ld
 rVikuii7z8kMWidE86zLbzZQfXkxkWGk99mj2ePKnkFdqC9/yb/ZrZ1bBPF8G86dKXbNqHYjwXq
 zYAPFVO6IjGyamTW2NGb1QC3D6KoqNqxrFxK6HHiDmVEcChQa2dLkybUxuhMm6Q8CQKHJSh2zKG
 IW4JtU0cfdGWfGID5JZBRfbmBbZVCPUlm+fpXcthNEBd/G6VarlANd8CobuqY+AN5jrU3Ktc4Gq
 stae6el2xus5EZqcov2RQwjwhMWcn+DWDve62FamjBql5ZMPuz2fgbnItj6b5qmzV50w1LR7pSG
 JaI0x2SgC/LB9kmmMHbqwrINlj3Zalnt+BWLdFGL9Fn0tMON7YP7EdspJcvTo2jtsPyzH06yLxJ
 pYqESEwYKpRM75uzwMxKxbWEu5R7Qu2ACUg/rtfWJyLnDDhQ18t3xJvzIJNWFSlmFFztWKLvEeW
 Q7+QWmAyhz1rzQBjxdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDIyNSBTYWx0ZWRfX/GhkRqS/7Yqj
 9oCb6BvLJm2wOQNDzkW3TK9P1p8Ef0Sb7VBt2FIUt9OOomyh8/Oc1wRfo6pT4HdW/8JiNhdsFdH
 Ol8TGsMMATko1LMi+QOPXJ874lMM2E0=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4ed57f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=V2NxCb60AAAA:8 a=GyafrK3KZhnXGc5g8acA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: X_z8a6PMMuEeuEN7oqMAfWlGCJKMnpDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_04,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080225
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

Hello,

On 8/7/26 11:20, Jamin Lin wrote:
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   docs/system/arm/aspeed.rst | 42 +++++++++++++++++++++++++++++++-------
>   1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 2d51ceeb84..b6dd757f6e 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -386,18 +386,25 @@ Booting the ast2700fc machine
>   AST2700 features four Cortex-A35 primary processors and two Cortex-M4 coprocessors.
>   **ast2700-evb** machine focuses on emulating the four Cortex-A35 primary processors,
>   **ast2700fc** machine extends **ast2700-evb** by adding support for the two Cortex-M4 coprocessors.
> +There are two methods to boot the ast2700fc machine.
> +
> +Manual boot using ``-device loader``:
> +
> +In this approach, users manually load firmware and assign entry points via QEMU loader devices.
> +By default, the PSP begins execution at address ``0x430000000``, the load address of the bl31
> +firmware. The SSP and TSP start in the powered-off state and must be explicitly enabled by the
> +PSP through writes to SCU registers.
>   
>   Steps to boot the AST2700fc machine:
>   
> -1. Ensure you have the following AST2700A1 binaries available in a directory
> +1. Ensure you have the following AST2700 binaries available in a directory
>   
> - * u-boot-nodtb.bin
> - * u-boot.dtb
> + * u-boot.bin
>    * bl31.bin
>    * optee/tee-raw.bin
>    * image-bmc
> - * zephyr-aspeed-ssp.elf (for SSP firmware, CPU 5)
> - * zephyr-aspeed-tsp.elf (for TSP firmware, CPU 6)
> + * zephyr-aspeed-ssp.bin (for SSP firmware, CPU 5)
> + * zephyr-aspeed-tsp.bin (for TSP firmware, CPU 6)
>   
>   2. Execute the following command to start ``ast2700fc`` machine:
>   
> @@ -407,6 +414,8 @@ Steps to boot the AST2700fc machine:
>   
>     $ qemu-system-aarch64 -M ast2700fc \
>          -device loader,force-raw=on,addr=0x400000000,file=${IMGDIR}/u-boot.bin \
> +       -device loader,force-raw=on,addr=0x42C000000,file=${IMGDIR}/zephyr-aspeed-ssp.bin \
> +       -device loader,force-raw=on,addr=0x42E000000,file=${IMGDIR}/zephyr-aspeed-tsp.bin \
>          -device loader,force-raw=on,addr=0x430000000,file=${IMGDIR}/bl31.bin \
>          -device loader,force-raw=on,addr=0x430080000,file=${IMGDIR}/optee/tee-raw.bin \
>          -device loader,cpu-num=0,addr=0x430000000 \
Orthogonal to your work, I found this setup interesting to stress
my work-in-progress 'split-accel' branch, running QEMU with HVF
when possible, otherwise TCG.

I manually started the SSP & TSP first:

=> mw 12c02204 40000000
mw 12c02204 40000000
=> mw 12c02120 1
mw 12c02120 1
=> mw 12c02224 00000200
mw 12c02224 00000200
=> mw 12c02160 1
mw 12c02160 1

Surprisingly I could boot up to the guest login prompt spending
most of the time using HVF

(qemu) info accel
36 transitions, 10943 SW and 86815 HW executions
Accelerator settings:
one-insn-per-tb: off

Translation buffer state:
gen code size       9098100/1072906240
TB count            16086
TB avg target size  14 max=468 bytes
TB avg host size    230 bytes (expansion ratio: 15.8)
cross page TB count 12 (0%)
direct jump count   8371 (52%) (2 jumps=5949 36%)
TB hash buckets     4813/8192 (58.75% head buckets used)
TB hash occupancy   21.05% avg chain occ. Histogram: [0,10)%|█▁▇▁ 
▃▁▁▁▁|[90,100]%
TB hash avg chain   1.059 buckets. Histogram: 1|█▁|2

Statistics:
TB flush count      0
TB invalidate count 8796
TLB full flushes    0
TLB partial flushes 268
TLB elided flushes  53158
CPU#0: cortex-a35
HVF cumulative execution time: 7.020s
CPU#1: cortex-a35
HVF cumulative execution time: 6.000s
CPU#2: cortex-a35
HVF cumulative execution time: 6.805s
CPU#3: cortex-a35
HVF cumulative execution time: 7.656s
CPU#4: cortex-m4
HVF cumulative execution time: 0.000s
CPU#5: cortex-m4
HVF cumulative execution time: 0.000s
(qemu)

Over 10700 "SW executions" are the M-profiles running,
only 162 correspond to A-profiles :)

Thanks for this motivating setup!

Phil.

