Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4664714lfm;
        Tue, 14 Apr 2020 00:15:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypL4E8shKrP4AOQx7bvewKfXXSXXb8WpcYM6D+EzOf+2/lj/u9yxnH5VZMhkDhwe7jGXLxf+
X-Received: by 2002:ac8:4cd1:: with SMTP id l17mr14921320qtv.20.1586848525188;
        Tue, 14 Apr 2020 00:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586848525; cv=none;
        d=google.com; s=arc-20160816;
        b=dVfHRaWgzVFQj7PyR4vNfECn0/aVkN4CImZsJCX+IH2E5P0q1Q+kVZxGV/CxU83Tdb
         1AMf2UzN5qbdsHDOhJfayr9Bk1TQDYat6vQ9ad2K6D5OC5plI+q6vNgVecm94SragqXm
         I80JKW2xdtJW2sfsupjQmwbnY5x4ZbZCk1ILTF9blPG5mkJn5JmNgvE2ZYJMPV7meDj/
         h6kjXf8l0yedfYyrrD/iBStcDLIwV8ktFxAJHoUcmU5/VpB1cytAbQN3DCb554V2iVdT
         DIqvTz3TY3BbA/SLDMzj1My79qx/LvmFU9kZ9s0FA1WaPEkQTe3brrtMimyI3E10yCYo
         +ROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:thread-index
         :content-language:content-transfer-encoding:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:dkim-signature;
        bh=UPl8Vc08yZvXnj9e+clalIg/qDk+S78wH0kNLz1cnTM=;
        b=AXxFy/dOPNH20oOUgIaq0QF3ST5cm5iyFtjIi7ritHflirZJ+byA1Zo/zo3NY9s52O
         vi8ghJm2+8ontDQKgMQg2nF04qnwdUfMlU8Wupf2mQ2L/O/dCbsOOHWWv6zVwTINkWfo
         71Qz1Nt93gYuzmFESzfmsO0YbXNfDAv7rss14BEFx5P9KFvtpq58LH3EZ2wIQddypz1J
         aQG17aSFu3kiBzNYSToOTtdamQQHV3qmiCQnrdUHhKOUp85i0i000Eq9vA7qutGzh5JW
         umXcQWAuLpSxcCKqTmnvvgn4cSfO4viRRS3z93YYUs3+GMczHExpKBPhMtYJag3RX5dH
         7hVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cDC/AWhY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i23si5699006qka.283.2020.04.14.00.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 00:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cDC/AWhY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOFn2-0002jI-LD
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 03:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xadimgnik@gmail.com>) id 1jOFmB-0002Ce-6u
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 03:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xadimgnik@gmail.com>) id 1jOFmA-00015f-0r
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 03:14:31 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41926)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <xadimgnik@gmail.com>)
 id 1jOFm4-00013Q-88; Tue, 14 Apr 2020 03:14:24 -0400
Received: by mail-ed1-x533.google.com with SMTP id v1so15666395edq.8;
 Tue, 14 Apr 2020 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=UPl8Vc08yZvXnj9e+clalIg/qDk+S78wH0kNLz1cnTM=;
 b=cDC/AWhYs8VeclpczMQ+nWKlkHo+6TNqJh0NrHl5/bs0WriSFIdo3XBsaUD7ePRZHe
 NEW9SqTY4oaqIC2Y/EaS4yfPk3Uv4LuVEi3oLJy03dqZVz/J3BrAP3NgBtwgGzUeQlHe
 qQi9H4zrpUQIS9tpRFllWKDfMd6EzHU99W78oJiqDrWWwDyYS5qa0OkpPi8V95m9p8Um
 FHdTbD+1XAY38mrLapjh6w5wbslEhc9mdhUmpcK2hDNeWCgPBLQZWiH9FbWRTdVOOKB9
 dI5qDksUntfo2FUhoDWEi8zY5e4XYPgugP2/Xd7gHznBjNehL1/JodqE67TYC4gr1sw8
 AGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=UPl8Vc08yZvXnj9e+clalIg/qDk+S78wH0kNLz1cnTM=;
 b=iJ5KFY5ylSNIEJENYcg6n1/H3d2MM1dNBfzkpddWV0kMWRwy1JprqFSvMtdAirb02b
 RSD4MEo5q6lgIyU1+tBKwLPkNbzWzD6OYKCvLHJmrz5hYPWR0NZ6jglnxCJE+25JlaQs
 wlsFEGe1WNb2hTWWdExY46rUeqRLvQUHRguG3ZEK98E7smRU1Am0QFYG1DVoGWFTAPAI
 XMSeNXyNbsHEyy1/JcAQ6Ub3pXfavn1HI3j6n2WLG9yNHLmPdXnfNb48gF+GESh9qd2B
 31eg1DtSV2bS+i0zoMhVkCuOPrxWzxBk8MKW2dz/Pw8+R6UOda2rluhZFy7k+D27a9MX
 GZWQ==
