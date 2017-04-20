Received: by 10.25.0.144 with SMTP id 138csp898746lfa;
        Thu, 20 Apr 2017 13:28:55 -0700 (PDT)
X-Received: by 10.36.64.76 with SMTP id n73mr4132788ita.4.1492720135252;
        Thu, 20 Apr 2017 13:28:55 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v2si298342itd.11.2017.04.20.13.28.55;
        Thu, 20 Apr 2017 13:28:55 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S945549AbdDTU2x (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Thu, 20 Apr 2017 16:28:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39034 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S945402AbdDTU2v (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Apr 2017 16:28:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 31C03F93F4;
        Thu, 20 Apr 2017 20:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 31C03F93F4
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 31C03F93F4
Received: from [10.10.121.102] (ovpn-121-102.rdu2.redhat.com [10.10.121.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 95FFC5C894;
        Thu, 20 Apr 2017 20:28:15 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        "open list:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Alexander Graf <agraf@suse.de>,
        Scott Wood <scottwood@freescale.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, armbru@redhat.com,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        Richard Henderson <rth@twiddle.net>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>,
        Alistair Francis <alistair.francis@xilinx.com>,
        "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Igor Mammedov <imammedo@redhat.com>,
        Cornelia Huck <cornelia.huck@de.ibm.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Paul Burton <paul.burton@imgtec.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>
References: <20170419222258.13415-1-eblake@redhat.com>
From:   Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <fdc51365-3006-18d1-96eb-4834e8cac002@redhat.com>
Date:   Thu, 20 Apr 2017 15:28:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170419222258.13415-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rBrcRnlV50apGaIkc3KGProSE0TetEuNj"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 20 Apr 2017 20:28:51 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: V93usfVKtbcl

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rBrcRnlV50apGaIkc3KGProSE0TetEuNj
Content-Type: multipart/mixed; boundary="E0EiK4kbWLgV6Go6L8IiGthoAcpKQvJ6m";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alexander Graf <agraf@suse.de>, Scott Wood <scottwood@freescale.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring
 <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, armbru@redhat.com,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair.francis@xilinx.com>,
 "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>, Igor Mammedov <imammedo@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paul Burton <paul.burton@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Yongbok Kim <yongbok.kim@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <fdc51365-3006-18d1-96eb-4834e8cac002@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
References: <20170419222258.13415-1-eblake@redhat.com>
In-Reply-To: <20170419222258.13415-1-eblake@redhat.com>

--E0EiK4kbWLgV6Go6L8IiGthoAcpKQvJ6m
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/19/2017 05:22 PM, Eric Blake wrote:
> Libvirt would like to be able to distinguish between a SHUTDOWN
> event triggered solely by guest request and one triggered by a
> SIGTERM or other action on the host.  qemu_kill_report() is
> already able to tell whether a shutdown was triggered by a host
> signal (but NOT by a host UI event, such as clicking the X on
> the window), but that information was then lost after being
> printed to stderr.
>=20
> Enhance the shutdown request path to take a parameter of which
> way it is being triggered, and update ALL callers.  It would have
> been less churn to keep the common case with no arguments as
> meaning guest-triggered, and only modified the host-triggered
> code paths, via a wrapper function, but then we'd still have to
> audit that I didn't miss any host-triggered spots; changing the
> signature forces us to double-check that I correctly categorized
> all callers.
>=20
> Here is output from 'virsh qemu-monitor-event --loop' with the
> patch installed:
>=20
> event SHUTDOWN at 1492639680.731251 for domain fedora_13: {"guest":true=
}
> event STOP at 1492639680.732116 for domain fedora_13: <null>
> event SHUTDOWN at 1492639680.732830 for domain fedora_13: {"guest":fals=
e}

Another reason I'll need a v3: at least qemu-iotests 87 has to be
updated for new expected output.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--E0EiK4kbWLgV6Go6L8IiGthoAcpKQvJ6m--

--rBrcRnlV50apGaIkc3KGProSE0TetEuNj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY+RneAAoJEKeha0olJ0NqbaQH/3QPSDMwQQPP++YfbHSPpWhQ
H/XceYryP1bFidJ1BOtcmM5w4BSHqjPXCALbq+bF4Z9A9WsY4ffxdxvWDUpH71Z1
qAQuTgUUEM+LFpKMlV8WMjulmmQbHVKjURtzIjtuQluK/RtZ8m8/5NtAMvFXH1QO
YmWmMrQOZrRkJ89/e6yo1QQ5Xuro8Sd9nWeI3uvhBGCs2/kyOD2wt5M3l+zMDV22
wQ2pE3aKn3emZv5yqThOe69gSisiOyPt9xPysQmII+08Ni/smAuQo2kkZAqTF76q
yhMygaDft61exPOi81wVCynFpeii3MiDHdleLW71F+iZIOmonZl29rkr3Yj7tpw=
=8Anw
-----END PGP SIGNATURE-----

--rBrcRnlV50apGaIkc3KGProSE0TetEuNj--
