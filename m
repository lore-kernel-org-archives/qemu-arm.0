Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp19706158lff;
        Thu, 2 Jan 2020 18:42:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyFa/fivEoWVmShoWcIES17JoMrKHlezVAyxQk0wfkplamw+mpcCJadS7mpfvzrX38pwhk2
X-Received: by 2002:ad4:4f47:: with SMTP id eu7mr65760179qvb.69.1578019344337;
        Thu, 02 Jan 2020 18:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578019344; cv=none;
        d=google.com; s=arc-20160816;
        b=XmREZ76SLWdr8Xp1cdAADxLLlhBiXHVM5Y1WLU8XOnLGmOCvtAwjpkLqM0BkBDm2yV
         mxK437vkfLTRoBPGSvb6KGEU5yWWBP4VhbpoNqv9JCcBjiNXm/yhwapwudhVnBKhHmu0
         /DShkzZrzLxN95jn6ig5YaDP1QuWo1Kkm0trN5jM2ECiJ4jRLA+hNfqlBYo7bL0boffl
         buIRxUmEFxvH622jT11Me50nvN2HGn9UpjpKwQze4bD+i/D50JDNndL3EPWFxZTj+Xb7
         xwivaBznui3JmEQqnzCTzkBKynL1y/xtvjPZHvSmUZ8ReN6Eulxu9vmLRDYLSdfrCy33
         WeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ms4NaygvNRHvsZd1PAOASNhPz2q6OnH4agnIhRCQ+z8=;
        b=CT9XvpNzlhQNZM+VaMaIkSV+sHmUcQKSBJ1QQCk0SSEOvSIw9CZV+3n9avFQywjsf0
         8RaaOvnA25cmYc0UBKj1bEv7dYG95Mdp7X1UjRT0gJK4Lm8hWmkjUs34h+vzxsq2PreK
         EHn6zWB7zvs4BEubfO9vSw61vkzNj+ZUpMqC7h0Ahg5mXvBCfXGB9KO5fXhUJ6b4hvra
         cPbZ1GJRBGW6i8Bqq5Vt8FzZCd1K5beUyJjUrFPMDXk1R327QAzT1EQAJVPPNIJSlbfH
         +Je0dXZ8hMfRwtVihQ89Qh3p3+pOD+W1mRiDXHZpSb6AnQNW3SwUzQZ2msj2GoQ99BIY
         xpeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UsPDxGf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si23096289qth.367.2020.01.02.18.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2020 18:42:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UsPDxGf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1inCut-0001fF-Lm
	for alex.bennee@linaro.org; Thu, 02 Jan 2020 21:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1inCuk-0001cg-SO
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 21:42:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1inCuj-0003ET-1J
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 21:42:14 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46889)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1inCuc-0002yi-Nc; Thu, 02 Jan 2020 21:42:06 -0500
Received: by mail-lj1-x244.google.com with SMTP id m26so40106230ljc.13;
 Thu, 02 Jan 2020 18:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ms4NaygvNRHvsZd1PAOASNhPz2q6OnH4agnIhRCQ+z8=;
 b=UsPDxGf6jFi6KA4R4irJywbvMgXmKSvshWccQagpGeifxo4NIKYXZtzqpwVBaGvclH
 c3R4V+++mUVPmEEvE9DnHqe0ZBtwP8z7Ey/1S5W09PnADV6JrZ4qH9xC8mxYIdN7pDDr
 oIBfD8Z9VgLr5BIt+GNoEgqNWf1fU2gX4vz1x1t7DjWAqx4Pp4Ef1rb3eGV2XcNp2o8E
 q5ysgJluRv2aFF+VCEDtACYjSAa+W2PWGYOLSX/Dh0RH3HbQhTADvS2CyBW4HuBGET+S
 Q1DabUhLCOs0gCvRzPXVF+iqVlkf/x/5HxYe7DfbJB5TjawwVVwEOMtaSubRX0YjhrIP
 nN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ms4NaygvNRHvsZd1PAOASNhPz2q6OnH4agnIhRCQ+z8=;
 b=QdQAGYRZiUFvEhyDutDhtv+UE1meHzmsAYP28Ppi1BRfx0L8NPXygfcV0gx3gk4Fdm
 +IjwPOTkIGb0msdvGikVLRBpEsuCiQqsdXZVQtWbpU+ZztWZ4holttCDDVqN9ihNyyhn
 BIDNnW2caWVZd+8NZENLQh/rWlKK9XMRTFpgHoDv5S4k2W7ZkqDh/ru5QnMDPhdqMD4T
 VEJWYkza/pC3FpZFiF41x7/rmfTrV5ueOlxVszYh36jZQ6M7Xd83FrXIsyYI11o8gL/r
 4z7wmflQnDJYPe4Wa0pMq66jfSgNC12sLzFXhItOyEG8PXQLXaXmVYa8C1oXQiFo5l7k
 WmAw==