X-Gm-Message-State: AGi0Puahu8ATMpN6xcQyr0k6cYE7r2L85iUPxqk2P11P1uXtrQV2pZLm
 J/l2PihVP2MOkY+52kie+GE=
X-Received: by 2002:a17:907:1185:: with SMTP id
 uz5mr19460491ejb.335.1586848462436; 
 Tue, 14 Apr 2020 00:14:22 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id k33sm1600483edc.18.2020.04.14.00.14.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 00:14:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-4-f4bug@amsat.org>
In-Reply-To: <20200412210954.32313-4-f4bug@amsat.org>
Subject: RE: [PATCH-for-5.1 3/3] hw: Remove unnecessary DEVICE() cast
Date: Tue, 14 Apr 2020 08:14:18 +0100
Message-ID: <004101d6122c$52094ad0$f61be070$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLGp+eFp3IRGcFg/miJ8dc6gyP15QIEt8vKpobi2pA=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::533
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'David Hildenbrand' <david@redhat.com>, 'Jason Wang' <jasowang@redhat.com>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'Gerd Hoffmann' <kraxel@redhat.com>,
 "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, qemu-block@nongnu.org,
 'Markus Armbruster' <armbru@redhat.com>, 'Halil Pasic' <pasic@linux.ibm.com>,
 'Christian Borntraeger' <borntraeger@de.ibm.com>,
 'Aleksandar Markovic' <aleksandar.qemu.devel@gmail.com>,
 'Joel Stanley' <joel@jms.id.au>, 'Anthony Perard' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, 'David Gibson' <david@gibson.dropbear.id.au>,
 =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 'Eduardo Habkost' <ehabkost@redhat.com>, 'Corey Minyard' <minyard@acm.org>,
 "'Dr. David Alan Gilbert'" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, 'Peter Chubb' <peter.chubb@nicta.com.au>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 'John Snow' <jsnow@redhat.com>, 'Richard Henderson' <rth@twiddle.net>,
 "=?utf-8?Q?'Daniel_P._Berrang=C3=A9'?=" <berrange@redhat.com>,
 'Andrew Jeffery' <andrew@aj.id.au>, 'Cornelia Huck' <cohuck@redhat.com>,
 'Laurent Vivier' <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 'Paolo Bonzini' <pbonzini@redhat.com>, 'Aurelien Jarno' <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eyr+NvNVsSoA

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> =
On Behalf Of Philippe Mathieu-Daud=C3=A9
> Sent: 12 April 2020 22:10
> To: qemu-devel@nongnu.org
> Cc: Richard Henderson <rth@twiddle.net>; Halil Pasic =
<pasic@linux.ibm.com>; Peter Chubb
> <peter.chubb@nicta.com.au>; C=C3=A9dric Le Goater <clg@kaod.org>; =
David Gibson
> <david@gibson.dropbear.id.au>; Eduardo Habkost <ehabkost@redhat.com>; =
Anthony Perard
> <anthony.perard@citrix.com>; BALATON Zoltan <balaton@eik.bme.hu>; =
xen-devel@lists.xenproject.org;
> Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>; =
qemu-block@nongnu.org; Corey Minyard
> <minyard@acm.org>; Daniel P. Berrang=C3=A9 <berrange@redhat.com>; =
Christian Borntraeger
> <borntraeger@de.ibm.com>; Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk>; qemu-arm@nongnu.org; qemu-
> ppc@nongnu.org; Jason Wang <jasowang@redhat.com>; Markus Armbruster =
<armbru@redhat.com>; qemu-
> s390x@nongnu.org; Dr. David Alan Gilbert <dgilbert@redhat.com>; Joel =
Stanley <joel@jms.id.au>; David
> Hildenbrand <david@redhat.com>; Aurelien Jarno <aurelien@aurel32.net>; =
Laurent Vivier
> <laurent@vivier.eu>; Peter Maydell <peter.maydell@linaro.org>; =
Cornelia Huck <cohuck@redhat.com>;
> Paolo Bonzini <pbonzini@redhat.com>; Andrew Jeffery <andrew@aj.id.au>; =
John Snow <jsnow@redhat.com>;
> Edgar E. Iglesias <edgar.iglesias@gmail.com>; Gerd Hoffmann =
<kraxel@redhat.com>; Paul Durrant
> <paul@xen.org>; Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Subject: [PATCH-for-5.1 3/3] hw: Remove unnecessary DEVICE() cast
>=20
> The DEVICE() macro is defined as:
>=20
>   #define DEVICE(obj) OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)
>=20
> Remove unnecessary DEVICE() casts.
>=20
> Patch created mechanically using spatch with this script:
>=20
>   @@
>   typedef DeviceState;
>   DeviceState *s;
>   @@
>   -   DEVICE(s)
>   +   s
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Xen part...

Acked-by: Paul Durrant <paul@xen.org>



