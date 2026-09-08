Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033DAC79F9E
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 15:45:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3y11-0007bs-Se; Tue, 08 Sep 2026 11:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3y0y-0007bN-2i
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 11:45:40 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3y0w-0007Go-60
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 11:45:39 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-866e57f63a3so52945727b3.3
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 08:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788882337; cv=none;
 d=google.com; s=arc-20260327;
 b=LPUgQ3t+4NZHpsFIAIP0/A5pleFTdIvM7li83YdxJMu51yiGv2/WDCPGiy3FH4z4nJ
 QHGDflfkA25XfvOpQ5WNmozFFiVBNP/kNIy3o/nXCjJ/6zl9QWZ+s/d5ph45G75Kv7+G
 VfEPqX7VkpxBK/DIoSJiFTI7hNT2KzO9CiEEoPtZURArvCIIEPXkV1hSR9/9D0oAb7By
 kj4C6V1zTcO5lXDQbyV6DbnkCQl8odW6C7+D86s11LIPjAFNBhd0+BZwvkb7FJtcodqo
 3RIrSwzNWwG6UG7dCg2ot74tQNjfLGf1DY5rAWw/78yufixa4Xly05MvTZ3TMCfzOXp8
 tVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dXNhbUTQLyXLjddhQo0c/S3BfE2+aYqa9Ck0ukPYbl0=;
 fh=RB33IjzJpT0om7GwxiigGI63K1LLJMr7UgD3BSp5fJc=;
 b=E8GPM1VZnm5kdCxrisHEqETKcSHCZd+e9h+dibi92zhabXzIzduaf5Q/+FNiar8X/G
 DRBsCntDuw0fguBnRItIOSYPco0+R7t3tRwALgZtDVN1uRigUXUd4lbS5nSxDiyOnCo1
 Bd7wFoLypdWwv6vQjOt/OZO0Fe9XdZap2S0Y3UHNXAuDiGPjeG/99nIDgTF2IMPavWFe
 oJNUwt02NONbNAfvirDiCmfgZ+9gw6UFY/pJguO6tMox4zKgSn3QdyFIvLWQxt/hMkAt
 NRoWJxxPph6zcrIW23Lmuze6Puo4f5/QP7JXzk8BNPMnpK2xmbK9YZziDta1AUyIpF0o
 IVnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788882337; x=1789487137; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dXNhbUTQLyXLjddhQo0c/S3BfE2+aYqa9Ck0ukPYbl0=;
 b=H2Q9IvnwNH9CU2e2uLuh2yLdrKUwjvdMp8QcknsU1pO66fbAtzlF8Qj6CdbSNafaak
 BSAdn1U+COoEzIqgpZ998KWPuMTewgTIA11fJUX0tcxZBgqMa9cyZELZt7eymZkRqiF7
 bmm39VRfzmaUggph6dE3GceLYCcp51pfeNk1REIuaprUaBK/wcPbA6LaRlcE26Z2TMyu
 UnTRymy1JPj2qSYmYlMcQgjciw3zXt5ke0fybFYWECBzyuTXcrwwZKOLFFacrLy+t2Tz
 QJVbuZjEJ/3HUTYTVbr7nkf1LGAhKB4FsIp6MigIYMXFtmagTG9dwpe5dC6L+VCO3rmG
 Hlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788882337; x=1789487137;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dXNhbUTQLyXLjddhQo0c/S3BfE2+aYqa9Ck0ukPYbl0=;
 b=md3aRK/CJr2keKz7jtxiTXA9YaK+DXy9h8H1phA699KIuwS4imVtD727AiqKGVHnuc
 Ff0tSddDuj9nEzIH3P/cKM/69d+vxbVNpJR3rGaTayMetI9ydZDtan89cwb1zDm8pJEx
 49q2Op5rtq8ojBfFjpoMEDoWk3SgsnFMP8IcqpANbxH3I2knPSnbLJ11h9w73Ir15pcI
 U1s4kPlOGp9p7EfFEbmfAEPbWeEGhKihKXI65XS7E8boiQHs1mpNVQJeMxnUIAny0ahB
 bhNQzafw2StOCeDuJ7DNiRGy+KVj1WyEr4A9AGMakdkPpD2MDEYMILmWGbtJROcKOMG2
 PnPQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByPlunpUfKywWFJPvY1BUBdC+Mwgy55p/W7AMCyZSOm76IrACTW7TjOLe1w+Hvtxl4Qg+9utz1QOg==@nongnu.org
X-Gm-Message-State: AFuF++lT5LPwj3Y7gZbgq0dBgJw+CYl7abmwscih3HJ/bzbghP/jhcGo
 Yv1kdlbpSDbdo/MlJX76Clmtv7aH819jygnkhx9XLmrZiqoj3mWStd3NYpWy3dwz+vpBHBrqhXV
 cRCmLw0NgBw05G44XBwlM7++B8wizULw73iBdk2gSZw==
