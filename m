Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1385795lfc;
        Tue, 3 Dec 2019 03:42:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzB6SW6qqmz7xfI7FovNheCfvYCgKL93Ntc27JccQFid0BBXHmoo8//beieyzBa+qO15jga
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr5297226ejk.319.1575373321457;
        Tue, 03 Dec 2019 03:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575373321; cv=none;
        d=google.com; s=arc-20160816;
        b=TDb4N0uA121XnZMYuv8OS0UsPlUiW+9khvThcCrh33ToyemCVw6Ls0d0QtQzfsXZHv
         aM/EtqxkVktDrsQvR3Z+Aef4XibnglnKDcWVIcQKMQozxwd9bL4Ms7PIa1rDafkegpQ7
         7azL91eYUnF2WcAX4qE+nfoBBZjHsbWQ4xSIMpU1Yoel5ka4tbu13KNzKw90nBzxDWvT
         GMTmefyhgqbZaTuui2q2VnsfnbqwRJ2l5pXv/0wxmAPvAtNAF/2g7wMJsI2kIDtyt98K
         rqvodoYISCR5caUH5+/OviU16wygQL74HZDZaIOy8LvIXoYWxaxoLTHNjtlRAgDHMwAW
         GGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=NwAk+Da7Sa9WbF8WdOPnmCk9odQXkD2H7mOgA6oAhlU=;
        b=uxTyM0nJTplAVCEEwHj2AmBFtpjnbz3RKIaH+p3sD1oBQuJ+sALDT7rryIx8cqpZ9Z
         mx1si92TAHB42PbNOXhBJf8EGEGEMKlH4lijUGfULIEWoyNeqB2qKs74zcLekEGecKjO
         74+hZNIfWfzEGgEkyB7NZKvfzlGoK4cbWkbNKX6SSYq+gr5AEhELMmAj9IGo9q6a/f6Q
         kboPSHlJoF+svqcEyH5iVo47/IoV6NGdLSZ+osdQS8lVWPXSrgVfvpjIESVAuBCVntj4
         /S9XsBnXi+j+Dw8gCdxFZyLs9mvGexseVfT0yDKz2Eh8hTG8py9q9/cVpjD8e0N9VUqy
         gVZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iKCEE7eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si1835357ejm.157.2019.12.03.03.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 03:42:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iKCEE7eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic6Z6-0001ZD-Ev
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 06:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ic6Yl-0001Y4-S8
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:41:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ic6Yj-0004AO-U2
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:41:39 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50476
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ic6Yi-00042o-0G
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575373287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwAk+Da7Sa9WbF8WdOPnmCk9odQXkD2H7mOgA6oAhlU=;
 b=iKCEE7eqMspUojsSxdTFpprdky1iIPVogyY9bDItmEg13iwRsCaOhcEwzma9Keus6NWXrA
 juXYA9PquPh5MfhQCsaVCGYKr4Uenjdag96UlhA0tGByFnatE6fjk2Lh6WyZmLTEnXLWXU
 NdB7/xPJLSkC76HJN2Ea+6cNxM83B50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-UQkry_sTMOyU-FXzNTpUYw-1; Tue, 03 Dec 2019 06:41:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1589F1B18BC3;
 Tue,  3 Dec 2019 11:41:25 +0000 (UTC)
Received: from gondolin (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 734E75DA60;
 Tue,  3 Dec 2019 11:41:19 +0000 (UTC)
Date: Tue, 3 Dec 2019 12:41:16 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v5 11/13] hw/s390x/ipl: replace deprecated
 qdev_reset_all registration
Message-ID: <20191203124116.1a1ca685.cohuck@redhat.com>
In-Reply-To: <20191018150630.31099-12-damien.hedde@greensocs.com>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-12-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: UQkry_sTMOyU-FXzNTpUYw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 mark.burton@greensocs.com, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, edgari@xilinx.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BACuR1d1FWCs

On Fri, 18 Oct 2019 17:06:28 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

> Replace deprecated qdev_reset_all by resettable_cold_reset_fn for
> the ipl registration in the main reset handlers.
> 
> This does not impact the behavior for the following reasons:
> + at this point resettable just call the old reset methods of devices
>   and buses in the same order than qdev/qbus.
> + resettable handlers registered with qemu_register_reset are
>   serialized; there is no interleaving.
> + eventual explicit calls to legacy reset API (device_reset or
>   qdev/qbus_reset) inside this reset handler will not be masked out
>   by resettable mechanism; they do not go through resettable api.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>  hw/s390x/ipl.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