X-Gm-Message-State: APjAAAXAJzKofh693LcOtep1XF9/sWxkfBkdDWpMAPavXdE692FPZ5iF
 s/QkQVum2vwW5v1GQywbc1ms1QhDiHdGuhSQsCU=
X-Received: by 2002:a2e:7505:: with SMTP id q5mr38612705ljc.7.1578019325458;
 Thu, 02 Jan 2020 18:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20200101112303.20724-1-philmd@redhat.com>
 <20200101112303.20724-3-philmd@redhat.com>
In-Reply-To: <20200101112303.20724-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jan 2020 18:41:38 -0800
Message-ID: <CAKmqyKNPyEsiG910oQn3ySNbuFprfBd8p4idEdn=hAXmnoBOeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] tcg: Search includes in the parent source directory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Stafford Horne <shorne@gmail.com>, Richard Henderson <rth@twiddle.net>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C4ZFA2tFUrFz

On Wed, Jan 1, 2020 at 3:24 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> All the *.inc.c files included by tcg/$TARGET/tcg-target.inc.c
> are in tcg/, their parent directory. To simplify the preprocessor
> search path, include the relative parent path: '..'.
>
> Patch created mechanically by running:
>
>   $ for x in tcg-pool.inc.c tcg-ldst.inc.c; do \
>     sed -i "s,#include \"$x\",#include \"../$x\"," \
>       $(git grep -l "#include \"$x\""); \
>     done
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/aarch64/tcg-target.inc.c | 4 ++--
>  tcg/arm/tcg-target.inc.c     | 4 ++--
>  tcg/i386/tcg-target.inc.c    | 4 ++--
>  tcg/mips/tcg-target.inc.c    | 2 +-
>  tcg/ppc/tcg-target.inc.c     | 4 ++--
>  tcg/riscv/tcg-target.inc.c   | 4 ++--
>  tcg/s390/tcg-target.inc.c    | 4 ++--
>  tcg/sparc/tcg-target.inc.c   | 2 +-
>  8 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
> index 3f921015d3..843fd0ca69 100644
> --- a/tcg/aarch64/tcg-target.inc.c
> +++ b/tcg/aarch64/tcg-target.inc.c
> @@ -10,7 +10,7 @@
>   * See the COPYING file in the top-level directory for details.
>   */
>
> -#include "tcg-pool.inc.c"
> +#include "../tcg-pool.inc.c"
>  #include "qemu/bitops.h"
>
>  /* We're going to re-use TCGType in setting of the SF bit, which control=
s
> @@ -1541,7 +1541,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext=
, TCGReg d,
>  }
>
>  #ifdef CONFIG_SOFTMMU
> -#include "tcg-ldst.inc.c"
> +#include "../tcg-ldst.inc.c"
>
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     TCGMemOpIdx oi, uintptr_t ra)
> diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
> index 94d80d79d1..fffb6611e2 100644
> --- a/tcg/arm/tcg-target.inc.c
> +++ b/tcg/arm/tcg-target.inc.c
> @@ -23,7 +23,7 @@
>   */
>
>  #include "elf.h"
> -#include "tcg-pool.inc.c"
> +#include "../tcg-pool.inc.c"
>
>  int arm_arch =3D __ARM_ARCH;
>
> @@ -1131,7 +1131,7 @@ static TCGCond tcg_out_cmp2(TCGContext *s, const TC=
GArg *args,
>  }
>
>  #ifdef CONFIG_SOFTMMU
> -#include "tcg-ldst.inc.c"
> +#include "../tcg-ldst.inc.c"
>
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     int mmu_idx, uintptr_t ra)
> diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
> index 9d8ed974e0..cdedcb2b25 100644
> --- a/tcg/i386/tcg-target.inc.c
> +++ b/tcg/i386/tcg-target.inc.c
> @@ -22,7 +22,7 @@
>   * THE SOFTWARE.
>   */
>
> -#include "tcg-pool.inc.c"
> +#include "../tcg-pool.inc.c"
>
>  #ifdef CONFIG_DEBUG_TCG
>  static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] =3D {
> @@ -1647,7 +1647,7 @@ static void tcg_out_nopn(TCGContext *s, int n)
>  }
>
>  #if defined(CONFIG_SOFTMMU)
> -#include "tcg-ldst.inc.c"
> +#include "../tcg-ldst.inc.c"
>
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     int mmu_idx, uintptr_t ra)
> diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c
> index 5442167045..1da663ce84 100644
> --- a/tcg/mips/tcg-target.inc.c
> +++ b/tcg/mips/tcg-target.inc.c
> @@ -1107,7 +1107,7 @@ static void tcg_out_call(TCGContext *s, tcg_insn_un=
it *arg)
>  }
>
>  #if defined(CONFIG_SOFTMMU)
> -#include "tcg-ldst.inc.c"
> +#include "../tcg-ldst.inc.c"
>
>  static void * const qemu_ld_helpers[16] =3D {
>      [MO_UB]   =3D helper_ret_ldub_mmu,
> diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
> index d308d69aba..ee1f9227c1 100644
> --- a/tcg/ppc/tcg-target.inc.c
> +++ b/tcg/ppc/tcg-target.inc.c
> @@ -23,7 +23,7 @@
>   */
>
>  #include "elf.h"
> -#include "tcg-pool.inc.c"
> +#include "../tcg-pool.inc.c"
>
>  #if defined _CALL_DARWIN || defined __APPLE__
>  #define TCG_TARGET_CALL_DARWIN
> @@ -1845,7 +1845,7 @@ static const uint32_t qemu_exts_opc[4] =3D {
>  };
>
>  #if defined (CONFIG_SOFTMMU)
> -#include "tcg-ldst.inc.c"
> +#include "../tcg-ldst.inc.c"
>
>  /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
>   *                                 int mmu_idx, uintptr_t ra)
> diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
> index 7018509693..2bc0ba71f2 100644
> --- a/tcg/riscv/tcg-target.inc.c
> +++ b/tcg/riscv/tcg-target.inc.c
> @@ -27,7 +27,7 @@
>   * THE SOFTWARE.
>   */
>
> -#include "tcg-pool.inc.c"
> +#include "../tcg-pool.inc.c"
>
>  #ifdef CONFIG_DEBUG_TCG
>  static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] =3D {
> @@ -921,7 +921,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>   */
>
>  #if defined(CONFIG_SOFTMMU)
> -#include "tcg-ldst.inc.c"
> +#include "../tcg-ldst.inc.c"
>
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     TCGMemOpIdx oi, uintptr_t ra)
> diff --git a/tcg/s390/tcg-target.inc.c b/tcg/s390/tcg-target.inc.c
> index 8aaa4cebe8..b07e9ff7d6 100644
> --- a/tcg/s390/tcg-target.inc.c
> +++ b/tcg/s390/tcg-target.inc.c
> @@ -29,7 +29,7 @@
>  #error "unsupported code generation mode"
>  #endif
>
> -#include "tcg-pool.inc.c"
> +#include "../tcg-pool.inc.c"
>  #include "elf.h"
>
>  /* ??? The translation blocks produced by TCG are generally small enough=
 to
> @@ -1536,7 +1536,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, M=
emOp opc, TCGReg data,
>  }
>
>  #if defined(CONFIG_SOFTMMU)
> -#include "tcg-ldst.inc.c"
> +#include "../tcg-ldst.inc.c"
>
>  /* We're expecting to use a 20-bit negative offset on the tlb memory ops=
.  */
>  QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
> diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
> index d7986cda5c..65fddb310d 100644
> --- a/tcg/sparc/tcg-target.inc.c
> +++ b/tcg/sparc/tcg-target.inc.c
> @@ -22,7 +22,7 @@
>   * THE SOFTWARE.
>   */
>
> -#include "tcg-pool.inc.c"
> +#include "../tcg-pool.inc.c"
>
>  #ifdef CONFIG_DEBUG_TCG
>  static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] =3D {
> --
> 2.21.0
>
>
