Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp397969lfp;
        Wed, 5 Feb 2020 09:55:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPxBAVBeB66nq1Imk6RBfmN8Yh7vLGDoV7MnCNen+/IgYasmz2aeOou/rnVo6v4gwVRwFa
X-Received: by 2002:a05:620a:7f4:: with SMTP id k20mr33881046qkk.483.1580925323676;
        Wed, 05 Feb 2020 09:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580925323; cv=none;
        d=google.com; s=arc-20160816;
        b=FAuBqcEU+TEpMZ7SUUdFkUlRORHqSRnH7ZU6LOQlfzXaFlZPElS0BRyX5yuYhos7Nv
         GHsLqoy7N4N9o6aIWeT7ihyHzN9TB3Yd2f25JAmhQ/KqnbMONNUXvnmOV+tHD/ca2CU7
         brtuDKL6dH7K93vSJ/8ggf/3Wa9UWJobF7aONLNXrFYHVmySnQ0HULw7FJrPgEKDZGcQ
         ul8L1KRZDuGzfBS0xhK7Bx3RZYFHnuSyBrCmrQSDNhX1xP3uQqFXInqDI24Xrc+uI/MU
         jpGL4yIRCe5zWJDFhyJCXlBRZYe/gWHQN4mZDHsdOrQAwxDuDMAylftCv3NG22ldcl9B
         yUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WcjfV6jtv09m2W2iGyYyuQo3fsacRY9Qezp+vGQ9Qk0=;
        b=mBUgJ1ldLT7pbU6iCscTl/zC+Ou3ndzhCtEWr4ldxbkGhJDTlKNty1bUoC4GRN32Lq
         cZ3MtXaRI01XeBqicl5oxz6szt+svf7bSIb3ZKJwx83A3KQwZTlURWqRqU2UrmkZj+Yk
         kAyypVRmfuNELRTt2yvsgrUpFbVXQ4MV7T9SqsJ3jmcs/cyl0qJMx5NdvuGHPQesqwIK
         fiWzrekryAr5rr5aoi8JkHc4JZXYB8qfGfCHresZjBNnIdINYwkqCcCfVTotBcH8pQwS
         N7pG7uvIc4syxzIaNdWgfnFV4sX7hb8yiSfO3Qvk8OshVqYkViflt+fAqJnLB/JcMOEX
         gl5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CPikHwa2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26si289334qki.257.2020.02.05.09.55.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 09:55:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CPikHwa2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izOtW-0000wJ-VV
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 12:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1izOt9-0000bA-6w
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 12:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1izOt7-0003mh-Mz
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 12:54:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57424
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1izOt7-0003fA-HC
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 12:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580925297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcjfV6jtv09m2W2iGyYyuQo3fsacRY9Qezp+vGQ9Qk0=;
 b=CPikHwa2R5ewpJX/fp6a57vF7zKc6M/jOyTijVKIKcbjiGoIkccqtRSZEdiIBm0iHS0ua2
 a4WyxAhw1STzzORcwgK2kYzR98dn8E+HuYchADc2VJuhwlBXNpaI6unp5l8ae7mB/P0n40
 4rAQqSwuSKZ9smzrpc9NcKaxMXoUHs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-xkjzDxyrOQGkt5Z_HqOhKw-1; Wed, 05 Feb 2020 12:54:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7E8BDB60;
 Wed,  5 Feb 2020 17:54:51 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FE4F859A0;
 Wed,  5 Feb 2020 17:54:42 +0000 (UTC)
Date: Wed, 5 Feb 2020 17:54:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
Message-ID: <20200205175440.GU2221087@redhat.com>
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
 <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
 <CAL1e-=gd-ymYd3_cods8BAtwbQeJFodmnmsNo-gLx381rXHKxQ@mail.gmail.com>
 <9c1f04bd-a0e7-6fbc-68d7-fd5babf1e8d0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9c1f04bd-a0e7-6fbc-68d7-fd5babf1e8d0@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: xkjzDxyrOQGkt5Z_HqOhKw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f6amcB7vBHzH

On Wed, Feb 05, 2020 at 06:46:24PM +0100, Thomas Huth wrote:
> On 05/02/2020 18.40, Aleksandar Markovic wrote:
> > On Sat, Feb 1, 2020 at 7:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >>
> >> On Sat, Feb 1, 2020 at 7:51 PM Thomas Huth <thuth@redhat.com> wrote:
> >>> On 01/02/2020 17.09, Philippe Mathieu-Daud=C3=A9 wrote:
> [...]
> >>>>> index 6099be1d84..ecce4ada2d 100755
> >>>>> --- a/configure
> >>>>> +++ b/configure
> >>>>> @@ -349,7 +349,6 @@ unset target_list_exclude
> >>>>>  # Distributions want to ensure that several features are compiled =
in, and it
> >>>>>  # is impossible without a --enable-foo that exits if a feature is =
not found.
> >>>>>
> >>>>> -bluez=3D""
> >>>>>  brlapi=3D""
> >>>>>  curl=3D""
> >>>>>  curses=3D""
> >>>>> @@ -1151,10 +1150,6 @@ for opt do
> >>>>>    ;;
> >>>>>    --enable-brlapi) brlapi=3D"yes"
> >>>>>    ;;
> >>>>> -  --disable-bluez) bluez=3D"no"
> >>>>> -  ;;
> >>>>> -  --enable-bluez) bluez=3D"yes"
> >>>>> -  ;;
> >>>>
> >>>> Now than I'm bisecting over this commit, I realize removing this
> >>>> option was not a good idea, we should have done like commit
> >>>> cb6414dfec8 or 315d3184525:
> >>>>
> >>>>   @@ -886,10 +885,6 @@ for opt do
> >>>>   -  --disable-uuid) uuid=3D"no"
> >>>>   -  ;;
> >>>>   -  --enable-uuid) uuid=3D"yes"
> >>>>   -  ;;
> >>>>   ...
> >>>>   +  --enable-uuid|--disable-uuid)
> >>>>   +      echo "$0: $opt is obsolete, UUID support is always built" >=
&2
> >>>>   +  ;;
> >>>
> >>> Looks trivial ... so if it bugs you, just send a patch?
> >>
> >> I thought about it but this won't fix much, it is too late now.
> >>
> >> I simply wanted to share this bugged me so we try to avoid doing the
> >> same mistake again.
> >>
> >=20
> > I vote for addition of a change similar to what Philippe described.
>=20
> Feel free to send a patch if it bugs you.

I don't think we should do this (nor the original uuid compat hack
above). We don't want to set an expectation that configure arguments
are considered "stable" interface to QEMU requiring back compat.
This will constrain our future build system work as we move to
introduce meson initially and then gradually elminate more & more
of configure until it can be deleted entirely.

Certainly we should document configure arg removals in the release
notes, but we don't need to go beyond that IMHO.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|

