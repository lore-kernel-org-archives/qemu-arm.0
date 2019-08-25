Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3163323wrs;
        Sun, 25 Aug 2019 14:43:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSYkKspiyxUic3qV3JS6Z2fXJD/vALiRUABHPS6Y6ocbRRO8Vc7TgMFpBc1rpel4/h4uDk
X-Received: by 2002:aa7:c586:: with SMTP id g6mr15727914edq.298.1566769420150;
        Sun, 25 Aug 2019 14:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566769420; cv=none;
        d=google.com; s=arc-20160816;
        b=zn6atOBGpVcQ+hceVlKmYbhdreLlr42RWD7WdCe6D9ircCU2lXkyEnzNwCJz7Z6doE
         zTqg5creHZsZTfHL6QoYgZrwR3lJ1XA6CORCkBwq0rYb2U69To8DUcNTEJO2M2jaZh1x
         Eu/bU/9oryZ9P1XT6DqHLrCuhB0RCxCyKN1WRHI0QtkdDUhu2O6NX+WQj3y7oiRrIlCP
         502bysIPHhTfgZ2JYHdSOJup8sjqUxkCBvjp4e9D483NyIer4qv29fV+ufYdnvU6zdtR
         1jLHKwnEW7Th68upR/mGNs1yoG2Fb8fp60iWTHXEd/gPQaBPaqSlV4gT13RJBkd2KQSU
         gnwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ImR4ENy5xzCZF9RNsJyzhjLrDvK1/C60uZRwJxzrzPU=;
        b=nW6YtBkdO0asPK1PbW/8eQNYFhHEiFUK5E84rVi5VsXt3dTcCp4NfKzIgnDrE+YeVd
         u3mk+Cr3RkO2Anxko//eZie+IYnpT7P+SpIiJZ/sXDIffXVmP/ngR+m8CSCttjnEb9IV
         EcgzpR3kcNJ87OYc8PP6K1pvRO7gSpjMc+WWjoQ/Ctv9HFD6zgu6pUZG7zE+umH2K1bX
         7dMAf2y7SFeFWprxJCTMHMI6Tmg73WhndU24g6r6jDEWLLNnoxiAK9DYNSjDpT9nh/+7
         qZ9qic+AWCHUspq/vy35h4Q+Al6Ms6Rke2wZASMywa1khysLRxEp8W8PeFTjNTLAbZSo
         CE0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FdjW+nNv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r38si5556855edd.400.2019.08.25.14.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 14:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FdjW+nNv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i20IV-0003aM-80
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 17:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i20IO-0003aA-HL
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:43:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i20IN-0003vY-Gw
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:43:32 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35288)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i20IN-0003uQ-BB
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:43:31 -0400
Received: by mail-oi1-x241.google.com with SMTP id a127so10728390oii.2
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImR4ENy5xzCZF9RNsJyzhjLrDvK1/C60uZRwJxzrzPU=;
 b=FdjW+nNvH2gsLe4wyqMbrk9TROHCwzVgkW9WWQlxXPSqIA7Rsqo4dSsH2i3hoJ2gOI
 NTggD/h2Y09DLsaeHSni9qjTsq+ulexObkPo+xPs+cqKr9yipdjiUpAZ4QOYHSbs1NtX
 ohj8JeLF507sajv84gLGafnVeK84O0rOxclJWKtqTZe0WaYv03iPDN+/kfMyQS33NrM6
 w9WY8tBj7Jcgs49F3u7T+awhH1OIjajZO3NqFkepoE5WyM/HCJRCsfY6I61OF6sBPG13
 CBp/EIpeic4bvIoaBs6NaMczQd2RRL0Znue16X7sKZPgVh281YK99JvuYKwa8/ugr8c8
 +jRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImR4ENy5xzCZF9RNsJyzhjLrDvK1/C60uZRwJxzrzPU=;
 b=UbRvERwEto/4/dI/3hIPfjIfQQfWxvRQw64OfMPCp9MbRBG5UC9wykg25YvQkIVM7W
 lVFkC/EesN7kaik4yCYs+aRhowR9B80rG2kDL0F8fZEdYV89QTKUks5zVyNCGEcYQKfJ
 6TZMNq3cT0X3PIRePPRHPgHaUgirtd3REhaN364LpltKEcPlaptw9gw9hij9twlVz0L0
 QoTrHZwaasoaI9tKRsqSwoPUwGweJIKWJlXCzz1NaLU+XEDv3l0Evi/yyQ7PEgi1e1X+
 U6krfdkeMmu0UWjoioWk6+cmu6wzIhSEkf4FLs8ASiDGUIuJaBP7GbHSoAmrn4AEKmpo
 Q51w==
X-Gm-Message-State: APjAAAXf3dLknETmccIt/371hNiXkOemKXZz7drxYQmQ3XsjDCu7BwPa
 0m20UkFMPGyOueiaUH1EfP8eZbUEP9yf41sKwSd4GQ==
X-Received: by 2002:a54:4718:: with SMTP id k24mr9915810oik.146.1566769410751; 
 Sun, 25 Aug 2019 14:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-54-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:43:19 +0100
Message-ID: <CAFEAcA9DehYFQspdna0mP+pKPj+YZnVi2WzZfzuc1z50P5c5LA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v2 53/68] target/arm: Convert T16 add, compare,
 move (two high registers)
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
X-TUID: bJTlQSw7zBUF

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 49 ++----------------------------------------
>  target/arm/t16.decode  | 10 +++++++++
>  2 files changed, 12 insertions(+), 47 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
