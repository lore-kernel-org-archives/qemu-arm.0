Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp608724ejf;
        Fri, 23 Feb 2024 06:55:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV2Egrx80BD4xYIJBHUkAVa2oi+OJRBriddoqxW0m4KB/ka1D0YajSOjokPg/lRAJP6X/3J1mWqgZ49iTLipKtjbYCmyFr4
X-Google-Smtp-Source: AGHT+IFAj3uOHHHsAXi0LUfw/qoU2GJIVZejy4pARrgN8uNILwJZzJgwxJ9SFQt+iR8MuS4XRnPH
X-Received: by 2002:a05:6870:524f:b0:21e:6d57:81f7 with SMTP id o15-20020a056870524f00b0021e6d5781f7mr18725oai.17.1708700134699;
        Fri, 23 Feb 2024 06:55:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708700134; cv=none;
        d=google.com; s=arc-20160816;
        b=C89rjRVBpArwIS5vZKSU23GAFpgszmRYWZ4B0Ow2xqDz7IJE/uYsdm3CHR6hwbxIpe
         MQEBdUW/M17ZKtcGdHZFxYdg7AiLvslHuEdESVe6ifERTO3rAMIqF1WmGY1UyQLdYUc3
         fQyzyLihL4rceqSAEZOXGdnJNiAQ1mhyjtyr4ZpxQtf9avLBsuh18HfNxUco9CD1yLEC
         wUKzGFoFNt/lPrl9vqSHM03k1FLlJUg+4HAJ/d3udHRIptoDNvyobyC7wmlM+0dl3HwO
         Qq4GSTwQX71LDfO8gSHweclp7NKSU4k4j0VdRciEkYppmKG43BtZvv/wr+3ZvC+HYu0T
         E+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SVrfzhpcE1N1cO/77qkeeLpyBFhnWsyghu2a7bD9Nxc=;
        fh=ODGVi5NGGLIcxW9pZqsfP0aqOG+XOKUjw+q5q4lJqQA=;
        b=Y/Mu+fZnZJ43bMFzaxBPtERPtHy5t7terEWosmBSnsA2UBsz+2mYqpxLoUBICbk3gf
         acuSmxnFgrJrlmZKh3JOFCy8g4og759Bcx32nzqqM5usUN7TwDLo9cqTKzXockBxALsU
         6da6G16s5sedOxv0H8sLMzb5lHjDrDmKDwf/ZPjC12+dXK+tm5L04bpOv1HqWV/pCUbp
         htvjz2vxS3s5sF9r2mhxCLBkIODh3CFQBq2uVpnPYyN9yMsishXqjSjCRl6fCYccif56
         xXZhViQ1MIN3mb6c5+i8VSqYK4S6Foka9QeqVV+Y2wAcYRdIytdY5/792zv+Hx4+oBgB
         Mz4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=heuJDTTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a05620a441000b00787b9838ee6si545246qkp.134.2024.02.23.06.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 06:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=heuJDTTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdWx0-0000ef-Io; Fri, 23 Feb 2024 09:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdWna-0005wN-Vd
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 09:45:15 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdWnY-0004B7-V4
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 09:45:14 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563f675be29so546820a12.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 06:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708699511; x=1709304311; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVrfzhpcE1N1cO/77qkeeLpyBFhnWsyghu2a7bD9Nxc=;
 b=heuJDTTNQGzFjTl5GjotT8C4zsfCkKMGGYbvQWxvcYRGR+espzt2B7trPCYo0d031K
 e57eMwUOWRO/GTvmi+U6adyrTYl2S2Fe7UFQtExJ9OESKxRT1bZXlOpFiLyDl4OCxTNE
 NyOcxGo12KYFB6MRdZVQHB42vVCFiSQK1M1YpHgbnIr65mV7d2n6KSNWnK61+lolzk8D
 zQMXWZjYl9EpQ/dEedaoEZT1MRO0OBsgz1NCPtLVLALZulBbCGHsWiIOwbM3vjcDjeuS
 40U0fglm+Koi6idEweB4TcX1QKRSQ2CTbTHwJelCEx9BnDpu5ogQYtMqrhKu9GokJHUG
 BDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708699511; x=1709304311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVrfzhpcE1N1cO/77qkeeLpyBFhnWsyghu2a7bD9Nxc=;
 b=ogp/V6ODi30TZJ8jrFOJZ8jG2CjIycRjdufQvLZZz3O+WGTDbu16CHIJf2mtXbj/AF
 IsaZaCFmdP8ybtV57e9GsThAuvalPAsAeJxw0u/zA/Th4EunEKbL2MXF1zyEeU2kT7uP
 ZT0A4DwwHWUfaUmpFykHTPJupqY247BjfQF5nFdtMxMnQIgV4f9jnGlR3wCB+hRS69LL
 7C8Jbi5IpUcaDV1JhLmn98IUtmEIQ2w+of0N1yjO0mwor5+Mp3n8Kw3CGhsIPegJCsbU
 P0JJApmWptAPhESx6VNwQcVgBFXG3c9mSKpF5pLmAnCLUv/sEbjq4EWybHQwF8M+EFwD
 iddQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuKZa0apbA9xcry1oUdeFKCL2w15y76tRC4GTsalB//Jv7S/Cp7Z5gTjnQNHje7ES8qI5LexcDP+bhofK4ckj+6zhd
