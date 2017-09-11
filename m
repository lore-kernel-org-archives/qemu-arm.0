Received: by 10.223.172.38 with SMTP id v35csp5899352wrc;
        Mon, 11 Sep 2017 11:12:12 -0700 (PDT)
X-Received: by 10.55.68.77 with SMTP id r74mr2274525qka.125.1505153531904;
        Mon, 11 Sep 2017 11:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505153531; cv=none;
        d=google.com; s=arc-20160816;
        b=EgGtlrLsFlRqw2DUohu35q0Y8IAL2eFuSi+3Kt7lanhEFQ1B6/r3sqT50iwYneJetC
         fWbzbUM4p/tgzq0TWKJSHU/+oZsFG+gqYSNR/nwzUPdqEoF4tScG2ZR2OZh7Iv/wOUZn
         DvmRCL0BSbAKiql8O+MalawCewp1z5PH1NWinl5Bk6D6Bn5Y5fxehO+IfFg704AmbLe3
         CIFaHZw+p77TIh73V0aTSr9wikSBIMN2gpePvPUko994us2ucJLhfZ0QsTQ/ifCnN49X
         iWRueWCwwqJW5KYHf7/CfiV4p2c4jx4V6j9XiFH9YXlCRUVtdlJEPC08RTShKqRz/rRK
         0CPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EAJXnRPyfS/xeI7F/M5nuTmuqLubhDfzD8bbZHZQmKc=;
        b=nR2mc2Iw8qeUXfjTG/jQlwLI+S9XdGTf/4I9t4ijRsBpYiqWxr85ilZxV38BdJmHbP
         ItQo/UqqSWLpX/1cIKMhNln8h9FtcMuFJkTlJBrG8Lg/xWEeJY2g/GwCXkKI7fLFSJPh
         QfMGdNnPUnfhHf7T2/hTa6O56nLM2pSkrlW9vpEV7FABdRumKuGK2PTS8zQfhQ0koIzN
         ubcDAjZI/MDiYQXyAYwazBnOaFCVq7pNw/j6wrCBBtN88xcAa2rEZNuj65+KszPiYPsW
         IjoP8Ek/sOm+qkSjvlSJwI4jjHrvC74v/o/eBLMCMrMWP7V/ZsLzbmHXUJisefz/mMdd
         l8Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mu2o7Obl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c193si9539431qkg.494.2017.09.11.11.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 11:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mu2o7Obl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drTBp-0004A0-Jn
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 14:12:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSl6-0003cH-4y
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 13:44:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSl5-0005aZ-2k
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 13:44:32 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:38820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1drSl2-0005ZU-Fz; Mon, 11 Sep 2017 13:44:28 -0400
Received: by mail-wm0-x241.google.com with SMTP id x17so7433650wmd.5;
	Mon, 11 Sep 2017 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EAJXnRPyfS/xeI7F/M5nuTmuqLubhDfzD8bbZHZQmKc=;
	b=Mu2o7OblxvpxoRMRyn/YLmbmLdSiT7j8zrjuu+T+ySFNo98P8MpDrZVJbD/lx/fDLD
	NLL/ojIkFY09u4j4YFxxXYTfzL9xCGai43p9sn0xnVfzoaf7ToeMIp6nCstyCHFa7aAU
	e/GrymvrqtMQ/Nd0MD8nAj+Y+rQPC1e0B8xj1nwHwS+NbIITmGokvn04nSMCNlbZdPz+
	Js0tUPniappr80wPL8Pk8nZ4QaC1EZhzhIE7UxCsgyucBef2CsC77QKtEsOAE2TfSB9/
	5wbD3C4cry+rsJfIK3GcbNfrCRMCTUfJdSdvybxogPN9vTQ0tcChl0GoFV4ijwUFdXU+
	Y1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EAJXnRPyfS/xeI7F/M5nuTmuqLubhDfzD8bbZHZQmKc=;
	b=FZ8eREpx0bpBvaF5prmzGQtMny6e6HPAlGsvG3wBt7ha8w2biruwzGb1ZN9ZuZQ8XZ
	gw+BFP8Ir6C3tLNftwxIVBR+KMCr9bWV0IhmYzHCIsxLe53kc/ArGcnO8xCdkQehJcy7
	IeOEaoHmApFC2F83zNEx43CYf5+w2EzV7+A6qZJroMPACxDfOu0v3qZwxXazDF6BSDlu
	EzvJ8sEfQm5e2vnays+PswUJKEWrxfPVnUdJgPV1OAcawhxhgOhGQl4xFUHICBmWBExZ
	gwOpChkj2+F7WBi7yKriiCH2f+9/lKUhfI3mq003UjIrVbOtye2ZviQ6W5w0LvIlVJkv
	BgQw==
