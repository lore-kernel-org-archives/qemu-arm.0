Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1743267lfm;
        Thu, 16 Apr 2020 05:19:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypKIseTdSuDpr9c85dieR1qAjQuZoz3rVXkOTu5wqQIhMXCGh6oDCA1j072xdFHM6YeUhKJD
X-Received: by 2002:ae9:c20d:: with SMTP id j13mr29847048qkg.360.1587039588385;
        Thu, 16 Apr 2020 05:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587039588; cv=none;
        d=google.com; s=arc-20160816;
        b=iYv/hCJEaDBqj0TR7NYruA2BJ90qHZAPh/8dLhEw3Wrjv7trInjhDJensajPUBIZsk
         sNhQagy8kMBbMn/LSOaOCo6lWscrntqWda+sMoVkm+/Y0STxlG725ZymEcU3nGBkhd+D
         dT8SXn2/1F5P63AMGAcJL1uiUiFEIpfoxyGQaSC7YcQVJR9L2P7rok6c9Y8QasbqfVe6
         Vdrl/ssMP4mwI7jOXd3TQ27Fk+ejMudSdWbxKHVby5VEMwEe9atBxzM1iXw8kMG4ZeLT
         aJ55KXpy8SHXzZ0VIMYwkcjaea9bwoSKQ6uXP03WvJ4bmD1haKaI9kVUrqmGEgRfZTe8
         0oDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ZcsL05B1ot02DO4kYp6bZ4rMjBwIUOtktRMVs6NzEc=;
        b=aBxf9t296WEWfpYHGKa2W21p+gVxNTsB3N+boUKBb3J8eUSvP2YPC0SqkTnSYWwu8T
         6PcnNSP8Wzw9/n+MqQcEVIzTNjlzOdHkaJCvdKEO7C8oLN7Xs2OOrnDyghvHoHKT53gb
         LnPrw1Isx+cu7Xdibn4KDkwwii9B4lNYMJUcA0N5rkiH4jXZZ6vpfXkYlHT6v0ij2QoT
         xv7boGGwY3ehjL2SIg+5WG9mAt77ur7USiFuPH0uHtgyq28jk957V+fDd4vGBWVj8tEB
         226vp3+nIAmjorOafgdPKh4LzPdgmB1WnkGZjnZuCVSiTtyepEeT+xuyuOpQnt255DRs
         EiFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kmBsc544;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si11178518qtb.123.2020.04.16.05.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 05:19:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kmBsc544;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP3Uh-0006lL-Qy
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 08:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53055)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP3UW-0006kw-UF
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP3UV-0003r6-SQ
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:19:36 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43079)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP3UV-0003qm-Ip
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:19:35 -0400
Received: by mail-ot1-x343.google.com with SMTP id g14so2830685otg.10
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZcsL05B1ot02DO4kYp6bZ4rMjBwIUOtktRMVs6NzEc=;
 b=kmBsc54465o72JnO26cLR08cEMimj71OeMpon2Ib/mDnwsb1E/8oWAr3A7ODnvMY8A
 ahtnSR+ZZegbcXzA/v5czG1JnAxnSUWwVO9bUs8VGKBsso3LBByzltklSpH129i6sTfL
 WrlV1PWJpdbTlU1BBtjSCk7tQIGxoXLwlMemrVZE5VPsrw2FrLqnDtn7tSqOFy9VNHIL
 1p+NAhdNuBtvxakDSBn/hdgWhdIZN1NhIY8hgpKqb7Nc38a2WPLjW3JYvHHcsTHudFcj
 DPrBy/vmtTTiePj66Jo16IMNnaSzNnWNY1cLZ/6TTgk1PWQKfZ5O5NsIRI9B0Ishmfzj
 Q3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZcsL05B1ot02DO4kYp6bZ4rMjBwIUOtktRMVs6NzEc=;
 b=Dnl68ZRTWv11nN44y3f1cO/apLO33TVi8uj8gLKXE132gAFVxfuq+riG+JyS3EVGps
 73a6whxVGr2VeLdkw5WnavwxHvWkikaMOn8EOZFfKGC1WjK+opKZzoYwLiVVnjxF3F7Z
 EScBfuDwp+WEh3ViXUerz1mu8KFait12AqVKPJNNHnNvWv0KO/hjAxZxm+wM48L1Why7
 XOTUY53Qpk0tAlArAnAVYgNqJoTPHTBUjH0zhUBsNNuixMI4iMM/D1NgLj2Hn/DbDhcH
 X9MY88+fnfqske5AtJ/hA5zUzuDPb+G2+rD/bGb+9TPEh3R5SIeDjylk0My3s4kFs6nC
 NFxw==
X-Gm-Message-State: AGi0PubxAp8Ylhd+EhYwE6rktedgIgapIAGmdk3ZpT6P3A8rLm0caVfh
 YuhB8grgB+Sr+lYnhnuJranm7QPjPaFuxuNMFUi6tg==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr7925564otj.91.1587039574221; 
 Thu, 16 Apr 2020 05:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-5-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 13:19:23 +0100
Message-ID: <CAFEAcA9D9cpx5vxtuaeVonFJ0NNKjMOB6viPuE0+ppGiqZSMFw@mail.gmail.com>
Subject: Re: [PATCH 04/16] target/arm: Use cpu_*_data_ra for sve_ldst_tlb_fn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kIc275H19kh0

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the "normal" memory access functions, rather than the
> softmmu internal helper functions directly.
>
> Since fb901c905dc3, cpu_mem_index is now a simple extract
> from env->hflags and not a large computation.  Which means
> that it's now more work to pass around this value than it
> is to recompute it.
>
> This only adjusts the primitives, and does not clean up
> all of the uses within sve_helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 241 ++++++++++++++++++----------------------
>  1 file changed, 107 insertions(+), 134 deletions(-)

> +#ifdef TARGET_WORDS_BIGENDIAN
> +# define be_bswap16(x)  ((uint16_t)(x))
> +# define be_bswap32(x)  ((uint32_t)(x))
> +# define be_bswap64(x)  ((uint64_t)(x))
> +# define le_bswap16(x)  bswap16(x)
> +# define le_bswap32(x)  bswap32(x)
> +# define le_bswap64(x)  bswap64(x)
> +#else
> +# define be_bswap16(x)  bswap16(x)
> +# define be_bswap32(x)  bswap32(x)
> +# define be_bswap64(x)  bswap64(x)
> +# define le_bswap16(x)  ((uint16_t)(x))
> +# define le_bswap32(x)  ((uint32_t)(x))
> +# define le_bswap64(x)  ((uint64_t)(x))
> +#endif

Am I confused, or are these just reimplementing
cpu_to_be16()/cpu_to_le16()/le16_to_cpu()/be16_to_cpu() etc from bswap.h ?

(It seems a pity to have to lose the memory subsystem handling
endianness for us.)

thanks
-- PMM
