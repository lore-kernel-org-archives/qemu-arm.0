Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E26C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 10:55:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjEJ7-0003dK-IH; Mon, 13 Jul 2026 06:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEJ6-0003cP-92
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 06:54:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEJ3-0004MV-40
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 06:54:39 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DAfEd8732794
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 10:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LW3fYohk/aaKNf9gFX7XJAGrK7Rod9ZwfEsbUEYpc0k=; b=TAs3HUWcKq3c4dR1
 pBV3PfPnOs49dDkaDFeAiuoKfk+IfXVqQeAFNXYssHj6LesQwEWOuktlLq+8EYvf
 j5/kNgTo5mIKFstpKNeiYnN9sm0bDDJODab1KswSIv5eH2Dh7QgVW6Hzk+ADBUm0
 RZgFtt4q0VWMrPqzgSfFd/4YlvZ6V9D4c2L9j1MX72VhpEKnGSjj3NSlDM1Pt8eY
 B4YnxJ/ghWHop+hZe4q99TdmRKla1iRA7Q0UeXQWZhAJTWJUtzKk1dYM730MWHi4
 8ahXBbRcRa8NE9WAs21U+azV0vdz7z/4LGgwgwgi2moaYpFU7iwLiqH22X4OjTV2
 hbT1VQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a52j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 10:54:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c26012cd0so40967751cf.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 03:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783940074; x=1784544874; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LW3fYohk/aaKNf9gFX7XJAGrK7Rod9ZwfEsbUEYpc0k=;
 b=bbXJ9jajDgbLOJrh5rP0iWzOaegs67Cqp7LOqQCnWNbDsyeTN/yJUL3JLNQIKE5jt+
 OEX5/HnhMF4MFetJbQ6i1K5GakvZGHHX0E2qU4BYHWOCykTl0ifuSzcxvhpVLuSsptgl
 2IJJdN1uYwkTuVnU0NGhd3U5hxqlrG6nHmEqCnGOxT213ECnwgyqpbvDAFl83hE1jDqk
 cnmasReAdIg4xS6dKJHm6n98HlShrxv8j3vBOnh01e67zEpO2eQy9X/79QY7RR/9YV+G
 WfH7vsjXKyHFi/0Qt0rhTe9RAtoOytnyix+5UpTJ/zxTK4Ve8B1/FSeqQfYPW1xhLW0g
 dMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783940074; x=1784544874;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LW3fYohk/aaKNf9gFX7XJAGrK7Rod9ZwfEsbUEYpc0k=;
 b=aITkZz48CDUlW50v+N2WJ4/oRoJ7Wbg7slbY7yJafE82wP9iYP3r2ru+EtPyP+60M3
 P7+2HCKP8ZpR2rOzShyg+HcCyI6lcNeElFcPgfcbcfhbiKfTxwrEYGcV1Mmjjiq1WnXb
 OyQvm4AYUTBJK80xTrjX4KYHIwUcauvL+mu2jeaKTH34dcIX3px2AssBylrrN/EUAcME
 BYhpS97Xf0QgX2pOBRMYVD6b310oPWST/xEZ8P50WHmY/eWqO56Dv/TDUdfZQVtdgB/z
 /FsTiwMysUxoserXm7TNxWPEGeDR2p6twmTsCOWyv1Bhrg9gWjktHaImZPLx/o9G+fDH
 xBIQ==
X-Gm-Message-State: AOJu0YwToeKRNHQGFSQLzHoGkLpS5jUYcZsNWic6dp2otjd05uzdaB3U
 pwEjLspT0UnPSkVEEbDETZulGzTVo54P7UofAb/aYn5BEN3cGIiE2rWDMfHHtnODcM3/pwjQZtl
 F4m4lwV5YcTF4n2TDeyoGiqbVo+80phN+dE1VKGP0f2LuM/o5bcGrKos=
X-Gm-Gg: AfdE7cnDdueXjMU0qkeCkQ1jQmVB4LuKGOrImWco3dzVE22nQeD+HGAMb/i8VCZzltc
 CcHQGzMHPUnXS5NIBxosrqcy9YoD0K167JyseKaqPB++xLe1NdbCyxCmcCKqntR50BzkpDiykOd
 49xqLW+YlzcozEG1Bc3bS3jlWPn/Q9Jur4g9vtqjN4UG/JnAEW3Dvmj9C4vo26sZa31z6s6+iec
 UMV+FXtOwBEAvaSebHyvjO5ukXmizLlTkL01PkoUDrc6SJcPxYFqScfcGZMSjTHwKQhOQjicJfl
 lWzyGiVqq6Rns8IUkMA/lFZhGnNlsGNGwvRSmxWRyc+moIwVmXYIE7Mm83JDtWT9rrY/g70kuFr
 oCrzOujSTw10G0qibPS8RkP6UxaqeN/TEJ94SoVmy7rkc45hEyRrcmbfOQOZ3iw==
