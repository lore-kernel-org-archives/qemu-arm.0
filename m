Received: by 10.223.159.74 with SMTP id f10csp3086816wrg;
        Mon, 18 Dec 2017 12:28:19 -0800 (PST)
X-Google-Smtp-Source: ACJfBovJk+gqwCjM4ygGFAKiXkgi+PK5Whhyy4WEkqXcdc3fPHPfNy+Ow3EyX5WskTdck96F/eIS
X-Received: by 10.13.202.134 with SMTP id m128mr781132ywd.88.1513628899675;
        Mon, 18 Dec 2017 12:28:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513628899; cv=none;
        d=google.com; s=arc-20160816;
        b=gYAbmkvWOLDmozEYXDQVz6Ay6oT5afp3aG8yuxoxpogvAOFTDO6ZP2vOCpdtPY5Nmu
         5M5LsMmZGDEpvpsUjw6gsJUZSeMdrFriSbBY1UClEE2Gb0SQ3yjLw2c3HNG+eHozjO0H
         Pv3enAaCBfrUJxmc31nA14ht1r0GS1l/bW3YuAg42phiNig2Rpam1CN8n0vb4WQjMDpg
         czLmd4gxh0ZHz/FgwJr6D4boaLSUFLZTVNBgmIu/DglsImKl0Q6ooZHt+Z6eFh+yHIdA
         lSHi1SgbIcMvpMAlqZZRBkV1WvvfgoNwzavkb65ljkw3awn61+zxyPEu0VNqWhiy20QR
         d4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=+A1BeGIX2iev6zY0/UzqfvEx8IftBTsoyCpYmhBdiaE=;
        b=pokiMwK9BK6Qi3ZEYGtN1TZTV3ilj8B7I09+sxn1bbhGQSInJR0OcMkAnbR+flvQt4
         feS/CBIVLkNnhDXPrM/rXiYj/Icq6tAATEOqSpkgw70CpRMyIzUGVOli/1i90IPmukCA
         sZVaP4sjL27m+xpFA+VEC8EJJMTT5RAgGD4j+RK13jOzdR1Lo7ib3Rx10NWJpS1UDqY0
         W/ZQs3+uaXDV5ay//GsIOO35N51+HuliZLWIAn41beurb6lwJce6zmSAMs0cTqIB1QQr
         I+eD73XVI8t+HWG107l73Xl3tkBhlDj3wYV5p/zfGfK3FCQLwSJPn7fOKh9gfZ/4tOoQ
         dz8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vw7B6odv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k191si1382824ybk.97.2017.12.18.12.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 12:28:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vw7B6odv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR21L-0008Ou-6Z
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 15:28:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR214-0008Ng-03
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 15:28:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR212-0008L5-Ta
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 15:28:01 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:44179)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR20w-0008Dt-QI; Mon, 18 Dec 2017 15:27:54 -0500
Received: by mail-qk0-x243.google.com with SMTP id h19so19967976qkj.11;
	Mon, 18 Dec 2017 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+A1BeGIX2iev6zY0/UzqfvEx8IftBTsoyCpYmhBdiaE=;
	b=Vw7B6odvQAc36yRAKX4yd6fJQtPfu9p+3yi89/7z+apSO8cY4GLIciSAsDa995n2SQ
	h5RsbFGD3Z5mKqVHz/nBS5I18PSo/RHJS/OxTsmM9ZNaLQXLsUe5sVVlEi2Bj72aHnMC
	fLa49E0Yjz1oWgG69q6QVtavm2mdq4Aijm3KgJGJjvDoJQ10gpwXP3GwRICaHmGrB+1t
	/lLo+SkedJOt39CLnE7D4EOCNGxYivYxjf5wcij8Tmg4iNtYL4rs1MUaFnE9EbodrBmm
	qQ7XojQ4pvzAyWEw5pqRkFHfch32n/NfeF9qSo2rE/BxSNBrGoh0/tEDfeB8LASUdtJF
	zpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+A1BeGIX2iev6zY0/UzqfvEx8IftBTsoyCpYmhBdiaE=;
	b=Vp49h75YCi0MIeM23Aia59J2j5vDhLh4H9PlgaM3B5TgazeTpLoLg5vk4oCRk+xpR4
	G2bz/c3ZarbktHetmObMBEXO9tN0ZUUd6cnwWfb0olFGbea6qXZ40AM03eH+OEzFerWb
	oBej0IeZuC4/ThUtK6iBUYJfEja39Mbwlm3224IsZLIxO1LDeBE5dFMpCZUH+MjUbHWI
	q4K7AeNigy9Vr7t9m10YmnH90EhMMWCKZafi+4I3BG0SH6ykrjYQLo0mTeEbcHbaCqw5
	gJWZi6wNhPRv7EWzBgbIivVm83NXAkSmEHKnnnURRZtVb7czARTj7u6Aug57mt67ZZ8B
	8tyg==
X-Gm-Message-State: AKGB3mIkgs5+EXPIGm3JS4+NqJ42RXEp0Q0Tp2a/6K5jefbHiCmn92JT
	qWybg9tNoqQqvII/Vj5xkOKi6lTG
X-Received: by 10.233.220.198 with SMTP id q189mr1474937qkf.109.1513628873239; 
	Mon, 18 Dec 2017 12:27:53 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	f142sm2959224qka.35.2017.12.18.12.27.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Dec 2017 12:27:52 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0f5b89dc-2d8d-7490-c6a7-39aea14e23e7@amsat.org>
Date: Mon, 18 Dec 2017 17:27:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171218173022.18418-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/9] target/arm: Mark
 disas_set_insn_syndrome inline
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JLLr4UO5bMaF

On 12/18/2017 02:30 PM, Richard Henderson wrote:
> If it isn't used when translate.h is included,
> we'll get a compiler Werror.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index cd7313ace7..3f4df91e5e 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -108,7 +108,7 @@ static inline int default_exception_el(DisasContext *s)
>              ? 3 : MAX(1, s->current_el);
>  }
>  
> -static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
> +static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
>  {
>      /* We don't need to save all of the syndrome so we mask and shift
>       * out unneeded bits to help the sleb128 encoder do a better job.
> 
