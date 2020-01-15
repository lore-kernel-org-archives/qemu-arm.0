Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7099983lff;
        Wed, 15 Jan 2020 08:00:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqw07shevmpRjEzc/1P+inZCJU8SrTGvYAsFEQnlmu+DdXCq+TwkzFmJicisnVs4hs7mWW3S
X-Received: by 2002:ae9:e115:: with SMTP id g21mr27363924qkm.187.1579104015568;
        Wed, 15 Jan 2020 08:00:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579104015; cv=none;
        d=google.com; s=arc-20160816;
        b=B6zV3VtCBNb3USwCu4iJZcBf5hcb9DOK46JD14tEoJ0/RZOymoTet+vTqK8TgadvDQ
         cwngoJZPGCboIZa/bAnY+cDIM2tHqBDwnO8Vg3iKo/tZNCIH+pgzdrt+B2eErsIzYMo6
         ox6uR1J7/M6nevKDBfzAwKWUk76r/7WDZG98lUKZZLUwWWYEjEMpeZonltiSAGDRjBGv
         DqzXUguYYYpU6p2KOo3SvnD8sTJOTKzA7arjbXX/8ucGDR+Uf5VD9z9+v+0Ajl8v3U9Q
         hbhiHtpI2SwJs4fchbMoiAWFSK6nx4igs8k7KL4lw4kx3LI2CRq7fJVwRFXXxV21ojsI
         Cy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=9/uTMn24Zke4DRuhEw7wyZIybd89ak3R1ZI5+FRteL8=;
        b=WYlDs5rM51Gtwa+ftzpOcjgC8XyM57r8XRhBtLt64VHeiPFfPbEaPgPsTLQkq+jgK7
         a0mz0VvqIoIax2yvEgnmB0No0UWXAvCwU31sMhDx62Z7BLITWD/9PoDCsKBftbWZMtPp
         +lXMmINwKc03NT0JDGg8oNfpu0ILYjeQZaUQqLYrDYNvVKdgF0UGK4QQTQWQh3cPZdMe
         GhcGgo+G917Nd7g74H64g8NgVi5HwGVOZNXq0ZX2oW2lGB7UU3ECUzmRKdeJYjVRoly2
         OYHyAdqkNV1ZTtTpKVSmwv5z+ob3sTS+8a71T1JiZUP6XJzSTDDDXGxGOY0xZJRUEjDX
         S1bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="X6DnYPh/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23si11368139qtq.320.2020.01.15.08.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 08:00:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="X6DnYPh/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irl5a-0004dc-6I
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 11:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1irkhS-0000xZ-3a
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:35:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1irkhO-0005q3-J9
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:35:17 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49634
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1irkhN-0005oB-26
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579102512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/uTMn24Zke4DRuhEw7wyZIybd89ak3R1ZI5+FRteL8=;
 b=X6DnYPh/lpFiUVhDNsafA10R8XCBd1hS3TldemyxxNIXpY5N8d0MitlVO5vrqBCG6z6TUo
 PdAN5dOG4BRQzHFWS84lRrbnn3gEJ+A6WynJY5Jb7LuGGmXsUqVutFk1KHi2HwTVDGcPgi
 3URailnTVVsBm+NRMc6Y6ntj/UiWoDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-VBWK8jUzPMWpm1R8SUoEOQ-1; Wed, 15 Jan 2020 10:35:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3F6928C3C;
 Wed, 15 Jan 2020 15:35:07 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 063EC675AF;
 Wed, 15 Jan 2020 15:34:55 +0000 (UTC)
Date: Wed, 15 Jan 2020 16:34:53 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [libvirt] [PATCH v2 82/86] numa: forbid '-numa node, mem' for
 5.0 and newer machine types
Message-ID: <20200115153453.GL3243410@angien.pipo.sk>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-83-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-83-git-send-email-imammedo@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: VBWK8jUzPMWpm1R8SUoEOQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 rth@twiddle.net, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tcUZy/NdMcox

On Wed, Jan 15, 2020 at 16:07:37 +0100, Igor Mammedov wrote:
> Deprecation period is ran out and it's a time to flip the switch
> introduced by cd5ff8333a.
> Disable legacy option for new machine types and amend documentation.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: peter.maydell@linaro.org
> CC: ehabkost@redhat.com
> CC: marcel.apfelbaum@gmail.com
> CC: mst@redhat.com
> CC: pbonzini@redhat.com
> CC: rth@twiddle.net
> CC: david@gibson.dropbear.id.au
> CC: libvir-list@redhat.com
> CC: qemu-arm@nongnu.org
> CC: qemu-ppc@nongnu.org
> ---
>  hw/arm/virt.c        |  2 +-
>  hw/core/numa.c       |  6 ++++++
>  hw/i386/pc.c         |  1 -
>  hw/i386/pc_piix.c    |  1 +
>  hw/i386/pc_q35.c     |  1 +
>  hw/ppc/spapr.c       |  2 +-
>  qemu-deprecated.texi | 16 ----------------
>  qemu-options.hx      |  8 ++++----
>  8 files changed, 14 insertions(+), 23 deletions(-)

I'm afraid nobody bothered to fix it yet:

https://bugzilla.redhat.com/show_bug.cgi?id=3D1783355

