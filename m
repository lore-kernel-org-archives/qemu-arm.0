Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3142211wrs;
        Sun, 25 Aug 2019 14:06:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy83drG0CAfosWtDNyvxRt5BZx1U6Onrv00O/PP44zYuuJgAfoY4KjuGSg8bY8BW6+ktuNo
X-Received: by 2002:aa7:cf0d:: with SMTP id a13mr15781720edy.286.1566767217576;
        Sun, 25 Aug 2019 14:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566767217; cv=none;
        d=google.com; s=arc-20160816;
        b=h6wQzIZR/H4D71eXwMb83y8DOMT/UKpOXehc5kyFoKESo9drRwDLFYmLjtiqXRfw4V
         0HQaWX0WSxQqdsxbYKLcD37Nwh8LGAF9eZDMk7j9lfXJfOVWjZMO9sMolwxomwjItN5p
         EJPftqNDMSGp4T2hDyn1fjzevvOuogbduL0+cMULDGG5jbrT0UwIk5Tdfit8FOzBECIS
         EexoR4m5jAOScZJ/eqQd/vYQ8dDZ+50n5ZqGfzLS3QwM/WCwQ4tMx8WIlB6bCHuovbRf
         cn74vSyS6hkVw/YHpwWk7RuXG52z7hyKqoO1OmWZFJjN6bWS9vjHJgqzJRv4qDqJ9+g3
         JbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kYa0+BniVg5HYZJqQ93aPKiuqjqbj3g8vhP2i3RlpWI=;
        b=DgGPwMoA2U3OSxMHIDDTmSCaSqeLpDgzZ922hGNQTscJ3i6t/Xgu244GoKv4NZg8Zp
         FPOCJ2GZcSQTntboeZ2KLiJA3+OEIoLD8a0r5tEeiUV0pdsp5lRrSDDW2BoXpy19J5lR
         L+TzZ9WzirSynGjKUcnldEFXMoxMCft1/uIkMj/wW60mj8XbPYb5N2165eb/0hxAHWnR
         VijeAsHt8Ny38MH9Wx6BGYii7liPSgPZVhD/ihGkzeuPAe57NqDFvdXqAmNx9EspTdL7
         amhHK4nRNW5mEybnnDHzp8dvZ0tMHeQ1LkXqr6JOQ3pWRHWeUWTZb9O42G04rO8xuBsV
         HzgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TXIlIYVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si4902451eja.242.2019.08.25.14.06.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 14:06:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TXIlIYVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1ziy-0008Uq-M9
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 17:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1ziq-0008UV-Ie
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:06:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zip-0007ex-HG
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:06:48 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45589)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1zip-0007eV-Cg
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:06:47 -0400
Received: by mail-oi1-x242.google.com with SMTP id v12so10676236oic.12
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kYa0+BniVg5HYZJqQ93aPKiuqjqbj3g8vhP2i3RlpWI=;
 b=TXIlIYVUAaiO9ZJTGk2wPcLzlSfRLbliYAWsmE9B0u7UAgj/1B+bfzlqvnboDtJXfa
 GnDULToW+UaCAlwiZcSe++AfiB1Ujg8eT+ECpUGQtW2W414lRhR9rIVa42Qb1Gle5gG9
 eGnLdMiEItqnOQbHh9nZfhsQ6S/Cnn5hbGplKnG/WzM4RyES6borA4yyFctDHtkyLF2F
 d4uClZSlm+4UC7mGZAiPTOX2pUToj70PsdaduAs+1O6pcG+Z/molQ9PLLBxumKe6R1E1
 FpO4s+VlO9sNUt1WrhdlMrum2ELh22/vzZIKmPw6TjRxM6qXW5ixa0KEmtpkO8afNSVz
 sM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kYa0+BniVg5HYZJqQ93aPKiuqjqbj3g8vhP2i3RlpWI=;
 b=IVut0vcLwIxRwJDO3/ixb+YuXruI++3UplhYjwvg7OjWBxaJPBybFg8BwA+7Ys7rSe
 gsQE7XroUj+Gff6gZXCmoKX2VNQ4oFGluESVdfIke+m+fvAd1089ekAwS8VtJqwmXP3J
 HN3pzvivm9/sYNDK7qhqSPDXyQKp7Y+sToeK1veI5uqYQLpf6kRooCSD5b2dZM/Wv1Eg
 v6tkXV1y/UefY2wv+CRHTvy8DPLYYX7wNxy9wN3f4UtVUizi2c2tw4VTMBktrefbwpe8
 aeA66KUVP4/ngmdrrfcbbRC5iiXDzWrEtN2Sy/XEtV0EcMHIReE/76O7YZfeYj7BRIut
 2ahw==
X-Gm-Message-State: APjAAAWVRWAY/r6XyHLNpeRDUqgv0iJ2300FjB2bhaqfYxxQk4MGOO5O
 25rJzNZMNBcCFQCe0UDXgfjbAqdIvIdCN1Gx1yIWDQ==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr9510414oib.48.1566767206415; 
 Sun, 25 Aug 2019 14:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-46-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:06:35 +0100
Message-ID: <CAFEAcA9Q9KJ7agTXN8LL_-+G69-kAUQMJV90Oh6QiFrRfdxCpg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 45/68] target/arm: Convert T16
 data-processing (two low regs)
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
X-TUID: 9+XjHWOInw/K

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 152 ++---------------------------------------
>  target/arm/t16.decode  |  36 ++++++++++
>  2 files changed, 43 insertions(+), 145 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
