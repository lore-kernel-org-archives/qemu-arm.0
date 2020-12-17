Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2484210lfq;
        Fri, 18 Dec 2020 09:14:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHtlQsg+rlG52s03/F7fXwytPj+FGBKcBpUAHmbwWAbFXm4tfIROUedixXau2AIbNj+Qn2
X-Received: by 2002:a25:7ac3:: with SMTP id v186mr7539616ybc.191.1608311647218;
        Fri, 18 Dec 2020 09:14:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608311647; cv=none;
        d=google.com; s=arc-20160816;
        b=j9cwnrPvDggY6XEjbD8XKUmEWHTTN6YScSWiVfeEtDWOk55djjYrO6an/h0f7mcNCp
         DwkHK1S8OQyoI8/Lu2Be+2p+RsrlJ7CWyV1p6tlDHHjp2FwqVenPwFk1zhURz6Y7tvch
         WBPBhODw9F/SEj8EXSRXkZbeARs1AmgOUrxPEdUK3uRnof+xYpYIleBrJdeYE14byYlW
         RTn88LznbssBZCFYbYB7BwZgxceCAhF+N9dT3H0nRGRkAe9ofz06RLHoWS8z5yYE9p+x
         ivo+XJlwGCPhPIvJmKvFBlIsVCF4GwyW0ehpxiK+lHqAJkw7+44X/7Ye/s7Sk7OmDOuq
         cMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=BPVhun/R5Pjm/1P81mrRRfh1iV7PU5izmcRUhojmqUg=;
        b=rU/Q5V8ud5z0D3cJFIVQvBQpQV6fzZelHNc/1c7MmLUl55mfdQPH4XA/xwF0P8zVS6
         p1ZDxvt6SQ6jOM8FqrVFByKh4oDDyyMQeFo8pWFIMye7I22/o9nHqRs7RKlYOEFWKczS
         mXvtGAP5UH4KR7mp27woO58ieVw2d5nY7U5QrZfc5XeKFQglgJlchxZMfnySIVq6muZc
         J6vRcVnhJB6tp75YUM3eaC4rnEmYCK1O7pThWjCp071Z7ln5Wvjpf/8x+3GozTAobD+I
         UkN48sxOGKVIGYENHyaqiHWG4q/fwflGxSVfYMq2inmm9amsMiIcOfX/aitt/exxnEmO
         TFew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ePbvw/Vn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si8536546ybn.336.2020.12.18.09.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 09:14:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ePbvw/Vn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqJKQ-0006h7-8z
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 12:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kqJJK-0006XW-3p
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kqJJI-0008Fq-OW
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608311575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BPVhun/R5Pjm/1P81mrRRfh1iV7PU5izmcRUhojmqUg=;
 b=ePbvw/VnfHJMlG8dJG4x8oNyNM9P0SAgtzsaPaMZS+PRqF99aPDHmYqx8l2vJPHsb6jygr
 JUq8W9VmHFFsaZqQsaIkVoIct49Z94i7GPO5UhrQwA0r0FqTnnTPFFcpTMO/vF2DsvDUHB
 tLfBrK0He0Tu4VL8IZ9UtImsIA4AFCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-gVQNQRmINOGx-Fh7DnyYmw-1; Fri, 18 Dec 2020 12:12:52 -0500
X-MC-Unique: gVQNQRmINOGx-Fh7DnyYmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6B9809DCD;
 Fri, 18 Dec 2020 17:12:51 +0000 (UTC)
Received: from localhost (ovpn-112-107.ams2.redhat.com [10.36.112.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D0FD648A8;
 Fri, 18 Dec 2020 17:12:49 +0000 (UTC)
Date: Thu, 17 Dec 2020 10:09:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhukeqian <zhukeqian1@huawei.com>
Subject: Re: Ping: [PATCH v2 0/2] bugfix: Decrease dirty bitmap blocks after
 we remove ramblock
Message-ID: <20201217100948.GF4338@stefanha-x1.localdomain>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
 <34d6fc79-aafb-54cc-6a07-4f4c2c0e0db8@huawei.com>
MIME-Version: 1.0
In-Reply-To: <34d6fc79-aafb-54cc-6a07-4f4c2c0e0db8@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
 kuhn.chenqun@huawei.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hvUKTC5jWVP+

--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 10:02:05PM +0800, zhukeqian wrote:
> Hi folks, kindly ping ...
>=20
> This bugfix can save several MBs memory, waiting for review, thanks.

Paolo: Please take a look when you get a chance.

I left a comment because Patch 1 doesn't seem to take RCU into account.

Stefan

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/bLmwACgkQnKSrs4Gr
c8j6hQf/eeMf9jaNvYJ49d6JoWBgMsnbnbMFYo7Vb+cPC0dqOGmQdKMI9S2d0Uht
44AGRBF0JaN6RGDtPc1RmOSUAZXLbjmEmQ+R3PNHwLsvbmHtEkmYnuRCSfDr/AT/
bEdhervbOiFwmdpB3wFt9XS0KFTMj8t2GAE16GR8K7f7rThnI6bYxZWeUAkpcXlT
Q/AAjfyqyKGO3EZYoyPGVEVoD00jOKdi2xcxgsuDwWkLp7kGCd7HLB6rApIOgMdv
tYj+ETB9CpYiDfPi6sq3N+iLG8jVgTT4tVFcY1gL4zmyK6FKIHqbvaznbehA5vY4
d0JRf3oj7VSG03rvDHl4+VDXTSbTVA==
=LXyt
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--

