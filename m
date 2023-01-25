Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp697352ejc;
        Wed, 25 Jan 2023 14:20:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsL+VTlYfcjSavcSMRDxU3K34jTxy7AtJKiZQGiMqyw/2s9N2CntvGysxwvCFyJVhEcpfS4
X-Received: by 2002:ac8:70da:0:b0:39c:da21:6bb3 with SMTP id g26-20020ac870da000000b0039cda216bb3mr49472565qtp.56.1674685228738;
        Wed, 25 Jan 2023 14:20:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674685228; cv=none;
        d=google.com; s=arc-20160816;
        b=lkomZQmgYNDH8Sww85ytAXC+BAxzUmzi2+BftlmXcHZ77zc/ytGAYKLCK4xKdk7tci
         2ScksWLZBOmw29+bMblYKbmX671EJwmdDi//P+XoWcR+WKgbQg6SBfEnbMAVF1NCt7WR
         qSFF9D+5lLBJjD98YcFtCLbCKdQIov8Mw1oiWttFOB9Wi4veA+ntsdSCpH+iStQXzr0N
         uZeohmAWEZcy4ithoccEMwdA1CBK7LNNVc309svETTf2SK6ZY/rJjKsf7YH6zD0Pz2mo
         of6JXi6tlqTDChwz9ugJf8XCMyca3Wsa85TWdY2rpOtLGGtOgIVW6xxE8H49OGtQJwhM
         mwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=SXWTS7PEfK4jfis5AMTJ0jfF1+NWNTH+CYWW0b9TfAk=;
        b=0u9zbSh51Gp70tJ+FILIGSyG/e6WmzRuq1iShSEseUz3xAyxgGvnSi59kXMm5sXp+a
         DiAnQpozhmGJNAn6LXoAP52W0oPStTou8GVPvISiTHTPzrGraBy2G+L2si6HWXMfBmgb
         HUKmD7H2khi/mhgSJcV/f01X+DR5af9wzOmeC4HWkB06AG2mj7Tn8zavhmABwGV3JYkv
         Ttuc3HAqVWJOEVoZucXYJSkmZR9lkNRGBWKxo7s1NrpxSuE/WXxnN/3FuGfAKWEg+61i
         7r1NqHC7xGpEsDDto1X5SxuHjFTrVBzcDzMCDad3n6WmGCKCynFyo7VpPfb5Du3SNSug
         yRMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J2pR41Xa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23-20020ac844d7000000b003b2202446a6si4282157qto.517.2023.01.25.14.20.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jan 2023 14:20:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J2pR41Xa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKo7f-0005uz-O0; Wed, 25 Jan 2023 17:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKo7d-0005tt-QH
 for qemu-arm@nongnu.org; Wed, 25 Jan 2023 17:20:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKo7b-0005Ka-Tk
 for qemu-arm@nongnu.org; Wed, 25 Jan 2023 17:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674685199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SXWTS7PEfK4jfis5AMTJ0jfF1+NWNTH+CYWW0b9TfAk=;
 b=J2pR41XaZNUqyzbhJleSSRIW7xsHDrTjpUVUTt0cTMmqfoFqQlq5zlITztOqBHYxsUc8S4
 IiX/KiESTRGNTP4FsLjksyhv36pUDYdLcA+wDlX4fPzK9ox/Pq2QYK+7qbrqLNKJRU/e2k
 b7xBQkNAyQ67vgf5NPSNLmapDn9eBNU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-Eg2ockkrMBCcGSKv08KftQ-1; Wed, 25 Jan 2023 17:19:55 -0500
X-MC-Unique: Eg2ockkrMBCcGSKv08KftQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2F43C0CD39;
 Wed, 25 Jan 2023 22:19:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4F4CC15BA0;
 Wed, 25 Jan 2023 22:19:51 +0000 (UTC)
Date: Wed, 25 Jan 2023 17:19:49 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:Old World (g3beige)" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v4 3/3] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Message-ID: <Y9GrBTALs18YkSKG@fedora>
References: <20230119070308.321653-1-alxndr@bu.edu>
 <20230119070308.321653-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M2N6eqImXDUC6qNs"
Content-Disposition: inline
In-Reply-To: <20230119070308.321653-4-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SNHSFm/IY8hv


--M2N6eqImXDUC6qNs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 02:03:08AM -0500, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
>=20
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/9pfs/xen-9p-backend.c        | 4 +++-
>  hw/block/dataplane/virtio-blk.c | 3 ++-
>  hw/block/dataplane/xen-block.c  | 5 +++--
>  hw/block/virtio-blk.c           | 5 +++--
>  hw/char/virtio-serial-bus.c     | 3 ++-
>  hw/display/qxl.c                | 9 ++++++---
>  hw/display/virtio-gpu.c         | 6 ++++--
>  hw/ide/ahci.c                   | 3 ++-
>  hw/ide/core.c                   | 3 ++-
>  hw/misc/imx_rngc.c              | 6 ++++--
>  hw/misc/macio/mac_dbdma.c       | 2 +-
>  hw/net/virtio-net.c             | 3 ++-
>  hw/nvme/ctrl.c                  | 6 ++++--
>  hw/scsi/mptsas.c                | 3 ++-
>  hw/scsi/scsi-bus.c              | 3 ++-
>  hw/scsi/vmw_pvscsi.c            | 3 ++-
>  hw/usb/dev-uas.c                | 3 ++-
>  hw/usb/hcd-dwc2.c               | 3 ++-
>  hw/usb/hcd-ehci.c               | 3 ++-
>  hw/usb/hcd-uhci.c               | 2 +-
>  hw/usb/host-libusb.c            | 6 ++++--
>  hw/usb/redirect.c               | 6 ++++--
>  hw/usb/xen-usb.c                | 3 ++-
>  hw/virtio/virtio-balloon.c      | 5 +++--
>  hw/virtio/virtio-crypto.c       | 3 ++-
>  25 files changed, 66 insertions(+), 35 deletions(-)

Should scripts/checkpatch.pl complain when qemu_bh_new() or aio_bh_new()
are called from hw/? Adding a check is important so new instances cannot
be added accidentally in the future.

Stefan

--M2N6eqImXDUC6qNs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPRqwUACgkQnKSrs4Gr
c8gRpgf/XSMSSsqXecEYX86MfvLzEtDZEi3FpITflNUsNp60gUR3RxhOHYM1uYKt
JJsD58pqNmAqE+w3Yp3IfsHiqN2/Nn4M11DhA+LTtr/aOBDj2Avtn8cjlD9B/9sv
pdBlSmT9qdqNSMV0Vf3PeTQoFPgO0HfszA90SWOxVtRSPY5+I0ogrcBQnF9CniKP
ckWq3++62BxEnQDD74thjGagTPexUnMER/G5RGu7bEHZZPnVCUZSrRN413f5eco2
8hJZwVfvUmr/28Pn57ShdIm0T4VAr8A2T4+BpaGpc5oiBL5Jxblkj7J8+A78tv0v
jeSYTaMqrl98ceiYFrymlZCjC9aaOQ==
=MJ1Z
-----END PGP SIGNATURE-----

--M2N6eqImXDUC6qNs--

