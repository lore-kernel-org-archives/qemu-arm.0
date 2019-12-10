Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6013164lff;
        Tue, 10 Dec 2019 08:08:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLvI1nCJJHOal8Y3fLYxMB261wsVAl2MxZN7VFFjeEnQFJYMpkihNZLZhslpW9LTS/4QUo
X-Received: by 2002:a37:f518:: with SMTP id l24mr31730863qkk.441.1575994126369;
        Tue, 10 Dec 2019 08:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575994126; cv=none;
        d=google.com; s=arc-20160816;
        b=pWopvIILmaJIfwez7EdisMmUF+Sjc/sZMsA4ADPqiKDpeXwYGQyT89k+deIdGs0g/j
         aCD8LDxYGZs6ieCXtQARS8/lwTGhfsFqgMhdPtzzGN+tnKokHfgxS5354IeZgJ4CHFkM
         wKfJ3WB+Hio8eXnGjvSTbPOhIqEc1WhKXgl/psePTH2dM4Wmj/QTFnP+TwSVgB3fbD80
         lPn/gDtKad+Bl2Jq5RTP2X0QbOGdM06FBnHeOnSuFSw8RjT9fT7/la91KV3nrJ1NdeJg
         1Fqp17e4cd2cR4UOQ1TQksw3G+h8K5JNTB/y+fO3CYl0XCL98IF37OsL8sDf3vxJiUuy
         nu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=omvEPFgMa0ImghPBOD0QaB8/kVCMWZVlsLSkdCnszF4=;
        b=vFnSn16fkMzQKtNJ0eqApuzGKJVBh8ztrkolgBGpL63NugYwnmkkr9clWFsiWX21Kf
         +v0nR0kp2X7zI/6oczUoMWZOs7aU87ArpMRSY+w1oI41mYNGsprfXB+r584wvlFO/B+k
         G63X8WWWxYJHUS9TTTMo3MPclMERynBCM+F1jeXC5j9xFsqHk1uqePHkwoffLFKEYDeV
         Cnk6k2LHVSiofmXWwaehkIt228wWPMPJiI1hwstiDUUEQLT7IlcVHP/RLjmXBumMiDgb
         BU/8aIw2NN7aB8j6q6/vRAlbKZ+WjEr5dCzJ+wt+X3wlD59zf3MV81u1CULXwZawYanX
         0ZKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J9/xtnlV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si2121325qtn.323.2019.12.10.08.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J9/xtnlV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iei44-00056e-O3
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iei3v-00055j-QE
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:08:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iei3t-00068W-90
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:08:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25177
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iei3t-00067z-5e
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575994112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omvEPFgMa0ImghPBOD0QaB8/kVCMWZVlsLSkdCnszF4=;
 b=J9/xtnlVc6uYxfk9Q/xvovWVwqaj/zqkCRF2ukMAMws5eGbzi2jKVwSC4AdnMEYqn0AIm9
 2IxKMMQ5m9Kg7BrqH7ikgP/8KHF1wn1RFtaVTQyko7UPCLpnq7ALZNZd+SeZzivvhD1e8e
 zx3/QgFKIdmlkC4jvqHfR4A4E4VOjWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-qYuj1O5nOgqp6Uz9pr90jA-1; Tue, 10 Dec 2019 11:08:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3148610054E3;
 Tue, 10 Dec 2019 16:08:29 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 811FD5C1B0;
 Tue, 10 Dec 2019 16:08:27 +0000 (UTC)
Date: Tue, 10 Dec 2019 17:08:25 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
Message-ID: <20191210160825.ioah26u36eu2i3z2@kamzik.brq.redhat.com>
References: <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
 <20191206155327.7adiyjjkjh56mg2t@kamzik.brq.redhat.com>
 <596d07e933cb4da48dbba5b492e81a2438e78a2f.camel@redhat.com>
 <CAFEAcA9+G0jprsHRQp8g=Aso+2-_GhoWkDGx4WWxoC88maOKEg@mail.gmail.com>
 <20191210110531.psjzlikir2ep2omo@kamzik.brq.redhat.com>
 <CAFEAcA_M61hTzU=qCiUbR4V9Mnwd0phFNqTJG9pCWKreVmjy6A@mail.gmail.com>
 <20191210133254.22vcpvr3eabcnthe@kamzik.brq.redhat.com>
 <29add42daba074ab5bdbd462b2d377115fec7c3c.camel@redhat.com>
 <20191210143311.4sen6blhfhzop6zw@kamzik.brq.redhat.com>
 <e0f86b200d0b3c08769cdbaa080569c3ec3db3ab.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e0f86b200d0b3c08769cdbaa080569c3ec3db3ab.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: qYuj1O5nOgqp6Uz9pr90jA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bijan.mottahedeh@oracle.com,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IF+MQL0tD2ir

On Tue, Dec 10, 2019 at 04:47:49PM +0100, Andrea Bolognani wrote:
> On Tue, 2019-12-10 at 15:33 +0100, Andrew Jones wrote:
> > On Tue, Dec 10, 2019 at 03:21:02PM +0100, Andrea Bolognani wrote:
> > > I agree with everything except the naming: why would
> > >=20
> > >   kvm-no-adjvtime=3Doff  vtime is adjusted      (default)
> > >   kvm-no-adjvtime=3Don   vtime is not adjusted
> > >=20
> > > be better than
> > >=20
> > >   kvm-adjvtime=3Don   vtime is adjusted      (default)
> > >   kvm-adjvtime=3Doff  vtime is not adjusted
> > >=20
> > > ? Both offer the exact same amount of flexibility, but the latter has
> > > the advantage of not introducing any unwieldy double negatives.
> >=20
> > A default of 'off' =3D=3D 0 means not setting anything at all. There's
> > already precedent for 'kvm-no*' prefixed cpu features,
> >=20
> > kvm-no-smi-migration
> > kvm-nopiodelay
>=20
> Sorry, I'm not sure I understand. Do you mean that the array where
> you store CPU features is 0-inizialized, so it's more convenient to
> have off (0) as the default because it means you don't have to touch
> it beforehand? Or something different?
>

Right. The CPU feature flag (a boolean member of the CPU state) will
be zero by default because C. It's not a big deal, though, because the
property default can easily be set to true while it's added to a cpu
type.

I don't have a strong enough opinion about kvm-adjvtime vs.
kvm-no-adjvtime to insist one way or another. I agree double inversions
are easier to mess up, but I also like the way the '-no-' better
communicates that the default is [probably] 'yes'.

All interested parties, please vote. I'll be sending v2 soon and I can
call this thing anything the majority (or the dominate minority) prefer.

Thanks,
drew

