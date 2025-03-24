Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2173937njc;
        Mon, 24 Mar 2025 12:17:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKoW9NRddnJBmUTXfnIZu0UNvWqBTui4s/fL+nr5zlC13n08+barwUOUIfyhisB6fyUlRT251CTS8yXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEoMoMV+j+COuEjKpzSKQPuKdqtmQbJj+KglfS5r5tsg1P/wjLgABSXmCDrJO5w6wPvCkjO
X-Received: by 2002:a05:6122:321e:b0:520:4996:7d2a with SMTP id 71dfb90a1353d-525a856e64amr8805734e0c.10.1742843872914;
        Mon, 24 Mar 2025 12:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742843872; cv=none;
        d=google.com; s=arc-20240605;
        b=eE0u0khZux9aUi/c/rSwBRPLeDStq+MWu8xMah1EhO9VJYlfKiJD7mVALRV1WQjDyN
         KrEPOY0W1QeWYO4bl9ZRkUPzcbTgpxooMY+MiTkteuAU6ZWci2wMNJVPoRY4ag3J1lEc
         dM2mf3QWeSgezwFb82y7ARv4a0VAsUOPbGrl67lT289UF5D0SOoGMsaYk5Vyssab8wBp
         669d6sV0veBHI3rF0ljb7HA1qqd8N71/zOJmcjvdWcP+DV0NcAXPfnjr26VZrvLW/hmR
         aMrHE65ezDUkLXwB+HFULqd7hY3QPdz07LrhQ8AzBr4HxXDqAsbfBwdTq4ljWNICfew9
         sQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=oLzZbC8k88ywq5bBxcH/9o+u30/By5ATbxfGMW6iYwI=;
        fh=9T4YSpaK/rxjmZDsTWbgbb2dmlUmE7wRLhZE68qq/Wk=;
        b=GWNB3UloMVRGgSNvgdCt+P7n/d+eUj2+tu+74P4heUZE+0IF6wxTBkvzqjA2lkpbuh
         I5k2Z7MgYfCzgpmsaFO2PzykcTKVF3B5cw+My5t9AQTHLAr1e57d9hCHbLJHA9Zy+wlD
         xd1Dugkdvc3sRG7p2kEhicwvZN6OVPNtVDn9WSDz3dsT8SAuFhdUNifyrNtV8cF2aMbD
         guw0+pOEXUZdMLdzM9BW9ccadfj83qnOQXbfKFMeMoONDKb/MDHr4joQt+h8zRJ7ntlT
         dEb8DlZkFieNAfUheEO+rAV45jAk8LpSqEZGJlQwrWcQuiHDROMO0d1sMyAhAlD6oakK
         TIQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MBTowUl+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-525a7640c18si1786593e0c.111.2025.03.24.12.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 12:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MBTowUl+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twnIu-0001Uy-JP; Mon, 24 Mar 2025 15:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1twnIs-0001S4-N2
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 15:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1twnIp-0003zZ-JP
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 15:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742843857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oLzZbC8k88ywq5bBxcH/9o+u30/By5ATbxfGMW6iYwI=;
 b=MBTowUl+mFlwTP2q8Dz00S0jm2R+ZvOlsIh08UTJuup2sbJsjRO7izgeYQaLtBE6Zc+l5P
 uBdyBTZ4437HOtevh4QJIrhuFhFy55H1DSDyagx29A2jBiWpwPFBNuMNeP0SgqIFVBe6mS
 EE5M+sPUSBmvkafnVDYYySaNXWBO/UI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-LBjhT8D_MtqUbY9tQWPndQ-1; Mon,
 24 Mar 2025 15:17:33 -0400
X-MC-Unique: LBjhT8D_MtqUbY9tQWPndQ-1
X-Mimecast-MFC-AGG-ID: LBjhT8D_MtqUbY9tQWPndQ_1742843853
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E91A9196D2CF; Mon, 24 Mar 2025 19:17:31 +0000 (UTC)
Received: from localhost (unknown [10.2.16.139])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 81C101955DCE; Mon, 24 Mar 2025 19:17:30 +0000 (UTC)
Date: Mon, 24 Mar 2025 15:17:29 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PULL 0/3] aspeed queue
Message-ID: <20250324191729.GA76777@fedora>
References: <20250323174541.406860-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SQWSzCYHumHknuLA"
Content-Disposition: inline
In-Reply-To: <20250323174541.406860-1-clg@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: RbU1hFahwRkd


--SQWSzCYHumHknuLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/10.0 for any user-visible changes.

--SQWSzCYHumHknuLA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmfhr8gACgkQnKSrs4Gr
c8jxEAgAxc/P42e/xq0w+oYTxS3kIoVqFOyKqip20qMemoEU10BYC+/54cXokYO3
4VaHSp4348oK5bnx6Q4KXBReJeA5HQXK3kYscIulcXGdbTgT26IkKctRX8dlFLRF
wB68+90/d3CsUktgygihYebxIPO1s2GmnU9Jpjkdi+sdsCQ4SjHfa1tEGygAZ/fi
VViL5LSSGDqaSHECjvQxfZbD+yeEUeLFeYXOLicjLuKXIH0kudr/wkq0dgiLEkcg
6boozb9j6dwSuCycngxSOG0tU34exlst4IN8GTW1xdtpXWnz2cGhF5IBhSdHwbSI
/zwphlw+RSfP6f6WjHlJL+hU51Qv9g==
=p2eC
-----END PGP SIGNATURE-----

--SQWSzCYHumHknuLA--

