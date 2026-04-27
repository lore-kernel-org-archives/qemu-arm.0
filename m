Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2CCFF885E
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:17:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHI5t-0007mK-3P; Mon, 27 Apr 2026 05:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHI5q-0007eD-PQ
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:17:30 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHI5o-0003fC-Q8
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:17:30 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-651cfaa21e6so8622749d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777281446; cv=none;
 d=google.com; s=arc-20240605;
 b=gMPuVZ50Y08E3ZlbsPGj8CLR1Hj/p4c1BvuOZpr3cD07y03GuQdmz9VtHUCakiRNA4
 3glY0SaCwGqfSOATaarWucm/lP18TNP20nT1fJ880c19aCJJVvujGU5Kw/BgEUiquhHo
 Gwx1fOtJMvc0vxWwcIa0qy4HByS9630gfWwB8IY7Qf4kjMzKeHfI5Yg2Chrvy5SHwTwu
 yH1hOGNKp8WwfxxhVbYjYQ72BIU8y7xH+fXhKLpiqmlVR5QPxQSse9A98V8VKj0F+zbS
 xo/QQOnwzJNAjU3L2aOYoOhOWvHFXCkyHm4QyGp5MojuIcGTG22NgGb01XK0D+Yv/1Oe
 l8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=drNCgVfz0s4LsuWyXJ5uke4sGBIfgQAtfANUdTvKA7Y=;
 fh=27SVFq72RNkvVvDfbG2v+JwuU2i5aGYNggWrbOCs3m4=;
 b=PVyafnvjEMsPPgKf1MGl3055G32F9Qzg0GF58ZM7QEytNRJFiMUPiwVmWU7JzVP6E1
 bfYNozrQssPArOm3gSuEoqZthlIRd+ilFcO1a7ooFpqpirbZ8CEV4XKZoRU3uqxeFHao
 KRU70033TyiuNfA9FsIyioTe6hJ7DipxDlrKoxjyRAQgVmeHSagnDHFw2l8/1eU1Ifw4
 bOzbAI7PbAGJsQf3ut55DoFOhK9KKfJimGtz2rIHVtWtlb32stJGBpkliojkAZt/L63x
 j1XWKt6/pt6XkI0XXC0HTmSJPwIB77ZPCmMe1mnRD8SIviELA6Tj7HnXg5M0eV++NUlJ
 4chQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777281446; x=1777886246; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=drNCgVfz0s4LsuWyXJ5uke4sGBIfgQAtfANUdTvKA7Y=;
 b=Jqn6VxkTRFplPuepuF2ptzPUguXwMMKDUz1iEpHTZZNxuIZitg+ZTUfQ62A2Fpl4Vw
 gNhTxOlGkoYKDPmdQRLsXsub5lOahrYYaPlOPxkiAZLswrIudYtpZZDXpJ8HshuRZTEz
 y7iQzXUAbYJvEd3IwP6YBLZbPdVZXNKVDIO0uvrxBlwbTiMJOAWABioJ1w9sxAqZll2E
 DhvLFbZnz3PYt6a4EUwW3ZFjU/eCpKoX9QWy5V99fWd2LjcWS+2rH22aTeP9K+559Wtx
 KWkghI7YkurAS1fjFg9siWpD8c0a/aP+dkp5hRj5OeC8OECwfbDICrjfpzMUvsaFfxnE
 iq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777281446; x=1777886246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drNCgVfz0s4LsuWyXJ5uke4sGBIfgQAtfANUdTvKA7Y=;
 b=D7f8lpoP5gL8coNtHwQnJQansOHkaG9fRtjefoTyfZvVrdrLMzYvclpI0EN/a9RAba
 3Y8DK5gUpUgDTvlvWxGqYHbkDYPQE5UNbsBqfDEBGrbdt8NFYeuLXAVGJ4MM2HPPBqms
 1kMTYGPlpfcaKwzig5zxPy9EdcHfsWsxhcN9Ts7MWp6dUQRsE7CrPlGU7EXz1YcdgTLX
 O7mGtbmCRjkPQPjkNGKTrbCoCtNJhVCGuz6g1bWQh/PPsPmKoZxwrgbqiBjlru8Kx6oc
 7IYmgGDyh0TbENi17j42PtvaNVRslSKiPpJrkz4Bx1r3aIHNrjk9hJdo6ro5tO6H/tyH
 0fjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8wmfjPto5cTXprORItJFZ78QhVQGXUbwQZ4lCkwpBcD4oZRN+ASO37Uerps4XneV79LUn4ImG0kw==@nongnu.org
