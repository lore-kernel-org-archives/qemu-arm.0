Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2608648lff;
        Sat, 14 Dec 2019 13:16:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzASvSb+v8/k3y81sHNMuUchRtI6VacDAqInzywp9IyEs+LLruwSln/UPX6JjU/cjRLGwii
X-Received: by 2002:a05:6830:1e9a:: with SMTP id n26mr21111206otr.99.1576358201398;
        Sat, 14 Dec 2019 13:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576358201; cv=none;
        d=google.com; s=arc-20160816;
        b=foVkIrAfleyEVjsiOe41yqiHR2VltPMfu/k9r1OuZKXDVYL4Jtq8b5Vz06xL6tPS4R
         IQj4+3LvCK54U4wR4BeW7cBKgRFa7yxBV1l6Jmjl9NncaI15gawKcSMYENvwVgj58BDf
         oFIxxfqAR+w0LHRCMtvO+vzbqx8NT5DLpxM96Fun15jblCNx3ti2HJqKcGIJexqILwIp
         RnjY4N9vRj8miR5QLrURhGoLPwgfEQyme2ewnOJLUOJGOReLx33l7HoVFShT+kSVEIZA
         59paZ7LntYdNd7nAFtXksIYE58UmPaqvWZLkGnG5MJXHHB0I+Su9s/YphahIDKpEJF0Q
         DUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=joKcrZqse/2rI2WBzidhVM6HneRljCD0MWlkHrQCOPM=;
        b=031qyzWZJfM3kueM9iO/lJKObAJZ2HHhJBia8OIuzlk05/W9yD/R+uYbscOHZNiCqV
         rGE+4cWGk6vuFR56/Psjkia50llAMETQRah8kFUpvgij7sxUAp23b6JEN2XPalbLEB3a
         /eSHeQD6EAw/rTX+H1BPSZYOXjRnFmDS9BB1F95xt2W0aFOkBKb8V8MzzEuMDRKFPovM
         NARmFHtL7uxqnEL/apiQgJioQUcLuNhfpbEd2t0amc55zE5rvGIoQ46KQ4N1U6oYErus
         NZKLlWBVIkFbTVzYK67mEd+4IQ/0qeADmqXF9Qk/8JdmmP/pfvTqZpEV+LOVYvBpEPDF
         Pg4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JpYlYY6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si8036486oij.35.2019.12.14.13.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 13:16:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JpYlYY6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igEmG-0001jT-7O
	for alex.bennee@linaro.org; Sat, 14 Dec 2019 16:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igEXA-0001T3-2e
 for qemu-arm@nongnu.org; Sat, 14 Dec 2019 16:01:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igEX8-0004dW-R1
 for qemu-arm@nongnu.org; Sat, 14 Dec 2019 16:01:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40287
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igEX8-0004c0-Ma
 for qemu-arm@nongnu.org; Sat, 14 Dec 2019 16:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576357262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=joKcrZqse/2rI2WBzidhVM6HneRljCD0MWlkHrQCOPM=;
 b=JpYlYY6GRr4O0aBKfZh5xMh4bbcZqDw4STW6G34dRxb9pxZk+AL18Fs6ADiuyMhTvTGksy
 K/Vsyq+z6LG8DVY85o5/g4tYqvuFbK5mj0W3uF+riFG4gYL8JC5SjddIn9prLEzMBP/WV1
 qWPSghjMVN8rpWnX3zzKVMY8VZNjpCc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-U4Ulz7HVPYCnwlkewFBVHQ-1; Sat, 14 Dec 2019 08:59:54 -0500
Received: by mail-wr1-f69.google.com with SMTP id 90so1014979wrq.6
 for <qemu-arm@nongnu.org>; Sat, 14 Dec 2019 05:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ablovXuvhNSxsWx83+/G5FRg33eclyz++hORIZtpqw=;
 b=ZtMtuBaWAyLYjUelDxEqkbNC7Fn4qb7rys/rt8tmEuDTn+W5q6As4IABKmOyx43wVd
 S4UGqzDYs5GRr8s3k+goi1c5dLf1z4BrcVn0jcOPLb3uLPXgVvMC/VOrXciYGEU+xLxd
 pJsqfJ4eKxLepQPsye6/kdhLU6bYrICjFMr1OLKXyPq+0pNQjovOs7QJTFqFoAuFs3gH
 nnGh579qU0GFBs7NfG8jganFB3kBlzsx04eco3ct5iKr6ShCzAXLEsvh2nU6ytKWZbPA
 Ajyssrv576birJjXzZ1QNMCoWSrdkz0uH4m3oKIcU0vPTuK3U/VGDF18cmaFeb0qT7kf
 +d6Q==
