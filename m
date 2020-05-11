Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp73736lfb;
        Mon, 11 May 2020 03:39:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypLKkMKBVEbpjQIbNaX9z2cYZ2JJPcU9YDc0tla6YfIZ6FR3HXGv3PwTso8KhABavw7XJtwr
X-Received: by 2002:a17:907:435d:: with SMTP id oc21mr12955012ejb.100.1589193596716;
        Mon, 11 May 2020 03:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589193596; cv=none;
        d=google.com; s=arc-20160816;
        b=IdjHKaYkp8AY1SoaaP+wSSNe0tfoHuqWyFQHEyN9PsL1l5IKTx/dWd64FBjB78KWS0
         p6jPMXLONkEjDRKlksOwePUMCQb1DisV3KadTM0Tz3ScY/hh++X44uMq9RBvgu5CjXsQ
         a1gl4Eqh40eTcaS8d23acMewHQIjMQUxw5k/ZZI6Fy437U+ZH/0X07RCuEozRlEBQJuM
         3+/CKzxvc1FVcH3JvdTxah6FHOMmZhrJI6r1pngJfk1JK6OdaZov39oZj3vPLiGkGnRh
         QGJXM/7Id4wx1aaWOX3FydH1kGQFYnl7+dPtyIe2EmxPwYxT9mwKkSUMRE9/duYExJ66
         rMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=iNZ95QBBgOhPlpv2+m1T3JOLKUsjDBZXx4buFuBqv10=;
        b=ZUz3CdRiUgonp7Jpj/aJcriohRKQy57XLmrYKZROPZJR2r85OqqsAFJaB32xPK3q0b
         fNkxhLz6nGi8/sp8fXIIr65GRy0WO7R6ZHkUEHkdrNP9bDM0ZMJUbRMveQRuf9k7xzRv
         CaBdTrdK22o71Lo00SxFIufjNpIkJglOlV5eEo98cK3EtV+I0SiyYWJR7uUumGJ93lex
         RtAmeudgq6kgacaSVluk2SlPnPSMwkzxf3yBHYv5I3l3xmboTyrtfd1sS8WZ/6rJ8obU
         PdOfUcOzm2Xom2PTw06mhrjc8ym8WRn+JCAr/M7qTwHFPItrCHz/i0BT9zV8+lZY/0Dt
         BtHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrKx5Fct;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id c12si6317446edx.92.2020.05.11.03.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 03:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrKx5Fct;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589193595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNZ95QBBgOhPlpv2+m1T3JOLKUsjDBZXx4buFuBqv10=;
	b=LrKx5FctdsJjICUcdkLgpGJ2TCaN9xh2uKHfjFi+CSt1yv3dffhRwzaLr7DMW0J19L3yoL
	G2yv8F8Ru0bchq9rW/7NIFqirQuECae+EB3Ao4XPoS9L/CM7DNmCTfuNDP5Qms6QDs7Z2L
	dII9HuS0nfs3DbimDDAdt4KEI3EIYLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-KZmoN46UMAu4kHtyaRNbYA-1; Mon, 11 May 2020 06:39:52 -0400
X-MC-Unique: KZmoN46UMAu4kHtyaRNbYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99D20A0BD8;
	Mon, 11 May 2020 10:39:48 +0000 (UTC)
Received: from gondolin (ovpn-112-254.ams2.redhat.com [10.36.112.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E1B31001DC2;
	Mon, 11 May 2020 10:39:39 +0000 (UTC)
Date: Mon, 11 May 2020 12:39:36 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max Filippov
 <jcmvbkbc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Stafford Horne <shorne@gmail.com>, Roman
 Bolshakov <r.bolshakov@yadro.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-s390x@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, Aurelien Jarno
 <aurelien@aurel32.net>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>, Richard Henderson
 <rth@twiddle.net>, David Gibson <david@gibson.dropbear.id.au>, David
 Hildenbrand <david@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 06/11] target/s390x: Only compile decode_basedisp() on
 system-mode
Message-ID: <20200511123936.057dd414.cohuck@redhat.com>
In-Reply-To: <20200509130910.26335-7-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
	<20200509130910.26335-7-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WOetOa4AKRu2

On Sat,  9 May 2020 15:09:05 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The decode_basedisp*() methods are only used in ioinst.c,
> which is only build in system-mode emulation.

I/O instructions are privileged, and other S instructions are decoded
elsewhere.

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/s390x/internal.h | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
