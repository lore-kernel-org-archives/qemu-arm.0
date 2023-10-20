Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1339738ejb;
        Fri, 20 Oct 2023 09:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEyo5SnXyt7hhoJTtlqmdHFRm53zxBlks86xMQo21HiVqIWJknBXoSH4lWxwaWBjaSfWL6
X-Received: by 2002:a05:622a:588:b0:41c:d36c:8efd with SMTP id c8-20020a05622a058800b0041cd36c8efdmr2134617qtb.64.1697818071830;
        Fri, 20 Oct 2023 09:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697818071; cv=none;
        d=google.com; s=arc-20160816;
        b=oNHM9fd1bNv2LOxr4FukAvgJinAGSN1l7Ivos3KjpEjjN2qKCODaEYRV23hwrIrP5T
         XUQhH/ypGN2v3Aijv/Ehz9kZnSgwZTvD8KitUBRFPhCrquZevYb0HMBzBkkqWC/FBcUN
         10BZbwhKTE85bzuw3xnVGNOchW/JxYfvTMDygfaCTaRxp3G/lJC14LoNEf1eaBHrVC77
         d7BbxvRUx4zwsNGaiG7cGrvKKXHgtA4iQxUZBnIsvqhxEP7yg4ieJ3RQ2ouzbOyhKdYT
         PP6gWfOJh57yTdLat0Ohcg2wKkOXtuPFPYK3ZjljOaCgzRGNROYfLajKd2RT8mJVdcBS
         sBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Twctpit2m3fQk4UA4cWCieItlIyS4ytx+tY3taBG34s=;
        fh=j+HHhX0dDEzFcFOvp26We8bMQEKVb82WrPF8ZDvX8V0=;
        b=ZU1L1jgisjwDbalB6ZC6uHy8/25Ry4q2i+lOf8sipI5+FWFsVw0Kmy7q39S9cJbHHF
         3I+uP6Ux3qTHQsrVUNQJ4i4bSSUMcfEh1u+Z9c4/ojolQGKkbPnChq5dv8Q/DvJ6C1iY
         97mzxxgMwvxdEPDiLzq3bS2IvjBNhGdnRWKsfAUxKp4arA2Tjsyo8VJ4c7ztVWzqOCje
         kDzVi0nL92Fp4tv+vwh+PaXGXO9hrTcmB/FWxU3iHmuEwgiL8MDhGgUotUpuiean5ZLg
         lp8mzv5SMf/atdibssO5vRRrhwE+FcA+BD0dLQ6ckZrNN2y5+/xqYBiiuzOrquox4XKe
         oXIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gLSDZTa8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a05622a100a00b0041b505bcef5si1532747qte.415.2023.10.20.09.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 09:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gLSDZTa8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qts1k-0006hj-Kq; Fri, 20 Oct 2023 12:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qts1j-0006fJ-36
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 12:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qts1h-0001Xn-8a
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 12:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697818024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Twctpit2m3fQk4UA4cWCieItlIyS4ytx+tY3taBG34s=;
 b=gLSDZTa8dPnbk21E3DYXHtRmuB46WcS6iC7FMPnvSBEBZNUeTaNqSoC1hAB8Ag/uFamNpP
 z+UjahBb3kUZPOFG8Ju8LEw+Pfw91bqnuCgnqvS99jUtKlNF9YIVgGjnPZZLLgbwxJlKjF
 GQJvLgZVToXriDbNZTcssdjLR3xzoKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-U0Jec5oHPL21Qj_JMMFtTQ-1; Fri, 20 Oct 2023 12:06:59 -0400
X-MC-Unique: U0Jec5oHPL21Qj_JMMFtTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 615A0857CE9;
 Fri, 20 Oct 2023 16:06:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C22D7C15BB8;
 Fri, 20 Oct 2023 16:06:57 +0000 (UTC)
Date: Fri, 20 Oct 2023 09:06:55 -0700
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL 00/46] Misc HW/UI patches for 2023-10-19
Message-ID: <20231020160655.GA472068@fedora>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="crETe2pNrNY4NXIX"
Content-Disposition: inline
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kxXr9GWjk10n


--crETe2pNrNY4NXIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--crETe2pNrNY4NXIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmUypZ8ACgkQnKSrs4Gr
c8hHngf/V2Jb31T/m09jS4hRUyUUDodb+iY76QWm99qeXlrXbNG9kyYmJwoxfPPu
5Mtxh+ciqvvXBVlnh2dIi3ALjSfFLyL63qv8vs+DJRIGMXGAz321D9Dp6ShlFtYo
PrW9hyuiEVWV/Juo8oVFHhRNnEp8IhHYV9E2KOHYYnhWvSxmPDMlU07xvkeUrV1+
PhEfCnzKvvTnFqjk/90186/yBv72Mwsa0duHi8h5CyhOzrZeqlt9D/xWzTUNlvTs
gBEOzdmwwe7of6dZsB3mnG6Bhbz2JMm2T63ScaNO+MjNcn6EPYAtBwCAaVnvsF+L
sHUuqm2SZutf+woNB+XdphhMuzj6Mg==
=8QXE
-----END PGP SIGNATURE-----

--crETe2pNrNY4NXIX--

