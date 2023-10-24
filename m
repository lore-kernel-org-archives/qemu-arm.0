Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1746681ejb;
        Mon, 23 Oct 2023 18:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb65s9JHo700NELYzq1BN5/GnKodBAwclp6kaUwgariZKHppgkK8Zwc6hz/4G2gxem0PSc
X-Received: by 2002:a05:620a:1434:b0:778:916b:c244 with SMTP id k20-20020a05620a143400b00778916bc244mr11158591qkj.76.1698110989200;
        Mon, 23 Oct 2023 18:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698110989; cv=none;
        d=google.com; s=arc-20160816;
        b=I6ebzxmxJFRAI/SxGKxlVvItc62amiVLTIl7//RZB3UrZJ0UZm3cOm5rDXVtESYj5J
         5NFsCqQcn3DkOea56cqIiiZeATIJDqKrDA2ksgGb5fuJq9kH8104bFl5NskC09YLMUvu
         a74uIDzsPRsdm4YZiZHt6o1nGp6QFCOF2oyr23J/Js0ZxdW4H25rwApKp7svzzPe16Fw
         oAvjJuhIfnEGia9jgHEQ/WbtFXhDuICwbowgQfDHwRde15eXVZeZ/49YC3xHek/Wldaj
         dVM+VAKhgfsRpK86EN6UwDRCi97LejHzhukfY3Unu61AK64KMbH3WP6/4929d82S8KQo
         fvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=D8iL3tyFSc+qRvYdSafLlNXBRhoP/RIR/qy0JaInJUY=;
        fh=LP3Hre7FgviHYRbAilnaffEP07lMnI51h3zmItv90Gc=;
        b=tlRSoquTTrU8llea33G8cgRDQp9c4bZ56QqaPsl7ohCnYnv8h53pb5sAMxu/r9dT/X
         UHB8uw8dGVYjR+i8aCd9QfnE6SK89lMLUrlViDbbjnnRISJ3/ybLRRwT4f10zffHALNm
         0otP5Em3kJYJFSMOGAwvZ4rKQ1UEn+van4r4Bx5aYiF4mqpIlrLk4V37rh+P1MpA9Se+
         rJ+cZt6fDXtyklFaRXPePz7gFnSPSAgiZLmg1emVDmAm7IsHXHpECThZGKsM0jMvHQAj
         tQqA5iKDXfRAk9iKySFft+p1cl4+FURWDvYzQmpdvCsJHdsRwtZqNnL1aY2VLc9DerBY
         yLSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A7XrxePe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk12-20020a05620a1a0c00b0077419b27782si6799111qkb.339.2023.10.23.18.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 18:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A7XrxePe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qv6EE-0002wK-PY; Mon, 23 Oct 2023 21:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qv6EC-0002tO-RK
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 21:29:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qv6EB-0006m4-Er
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 21:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698110942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8iL3tyFSc+qRvYdSafLlNXBRhoP/RIR/qy0JaInJUY=;
 b=A7XrxePeVKbYvkxtjKU39H6Ke4GUgxvqQTi2kxmex8anNGQ77MZqIFrzj1oJfXVCOLeVjC
 Ah3H75PuYwtGYi+aWAJ2PLJbwxRRm+Ynyg1anQ/s+n62HKb9DhfVHHZo2442XwkcyyJDcn
 kU+QZS2LHqjSfGADd63N+fVoEaZ3vJ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-En7_qKuiNTKD7cF2KQEXXg-1; Mon, 23 Oct 2023 21:28:57 -0400
X-MC-Unique: En7_qKuiNTKD7cF2KQEXXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D18E8185A795;
 Tue, 24 Oct 2023 01:28:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19CF11C060B6;
 Tue, 24 Oct 2023 01:28:55 +0000 (UTC)
Date: Tue, 24 Oct 2023 09:15:12 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL v3 00/46] Misc HW/UI patches for 2023-10-19
Message-ID: <20231024011512.GA499194@fedora>
References: <20231020125509.49440-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CEjV+3AxN1yEQh2s"
Content-Disposition: inline
In-Reply-To: <20231020125509.49440-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: LWtqdjIFi7ZZ


--CEjV+3AxN1yEQh2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--CEjV+3AxN1yEQh2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmU3GqAACgkQnKSrs4Gr
c8jDxQf/UUCwj+Iha/MYEj67Ms/3cJWm9xsbs0fe0K03sF9bfKe6Nvj/gbEu1r86
l0FqbXxBnibOFc0tgP15+I/R2TYuVVLrh6r+pNF8XvG1MpdmbcGaRVBFDPfAiT+L
VS1ECe9xuSlrsCvH3Ymx/4FVCb21s1xQll0dfKqQmT4ng6UGXnzPZKKRJALfRWEb
G289jgFNjNQA4ZS7svYHPfqPbbtrkTI2+jo+qfCpfjf5EcU0Y5XHqDrMKFKKg9Ck
msm3l8STJ36+UCn2a4NjkFUc+pE7Bh73hg6K7QWcDYxr/mEiOWTYeGdiP3AkylPk
dH3nqA1YDP4vQzrukkb2hhibJFTheg==
=DMpf
-----END PGP SIGNATURE-----

--CEjV+3AxN1yEQh2s--

