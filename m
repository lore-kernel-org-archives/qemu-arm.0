Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2091410lfp;
        Sat, 1 Feb 2020 10:53:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyjYW+ppc+w+/fZDvapLNNv4WXNIehaxqsw/Kh4YCC7XPgYtdxYEifArhhYE/VMRmi5qQWA
X-Received: by 2002:aed:3324:: with SMTP id u33mr15966004qtd.322.1580583231153;
        Sat, 01 Feb 2020 10:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580583231; cv=none;
        d=google.com; s=arc-20160816;
        b=UXt6ERhmhMkPkyS4Ry12gLG3k1zYqxxNCTY7akvv0YZQBuSJzbHXJPfrw1LTSz1RwQ
         a1tcC2nrNGEqXJLD/9o56rrYL2K6BuIcMP53cDv6/2ss8GE25SzSTxBEIiNsR5r/OJYI
         RqPp5r68OCutryBj3V4Zb10zN4fSE7J5CWHC3TvY95A3zkSbS1jmQL6qryq5dMsKKl1A
         9Hx2VEIegDlNLPQ1s+R2PVTYhqPaDkKOwI+mboiP3aBZD2Njbj090B0xHg6gzUjAqrvP
         9U1Iuq+Y8ZGqYCoCHlrdcay+VHyiNJpH2ghB/Xoltu2JA3HS5YkYb6J4rWZOFLL9z6oJ
         Yf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=LxBxfjU6UpH7d7NY+ZsQ4fWGmoFMOfcL+a2XD3Z33Ls=;
        b=anIforOGSxNVO+QDRqTBqdaDSf6TYnGU2A+hHKApx1D/0jAjKz8XOAH6L2OUITIQgt
         /u27ztykfza1/njLtTim2oGD3Vp6Wzx8So3Kk9I3SluBwLtgD7s93Qu1z4bnzc9hE/ir
         jlH5JMojXRIR3aWdoQaEiM6/3JrfgtC9QAshTkJoSEt9BFuaTmbih5NeTqmL0O3ZI8g4
         fC/8wJXlVqdjSrSbkTgIQZICK05bpJvo7E6Fut6HXq1CE+rRE1ivV4iYA4JSMZt2KmFL
         VXPcOjfoUIOlTvF8bpdMLgdLejmL3CSZAtgBmCTINLuyR6Yn1Dmwdw8DQIrNOg7QOD/l
         wNMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si8451024qvf.42.2020.02.01.10.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2020 10:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixxtu-0006yO-Ir
	for alex.bennee@linaro.org; Sat, 01 Feb 2020 13:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixxtm-0006x3-Ky
 for qemu-arm@nongnu.org; Sat, 01 Feb 2020 13:53:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixxtl-0006t9-EZ
 for qemu-arm@nongnu.org; Sat, 01 Feb 2020 13:53:42 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:42223)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixxth-0006k8-54; Sat, 01 Feb 2020 13:53:37 -0500
Received: by mail-yw1-f66.google.com with SMTP id b81so8678686ywe.9;
 Sat, 01 Feb 2020 10:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LxBxfjU6UpH7d7NY+ZsQ4fWGmoFMOfcL+a2XD3Z33Ls=;
 b=PF7ORrrE+RWTm8ttnVxbgfBtR75Xa5vckjs4IajDZtHTuJ7O/McMFV2Cl0e87vfzmX
 GTDsV/u002HqS4/bEL4M4+jpZSG9XdolnzJdSZsaS1i3YusyGO0yMmbtyyu1JzWF4AlU
 RWjNnNPDUOC98stimSiE5cpaZxiGsFhoxGQtHtTCBPXKIoip9gucaQcNow00bxpYSgcf
 Ppw/ZESUoCt6oTtwMLrRcOTbzGBq5CPKjtnlUfKPh1q9VykDEvf6Xi3X+UHRZesjXKm9
 TV/kmC7CzMZyPeldo4R39lN5CT2kMUyA2XbUjwtJC3U+/Z+pGdYGgJ9Klet14lmAFwLu
 F/6g==
X-Gm-Message-State: APjAAAWeqkz4pjtBlrA6FyhKZxkyUKecda3wwk5BuK8qU8P+Ium7pRmN
 vCzZ1zZ3ZMx8QRclSoGVfgj+fjX2KntdonkyKKI=
X-Received: by 2002:a0d:d84b:: with SMTP id a72mr11778542ywe.33.1580583216230; 
 Sat, 01 Feb 2020 10:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
In-Reply-To: <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 1 Feb 2020 19:53:24 +0100
Message-ID: <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.66
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZTuQYo0JxeK1

