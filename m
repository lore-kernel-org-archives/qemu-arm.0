Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5954490lfp;
        Tue, 18 Feb 2020 02:04:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwc7i79oIQjY3kNZW5kFRa9Ib9EQHy7CQHAOr4bT0gAlh/QTE+o3q9cI93gKmNMzwZwuSNW
X-Received: by 2002:ae9:ed41:: with SMTP id c62mr17720683qkg.403.1582020250617;
        Tue, 18 Feb 2020 02:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582020250; cv=none;
        d=google.com; s=arc-20160816;
        b=aihT9RIKaLEnylr1ZxqtBWETlAaxQVDNUcBoJLfQhLOmEZhvGFCxIT497+PhTWglw5
         wgmow7ZiEDcgAjP+pi+z6PuGdUj6KA8qjz1gV3A2b8mEP1rrma+RD7fWAZyNr9l6s4ec
         HODDWJibCATcZlFFiXyFXICCSEO9SlOdHSm1bzBtNaeMKszUQxT9LR/AplHFZzugLStT
         vPecIy8uXwMUrUdUSNQflG4xZcL0kmR4C+1usXpMeffnB8Ebo1H6yChnCmXCvxzuhIns
         Pv4a0Dhyii8emggpIpbcPEZdZqx+xyZF2osoeD95DZS/QJB+GdP3l4py9uqaXF5MP6xG
         cz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=QAXZjIhwy4mje/o+BFQvvA22gylf/JskhFJ6XxFOlt0=;
        b=x6BU7FFp22fa86FsQ8ADgzIX/0nwOO7DAPK1X74geDF+Tf82Qm8vOC/DWk9tx+8Zc0
         AsvxBjS2IPBesc5MuV2Cyr3pGI+nZF99FPJdkHFXmNRtJOkMFHoUSBXGEG4yT0cCi3dy
         62A1kQuvy1vpv120efC2TE9GowkOXumshtmMijUia5bGPwlEVSAFD06zq94PgZu+qKuf
         Yjy1kYUB6nofkI2u+CIpuqph238nSveYUd3aCntg+egXJxuj5Oo5pBccvcgv9HppV8v7
         8LTQgWWLCMQCC2q2VSrRWc5IQdqpThuHdiGCAWZlS4snRQNqTQDQ0eJUC8Xshtt+Kyn2
         i22A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W7xaWVBR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si1457681qvr.199.2020.02.18.02.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W7xaWVBR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zje-0002eX-23
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zcb-0007IE-S5
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:56:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zca-0003dv-Pc
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:56:53 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zca-0003dW-Lk
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAXZjIhwy4mje/o+BFQvvA22gylf/JskhFJ6XxFOlt0=;
 b=W7xaWVBREhwjOokfA+Av3XkyMHcrHC2rY7KYd2Ybk/3VH4hqwAbiOD2dF72MRDI7DM09pY
 08pKKgLfYuYYrORDPUzuQXg9xyXtqvxJSnkkuwCRHrzrYafpw4wi724pHg8q35jVSX3mu2
 GmoFBKi409HfDwFWYehBEbdFNg29UFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-ZZ3_37a4OlyV9DAcJxmuDg-1; Tue, 18 Feb 2020 04:56:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 968181137851;
 Tue, 18 Feb 2020 09:56:46 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B88919E9C;
 Tue, 18 Feb 2020 09:56:28 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:56:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 07/13] hw/scsi/esp: Remove superfluous semicolon
Message-ID: <20200218095626.GJ3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-8-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-8-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ZZ3_37a4OlyV9DAcJxmuDg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2s7BcUtWun/n

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 74d71ea16bc
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/scsi/esp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index f8fc30cccb..405f8b7cbc 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -293,7 +293,7 @@ static void handle_satn_stop(ESPState *s)
>          s->dma_cb =3D handle_satn_stop;
>          return;
>      }
> -    s->pdma_cb =3D satn_stop_pdma_cb;;
> +    s->pdma_cb =3D satn_stop_pdma_cb;
>      s->cmdlen =3D get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
>      if (s->cmdlen) {
>          trace_esp_handle_satn_stop(s->cmdlen);
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