X-Gm-Message-State: APjAAAUibtDVP6LZs8YueFMnFRxKiEmyluvS+46HpSmfVUVTxTqMDf5r
 7QuHm4TSyi3+x/m1tf7aGhwRkYsmjgTuBCwmsldVgcTkPys8RV9/70knklxj6L7Gkh+yTYblsU7
 i/qMOrTjQX8Ia
X-Received: by 2002:a05:600c:54b:: with SMTP id
 k11mr19359951wmc.63.1576331993073; 
 Sat, 14 Dec 2019 05:59:53 -0800 (PST)
X-Received: by 2002:a05:600c:54b:: with SMTP id
 k11mr19359939wmc.63.1576331992865; 
 Sat, 14 Dec 2019 05:59:52 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id u10sm13781029wmd.1.2019.12.14.05.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Dec 2019 05:59:52 -0800 (PST)
Subject: Re: [PATCH 09/10] arm: allwinner-h3: add SD/MMC host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-10-nieklinnenbank@gmail.com>
 <CAPan3WrRKnu5vFz=JvrnD8tewUk7SdwFVYx4xVL353AnfPDgHQ@mail.gmail.com>
 <6bee15d7-7d80-0709-ac90-ef2052b39329@redhat.com>
 <CAPan3Woq_EJAE6s-N5dAApAgzexGr4M-OtFkiHuMN_Xp=8_bTQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <457e0620-c11e-8e5a-df1c-93f95f52eda8@redhat.com>
Date: Sat, 14 Dec 2019 14:59:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3Woq_EJAE6s-N5dAApAgzexGr4M-OtFkiHuMN_Xp=8_bTQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: U4Ulz7HVPYCnwlkewFBVHQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TBKEEQ/0VsOn

On 12/13/19 10:00 PM, Niek Linnenbank wrote:
> On Fri, Dec 13, 2019 at 12:56 AM Philippe Mathieu-Daud=C3=A9=20
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>     Hi Niek,
>=20
>     On 12/11/19 11:34 PM, Niek Linnenbank wrote:
>      > Ping!
>      >
>      > Anyone would like to comment on this driver?
>      >
>      > I finished the rework on all previous comments in this series.
>      >
>      > Currently debugging the hflags error reported by Philippe.
>      > After that, I'm ready to send out v2 of these patches.
>      >
>      > Regards,
>      > Niek
>      >
>      > On Mon, Dec 2, 2019 at 10:10 PM Niek Linnenbank
>      > <nieklinnenbank@gmail.com <mailto:nieklinnenbank@gmail.com>
>     <mailto:nieklinnenbank@gmail.com <mailto:nieklinnenbank@gmail.com>>>
>     wrote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0The Allwinner H3 System on Chip contains an int=
egrated storage
>      >=C2=A0 =C2=A0 =C2=A0controller for Secure Digital (SD) and Multi Me=
dia Card (MMC)
>      >=C2=A0 =C2=A0 =C2=A0interfaces. This commit adds support for the Al=
lwinner H3
>      >=C2=A0 =C2=A0 =C2=A0SD/MMC storage controller with the following em=
ulated features:
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0* DMA transfers
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0* Direct FIFO I/O
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0* Short/Long format command responses
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0* Auto-Stop command (CMD12)
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0* Insert & remove card detection
>      >
>      >=C2=A0 =C2=A0 =C2=A0Signed-off-by: Niek Linnenbank <nieklinnenbank@=
gmail.com
>     <mailto:nieklinnenbank@gmail.com>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:nieklinnenbank@gmail.com
>     <mailto:nieklinnenbank@gmail.com>>>
>      >=C2=A0 =C2=A0 =C2=A0---
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/sd/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/sd/allwinner-h3-sdhost.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 791
>     ++++++++++++++++++++++++++++
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/sd/trace-events=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0include/hw/arm/allwinner-h3.h=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0include/hw/sd/allwinner-h3-sdhost.h |=C2=
=A0 73 +++
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A07 files changed, 911 insertions(+)
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 hw/sd/allwinner-h3-sd=
host.c
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 include/hw/sd/allwinn=
er-h3-sdhost.h
[...]
> Thanks again for all of your helpful comments Philippe!
> I've started to rework the patch.
>=20
> One question about adding tags in the commit message: should I
> already add 'Reviewed-by: ' when I re-send v2 of this patch? Or should
> that be added after you have seen the v2 changes?

You shouldn't add the Reviewed-by tag until explicitly given by the=20
reviewer. If the changes are trivial, it is easy to conditionally give=20
the tag such "If ... is done: R-b", "With ... fixed: R-b".

Since this is your first contribution, I have been more careful. Also=20
since your patch is already of very good quality, I'v been a bit picky=20
regarding few details.

Since there are too many comments, so I prefer to fully review the v2 of=20
this patch again.

Regards,

Phil.

