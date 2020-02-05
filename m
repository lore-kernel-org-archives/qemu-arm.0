Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp385393lfp;
        Wed, 5 Feb 2020 09:42:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQfSX40ukgYJwHp8YjVdOwFYUcTBzNm/jiNHrhjM4Usr6or92xWwvUwcLWSHE2BKZMj/GA
X-Received: by 2002:a37:a94b:: with SMTP id s72mr33717838qke.465.1580924521199;
        Wed, 05 Feb 2020 09:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580924521; cv=none;
        d=google.com; s=arc-20160816;
        b=CX94JsgO2DJqYyod52yUhO1i45woN2f4+hBji+k3v3LTzHmboCuprEGMTMvxbSKqT9
         MiAD0xvwRbEWNSQBVZvi23CXEXDCDCoAaPEiKBXXLaM1IpnBlX5UKg7BbZWeivh4a9md
         n7yK5NtY3qqgny3P4WY7ELBIehgYi4j+7sCNBprjyd5yXoMpe8f0bY5j75zxf/UMGsl0
         3rJe7+mSO6WGwz/wZo7GcxfQ5iHo0eQisyk8uGsx1V2DOiYFkmXFRRyD8GcaNCRPfrm6
         fL6hw22r89MZs+mVOSwzTQVQkUmvQVaP3AemqpEi6MEqbZnCi5q2jBHs2EuRi9zjP//M
         cyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=k2R+sdrdCqixjtOKdrO7AexYszN8Gyqyhbt8hcacXnA=;
        b=QUkZ2GmOIXOy5qzdx6hcwS+HMvALyrqYtUfOXhQcNFG++ukuA+1YAxC8s9oPbIweXX
         2okaS78LVOat1KcF3swh5StXfVsaN/dzsuU9e04q8uKfx0hO1Y0h8dmq+IMMjd8lO7Iz
         g/WH+eRS5w7zpdGdsEBWGufpAIQ7+m+DE/dtCaloThvl6d887XucQ7EjbNUdMxN32XJq
         R1oA+efis0tAWztE+wiKSCuKqwQNMVBxFhqOTrtaA3s9uptnzBW0KMcnoN28YK7En5l9
         4LerOqsRV3DXcfBp2Cb44Qqzio6LlCqJY0czjP/oIQar3WLXOhqGWX6D+jrm1KLo1OQd
         zaSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BcA38xUF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si107781qtq.373.2020.02.05.09.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 09:42:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BcA38xUF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izOga-0002IU-Kv
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 12:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1izOfQ-0000z1-2z
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 12:40:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1izOfO-0002ST-J3
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 12:40:47 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1izOfL-00023M-3a; Wed, 05 Feb 2020 12:40:43 -0500
Received: by mail-oi1-x244.google.com with SMTP id c16so1587680oic.3;
 Wed, 05 Feb 2020 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k2R+sdrdCqixjtOKdrO7AexYszN8Gyqyhbt8hcacXnA=;
 b=BcA38xUFXf6A5ruAgmzgvIIeycHxYZckK7DoaDwAo+MlHDQVGJIEWfNNtNRQduIhTY
 cz+RgKNLi2wHeq7/wshzDkAUXJZeZn3SGdI47+3MayweZPnoSmVZtVET9HLrJ/btJI0T
 VdXaBK9p1GIt5/INRIiOknALKoV0kTi9VwTKHeHJC8fANvN6T8vasz1AKo0rGX1jrhqK
 CQDaWpeq+ASPZUw2eSBVW/qkZSutnU4rg4m5VuWWrFuKgtDOeKMDTh6Dwix4lbz+243O
 F1dhRlvoZCBpvT9RVPgPpUj51+Wd5XAn8J+le4gTaO8kQ3od2sCyDUStir0I8L6dsI6L
 UfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k2R+sdrdCqixjtOKdrO7AexYszN8Gyqyhbt8hcacXnA=;
 b=ODoXdi4UDKb+Ec3setFn+lBnKJJHNgu/P0NQiWl39ykpN8eOXvTH88ziGwTETw+SDx
 ZiU5Jw3idG7FPqZ0/XZgkwdo/Txjs2VfiFG/wjAG3XEIUHLNhUpyiQKQGPlKPWhPFS4W
 OEEZCt+X3eO8K9Plv8aPS0I6mop5MdYeZo9T5zh7DxkCPpQ/TsLDkrmTFVapfiQr/eG8
 XkdG9lB7rpF2Plnr3YJXrnj0s0e+beHVXcjqD+Uj9oiJFZfOUiS62kwpDAlR4kb7Owxs
 R43OzN7HLmLkbll8SoDBMOEpQrLqvhsuiLvI7eA3vYFZSTqvG9y6a+eSFWgpAte71TyY
 Eipg==
X-Gm-Message-State: APjAAAUdJm704Gz9qiyPlYYeUhhHlYKf5fLo9gV/vPCXsJp0WtrFe/wz
 Nnq3n15EGg64ui9MJLdecE0KsFZJBqTeTpbsROg=
X-Received: by 2002:a05:6808:3ba:: with SMTP id
 n26mr3990354oie.62.1580924442052; 
 Wed, 05 Feb 2020 09:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
 <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
In-Reply-To: <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 5 Feb 2020 18:40:31 +0100
Message-ID: <CAL1e-=gd-ymYd3_cods8BAtwbQeJFodmnmsNo-gLx381rXHKxQ@mail.gmail.com>
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WCZREwaAU+E3

