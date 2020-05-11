Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp58819lfb;
        Mon, 11 May 2020 03:18:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiZmSAS0ADvdGERUfSHly/Oj6LR750b/Xy2woUOzyhUXBfepoIM5h02K1vP4rQsqdgrxqJ
X-Received: by 2002:a17:906:19d2:: with SMTP id h18mr1866237ejd.147.1589192285891;
        Mon, 11 May 2020 03:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589192285; cv=none;
        d=google.com; s=arc-20160816;
        b=xsNfTwCOJOm0uDfwQ7KzkgY7NsCI86nm39kBfDjYMApBJ2t4ZH4ZjYAM4yg5/r8HiG
         4GG4jx4+wwj7kk5QAxoPyyniBurSo+dYIurOVPlzuVSLkf1Aiq5RMZk2Id2NKt6MEPrf
         1N5/QHSTwVGxqAwSg6U3kNmh3jPZQcvdRIV6im3fnPvQaJtig/iwJv4at4uYzyA12WIx
         9OlptOrAWGc0hBSv3pjjEIqDoHpZARI60o9WhS8fNYLCdEfDspINN8e4k9yQ3Or5Sj34
         BhnL0bsiGWjQ9ws8gIOZSES5jAiQ1xKMA+Akds1l7nGg/VfnrTnjtKg8PlL6y0TutrEC
         VnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=0uohFe/CHE9N14X4nOXOgWiZ9U3xHrL7OAGJhDPnCVU=;
        b=c59fyo6Bjj8BrGO3bgc0QHKQn6eoWuyIkXCmzY40lFkd24X+knU+ZSr15Oa1uPi0p6
         3Gz8XO67d+1Gd3UYggEF4XOSda2VZBTQkCA+/jr+NGVpxSoaeiT/75110a0wV+3G4cJu
         NV/mD11nhrcYctxf7LxxkNoZjqwacJ/2Ik3GdJP0gLTWFoyyibFzDOWWqm7RxvDCvvQV
         w97C1P6/JWZVt3UCiRZZJ5M4bLbJtTuFTTOCu04tv01RUHg5AN2ABVGiW4xTD+sNzCUM
         DQBvKVQfHXT4sRMsHy5kWwLzLTDYdxj3JTzsgQ22UD/thrVt6Issw9GCIVpWebSl3Bsz
         ejag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4B2iYwF;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id d16si5985593ejb.187.2020.05.11.03.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 03:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4B2iYwF;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589192284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uohFe/CHE9N14X4nOXOgWiZ9U3xHrL7OAGJhDPnCVU=;
	b=N4B2iYwFcf+RcSlnps3ybMcfL0i2GaTg6MVueHpeUA+fIQa7Y+eFW9A28plfn5PWC5obwG
	TJ6q52U+pmWBBvHaElKR6fqMBlyRbr0SsPsGQLLmYNLolbUBV7jFceIfuRfhPBSBpLVB3o
	qGFMZwyZX1tyNrtLg3L7HA4YfcjGSNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-IfgDxwMvOJmNuH2c8r3lzQ-1; Mon, 11 May 2020 06:18:01 -0400
X-MC-Unique: IfgDxwMvOJmNuH2c8r3lzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B6B18FE860;
	Mon, 11 May 2020 10:17:57 +0000 (UTC)
Received: from gondolin (ovpn-112-254.ams2.redhat.com [10.36.112.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 036769323;
	Mon, 11 May 2020 10:17:47 +0000 (UTC)
Date: Mon, 11 May 2020 12:17:45 +0200
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
Subject: Re: [PATCH 02/11] sysemu/accel: Restrict machine methods to
 system-mode
Message-ID: <20200511121745.42cea0ab.cohuck@redhat.com>
In-Reply-To: <20200509130910.26335-3-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
	<20200509130910.26335-3-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +K2kH+ngU29u

On Sat,  9 May 2020 15:09:01 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Restrict init_machine(), setup_post() and has_memory()
> to system-mode.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/sysemu/accel.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
