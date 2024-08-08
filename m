Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp589092njc;
        Thu, 8 Aug 2024 10:05:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWv6eTYY2luVqAt6amIdUkcewNYVt51PEymBpJjo447ADss+SZ+tqQ6U/iYQdcgW9gitUMMtAQhUAfkC0XXtRg0D6VURXHM
X-Google-Smtp-Source: AGHT+IHk31lRNPrrDqG5dgmZfA9GfKhMx0aK+/cc7Ab/DIbMwYZzxqOaMKY/kuGaPu4p5eC2rFvt
X-Received: by 2002:a05:6830:2a17:b0:704:7b8c:ba0c with SMTP id 46e09a7af769-70b4fc9d15fmr2265647a34.30.1723136758340;
        Thu, 08 Aug 2024 10:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723136758; cv=none;
        d=google.com; s=arc-20160816;
        b=eLYSzTij4N+DO6tHagrABGhfsoOr78gTtG/QcDmadhnKI7bNqYrOMl2zo9fpslZYxH
         lRUYUMZd3ilLSOD/sg3SAVkQ1sS5EoFhqvGGcMhkNzzBjc/a92T4jYUveU0mdVH907Gw
         iB4ugns9I7FMzFsQ0D3xzMnEa4vnWxkd7YGdJsmYIoaV0N05r74/45xvmZQ4kGd2fDAH
         AcF0Pr2Gvn2zJhnFvA3m9Ud7ojOpw0c1uKuD5PBleKyXrqCTwRfvz9ZejHgWu3/0C8vR
         YO2vcGSzTjguRMdFAYMeqy45zBC24IeBDfrKvZPJmXlZFMinWPYwqd/apxEhQ0FjGesn
         4ySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Ypvl9FpVY0ygw7Z0E6YIFvox3QzLmjxUg9xzQhSB9yU=;
        fh=N5HxHITUWSLOkULx7ITQ8OrnC9xUUIL/vatdVN0Rh8s=;
        b=TEOQMixnXXL/TSgX4EtLJrtpFB2N2QkFopBmVjdEK9GGXAGglTXcdZDmDZ3m5YVUCF
         LPla5TaqT3klQ9xiUlxuunokqZIbnxbJjVF+5I1r5RFKE3wqCm8LYSNAwyh4GWxED3cX
         F8Y9N4F5l6hp3d7IBwhKKR6Q2fu6uA/1iLWYwS84SIrZF4XW22DiGd2w2ajIkJsNoEN0
         fYqh4SK5T+ZTEMtlbp3bg9z9wtGvgb6yKXp1fESltXw38uOczBUYK7XhJST4dHN7vn4Y
         bbeHWj0GUQ4wy7o3VnD8ymnuTIWE+Xpry5UOtSOJcCSs69Pr4RsDQ4sXmAMPOGMmZwUP
         /JNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hh9ofCz/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb92ea18si48756256d6.552.2024.08.08.10.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 10:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hh9ofCz/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sc6aA-00014Z-15; Thu, 08 Aug 2024 13:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6a8-0000xJ-9h
 for qemu-devel@nongnu.org; Thu, 08 Aug 2024 13:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6a6-0004Xs-MH
 for qemu-devel@nongnu.org; Thu, 08 Aug 2024 13:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723136742;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ypvl9FpVY0ygw7Z0E6YIFvox3QzLmjxUg9xzQhSB9yU=;
 b=hh9ofCz/i+5NelzzzlFqmcK687h832GOFIl53kf7lJjRONs2FeuTtVpyMjwi2EZ2d2tf/p
 mB6Xf+MSFVk6TYhEfbI4xk+yFxJCSzrVkAFb20Frtdv6YnNoJpSBE+HBbB1IV3+DmFnxN9
 yGpozTct7NLCgOBbHYHJVl1MghT2d2w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-epBJdvH3O7KJyJgXe-htnw-1; Thu,
 08 Aug 2024 13:05:38 -0400
X-MC-Unique: epBJdvH3O7KJyJgXe-htnw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4201D1945104; Thu,  8 Aug 2024 17:05:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.163])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1DBE41956052; Thu,  8 Aug 2024 17:05:32 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:05:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alejandro Zeise <alejandro.zeise@seagate.com>
Cc: qemu-arm@nongnu.org, kris.conklin@seagate.com,
 jonathan.henze@seagate.com, evan.burgess@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 03/15] crypto/hash-gcrypt: Implement new hash API
Message-ID: <ZrT62R_5HaQQxDqP@redhat.com>
References: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
 <20240807195122.2827364-4-alejandro.zeise@seagate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240807195122.2827364-4-alejandro.zeise@seagate.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XrVGItpcObLz

On Wed, Aug 07, 2024 at 07:51:10PM +0000, Alejandro Zeise wrote:
> Implements the new hashing API in the gcrypt hash driver.
> Supports creating/destroying a context, updating the context
> with input data and obtaining an output hash.
> 
> Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
> ---
>  crypto/hash-gcrypt.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/crypto/hash-gcrypt.c b/crypto/hash-gcrypt.c
> index 829e48258d..e05511cafa 100644
> --- a/crypto/hash-gcrypt.c
> +++ b/crypto/hash-gcrypt.c
> @@ -1,6 +1,7 @@
>  /*
>   * QEMU Crypto hash algorithms
>   *
> + * Copyright (c) 2024 Seagate Technology LLC and/or its Affiliates
>   * Copyright (c) 2016 Red Hat, Inc.
>   *
>   * This library is free software; you can redistribute it and/or
> @@ -110,7 +111,85 @@ qcrypto_gcrypt_hash_bytesv(QCryptoHashAlgorithm alg,
>      return -1;
>  }
>  
> +static
> +QCryptoHash *qcrypto_gcrypt_hash_new(QCryptoHashAlgorithm alg, Error **errp)
> +{
> +    QCryptoHash *hash = NULL;
> +
> +    if (!qcrypto_hash_supports(alg)) {
> +        error_setg(errp,
> +                   "Unknown hash algorithm %d",
> +                   alg);
> +    } else {
> +        hash = g_new(QCryptoHash, 1);
> +        hash->alg = alg;
> +        hash->opaque = g_new(gcry_md_hd_t, 1);
> +
> +        gcry_md_open((gcry_md_hd_t *) hash->opaque, qcrypto_hash_alg_map[alg], 0);
> +    }
> +
> +    return hash;
> +}
> +
> +static
> +void qcrypto_gcrypt_hash_free(QCryptoHash *hash)
> +{
> +    gcry_md_hd_t *ctx = hash->opaque;
> +
> +    if (ctx) {
> +        gcry_md_close(*ctx);
> +        g_free(ctx);
> +    }
> +
> +    g_free(hash);
> +}
> +
> +
> +static
> +int qcrypto_gcrypt_hash_update(QCryptoHash *hash,
> +                               const struct iovec *iov,
> +                               size_t niov,
> +                               Error **errp)
> +{
> +    gcry_md_hd_t *ctx = hash->opaque;
> +
> +    for (int i = 0; i < niov; i++) {
> +        gcry_md_write(*ctx, iov[i].iov_base, iov[i].iov_len);

  int ret = gcry_md_write(*ctx, iov[i].iov_base, iov[i].iov_len);
  if (ret != 0) {
      error_setg(....)
      return -1;
  }


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

