Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp1025289ejv;
        Wed, 8 Nov 2023 06:23:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETZGRbPkvLldGH3iqVLmadaoADUJvsKFhlhvOHXqca3I03y5aWygokJRaLd3JDRp5fHm88
X-Received: by 2002:a81:4a44:0:b0:5ae:732b:ec21 with SMTP id x65-20020a814a44000000b005ae732bec21mr1914890ywa.34.1699453400160;
        Wed, 08 Nov 2023 06:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699453400; cv=none;
        d=google.com; s=arc-20160816;
        b=fOqE34P89eDiggM6ebwY92z2LIapS1YRD4QLz5/7c2J99Qc0SsRVAgVehczbjayy2+
         RC2i2WkfK7SP1v+XmIJtqbbJN7wJ575xqTmapN2SBErZsl3ppQTmeksqpngaTv6YMtmd
         Q6Ro6AtOhmsvjvtQVm3hvnLgjCvmAY4HttbZRViazkLBKyKRirRYjg8Z60FTRGk+eFea
         Qlh+4uY8rENn+cWqgC7i67QWlWB6GeA8MP+OBlUnn0FKVUWzOmFrTHOF5pkynLV1ovCa
         uk6X1kAKCismMXspn/2wY1F2+HXvoJxNvVAoUdu0cyp7rAvRiTAj5rBdMIEdQqDpJttV
         Uy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9zqZN1TmCYfXbnstueXxaQOLMGx7hGZPWIhTXGDeicc=;
        fh=VQP9QoSLQBJKj6GsHB5Tl340Oegk4lJtXZs5xCQVw/o=;
        b=E7onV816cu99JJEdv6xOAKW+qOlfsA02IchpgLaJem/YVwefgEtlFWU2nI/57iU/nW
         3rJUfhVwKyQdiCUXVRjysUNXNDAhoffsrqXc0fdrJpzvGOagI0DV3KE1pUlatuDiD7QS
         DHBPhN+YpS7CcMLiE+1ataOGliXVWuelydAnJzKFzm8L/B1kkZ4jOCoIEAHZ02WxO45A
         Ka4PblJphPs9Bz7MhHGxDRECQK3Dmykz6ClMveHhJ220M9KDHe22G57XAKSwtTuQVbRp
         2QJdzlpYpKd0XhdI9UKKPx1gCNL5NdXz3Dfpr2L/P2RtbOaS0WxB44crovg8NuhKPIJs
         cmjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fl4DPCHQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cu6-20020a05621417c600b0066d03a72f6fsi1351417qvb.613.2023.11.08.06.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Nov 2023 06:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fl4DPCHQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r0jS9-0002dE-Mu; Wed, 08 Nov 2023 09:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r0jS7-0002ac-9g
 for qemu-devel@nongnu.org; Wed, 08 Nov 2023 09:22:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r0jRy-0003hY-SO
 for qemu-devel@nongnu.org; Wed, 08 Nov 2023 09:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699453349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9zqZN1TmCYfXbnstueXxaQOLMGx7hGZPWIhTXGDeicc=;
 b=fl4DPCHQ+NRw2ASnB6fdwFpJqHewT4do1+jxKsGck7PODqubG29TUrfnm0OkGFHjqjw+uT
 WZraZsHTqsNYxNQHZLfnh+xE8ntuBfX0XTpwW+2NSuAMF3/dPfv97Ee7bg/BM66l0xqs+O
 KVddN/amP9D2k3XnpmVF51MdVCcimyA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-520-uqhO5C0XPlyYbsXHZYvp6w-1; Wed,
 08 Nov 2023 09:22:27 -0500
X-MC-Unique: uqhO5C0XPlyYbsXHZYvp6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC1EF1C0F2E0;
 Wed,  8 Nov 2023 14:22:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27474492BFA;
 Wed,  8 Nov 2023 14:22:25 +0000 (UTC)
Date: Wed, 8 Nov 2023 22:19:33 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL 00/75] Misc HW/UI patches for 2023-11-07
Message-ID: <20231108141933.GA1062171@fedora>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DH9pVl2yFZidxGJ/"
Content-Disposition: inline
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2/61nGykW9MS


--DH9pVl2yFZidxGJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--DH9pVl2yFZidxGJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVLmPUACgkQnKSrs4Gr
c8gO9wf9G16dTrkIDu9mGXtMOvPn1A8QNnmngZ5fnEa0ATHy3HG+b6PRDq2aCN4K
9ips04RaPDNDCFccLXlbo6IDJ3MzQIa6d9IGMhMCy0Nqj257Vo5gARuZFxK/ObUZ
1YF/o9pnkSB/zuyHZPLmX1BWfLJNtFwZSyX15YdwvrjuxxTTmzLelyItoOhEzQER
E1tMVeQxM7uX6XEnwv6a3Hlf9XMRxiWbxRY4u+GoE9zYSjJ4W3SsX5G5TFfJXyRI
lUoYjJDXmv/Rs9neELUXLjZDQ51/9qNKf5p2X3m+hNM0JyKHeXG8aKmtMz3en+pw
iLbnu88ioIpjsXZXzmzHkFLYMdEbYg==
=dOGQ
-----END PGP SIGNATURE-----

--DH9pVl2yFZidxGJ/--

