Received: by 10.25.44.15 with SMTP id s15csp6416106lfs;
        Wed, 2 Aug 2017 10:47:34 -0700 (PDT)
X-Received: by 10.200.34.87 with SMTP id p23mr31318775qtp.279.1501696054373;
        Wed, 02 Aug 2017 10:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501696054; cv=none;
        d=google.com; s=arc-20160816;
        b=MbA7JYUWsKqC/mIpUkdtHvmd0uB0SlS8lfTa+fQJzHW19qqjbuumLXIzRWUbC8xscR
         WbR6QfnKVtT8Mi+jFts+tscuHQXkQ1v4jgArmkVfI17JtxWsfPFTj9gA5X8rt7vyI0Vp
         gAsjc4QRK/rM6SGS6B4w/2Tj55W0zGAhje7XAkQvdCugjT+QORAigy1me3ZTqIx5RGbC
         fo+K5q6O/k1cJMFVF9F06iSYp4XkqiVN/fLQnecb5Wk2161LaHaJBvFKHNLpgQkMIT/9
         zC0bUM8ivGBZ2WaGgjorWhPKkfonOSdNenX//Qxms7LytiE2Hla+nDddnSDh156F850K
         xybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=rRKrUkLdXiLucSgdeZ/xsCCVTyhEO7N74mBt1hHdJuY=;
        b=inK02SdkQpZi8IT0/WI0wqf5y4BQzLjeLYxheijUo8+O9IwnbyChiUz6hXy3q5Uk6+
         A1w5tNe0xz4Y8f14ofCBQEEIA/GV7F+4PNiMF7irXWm+stWDDQsJl267Shjl/KvT5Su1
         Dw2A8TqDMQi0dobswW0dosxP80HjGtF6AMChso0N4DD9xJfMuyJh8V9sk8KJITuOJmGb
         98t0evwkVQDjpFw6AirgmyA3FzNPp6mmvJVZ9gOGnb0RLaUDYfXkoZOjyH0Yrgn0Cbhz
         nIzudkQShhLUGUthA+d23YHcEyhFtP8qsC0UL3M3PdwlXvQZrdWvi48d3YDIf8JVRd2S
         z/QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=KYnC3xuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a190si28729394qkd.158.2017.08.02.10.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 10:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=KYnC3xuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcxk3-0004g2-Qc
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 13:47:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxk0-0004fw-JO
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxjx-0007dx-Fq
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:47:28 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:37875)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dcxjx-0007cQ-4B; Wed, 02 Aug 2017 13:47:25 -0400
Received: by mail-lf0-x241.google.com with SMTP id x16so4230340lfb.4;
	Wed, 02 Aug 2017 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rRKrUkLdXiLucSgdeZ/xsCCVTyhEO7N74mBt1hHdJuY=;
	b=KYnC3xuLPdTBtPnnF+d6Wn8LFPlqG/Jefh6ZRKRo0dFXIw8sCfmQr3bXnMUvGQqjAA
	+ZkH/FwMf5tdgepRya7ZO6BRCObe32djXFI8zJt4isEH2vkFP/Ohu6pMUHX4pZ3nLgsa
	I3lXLInF4u4pF2d/omY3skDEvYemg89fHkymaEageChwJt4Hsz8M6hxhDt2YmGAQxFMs
	8g9uke0dtyxD5KzieYAkeouTcX+vNs52P3pJ++nh3tLNrgAOj/63KTWNfo7VMIApAIVA
	vOAAQYZl9iw9JyAQGT7vIf6TuUCZUMrblcRJcLJS4GRy5e/wrx+mUkDKT1EgLwBnUuD7
	40Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rRKrUkLdXiLucSgdeZ/xsCCVTyhEO7N74mBt1hHdJuY=;
	b=jUsH7ID7Y8O+sKgkrEMDVCbsootklMyN8Cc4ho8PUFjzMwlipOpcdAm4Hdy4U6J3zZ
	yoegsInwi2i8J+D2IHJW/WxYNJcklunPmupboOxdzpWlIX9RQVHGpoBr6bPwvFil66X4
	ziZvFjF5N8skpGknN52q1yrNSx9V1Y0ARRFRQI00XPYlkFCkdNXgduJYvnxmi0Ji2u+d
	GEgGWp5GlnGDnM0pJ7UCI2/3i7OsDpAPCuq25slCYqVDagrUjutSfYKU4gJ8HgpdweGg
	4wya1hG8rvmzy+GJeh/6Yb0dZ42MRjVz0HVYCZMiqMzIWHXAq/G6wcQBSogHoCbT1CAE
	KXbg==
X-Gm-Message-State: AIVw111Zm4B8gNID1l4nVTc38hThfhkv/mQQzOziXLfkd0zB4UAvgbNW
	8hdm26VxpwfTew==
X-Received: by 10.46.14.17 with SMTP id 17mr4333487ljo.61.1501696043323;
	Wed, 02 Aug 2017 10:47:23 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id w25sm744622ljd.61.2017.08.02.10.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 10:47:22 -0700 (PDT)
Date: Wed, 2 Aug 2017 19:47:22 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170802174722.GJ4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-5-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-5-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH 04/15] target/arm: Tighten up Thumb decode
 where new v8M insns will be
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tBk8qOOsQ196

