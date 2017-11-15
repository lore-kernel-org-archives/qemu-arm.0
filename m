Received: by 10.223.150.237 with SMTP id u100csp4245253wrb;
        Tue, 14 Nov 2017 17:14:52 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa5mmsrY0D6r/7Hyyw/NtrlPClNJoGWe7DDCpvRfMHD2ofNr3kFaC834HcV9S5HXNVS0bet
X-Received: by 10.37.91.135 with SMTP id p129mr3162301ybb.439.1510708492293;
        Tue, 14 Nov 2017 17:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510708492; cv=none;
        d=google.com; s=arc-20160816;
        b=gXflBPuXAEMUWZzdhbWxf/Uo53NhyM1GU4PVmchQYy456QTkFZ2/JLZ6RT7NMW82QL
         J0XfDQFB3ggj5+ibkmus20rPQDI+HruiKrEmJ9bE42Ikn6HwVzYLg9i9NY3500HEKDx8
         z5nNl2W/VbznFqf6/OLSxpUGyLvoTZa19Q5SMICNtSoCUYHr6QGgpvJ/d4JzO0yWsS7V
         85vS0gWm3+1UwEAzTFYlQFlPDl7hiuJ0yDz0nVQQYC0FnFYonIizpWzTOwpPTus2ZNQM
         dRRc5d5gEijdSaknEx38oA71R/J+qX0WIqy0Z3bRdFGXyDclw9R2Q3qiTMXfAi77tEO8
         F0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vw6p0ftco2i7XIitMWLGsYBKIinFFc/wr1dsv7cEZAA=;
        b=B6xhrXPvJ6TQTP+ruip1c9qHd4XxblHPTqTWolIZSmRirrmrZEGEuvFkjoAuwhHTJj
         py0nDhrwEplndeLO8fAPfDFeWVdyeSxS1zi7RbIEHwSnknOSayL9HsHsTBmWmSPzMv1W
         ZzlAvvwXSxeFg9BLsHPeaLDwhrsYIeU82faNKT1hX7T4drRQAMq7C6W8AemPp5qKtgRp
         OrXLjqZe4YbGBG0WLsE3ZmP3sOytAJvnub81n4EKjopxBLjvKR9iUmGFL4Bld3vOd/08
         xUqw3ZrJw+BTbVDw23aNIi1edbkIJXHVw4215NtdMkm1/H9zp2rT3dYnSIT+YEq8N5Ua
         Yn+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=edZ4vw41;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 193si2920559ybe.576.2017.11.14.17.14.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Nov 2017 17:14:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=edZ4vw41;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEmHz-0004BI-Nh
	for alex.bennee@linaro.org; Tue, 14 Nov 2017 20:14:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eEmHq-0004BB-TQ
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 20:14:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eEmHp-0008Cp-NY
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 20:14:42 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:51191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eEmHp-0008CO-DP; Tue, 14 Nov 2017 20:14:41 -0500
Received: by mail-wr0-x243.google.com with SMTP id p96so19074417wrb.7;
	Tue, 14 Nov 2017 17:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vw6p0ftco2i7XIitMWLGsYBKIinFFc/wr1dsv7cEZAA=;
	b=edZ4vw41ilZ/FBv5xlUdENaelxYAX5amJuM91NP0TfR7dAjFQtAffv5OpK9XhrSEVa
	cWssFrMO1IAKlCO1aOgseMx6zffoPbxndgHItuOcwp60DHaWLgVZEdugQx48QPD2Nql/
	ZA1u1opWcEadL4DgQYp+dUiepWJJGbNlbfWHaw2Xw3jKgnmbyWxZJLfFoHWwgTUpNhBf
	3d+5mkPH9Ca8csfJE0tzeLA/7p8LOjjoOdxImem5KxbtGPgtq4VJT5zBJmZRzoRDec9z
	8pXGCvbWqm8Cupjqpp3AXWltOJQ0v/I9gXpBqH62mD/HCzIXzvSmj/0KuamQ/Pcm9yR1
	3nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vw6p0ftco2i7XIitMWLGsYBKIinFFc/wr1dsv7cEZAA=;
	b=PXa2YrvEKlTDgD7Jn7OEYSVRufY74xl7MtE/WKlXR7DetZiiwRjgNeTJw+clEWD/4m
	IvmIejRrfmphtYJXbGtl5Hn1hQcjx6lb8Z22L66eHZAUCObA4wW5OVj0Cy0X5/v6sgs/
	6NZ0wNHAGFzKtHOM42eT7jvatNODwi/nrUCscKmmf+vjPgr2HfGKE5+b5JNnePvWEa4U
	eoK39lprwX0bBqeZ2GBrWAnVcOaHacMJzjyLdCkJJp0/6vfnaznK6nXodcO9H2521l8g
	a6QLKAMrjD/IiV/oanDpAN6ENiSSsvOaSN9COmR+02PgQl8M+FIpeRATrqs6KWfon/iK
	YLsQ==
