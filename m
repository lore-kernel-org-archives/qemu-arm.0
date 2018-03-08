Received: by 10.28.91.67 with SMTP id p64csp1099878wmb;
        Thu, 8 Mar 2018 03:18:25 -0800 (PST)
X-Google-Smtp-Source: AG47ELv58StUkp2Gc65TUleR9Vj3yvX8OzAoTENCZE3LENNEFAwqhZ5nuzIp/s/LTTtsLMTzrB7R
X-Received: by 2002:a25:2f8e:: with SMTP id v136-v6mr16144700ybv.156.1520507905706;
        Thu, 08 Mar 2018 03:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520507905; cv=none;
        d=google.com; s=arc-20160816;
        b=MOGWK2xPa7uN8Z7INWkAqk39hF3aXuady37Rn7rGZlVFl+ZqCN++Z3wpO2wOSo2/D/
         e6hheWY0aktBWQIUZtzfjw/f8alIH1ZDSaFDJZ4VRhu8m3b4WaBc+OS94cDVmnLCtMFU
         Kef3uAN2SG0+0rAOWGzb2DhHobCI/XEAW6XVOTMfBbBzC/I7ujrAXntrXe8ZvOb64BC5
         8zaBNf9ltb2q8G55fbBGZ6Uj7rvCDFDiC4Mdzbdm5ZsBlM0JmbFZaJX7sVg+dhsafhsP
         HD9weBqnA3aLSlffXQAJwK3ZNjw3DtQYolgIElbNJvLpNbGoXOz0LYJPLg+U2Eu0Hh2W
         wJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=7UmUc26BaPbaUqULmMNNL38gZSiwhDhtfQZVGxbNKd0=;
        b=V33LZvd8hmiQ67TIs1LJL2aZmrCFh3JE/0EBSridKI4kUcczFgYONQvnq9B1sFj+Ou
         hLTzHi0nnNWrL2sUkB6/B2HsU9BUNGc/kckGSzdwErKqzBeqdcjTh7s5K3p4xr5LXrDH
         aBjLJFyoppi4rAV28K5A+bVmDd3vdNdTyUROkuNuepnZPrqH69PNcCa02bTde/LJcWvs
         6trfMoheuPwOg27ZZtx2W9cuVyGNl3Clu5APRBwvfcH2AM17GWOtXHvjMF8K4/Q7teUH
         PNTvhywMKGfi6TtL/K2TOURAZNz9/eYPiX7O/kLvypXmgD3wu2qk0igDGRnDqHKJoX+Y
         B3Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KzbOZlnl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h18si3327459ywm.89.2018.03.08.03.18.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Mar 2018 03:18:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KzbOZlnl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ettZ3-0003rW-74
	for alex.bennee@linaro.org; Thu, 08 Mar 2018 06:18:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ettXp-0003QM-Ot
	for qemu-devel@nongnu.org; Thu, 08 Mar 2018 06:17:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ettXo-0000yl-R8
	for qemu-devel@nongnu.org; Thu, 08 Mar 2018 06:17:09 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:40171)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ettXo-0000yZ-Kz
	for qemu-devel@nongnu.org; Thu, 08 Mar 2018 06:17:08 -0500
Received: by mail-ot0-x243.google.com with SMTP id l12so5056088otj.7
	for <qemu-devel@nongnu.org>; Thu, 08 Mar 2018 03:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7UmUc26BaPbaUqULmMNNL38gZSiwhDhtfQZVGxbNKd0=;
	b=KzbOZlnlcwk4OK/MyDkxJWcg87crxwUeSsdGy+mE+6hZQHeBvvx61qffohmMuikOJm
	fgqp/xHMVQOBkW6nRMV+xZk8FiAF9JZT4ZuScERbcf9cW6i3xQMRrXuiF3L2aQPbszzD
	pbRHyKumtHrGJyu7IEaEjxK83rZypRywSWtPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7UmUc26BaPbaUqULmMNNL38gZSiwhDhtfQZVGxbNKd0=;
	b=MRrgsQUNy8hA6TC/FZltRoyZmU1onczeo6R+QWFmNz+Kk1IKqx4KjnvfOngIKaBqee
	xVkxm9yYJGyldCIcmJervSvk3r05Y8OYbU4SYN7hRfTIq0Xkf4dwPgKViqiZTN4vl0Ky
	DwaS6SANZ6cemgZABkDcO8Kwu6kDTuzm9yu3m9j3rOkIr+smSKXa6e4jHykzqhe7WkGe
	9kazgx4L+XBkacE5vXj0+rSBI1JJ4L4u7robkBf/axF875D8K6q0ou36PZ8+zY257Ikl
	XdoK4d0o3BZvhI31ALWDhvzwu2Av73j7SJG2n2y9a3ZB2J+bqTQ+fYD7adIgi3ZgP7F/
	dURg==
X-Gm-Message-State: AElRT7GmbC9r1aNMC0yGaH5T9+t//Ni+uVHqw/TlUiQDnKJtDuoP6KHP
	Hw66rVGbx3yHBZAESaAIjnd9yxsMRthJD+ym9jsFQs4T
X-Received: by 10.157.28.156 with SMTP id l28mr18261323ota.316.1520507827817; 
	Thu, 08 Mar 2018 03:17:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 8 Mar 2018 03:16:47 -0800 (PST)
In-Reply-To: <20180307180358.30393-1-marcandre.lureau@redhat.com>
References: <20180307180358.30393-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Mar 2018 11:16:47 +0000
Message-ID: <CAFEAcA8WmSL1WLb=KAHDVo=N7gMSju_oOcP2Tn7b=nYzc2GLhg@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH 1/2] arm: fix load ELF error leak
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wikat6HDgoxO

On 7 March 2018 at 18:03, Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.c=
om> wrote:
> Spotted by ASAN:
> QTEST_QEMU_BINARY=3Daarch64-softmmu/qemu-system-aarch64 tests/boot-serial=
-test
>
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0x7ff8a9b0ca38 in __interceptor_calloc (/lib64/libasan.so.4+0xdea3=
8)
>     #1 0x7ff8a8ea7f75 in g_malloc0 ../glib/gmem.c:124
>     #2 0x55fef3d99129 in error_setv /home/elmarco/src/qemu/util/error.c:5=
9
>     #3 0x55fef3d99738 in error_setg_internal /home/elmarco/src/qemu/util/=
error.c:95
>     #4 0x55fef323acb2 in load_elf_hdr /home/elmarco/src/qemu/hw/core/load=
er.c:393
>     #5 0x55fef2d15776 in arm_load_elf /home/elmarco/src/qemu/hw/arm/boot.=
c:830
>     #6 0x55fef2d16d39 in arm_load_kernel_notify /home/elmarco/src/qemu/hw=
/arm/boot.c:1022
>     #7 0x55fef3dc634d in notifier_list_notify /home/elmarco/src/qemu/util=
/notify.c:40
>     #8 0x55fef2fc3182 in qemu_run_machine_init_done_notifiers /home/elmar=
co/src/qemu/vl.c:2716
>     #9 0x55fef2fcbbd1 in main /home/elmarco/src/qemu/vl.c:4679
>     #10 0x7ff89dfed009 in __libc_start_main (/lib64/libc.so.6+0x21009)
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Thanks, applied patches 1 and 2 to target-arm.next.

For the future, when you're sending a patchset that's more than one
patch can you make sure you send a cover letter, please? The automated
tooling wants to see the cover letter, and if there isn't one I have
to mess about with fishing the patches out of email and applying them
by hand, which is a faff.

thanks
-- PMM
