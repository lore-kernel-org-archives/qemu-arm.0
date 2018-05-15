Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp271862wme;
        Tue, 15 May 2018 06:25:53 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq49yMjnkuPRQRBvWX2Ey6LQP5JQm7mdDbyqynIJGahJe8VDpOxylvdWKIk8JVa4+0Cshwm
X-Received: by 2002:ac8:2ec7:: with SMTP id i7-v6mr12935278qta.157.1526390753837;
        Tue, 15 May 2018 06:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526390753; cv=none;
        d=google.com; s=arc-20160816;
        b=cnGsTAzgd95wygv2lm3VDornF59Hv+INWMNRAZktMA0xulmXhfGLillfzpTHOsfhJA
         RZnTZLqCVOEfM3B4fdYEkDOp8lwnpWJ4WdXKWLnk/R2n3FVNqr+7Be2XXKI9YOIRWyAz
         y06Gsk07Ud+rseszh/Xoeuc+nDXzheCR2uA4P/M26At/9R7Ncko//BoGgygpeIfGTk9/
         DU3j00a3G2ShAkvd1WHcjfqbQoO2grcTSmW/XrVX1Cyi0jFgLdWeXyrCTFMD/7+W1sJf
         K6H5/kPsjSrp9owPrSxa287vHcG8fc8SvJybaMh87hw/d9N/R9/kjJrEGIOZn6nYk64z
         kIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=HjhxJJusenqNcKP4nlGmkhOz/1+QMSflq9j2QHqnvTM=;
        b=U+X9HqcYeMvEwaxPggwlAOfwKlmkVgNyjbOKx5u1VXF02vhs4KXyzuPjIf20x7Cs7c
         zAwz5k1l1uRagCVRjCB5MlZsrZlRmAjREK5HAIwrswq8rV3MeriaAUTDGxrraZit1Ifs
         GSEhNmKJYvIlfE7PVXTAOT8skUPpuLviNLNxLnjGhQobO/H/FnhXRdVhycsvepXkndoH
         xyp7vd/2/k63kEXoi112l/XuWnwzrqOuF4ndLyyGvREQCxKdDkoVowTB3EZaIm+3IgNL
         HH391PaHoUBNuimkmHAVbrX059ytMjojVynIBOlsZc/jdLgSCrM3WqSrXp75GpqvmgZN
         +kCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Swv+uO1v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t200-v6si63686qke.48.2018.05.15.06.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 May 2018 06:25:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Swv+uO1v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIZxh-00061O-BV
	for alex.bennee@linaro.org; Tue, 15 May 2018 09:25:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIZxL-00060i-0m
	for qemu-devel@nongnu.org; Tue, 15 May 2018 09:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIZxJ-00034P-6I
	for qemu-devel@nongnu.org; Tue, 15 May 2018 09:25:30 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:38492)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fIZxI-000344-Vx
	for qemu-devel@nongnu.org; Tue, 15 May 2018 09:25:29 -0400
Received: by mail-oi0-x244.google.com with SMTP id k17-v6so113993oih.5
	for <qemu-devel@nongnu.org>; Tue, 15 May 2018 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HjhxJJusenqNcKP4nlGmkhOz/1+QMSflq9j2QHqnvTM=;
	b=Swv+uO1vWwKfPqeY0FWNs35prpHBNCKIUa8bwm7Q9wYFJL/+5zanu/UeeTX8ok3a2r
	hA5HuhHrF6zQ0wyCWoiuN0CQipyka4TUMwIRvApX3VJnnVyjUxcX1nC18f7Tw1p0FkcX
	MUgfBGLJfhpKkhC2B4zs5t55fqEs/SFH2tgAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HjhxJJusenqNcKP4nlGmkhOz/1+QMSflq9j2QHqnvTM=;
	b=lWOUXgfh/pRonwXT61C7hl/30lfBCvaWMT44EyC8YK0AwWeAwyqAZfGivtbM4HTsYO
	hB78B8dToBQ3OdiGR3IgXb9vVw/5MsviES6clgUBJ9G+Gfkez/bcOXTpgsnkIDAyTdzv
	/ytTFDG/YuSdf/oGFGohSKe68no+QmJAE3LYGY67Ga6/aQIhJyufrQfKNQGMS2rw/Sbm
	gt6PL2NbW+W6kQYVFZSm7A0bc7X+zOrLiWO62XNeSCnPAGKrcBKt5imc6Rj6XZg9/T53
	S61IK5iRC/Gv6ySJWUxrh04qS2ra4Awtj+ZE4HLqnp4NOI/2rRGh8trwh8Jk/DNXVxcO
	AHvg==
X-Gm-Message-State: ALKqPwermO/qpwUFj1kPGdWgg1bogzGprMV75jNWC0eeI3pqNkkdoGDW
	6vC+DHX8T9/IW/aRGXwRlSUrls58HKkjuBx4QUvpnQ==
X-Received: by 2002:aca:4384:: with SMTP id
	q126-v6mr8990223oia.164.1526390728193; 
	Tue, 15 May 2018 06:25:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 15 May 2018 06:25:07
	-0700 (PDT)
In-Reply-To: <99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
	<CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
	<99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 May 2018 14:25:07 +0100
Message-ID: <CAFEAcA81y1r5N2zi5fPoV5iZ9dd0YBeThcX=qXdJXdNSNO8nsA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developer <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKFsDz1E3EwO

On 15 May 2018 at 14:13, Stefan Weil <sw@weilnetz.de> wrote:
> This is fixed in upstream vixl, in fact:
>
> https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337fda52845ed3d2e620cc02
>
> That fix will work for the moment, but is not sufficient for the future
> because it only supports gcc 7.x, but not gcc 8.x or later:
>
> +#elif __GNUC__ == 7
>
> How do we proceed with the code in QEMU? Do you have a plan to update the
> vixl code? As vixl is obviously no longer maintained on GitHub, I am not
> sure whom I could contact.

The github page points you to the linaro repo which is the new upstream.
That said, I think we're planning to deprecate vixl now we have the
capstone support. Richard, what's the status here? Could we just remove
the vixl code now?

> And what about my other question / suggestion:
>
> "I suggest to add and use a similar macro QEMU_FALLTHROUGH() for the rest of
> the code and can provide a patch if that's fine for everyone."
>
> gcc gives lots of fallthrough warnings, and many code locations don't
> contain a comment stating that the fall through is fine.

I guess that having the compiler check is better than finding them
later with coverity. It's a shame gcc doesn't support the standard
mechanism of using /* fallthrough */ to mark these, though.

thanks
-- PMM
