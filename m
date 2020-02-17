Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4816291lfp;
        Mon, 17 Feb 2020 00:22:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwu3SfWqBoYKMapzfOjRmFNi32xrFwLbEvhwBpd/1vge8rBU3UrF9csU/6dlny5ua4L22Oy
X-Received: by 2002:ac8:187b:: with SMTP id n56mr12282444qtk.173.1581927720427;
        Mon, 17 Feb 2020 00:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581927720; cv=none;
        d=google.com; s=arc-20160816;
        b=NrKIpwilNq8LfPLdpHOMZPNR9yAGRplrYdXW1D+JK0cYraM7X66KaTBpAZ6huuWhoo
         6HoK5DU0YGTC7teprJRGFrZr8IIZQ2Jll9eivoBZqQb92IJmh6gDIjt7qQF/gc+jlhrV
         R4RiXBh8FvXNgFDZ5AV4n0AERDzeEVFJXHYf8TTrNQZeNcEBZc99BT8ivgzftscrWB+3
         vkV+m+tpUb3/IMeuoa359C286TWfALRS2mB0NJmJH1b1Os13TuQjY//W7dsMoe2zXkGW
         hiUcMlf9AyLhm+t2HXshR0Yw1aPR5H35h8XJzfgUBqZStDAGTyFbXR4DE33dDJUb1T5e
         85DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=9/VqvK4kbIv0VTgQPYgMvTJKYJGg99gLpbhRvjeVa4Q=;
        b=MRD74gB8mETFBCMShB+HtqbjeNrYoyU/1UJsbXqx9XZyF/PBlprZ3zgJnJQIN1/jN4
         GxQKSM2fff9iB1g2nOlpJ+IZ39YFcSB0HYV46SxU+HvJX/VK6XRb5DvGyXA5QZIV/9AW
         EEopfjHsUvk+A6idU4CPzZ6/O9NEPnOFnYi6M2uYrYMDant0CEcpyX8awRJhzLEj2bGL
         NHJ9MJQyp7PgMiroce/T6mDN19EiAtYf4VNBQNJXFcY2IQ1xl+/hay0EBIJAqlvJM7c6
         PR/Z4ncxDkTPnZkatmCtYNRfroZRO72iqBM4WkOyXt1RaYk/a4bv4BMYKLmLDAX0eJ04
         KpFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FCg11yOv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si7234850qkl.152.2020.02.17.00.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 00:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FCg11yOv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3bfD-0005NX-N4
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 03:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j3bex-0005NB-HR
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 03:21:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j3bev-0000S1-Cv
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 03:21:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53074
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j3beu-0000R3-Q8
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 03:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581927700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/VqvK4kbIv0VTgQPYgMvTJKYJGg99gLpbhRvjeVa4Q=;
 b=FCg11yOv/Pt+7/i5q1RQadjWdWdDOP/xZWpHF1E4zpGX24e/wBXfbWZpWVc7f4CMcZl0kC
 H0lxsQWzDEo79kpD8r+Cy5GoCxypb2tYV+JTIOKgZHY4gLls5ayJbOv12vq6nS9QYkusS9
 fpartaxHEEuWxO72tDbB/7ZnPh1+3y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-p0V941mRNciP_3H6GZbJxw-1; Mon, 17 Feb 2020 03:21:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDD0F100550E;
 Mon, 17 Feb 2020 08:21:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A86917DC8;
 Mon, 17 Feb 2020 08:21:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9085216E1A; Mon, 17 Feb 2020 09:21:31 +0100 (CET)
Date: Mon, 17 Feb 2020 09:21:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 0/3] arm: allwinner: Wire up USB ports
Message-ID: <20200217082131.t4fllrufcxipipdp@sirius.home.kraxel.org>
References: <20200215001248.2642-1-linux@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <20200215001248.2642-1-linux@roeck-us.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: p0V941mRNciP_3H6GZbJxw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9QzFa6hAIad5

On Fri, Feb 14, 2020 at 04:12:45PM -0800, Guenter Roeck wrote:
> Instantiate EHCI and OHCI controllers on Allwinner A10.
>=20
> The first patch in the series moves the declaration of EHCISysBusState
> from hcd-ohci.c to hcd-ohci.h. This lets us add the structure to
> AwA10State. Similar, TYPE_SYSBUS_OHCI is moved to be able to use it
> outside its driver.
>=20
> The second patch introduces the ehci-sysbus property "companion-enable".
> This lets us use object_property_set_bool() to enable companion mode.
>=20
> The third patch instantiates EHCI and OHCI ports for Allwinner-A10
> and marks the OHCI ports as companions of the respective EHCI ports.
>=20
> Tested by attaching various high speed and full speed devices, and by
> booting from USB drive.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

(assuming this is will be merged via arm queue)

cheers,
  Gerd

