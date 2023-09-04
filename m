Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1452056ejb;
        Mon, 4 Sep 2023 09:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/avl7acG47RUKaTMEHaVjLye/DvnHqxHshDQsQdIBeLSig4kTTV60VLatUPTXHgG4HSa
X-Received: by 2002:a05:622a:34d:b0:410:99df:688f with SMTP id r13-20020a05622a034d00b0041099df688fmr14327855qtw.12.1693844882834;
        Mon, 04 Sep 2023 09:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844882; cv=none;
        d=google.com; s=arc-20160816;
        b=hiGbPxiNEqYSKXx18DiRWWf3NqT4bvljEyuu4D2H+wpgfYjxH/iuf1MJIimOC+uQbX
         Oky7obf80WnWAFV4bOZ+EFYUf8hiqVclAdC9Zd9H1M4AQ3IgF4TiP1t06y6KIdM4y8wL
         z45IVEsqDHi6HbnwwYGZ+DnygfSFvwdKWaoKcwYqkEB4chhCauNuKRwzyvMdX4ugTmB5
         8LxATCW2BwZeguG5+8VvTaL+RP8Sfjv/QLmJ1Q4JOcgHAq6hDF2JbXhs15EJzMD8wget
         5ozqj2Q3lOsl2YnuVXYESSbNx/i3sdeuqZDHVooTpTxwJ2ZxEPj/IDKSXAz3FqMIY4Nz
         t6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=C9uDrjxVFB72qftBqrwTX3ciD/6S7vvPyadxqNGLc3o=;
        fh=yhmnn3P2yuzlqcnGb78zm/fqNto6/uh/Ek+vjG/+jHA=;
        b=ixgldoV+zYTGUBz3l8qelcLzxAtvpcoDd4yu+dAGhsk5mLquUFKbXU+zoG18UFCD02
         R/nDZtHHGON5p3mFcMNV13f7jg2abY+9ZTJC4YCyFd9EpPqIWkK6Q0RYPDDKXVyOvdUN
         YonI+d1zaTEZ0pQ+ETbsZ/No5HQrVk5xdc9l2wSnYEJuWLxDHyYuH4POBvq324gpVicH
         +zkDGH3/OLyBIfG6incx5xvzzTNhz4eV/0zk0WWN8fbHi9DzhWsKSw8ZHbL4IvUq5r7U
         Vh/iiZ7wVcdcytwrbOH6nKqDbffjKqtiWrk2Jml6dC1Tw27t6PUxQRUxO1XcKYFu0iGt
         w3VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BPyRVNai;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020ac85f94000000b004135d628beasi6404840qta.788.2023.09.04.09.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BPyRVNai;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCQf-000154-JX; Mon, 04 Sep 2023 12:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qdCQe-00014e-G7
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qdCQc-0002CG-5F
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693844873;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9uDrjxVFB72qftBqrwTX3ciD/6S7vvPyadxqNGLc3o=;
 b=BPyRVNai5+vL17oiO4IMmKC37GdXV0PpzQJvhg59qcrBM9RP8csIzaWqj9ccFsvYyOO2aQ
 MlD8Dr6QimIlWKe2sGm/cWWNwl88QPKbZi97q0X2IHykLFuatMC+7FaM81mLlTQGTKoRKs
 VxOcFjOL9y2D6/MpuTQqGvLthWg6gYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-qNZh33n8NFuqEgW03QSqgg-1; Mon, 04 Sep 2023 12:27:47 -0400
X-MC-Unique: qNZh33n8NFuqEgW03QSqgg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20CD5939ECB;
 Mon,  4 Sep 2023 16:27:47 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 619182026D4B;
 Mon,  4 Sep 2023 16:27:46 +0000 (UTC)
Date: Mon, 4 Sep 2023 17:27:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 16/22] crypto/cipher-gnutls.c: Clean up local variable
 shadowing
Message-ID: <ZPYFfwYj6YgSf6Nb@redhat.com>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-17-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230904161235.84651-17-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iBQYqGdRW7SB

On Mon, Sep 04, 2023 at 06:12:28PM +0200, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>   In file included from crypto/cipher.c:140:
>   crypto/cipher-gnutls.c.inc: In function ‘qcrypto_gnutls_cipher_encrypt’:
>   crypto/cipher-gnutls.c.inc:116:17: warning: declaration of ‘err’ shadows a previous local [-Wshadow=compatible-local]
>     116 |             int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
>         |                 ^~~
>   crypto/cipher-gnutls.c.inc:94:9: note: shadowed declaration is here
>      94 |     int err;
>         |         ^~~
>        ---
> 
>   crypto/cipher-gnutls.c.inc: In function ‘qcrypto_gnutls_cipher_decrypt’:
>   crypto/cipher-gnutls.c.inc:177:17: warning: declaration of ‘err’ shadows a previous local [-Wshadow=compatible-local]
>     177 |             int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
>         |                 ^~~
>   crypto/cipher-gnutls.c.inc:154:9: note: shadowed declaration is here
>     154 |     int err;
>         |         ^~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  crypto/cipher-gnutls.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

and if you want to include it in general pull request

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