On Sat, Feb 1, 2020 at 7:51 PM Thomas Huth <thuth@redhat.com> wrote:
> On 01/02/2020 17.09, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 11/20/19 10:10 AM, Thomas Huth wrote:
> >> It's been deprecated since QEMU v3.1. We've explicitly asked in the
> >> deprecation message that people should speak up on qemu-devel in case
> >> they are still actively using the bluetooth part of QEMU, but nobody
> >> ever replied that they are really still using it.
> >>
> >> I've tried it on my own to use this bluetooth subsystem for one of my
> >> guests, but I was also not able to get it running anymore: When I was
> >> trying to pass-through a real bluetooth device, either the guest did
> >> not see the device at all, or the guest crashed.
> >>
> >> Even worse for the emulated device: When running
> >>
> >>  qemu-system-x86_64 -bt device:keyboard
> >>
> >> QEMU crashes once you hit a key.
> >>
> >> So it seems like the bluetooth stack is not only neglected, it is
> >> completely bitrotten, as far as I can tell. The only attention that
> >> this code got during the past years were some CVEs that have been
> >> spotted there. So this code is a burden for the developers, without
> >> any real benefit anymore. Time to remove it.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  Makefile.objs        |    2 -
> >>  bt-host.c            |  198 ----
> >>  bt-vhci.c            |  167 ----
> >>  configure            |   31 -
> >>  hw/Kconfig           |    1 -
> >>  hw/Makefile.objs     |    1 -
> >>  hw/bt/Kconfig        |    2 -
> >>  hw/bt/Makefile.objs  |    3 -
> >>  hw/bt/core.c         |  143 ---
> >>  hw/bt/hci-csr.c      |  512 ----------
> >>  hw/bt/hci.c          | 2263 -----------------------------------------=
-
> >>  hw/bt/hid.c          |  553 -----------
> >>  hw/bt/l2cap.c        | 1367 -------------------------
> >>  hw/bt/sdp.c          |  989 ------------------
> >>  include/hw/bt.h      | 2177 ----------------------------------------
> >>  include/sysemu/bt.h  |   20 -
> >>  qemu-deprecated.texi |    7 -
> >>  qemu-options.hx      |   79 --
> >>  vl.c                 |  136 ---
> >>  19 files changed, 8651 deletions(-)
> >>  delete mode 100644 bt-host.c
> >>  delete mode 100644 bt-vhci.c
> >>  delete mode 100644 hw/bt/Kconfig
> >>  delete mode 100644 hw/bt/Makefile.objs
> >>  delete mode 100644 hw/bt/core.c
> >>  delete mode 100644 hw/bt/hci-csr.c
> >>  delete mode 100644 hw/bt/hci.c
> >>  delete mode 100644 hw/bt/hid.c
> >>  delete mode 100644 hw/bt/l2cap.c
> >>  delete mode 100644 hw/bt/sdp.c
> >>  delete mode 100644 include/hw/bt.h
> >>  delete mode 100644 include/sysemu/bt.h
> >>
> > [...]> diff --git a/configure b/configure
> >> index 6099be1d84..ecce4ada2d 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -349,7 +349,6 @@ unset target_list_exclude
> >>  # Distributions want to ensure that several features are compiled in,=
 and it
> >>  # is impossible without a --enable-foo that exits if a feature is not=
 found.
> >>
> >> -bluez=3D""
> >>  brlapi=3D""
> >>  curl=3D""
> >>  curses=3D""
> >> @@ -1151,10 +1150,6 @@ for opt do
> >>    ;;
> >>    --enable-brlapi) brlapi=3D"yes"
> >>    ;;
> >> -  --disable-bluez) bluez=3D"no"
> >> -  ;;
> >> -  --enable-bluez) bluez=3D"yes"
> >> -  ;;
> >
> > Now than I'm bisecting over this commit, I realize removing this
> > option was not a good idea, we should have done like commit
> > cb6414dfec8 or 315d3184525:
> >
> >   @@ -886,10 +885,6 @@ for opt do
> >   -  --disable-uuid) uuid=3D"no"
> >   -  ;;
> >   -  --enable-uuid) uuid=3D"yes"
> >   -  ;;
> >   ...
> >   +  --enable-uuid|--disable-uuid)
> >   +      echo "$0: $opt is obsolete, UUID support is always built" >&2
> >   +  ;;
>
> Looks trivial ... so if it bugs you, just send a patch?

I thought about it but this won't fix much, it is too late now.

I simply wanted to share this bugged me so we try to avoid doing the
same mistake again.
