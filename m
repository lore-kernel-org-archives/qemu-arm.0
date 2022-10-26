Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp782760ejn;
        Wed, 26 Oct 2022 12:03:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5/maP0CUZU9V9ZlBZjxWAJq0Lkmy9kfKXw9fz5V8fAz1FIrcXw0x4UTz0ZtSAORP8UtbYN
X-Received: by 2002:ad4:5c64:0:b0:4bb:5aed:86d8 with SMTP id i4-20020ad45c64000000b004bb5aed86d8mr22126449qvh.105.1666811028516;
        Wed, 26 Oct 2022 12:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666811028; cv=none;
        d=google.com; s=arc-20160816;
        b=zgFNVS3IGkWLasURoH5opAyOGacpQIH8xfRqLK64FlpB2uK8AbD7iVytA85ovExumQ
         Hlz3mo6b6nUpW6LLW7qHFboof4lo71jgECPL/hP/WaA7p8bgP4hjhCB5BCoSrExWYiY2
         oVcLds3X06Hy815Ygds9UCLwDlqpUHYwd4TXE517MXZYizSfrVRihnyNWt0xgNiPIit2
         oCl4tgiVn3XY3ZnGy2d4NPt15QJ4BeX3qX63ANfOHUgBa87uEOjuQRfSyikzGuRNIM5J
         WHGttqd1FZe0BkxXcibqV3zxwvNezJ+sdHL48UZR9RSJGev3EyDiNTfx0B/F1bpM5+Ky
         9yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=A+Jia8aXAt7xo/gcEWdpLbcZEyf6YjlyTihSxHRirXI=;
        b=q863tkq8lgUcYfICmIwQ38Y/mYzA2gRxYzJ9pVE/b5EKm7m0CDJZMAwZ+pir1cJrue
         mquc37A23/UVCjwX4aNJ0UYOuh76jCs5Z1JRGq3vUuoO8omyLkm3pX0A6Bjp+PyuAyGF
         c82MWwTf2UW7qSbPr+G5ZUMbJ56+Daflnwn7ZJ2m20P3GU2Oir1ovjlJbMBUklBIhfjq
         sk3v6jTgpoCj9w4pvm2qTxYBMQeXvLU8z27v1sHnIBJY60biIKqFhzx+Xo6RaqyZ1Dxw
         /QL/O9Ur5Y5Wi4B1M0tGYF2aAHtbZe76uCzjP7qqcJ9FNiIhjX8EvPVZgT4+9srz/+ry
         N/Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LiH8HBd5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u184-20020ae9d8c1000000b006ce63901d1dsi1259351qkf.104.2022.10.26.12.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 12:03:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LiH8HBd5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onlcd-0005PH-2d; Wed, 26 Oct 2022 14:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcb-00057U-65
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 14:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcZ-0006zR-Ki
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 14:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A+Jia8aXAt7xo/gcEWdpLbcZEyf6YjlyTihSxHRirXI=;
 b=LiH8HBd5gkfEaC27BfAhZlVJ3V+ZHjUBXhlr6QTLy6ZChqcLaIbs7iPP4bYgUm+Dd8+DYT
 g3myJJWxkuQ+/fBEkHfB+6tVqPJV/gHfn7eJaHdRWprMYPwo0rpHBMD8YG9deLlrKlG/YS
 HNu+16UVy2lef8mSAVKK2Ag/fYvAxrc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-jCb2AlxoOoqJmlyNjxJixA-1; Wed, 26 Oct 2022 14:59:16 -0400
X-MC-Unique: jCb2AlxoOoqJmlyNjxJixA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E94522932488;
 Wed, 26 Oct 2022 18:59:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46B5E40C2140;
 Wed, 26 Oct 2022 18:59:15 +0000 (UTC)
Date: Wed, 26 Oct 2022 14:54:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PULL 00/16] aspeed queue
Message-ID: <Y1mCYGRrb+XKwupK@fedora>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KAFDhxCVB4aekimU"
Content-Disposition: inline
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Te5JCkRLE/LB


--KAFDhxCVB4aekimU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--KAFDhxCVB4aekimU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNZgmAACgkQnKSrs4Gr
c8gUVQf/VCqO7IgWoJ/O8zAj/aLBLTkmPLm1IM0vp1jed5dWraMa2IbrfB9e7u+y
ZzQw3p5QQj5YRbGmREz+jspWAbM+oc1WFxn4q7Svuc/c9crNeYr2EY987NB2b435
+HDO9oSzmWURcHmeCnCkQ/XFmps+ObNi5l9C9Rf1Ogw8R2ADNpNLGfZYhk9IJBMR
uY5UykPxJ1F5N+ceQAPNYaotH27glF+gYz9/9K7zZriwAov/3olE/W9SAEaN6vuZ
KBPdSKEbx8Dvm+NvXdxYRA4D3muPn3whCGC9vEiEhaHGb3QL7IYWNtVdNrCHoi4U
tCcrz5JokSbVwQabz3PZyYHhrjztUA==
=SJBT
-----END PGP SIGNATURE-----

--KAFDhxCVB4aekimU--

