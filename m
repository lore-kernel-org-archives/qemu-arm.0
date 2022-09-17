Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp351427ejy;
        Sat, 17 Sep 2022 13:22:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM64Laxb2O3H14POHEbQ/Sh3hHgIZpv3O0TdiYThV0TN2qc46p0kCH1OJaQGrAO7qZE/FCBr
X-Received: by 2002:ac8:5741:0:b0:35b:b52b:ca9e with SMTP id 1-20020ac85741000000b0035bb52bca9emr9457777qtx.653.1663446133136;
        Sat, 17 Sep 2022 13:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663446133; cv=none;
        d=google.com; s=arc-20160816;
        b=TUVD5Gm6kq1XcK7nZghqz0h68+hv5D2QRMy7pYo8GtHZer8apffa1D8zCvae7H1Zlb
         DqSk8Vo9qohVqoeMKdwSINicQUuN/BRmsZqdb/cTvCgisUHw+owOT5kSnIvA5R/3kVFi
         qmSfxStgJCVQwo9vXiCS3UUbDAAnXFQ4WHHuKhcISqctTLjGaflD8paBHxewusX4apWm
         hVnome0TU/5bihUQ6voX5NagP2INSS+7J1DeckRMhsf2UmKzopEnJSCFj+pJBEYXqJNk
         +bLNKauj7Ov7OuI//VTTOfqB83qkeGR8oCLqXqE6XstAwGaSCA/ouc6JhgbikzNmlDvU
         djAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7PRp2xJ+T3G9MX/0GrL+NtHS3aU+JKTF+UJriMK2LeI=;
        b=ZW5/qh57zJgYdxY+ulWGImMcETP1BEqQtzxo3H6sTV/O9SeytCCbOEUmUWvlOlLa2Z
         HTubgEroC19dq1dPCmaeqd4SlTLWQKsgHrJGC4Yf2IdxN39M/qUVzE1kLVEP8FazNqZv
         cIt/efo3ePU2BMXjM28Cf4EpjMoo370C0SVa7H2Akv4f8SG6kmwl5Q2dWge21Hbaa+61
         deGVforxyytlWs7U1EIB+mPYCykKJjGGRzPDPeiYFeMoiYHHNTTV2sd9mK0eT4Wery94
         HnsBfCgTYDuijVAhCHPYQcz27xX8HTyXxQ4mOdc/bQRcxwER5A2YzWeyneWwwZRUpQk3
         1GXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D2ar3BOX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu13-20020ad45ccd000000b004acba4117f9si7522451qvb.311.2022.09.17.13.22.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Sep 2022 13:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D2ar3BOX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oZeKK-0005xu-Lv
	for alex.bennee@linaro.org; Sat, 17 Sep 2022 16:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeGA-0008Q3-HE
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeG8-0001C3-O3
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663445871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PRp2xJ+T3G9MX/0GrL+NtHS3aU+JKTF+UJriMK2LeI=;
 b=D2ar3BOXWlu12KDK6CSC0UiLULuI8TPS6Rc1RyO14lVI6i3PeSt5mBhM7Mil1KdxFP2ov/
 3hoYh88pntzV13KP1gnAuqT1a1qZ87B+KkFQ0TegiBPoUQuErQQOYQaGsCqG9sKqlOAqzf
 zxQfNb5hO/ExJ/soC580qpUhPizHZ1Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-9TR7lCiINHqm4OUd7PzC5g-1; Sat, 17 Sep 2022 16:17:48 -0400
X-MC-Unique: 9TR7lCiINHqm4OUd7PzC5g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B8C329AA389;
 Sat, 17 Sep 2022 20:17:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19B7749BB60;
 Sat, 17 Sep 2022 20:17:46 +0000 (UTC)
Date: Sat, 17 Sep 2022 16:13:46 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PULL 00/20] target-arm.next patch queue
Message-ID: <YyYqejml9wzwnZQx@fedora>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ee5VskXIwDUUo2iY"
Content-Disposition: inline
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rWzuMlxQ3Q/G


--ee5VskXIwDUUo2iY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--ee5VskXIwDUUo2iY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMmKnkACgkQnKSrs4Gr
c8gtswf+NK7nxycQWT9ArqMFWNl6ogqad3IwhiXMlmeSz3vL6sxdB6l5yUBRjANQ
+CXD5cMZBYQj++3E8SJXB9/MjVt5wjrJ8iaZ25sfnSKIuL7SByjKTSDKx/zKEbx5
1Rz1WMmWNTVMzBVlQ3433qYeYZEKdIrCoquE5Vcc+Q1QQ7HMOvms6mVZiSj+e83X
TAbnLN+zYSdKSJivu0yMizL3qKkY7uJx6qRbOAt2bTtBZbbLTuTHjN0YG2H47Z9e
nrby4M87Ytdk3pFD5GORXOzTRYZEzTYJYNWrbbmdzlEl182D/Bmh+ahUGQq/1LUA
wtz+GFfeeteiKgJQsoy7voOH6lVn+Q==
=f2ki
-----END PGP SIGNATURE-----

--ee5VskXIwDUUo2iY--

