Received: by 10.28.173.206 with SMTP id w197csp2984475wme;
        Mon, 15 Jan 2018 09:38:20 -0800 (PST)
X-Google-Smtp-Source: ACJfBos45KQ0yVa3wzRvtXxgHdhUO1o26PQFIJuhlR8NkGyJaqKj7FMsuv55DY1DvTdbSCR7H6bJ
X-Received: by 10.37.110.197 with SMTP id j188mr6620459ybc.23.1516037900748;
        Mon, 15 Jan 2018 09:38:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516037900; cv=none;
        d=google.com; s=arc-20160816;
        b=B5yI4zE9GN0B4CsanyWuHB18ZsVwnGNQYJvy3Cae95PCnyd3b1/mzxNj8aRd3ANV+k
         PKusF8zg6QYkoVrJbh9+nybo4m1DA0OQ781tJkehAOurZ+RlOhgM/SHVEHHVuFk8TdXx
         CMfC1sQavVo0qKJTSxkhFOzpgTYer3xxvRK4uZvdPlUH8A4+eEmAc31q5J0HG4ZL8PRl
         uVfsz2Qlc7YdlHewQ92HzsAsuXGhexNqE4P6/i4e/dEYxi9qxjrzcVZrbPA8QIeyeqHV
         TUYqPdyCX5nNrOgIvIFnlEbXe+bkMg0UzDTN5QIMEfnt95HTJCFlJP5H6UWrwEKJS+G6
         gJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d/IJtkpPR92EASbUq1QfgLOdi2COrB6IFKyDKy3sOCs=;
        b=BHWodoAUxD0VuqDFywrpPghGKaG7aeqHWUIIfnpD3bMRzwfb7UVoQXZ3ZWA8vp21jt
         wdTF1F8XslVYwXeJSEgq/kla5j+xm22hZyWT7Wzb+XLx6UbNWJxkiknO56cCMrmDPvt1
         EpbyBsdJIb4fraRD0qen+Ska+WxmK656M1J5Z2E+dbW59hovPkYa2uoT2pRMuh/cLgYP
         xJQw83bMt8YhhUIurWyF2zPo8odgaP7SBNhcG4R2Le78qAwUEmTLk0KCpYcRZZrS+xzN
         QHv7aEPWjEAObssaPm76Bhon4pEDA/5sxsRbiaeMUL8embJIUSIM9tZfh5OpS+qCArN6
         g9zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h38H+03k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h132si34042ybb.22.2018.01.15.09.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 09:38:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h38H+03k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb8iC-0000s9-5e
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 12:38:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8i4-0000rn-97
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:38:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8i3-00058w-Cn
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:38:12 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:44137)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb8i3-00058A-7d
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:38:11 -0500
Received: by mail-ot0-x241.google.com with SMTP id t20so1953944ote.11
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 09:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d/IJtkpPR92EASbUq1QfgLOdi2COrB6IFKyDKy3sOCs=;
	b=h38H+03k5fpIKfkcz+4RhPIxN9J3eqKtrKmyAT1rdWMxRMTdzj0fthkmNaZ3GKP+RG
	pphTruNVoBDUQYnQiSyYR2q4UwsP2qnc3gTYzkpSxlZyOvEVQj2GLWws4UCT7zCXqbPy
	ffgyvPwSInovLLnW9m2BVZEbkB/ze/rofnJW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d/IJtkpPR92EASbUq1QfgLOdi2COrB6IFKyDKy3sOCs=;
	b=lM13nRhl74bQZCPV74r+IrHE1kNNjYtK5pDi9oXkswUgQh2VmeHMiX79T+bEjCpRVZ
	rlC4z+QB0zbjzG8Exhde24+z1IJtfgDIdprxqwQJfJROhXVLfOUc2Xs9745uL5F8rccM
	1df7xqnGJ21Vu+pw6G18VodC5yolNEfGgLUkKS98sejBS77eZ43yi9RrSWAhJwdiDwQD
	IwXedlUGy21CZNZ5oO08rTX9iUNKvoVWKkPJ3ezTHbCaboAWnkekHoazbnE5d0JAKZem
	eYLUfehB3QVH0WO6CHIvd+QG7+6yTlq9SwFKVJQwvLpR7UvHPLS06BnSKGen3CYDEHvM
	+DZg==