X-Gm-Message-State: AOJu0YwO1GN6EHiFc1Tf0weA7vq3TN2kgO7rlj3aKEnRHbx46P2q7TTO
 FTZrSuAvjadHDp/ILO5B1HV6nrs86QTRLJz8fCXKRqiloD7zZ8qf0RRTI3FJlAM1ZOxMriwO9o2
 fWznKGlsLGAGYfvOEC0fiPER8zh6sGNvTZuPtKA==
X-Received: by 2002:aa7:cccd:0:b0:565:8130:5b91 with SMTP id
 y13-20020aa7cccd000000b0056581305b91mr15722edt.34.1708699511173; Fri, 23 Feb
 2024 06:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
 <20240219200908.49551-3-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240219200908.49551-3-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 14:44:59 +0000
Message-ID: <CAFEAcA_EVoayec6Qec4EoU6atXhG7fdqb+QtFEvSQge88xJNPg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] Add an internal clock multiplexer object
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OeYH9z2uOHdE

On Mon, 19 Feb 2024 at 20:12, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> This object is used to represent every multiplexer in the clock tree as
> well as every clock output, every presecaler, frequency multiplier, etc.
> This allows to use a generic approach for every component of the clock tr=
ee
> (except the PLLs).
>
> Wasn't sure about how to handle the reset and the migration so used the
> same appproach as the BCM2835 CPRMAN.

I think hw/misc/zynq_sclr.c is also probably a good model to look at.

AIUI the way it works is:
 * input Clock objects must be migrated
 * output Clock objects do not need to be migrated
 * your reset needs to be a three-phase one:
   - in the 'enter' method you reset register values (including
     all the values that define oscillator frequencies, enable bits, etc)
   - in the 'hold' method you compute the values for the output clocks
     as if the input clock is disabled, and propagate them
   - in the 'exit' method you compute the values for the output clocks
     according to the value of the input clock, and propagate them



> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/misc/stm32l4x5_rcc.c                   | 158 ++++++++++++++++++++++
>  hw/misc/trace-events                      |   5 +
>  include/hw/misc/stm32l4x5_rcc.h           | 119 ++++++++++++++++
>  include/hw/misc/stm32l4x5_rcc_internals.h |  29 ++++
>  4 files changed, 311 insertions(+)
>
> diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
> index 38ca8aad7d..ed10832f88 100644
> --- a/hw/misc/stm32l4x5_rcc.c
> +++ b/hw/misc/stm32l4x5_rcc.c
> @@ -36,6 +36,132 @@
>  #define LSE_FRQ 32768ULL
>  #define LSI_FRQ 32000ULL
>
> +static void clock_mux_update(RccClockMuxState *mux)
> +{
> +    uint64_t src_freq, old_freq, freq;
> +
> +    src_freq =3D clock_get_hz(mux->srcs[mux->src]);
> +    old_freq =3D clock_get_hz(mux->out);

You should try to avoid using clock_get_hz() and clock_update_hz()
when doing clock calculations like this. There is inherently
rounding involved if the clock isn't running at an exact number of Hz.
It's best to use clock_get() and clock_set(), which work with
the clock period specified in units of 2^-32ns.


> +
> +    if (!mux->enabled || !mux->divider) {
> +        freq =3D 0;
> +    } else {
> +        freq =3D muldiv64(src_freq, mux->multiplier, mux->divider);

Consider whether you can use the Clock's builtin period
multiplier/divider (clock_set_mul_div()).

> +    }
> +
> +    /* No change, early return to avoid log spam and useless propagation=
 */
> +    if (old_freq =3D=3D freq) {
> +        return;
> +    }
> +
> +    clock_update_hz(mux->out, freq);
> +    trace_stm32l4x5_rcc_mux_update(mux->id, mux->src, src_freq, freq);
> +}
> +
> +static void clock_mux_src_update(void *opaque, ClockEvent event)
> +{
> +    RccClockMuxState **backref =3D opaque;
> +    RccClockMuxState *s =3D *backref;
> +    /*
> +     * The backref value is equal to:
> +     * s->backref + (sizeof(RccClockMuxState *) * update_src).
> +     * By subtracting we can get back the index of the updated clock.
> +     */
> +    const uint32_t update_src =3D backref - s->backref;
> +    /* Only update if the clock that was updated is the current source*/
> +    if (update_src =3D=3D s->src) {
> +        clock_mux_update(s);
> +    }
> +}
> +
> +static void clock_mux_init(Object *obj)
> +{
> +    RccClockMuxState *s =3D RCC_CLOCK_MUX(obj);
> +    size_t i;
> +
> +    for (i =3D 0; i < RCC_NUM_CLOCK_MUX_SRC; i++) {
> +        char *name =3D g_strdup_printf("srcs[%zu]", i);
> +        s->backref[i] =3D s;
> +        s->srcs[i] =3D qdev_init_clock_in(DEVICE(s), name,
> +                                        clock_mux_src_update,
> +                                        &s->backref[i],
> +                                        ClockUpdate);
> +        g_free(name);
> +    }
> +
> +    s->out =3D qdev_init_clock_out(DEVICE(s), "out");
> +}
> +
> +static void clock_mux_reset_hold(Object *obj)
> +{ }
> +
> +static const VMStateDescription clock_mux_vmstate =3D {
> +    .name =3D TYPE_RCC_CLOCK_MUX,
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(id, RccClockMuxState),
> +        VMSTATE_ARRAY_CLOCK(srcs, RccClockMuxState,
> +                            RCC_NUM_CLOCK_MUX_SRC),
> +        VMSTATE_CLOCK(out, RccClockMuxState),

Output clocks don't need VMSTATE_CLOCK lines. (We trust
the device on the other end to migrate its state as needed.)

> +        VMSTATE_BOOL(enabled, RccClockMuxState),
> +        VMSTATE_UINT32(src, RccClockMuxState),
> +        VMSTATE_UINT32(multiplier, RccClockMuxState),
> +        VMSTATE_UINT32(divider, RccClockMuxState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};


> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 62a7599353..d5e471811c 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -177,6 +177,11 @@ stm32l4x5_exti_write(uint64_t addr, uint64_t data) "=
reg write: addr: 0x%" PRIx64
>  # stm32l4x5_rcc.c
>  stm32l4x5_rcc_read(uint64_t addr, uint32_t data) "RCC: Read <0x%" PRIx64=
 "> -> 0x%" PRIx32 ""
>  stm32l4x5_rcc_write(uint64_t addr, uint32_t data) "RCC: Write <0x%" PRIx=
64 "> <- 0x%" PRIx32 ""
> +stm32l4x5_rcc_mux_enable(uint32_t mux_id) "RCC: Mux %d enabled"
> +stm32l4x5_rcc_mux_disable(uint32_t mux_id) "RCC: Mux %d disabled"
> +stm32l4x5_rcc_mux_set_factor(uint32_t mux_id, uint32_t old_multiplier, u=
int32_t new_multiplier, uint32_t old_divider, uint32_t new_divider) "RCC: M=
ux %d factor changed: multiplier (%u -> %u), divider (%u -> %u)"
> +stm32l4x5_rcc_mux_set_src(uint32_t mux_id, uint32_t old_src, uint32_t ne=
w_src) "RCC: Mux %d source changed: from %u to %u"
> +stm32l4x5_rcc_mux_update(uint32_t mux_id, uint32_t src, uint64_t src_fre=
q, uint64_t new_freq) "RCC: Mux %d src %d update: src_freq %" PRIu64 " new_=
freq %" PRIu64 ""

You don't need the trailing "" in this kind of string
concatenation with a PRIu64 or similar: adding the empty
string on the end of a string has no effect.

thanks
-- PMM