X-Gm-Message-State: AHPjjUij88oePb1rgDW4RmU5PiJDE/+giROF1igYyQFkSi26saF5fapy
	nX/C/qucg4vDq3GpOVKANvl87dgoVkkdX1EB7Rw=
X-Google-Smtp-Source: ADKCNb4pEMcIfNhD6OQwblV/WQglhfwhlohTHRYTYGEwQtvUu9WyVzQU2DN8Wmyh1XPLCnm1i3S216S9Z0Zo+V2rsOQ=
X-Received: by 10.28.104.7 with SMTP id d7mr7755767wmc.6.1505151867364; Mon,
	11 Sep 2017 10:44:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 11 Sep 2017 10:43:56 -0700 (PDT)
In-Reply-To: <1505137930-13255-7-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-7-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Sep 2017 10:43:56 -0700
Message-ID: <CAKmqyKNCF+E7S2-gbVDo_T5V33Szj1VgNWFW6M4O_X2biqbG9A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-devel] [PATCH 6/7] target/arm: Add and use defines for
 EXCRET constants
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yb1zXC5ocGl8

On Mon, Sep 11, 2017 at 6:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The exception-return magic values get some new bits in v8M, which
> makes some bit definitions for them worthwhile.
>
> We don't use the bit definitions for the switch on the low bits
> which checks the return type for v7M, because this is defined
> in the v7M ARM ARM as a set of valid values rather than via
> per-bit checks.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  target/arm/internals.h | 10 ++++++++++
>  target/arm/helper.c    | 14 +++++++++-----
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index a315354..18be370 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -61,6 +61,16 @@ FIELD(V7M_CONTROL, NPRIV, 0, 1)
>  FIELD(V7M_CONTROL, SPSEL, 1, 1)
>  FIELD(V7M_CONTROL, FPCA, 2, 1)
>
> +/* Bit definitions for v7M exception return payload */
> +FIELD(V7M_EXCRET, ES, 0, 1)
> +FIELD(V7M_EXCRET, RES0, 1, 1)
> +FIELD(V7M_EXCRET, SPSEL, 2, 1)
> +FIELD(V7M_EXCRET, MODE, 3, 1)
> +FIELD(V7M_EXCRET, FTYPE, 4, 1)
> +FIELD(V7M_EXCRET, DCRS, 5, 1)
> +FIELD(V7M_EXCRET, S, 6, 1)
> +FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
> +
>  /*
>   * For AArch64, map a given EL to an index in the banked_spsr array.
>   * Note that this mapping and the AArch32 mapping defined in bank_number()
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index fdd5cc6..a502e4e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6242,7 +6242,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>                    " previous exception %d\n",
>                    type, env->v7m.exception);
>
> -    if (extract32(type, 5, 23) != extract32(-1, 5, 23)) {
> +    if ((type & R_V7M_EXCRET_RES1_MASK) != R_V7M_EXCRET_RES1_MASK) {
>          qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero high bits in exception "
>                        "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n", type);
>      }
> @@ -6255,7 +6255,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>           * which security state's faultmask to clear. (v8M ARM ARM R_KBNF.)
>           */
>          if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> -            int es = type & 1;
> +            int es = type & R_V7M_EXCRET_ES_MASK;
>              if (armv7m_nvic_raw_execution_priority(env->nvic) >= 0) {
>                  env->v7m.faultmask[es] = 0;
>              }
> @@ -6491,12 +6491,16 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          return; /* Never happens.  Keep compiler happy.  */
>      }
>
> -    lr = 0xfffffff1;
> +    lr = R_V7M_EXCRET_RES1_MASK |
> +        R_V7M_EXCRET_S_MASK |
> +        R_V7M_EXCRET_DCRS_MASK |
> +        R_V7M_EXCRET_FTYPE_MASK |
> +        R_V7M_EXCRET_ES_MASK;
>      if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
> -        lr |= 4;
> +        lr |= R_V7M_EXCRET_SPSEL_MASK;
>      }
>      if (!arm_v7m_is_handler_mode(env)) {
> -        lr |= 8;
> +        lr |= R_V7M_EXCRET_MODE_MASK;
>      }
>
>      v7m_push_stack(cpu);
> --
> 2.7.4
>
>
