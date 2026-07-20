Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A32C44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 12:39:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlnH9-0003B2-MA; Mon, 20 Jul 2026 08:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlnH8-0003AS-AB
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 08:39:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlnH6-0002wO-4j
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 08:39:13 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAve8b2430762
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 12:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 isKXoyThalDIpLFeWvybr4SmKYxGhm72TTcUR7ykzIU=; b=brhmLTFNJ9/j0YOv
 LiZUd4WC1gwddwfB+uO8nrghX9Zffvr09uXjUwsJDh4y3AmqaeqoLwrxoETvrIL4
 EFHl1RKsgHWjZrQ0tiLyMbMdYUqnB6bqMBRciG+5vsnywX6hok7h7oW5RRkkfPt6
 uhrEl/NMETDCiCxzeTH6FhL1kDgE1ZUYSaqlE200VOOFllgaD1ZpUXNG+/mpu+z0
 FjjCoCcf+612p58aV0vIqoqpfGKDRRFt+5bTEawX/gLmTVAqG+UavspR2deWoAah
 wvY7b7CFCigYmepIFe6ktckDjSKI/QeMuVuZmY1CaXGuJmTQ9uL5K3WxmdCuypbs
 v5N9uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgyrmgu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 12:39:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0e702df8so142950161cf.2
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 05:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784551149; x=1785155949; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=isKXoyThalDIpLFeWvybr4SmKYxGhm72TTcUR7ykzIU=;
 b=Nn2Ld20M+ow85jBDIXNmt2Rkeyfzh277vxaIHhHn+cLmSEYqWrKSPGC58tmvG/gM2k
 1gfsxKdnXDz6IC+2/JTiEMgrPe6V+n0bROz6FBigQLxhNo19nIwPWrokgc6PiLe8GzA5
 2TJeYwo09xW+ojG081wXgfgelxdxP2vAqnUcjn1EXCecEKKPn+MXJuuRl20hhsadjl38
 A/T5yrBdujRrzx5U21Rdd+Ny8gIeKyoW6nDMJk/gEY4KN2yzMdbKw2i7dG2fuX+juFq9
 gEHWP3sJ/mAWEPFGSm3YliPR0w1/WgzgDNoAr/8bT5aVafghp2ejnt8iQ81mPqldIG6k
 WjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784551149; x=1785155949;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=isKXoyThalDIpLFeWvybr4SmKYxGhm72TTcUR7ykzIU=;
 b=KCqC/whIJ2OCHvN/n6yzUbGq55a4SbTl+OMLKaknBayLASByjd9BD1kDGDSnxK7T5M
 GHjtkOKIhcZzyYyLtioMulztvOYq281nb8czmp2o+sg7SU5h8MClrxg92OZtE+4yswP+
 dddHCv4R+fVfqvQ4phpGpXdAPMxB/vg4lnfXee2Rc8IOrUE5CO1n+2feNJfDoTzheMy/
 NBokG03GfW6DaznAw8j5H03HKlbxyCXCqI8nC8WocMRmpblfBTlgJyEkuG9taAnT0teS
 XN5qLjGQnOAJz6LGt0nehyWCVK6KyOjmJoTkKfRiFRrEB1GbjnIUzxYHYfb/vKjyqd7O
 6SSA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpHp7Ht62tZKEL+l88h2CZAvYfwIyz5KvXRn/YUKPH9GnG3rHPek1OL38kI8372ZcuoVb+pW8Wfjw==@nongnu.org
X-Gm-Message-State: AOJu0YyX1dRSujbW67vl8HMO6zw7zxmf6QjgQzLWRrhAHXUN4gYNdTbX
 kPb0BWkgLD/HP+v6oW4zI5MayENKm3Vy2JsR89XDKJH++88IKQ1U4iBKLbCRGjy9Z6D86q0ALvL
 fgjvFDsbJRFE7BE2MXN71tZfENphmyVLIVrs8PQXC4UvVD1l8P+qvkeQ=
X-Gm-Gg: AfdE7clCG60fjm5CLpOd14YVLdg4yK9Esa15jJYDhReCvbEvyfJ9xhbII7qqUJBkwvc
 YnX5M/G/fNmEI6qPzcXlQyw+rAVYUG2R9t3PvAXscvGKqxvGrqNmt6x52XSOBIFdE+lxuc1Ijzn
 pi1Rgka8OtmxtKfb1IAW1HKyqDbKJ6JT/dtwKZXhaAyBcupPXBjUHx51N4mfLJqeDfOtywLM20u
 JJvIkM38YMM+f0EfOAvC2d++89xgiFEBuymnUYEaVlLxlIvZsd0V6J2FOnKl6BP436uwHQwmQkb
 yIkzCvvffe9/MnVS/rMqoSw+kqIoKr32AXjDTy5C7uhfxrpG1XwNBC5oJbCy/OWmNsRn+aIJ2TU
 KVQwV8pTrZXFKFllT7xNqkQl9aJL2FMvMp36nEKKTa8N0NvN+2eM=
