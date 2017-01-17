Received: by 10.25.205.13 with SMTP id d13csp718302lfg;
        Tue, 17 Jan 2017 14:13:54 -0800 (PST)
X-Received: by 10.55.118.194 with SMTP id r185mr15544229qkc.153.1484691234711;
        Tue, 17 Jan 2017 14:13:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o99si17618978qkh.54.2017.01.17.14.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 14:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTc0m-0007fs-3i
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 17:13:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc0i-0007fI-AU
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc0h-0003Ov-3A
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:13:48 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cTc0g-0003OY-Q6; Tue, 17 Jan 2017 17:13:47 -0500
Received: by mail-wm0-x244.google.com with SMTP id r144so41832232wme.0;
	Tue, 17 Jan 2017 14:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=c3+R67wqwbzUYAnBr5ohyuf8sSmCrzZD/jK/bz2fivc=;
	b=CDJ69GCHhwmRQlmn3N24AeLDmWSwvdrD+eNoOYM9NR/b7GqOiXwyo6UU6Xvc/Yq6JK
	MFT9FyXwv157vsuHHKGfdiu8X4Qud7YaCZNYEQ1Lr1nmmkMVhY7aIlsAadOa9ymVi2q0
	H3Bio9MZ962dowIAVKaB/ODw+4FrQkSqFzTbYcL5H+VIKMW1YO32xb5lzJ+Kz7zV61gL
	7zJT7DODpiHi0QNY5q2pfOd87EJLKv5Xyz/kcIpZEZ5T4xXB/brqcCdIRFbGEqMwiGqZ
	5GYRM80bdR7pSRl3SgutboADYUvEnk81RGMklmVlala4ejVLJrROqQO5DzaU1bZ5Hqlc
	4W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=c3+R67wqwbzUYAnBr5ohyuf8sSmCrzZD/jK/bz2fivc=;
	b=bVtrVnYt/gSyLBHmz1T40mKobmNMYTw2S0q0BywxfrUajMBPrkMEoLVtIGXOcGVDRP
	JSkPgfNkvZz7eYJiGf05dBzyfisQ01ObGB2gPAcFOpRkGWnVl7Tp7XNy7Kl8IMdLB84X
	h/KoNWNCDCN9clT5VsqDBu3kl0JIaBuIMj87JF7Wv49UqtaSZToDPe+yNj4vrSInkAv8
	u/FFsCUCYoQ92cK227KoXPjRZ2rc56Ct18cMjis8nD2v0jpxJukTGYXuoKYhs3B9EKKf
	ecfZbNDMEFGWPDubZI6yG6GkOn/00oo/oy9KvfUHoa3v1Btt3HOGLyu6OSdt1ZWu9zI7
	vY4w==
X-Gm-Message-State: AIkVDXIJgWOGJ6eDL68LbpKDJskI8he4K3lM01C0bV4vJdWGGZE7ce+7P5LVZKjyfl5p84gTpNVlA3Tso50Qbg==
X-Received: by 10.223.169.85 with SMTP id u79mr29847069wrc.169.1484691225715; 
	Tue, 17 Jan 2017 14:13:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.154.68 with HTTP; Tue, 17 Jan 2017 14:13:15 -0800 (PST)
In-Reply-To: <1483977924-14522-8-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-8-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 17 Jan 2017 14:13:15 -0800
X-Google-Sender-Auth: guo6_7z54T_0vVbDwLI4OcDOMX4
Message-ID: <CAKmqyKMLVkVYtpxJayraSwSbO8Dhw7pqw+wQRNmxfo3gVRUfEw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 07/18] hw/intc/gicv3: Add
 data fields for virtualization support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X9DOT5pHWbUr

