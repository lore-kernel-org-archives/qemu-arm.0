Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1742898lfc;
        Wed, 20 Nov 2019 01:35:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxDVio833ipIdQP8PQuYl2V1M7I801/p/eKD2dWVO8EgqKC6Vk3hNDbAeJCnP79/VJtklqI
X-Received: by 2002:a05:620a:1463:: with SMTP id j3mr1406734qkl.425.1574242531964;
        Wed, 20 Nov 2019 01:35:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574242531; cv=none;
        d=google.com; s=arc-20160816;
        b=aJmNulovnnQs8rJ8rFZM5RUhfkr95APqRIwlcsVftONAIwjDZA+vD4s//YzcrS6Fab
         abGYxEReo0h6+HRV92YTQ16OdUT5vMWBQJSW4jpSESSluO4JYMUvmAA4QRwWahAaAS40
         1jF3WgiN5F6Ed4gpsR+6Ot1HnBonTQ9zqq0ezKgNgcMmPLVHBTtSdBZH0xpUkKr85IiD
         +M9kxHqLyWDf+44p2GjuSr7B/wi/2GpnrWPyrmECMTZZDJOPJ8lhSI/tYxO57vrU4P88
         lDrYdfjlyjRF2HkrTXALnJ7MquUj/tNCYbDCs1YeLM5SK7zDrFdTiRds+xEZPhELFE8u
         Z55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=cqOxygx0X6XnKw8PDZFbH4XlG3ohAm074QouO/3N3J8=;
        b=mapKcywRaybzFCCcLVYSBI7iv8TPvzpB/UDLtr5fLD62OSGQ68CpbDcUwyuN/TrtGK
         UQfnChUVb75kPOAISoWKMbiswS7t/cYyB0bjsGVU/FPXS+so2bp/u8EXB2g2GqcWcMEN
         X6TqIQWfvc6lAEBlo3hhpDm1k6WCl0GcS6P+P4QAEMqxDGM9MGbc1XrXN0P4W3qeVcao
         HuT4L8XA0cauLJBVmQLQCnExCTXzMuIPoCjZEsKIYh9ORjwPd9ojTr9Ai9BGrTYRDPYP
         CBUmcWIq/2mkgeFNUkmMpP4PWu1U98TZSwtDODxLOs8bf6C86tLHjj/0YBoZoPT/gHgT
         Xs0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdwcxXUL;
       spf=pass (google.com: domain of jtomko@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=jtomko@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jtomko@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id e3si15000921qkd.265.2019.11.20.01.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:35:31 -0800 (PST)
Received-SPF: pass (google.com: domain of jtomko@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdwcxXUL;
       spf=pass (google.com: domain of jtomko@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=jtomko@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574242531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cqOxygx0X6XnKw8PDZFbH4XlG3ohAm074QouO/3N3J8=;
	b=hdwcxXULA6EW1FUN2jYqwaQaDfL5iL7d8XOrF/yqYG24aqDsb2tnvi8O0oIAs7X+b4ctH8
	lBuSq/hOzXuKCUIdk6bLZjxFvQuPrUt8stS972KpQS91MmjlKEsjKSwUFcZ/X9ovChhO4R
	NPmvjJXrwJ6WeZZhVz/N5ZtrHUiBhv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-2iOl4u2XOOG6mxcmGoy7NA-1; Wed, 20 Nov 2019 04:35:27 -0500
X-MC-Unique: 2iOl4u2XOOG6mxcmGoy7NA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A48E2100550E;
	Wed, 20 Nov 2019 09:35:26 +0000 (UTC)
Received: from lpt (unknown [10.43.2.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9E0C66D4E;
	Wed, 20 Nov 2019 09:35:16 +0000 (UTC)
Date: Wed, 20 Nov 2019 10:36:11 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, libvir-list@redhat.com,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [libvirt] [PATCH for-5.0 3/4] Remove the core bluetooth code
Message-ID: <20191120093611.GP3832@lpt>
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191120091014.16883-4-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A6Z7MKnLVMfR85kG"
Content-Disposition: inline
X-TUID: 2LfnxCsjvDQQ

--A6Z7MKnLVMfR85kG
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 10:10:13AM +0100, Thomas Huth wrote:
>It's been deprecated since QEMU v3.1. We've explicitly asked in the
>deprecation message that people should speak up on qemu-devel in case
>they are still actively using the bluetooth part of QEMU, but nobody
>ever replied that they are really still using it.
>
>I've tried it on my own to use this bluetooth subsystem for one of my
>guests, but I was also not able to get it running anymore: When I was
>trying to pass-through a real bluetooth device, either the guest did
>not see the device at all, or the guest crashed.
>
>Even worse for the emulated device: When running
>
> qemu-system-x86_64 -bt device:keyboard
>
>QEMU crashes once you hit a key.
>
>So it seems like the bluetooth stack is not only neglected, it is
>completely bitrotten, as far as I can tell. The only attention that
>this code got during the past years were some CVEs that have been
>spotted there. So this code is a burden for the developers, without
>any real benefit anymore. Time to remove it.
>
>Signed-off-by: Thomas Huth <thuth@redhat.com>
>---
> Makefile.objs        |    2 -
> bt-host.c            |  198 ----
> bt-vhci.c            |  167 ----
> configure            |   31 -
> hw/Kconfig           |    1 -
> hw/Makefile.objs     |    1 -
> hw/bt/Kconfig        |    2 -
> hw/bt/Makefile.objs  |    3 -
> hw/bt/core.c         |  143 ---
> hw/bt/hci-csr.c      |  512 ----------
> hw/bt/hci.c          | 2263 ------------------------------------------
> hw/bt/hid.c          |  553 -----------
> hw/bt/l2cap.c        | 1367 -------------------------
> hw/bt/sdp.c          |  989 ------------------
> include/hw/bt.h      | 2177 ----------------------------------------
> include/sysemu/bt.h  |   20 -
> qemu-deprecated.texi |    7 -
> qemu-options.hx      |   79 --
> vl.c                 |  136 ---
> 19 files changed, 8651 deletions(-)

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--A6Z7MKnLVMfR85kG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEQeJGMrnL0ADuclbP+YPwO/Mat50FAl3VCQsACgkQ+YPwO/Ma
t509xwgAh4bM/I773MxOazWuQDIkUFm300owdx+O1ymFtgV/JQempqj6ODrRg+uc
rdwsQK9wmxkVe8V3pN0O55zW4686TcHq/b8ASSlBNA64kWZ3gQawzyeDwFdp9k7k
b7nPu3iqtv9DcVQteNwfcs1PEQ17qJ9KOp6j2eXik7aPFGHp5cDot7p68yR9imLm
1eeX9SaqdH0ZJlwwW+G0bzDStiVB0iMqyxpllkOWGQb+R6X4PXwsMDFl2nXH8qcq
gUbfn+sXtluMIXNAer/rXPvgAx0bz5DFjk6UIH117qb11Ii7LY9MQUVvPbT/tfpM
rUjMIVxyTFIo5G+p1ny9kcXbU0KjEg==
=8RCf
-----END PGP SIGNATURE-----

--A6Z7MKnLVMfR85kG--
