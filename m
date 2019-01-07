Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3591825wrt;
        Mon, 7 Jan 2019 07:56:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6yG6fvj0k9zQmCFbVr7W25NJYxB36F6mSGwDv9p+a2i+IiQdQK2s/RdFWUQMd2b6fOMsgv
X-Received: by 2002:adf:bc02:: with SMTP id s2mr50618705wrg.255.1546876610273;
        Mon, 07 Jan 2019 07:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546876610; cv=none;
        d=google.com; s=arc-20160816;
        b=f2eihqH7xcuQhWKKJBf2sBx2W3oZQ4l3sEeua+NyydVPdOUr8ZP/lnmpBxGncp4qDw
         P3Xft9BboOd4hc45zIm/ZranxkTKZvoGFc/pFIZsMTMkAmY5WJgwgLi9wM0RwDQP9opg
         6LF0TZXxcYyJsj00JhAyCQR389jVgqPkqe9rWkZfyY2AxX1HI2ggY+/QdwCl9NkxRNWy
         ONLFPBDct+BwTYBl6UiDeeSYRLTcQBiexZreaZhhAGpFjvtANtJxcSINtS3ijpRfEJoo
         tHulHTpSguHZ/TOMP84cZnUbNjeaMw+ddkAETmR2/juwf+U1GFWDgPuCoy6z8ewD3bxs
         VIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fVvqfy5DojXhSEsBWbIEakjhypJgufu5AY98V2lE7Ug=;
        b=ColQyp0JJkMCJ5PEfemqGd66MtuoViilrC28kZLX53eHhgFBcj8I6nafE+dZ9Lyse6
         ksvQWqBGPzR2EUgkO54Sw6N2rjX4KQQJnnZNQIQzixEHoyhEJaFYNszDKru4U90d6Dmj
         GTca4Ym9lqkAk6qIUoF2UZVUl5ZWU1GZMDW0hqKkm0sfsbttzRuUE3NBIHuVItqz3h4T
         joEyfJ9Ld6knanv/Zr4vljrFqnRhvX5lV0YCJtLlqvF0vlSARqJE3QDBRdquzK9yFcvu
         M15cRVWX7Hg4qMp7J52zvQnw50kzUvgDSSaZS3plVe8+xuL6KGWXhNV4fR58uV1pCoOV
         WI0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jCqeCR6r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si36391041wrj.423.2019.01.07.07.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 07:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jCqeCR6r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggXGj-00005J-C6
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 10:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggXG1-0008At-Rt
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 10:56:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggXG1-0002Y9-6w
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 10:56:05 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggXG1-0002Xb-1L
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 10:56:05 -0500
Received: by mail-oi1-x244.google.com with SMTP id j21so679925oii.8
	for <qemu-devel@nongnu.org>; Mon, 07 Jan 2019 07:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fVvqfy5DojXhSEsBWbIEakjhypJgufu5AY98V2lE7Ug=;
	b=jCqeCR6rrohEIzs1DwNR6Z0nO2TXilhm8RxDBVhyLpI7sfd7bExiV+FA1z8vcxsfMT
	pc1sSsKdy3wAwRRRjFmZyAim/4Pu8d9wEVDr58VvDtv6h32uMb+a5JWpN4B+lrM+5pRr
	u4Li25s+cjE0v1Ah3qXECr2SNP2mhEUudLviM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fVvqfy5DojXhSEsBWbIEakjhypJgufu5AY98V2lE7Ug=;
	b=fZrufX99tzQy8KgGP3pYJ+vs0Z/oEJffexjwNeVIruYHO6HIJdbRVNjLrk57rAfS2c
	Z5fOymGIWCsbr+W+gI/XpLVPglwo4DF24gyOrIoPtcDfWISVc1aMlLN1Mvo1QskigixE
	54UpubJXAAy8rhC+ERYYjAe48Jl7UCy20GEsZiG9bMUBaoiDmRwPLtY73gOB2ke5w2M3
	wxRiRUo3fAwwQa9sZV5fvzjgoAlSxtzlgbEsswnbeeCl0xAVFrLZV1F8jxR9QPD2h4uC
	KRn3Nx+Yk03JR9NeH+saVD4g4/kBal+MZdSaNlPusW2aI3HhIaBBjqURQE8DDdIe5QvP
	2zvA==
X-Gm-Message-State: AJcUukdeDVIZGFm+lbpuVe34sj3cti1hkXNN8kFOSBUvK6lSnECrjaE7
	57xylh1jo/YD+N8tedrMML1tHTxEQqbK1BAM0PXh0g==
X-Received: by 2002:aca:5c05:: with SMTP id q5mr7944758oib.146.1546876564125; 
	Mon, 07 Jan 2019 07:56:04 -0800 (PST)
MIME-Version: 1.0
References: <11488a08-1fe0-a278-2210-deb64731107f@gmx.co.uk>
In-Reply-To: <11488a08-1fe0-a278-2210-deb64731107f@gmx.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jan 2019 15:55:50 +0000
Message-ID: <CAFEAcA8V1F=0tL3+P+EfGcKEi50OogCfHmYSUvPkUjEocUWFWA@mail.gmail.com>
To: Nick Hudson <nick.hudson@gmx.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v5] Support u-boot noload images for arm as
 used by, NetBSD/evbarm GENERIC kernel.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQpHfshfnfdk

On Mon, 7 Jan 2019 at 08:31, Nick Hudson <nick.hudson@gmx.co.uk> wrote:
>
>
> noload kernels are loaded with the u-boot image header and as a result
> the header size needs adding to the entry point.  Fake up a hdr so the
> kernel image is loaded at the right address and the entry point is
> adjusted appropriately.
>
> The default location for the uboot file is 32MiB above bottom of DRAM.
> This matches the recommendation in Documentation/arm/Booting.


That avoids the bootloader-clash issue nicely.

> Clarify the load_uimage API to state the passing of a load address when an
> image doesn't specify one, or when loading a ramdisk is expected.
>
> Adjust callers of load_uimage, etc.
>



Applied to target-arm.next, thanks.

-- PMM