X-Gm-Gg: AYBFou1FWtYw8CgbsIZ2BlxtbI2S5cxwiW60d0KiwrcX6mWYx4vZEHVPlvBgUxl0Sy/
 wnz38BpSRhYGAOPk+JqACrBd9tzAjKVb3v5jUcQHyhoMxzMM/iJnlXN0Oe1irUJ09FvZjmxnEXF
 kn71BJenIKrC/l8XgGEa4fVzMH4VOrFXuuzt8poydM8JZuEklSq9iscJJ0J4LCp1h4W3BwjwXET
 Jl17t5ArgbB4z3vPLRnnBlcCIz8Ycewb0XYlYOd4+XmITOR7aDXTqFSPa5iS5Fa5aXMd7fUAwd5
 Swx9AlARcKt+GBk2c8h7RsosjXYgpYm29zRczl33RrExlTr5J3T9lNQqovVdyGrblfR2NgPhjQV
 /x5AcTeFEO41RHvaG1IDWibc4NE/e
X-Received: by 2002:a05:690c:698b:b0:81e:5d2e:89c8 with SMTP id
 00721157ae682-871246aaa7dmr112500817b3.14.1788882335996; Tue, 08 Sep 2026
 08:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260903142212.1451770-1-alex.bennee@linaro.org>
 <20260903142212.1451770-2-alex.bennee@linaro.org>
In-Reply-To: <20260903142212.1451770-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 16:45:24 +0100
X-Gm-Features: AcwNN1XwYS1q5YCIlWYka3RceK_vNqHIDQQ97YREPB1hQd8UvcHlfrxqcYdFuqo
Message-ID: <CAFEAcA8i4Pj1_uHyQnCd3xoxLKFxF81PoPXLRRyp+rw4kQCOkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/intc: include CPUID for SGIs on GIC HPPIR reads
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 3 Sept 2026 at 15:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> In ARM GICv2 (and GICv1), reads of the Highest Priority Pending
> Interrupt Register (GICC_HPPIR and GICV_HPPIR) must include the
> requesting CPU ID in bits [12:10] when the highest priority pending
> interrupt is an SGI (interrupt IDs 0-15).

This is true. The SGI field also is in the GICC_IAR
(interrupt acknowledge register) and needs to be accepted
for writes to GICC_EOIR (end of interrupt). Currently we don't
do any of that (we don't fill in the SGI field for reads
from GICC_IARR, and we just ignore the SGI field for writes
to GICC_EOIR rather than using it.

The important thing here is that "an SGI of ID X from source CPU Y"
is different (has its own pending state, etc) from "an SGI of ID X
from source CPU Z").

Perhaps we should in retrospect have made the interrupt ID values
for SGIs include the CPU source ID part, rather than dropping the
source ID and then trying to bolt it back on afterwards,
but trying to change that at this point is probably a bit invasive.

> Introduce gic_get_sgi_source() to look up the source CPU ID for both
> physical and virtual interfaces, and include it in bits [12:10] of the
> HPPIR read value for SGIs.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4402
> AI-used-for: initial prototype changes
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> NOTE:
>   - the initial patch was more expansive and included re-factoring
>     gic_clear_pending_sgi to use the new helper. I dumped that change
>     so I could reason through the fix on its own.
> ---
>  hw/intc/arm_gic.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 4d4b79e6f34..181d17ead7c 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -568,6 +568,17 @@ static void gic_drop_prio(GICState *s, int cpu, int =
group)
>      s->running_priority[cpu] =3D gic_get_prio_from_apr_bits(s, cpu);
>  }
>
> +static inline int gic_get_sgi_source(GICState *s, int irq, int cpu)
> +{
> +    if (gic_is_vcpu(cpu)) {
> +        uint32_t *lr_entry =3D gic_get_lr_entry(s, irq, cpu);
> +        return GICH_LR_HW(*lr_entry) ? 0 : GICH_LR_CPUID(*lr_entry);
> +    } else {
> +        assert(s->sgi_pending[irq][cpu] !=3D 0);
> +        return ctz32(s->sgi_pending[irq][cpu]) & 0x7;

Why mask with 7 ? Unless something's gone wrong there shouldn't
be any unexpected bits set.

> +    }
> +}
> +
>  static inline uint32_t gic_clear_pending_sgi(GICState *s, int irq, int c=
pu)
>  {
>      int src;
> @@ -1648,8 +1659,16 @@ static MemTxResult gic_cpu_read(GICState *s, int c=
pu, int offset,
>          *data =3D gic_get_running_priority(s, cpu, attrs);
>          break;
>      case 0x18: /* Highest Pending Interrupt */
> -        *data =3D gic_get_current_pending_irq(s, cpu, attrs);
> +    {
> +        uint16_t p =3D gic_get_current_pending_irq(s, cpu, attrs);
> +
> +        if (p < GIC_NR_SGIS && s->revision !=3D REV_11MPCORE) {

Why "not if 11mpcore" ? The 11mpcore TRM says it has the SGI
field for HPPIR and IAR:

https://support.arm.com/documentation/ddi0360/f/mpcore-distributed-interrup=
t-controller/cpu-interrupt-interface-registers/highest-pending-interrupt-re=
gister--0x18?lang=3Den

> +            *data =3D p | (gic_get_sgi_source(s, p, cpu) << 10);
> +        } else {
> +            *data =3D p;
> +        }
>          break;
> +    }
>      case 0x1c: /* Aliased Binary Point */
>          /* GIC v2, no security: ABPR
>           * GIC v1, no security: not implemented (RAZ/WI)
> --
> 2.47.3

-- PMM

