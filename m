Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2089736lfp;
        Sat, 1 Feb 2020 10:51:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBZyOdf7ZV0fcu5JoV0N45fcYYXDFwo3RbhiFWWGYmIMcURtBBb36ZEppdW30K5Q7txgYX
X-Received: by 2002:ac8:758a:: with SMTP id s10mr16805404qtq.283.1580583061920;
        Sat, 01 Feb 2020 10:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580583061; cv=none;
        d=google.com; s=arc-20160816;
        b=ymkBPyiBx2qY5OqRr9esxP2EtLaropnCDwzq2BKoKVkMGl7fsy/aN7npjUA2b3pPM5
         7Qp9pOLANft3s5Nf/PZOS5flRplIY5UEOBQMCxKS/v4jEAAVh8XhDyMs6YuR/hc6JafE
         ivp1KNg5dFncA8LlvTBsv2TQffjrPthCyihnm+HXmLMptTn80HQamoNz8i6pbSL4rrtY
         mvrhMGjLMmz3MMePqfX87C1RrDtHKxzdKT9AtX9U/rqs+VKEgtPLyvpxh3sWjKgHy8vF
         y/NDbB6XjaHdQO00f1zDSA5bYhbf7YVuR3iZlN07MvkbzoM0Din9yDii3OGXWWpBmPRm
         iogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=8nnr4GVWrVnvvf7zCirM1Z5pj+bWUMpJS97BgEupVSw=;
        b=R6vGY3v+B/oHJ/O3iAKaX5TYM7rqxyM13mk9R9jU8JJTlH2ehIRgbt2qwWNkwnbvm6
         MHHU/IVch90U6Jd1hwC+F+32T5LFYnLHqfTNFvYqOiH8Nzs3Q8ZzAob57kxde+1HQv5r
         xwbwdLA2lYc/p4KYxmKE++FUiYxVpAqG6gv6rlLihSGliOKZg8dxh2wct5mWM0b2Eome
         8VHVy7hxrTgaN79rskPC/NgB4x6k9Df22Bg1rX95aSwaSiNLVyjoXf6zrVUcE37CLfNC
         cMGj1N9Emk1dgb4F4qB6q1IhRWOWGOgnws8uNFEWlrcAbI8CVkwIX4AVwl3QVoi2N9mB
         ebYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JLu8W2J6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h26si8133143qtp.393.2020.02.01.10.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2020 10:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JLu8W2J6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixxrB-0005oC-CM
	for alex.bennee@linaro.org; Sat, 01 Feb 2020 13:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ixxr2-0005kD-EN
 for qemu-arm@nongnu.org; Sat, 01 Feb 2020 13:50:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ixxr0-00032G-Ea
 for qemu-arm@nongnu.org; Sat, 01 Feb 2020 13:50:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31000
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ixxr0-00031j-6b
 for qemu-arm@nongnu.org; Sat, 01 Feb 2020 13:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580583049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=8nnr4GVWrVnvvf7zCirM1Z5pj+bWUMpJS97BgEupVSw=;
 b=JLu8W2J6j2ZKzBkAkiJc0tDfsG3S2iIE1AhzQ8ivcUdoFWFJvzg7ilxxNd51Tgda3wbsqm
 H9uETJUFuqMVEoEtBiLy2gxTPBlTCYLxBsD1GnOcLyMe0j56h4BbUNuhov/3ct9saw3+zl
 g6Osn6yst3Svb99Kusof06fEEWFzggI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-SuXKwkl0MB-8RptCV2lQpw-1; Sat, 01 Feb 2020 13:50:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66B14107ACC4;
 Sat,  1 Feb 2020 18:50:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-27.ams2.redhat.com [10.36.116.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 484E95DAB0;
 Sat,  1 Feb 2020 18:50:36 +0000 (UTC)
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
Date: Sat, 1 Feb 2020 19:50:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: SuXKwkl0MB-8RptCV2lQpw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UwtVZ5D3nUaG

On 01/02/2020 17.09, Philippe Mathieu-Daud=C3=A9 wrote:
> On 11/20/19 10:10 AM, Thomas Huth wrote:
>> It's been deprecated since QEMU v3.1. We've explicitly asked in the
>> deprecation message that people should speak up on qemu-devel in case
>> they are still actively using the bluetooth part of QEMU, but nobody
>> ever replied that they are really still using it.
>>
>> I've tried it on my own to use this bluetooth subsystem for one of my
>> guests, but I was also not able to get it running anymore: When I was
>> trying to pass-through a real bluetooth device, either the guest did
>> not see the device at all, or the guest crashed.
>>
>> Even worse for the emulated device: When running
>>
>>  qemu-system-x86_64 -bt device:keyboard
>>
>> QEMU crashes once you hit a key.
>>
>> So it seems like the bluetooth stack is not only neglected, it is
>> completely bitrotten, as far as I can tell. The only attention that
>> this code got during the past years were some CVEs that have been
>> spotted there. So this code is a burden for the developers, without
>> any real benefit anymore. Time to remove it.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  Makefile.objs        |    2 -
>>  bt-host.c            |  198 ----
>>  bt-vhci.c            |  167 ----
>>  configure            |   31 -
>>  hw/Kconfig           |    1 -
>>  hw/Makefile.objs     |    1 -
>>  hw/bt/Kconfig        |    2 -
>>  hw/bt/Makefile.objs  |    3 -
>>  hw/bt/core.c         |  143 ---
>>  hw/bt/hci-csr.c      |  512 ----------
>>  hw/bt/hci.c          | 2263 ------------------------------------------
>>  hw/bt/hid.c          |  553 -----------
>>  hw/bt/l2cap.c        | 1367 -------------------------
>>  hw/bt/sdp.c          |  989 ------------------
>>  include/hw/bt.h      | 2177 ----------------------------------------
>>  include/sysemu/bt.h  |   20 -
>>  qemu-deprecated.texi |    7 -
>>  qemu-options.hx      |   79 --
>>  vl.c                 |  136 ---
>>  19 files changed, 8651 deletions(-)
>>  delete mode 100644 bt-host.c
>>  delete mode 100644 bt-vhci.c
>>  delete mode 100644 hw/bt/Kconfig
>>  delete mode 100644 hw/bt/Makefile.objs
>>  delete mode 100644 hw/bt/core.c
>>  delete mode 100644 hw/bt/hci-csr.c
>>  delete mode 100644 hw/bt/hci.c
>>  delete mode 100644 hw/bt/hid.c
>>  delete mode 100644 hw/bt/l2cap.c
>>  delete mode 100644 hw/bt/sdp.c
>>  delete mode 100644 include/hw/bt.h
>>  delete mode 100644 include/sysemu/bt.h
>>
> [...]> diff --git a/configure b/configure
>> index 6099be1d84..ecce4ada2d 100755
>> --- a/configure
>> +++ b/configure
>> @@ -349,7 +349,6 @@ unset target_list_exclude
>>  # Distributions want to ensure that several features are compiled in, a=
nd it
>>  # is impossible without a --enable-foo that exits if a feature is not f=
ound.
>> =20
>> -bluez=3D""
>>  brlapi=3D""
>>  curl=3D""
>>  curses=3D""
>> @@ -1151,10 +1150,6 @@ for opt do
>>    ;;
>>    --enable-brlapi) brlapi=3D"yes"
>>    ;;
>> -  --disable-bluez) bluez=3D"no"
>> -  ;;
>> -  --enable-bluez) bluez=3D"yes"
>> -  ;;
>=20
> Now than I'm bisecting over this commit, I realize removing this
> option was not a good idea, we should have done like commit
> cb6414dfec8 or 315d3184525:
>=20
>   @@ -886,10 +885,6 @@ for opt do
>   -  --disable-uuid) uuid=3D"no"
>   -  ;;
>   -  --enable-uuid) uuid=3D"yes"
>   -  ;;
>   ...
>   +  --enable-uuid|--disable-uuid)
>   +      echo "$0: $opt is obsolete, UUID support is always built" >&2
>   +  ;;

Looks trivial ... so if it bugs you, just send a patch?

 Thomas

