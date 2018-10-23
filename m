Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4694361wrt;
        Tue, 23 Oct 2018 08:41:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63gm0jxTfxl3DNtoiR8Dv/p1UO5p4/97E+9R1cLQEE7VlobW/b1N2epZ/oW5ewhFS1bc/T+
X-Received: by 2002:a37:5c83:: with SMTP id q125-v6mr16193528qkb.348.1540309316981;
        Tue, 23 Oct 2018 08:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309316; cv=none;
        d=google.com; s=arc-20160816;
        b=P3MIhkx5uSR2jbY9tFqw2An86cm5FwDhbaJ4yeb9BPPNhdhCc8NrKgotodqjZeCVRy
         /0BYb6IJqAmNnBbRc2GcuArTFxe9MgyfhmIm6FeYecKdc+/RPcLHzxIJd56Rs8a5ccJH
         shJO5Wk9goNkbROUQyrtVnvoMkU9P0rCmZUIGFExVv4qAG/41dB5lP5aWRixKPZZBWgO
         4lsWTbHGOhj4i1Y7o9UUeD6hzpCn5c9HwuImvKEN6MN7e10tu2enNxu9NxkpfiKLU7Ic
         WV1xBZ4ckavZc96Ja9qmSVrqkOc5JCE0Sk1sLkEVlM0d7a9MYWDVV0+3SAGTugQ0Nu29
         DRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Py+OmOT5cN1c4Hr1IQmq8zNkPHcsnozKNSDSmoUg17Q=;
        b=djT0b2eMbrLOZ0yWyrzVG78CKaRVq7gWWoYG93So7JmDTEzFVDilfDF9h61jufRyT7
         DIOo1HFEBGW6DTBChUdOtCxAea4NRJDlp+x49KRFclZEBjbVTA94wTJZ019IDFSpp6gB
         ZJwQeZ63CLZ4AoPL4NOiNB3iRv0SH8+oC4VjbQIkpsfwAhbwUNGpG63e/YQIrDAOBBXq
         e0+keeuVO4lBerFEUMQ3moPaEPM1BkBN/Aig1FGdexKp4I/UdUzdCHsS2D9EVFyFv4Kt
         GVLZolkf4Dd/YYQraE1ffXXigilAt6YqRDXSIDJ/uqj6wsaVOBUPuQo9k8qMYh3cx1GZ
         dWEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=WcMzBdpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h2-v6si1248047qkg.224.2018.10.23.08.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=WcMzBdpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyoe-0005HW-Cj
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:41:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhQ-0007C3-Nr
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybw-00073X-54
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:28:49 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59449)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybv-0006yT-6I; Tue, 23 Oct 2018 11:28:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj84PBJz9sNm; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=yKspRk61H+QvV9mmzMouhImJtSNR2xi1FyMRbZkiPEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcMzBdpe1cHWhCFHLvtY77KUAynHkNftMoLmPvYX0RBfUU6sXF5/eCnhgm5o9VkZC
	qZQCi+d9G3pkg/hLjG0kUYA7O6lAHoeKjDKdUYM6l6/QmpcOfvGmgc52cXXibkPJhX
	9wBVxV/QQo6HwCqFmc98kIXJqqCDmDBe3YD2YKPk=
Date: Tue, 23 Oct 2018 16:20:37 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152037.GO12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-19-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E187YRO8KGM40JwS"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-19-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PULL 18/45] memory-device: fix alignment error
 message
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hybqyqG3ym3Y


--E187YRO8KGM40JwS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:55PM -0300, Eduardo Habkost wrote:
> From: David Hildenbrand <david@redhat.com>
>=20
> We're missing "x" after the leading 0.
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Message-Id: <20181005092024.14344-2-david@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/mem/memory-device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
> index 6de4f70bb4..0b52fe2c5e 100644
> --- a/hw/mem/memory-device.c
> +++ b/hw/mem/memory-device.c
> @@ -120,7 +120,7 @@ uint64_t memory_device_get_free_addr(MachineState *ms=
, const uint64_t *hint,
> =20
>      /* address_space_start indicates the maximum alignment we expect */
>      if (QEMU_ALIGN_UP(address_space_start, align) !=3D address_space_sta=
rt) {
> -        error_setg(errp, "the alignment (0%" PRIx64 ") is not supported",
> +        error_setg(errp, "the alignment (0x%" PRIx64 ") is not supported=
",
>                     align);
>          return 0;
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--E187YRO8KGM40JwS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPEUACgkQbDjKyiDZ
s5JKAg/7BowUsdlrXWyLguo/yiLX+4ws0E/Q79YuCbOXR7DVo411UxqUSAeO36EZ
YVSj7qXlLOOriUEYvNbDXfrFaa9uYi8BTYU7BtlWidJCGoZwVLE44U3prqjqx+bc
PIokmY4a1NOny14VCpb0PFKWHY4hkcQzV3QcpY/OeuWFm4tyeCcbe3x20bB9pGdG
6TSHkCJFVNhNQIKPXzaUfgxNAF0kBdxBjwhGX6Qdm/gQqnUDtLEhSLNHjA2pQS01
KTxXRPtTj2Gy+0fIQOBrsjAvL6CLGma1ff8lsQLbUYKQMD1f3cdoGJvB0MfE15ph
fzsLyVp1ZVb2XfIDWnvyer2nZw6E1xBisTwUBXpcBkjAUf1h8/Xudt3zKkN0x4hm
ZcUYSi0Nxl/LADSoQL+Z4KBENZ4H66q3K7Im1tXIGaitL9jkZeH+60Jasxl7rkh2
vdIpWccfNfXJp+4RnDYazh3GlARIrYb5YBdM/Mz9rY8SYvLHDMhPXykuRFSg46O5
cm494T4dCIIAB1TBk99AIehbMmMFNSZycq5ENC/98VntZZsLrVCK2emLi+NtBVow
p5FeYqFsaCqNv+0iAtUSqXjpnq6sHXkn24XShTYrnVQrEd6uUUlbyayaRFjK46Jp
wsgcQD0Ms+GkRui9d+760Uk++wsZgRROZshCIjHXWQWDNzKknqE=
=eZ5n
-----END PGP SIGNATURE-----

--E187YRO8KGM40JwS--
