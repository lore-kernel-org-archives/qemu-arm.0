Received: by 10.25.0.6 with SMTP id 6csp8917lfa;
        Tue, 16 May 2017 18:01:05 -0700 (PDT)
X-Received: by 10.55.187.196 with SMTP id l187mr202725qkf.185.1494982865514;
        Tue, 16 May 2017 18:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494982865; cv=none;
        d=google.com; s=arc-20160816;
        b=IOE3hJvvW7fREZ8G2IPv1p6sacsqol1mzV9DwQsgQdzxngsUD+giJLfbFGZ9HavsFb
         ctlZuYwdvyiAe7zy7GvegePsDpvR2MLlzyw3X+QbYoGwoXJdsg/4jAs2v+9ZhCAkfey4
         zt5HOFQ3Mz3oyIJVYfDPFFZ+pNi0aaI9NpQ0aNtfL7QvCGSAyGzMgOAr+CoLP99abKkn
         I+0MfFOdBXC2slyZnkv2sOCLP5OxeDav1tOqbh/4xUmVxLmczWRbUN5b4jVT2FPLd4OP
         bNJxWy9rS4EwtKtjTaCrePTiniPygF2VwNRTTCkZyBqjYDtQFtyb1uG5zWtVilm6yxiV
         YDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=o69kisNGgduRyLQKrib/7mUTYmbBtXXs09jc39XDhFQ=;
        b=EmeupBZujoY9jhX/8YNoK3ASzIP/wmWHss7qaU0Ex7zRg6UJZqfEBTY5FDknBRpyj3
         19RGsPJtspKg4mDWlHNCj0b6FeWUaACr3lP2p231c/1IgoTkglpEzBZhFhe9GtEihMC0
         4f68CtiK+CYg8yavRoR9ZVxzr63NORN4O/I87Ys5dZBx/CxuZQxzz86JyRg1XpaeBzjw
         E/VxXjkIYrnvlaMVG9nL0ql0iZsQPMMCWEeb0GY824uIbnGPE5EsV5JxmRVIOMU1QdtK
         C+d0I0dVVSN+99M/TlpqTZkoXFCnk3LHL2BSHUwnyFWK7sdmrcnjiBztvZ6rndBdVQlh
         FyLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d58si477986qtf.326.2017.05.16.18.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 18:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAnKr-0003tq-0S
	for alex.bennee@linaro.org; Tue, 16 May 2017 21:01:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAnGb-0000ie-B1
	for qemu-arm@nongnu.org; Tue, 16 May 2017 20:56:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAnGW-0005Cv-Je
	for qemu-arm@nongnu.org; Tue, 16 May 2017 20:56:41 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36553)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAnGW-0005Cc-FT; Tue, 16 May 2017 20:56:36 -0400
Received: by mail-qk0-x241.google.com with SMTP id y128so25213378qka.3;
	Tue, 16 May 2017 17:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=o69kisNGgduRyLQKrib/7mUTYmbBtXXs09jc39XDhFQ=;
	b=kw0IBgkRKS12QtsgwjkR1XyFlYmjd/krYw0Gt/RGmKBte+2r6O8185UnOippMqTd9c
	kOTHgNGOpANL2LZ7HtzDq+zGs70NeGlJJ8hxhp1LTme2eh7yd35JiVO1EkIVHV6o7mvZ
	bW34CucfiOiQY5YDk4uNyem+EHuw9HeDLaipjtHi486sf29Nh7ptuNytWW5bUpTNS9JM
	RbgDED5K9OjHV8vlsK7NT46LSezM/DdS+64irJOr9mx+q9u9bFwMVvsTlPawZUWNhchS
	o7yGNAewUjb+flaciLPwa2Jwascm61yIi/+kkhxa2J6Oi5IxuGR1+FyTXaOmzWzSvMYF
	ogjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=o69kisNGgduRyLQKrib/7mUTYmbBtXXs09jc39XDhFQ=;
	b=XDeaArfwKykEUkVAuUUnUvwY4AtZVKdZ56ckitSyx4yVVmvZMfSB1Jc1Wzm9nmUJEk
	5HB8gLSBxM+S/153UBscU0l12ChzbUErRPNe075aJ2Kf1wuCQtCa+PSKJBI08Dt2KKMb
	d/9ZeFu5JdThLh5q7D/8ug3BcYRpIo7hrpD0hBYj/bNy7C95jGc7Xd9fcl8eIGA+EXOu
	TVG9/XstxlzaSKzWHhQeWHSxP6j8ibc0UCS4mA7osy7aEYFjpKYf93hBt2MMTxbV+xao
	4byqWrcUPEBfW7a01HJ5WWMxkEod/en9W1Z5N6x8YWauH3LpFRO+rHvbFuoGUOVArKby
	t6PQ==
X-Gm-Message-State: AODbwcABG9S3cUAAbau9nI4+wtkvhVW34Fv56DIA8fc/Iwepyx3Q1FPf
	2ZV3AIvZIr02pw==
X-Received: by 10.55.95.5 with SMTP id t5mr770141qkb.64.1494982595828;
	Tue, 16 May 2017 17:56:35 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id k26sm336226qtb.69.2017.05.16.17.56.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 17:56:35 -0700 (PDT)
To: Aurelien Jarno <aurelien@aurel32.net>, qemu-devel@nongnu.org
References: <20170516230159.4195-1-aurelien@aurel32.net>
	<20170516230159.4195-3-aurelien@aurel32.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <acf24fae-f9a4-fd99-dfe9-b60cbd735e5e@amsat.org>
Date: Tue, 16 May 2017 21:56:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170516230159.4195-3-aurelien@aurel32.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH 2/4] target/arm: simplify and optimize
 aarch64 rev16
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gDrcxNsYkUXN

On 05/16/2017 08:01 PM, Aurelien Jarno wrote:
> Instead of byteswapping individual 16-bit words one by one, work on the
> whole register at the same time using shifts and mask. This is the same
> strategy than the aarch32 version of rev16 and is much more efficient
> in the case sf=1.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate-a64.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 24de30d92c..ed15d21655 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -4035,24 +4035,12 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
>      TCGv_i64 tcg_tmp = tcg_temp_new_i64();
>      TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
>
> -    tcg_gen_andi_i64(tcg_tmp, tcg_rn, 0xffff);
> -    tcg_gen_bswap16_i64(tcg_rd, tcg_tmp);
> -
> -    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
> -    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
> -    tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
> -    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 16, 16);
> -
> -    if (sf) {
> -        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
> -        tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
> -        tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
> -        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 32, 16);
> -
> -        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 48);
> -        tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
> -        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 48, 16);
> -    }
> +    TCGv mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
> +    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
> +    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
> +    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
> +    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
> +    tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
>
>      tcg_temp_free_i64(tcg_tmp);
>  }
>
