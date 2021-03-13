Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2332603lfg;
        Sat, 13 Mar 2021 11:41:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw5MPfQm9wdplrdo9dL3OcqkbunrsdAyJ2A4i4z0FtCC5NeXYp44fGrGjzan4UkhX4RpN8
X-Received: by 2002:a25:7645:: with SMTP id r66mr30103812ybc.36.1615664505175;
        Sat, 13 Mar 2021 11:41:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615664505; cv=none;
        d=google.com; s=arc-20160816;
        b=DLW8eSygyu6LMTN5MpanJNBQynuP2J2lzsPUiFzfBNIsM6a1MGm0CHn5oNUu0lD4pg
         NxOX0Dr7or6VM3Noo71qfZaW/3dCOM4XN+JQRGUzUIrgTSE3Gq3zo5zCN7MpWfsxLTDF
         XsevEsBZM9uHmkpIHxZ/NgTdaUk3AvKyQVoI1JAmcyRtV6j9VuaAAHiu9ZJzyAg2FaRp
         cg+u0gZcqzimf0XU//xqF3/ihAYd/aEhdzxlFATctC9F/1/UT/g1zw9mPwz7VstkMTBq
         5cM38JK9Aoh16OTlJfFfxQbIDFvsHEIcoDEzc5/EdS417BGBHmvihP+T0nxqZ0HK1b9o
         6yDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ggpIh+2lIg+KmVYmJL/X1nMsG4jQjjGgYqrMWoqo8Vo=;
        b=pRS80HPEsr/ILRBi5gLPoJnADpTSY7KzQSPQ66Lhkmbb7UseOIeFLwIhKGrVXOioLJ
         q8ux9mQy8bkJTWMs4oQoQV3/mjYITouL5Z+iAiU/HIWCebQ/EX1vlGyKyBM+I7hQgl+5
         UhpgXuf7NohJylQ9yt4jIiaRiymS+IfDkdLNSXMPAh4CqYXEsg1BH90BvKu/88rnAZWV
         cDuhlky4tBOYGBAS4bD3AyUPX+9l1+Fkv2W5C1ed5kDelmFT7l7WBX4ebE8s9oZDd0Bd
         NrmTXqL1WTuuRQUEFEtBEZS4GODjYnQDDStgcUI3TQOBf7ZNiCSRnSm+Z89lgyq16BUz
         5jeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K/qRFpqY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si10642148ybq.162.2021.03.13.11.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Mar 2021 11:41:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K/qRFpqY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lLA8u-0001a7-Fu
	for alex.bennee@linaro.org; Sat, 13 Mar 2021 14:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLA8h-0001Xk-Ut
 for qemu-arm@nongnu.org; Sat, 13 Mar 2021 14:41:33 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLA8d-0003Mv-KZ
 for qemu-arm@nongnu.org; Sat, 13 Mar 2021 14:41:31 -0500
Received: by mail-ej1-x633.google.com with SMTP id si25so4050838ejb.1
 for <qemu-arm@nongnu.org>; Sat, 13 Mar 2021 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggpIh+2lIg+KmVYmJL/X1nMsG4jQjjGgYqrMWoqo8Vo=;
 b=K/qRFpqYdx4ULJsjg2T1xv/LVLqFqcb1s6MMl1R3hOnz8vZypLHnALCHk+PvolgfOA
 pdEhfkkx2v3KG5dMJD4Zgw6lvSMPjv6PuoiORGFir1m8psHwykKFhZFkJVJqqAyVdWDB
 6CVOclUlrQg04v8RJDKYM6M27InwwmpQ99SQ4LeW4IA0nxR+NGTUJfQjIsr5WgcVzIOc
 YkvcHK1zNhgN3b1zJFommsJ3wQfJKhB7QG80gWTy+sLwIKByQUUjUAwt/+58nl3xeoQi
 +gib0Ve6DMFsUGjJUL3e3y3PxJXqv0max3H4Hm02i9qAOa0I5Ts7yIgXG5spDlNpgV6e
 RRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggpIh+2lIg+KmVYmJL/X1nMsG4jQjjGgYqrMWoqo8Vo=;
 b=i6zCZWcDxVqJA/cC6FTdsN6hpGCOv6y+eOPmUXRCOgpPmt7xS/NKXkW8BdgTfRfJVp
 Oty36lxxU1hDbeUoZYdoTks37c4mDBvmF7BkFWfzG5CR6g8msrGfJkQsbpMJLkcTRCx2
 9S4F3zfvev24mcJ628bCvs18/HoJf66qiCBqB+HGIttmjB/ZPn0fxCndqxBgtvo0SAiV
 QXrB1hiiPTD84/T1R41o9/UK6M4Pr429K7S9b0/21YN3y7JkbcJWeyts3e46tb9SFNLH
 FrJD0E7jjWXd03rS+aiMwXOkY5JHKFH0vjv8tInngahkV73rTVCiDxMBnRgzdJJoBPEu
 5QYQ==
X-Gm-Message-State: AOAM531MBIe/4TVD09s65QKAh79l0PAlruhxachTHROEAKoAxBF9O1wG
 F7PEpX26sGQdfEV7NxRv5XrPpQ6ogSVUpdEptX6zKw==
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr15622174ejd.85.1615664484284; 
 Sat, 13 Mar 2021 11:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <CAFEAcA8PN3EQN_E8zo0qUP=F7cAg=XvuUc2V6iop8YOOYxMGxQ@mail.gmail.com>
 <657618fc-9e62-6c24-c65d-ccc7375c7fcc@linaro.org>
In-Reply-To: <657618fc-9e62-6c24-c65d-ccc7375c7fcc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Mar 2021 19:41:13 +0000
Message-ID: <CAFEAcA88EPzz2kh3gwL99nv=JxYcDQdBJxCDzOO5FfZ1NkQT9Q@mail.gmail.com>
Subject: Re: [PATCH for-6.0 0/2] arm: Make M-profile VTOR loads on reset
 handle memory aliasing
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kumar Gala <kumar.gala@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BB0MVYVhAJvj

On Sat, 13 Mar 2021 at 19:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/12/21 12:59 PM, Peter Maydell wrote:
> > On Fri, 12 Mar 2021 at 17:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> This series handles the possibility of aliasing by iterating through
> >> the whole FlatView of the CPU's address space checking for other
> >> mappings of the MemoryRegion corresponding to the location of the
> >> vector table.  If we find any aliases we use rom_ptr() to see if the
> >> ROM blob loader has any data there.
> >
> > The other possible place we could put this code would be
> > to put it into rom_ptr() itself. You'd have to change the
> > callsites to pass an AddressSpace to rom_ptr(), but really
> > we ought to do that anyway, because a Rom has an AddressSpace
> > that we should be checking as well as the address.
>
> I like this as the solution.

I realized that checking against the Rom's AddressSpace
is likely to be a bad plan, though -- in some cases the AS is
used to allow the loader to say "load this image to AS
such-and-such", and we don't want to fail to find the ROM
blob because the rom_ptr() code is reading it from a different
AS that is an alternate view onto the same actual MemoryRegions
(eg Secure vs NonSecure and the RAM is in the same place.)

thanks
-- PMM