X-Gm-Message-State: AOJu0YyCjrEapuBmampHDEWoAK7IWiOVUwZGosQTRonmR7XTt6gjkLIk
 QpI7PSl5Zc7m/eG8oLAnnTaX0vlC+LBN65spJ1GQwgeo8ww7sUOVQxG4cG6DfnGH8KNJxcDfY5U
 y4SBz91dEnnl/a5kfoepYW7X18wufCJ+utvVZdamzyg==
X-Gm-Gg: AeBDiets6nkEC7Ibda9KzMirax97njehd4iC/ry7cNrrpSf0BR25u4SxeMz1tm2DNBo
 f9rxnGuO6PYrBdnUuplH3qhOmq06E0pJkmy66uOmRVFjWSvwfS/8IJSq/Rayw7H19PvTEL0CoGG
 DbqehHHnaJUmqfBOjIa7gDq3ugMEr3NZfAx6rtJn3NXC+eVkbILDY+4CvKQEnS1GYA2hMA0pz7Y
 zxWqOB7VSEfSwksnTHY6x17J5wzIWFpudQBrCXXdJP7c+QRbrxLVU+8JfsA+1zWG8EpJS4gdh3h
 kcW3lU3uIgZzeaJi7uhOWd9R2N8MXJkLIdVQI11xfEnEK9fK0s+oJtezlINiaPtTn5bdckIeaYZ
 IZw==
X-Received: by 2002:a53:d016:0:b0:654:fd9:2e88 with SMTP id
 956f58d0204a3-6540fd943d2mr21267311d50.31.1777281446128; Mon, 27 Apr 2026
 02:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260420140552.104369-1-eric.auger@redhat.com>
 <20260420140552.104369-7-eric.auger@redhat.com>
In-Reply-To: <20260420140552.104369-7-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 10:17:14 +0100
X-Gm-Features: AQROBzD2j5W-nVHU8rVmtUyCDS8WzT54HLDhw1z-ez_L5it19FUfHfx-oJm1Npc
Message-ID: <CAFEAcA9Qu6updLns8yxR8xgNZ9+aP51w_BfoprqBayPF8zsSAA@mail.gmail.com>
Subject: Re: [PATCH v10 6/7] target/arm/helper: Define cpreg migration
 tolerance for DGBDTR_EL0
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 20 Apr 2026 at 15:06, Eric Auger <eric.auger@redhat.com> wrote:
>
> We want to remove AArch32 DBGDTRTX which was erroneously exposed.
> This was attempted by 655659a74a36b ("target/arm: Correct encoding
> of Debug Communications Channel registers") but it was discovered
> that the removal of this debug register broke forward migration on
> TCG. Now we have the cpreg migration tolerance infrastructure, we
> can declare one for the DBGDTRTX. This allow to revert the reinstate
> patch.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>
> ---
>
> v9 -> v10
> - Adding a comment explaining why we want a migratoin tolerance
>   for that cpreg
> ---
>  target/arm/helper.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7389f2988c4..d80899cd096 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6426,9 +6426,24 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              .fgt = FGT_CLIDR_EL1,
>              .resetvalue = GET_IDREG(isar, CLIDR)
>          };
> +        uint64_t dbgtr_el0_kvmidx =
> +            cpreg_to_kvm_id(ENCODE_CP_REG(14, 0, 1, 0, 5, 3, 0));
> +
>          define_one_arm_cp_reg(cpu, &clidr);
>          define_arm_cp_regs(cpu, v7_cp_reginfo);
>          define_debug_regs(cpu);
> +        /**
> +         * AArch32 DBGDTRTX has been introduced with a wrong encoding.

I prefer the phrasing in the old comment here:

"We used to incorrectly expose a non-existent AArch32 "DBGDTRTX" register
with this encoding. This was fixed ..."

> +         * This was fixed by commit 655659a74a36 ("target/arm: Correct
> +         * encoding of Debug Communications Channel registers") by the
> +         * introduction of correct separate cpreg definitions
> +         * for AA64 and AA32 versions. However the old cpreg definition
> +         * couldn't be removed without breaking the migration. From qemu 11.1
> +         * onwards we can use the migration tolerance infrastructure to
> +         * remove it.
> +         */
> +        arm_register_cpreg_mig_tolerance(cpu, dbgtr_el0_kvmidx,
> +                                         0, 0, ToleranceNotOnBothEnds);
>      } else {
>          define_arm_cp_regs(cpu, not_v7_cp_reginfo);
>      }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

