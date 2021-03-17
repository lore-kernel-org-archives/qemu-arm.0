Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp39309lfg;
        Tue, 16 Mar 2021 20:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyykFg/u0hUK7Gl6Q6cxrxqH/ESV/EO9mhjZPSL+OFmD1jbWD730q1VHJ/s9NFu6j3g3O5
X-Received: by 2002:a25:790d:: with SMTP id u13mr2214644ybc.427.1615953126805;
        Tue, 16 Mar 2021 20:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615953126; cv=none;
        d=google.com; s=arc-20160816;
        b=NGW3mmh8bKm4eHhSnkW6CYA2efAk6TSFJLYu8pxcXsvaIp4AoatVQTjEX27wElu5l7
         ZXhtZ/a6H1OkC6siivoJi17sqFDQY4c0dRo0CADV98wdQvjKaFJkKDdF/xakeTIXNPkm
         QBEmghLrZebMmvLdRItPWsXQCPQLowLfHw8kpfX0T85Cjh3YxjNtmjQh7p8DZ112FOfL
         /Q+Wc8+z6Q72xiCKVK3I5ThjQDDNTxA15ipG9sQAS9q02WOGXd/rEIx6i6SjSbcS3KkR
         I8HoK0zBcLs8FHo68k5G2J2M63v84v3jMXh/80HBYA4yC/gGrVIcoBqXRQtTIExQx0W3
         oyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :thread-index:thread-topic:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=ni815Kkez5z5xVxqzsugVoYZIaaFLGlBdyzpxiK9esg=;
        b=x/RSWp1fYpZ0p6UfN+cntgkY4SMeEAOEUkvBkNzbL9NiNwYuZPYn6IORumeHVYa992
         WXuICjfPWVOOOYT+PdFPobeh8t+8g4ahSkPH7Xop2L7iUP/nYl3CxLwQU92cl37D+xYT
         QdEk+Gp73Jv76kuNbSMKix17POPhTNVEUwOFf1q+sUkJ8V7N4aFs/Wyzznru647wzKHZ
         9z2W94RCptmz3PeFpfX/dle//9hR40dJ2BcGYI8AG3i3ivydIUbJ32fA/HwbxZd/x/yn
         A+90PCOkhhOg1GQCSVe9RzFOCSVak3P+QO57dL8N2BVaM6rlqajnlJe8h7r6JoUpumS2
         nx5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LNtRs5Mg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23si19361408ybe.345.2021.03.16.20.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 20:52:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LNtRs5Mg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMNE6-0002B0-3G
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 23:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMNDx-0002AI-5p
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 23:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMNDu-0002Oz-Tb
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 23:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615953114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ni815Kkez5z5xVxqzsugVoYZIaaFLGlBdyzpxiK9esg=;
 b=LNtRs5Mgy+9+u/11snb5gPi6Atv9QVUB+bddGFGmOM2G/IM9MPwn1nx0aT7PPccQt7K4bZ
 Pb2SPW+lLyS6jwGJ3Rxmjvu+83uKAWLgexgPn6QGHhEu4rqr2YWBXmH0iI9UOMEgwbvjcZ
 QCXxOCMcdg9npCgoHQHZ6k63tgq6I+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-VJfBXCC0PdaByYd8o3Dg2A-1; Tue, 16 Mar 2021 23:51:50 -0400
X-MC-Unique: VJfBXCC0PdaByYd8o3Dg2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4EBB1074659;
 Wed, 17 Mar 2021 03:51:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA17319706;
 Wed, 17 Mar 2021 03:51:49 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8461618155DE;
 Wed, 17 Mar 2021 03:51:49 +0000 (UTC)
Date: Tue, 16 Mar 2021 23:51:49 -0400 (EDT)
From: Jason Wang <jasowang@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Message-ID: <1545258633.64106634.1615953109176.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAK7LNASNqCcTLE+hJqpohbh6_TLGZxZ0o8dm14BQSVtrCVCDDQ@mail.gmail.com>
References: <CAK7LNASNqCcTLE+hJqpohbh6_TLGZxZ0o8dm14BQSVtrCVCDDQ@mail.gmail.com>
Subject: Re: Question about two option formats for netdev
MIME-Version: 1.0
X-Originating-IP: [10.72.12.188, 10.4.195.15]
Thread-Topic: Question about two option formats for netdev
Thread-Index: i4xJcaBcX4UGu5T0BXY27TzphkXwsw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l9XcwiLG3waj



----- =E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6 -----
> Hi.
>=20
> I have a question about adding
> a network device.
>=20
>=20
> qemu-system-arm -machine vexpress-a9 \
> -net nic,model=3Dlan9118 -net user   ...
>=20
> works for me, but 'man qemu-system-arm'
> says this is "Legacy option".
>=20
>=20
> Is there any new (or recommended) form
> to use a lan9118 device?

Have you tried to use the "-nic" option[1]?

[1] https://www.qemu.org/2018/05/31/nic-parameter/

Thanks

>=20
>=20
> If I understand correctly,
>=20
> -netdev user,id=3D<id>   \
> -device <driver>,netdev=3D<id>
>=20
> is the new option form.
>=20
> For example, I can use the new form
> for virtio-net-device.
>=20
>=20
> But, it does not work for lan9118,
> and actually I cannot see lan9118 in
> "qemu-system-arm -machine vexpress-a9 -device help".
>=20
>=20
> So, the two options are different worlds,
> we need to choose appropriate form
> to use a particular device, correct?
>=20
>=20
>=20
>=20
> --
> Best Regards
> Masahiro Yamada
>=20
>=20

