Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5826089wre;
        Thu, 31 May 2018 04:48:40 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJnf1pLOh4LNm/klGTdXLjjLFEv1w7EkfJ2OOnk4b/aX9x5xhCgflW61lR3mLrj0TjkIYUw
X-Received: by 2002:a37:13a4:: with SMTP id 36-v6mr5926708qkt.26.1527767320470;
        Thu, 31 May 2018 04:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527767320; cv=none;
        d=google.com; s=arc-20160816;
        b=TmnWmGGY0GcWZ8jc5muZR1pTP4xtNfYUHAHOAxV8WZ/HXAcXjDm/LSx1JwTsHPpB+M
         rhTx0cTdZMAs6ofnU4kyqbowuDLAly3Qjg63wQNPhBiQ6O9UU3y/754D8H8D0jV+dfxL
         yhtX0Rf5CRxXOC1kRCnF5CxVjOLcLnfGo/NyKOhI5OIRz9wybG35AVfRe1G+K1S2Xo7K
         hUzcY54Og1v2BoMu2jlCkYGUVimgb3iCOOr0JyuBkvH/iGd4e1MlekEYbVHnlLpg83jV
         UD96xIHYSROIa945uc2d3nIbE/0iH5Pn0ygrrpEBbgUOQHrl/MrDEEhgVJdGjs/VWt3M
         k7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NbWpRi5nbrgx0GqJt3BKn8Gkb2IGO+FGYd3CcgpOcF4=;
        b=gZJ9xID102l/8lkFbIg94GLbfpunDmLt+CyUJfLUQybgdJIhIQ1kezeYCPDMvu7B5e
         GHaYWTIgdkB8myWeDHBjRlNuCQow5kumx1EREX5GjMTIa7hMQ6tMWWDY6qS+3WeQpxJm
         Y1DQwhnumjCZ04E46a+3+PTARlWB0aIxyOarfoNEAxUhx3d74ig5DZ0XWqCZfkuCbgAB
         Oi+D4cRaorzoVz3rfOGz9YGD9NcdLPU8YQfWdfylV/ZS323bE/S4AK6Pej67mW99ghsh
         szeJsKrnSlDvRov9GloRcylRsOwQVH3PjzDk9fzExZTnnPNJUK+20l7HU8K01WydBrf3
         gJDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=e9mZy4X8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si6213314qtg.81.2018.05.31.04.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 04:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=e9mZy4X8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:43360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOM4O-0006be-0f
	for alex.bennee@linaro.org; Thu, 31 May 2018 07:48:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1fOM47-0006aL-CP
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1fOM43-0004zw-1f
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:48:23 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:38331)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1fOM42-0004za-S9; Thu, 31 May 2018 07:48:18 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81b80050;
	Thu, 31 May 2018 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=eNHnvUVZqvmBG0uxit3eT4sEaKs=; b=e9mZy4
	X8JFSGZjx2lQRhTfzc3gheVbO3P8BcP2lKD/KyWb6vb/NFEr8LgTvkAeDS35pRHs
	GUe5rCrwoshdf6YeRqjG/u7q/VXViK5sPuc1lc49etied/DPXtISsM2SPvrzT7Bq
	d7AWNDfaC+N4B318yXfYIeNqB0A/Kn344QcqNLd8EU9MXtC1bBi97ee6i72BBNnk
	tMm3MZJ/Vy8sPaI85OhPd/fGr577SkVaa6hRh3Pmwmv4ceG84PNuurysfsbCjRqE
	BMGqWKhJiPSRhyTNsm5UUzPBnxDwzlfvFFft9StmrkcAGXLsoVhakHjy26sBBunm
	/Zjucr6C3BanZokg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id af79b1db
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Thu, 31 May 2018 11:44:49 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id t22-v6so15796952oih.6;
	Thu, 31 May 2018 04:48:16 -0700 (PDT)
X-Gm-Message-State: ALKqPwcvz0dRag2dS0F3/Io1PsCazeZykyAyjnA1TbO9yo49qNy8zSwW
	4mlvh6TUz/km3BWb2ERzHZT7LHAQZRoMMmP2cBA=
X-Received: by 2002:aca:2b19:: with SMTP id
	i25-v6mr3912203oik.170.1527767295470; 
	Thu, 31 May 2018 04:48:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:c606:0:0:0:0:0 with HTTP; Thu, 31 May 2018 04:48:14
	-0700 (PDT)
In-Reply-To: <CAFEAcA_Ut0hjQ=25anhHtGgyY92++eTgyBwY1KbqRbLUeje0Hg@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
	<CAFEAcA-DyuObZjx-g2k9SkofLZ_akadfGYZCMum=3hQQLEdN_w@mail.gmail.com>
	<20171212151605.v2eoestysaogzymm@kamzik.brq.redhat.com>
	<CAFEAcA-t7XFxizUQMdo_JYTLet_a8ZL-Omg54gLOQC-=o+vjuA@mail.gmail.com>
	<CAHmME9oda=T6C53BYi-Op3cWbG2auBjVDoUWuiJoCyxxR298fQ@mail.gmail.com>
	<CAFEAcA_Ut0hjQ=25anhHtGgyY92++eTgyBwY1KbqRbLUeje0Hg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 31 May 2018 13:48:15 +0200
X-Gmail-Original-Message-ID: <CAHmME9pLYSwBQyus7vKu1zb48EF8D-X7vW=nuf2AV+xGN5ERbQ@mail.gmail.com>
Message-ID: <CAHmME9pLYSwBQyus7vKu1zb48EF8D-X7vW=nuf2AV+xGN5ERbQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another
 UART to the virt board
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zKv7KtzoSFa9

On Thu, May 31, 2018 at 10:32 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> It stalled on the fact that adding the second UART breaks
> UEFI images (annoyingly, UEFI iterates through UARTs in
> the DTB in the opposite direction to Linux, so if you add
> a second UART then it picks that one to use rather than
> the first one, IIRC). So it would have to be an awkward
> thing with a new machine option to request the extra UART.

Can you just add them in the opposite order for UEFI then?