On Sat, Feb 1, 2020 at 7:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On Sat, Feb 1, 2020 at 7:51 PM Thomas Huth <thuth@redhat.com> wrote:
> > On 01/02/2020 17.09, Philippe Mathieu-Daud=C3=A9 wrote:
> > > On 11/20/19 10:10 AM, Thomas Huth wrote:
> > >> It's been deprecated since QEMU v3.1. We've explicitly asked in the
> > >> deprecation message that people should speak up on qemu-devel in cas=
e
> > >> they are still actively using the bluetooth part of QEMU, but nobody
> > >> ever replied that they are really still using it.
> > >>
> > >> I've tried it on my own to use this bluetooth subsystem for one of m=
y
> > >> guests, but I was also not able to get it running anymore: When I wa=
s
> > >> trying to pass-through a real bluetooth device, either the guest did
> > >> not see the device at all, or the guest crashed.
> > >>
> > >> Even worse for the emulated device: When running
> > >>
> > >>  qemu-system-x86_64 -bt device:keyboard
> > >>
> > >> QEMU crashes once you hit a key.
> > >>
> > >> So it seems like the bluetooth stack is not only neglected, it is
> > >> completely bitrotten, as far as I can tell. The only attention that
> > >> this code got during the past years were some CVEs that have been
> > >> spotted there. So this code is a burden for the developers, without
> > >> any real benefit anymore. Time to remove it.
> > >>
> > >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> > >> ---
> > >>  Makefile.objs        |    2 -
> > >>  bt-host.c            |  198 ----
> > >>  bt-vhci.c            |  167 ----
> > >>  configure            |   31 -
> > >>  hw/Kconfig           |    1 -
> > >>  hw/Makefile.objs     |    1 -
> > >>  hw/bt/Kconfig        |    2 -
> > >>  hw/bt/Makefile.objs  |    3 -
> > >>  hw/bt/core.c         |  143 ---
> > >>  hw/bt/hci-csr.c      |  512 ----------
> > >>  hw/bt/hci.c          | 2263 ---------------------------------------=
---
> > >>  hw/bt/hid.c          |  553 -----------
> > >>  hw/bt/l2cap.c        | 1367 -------------------------
> > >>  hw/bt/sdp.c          |  989 ------------------
> > >>  include/hw/bt.h      | 2177 ---------------------------------------=
-
> > >>  include/sysemu/bt.h  |   20 -
> > >>  qemu-deprecated.texi |    7 -
> > >>  qemu-options.hx      |   79 --
> > >>  vl.c                 |  136 ---
> > >>  19 files changed, 8651 deletions(-)
> > >>  delete mode 100644 bt-host.c
> > >>  delete mode 100644 bt-vhci.c
> > >>  delete mode 100644 hw/bt/Kconfig
> > >>  delete mode 100644 hw/bt/Makefile.objs
> > >>  delete mode 100644 hw/bt/core.c
> > >>  delete mode 100644 hw/bt/hci-csr.c
> > >>  delete mode 100644 hw/bt/hci.c
> > >>  delete mode 100644 hw/bt/hid.c
> > >>  delete mode 100644 hw/bt/l2cap.c
> > >>  delete mode 100644 hw/bt/sdp.c
> > >>  delete mode 100644 include/hw/bt.h
> > >>  delete mode 100644 include/sysemu/bt.h
> > >>
> > > [...]> diff --git a/configure b/configure
> > >> index 6099be1d84..ecce4ada2d 100755
> > >> --- a/configure
> > >> +++ b/configure
> > >> @@ -349,7 +349,6 @@ unset target_list_exclude
> > >>  # Distributions want to ensure that several features are compiled i=
n, and it
> > >>  # is impossible without a --enable-foo that exits if a feature is n=
ot found.
> > >>
> > >> -bluez=3D""
> > >>  brlapi=3D""
> > >>  curl=3D""
> > >>  curses=3D""
> > >> @@ -1151,10 +1150,6 @@ for opt do
> > >>    ;;
> > >>    --enable-brlapi) brlapi=3D"yes"
> > >>    ;;
> > >> -  --disable-bluez) bluez=3D"no"
> > >> -  ;;
> > >> -  --enable-bluez) bluez=3D"yes"
> > >> -  ;;
> > >
> > > Now than I'm bisecting over this commit, I realize removing this
> > > option was not a good idea, we should have done like commit
> > > cb6414dfec8 or 315d3184525:
> > >
> > >   @@ -886,10 +885,6 @@ for opt do
> > >   -  --disable-uuid) uuid=3D"no"
> > >   -  ;;
> > >   -  --enable-uuid) uuid=3D"yes"
> > >   -  ;;
> > >   ...
> > >   +  --enable-uuid|--disable-uuid)
> > >   +      echo "$0: $opt is obsolete, UUID support is always built" >&=
2
> > >   +  ;;
> >
> > Looks trivial ... so if it bugs you, just send a patch?
>
> I thought about it but this won't fix much, it is too late now.
>
> I simply wanted to share this bugged me so we try to avoid doing the
> same mistake again.
>

I vote for addition of a change similar to what Philippe described.

Furthermore, it looks to me the correct way would be to now do full
deprecation of --enable-bluez and --disable-bluez. This means adding
this to documentation (not related to bluetooth devices support), not
only a change in "configure". This also means that only after two next
full cycles these options could be removed.

True, this could have been done together with bluetooth devices
support deprecation (and in that case we could have deleted these
options right away), but it wasn't. Users don't have a crystal ball to
know that we assumed that --enable-bluez and --disable-bluez were part
of bluetooth devices support, and could rightfully complain about an
abrupt elimination of a compile time option.

This is my understanding, at least.

What do you think?

Aleksandar
