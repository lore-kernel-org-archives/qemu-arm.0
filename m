Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3616057wrx;
        Mon, 8 Apr 2019 08:03:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSTQk0FzIaW0qeCoGKGWXCxx1Byap5+T4qRwtr499WsMNAhii3Jn162YKlCL8RpXKWXwQR
X-Received: by 2002:a5d:4492:: with SMTP id j18mr19536585wrq.212.1554735824928;
        Mon, 08 Apr 2019 08:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554735824; cv=none;
        d=google.com; s=arc-20160816;
        b=Oy7w8gppcXqT9/CiSe5UBztNcGmsHLMeAFYbA0jl76SSujHzhsNdEdKI4u4mMAW21Z
         OHXG7lBFxgsPfVo+ucM9PhqbxqddWdjNn0Fzn1H2PvP87viW2/E0qvLEn/YMH51pFMs7
         ZWx825KeYGblPftTXK2WDPclhs939WVOEuP6Qyt8ggO7StTpM0Y7YuGxNMNTvH2eDIVG
         hKDjN/OOb71ujwCcEsSD3UqdqlUarMvdHbamP3UlzFv+9WJLj8Ck2gs9WiZLA9rG4R41
         LNuuaA9v6kNUo5I/eOkmUTcKgc2wuhe93A97kBeXenD3F97HH2rtLuZGaJe99LcwMwUR
         1SFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=+6GaXKoj5CCAmC+7nMcKeuavOxKBd20voVwJh7kp2+0=;
        b=GODyVme6xz9NryzrXMvZpU6xuUDEhBoo8mPlNdRctDtWXFm7B4s+8Rfl5kyL27msvJ
         /cKp5bOtV5vtonmrvRv3lduSAXnSjBHpUPFB1S/Em7LP2iSDKw0zD9AkO0737smyU865
         kFyoJTYIKWQTkHeyx4wGgSmEZVETvRd2nYYAn2OOHTj12bKMycja+3MY/z5ZDiKDNNJM
         mSQrSYQC6kLJe+Ag2FuOvDYFyufCRKru21p9GPgce8XYO6tWqA99Hy3gqkEitQy2QEj5
         D/SFnk8yoIq3Vj/FZOOJopRcYnxb7DaeVd283JqdCT87/Sg3EC4xmK61xX69O5ejK00Y
         j/Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si19090776wrn.82.2019.04.08.08.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 08:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDVoG-0002Ho-20
	for alex.bennee@linaro.org; Mon, 08 Apr 2019 11:03:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVnT-0001uX-MC
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 11:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVnS-0002lc-N8
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 11:02:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hDVnS-0002kk-D1; Mon, 08 Apr 2019 11:02:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F9C28B94B;
	Mon,  8 Apr 2019 15:02:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ECCF18A83;
	Mon,  8 Apr 2019 15:02:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D2A8F1138648; Mon,  8 Apr 2019 17:02:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
	<20190204231815.29661-6-philmd@redhat.com>
Date: Mon, 08 Apr 2019 17:02:44 +0200
In-Reply-To: <20190204231815.29661-6-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 5 Feb 2019 00:18:09
	+0100")
Message-ID: <877ec4o7zf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 08 Apr 2019 15:02:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/11] hw/devices: Move CBus
 declarations into a new header
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Rob Herring <robh@kernel.org>, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Pu1SiJpIdtx

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Not at all this patch's problem, but I can't withhold these gems from
your admiring eyes:

hw/arm/nseries.c:    cbus_attach(cbus, s->retu =3D retu_init(retu_irq, 1));
hw/arm/nseries.c:    cbus_attach(cbus, s->tahvo =3D tahvo_init(tahvo_irq, 1=
));
