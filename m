Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4537418lfb;
        Tue, 17 Nov 2020 03:46:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3slwfQk8bleHoNiaMIfwrpqWrABmxTQWiEFQ5bzQGGuH6Fi0qu8W5ZpJzNZphQHHNDCA7
X-Received: by 2002:a5b:743:: with SMTP id s3mr23900224ybq.73.1605613566278;
        Tue, 17 Nov 2020 03:46:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605613566; cv=none;
        d=google.com; s=arc-20160816;
        b=VEbJk7yCjn1Gkp0NzAwVcORK+J3zm/b47hmeId5qCYvBc7TDk7aIYrYv7iqYs/BURj
         EbTz7Y3pOh4julXKtNbeVK9JPhzkq8Rg0M8PgxZ5ivyCt7YX9OduwS5OgWINcb13m7yF
         HuJRoQTm5hbNRW3fPcK0Z+KE3cHHA3V9PVRij5gr8Ffw7R6NuCw/EkUjpLGxTqvdqQid
         Mw28fQcAfJ5NgpdwChBHcTtGc6tQFRlAy14tvcF2Y7UWOkBHQ+k3DXe3oUf0gL6aYby/
         Mt5aPcz6x2hMc32wiW1BOONZ/jigWK08HexE9IM2UhghHsw2FyNny9LZQ+6QwY3Wpbcc
         HAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=QxY4UqZf4gJmvDKADBBZL/DLc3RbCkyBC5jEFej02Pw=;
        b=xmMBfyMy9iflHbc6KNtgsLF7tl7BrqxjvxzhCuzqmtf6gvTD9ZRSKcIHOBCiNub0De
         c/w3I09yboQqV1oCEuIO4cZvPkHjVjzZeqZy4Kyrnj5dZBxR6KTHQ6p0jXburBCz5iZe
         /7pDynT84xBZZ/lLDdm8dB2pzhRe4XKIqCofDoqM5VnocgnlC9yQ2nSkuS+vThqV8PkN
         tJpfFgDUVC0uWa9rsMAsUFBhhhQXfhlaUYAajR5xrFOiRSfaMloZX1Ycaaz9FecSVcun
         E0wOVGU7AXF0joTbz6gHTe45pHyoqL8QdGNnmLExQ528f18YnNOaCVteYFPiF0dmAILI
         bKUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FFsHbb8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g200si22020973ybf.384.2020.11.17.03.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 03:46:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FFsHbb8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kezQz-0008Aa-KJ
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 06:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kezQT-0007OM-P3
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 06:45:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kezQR-00083I-28
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 06:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605613530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QxY4UqZf4gJmvDKADBBZL/DLc3RbCkyBC5jEFej02Pw=;
 b=FFsHbb8raMRbT93puXkMsTR29bNtRcELybt9cGuWCCKLuAqTVi8GBPEsxpHCIUKIEhnsJZ
 kFbyYkCp3f6YBh9B84ZHHOW3JQBuFSkasSbwVlKOrMvC2WdeG7Ic1HQ17edclmfiut9ukM
 TIYtf6IB3sxYlby/jBR+wnENS17FSis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-tj-qtaBzNSOnScqnf18RwQ-1; Tue, 17 Nov 2020 06:45:26 -0500
X-MC-Unique: tj-qtaBzNSOnScqnf18RwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21F0E57097;
 Tue, 17 Nov 2020 11:45:24 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72F165D9CC;
 Tue, 17 Nov 2020 11:45:09 +0000 (UTC)
Date: Tue, 17 Nov 2020 11:45:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 4/7] qapi: Use QAPI_LIST_PREPEND() where possible
Message-ID: <20201117114508.GI131917@stefanha-x1.localdomain>
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-5-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113011340.463563-5-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6lCXDTVICvIQMz0h"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 armbru@redhat.com, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 KVM CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z4ThTtgPV0IP

--6lCXDTVICvIQMz0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 07:13:37PM -0600, Eric Blake wrote:
> Anywhere we create a list of just one item or by prepending items
> (typically because order doesn't matter), we can use the now-public
> macro.  But places where we must keep the list in order by appending
> remain open-coded until later patches.
>=20
> Note that as a side effect, this also performs a cleanup of two minor
> issues in qga/commands-posix.c: the old code was performing
>  new =3D g_malloc0(sizeof(*ret));
> which 1) is confusing because you have to verify whether 'new' and
> 'ret' are variables with the same type, and 2) would conflict with C++
> compilation (not an actual problem for this file, but makes
> copy-and-paste harder).
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/devel/writing-qmp-commands.txt |  12 +--
>  block/gluster.c                     |   4 +-
>  block/qapi.c                        |   7 +-
>  chardev/char.c                      |  20 ++---
>  hw/core/machine-qmp-cmds.c          |   6 +-
>  hw/core/machine.c                   |  11 +--
>  hw/net/rocker/rocker_of_dpa.c       |  20 ++---
>  hw/net/virtio-net.c                 |  21 ++----
>  migration/migration.c               |   7 +-
>  migration/postcopy-ram.c            |   7 +-
>  monitor/hmp-cmds.c                  |  13 ++--
>  monitor/misc.c                      |  25 +++---
>  monitor/qmp-cmds-control.c          |  10 +--
>  qemu-img.c                          |   5 +-
>  qga/commands-posix-ssh.c            |   7 +-
>  qga/commands-posix.c                |  46 +++--------
>  qga/commands-win32.c                |  32 ++------
>  qga/commands.c                      |   6 +-
>  qom/qom-qmp-cmds.c                  |  29 ++-----
>  target/arm/helper.c                 |   6 +-
>  target/arm/monitor.c                |  13 +---
>  target/i386/cpu.c                   |   6 +-
>  target/mips/helper.c                |   6 +-
>  target/s390x/cpu_models.c           |  12 +--
>  tests/test-clone-visitor.c          |   7 +-
>  tests/test-qobject-output-visitor.c |  42 +++++------
>  tests/test-visitor-serialization.c  | 113 ++++------------------------
>  trace/qmp.c                         |  22 +++---
>  ui/input.c                          |  16 ++--
>  ui/vnc.c                            |  21 ++----
>  util/qemu-config.c                  |  14 +---
>  target/ppc/translate_init.c.inc     |  12 +--
>  32 files changed, 158 insertions(+), 420 deletions(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--6lCXDTVICvIQMz0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+zt8QACgkQnKSrs4Gr
c8hDhQf+L+hNWNd8XdGQ9pCFfFVridvlCLSADlS2y068TIxm3ULn6992E/HIwgNE
XTPQv9doC8lpzcvqJuU2ymAZJYG7+z3S4vDey718utlHEzd9OlnrL5jr/bWATcEU
TO37SfDmorxQh6ocRX99I4wYqTgXXWNj/7yWjrluwWtZ+2U/cuSNxNTmc0BVoxdT
JEc67hGQynMWUHnI3WstlcuiqGfeH2YD3P3s6QqwKtg7X0uehiFPbBmYn8+F8R2V
zL/zlGTtQvUzNEJhMh7QVwDtYqxeFt8BsU4D7u27VAf7gHfdnXmyvUktukA41dp+
Huec0TudNHVqqA3ypLRmZMoqxWh/SA==
=OD36
-----END PGP SIGNATURE-----

--6lCXDTVICvIQMz0h--

