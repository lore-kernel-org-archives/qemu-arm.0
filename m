Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7836588wrx;
        Thu, 7 Mar 2019 18:16:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvq2qjfIvY945c09YaCgu1lcAMR1vqhsmMewsWelFwc2sdCMboQD1u3nkJgaKZOrgvhYl/
X-Received: by 2002:a81:6cd7:: with SMTP id h206mr2864213ywc.386.1552011415875;
        Thu, 07 Mar 2019 18:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552011415; cv=none;
        d=google.com; s=arc-20160816;
        b=IhN8loR6fNGgJRuh1UktSROJb/6QtXt7eH6lDdLgAqUuHpXbBNsWHF4q8xvRcKHgz/
         8F0lNnvHADsj9EhYyka3XzZt8caybxgo7npMl5E6CBk4vWaA59zne8R5lONtIg9rlsy+
         jYaHTQVqBGAJiUeKFZ+fblMZkhCCtmiIyZ3XajbKhVCtU6ezyy348bZZrZ4UfX8yqwp5
         93w92ungzf36VPTA4ujzshj4P0WKQKLKvYS/oDUrUHxZvZyueC/s4BkT+znEESrfn3Oz
         j29EIbqU3B6X7jHJDXUkeeyZ8zVqvAQ69qPggPFJIFn/8tAJCBmtavy0nu4xdi5dPIDn
         b1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=B6Bo/mB0mXiUya83Y7aIwj6dWiOddqHEfHGHKuuaZNg=;
        b=hTjBaOVO2vy7m5M4UzVD5+YYhOIqMAMQKDi+Pd3v6sl/j5DBBjFdWHyEU1Rsk4do2z
         ugTjTM8S4ak1GQO2eo0AdnovQfxjKooeNAXLVJLgjno6A4W1sZw4iOJvB+gHLD2lMP4v
         GOGsrreC5ziKR5gDs49Er3wuxa1yfmZcuvYo6N0McAXBAHa3LU5jcvFaPjBS2udYO2me
         RZXESATegKHSpIVbdhjbEvBKGyMTkWr9EOleOsBIg6L1oZM9kKp+Dml+bX++OB8eSlkl
         HY2kqjhXW8K7P4AMvhHjAP+QaLn8hc0MoiNbzfGqARcxWjpbeWnzVaByXzcqamm3f5QR
         4l9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x128si3749021ybc.185.2019.03.07.18.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 18:16:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h254B-0003p5-BB
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 21:16:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h253y-0003oe-L4
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 21:16:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h253v-0005JX-2G
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 21:16:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1h253t-0005CJ-Co; Thu, 07 Mar 2019 21:16:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 746CA1310;
	Fri,  8 Mar 2019 02:16:35 +0000 (UTC)
Received: from [10.3.118.35] (ovpn-118-35.phx2.redhat.com [10.3.118.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C625D5D719;
	Fri,  8 Mar 2019 02:16:25 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-17-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
	xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
	xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
	TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
	GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
	sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
	AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
	CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
	RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
	wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
	Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
	gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
	pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
	zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
	pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
	3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
	NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
	cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
	SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
	I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
	mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
	Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
	2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <82e36613-3968-3459-4be7-f0e927faeb5c@redhat.com>
Date: Thu, 7 Mar 2019 20:16:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-17-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 08 Mar 2019 02:16:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 16/18] hw/firmware: Add Edk2Crypto and
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xnVLHvaGHBSy

On 3/7/19 7:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The Edk2Crypto object is used to hold configuration values specific
> to EDK2.
>=20
> The edk2_add_host_crypto_policy() function loads crypto policies
> from the host, and register them as fw_cfg named file items.
> So far only the 'https' policy is supported.
>=20
> An usercase example is the 'HTTPS Boof' feature of OVMF [*].

s/An/A/ since "user" is a pronounced or hard 'u' (English is funny, but
the rule of thumb is you add the consonant only before a soft u, and not
a pronounced one; as in "give an umbrella to a unicorn")

>=20
> Usage example:
>=20
>   $ qemu-system-x86_64 \
>       -object edk2_crypto,id=3Dhttps,\

Might as well use --object (both spellings work for qemu, but since
--object is the only spelling for qemu-img/qemu-nbd, being consistent
between the lot is useful).

>               ciphers=3D/etc/crypto-policies/back-ends/openssl.config,\
>               cacerts=3D/etc/pki/ca-trust/extracted/edk2/cacerts.bin

(I really should follow through on my threat to teach QemuOpts to ignore
whitespace after ','; but for this commit message, it's obvious the
indentation has to be stripped for the command line to be valid)

>=20
> (On Fedora these files are provided by the ca-certificates and
> crypto-policies packages).
>=20
> [*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
