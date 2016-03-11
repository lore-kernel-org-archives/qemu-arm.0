Received: by 10.25.208.211 with SMTP id h202csp942833lfg;
        Fri, 11 Mar 2016 03:01:55 -0800 (PST)
X-Received: by 10.50.150.3 with SMTP id ue3mr264903igb.95.1457694114788;
        Fri, 11 Mar 2016 03:01:54 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 78si687918pft.93.2016.03.11.03.01.54;
        Fri, 11 Mar 2016 03:01:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751675AbcCKLBx (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Fri, 11 Mar 2016 06:01:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51710 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751658AbcCKLBv (ORCPT <rfc822;kvm@vger.kernel.org>);
	Fri, 11 Mar 2016 06:01:51 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 4B381A2886;
	Fri, 11 Mar 2016 11:01:50 +0000 (UTC)
Received: from localhost (ovpn-112-70.ams2.redhat.com [10.36.112.70])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u2BB1lAB019166;
	Fri, 11 Mar 2016 06:01:48 -0500
Date:	Fri, 11 Mar 2016 11:01:47 +0000
From:	Stefan Hajnoczi <stefanha@redhat.com>
To:	rutu.shah.26@gmail.com
Cc:	qemu-devel@nongnu.org, kraxel@redhat.com,
	samuel.thibault@ens-lyon.org, kwolf@redhat.com,
	pbonzini@redhat.com, crosthwaite.peter@gmail.com, rth@twiddle.net,
	mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
	balrogg@gmail.com, jsnow@redhat.com, alistair.francis@xilinx.com,
	agraf@suse.de, jasowang@redhat.com, blauwirbel@gmail.co,
	mark.cave-ayland@ilande.co.uk, cornelia.huck@de.ibm.com,
	borntraeger@de.ibm.com, lcapitulino@redhat.com, armbru@redhat.com,
	qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH] Replacing (and removing) get_ticks_per_sec() function
 with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah
 <rutu.shah.26@gmail.com>
Message-ID: <20160311110147.GE6523@stefanha-x1.localdomain>
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CGDBiGfvSTbxKZlW"
Content-Disposition: inline
In-Reply-To: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: cO76q8VzywR6


--CGDBiGfvSTbxKZlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 11, 2016 at 01:00:09AM +0530, rutu.shah.26@gmail.com wrote:
> From: Rutuja Shah <rutu.shah.26@gmail.com>

Hi Rutuja,
In addition to the commit message/description issue that Eric raised,
please use scripts/checkpatch.pl to check if your changes cause lines to
exceed 80 characters.

QEMU coding style is 80 characters per line max.  Patches should not
introduce new violations in existing code that follows the coding style.

It might be simplest to address all 80 character line warnings from
checkpatch.pl, even if the existing code already exceeded 80 characters.

Thanks,
Stefan

--CGDBiGfvSTbxKZlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW4qWbAAoJEJykq7OBq3PIKGoIAK+RxOz8vJ9y4UJOFWIRCZQP
pCdtBN5bb4wVxo6uv2rTwINmrCoHfmI+9OzwAO0FEXlgSgkYxx6vw3YMKccEKbTX
Vcg8u0M62zuBrdZ3bV72CF78nCdrMwlKKZ+/OXhDqzSa80MzXasUocYV5gUnyUsc
Rnevy9DysFVMji0a9bmEADikqFOyDp+EGeSMkWgVs3JbkhFTgVgQOzeBETqhrm46
ICNAmHC1eebYcBp43w/FvZhzw8Pje77gI5vcal45kXzmzmGzFkSbIoqBtc6JlQTx
YvsBz7Rx9inqhLDygMK21NuW54DMPH1mq/l4yb4Mbd+qDC0zIk1fwK3W7/IX/g8=
=1Xcg
-----END PGP SIGNATURE-----

--CGDBiGfvSTbxKZlW--
