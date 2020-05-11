Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp62248lfb;
        Mon, 11 May 2020 03:23:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypKOkHgSNYh8BN+vBJvdocEm0I2KZ9RLttWpJ2TUCrJaAC3qVjOrD2KRloS2TBWB9k8eL0af
X-Received: by 2002:a25:cc86:: with SMTP id l128mr25666912ybf.21.1589192590213;
        Mon, 11 May 2020 03:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589192590; cv=none;
        d=google.com; s=arc-20160816;
        b=e6CZxG0/AWFhz80N0LzQOYlTd/XVP9ddjjNFbXAy/GaeY7BEWNBhSsCPTb+4XSwNj8
         z/0qAP+hT22nnn923Y5aiRnloKoFAE8QF7UUUZy59gZH4zx+2ezw20X2UEvs5dQEGTvM
         aj04cpfeQzEVVmkzlOX6AYyEzRbfPlhnix7mTqN3LW9/HQNO/SPYFFF+QXK8sdY7IbZd
         BRxCl+XD0aVLuxs0CzxR53OZlqF4iX+uNY8n7MFBdTcBHcmw6r+yBo6gLN8zg4yoRwMN
         U9BAdLMmx+6o9kQFWrIrjiohjHtwewlBRcDOwtD4OrfCF5uBtfurlwlxn/4QEPNfQkKf
         RdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=fjwqSxqwfRj484Q2fFsCL+k+aOfgW88Vo9dsKivk/WM=;
        b=blGhoiJP/sop3Q1DcBldRPs7PimSAekRPM44xnf5sUsaNXlIuYo/dNYZ17K5iPn3dR
         E0DHqCtY/QbI3QqL4NLokXaMaGJ7kZzizC9+wHaDC9clrI7qwDRtN+UDgYkSL4VJSgma
         rWDbo2oOhr3cr3ucPKTAUBVsX+RN0MepX1L7F8rzyr8RhEpDghEJnVPTY5XM7nQjKBF+
         wFM8EJI+glpI2JDT5cRarhHPgDIvi05PbNUn3HgtphLTQqxhKs3uO9gUp0P67kWyPnC7
         eLZKe4id90JqLyMoxYDoKZ5Fptagt9Ir0OPQc1RYR4PctlwWfIghPsjArmDVtf4Gz+/G
         xnGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a84U+NTY;
       spf=pass (google.com: domain of cohuck@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c205si10311554yba.381.2020.05.11.03.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 03:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a84U+NTY;
       spf=pass (google.com: domain of cohuck@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589192589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjwqSxqwfRj484Q2fFsCL+k+aOfgW88Vo9dsKivk/WM=;
	b=a84U+NTYoyx9rxRc7q3R3V52xunouhQrN4U1hzC3DFrw0hpJmZqdmihV9PWW+JRCjkf/d7
	xsgv6vKLrfbLAXI/1Hda7bueFJpTTvdoQY4ALDxyRPPij5a0YYMbPjNdSy5vmgLLKoc8QV
	Pl8TjdwaGHjIIh6+2Bnsn4i/bKSicG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-Vbgy9PrXPw--Kja-ugNE5A-1; Mon, 11 May 2020 06:23:06 -0400
X-MC-Unique: Vbgy9PrXPw--Kja-ugNE5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D13BA107ACF4;
	Mon, 11 May 2020 10:23:02 +0000 (UTC)
Received: from gondolin (ovpn-112-254.ams2.redhat.com [10.36.112.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 567CD6C76B;
	Mon, 11 May 2020 10:22:54 +0000 (UTC)
Date: Mon, 11 May 2020 12:22:51 +0200
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
Subject: Re: [PATCH 04/11] sysemu/hvf: Only declare hvf_allowed when HVF is
 available
Message-ID: <20200511122251.6b2975fb.cohuck@redhat.com>
In-Reply-To: <20200509130910.26335-5-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
	<20200509130910.26335-5-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CuN5u8nwYXby

On Sat,  9 May 2020 15:09:03 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> When HVF is not available, the tcg_allowed variable does not exist.

s/tcg_allowed/hvf_allowed/

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/sysemu/hvf.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
