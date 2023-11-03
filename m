Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp814733eja;
        Thu, 2 Nov 2023 20:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ/4GZ0rIXQQGA4AhsurVFUY4sa6uq5MLKUJjtyRHctjeP51oAS3CX6sLfbW5zY/E/kd1J
X-Received: by 2002:ac8:5e4e:0:b0:41e:3c42:bbff with SMTP id i14-20020ac85e4e000000b0041e3c42bbffmr23281283qtx.49.1698981850572;
        Thu, 02 Nov 2023 20:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981850; cv=none;
        d=google.com; s=arc-20160816;
        b=LMIdhz4Lo3FTRE32sm3CJfQ3v3KOsfpuOZ3PkiSVK6zzEEqrlGKSlIo/wJCwOzx0Wl
         WIUXPz398rmZIdnY4dv/NMAG6Fw2u42FiKV/KI9hnNN5aLvaqtWTVAk6DxV3D/jwVA2d
         0KEGHi7x9TsWapeRX+wpA0aR+6umNfQzigQnQMu6wSbzvvGQmgmxoTAdN0cwwj/vmfT0
         fXH8ZMlTLbe9Up34VxHcr+OpEvOroCFD8SQM86Q6YA9ZFydDIDwRLZWqgFb3cforCnZJ
         wA4g2rEhJtA1Se7vXGldIp17CU8Owp46A9EBemRT3945E7ZfzyX8iWOYghvMQe0Ye/ls
         +hJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=+eB/u9oLNspqXcPK+E8Mco/4NBkWn6vwr1h/+oomn9U=;
        fh=1eSBVWkhTIxB1FMRNgNedy3GfLOxebt8JH9gOPe63dw=;
        b=aFp4dRWKuAwfuPpoVCEIIYI8CKV/Dy+eNUpP0QJmf1xJ7fBHUaxx36xQkVkifUEBwr
         vu/5xlU7QmBCJoZfwbW8LQKpIgQu8N4sfp0/UDOelvg04ikU97JTLrWw4aKNHgvzT0cQ
         TshCVd43Sq/ioJp42YbFQLA91+7MZqdlOyGP4y5wXh3/t/UYF7eF7oUDFWYO0e9z5WNf
         kp6YaHBlsYIUzSMQsDF9R+b6aeHeUmxKk32vO4tthrxXTGfVoCDOpe6fVkBjid98Gh/b
         z4jD0l2k7DHGeNJCD+ORVXsYBs27AkdeKc3c3V9DRIbmkjBEn/EWKun4cD0JT4tRaouT
         sLXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ijbjOzPZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020ac85886000000b004198b50a2c6si747351qta.459.2023.11.02.20.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ijbjOzPZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykn1-0003Tq-5b; Thu, 02 Nov 2023 23:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qykmz-0003Sm-Fe
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:24:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qykmx-00069u-Rp
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698981842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+eB/u9oLNspqXcPK+E8Mco/4NBkWn6vwr1h/+oomn9U=;
 b=ijbjOzPZWxWVmBx24YzJSa+TGtBsYDrcfYLodm5/0jx0wI/ChU3tKsI/AvuI0mlfxkbQ2V
 cm99cWuR9gfg4JvqaQ5wyowhGZ3J7a3WVgF9q9MVSYoQ0f+jsiOI3gDFLNzCVVlVilqMl4
 +IMMCr3jvNK2pqX6XcHcWPQduDWbF2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-Pm2DZNyLOjme-KRmmjNgXA-1; Thu, 02 Nov 2023 23:23:59 -0400
X-MC-Unique: Pm2DZNyLOjme-KRmmjNgXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9D6C185A781;
 Fri,  3 Nov 2023 03:23:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1960F3F9;
 Fri,  3 Nov 2023 03:23:56 +0000 (UTC)
Date: Fri, 3 Nov 2023 11:23:53 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PULL 00/40] Migration 20231102 patches
Message-ID: <20231103032353.GA772102@fedora>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+mUUt5TN4jlsF39c"
Content-Disposition: inline
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: WExF8kicMRCN


--+mUUt5TN4jlsF39c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--+mUUt5TN4jlsF39c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVEZ8kACgkQnKSrs4Gr
c8h4Xwf9EmXawNS/GWHyQCKGdfE4V2MJTWhc19RhUzUbpe6ps7f+Va0tXEwEMPME
Ttf/JZXqIU5JJI+Z5SN7/UVrndTVkw1sRg8HHOhiCsymDWaGWP5PZyaJyoELpoH1
Yn/VS38/KhE9pvpSo4gdoSxQnavwAFuwEniManGz9AQ4zzlH0YY58MW5jVssWI3C
W1bySHtgZ4N6tS9hBJX88Pr2QxrS+UhLEsSFvPEysiFGFuqxRFD89DOCeJS+gPnK
cQhrH+qhY7rpT00ijJNQPdk0zS87LO1e8oGf9+QDTalOIJZ65L7ffqEh3Z5as3Fl
L9WqbadmvroN7eJl6flK5qUndiWMsQ==
=B/ad
-----END PGP SIGNATURE-----

--+mUUt5TN4jlsF39c--

