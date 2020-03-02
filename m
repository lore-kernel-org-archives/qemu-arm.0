Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2368837lfg;
        Mon, 2 Mar 2020 04:14:58 -0800 (PST)
X-Google-Smtp-Source: ADFU+vugcIe+/Vw4y0/9X4t0MtsB2UxHiHf3pMPWTzeYz6IhUUUqqMZVjAMyGMiF5n1wTdytTkqT
X-Received: by 2002:aed:2a0c:: with SMTP id c12mr5204261qtd.268.1583151298042;
        Mon, 02 Mar 2020 04:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583151298; cv=none;
        d=google.com; s=arc-20160816;
        b=GRl5902r5qvZ6DLLun0aG1BcJMMgWz1Z4myac8N7Q0ObMlqiHttQ5SruICJGsf7sfC
         AJ9/TiLR/Srcl0Ubn+GtGZbyPpdiWIWYnRVy7lZxC9+PYmjJpYMGrj2bdY22dcqMPpC9
         llED2oVidV7JquQ57sxP3jPy6EDVrYRh3qf/8WVLjcL+XQLVbHy5wBihApHQuao6DgIn
         4UdI3cRF3i7ld30i7kOTOWEvB8h6xt0PXxZRp2gse0bYXEgn3QcumfabJegHaO3rX62s
         KMl/KzP1bgKIKeXsGdBFHChTONpgTcdnK02xPdKkHGFc08c6mNTcilGR6M5gcKzs9BQZ
         b2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=5dOaNjFvD9FFDm5f+AHw6gOFvmBy/f2jfxDK6QRSXD0=;
        b=xevXI7pLf6Euom99jKC4fDpfJ8OQoHjHyY+jekUDDOUBap+YdJ6C1EiQOuR5cBuEDc
         lo9Pn8B0nw8zuQv4JRdXcN/1GS8GIhIu5P61eUJpEq8ny2SKgfMdSC0WhLsLv3m9VEox
         1rIM/FpzUtFMvxXvQPTbhg9LRc/d/St2Yxl84AwJ0t6DnLOXV3CaWwBWSq/1hfGKcFJy
         PBe7vF1wTC+al7Hrmp/w/vJAPFk48O3LOMRQOg6AwHgvaeQB8/vB3SOWKvM5veyjbXgA
         wqP4k58qf5i3tJ7DcE5cX+OhP6rUEsOoJmZrpzBkVmlhXD+ZL4gHI4QwS+jMvGbXu5se
         qJwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EkMxCjM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dy9si5271026qvb.63.2020.03.02.04.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 04:14:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EkMxCjM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jyL-0006Jj-EN
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 07:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1j8jxz-0005vF-2h
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:14:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1j8jxy-0000mV-2I
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:14:35 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26630
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1j8jxx-0000m9-VD
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583151270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dOaNjFvD9FFDm5f+AHw6gOFvmBy/f2jfxDK6QRSXD0=;
 b=EkMxCjM8SxEvTju2avu6ZlsWCe3U67N4+dNvhsbrxdp5T8wyTNYa7tELo/kMpsscBpYX/M
 R01yohCl2pXlkhPsOSWrQwRuHzfoUywcyfzkPGHmGAozKWsMVIH6i1oZTXP57t+eNvGv6f
 lubfelbDAKw2xAQMjgDCjY8gNQ1p7qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-9P-OmDnUNDSTRosOZQwCzg-1; Mon, 02 Mar 2020 07:14:26 -0500
X-MC-Unique: 9P-OmDnUNDSTRosOZQwCzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FEEE190D346;
 Mon,  2 Mar 2020 12:14:25 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B58160C05;
 Mon,  2 Mar 2020 12:14:21 +0000 (UTC)
Date: Mon, 2 Mar 2020 13:14:19 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/6] hw/arm/virt: Introduce VirtGICType enum type
Message-ID: <20200302121419.vm7l3ooqo26inpt6@kamzik.brq.redhat.com>
References: <20200302105516.5972-1-eric.auger@redhat.com>
 <20200302105516.5972-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200302105516.5972-3-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, maz@kernel.org,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UljmjXGA5Yrt

On Mon, Mar 02, 2020 at 11:55:12AM +0100, Eric Auger wrote:
> We plan to introduce yet another value for the gic version (nosel).
> As we already use exotic values such as 0 and -1, let's introduce
> a dedicated enum type and let vms->gic_version take this
> type.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v2 -> v3:
> - replaced defines by enum VirtGICType
> - use that new type for vms->gic_version
> ---
>  hw/arm/virt.c         | 30 +++++++++++++++---------------
>  include/hw/arm/virt.h | 11 +++++++++--
>  2 files changed, 24 insertions(+), 17 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