X-Received: by 2002:a05:622a:5a17:b0:51a:8696:cb38 with SMTP id
 d75a77b69052e-5213bf10ef4mr125761561cf.7.1784551149256; 
 Mon, 20 Jul 2026 05:39:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5a17:b0:51a:8696:cb38 with SMTP id
 d75a77b69052e-5213bf10ef4mr125761351cf.7.1784551148790; 
 Mon, 20 Jul 2026 05:39:08 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ec7f55sm26586120f8f.18.2026.07.20.05.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 05:39:07 -0700 (PDT)
Message-ID: <1bcf5fd5-b2ee-4adf-ad16-bac12050baa3@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] hw/remote/machine.c: Mark x-remote machine as OK for
 AArch64 and AArch32
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
 <20260507194728.2034696-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260507194728.2034696-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0MSBTYWx0ZWRfX0DqIC5SsZFyw
 4kXr6uGYNNpZUTHV6I/JnbxfFp9UlJk5EhFPyKQkKJ/A4ZYiHT74YVU2tJYQXt3E7uVYaivvE9z
 jbakv9AZOyRvWT29ETlh5ysEQVZtwqw=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e16ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=69wJf7TsAAAA:8 a=KKAkSRfTAAAA:8 a=aIVl5Xy6heg3LO1m9ysA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Fg1AiH1G6rFz08G2ETeA:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eFpXP5kGK_flWo9FYOsVVQ2jvX5Cy8rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0MSBTYWx0ZWRfXyYOPj2bptegK
 TCc5l2ZMvmTbRQeNZPJzWUcRiRoPjByg6iHt6t+rtoOZU23K48/Y327ZXmGXcpBfwJEYTcZLRBo
 mkd2IPH9i7S/Q3YP7+bD0FJh0w7IC8jzNGMH6CPZbnYmyMxcpnetUtUVJmBWGJcfnETt3Ruj1FK
 X+QafYQoYHtQW2jNf/eKn/6xWXqrMNWrKhv7zpfqpNDWPy5qXOiQbhAex4d8LkZUXkex5bpZASV
 cDUHw75ik9jnPvoRpR0Ld/Cf2dg8NyYCX1GWwxHFvHh9ymw8a5fPK0amZZQqEBgR6EAEB6IGz7P
 Y1Kum+a0XHy/xu5ZrDJ4yE3SSq+H6pHiB/FgjfY7yiNGxrVRt8717NPR/Cao7641DVPc+/blNn2
 EzgjqsdIEP+TyZzI6y8YII24SaC4YKa4eAH6vmX9mesS91gYwL6cWcnDM5sldGL3oDWReP1MI0G
 X6E8uXdHngU8cPEe+sg==
X-Proofpoint-GUID: eFpXP5kGK_flWo9FYOsVVQ2jvX5Cy8rt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200141
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

+Stefan

On 7/5/26 21:47, Peter Maydell wrote:
> When we updated Arm and AArch64 board types to mark them for the
> target_machine_typename() filter, we forgot about the "x-remote"
> machine type, which meant that it disappeared from the set of board
> types exposed on the qemu-system-arm and qemu-system-aarch64
> binaries.  We didn't notice this, because although we have a
> functional test for it, it requires the KVM accelerator and we don't

I don't remember why it requires KVM.

$ git grep -i kvm hw/remote/
hw/remote/Kconfig:3:    depends on PCI && PCI_EXPRESS && KVM
hw/remote/proxy.c:36: 
kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &dev->intr, dev->virq);
hw/remote/proxy.c:45: 
kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &dev->intr,

I suppose these 2 calls should be replaced by generic equivalents:
- accel_irqchip_remove_irqfd_notifier_gsi()
- accel_irqchip_add_irqfd_notifier_gsi()

> run the functional tests on an AArch64 host in CI.
> 
> Mark the machine as being OK to expose in qemu-system-arm and

Otherwise if it is tied to KVM, we removed support for 32-bit ARM
KVM in commit 82bf7ae84ce; ...

> qemu-system-aarch64, in the same way we do for the "none" machine
> type. This fixes a check-functional failure on aarch64 host, where
> it would otherwise fail with:
>     qemu-system-aarch64: unsupported machine type: "x-remote"
> 
> Cc: qemu-stable@nongnu.org
> Fixes: eb796c55513d9d39 ("hw/core: Allow ARM/Aarch64 binaries to use the 'none' machine")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I couldn't figure out which git commit started enforcing the
> filtering of machine types based on the TARGET_FOO_MACHINE
> interface markings, so I picked the Fixes: commit hash for when
> we added them to the "none" machine, on the basis that that's
> the point at which we logically ought to have also done x-remote.
> ---
>   hw/remote/machine.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index ced782f6a9..df08f64019 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -24,6 +24,7 @@
>   #include "hw/core/qdev.h"
>   #include "hw/remote/vfio-user-obj.h"
>   #include "hw/pci/msi.h"
> +#include "hw/arm/machines-qom.h"
>   
>   static void remote_machine_init(MachineState *machine)
>   {
> @@ -148,6 +149,8 @@ static const TypeInfo remote_machine = {
>       .class_init = remote_machine_class_init,
>       .interfaces = (const InterfaceInfo[]) {
>           { TYPE_HOTPLUG_HANDLER },
> +        { TYPE_TARGET_AARCH64_MACHINE },
> +        { TYPE_TARGET_ARM_MACHINE },

... so exposing this machine on 32-bit host binary doesn't
look right.

>           { }
>       }
>   };


