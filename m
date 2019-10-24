Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2732957wrq;
        Thu, 24 Oct 2019 11:37:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRUlDk/mX7iN5yWONV9PORV2S5cmw0dGMyKQhFoHxumcihYzc2WZwz1gqNTd3S31G6m4gm
X-Received: by 2002:aa7:c1cb:: with SMTP id d11mr11934093edp.40.1571942221101;
        Thu, 24 Oct 2019 11:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571942221; cv=none;
        d=google.com; s=arc-20160816;
        b=iFxtaRRZOGaoMXS5F9hqflA9yPOmzm19+ZHGs3rYOcUQQ2dHvG2SUsKQS/tNQmcOLR
         SL14FIhYuHaHmDYx9n9FajOe3L8lByB97+AQ7UWmq0KoaKc7hzT9LhNct0gYK0chibs0
         BV3zV8KKTh5YCJ0BD7DnMHS/+VZzg7cjJbLCU128kxCqyBbqqexLXe/1+NtBICjG3xMt
         449ppr3tDyfDMazrFJuVASb8g7E2x85fQ+OKNAjqLs7s/SvGK9LW5xp9+C8Qi0atQ1gr
         ZywaZwBX5ZzUkRaXiGcyuW9OQXj9cO6SZnWduE0DwoAISENEIQ+MufXEwzUVd6CJgK/1
         v+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=K2PPNX5o6DQx8MjKGNnV43vBz7WlAxsKDOo/3ug5My0=;
        b=cUmXwIx9+gc7/aG0CZR1c7YWdXJV1GcZ4vKKw7GdzfrBZ4dEf6DWMwZVoXicR56GRC
         rP6JtrpiRZUeqVMEkjbBseD6DxNxcFHFlyn4B9dryTfsj2Txa0mTyjGKWO7OTwKR5QV6
         8y5ljDsP757A24+gBYu1ynZpb5BcX46KOwBsKk9H31AaSDpUydwLrgsKrknOIaAoc6r+
         XIXlHf1Od7k1g7wduuOLKOIsB/9300Pe3HyU+iZk+2DTxxRpvZwjtqPMpa4ac6S9gpdW
         P9hjN7sIBidAtnXpgUo9q4e1edOYHMbSb/I+Hr58QT4gfe4GHwte32D1//UQMcknJjgC
         lGmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JGuTgAV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si3980740ejs.154.2019.10.24.11.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 11:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JGuTgAV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNhyl-0003Ug-Sw
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 14:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iNhWJ-0000sv-HP
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 14:07:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iNhWI-0007UE-74
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 14:07:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21580
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iNhWI-0007Tt-0G
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 14:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571940453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2PPNX5o6DQx8MjKGNnV43vBz7WlAxsKDOo/3ug5My0=;
 b=JGuTgAV1E+B7FRcpMrjbxnEdF5uf2pmBV5gXxqOSAhU/LbZCHVQA6O1tILPKIGOUrKjJHZ
 i69VIss31ktTJ0oEJclq045GK3A4KyZ9TsmuGs0pzQVwaX3SpPg0TTJSCv9XtjUR/wp797
 xdhmWLU2CHbD1ljXnn4ZnaKTzVGwJQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-ITKloSrzNOmZN23P_rHAtQ-1; Thu, 24 Oct 2019 14:07:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47855100550E;
 Thu, 24 Oct 2019 18:07:26 +0000 (UTC)
Received: from localhost (ovpn-116-62.gru2.redhat.com [10.97.116.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC3D4128;
 Thu, 24 Oct 2019 18:07:15 +0000 (UTC)
Date: Thu, 24 Oct 2019 15:07:14 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 21/33] lance: replace PROP_PTR with PROP_LINK
Message-ID: <20191024180714.GY6744@habkost.net>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-22-marcandre.lureau@redhat.com>
 <2d027692-e178-c1c8-8384-ad70ed345f29@redhat.com>
 <CAMxuvay9kroZUo7ZbdhJqKAdp52rMmLGv0LBvktb68B2CKg+Mw@mail.gmail.com>
 <2b9352d7-f4de-bd5c-62c5-cebec79e1c48@redhat.com>
 <CAFEAcA_A4edo3fQBJux6QBxkCf_r_EdrmYgv5OPidWDdn4aD8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_A4edo3fQBJux6QBxkCf_r_EdrmYgv5OPidWDdn4aD8g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ITKloSrzNOmZN23P_rHAtQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Corey Minyard <cminyard@mvista.com>, Paul Burton <pburton@wavecomp.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3WOjJSyXTN7P

On Thu, Oct 24, 2019 at 12:52:28PM +0100, Peter Maydell wrote:
> On Thu, 24 Oct 2019 at 12:48, Philippe Mathieu-Daud=E9 <philmd@redhat.com=
> wrote:
> > Just wondering, if we had a "bus_address" property to the abstract
> > SysBus class (and eventually "bus_name" for later) we could create/map
> > sysbus devices from command line?
>=20
> I don't think this is a good plan -- users shouldn't have to know
> about the memory map of their boards. Plus it doesn't deal with
> the complications of multiple address spaces, DMA, wiring up
> irq lines to an interrupt controller, SoC reset handling,
> clocks, power-managment...  Command line -device was designed
> for pluggable devices, where in the world of real hardware
> the device can be physically plugged and unplugged and there's
> a clear interface that can be modelled. You can't add an
> extra UART to an embedded board in real hardware either.
>=20
> The only plausible argument I've seen for command-line
> plugging of embedded devices is as a sort of side-effect
> of having a configuration language syntax for them for
> the purpose of being able to write board models as
> data-driven config files rather than in C code. But
> that would be a lot of design and engineering work, and
> if we want that I think we should approach it forwards,
> not arrive at it backwards by adding gradual tweaks like
> 'address' properties to devices.

The QEMU community spent years designing QOM and QMP with that
goal.  Which other pieces to you consider to be missing, to
make you reject making gradual changes towards it?

I agree we shouldn't be introducing new external interfaces
without careful thought.  But I welcome gradual internal API
changes that are helpful for our long term goals.

--=20
Eduardo

