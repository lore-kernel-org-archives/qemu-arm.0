Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp332814lff;
        Tue, 17 Dec 2019 22:05:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8jaCtIyk7TKToB1Pi70dbffmjRjLmFk3jfjzDHRBSjE2zQx2qwj6JdN+tjXMBxs1wXoR2
X-Received: by 2002:a05:620a:1014:: with SMTP id z20mr830616qkj.196.1576649138245;
        Tue, 17 Dec 2019 22:05:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576649138; cv=none;
        d=google.com; s=arc-20160816;
        b=dXZaEeqwNdgiKRoBQdVamqpYVddfJQgO/pXgN0tFQ8xWJHq+YkTk4SLIx79/oczUY4
         FUyZhddhV6JnVGMvflF4FHVVq4saqXe9cedwrF34/xgq54xdxRFM6ZvjymE6i6A3dNYA
         fF7Yh1liAvBSMBWY6RoWSiqjlQi94y1nrZ8P4u5QYfRNtkH5BFIsaOq8AA0DJmCVVBCK
         dtg0OR/sY+E2z+h2+o1D81sMMvGJystN5FqsJ/cDY9l7PKE8K+T4nVsUz37BKIeWWZay
         89wVPzcegfGDXClxFsetVdos+7CGRdyCdDNUF7n4BXlzY6/QWjKxowzfp3myWF6P88vI
         ZA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=Dxu7JekNHm3dJ9ZpgeBC7AVH7BJaW+wzgYxjoq4cflo=;
        b=U1isHbJ9MaZJXFWXEJihp/mcTb5oUvf9Q37jhsUrLO1z34pRgRJYhetgHNUBnaQEPo
         oZefdueefJLg2OmQ+vpiiNzsfJOa+SpJf7T+CIFzLg/6m6PeOgBRU85JJGVQE8kB9nZx
         KXT7jPuaqa8q/NIPbXDU0vqdpY+HjR9kUO9Hr5Zw7omlhXZrDmo5SHcpff392+dCqO8Z
         9KhLgp+1MCFAMpbeKmqbygWBx9tX2IcHdhpgTyw+3JLmPZGjFgdasRAIOWgrAyJPd5+x
         ucExrz8MrueMLensu7fWWyyDCCNH9Ecf8B7nVM4r9x/Sszis80gIjLFw8z+RXAXvzR77
         tCPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Po5e/out";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si636090qtk.273.2019.12.17.22.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 22:05:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Po5e/out";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihSSn-0004vG-4k
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 01:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ihSSW-0004rO-57
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 01:05:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ihSST-0005wq-E1
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 01:05:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53711
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ihSSS-0005u5-U3
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 01:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576649116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dxu7JekNHm3dJ9ZpgeBC7AVH7BJaW+wzgYxjoq4cflo=;
 b=Po5e/outreWza5/qjFb6It0moJfA4cJ2xiiP1aIaFuAHWVBSg/pjPdrduo8haaNYE8bagU
 ZZri6CqO8wmNM9Sg+BmnMKLM8TknvLPjD7W5qi/ZlDNaHe/Cop3B74qCgcmWbHmm1bhaUZ
 ScwiRozwC4azxCSO+IJP14R8lpH6o+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-G2M3ZjM2MKScFvK70WmcPg-1; Wed, 18 Dec 2019 01:05:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 100FC8017DF;
 Wed, 18 Dec 2019 06:05:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CAD660C18;
 Wed, 18 Dec 2019 06:05:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C037D11386A7; Wed, 18 Dec 2019 07:05:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Chubb\, Peter \(Data61\, Kensington NSW\)" <Peter.Chubb@data61.csiro.au>
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
References: <20191217173252.4672-1-philmd@redhat.com>
 <84fthiaahd.wl-Peter.Chubb@data61.csiro.au>
Date: Wed, 18 Dec 2019 07:05:03 +0100
In-Reply-To: <84fthiaahd.wl-Peter.Chubb@data61.csiro.au> (Peter Chubb's
 message of "Tue, 17 Dec 2019 21:49:35 +0000")
Message-ID: <87a77q9njk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: G2M3ZjM2MKScFvK70WmcPg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Hannes Reinecke <hare@suse.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xFEeY0tNwbQg

"Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
writes:

>>>>>> "Philippe" =3D=3D Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wr=
ites:
>
> Philippe> Fix some trivial warnings when building with -O3.
>
> For compatibility with lint and other older checkers, it'd be good to kee=
p
> this as /* FALLTHROUGH */ (which gcc should accept according to its
> manual).

We have hundreds of /* fall through */ comments already.

> Fixing the comments' placement is a different matter, and should be
> done.  Seems to me that until gcc started warning for this, noone had
> actually run a checker, and the comments were just for human info.
>
> Peter C

