Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp705070lfp;
        Thu, 23 Jan 2020 06:13:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiLU/p726TO2aX5TDRfm2B6P8kmaD4EryeKbqOjn7rNAMumDjCtpwY5y7TebzGgtH1H1pn
X-Received: by 2002:ac8:704e:: with SMTP id y14mr16247144qtm.279.1579788808855;
        Thu, 23 Jan 2020 06:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579788808; cv=none;
        d=google.com; s=arc-20160816;
        b=XiPimd2ghcknPmYt5c/W6WXspRgOJ5fytBSE7tSujiP0Bh0uijxT19YLrBoZoB7GDk
         N/y8oKZajunIZFOYdqWjEamUGA93IdGTz4BE82Yfl2hzAAwtjXJY+nTnJgOu4pJXX77I
         2v4lLfyfh5oLO3n7ZIadxHR378Npw+xlLQtOasCspak3/gfCmUrFoZeF8T7QfVVJvIaN
         r7hp8BxLCjIIOdyE84ls3kf0Vz4sthxo75P2g5OLqEU5fH0iVzAAoUTtOTJx+h3XIRGr
         xHCqbei9i+lQVKBJNgUg0R7u2++LLGznll/KL6VMr5uJoJWIKodIBrnJF7AsehbDn+Ix
         Jbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=CeuFK25U9RHqFoRab+T9Ogkit/2+wkjDCN/atYUZSmM=;
        b=mX8oS/6tWiMzq2N6P0mRgzZXX27yPhxmT2cXT0QLLn9X5c35etQZfgVuhwiKoNFBS/
         6zdOaljpib07kPLmftj32ULBnJg5erO7AuZfl9TuwRRlZMsDQxroZpRQZd2mT7PmK5mK
         kTo7WiCRLhnInXMwIuGlg6lVt/+IggpVn7wCwt0oK8emv0mNCCkKKaR+rhk81QIHl7ZO
         VczTxgj2kH4XzuWsLyypttQSxWy1v8o7WeVe8V9SDhE4+32LyncpoimhF71g70EaAZSr
         9SyB45N7RJdBjs0U0BLDTddXkQt2ZPA/krhyIoosizbshItdwow8d5AYsIuDQ8LTChMw
         IPJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EW7trAUz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si532144qtq.104.2020.01.23.06.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EW7trAUz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudEd-0002bH-Oa
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iubn0-0003ou-6C
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:40:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iubmy-0002GJ-Ot
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:40:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45354
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iubmy-0002Ev-Kd
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579783248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeuFK25U9RHqFoRab+T9Ogkit/2+wkjDCN/atYUZSmM=;
 b=EW7trAUzHUJVIpXuU4IAAf7X8S6Ct/hTVkeSOyC4UrEWiJ1X/GULgSz5I3c8qQrONGNswL
 Iy8SGXsLVuQffHPkQ0HNpFFDtzJBHghU1PL4+BmP1oXMOEUZY5HsYF8G2H37NkiZ8Sog3h
 mepdU6XkHYUwQcXbIrgGwA8w5leu770=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-gOUWXMsZM1iSXuVPe9pGBQ-1; Thu, 23 Jan 2020 07:40:44 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3A03DB2D;
 Thu, 23 Jan 2020 12:40:42 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90A4B5C290;
 Thu, 23 Jan 2020 12:40:41 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:40:39 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 15/80] arm/integratorcp: use memdev for RAM
Message-ID: <20200123124039.iz3pkwh6lm4mnatw@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-16-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-16-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: gOUWXMsZM1iSXuVPe9pGBQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Onnh2tmuVI1p

On Thu, Jan 23, 2020 at 12:37:40PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: drjones@redhat.com
> CC: peter.chubb@nicta.com.au
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/integratorcp.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>

I don't know anything about integratorcp, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>