X-Gm-Message-State: AKwxytf6yWF2k4i9Y15XeTj9iAyPUR5bEZzFDq3npApbXgZdS8E8VpKY
	5AIoWJWBWlr1+sMQyUFMEgzpDy+ptp7s0jyiDrzv6w==
X-Received: by 10.157.29.233 with SMTP id w38mr19031652otw.24.1516037890443;
	Mon, 15 Jan 2018 09:38:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 09:37:50 -0800 (PST)
In-Reply-To: <20171218172425.18200-6-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 17:37:50 +0000
Message-ID: <CAFEAcA8tbTBk9Wjx3OJoXPgZsOdrOE8tQO4nK4NhLrRm4ny6Dw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v2 05/11] target/arm: Decode aa32 armv8.1
 three same
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ccYwa4DPf9Z8

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 85 +++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 66 insertions(+), 19 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index c690658493..a9587ae242 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -25,6 +25,7 @@
>  #include "disas/disas.h"
>  #include "exec/exec-all.h"
>  #include "tcg-op.h"
> +#include "tcg-op-gvec.h"
>  #include "qemu/log.h"
>  #include "qemu/bitops.h"
>  #include "arm_ldst.h"
> @@ -5364,9 +5365,9 @@ static void gen_neon_narrow_op(int op, int u, int size,
>  #define NEON_3R_VPMAX 20
>  #define NEON_3R_VPMIN 21
>  #define NEON_3R_VQDMULH_VQRDMULH 22
> -#define NEON_3R_VPADD 23
> +#define NEON_3R_VPADD_VQRDMLAH 23
>  #define NEON_3R_SHA 24 /* SHA1C,SHA1P,SHA1M,SHA1SU0,SHA256H{2},SHA256SU1 */
> -#define NEON_3R_VFM 25 /* VFMA, VFMS : float fused multiply-add */
> +#define NEON_3R_VFM_VQRDMLSH 25 /* VFMA, VFMS : float fused multiply-add */

If this case includes VQRDLMSH as well now, then the comment needs updating.
I would suggest just /* VFMA, VFMS, VQRDMLSH */

>  #define NEON_3R_FLOAT_ARITH 26 /* float VADD, VSUB, VPADD, VABD */
>  #define NEON_3R_FLOAT_MULTIPLY 27 /* float VMLA, VMLS, VMUL */
>  #define NEON_3R_FLOAT_CMP 28 /* float VCEQ, VCGE, VCGT */

> @@ -5630,12 +5647,12 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>          if (q && ((rd | rn | rm) & 1)) {
>              return 1;
>          }
> -        /*
> -         * The SHA-1/SHA-256 3-register instructions require special treatment
> -         * here, as their size field is overloaded as an op type selector, and
> -         * they all consume their input in a single pass.
> -         */
> -        if (op == NEON_3R_SHA) {
> +        switch (op) {
> +        case NEON_3R_SHA:
> +            /* The SHA-1/SHA-256 3-register instructions require special
> +             * treatment here, as their size field is overloaded as an
> +             * op type selector, and they all consume their input in a
> +             * single pass.  */

You've lost the newline before the '*/' here.

>              if (!q) {
>                  return 1;
>              }
> @@ -5672,6 +5689,40 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>              tcg_temp_free_i32(tmp2);
>              tcg_temp_free_i32(tmp3);
>              return 0;
> +
> +        case NEON_3R_VPADD_VQRDMLAH:
> +            if (!u) {
> +                break;  /* VPADD */
> +            }
> +            /* VQRDMLAH */
> +            switch (size) {
> +            case 1:
> +                return do_v81_helper(s, gen_helper_gvec_qrdmlah_s16,
> +                                     q, rd, rn, rm);
> +            case 2:
> +                return do_v81_helper(s, gen_helper_gvec_qrdmlah_s32,
> +                                     q, rd, rn, rm);
> +            }
> +            return 1;
> +
> +        case NEON_3R_VFM_VQRDMLSH:
> +            if (!u) {
> +                /* VFM, VFMS */
> +                if ((5 & (1 << size)) == 0) {

You could write this 'if (size == 1)' (since the neon_e3r_sizes[]
check has already ruled out bit 3 being set)...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
