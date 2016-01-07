Received: by 10.182.158.201 with SMTP id ww9csp75149obb;
        Thu, 7 Jan 2016 10:23:16 -0800 (PST)
X-Received: by 10.140.253.3 with SMTP id y3mr147342585qhc.39.1452190996219;
        Thu, 07 Jan 2016 10:23:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w67si38164264qhc.101.2016.01.07.10.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 10:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHFDP-0005kK-Sl
	for alex.bennee@linaro.org; Thu, 07 Jan 2016 13:23:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHFDO-0005jL-8T
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 13:23:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHFDN-0000O9-8K
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 13:23:14 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHFDN-0000Ng-2C
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 13:23:13 -0500
Received: by mail-vk0-x232.google.com with SMTP id a123so147683899vkh.1
	for <qemu-arm@nongnu.org>; Thu, 07 Jan 2016 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rXHH5ppbI+ydWkjGosdLiNLWVicRunONMRUGCLxUDTM=;
	b=hsgy0L8tbN6zaCMguaKODds93Y6zYejhpEuhmewVwvxcgcZfVUKxHxOK9iEvilg+/d
	ti9Iwm1UNIS/azCIBXk0PDG8tNcWVb4SXdGc8vsMeZ7zRSnDsTNouj08o6NwOfClipoJ
	JZK0h5usKOJeOPOSY1fjkwkUHLyT9u4o0nmiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rXHH5ppbI+ydWkjGosdLiNLWVicRunONMRUGCLxUDTM=;
	b=YXCDoOfkt3Q+nBL4oHWgMEddIkE3WenDgk69DiegXojI8RoURo4jftbIzZBOLA7zvE
	kgpPg8mIDg4NEq7MKv7o5le4DlezWG/AJ78Mmq7Hs/mwLDQcJK2McNjHZB07h2cLILW4
	wDdBIorYwj/KmlUEC2796G38cr1aXOanjaghMUx46hvYdDqsx/WY4DhRLwLK+fvGI+72
	fZosqsa9S6Kdmhv7B/dXllLvnSldmQf834klLGH8ThoKongH0V8FkqGixoDHH49DI2HJ
	kaHQnHyWtEiodZ+3HHXjTuDGvGshSkcK/D/L/rmgCgGcBeO0mSjpcA6iRnTn+vQWM6MW
	+VFg==
X-Gm-Message-State: ALoCoQlpbo4udRq4nDo5UfbEjNllivNR1rbD0NPROCJjCwSGAhmIJmd6ETMazSYKD0ThHFJFDURekQxeSOKzhyq2qpn+PBA0lgVBeGijz+tH4Jnc2JIwjsA=
X-Received: by 10.31.0.136 with SMTP id 130mr69116418vka.139.1452190992473;
	Thu, 07 Jan 2016 10:23:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 7 Jan 2016 10:22:52 -0800 (PST)
In-Reply-To: <1450098259-8368-1-git-send-email-peter.maydell@linaro.org>
References: <1450098259-8368-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2016 18:22:52 +0000
Message-ID: <CAFEAcA82DiM63kHd6YN-8NeqAjx6E66WPX8J0QUBguFf3c5Xkg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Stefan Weil <sw@weilnetz.de>, qemu-arm <qemu-arm@nongnu.org>,
	Patch Tracking <patches@linaro.org>, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-arm] [PATCH] disas/libvixl: Update to upstream VIXL 1.12
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c6VPNq9mXXb8

On 14 December 2015 at 13:04, Peter Maydell <peter.maydell@linaro.org> wrote:
> Update our copy of libvixl to upstream's 1.12 release.
> The major benefit from QEMU's point of view is that some instructions
> previously disassembled as "unimplemented (System)" are now displayed
> as something more useful. It also fixes some warnings about format
> strings that newer w64-mingw32 compilers were emitting.
>
> We didn't have any local changes to libvixl so nothing needed
> to be forward-ported.
>
> Although this is a large commit (partly due to upstream renaming most
> of the files), only a few of the files changed in this commit
> are not just straight copies of upstream libvixl files:
>  disas/arm-a64.cc
>  disas/libvixl/Makefile.objs
>  disas/libvixl/README
>
> Note that this commit introduces some signed-unsigned comparison
> warnings on the old mingw compilers. Those compilers have broken
> TLS support anyway so have only ever been much use for compile tests;
> anybody still using them should add -Wno-sign-compare to their
> --extra-cflags.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I'm adding this (or more accurately the full untruncated
change) to target-arm.next.

thanks
-- PMM