X-Gm-Message-State: AJaThX5n155ZrVDeEOA8Y1gHnvjExTDmOKGcXOFyTHDQYZC6LeGZI2lB
	r/1fPS4TMzrdfalyiNrcRXx2AZjvgAI0ybujmVY=
X-Received: by 10.223.182.3 with SMTP id f3mr12375803wre.127.1510708480055;
	Tue, 14 Nov 2017 17:14:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Tue, 14 Nov 2017 17:14:09 -0800 (PST)
In-Reply-To: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
References: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Nov 2017 17:14:09 -0800
Message-ID: <CAKmqyKORH2jwGP4ULZv6B8=262OhznHkwOzONd9HFQoJkKzD=A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.11] target/arm: Report
 GICv3 sysregs present in ID registers if needed
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fqWCtdHUj9wL

On Tue, Nov 7, 2017 at 7:01 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The CPU ID registers ID_AA64PFR0_EL1, ID_PFR1_EL1 and ID_PFR1
> have a field for reporting presence of GICv3 system registers.
> We need to report this field correctly in order for Xen to
> work as a guest inside QEMU emulation. We mustn't incorrectly
> claim the sysregs exist when they don't, though, or Linux will
> crash.
>
> Unfortunately the way we've designed the GICv3 emulation in QEMU
> puts the system registers as part of the GICv3 device, which
> may be created after the CPU proper has been realized. This
> means that we don't know at the point when we define the ID
> registers what the correct value is. Handle this by switching
> them to calling a function at runtime to read the value, where
> we can fill in the GIC field appropriately.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Is this going to make it into 2.11?

Alistair

> ---
> In retrospect I think having the sysregs emulation in the
> GIC device was a bit of a design error -- we should have
> split it like the hardware does, with a defined protocol
> between the GIC and the CPU interface. (In real hardware the
> CPU can have the GIC system registers even though it's not
> connected to an actual GICv3, and we don't/can't emulate
> that with our current design.)
> ---
>  target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f61fb3e..35c5bd6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4549,6 +4549,33 @@ static void define_debug_regs(ARMCPU *cpu)
>      }
>  }
>
> +/* We don't know until after realize whether there's a GICv3
> + * attached, and that is what registers the gicv3 sysregs.
> + * So we have to fill in the GIC fields in ID_PFR/ID_PFR1_EL1/ID_AA64PFR0_EL1
> + * at runtime.
> + */
> +static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +    uint64_t pfr1 = cpu->id_pfr1;
> +
> +    if (env->gicv3state) {
> +        pfr1 |= 1 << 28;
> +    }
> +    return pfr1;
> +}
> +
> +static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +    uint64_t pfr0 = cpu->id_aa64pfr0;
> +
> +    if (env->gicv3state) {
> +        pfr0 |= 1 << 24;
> +    }
> +    return pfr0;
> +}
> +
>  void register_cp_regs_for_features(ARMCPU *cpu)
>  {
>      /* Register all the coprocessor registers based on feature bits */
> @@ -4573,10 +4600,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_pfr0 },
> +            /* ID_PFR1 is not a plain ARM_CP_CONST because we don't know
> +             * the value of the GIC field until after we define these regs.
> +             */
>              { .name = "ID_PFR1", .state = ARM_CP_STATE_BOTH,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 1,
> -              .access = PL1_R, .type = ARM_CP_CONST,
> -              .resetvalue = cpu->id_pfr1 },
> +              .access = PL1_R, .type = ARM_CP_NO_RAW,
> +              .readfn = id_pfr1_read,
> +              .writefn = arm_cp_write_ignore },
>              { .name = "ID_DFR0", .state = ARM_CP_STATE_BOTH,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4692,10 +4723,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>           * define new registers here.
>           */
>          ARMCPRegInfo v8_idregs[] = {
> +            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST because we don't
> +             * know the right value for the GIC field until after we
> +             * define these regs.
> +             */
>              { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
> -              .access = PL1_R, .type = ARM_CP_CONST,
> -              .resetvalue = cpu->id_aa64pfr0 },
> +              .access = PL1_R, .type = ARM_CP_NO_RAW,
> +              .readfn = id_aa64pfr0_read,
> +              .writefn = arm_cp_write_ignore },
>              { .name = "ID_AA64PFR1_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
> --
> 2.7.4
>
>