X-Received: by 2002:a05:622a:1456:b0:51c:f3:34de with SMTP id
 d75a77b69052e-51cbf0bf820mr77332611cf.20.1783940074408; 
 Mon, 13 Jul 2026 03:54:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:51c:f3:34de with SMTP id
 d75a77b69052e-51cbf0bf820mr77332081cf.20.1783940073910; 
 Mon, 13 Jul 2026 03:54:33 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493fbae1cdbsm178692545e9.10.2026.07.13.03.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 03:54:33 -0700 (PDT)
Message-ID: <c8081b11-b38e-4662-97a4-46734cd9d92e@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 004/134] sysbus: Make
 sysbus_create_simple()/_varargs() take a QOM parent
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Aditya Gupta <adityag@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Farhan Ali <alifm@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Felipe Balbi <balbi@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Helge Deller <deller@gmx.de>, Dorjoy Chowdhury <dorjoychy111@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Farman <farman@linux.ibm.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Gautam Gala <ggala@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Jan Kiszka <jan.kiszka@web.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Jared Rossi <jrossi@linux.ibm.com>,
 Tyrone Ting <kfting@nuvoton.com>, Frederic Konrad
 <konrad.frederic@yahoo.fr>, Laurent Vivier <laurent@vivier.eu>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Bibo Mao <maobibo@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Glenn Miles <milesg@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Samuel Tardieu <sam@rfc1149.net>, Bernhard Beschow <shentey@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Ran Wang <wangran@bosc.ac.cn>,
 Hao Wu <wuhaotsh@google.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260711223707.42139-1-graf@amazon.com>
 <20260711223707.42139-5-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-5-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX2+wmV+KCvlL1
 LTNm5muB6pd1TUxyEpDxqRnAvGdiumkkuCuj2U19pl+XRyRspJEuNYHR1fdKsgT9pEG6itmWfju
 fZTeucFwjs1/i2fMDfp1h7nfkQqn2H35ppEZc31fC7jy6Cj6f7MkLtpMuD74lSfiok3nGIjL59U
 9v0zPnpwCfMtSX2Ku6D5cvuphJLqnlN9PW7DxUtDvCqYdN6xWfnfqNiVcMbpEIXj6kbrjyH+vMN
 KU/QUiSgK8SAWV3Pv8oIyWCr6pjv6EU7pV8dm5rZQ942qzRem5zwTnMtwUt9ooGS7qN79PsUjKz
 YIKp0wxhYYhZVS1viHIYEqXIEKih9kPp/YTNBRYsSELuqllNxiwNn2pGmn+BTifEeBlAm5LSME3
 Szco4LzG+bivjjqoEyzVdrab2/lpEd+yUkuQFmhCxNxSlD+WZyRJGxMh7Kh+SzlM+5nNOgzWdUN
 XZobz2iLyTl+e5GueWA==
X-Proofpoint-ORIG-GUID: fc1gVViLULumVK29TkqHNfHIe6XtvpC1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfXy/7j4dJPtjsP
 zZKhuv2V4QyOaZ0Wur8aw7zn1Kt3iX2qFe20t0CgIbGqf096AsnzQpAVxYQGBvTP1NvmpiGJI2u
 PDIrpb+rW5qUgKMY7hmnF6WuClGoPfs=
