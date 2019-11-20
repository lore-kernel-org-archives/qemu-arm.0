Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1742296lfc;
        Wed, 20 Nov 2019 01:35:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpU/+YkK8eEsDvQgT/rF9Aa8YIS0bhY6l+PjHmyVwC2T3xHez/Eg6ionNF3vOjWY62/un5
X-Received: by 2002:a25:aa4f:: with SMTP id s73mr1115255ybi.47.1574242510868;
        Wed, 20 Nov 2019 01:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574242510; cv=none;
        d=google.com; s=arc-20160816;
        b=yykQ82hMP5rfyk7tlgZl9BXXLk9Zhsq0cMlKwgMIxPtmdJP8ttbmKssV+U3xxfZYsh
         1kM0UtGlR0uEtA49phCHJvCLQM8LFWPCDfZSd0d/auT7he92VPBiigPm/QK1URx+rS2J
         3WcxtYnvCBKgjmkPX/gtXv6pPCljjTqpN9yNJr3/QoQdLZbOxO2y21N9hdzZ1KA/lZ7F
         1J12J0Cejifl7JUBQSb/cyPj9FgpkojHiOWOpyDecYCYikmHgisUwU9TrhLH9AOjrMb1
         AeEETwwGPyBtrg0owlOXsl9pG0D3e9I9JHSx543NCUd1/aT2zuzDLC3Z2MrT23/pkc2/
         DzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=UrHd7RqNrB+1bDkaKW8M5t+cGM1h//lO5MzDrsHEsOA=;
        b=codGwNQ8FyRkgDH5LXPyKYRMgxq/ZliRzDJol19X5f1aPWDBwMJ+nLV8xz0cBZB37S
         INbIxFMHs4hYR5bJ/4EuetaR2X5Qnr6XAKIwfDtdQBxOKAw7ADlXLQ7criGQiPpBhplM
         SSmzds9ropAnn992yK639NOwlIUnHvz8vyjwsCxEfyPK7IXaxCVctbCZTSYnJ7TcODJX
         +ZYUi0JvXU8OgP8sFSzI8EWAc5hImFJGOeQ36z+/2K19pBihDax0nEXjV27UatYvXPmE
         QY3l+z9VmJm21McGr+JePa3DelSlvGPsd847dcI2VNWbyKfX6KjXMIcz4PWjvwGVvd9b
         UXqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HLk3e7Hh;
       spf=pass (google.com: domain of jtomko@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=jtomko@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jtomko@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 185si13431659ybu.283.2019.11.20.01.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jtomko@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HLk3e7Hh;
       spf=pass (google.com: domain of jtomko@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=jtomko@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574242510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UrHd7RqNrB+1bDkaKW8M5t+cGM1h//lO5MzDrsHEsOA=;
	b=HLk3e7HhJrAqoHrruUk8249ypezlfqu0qHaBLJDVb+SMTRCTk9A87l3H7HRM779ompOdPZ
	W22weBIOUErO911c/8LzUvVKuaAD541A6TKOcxBGccirzCX1j3VYE65i45+GA1cBbNQhJa
	RsOK/wYl7RatqhmQbPDIoFNbu7ByVQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-XqDW1PHrPquzjStFyHcJ6w-1; Wed, 20 Nov 2019 04:35:06 -0500
X-MC-Unique: XqDW1PHrPquzjStFyHcJ6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45FA9801E6A;
	Wed, 20 Nov 2019 09:35:05 +0000 (UTC)
Received: from lpt (unknown [10.43.2.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 929C267E5C;
	Wed, 20 Nov 2019 09:34:54 +0000 (UTC)
Date: Wed, 20 Nov 2019 10:35:49 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, libvir-list@redhat.com,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [libvirt] [PATCH for-5.0 2/4] hw/usb: Remove the USB bluetooth
 dongle device
Message-ID: <20191120093549.GO3832@lpt>
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-3-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191120091014.16883-3-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BuBclajtnfx5hylj"
Content-Disposition: inline
X-TUID: r+gbqKmkRvJO

--BuBclajtnfx5hylj
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 10:10:12AM +0100, Thomas Huth wrote:
>We are going to remove the bluetooth backend, so the USB bluetooth
>dongle can not work anymore. It's a completely optional device, no
>board depends on it, so let's simply remove it now.
>
>Signed-off-by: Thomas Huth <thuth@redhat.com>
>---
> hw/usb/Kconfig         |   5 -
> hw/usb/Makefile.objs   |   1 -
> hw/usb/dev-bluetooth.c | 581 -----------------------------------------
> qemu-doc.texi          |  15 --
> 4 files changed, 602 deletions(-)
> delete mode 100644 hw/usb/dev-bluetooth.c
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--BuBclajtnfx5hylj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEQeJGMrnL0ADuclbP+YPwO/Mat50FAl3VCO8ACgkQ+YPwO/Ma
t50gSwgAivAhVu/IeLutYVnPgIFVBRn+l0WLl8gsdTV6W+gJtW0J8T0lFzP29ekE
HfOXC7DI+RVi4YV/wX8RJSuBj/yfk50ce/cSrsSGuf0H3mRNDI0uI5eri9ByZ8Iz
MA/bapDxhQ0E1pDq1doDtdZU7xagW5W7S7vJqHYEl9YUx32m7QPJYEBiGU+lL2L3
d2UA/TovE3EbVJW8GTM1Jf0a1Cv+uqpodz2/OhUCe/wRJuJfePfDxtkZ9+p2z08u
m0WMIM8YeTXDru0wnogT5VtPVSiXtwnjnK2Wf3sJUSw0WfvtN/899jlz3FNsFKHe
bO9caxvQ54yycYGbLDLlv1hzbW6srw==
=OU4P
-----END PGP SIGNATURE-----

--BuBclajtnfx5hylj--