On Wed, Aug 02, 2017 at 05:43:50PM +0100, Peter Maydell wrote:
> Tighten up the T32 decoder in the places where new v8M instructions
> will be:
>  * TT/TTT/TTA/TTAT are in what was nominally LDREX/STREX r15, ...
>    which is UNPREDICTABLE:
>    make the UNPREDICTABLE behaviour be to UNDEF
>  * BXNS/BLXNS are distinguished from BX/BLX via the low 3 bits,
>    which in previous architectural versions are SBZ:
>    enforce the SBZ via UNDEF rather than ignoring it, and move
>    the "ARCH(5)" UNDEF case up so we don't leak a TCG temporary
>  * SG is in the encoding which would be LDRD/STRD with rn = r15;
>    this is UNPREDICTABLE and we currently UNDEF:
>    move this check further up the code so that we don't leak
>    TCG temporaries in the UNDEF case and have a better place
>    to put the SG decode.
> 
> This means that if a v8M binary is accidentally run on v7M
> or if a test case hits something that we haven't implemented
> yet the behaviour will be obvious (UNDEF) rather than obscure
> (plough on treating it as a different instruction).
> 
> In the process, add some comments about the instruction patterns
> at these points in the decode. Our Thumb and ARM decoders are
> very difficult to understand currently, but gradually adding
> comments like this should help to clarify what exactly has
> been decoded when.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/translate.c | 48 +++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index d1a5f56..3c14cb0 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9735,10 +9735,23 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>          abort();
>      case 4:
>          if (insn & (1 << 22)) {
> -            /* Other load/store, table branch.  */
> +            /* 0b1110_100x_x1xx_xxxx_xxxx_xxxx_xxxx_xxxx
> +             * - load/store doubleword, load/store exclusive, ldacq/strel,
> +             *   table branch.
> +             */
>              if (insn & 0x01200000) {
> -                /* Load/store doubleword.  */
> +                /* 0b1110_1000_x11x_xxxx_xxxx_xxxx_xxxx_xxxx
> +                 *  - load/store dual (post-indexed)
> +                 * 0b1111_1001_x10x_xxxx_xxxx_xxxx_xxxx_xxxx
> +                 *  - load/store dual (literal and immediate)
> +                 * 0b1111_1001_x11x_xxxx_xxxx_xxxx_xxxx_xxxx
> +                 *  - load/store dual (pre-indexed)
> +                 */
>                  if (rn == 15) {
> +                    if (insn & (1 << 21)) {
> +                        /* UNPREDICTABLE */
> +                        goto illegal_op;
> +                    }
>                      addr = tcg_temp_new_i32();
>                      tcg_gen_movi_i32(addr, s->pc & ~3);
>                  } else {
> @@ -9772,15 +9785,18 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                  }
>                  if (insn & (1 << 21)) {
>                      /* Base writeback.  */
> -                    if (rn == 15)
> -                        goto illegal_op;
>                      tcg_gen_addi_i32(addr, addr, offset - 4);
>                      store_reg(s, rn, addr);
>                  } else {
>                      tcg_temp_free_i32(addr);
>                  }
>              } else if ((insn & (1 << 23)) == 0) {
> -                /* Load/store exclusive word.  */
> +                /* 0b1110_1000_010x_xxxx_xxxx_xxxx_xxxx_xxxx
> +                 * - load/store exclusive word
> +                 */
> +                if (rs == 15) {
> +                    goto illegal_op;
> +                }
>                  addr = tcg_temp_local_new_i32();
>                  load_reg_var(s, addr, rn);
>                  tcg_gen_addi_i32(addr, addr, (insn & 0xff) << 2);
> @@ -11137,7 +11153,9 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
>              break;
>          }
>          if (insn & (1 << 10)) {
> -            /* data processing extended or blx */
> +            /* 0b0100_01xx_xxxx_xxxx
> +             * - data processing extended, branch and exchange
> +             */
>              rd = (insn & 7) | ((insn >> 4) & 8);
>              rm = (insn >> 3) & 0xf;
>              op = (insn >> 8) & 3;
> @@ -11160,10 +11178,21 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
>                  tmp = load_reg(s, rm);
>                  store_reg(s, rd, tmp);
>                  break;
> -            case 3:/* branch [and link] exchange thumb register */
> -                tmp = load_reg(s, rm);
> -                if (insn & (1 << 7)) {
> +            case 3:
> +            {
> +                /* 0b0100_0111_xxxx_xxxx
> +                 * - branch [and link] exchange thumb register
> +                 */
> +                bool link = insn & (1 << 7);
> +
> +                if (insn & 7) {
> +                    goto undef;
> +                }
> +                if (link) {
>                      ARCH(5);
> +                }
> +                tmp = load_reg(s, rm);
> +                if (link) {
>                      val = (uint32_t)s->pc | 1;
>                      tmp2 = tcg_temp_new_i32();
>                      tcg_gen_movi_i32(tmp2, val);
> @@ -11175,6 +11204,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
>                  }
>                  break;
>              }
> +            }
>              break;
>          }
>  
> -- 
> 2.7.4
> 
> 
