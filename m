Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp60649lfb;
        Mon, 11 May 2020 03:20:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypJI8ZN1Ajw/t4OuGX/QrPVkyh6TMhAS6nsfJMmF8lHkRk9YKh3VEVb7bGXsCBp/BUJtJnjF
X-Received: by 2002:a05:6402:759:: with SMTP id p25mr13115500edy.102.1589192442512;
        Mon, 11 May 2020 03:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589192442; cv=none;
        d=google.com; s=arc-20160816;
        b=PVcifpJFDFctTiPfGgrVR89k84IvknjLznBkzN3/8qQh6kdPwJVu7IrxAWPiAm1ANt
         CzO4qVdiHlO+h18BkaB5/Ppz8HAB2tu9IV8VFVukQFPJZici60deYtZTcBdkm3AU08s+
         0jctUXKOCIdAWUZ2KkFTeIJlW7jB+Bs95VEtJO5B6TV53Gema9+otxkNPzB4jxLXk3l8
         F3gCDc1ZJnNWFzVzJD/Z/LbwndanSWKw26/XpeoqCb16HtmwYf+ZTGQs4Jcw7hvE1H3c
         x2WdyMKyfjXta+BSNaU6whG2UYBJKjbShka25J7wYWp9Ud73LEFQfJaW1mibesFO/cTu
         ifiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=6K7Jb9KxhJ0Z3M7+jg0dXDkWcgyqfOLfhefCZZo0kM4=;
        b=qQgAhOuf+nTsXUQJZ2mvANIO6Gl+fCX6/WlmSvqVH/glRMZ3xVnfomJ9AhzyUe+/rq
         5LNaN0RUQvymefBtn775y4qeS27s9QkxZaRLtk+WBQxo+h8DUFK6CGsUmJ2P1mhExrw5
         A/Fzg8MyXN5cXTUNoHDFRd7Jj3GOYYDYQdOmgNNWo2Ox4vnWbFpqREn5iN0KcVQGfv7N
         vfyDuyxsyc/pAEuss+tgOOpwoOUPzXxRm5KzSELpYp5J7bqRZUXsTX2NjG4koDaYoes6
         l9GBv/JenkLWxVbd1qxcBb4uv0dcJJ8SXRszYNY7Lff2LtYzOQ/dQy/aJN8S3zuarZSQ
         Ku2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JD1jxiiz;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id s26si5270506ejv.367.2020.05.11.03.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 03:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JD1jxiiz;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589192441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6K7Jb9KxhJ0Z3M7+jg0dXDkWcgyqfOLfhefCZZo0kM4=;
	b=JD1jxiiz2f2/YE1d2P4qkbZUkH3QsBRhbG63HCQGBdyak3tDFRWus64vDlkE3fiYPSyCSF
	0HztYeixura4nePe+hhREm0hOdxsbwfQPehn5XEYWn6F4gJoFDVK0/gsHe1qdEJ12CdcnL
	sLr0j6vSWZeXozXWOFJU33bdVCwNnko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-s32iGES-OYWOk8FgG4pPwA-1; Mon, 11 May 2020 06:20:38 -0400
X-MC-Unique: s32iGES-OYWOk8FgG4pPwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1407CEC1B3;
	Mon, 11 May 2020 10:20:35 +0000 (UTC)
Received: from gondolin (ovpn-112-254.ams2.redhat.com [10.36.112.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7AD85D9DA;
	Mon, 11 May 2020 10:20:26 +0000 (UTC)
Date: Mon, 11 May 2020 12:20:24 +0200
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
Subject: Re: [PATCH 03/11] sysemu/tcg: Only declare tcg_allowed when TCG is
 available
Message-ID: <20200511122024.1f684a63.cohuck@redhat.com>
In-Reply-To: <20200509130910.26335-4-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
	<20200509130910.26335-4-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CSrjblJjGRQE

On Sat,  9 May 2020 15:09:02 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> When TCG is not available, the tcg_allowed variable does not exist.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/sysemu/tcg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
