Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2095114ejb;
        Tue, 5 Sep 2023 08:44:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwaQljWpVEhP7AHgtvjoY2byiheSWUcLrIgMRVHLIe3agN5al0wRguwDHLNwaMI93JanbM
X-Received: by 2002:a05:620a:4250:b0:76c:c055:aa32 with SMTP id w16-20020a05620a425000b0076cc055aa32mr13459054qko.24.1693928641088;
        Tue, 05 Sep 2023 08:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693928641; cv=none;
        d=google.com; s=arc-20160816;
        b=YFGWDb2isLoFAmRU6twN8N/fhfpe9/+GcRRs1KSaUvuuAH0AoxWBNb697eQnKQDqR4
         cKCMA9hFh4dbGK94CtAJIQFvTzeoFB8IE3gBczYe2KPPpUO+5k9jlGiFBdHaW/sREnNg
         zfcy0DJPNrt7p270zKA5U5vOaovRm7aUhlZDvzAkeDqfu7/+P7MH4WTpwkAieLXkzaeP
         /FOn/Q+E4mqk+emoIXOYq/RcN0Y3+6t851J1SUdne39OdZZyZNWyw5kHVEjIPz0Yp2m2
         Yv5DkMNrpgqc7QxCU7rbBe9Xdey+vHM2WqqlzBPJa6t07LmkCO4zNLJmrWIBfJjb2rom
         LSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=6s8//+/Gdm7BdyAUWTQYfQUByLn0FTr02vmOUEy9LRU=;
        fh=bDHNoqvQ1dwP2Q4LtCamQreEQKIETTXiWCup8JmJTH0=;
        b=MqgQ8Jkuxi51/gF32Kn0Q6eq3EH3hmiJurEOqnCEN0Dcw479Z/sbYYbkTT0HbBy8GV
         V68FzCOV/gxl29Q0S99Vd1Lt9lfhQi+edxbtIy+jCdJWZ6420RltxnqZpqNFli/+CO24
         v/VRcvSaLSU3o5ZTgAfy6fV6d5CubhKVZjZywvqYBsGIhK55i571G2z1U82yMRldtZOl
         VYtc67GMfPM2vTPxCaaY9oLCVK3qVPHDxLhPk4EvDn6dsfgVCRib86YOVYItGNeVrVqt
         vEmTOw8Pa3xfB522l5/idzASzI0+YIAyNFZCYmBQ8KrO+6X2P7M+FBPf7xHU5goYVJCG
         tupg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f7Fyotg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id py14-20020a05620a878e00b00767da14f0cesi7861901qkn.13.2023.09.05.08.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 08:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f7Fyotg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdYDT-0003CK-Li; Tue, 05 Sep 2023 11:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qdYDS-0003Ag-70
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 11:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qdYDO-0006RT-UY
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 11:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693928622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6s8//+/Gdm7BdyAUWTQYfQUByLn0FTr02vmOUEy9LRU=;
 b=f7Fyotg07xEncUGyKWTdVe24TkclugaYElVZNeb/7Ng9xXewHYYf3t96lICMSgyMQhALSp
 uKeZrcdGceAfrr9sHJRu5RUaS25wz3M8+Irw+beNh7VXBf+a3emjkKu+eJEBLjkKgZOq1B
 IoDzQ78O9ECEh6MgL4lYwK+O+Dc/GGk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-4JZkDLrXNrudVAr9BG_Avw-1; Tue, 05 Sep 2023 11:43:36 -0400
X-MC-Unique: 4JZkDLrXNrudVAr9BG_Avw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F09C028237D0;
 Tue,  5 Sep 2023 15:43:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8492D1460FE5;
 Tue,  5 Sep 2023 15:43:34 +0000 (UTC)
Date: Tue, 5 Sep 2023 11:08:40 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL v2 00/40] Misc patches for 2023-08-31
Message-ID: <20230905150840.GA286488@fedora>
References: <20230831135642.75413-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WQgvziynjXNvFRKq"
Content-Disposition: inline
In-Reply-To: <20230831135642.75413-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x90anhs9aBFx


--WQgvziynjXNvFRKq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--WQgvziynjXNvFRKq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmT3RHcACgkQnKSrs4Gr
c8gkvAf7BcrO9DMOmNJBV7xki1hIpzff5MHTdau6Rlam7B7E9EiYbzHaJq5V5TXL
NtO8U1Uh574q+JynlDyHhqYjjEao+0goCOXwUfTQeRlnbA1fD94MwLKLyfMwIR+O
WMKs7iGx8so/rhref/23kdtInAOAb1R3GMv+ZHpOCNyEErkhwUHaX6CmhSdpnrYC
DGMx6U34l10aI/hzYwRU9vwQM2PngmFPoHRR4MxqWZI7l/74c8DV83HN5tCrF31d
kPyoYRbyv6k4XbAtat+H9RDWoACQfAeBiPsLc25TAoNbI6uOjspOLa0MlvEogbAr
OAzpV4Loi7mDs+rSAATz1JJnTM708g==
=Y4m6
-----END PGP SIGNATURE-----

--WQgvziynjXNvFRKq--