On Mon, Jan 9, 2017 at 8:05 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> As the first step in adding support for the virtualization
> extensions to the GICv3 emulation:
>  * add the necessary data fields to the state structures
>  * add the fields to the migration state, as a subsection
>    which is only present if virtualization is enabled
>
> The use of a subsection means we retain migration
> compatibility as EL2 is not enabled on any CPUs currently.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  include/hw/intc/arm_gicv3_common.h | 18 ++++++++++++++++++
>  hw/intc/arm_gicv3_common.c         | 25 +++++++++++++++++++++++++
>  hw/intc/arm_gicv3_cpuif.c          | 13 +++++++++++++
>  3 files changed, 56 insertions(+)
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index beb2c77..665d3f8 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -38,6 +38,9 @@
>  /* Number of SGI target-list bits */
>  #define GICV3_TARGETLIST_BITS 16
>
> +/* Maximum number of list registers (architectural limit) */
> +#define GICV3_LR_MAX 16
> +
>  /* Minimum BPR for Secure, or when security not enabled */
>  #define GIC_MIN_BPR 0
>  /* Minimum BPR for Nonsecure when security is enabled */
> @@ -175,6 +178,21 @@ struct GICv3CPUState {
>      uint64_t icc_igrpen[3];
>      uint64_t icc_ctlr_el3;
>
> +    /* Virtualization control interface */
> +    uint64_t ich_apr[3][4]; /* ich_apr[GICV3_G1][x] never used */
> +    uint64_t ich_hcr_el2;
> +    uint64_t ich_lr_el2[GICV3_LR_MAX];
> +    uint64_t ich_vmcr_el2;
> +
> +    /* Properties of the CPU interface. These are initialized from
> +     * the settings in the CPU proper.
> +     * If the number of implemented list registers is 0 then the
> +     * virtualization support is not implemented.
> +     */
> +    int num_list_regs;
> +    int vpribits; /* number of virtual priority bits */
> +    int vprebits; /* number of virtual preemption bits */
> +
>      /* Current highest priority pending interrupt for this CPU.
>       * This is cached information that can be recalculated from the
>       * real state above; it doesn't need to be migrated.
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 0ee67a4..16b9b0f 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -49,6 +49,27 @@ static int gicv3_post_load(void *opaque, int version_id)
>      return 0;
>  }
>
> +static bool virt_state_needed(void *opaque)
> +{
> +    GICv3CPUState *cs = opaque;
> +
> +    return cs->num_list_regs != 0;
> +}
> +
> +static const VMStateDescription vmstate_gicv3_cpu_virt = {
> +    .name = "arm_gicv3_cpu/virt",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = virt_state_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64_2DARRAY(ich_apr, GICv3CPUState, 3, 4),
> +        VMSTATE_UINT64(ich_hcr_el2, GICv3CPUState),
> +        VMSTATE_UINT64_ARRAY(ich_lr_el2, GICv3CPUState, GICV3_LR_MAX),
> +        VMSTATE_UINT64(ich_vmcr_el2, GICv3CPUState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_gicv3_cpu = {
>      .name = "arm_gicv3_cpu",
>      .version_id = 1,
> @@ -75,6 +96,10 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>          VMSTATE_UINT64_ARRAY(icc_igrpen, GICv3CPUState, 3),
>          VMSTATE_UINT64(icc_ctlr_el3, GICv3CPUState),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_gicv3_cpu_virt,
> +        NULL
>      }
>  };
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 35e8eb3..d2f859c 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -36,6 +36,12 @@ static bool gicv3_use_ns_bank(CPUARMState *env)
>      return !arm_is_secure_below_el3(env);
>  }
>
> +/* The minimum BPR for the virtual interface is a configurable property */
> +static inline int icv_min_vbpr(GICv3CPUState *cs)
> +{
> +    return 7 - cs->vprebits;
> +}
> +
>  static int icc_highest_active_prio(GICv3CPUState *cs)
>  {
>      /* Calculate the current running priority based on the set bits
> @@ -1081,6 +1087,13 @@ static void icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>      cs->icc_ctlr_el3 = ICC_CTLR_EL3_NDS | ICC_CTLR_EL3_A3V |
>          (1 << ICC_CTLR_EL3_IDBITS_SHIFT) |
>          (7 << ICC_CTLR_EL3_PRIBITS_SHIFT);
> +
> +    memset(cs->ich_apr, 0, sizeof(cs->ich_apr));
> +    cs->ich_hcr_el2 = 0;
> +    memset(cs->ich_lr_el2, 0, sizeof(cs->ich_lr_el2));
> +    cs->ich_vmcr_el2 = ICH_VMCR_EL2_VFIQEN |
> +        (icv_min_vbpr(cs) << ICH_VMCR_EL2_VBPR1_SHIFT) |
> +        (icv_min_vbpr(cs) << ICH_VMCR_EL2_VBPR0_SHIFT);
>  }
>
>  static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
> --
> 2.7.4
>
>