X-Proofpoint-GUID: fc1gVViLULumVK29TkqHNfHIe6XtvpC1
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54c3eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=vggBfdFIAAAA:8 a=EUspDBNiAAAA:8 a=e-WwYK0FPL1hkuWrF-MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130113
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 12/7/26 00:34, Alexander Graf wrote:
> Sysbus is by far the largest producer of orphaned onboard devices:
> of the ~1180 unparented device creation sites in the tree, well over
> half go through sysbus_create_simple(), sysbus_create_varargs(), or
> qdev_new_orphan()+sysbus_realize_and_unref() open-coded.
> 
> Apply the same rename-and-reintroduce treatment as qdev_new():
> mechanically rename the existing helpers to *_orphan() and
> reintroduce the short names with a leading (parent, id, ...) pair
> that plumbs down to the new qdev_new().  The parented versions call
> sysbus_realize() (not _and_unref) since the child<> property already
> holds the sole reference.
> 
> The mechanical rename part is generated by
> 
>    spatch --sp-file \
>        scripts/coccinelle/qom-parent/sysbus-create-orphan.cocci \
>        --in-place --include-headers --dir .
> 
> or equivalently
> 
>    git ls-files '*.[ch]' '*.[ch].inc' '*.rst' '*.py' | \
>        grep -v '^subprojects/' | \
>        xargs sed -i \
>            's/\bsysbus_create_simple\b/sysbus_create_simple_orphan/g;
>             s/\bsysbus_create_varargs\b/sysbus_create_varargs_orphan/g'
> 
> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/arm/allwinner-h3.c                         | 16 ++++-----
>   hw/arm/collie.c                               |  2 +-
>   hw/arm/exynos4210.c                           | 14 ++++----
>   hw/arm/fsl-imx6.c                             |  2 +-
>   hw/arm/integratorcp.c                         | 18 +++++-----
>   hw/arm/mps2.c                                 |  6 ++--
>   hw/arm/musicpal.c                             | 18 +++++-----
>   hw/arm/npcm7xx.c                              |  2 +-
>   hw/arm/realview.c                             | 24 ++++++-------
>   hw/arm/sbsa-ref.c                             |  6 ++--
>   hw/arm/stellaris.c                            |  8 ++---
>   hw/arm/strongarm.c                            | 10 +++---
>   hw/arm/versatilepb.c                          | 28 +++++++--------
>   hw/arm/vexpress.c                             | 20 +++++------
>   hw/arm/virt.c                                 |  8 ++---
>   hw/arm/xilinx_zynq.c                          | 10 +++---
>   hw/core/sysbus.c                              | 35 ++++++++++++++++++-
>   hw/i386/kvm/clock.c                           |  2 +-
>   hw/i386/kvm/xen_evtchn.c                      |  2 +-
>   hw/i386/kvm/xen_gnttab.c                      |  2 +-
>   hw/i386/kvm/xen_overlay.c                     |  2 +-
>   hw/i386/kvm/xen_primary_console.c             |  2 +-
>   hw/i386/kvm/xen_xenstore.c                    |  2 +-
>   hw/i386/microvm.c                             |  2 +-
>   hw/intc/apic_common.c                         |  2 +-
>   hw/loongarch/virt.c                           |  2 +-
>   hw/m68k/next-cube.c                           |  4 +--
>   hw/m68k/virt.c                                |  2 +-
>   hw/mips/jazz.c                                |  2 +-
>   hw/mips/loongson3_virt.c                      |  2 +-
>   hw/or1k/virt.c                                |  2 +-
>   hw/ppc/amigaone.c                             |  2 +-
>   hw/ppc/e500.c                                 |  2 +-
>   hw/ppc/pegasos.c                              |  4 +--
>   hw/ppc/ppc440_bamboo.c                        |  2 +-
>   hw/ppc/sam460ex.c                             |  8 ++---
>   hw/riscv/virt.c                               |  4 +--
>   hw/sparc/sun4m.c                              |  2 +-
>   hw/vmapple/vmapple.c                          |  4 +--
>   hw/xen/xen-pvh-common.c                       |  2 +-
>   include/hw/core/sysbus.h                      | 32 ++++++++++++++---
>   .../qom-parent/sysbus-create-orphan.cocci     | 18 ++++++++++
>   42 files changed, 206 insertions(+), 131 deletions(-)
>   create mode 100644 scripts/coccinelle/qom-parent/sysbus-create-orphan.cocci


> diff --git a/include/hw/core/sysbus.h b/include/hw/core/sysbus.h
> index f3c4259d29..7737c959c5 100644
> --- a/include/hw/core/sysbus.h
> +++ b/include/hw/core/sysbus.h
> @@ -91,15 +91,39 @@ bool sysbus_realize_and_unref(SysBusDevice *dev, Error **errp);
>   /* Call func for every dynamically created sysbus device in the system */
>   void foreach_dynamic_sysbus_device(FindSysbusDeviceFunc *func, void *opaque);
>   
> -/* Legacy helper function for creating devices.  */
> -DeviceState *sysbus_create_varargs(const char *name,
> +/**
> + * sysbus_create_varargs: Create, parent and realize a sysbus device
> + * @parent: the QOM parent (usually the machine or containing device)
> + * @id: child<> property name
> + * @type: sysbus device type to create
> + * @addr: MMIO region 0 address, or -1 for none
> + * @...: NULL-terminated list of qemu_irq to connect
> + *
> + * Create a sysbus device via qdev_new(@parent, @id, @type), realize
> + * it, optionally map MMIO region 0 at @addr, and connect the given
> + * IRQs.  The returned device is owned by @parent.
> + */
> +DeviceState *sysbus_create_varargs(Object *parent, const char *id,
> +                                   const char *type, hwaddr addr, ...);
> +
> +static inline DeviceState *sysbus_create_simple(Object *parent,

Both are legacy. Updating the doc:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +                                                 const char *id,
> +                                                 const char *type,
> +                                                 hwaddr addr,
> +                                                 qemu_irq irq)
> +{
> +    return sysbus_create_varargs(parent, id, type, addr, irq, NULL);
> +}
> +
> +/* Legacy helper function for creating unparented devices.  */
> +DeviceState *sysbus_create_varargs_orphan(const char *name,
>                                    hwaddr addr, ...);

