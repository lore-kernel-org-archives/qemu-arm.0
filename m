Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1717889lfp;
        Fri, 14 Feb 2020 02:08:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyeCOMh/eHDPu+zrozcv764G1hKYGGSbGT5kyAOSK4cMRJNK8rDIQbrf+NX7K7syiDq8uBP
X-Received: by 2002:a0c:f412:: with SMTP id h18mr1469840qvl.124.1581674933320;
        Fri, 14 Feb 2020 02:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581674933; cv=none;
        d=google.com; s=arc-20160816;
        b=T+/ywmOIRp/LOiRsc64WlAzNi3UhjSoq+e+B+aY/qX+1A8jm+PoW30hopTKDqfE7iG
         zP1y4sjRQN229u8E/nV11YAKj+MWdFkNLWI3NPtEXXLRpL+QkUs11mK4ITdJtojBvWvI
         6RAyFI0VM9FmTlKqJbND+4AJGfoG/qJMtBSnm4lai1pqQAJWkomFOr2GT+h9wR1+/v5R
         KPWphoj0qJEq5Ulr8SBmufo9qU1i1Cp2h0snuqtPcRD72f8rIHWq0iOf+H4t+WkqhBu+
         GCF//7lSOOb3LsvCqRhqP24DtWMZ2lSctrLGDBCtGJ6ga+sL4s429w3vGVZUTP1ac+Or
         orUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=6SdkFtvFzOTNURNa3/Is+BMJPlczpxu74PYyOzS8buE=;
        b=y0EyAisW8PgBvVuogIRp28m8tDGGryjDd9RQ+gmCUhC3CqxfeCKOrQKnevhAAZpp+R
         HgqIJbksrEeqdd+6PYyQJt8/Z+UdJKFg8e6PXWIsQLGkLPSK4ti3rsPEvGM3EZI4egaS
         8L6tLR/uhLZxW6IVpkkfmYp5rRdRx6jyub3wxw+FJtSFhFCTblpLrulMG+Y+5SbUI9Bp
         66VQQwZ+/SgOxxWHKcdcxRJ7c8jXExzCe+DmciaSv6ERaz2UsIPjCGQrgUBXOYDxN2OU
         0GoD26Cy2XHMm5ojhaGX6GAOsCorLjx6GubQroq37UtjFn9yU+PfTYv5a4OZq0lyf6Ry
         yxyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XgrVjiY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h78si2626083qke.299.2020.02.14.02.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 02:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XgrVjiY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2Xu0-00049H-PQ
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 05:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59840)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j2Xts-00047d-Qz
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 05:08:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j2Xtq-0005Vv-Jq
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 05:08:44 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37786
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j2Xtq-0005Uu-Fw
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 05:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581674921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6SdkFtvFzOTNURNa3/Is+BMJPlczpxu74PYyOzS8buE=;
 b=XgrVjiY8vijecnOWM0kgOUGdpWCrUT+Dfg9z9oKnWoxf7mPkezdcWtIswqPpAmQfNlPhXJ
 JwtGJHg+MgJtORZ33CVG8YEr7TFSp3BtBUBcFK1xa8s3KwAW3wF8qu0bUjok6KJEX2uISd
 5DzFHpyHzQ3TmEQLX0URzxD6o8MSWeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-ir-l-b-oO72d0wJ54XoyQg-1; Fri, 14 Feb 2020 05:08:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82358800D5B;
 Fri, 14 Feb 2020 10:08:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41FF05C115;
 Fri, 14 Feb 2020 10:08:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7AFA545B4; Fri, 14 Feb 2020 11:08:37 +0100 (CET)
Date: Fri, 14 Feb 2020 11:08:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] arm: allwinner: Wire up USB EHCI
Message-ID: <20200214100837.lv2cok5he7epmu7i@sirius.home.kraxel.org>
References: <20200214062109.24494-1-linux@roeck-us.net>
 <20200214062109.24494-3-linux@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <20200214062109.24494-3-linux@roeck-us.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ir-l-b-oO72d0wJ54XoyQg-1
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vnpg5/shHbCd

> ehci-platform 1c1c000.usb: new USB bus registered, assigned bus number 2
> ehci-platform 1c1c000.usb: irq 31, io mem 0x01c1c000
> ehci-platform 1c1c000.usb: USB 2.0 started, EHCI 1.00

> +        for (i =3D 0; i < ARRAY_SIZE(s->ehci); i++) {
> +            object_property_set_bool(OBJECT(&s->ehci[i]), true, "realize=
d",
> +                                     &err);

I suspect the ohci controllers are ehci companions, i.e. they handle a
single usb bus, with ehci handling usb2 and ohci handling usb1 devices?

If so then you should initialize ehci first, explicitly assign bus
names and set the masterbus property for the ohci controllers.

See also docs/usb2.txt

cheers,
  Gerd

