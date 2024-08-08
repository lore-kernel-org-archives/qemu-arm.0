Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp587016njc;
        Thu, 8 Aug 2024 10:01:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuiaCA7Alb4bzvJX7R0VcCTGdJ5amAxIl7r6s/imAFcB8I29ng5axyD5maT/ujOhFcaDmiTq3r37xR8d9p980G4UhnOIR+
X-Google-Smtp-Source: AGHT+IHH42PKpVNrpatevr1NAs1IKRgDh6u5oSeg+o593LhCKAI/YAaT3dNKDS2r9ZRC+xZQ7n/B
X-Received: by 2002:a05:6102:390b:b0:493:b4cc:93ac with SMTP id ada2fe7eead31-495c5c33a8amr3182106137.21.1723136488279;
        Thu, 08 Aug 2024 10:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723136488; cv=none;
        d=google.com; s=arc-20160816;
        b=vR5Nthr0SNRFpT8kawUz8XqovjEU3nD66mZgXLDbN9KCi7hfiXw45ffFF9Ta4WjRB5
         ddbm/yIRqpE1ALOX2DaSeMbVGVv/8lZZ1guMGwM0f4khNbPsdLrp6pB4v5t5VzWlIu0W
         PHpZE+UzmUiNlr+s1salg6aVjER8DLN6MQ89Hs0wtKQpY6jWNmEJA++vwKWRuI3GkF4x
         Z3udopcc/dOOJ3/iApTqBr5g3S4ZRDGjs6FiEcMDliNwvFg/LaZ1rNxfS9GgzMoEbiz2
         V9j3AHG2eV55bi4yrNI1U+Iqfx2YfW+RqSRIkzmm7A8NoHUO2GP5cNyOGQwhfKxbPW7K
         wgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Ekkz8oLnoPAZJTmxwSnAYgykxi8gQuIU04A2G3BZVbE=;
        fh=N5HxHITUWSLOkULx7ITQ8OrnC9xUUIL/vatdVN0Rh8s=;
        b=Djcs7XYQ2PXxIrnSW+hEYl8N0VBBJQFqAGUUpDocw37EPayu3rSxhON6tLYUMzf2fG
         BLz1q0d8FjM75lTvpbLxhdaRBfWZRj46zQTaO0pyn6hUf0SvM+UjfdNJojkVb6HYoMtB
         EP/5g1Z3MbqGpqko32slk3zKavEF0ZqtQvdr/+pWVK4A5Ur5OU8y4Cirz7viJZRjLDZX
         hdoR1b5O13mbTqDhCtwDiIeyfUh5A7POGomqniyCW8krXaIMJvV18OIrizEga9PjDg2d
         FiTrFrcre5NhMbnyLmm1QkwpHVRJAWBbYPmcRJNk79uK56205zWcC1NUHRP6YaLaG+TD
         f+BQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S3BOdImq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4945dbff2eesi2767125137.691.2024.08.08.10.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 10:01:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S3BOdImq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc6Vo-0006ta-Pj; Thu, 08 Aug 2024 13:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6Vh-0006Tk-Fh
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:01:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6VZ-0003qP-AQ
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723136451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ekkz8oLnoPAZJTmxwSnAYgykxi8gQuIU04A2G3BZVbE=;
 b=S3BOdImq4hukaCErqTavEzO/QMgh0c30cvULmB3u+do0zFhqzuViEOSnOunTD/Fdc3384X
 YKJys1eTmgmbQms95BZkSkgLWH+PzfjFR7svMiG/0UDcT+t6PopWoDqrQWZ4LzZpWhDsuX
 gidFXklTibeW1+Jl7e2KevYqzVidNl4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-LRed6nRON5C0BXfFlzRI_w-1; Thu,
 08 Aug 2024 13:00:50 -0400
X-MC-Unique: LRed6nRON5C0BXfFlzRI_w-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8AC4219772ED; Thu,  8 Aug 2024 17:00:48 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.163])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5815B1955F35; Thu,  8 Aug 2024 17:00:45 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:00:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alejandro Zeise <alejandro.zeise@seagate.com>
Cc: qemu-arm@nongnu.org, kris.conklin@seagate.com,
 jonathan.henze@seagate.com, evan.burgess@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 03/15] crypto/hash-gcrypt: Implement new hash API
Message-ID: <ZrT5uReaBsLOAbnW@redhat.com>
References: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
 <20240807195122.2827364-4-alejandro.zeise@seagate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240807195122.2827364-4-alejandro.zeise@seagate.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: R942/lfqINju

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
> +    }
> +
> +    return 0;
> +}
> +
> +static
> +int qcrypto_gcrypt_hash_finalize(QCryptoHash *hash,
> +                                 uint8_t **result,
> +                                 size_t *result_len,
> +                                 Error **errp)
> +{
> +    unsigned char *digest;
> +    int ret = 0;
> +    gcry_md_hd_t *ctx = hash->opaque;
> +
> +    *result_len = gcry_md_get_algo_dlen(qcrypto_hash_alg_map[hash->alg]);
> +    if (*result_len == 0) {
> +        error_setg(errp, "%s",
> +                   "Unable to get hash length");
> +        ret = -1;

Same note about doing an immediate 'return -1' in error paths,
to avoid extra else clauses.

> +    } else {
> +        *result = g_new(uint8_t, *result_len);
> +
> +        /* Digest is freed by gcry_md_close(), copy it */
> +        digest = gcry_md_read(*ctx, 0);
> +        memcpy(*result, digest, *result_len);
> +    }
> +
> +    return ret;
> +}
>  
>  QCryptoHashDriver qcrypto_hash_lib_driver = {
>      .hash_bytesv = qcrypto_gcrypt_hash_bytesv,
> +    .hash_new      = qcrypto_gcrypt_hash_new,
> +    .hash_update   = qcrypto_gcrypt_hash_update,
> +    .hash_finalize = qcrypto_gcrypt_hash_finalize,
> +    .hash_free     = qcrypto_gcrypt_hash_free,
>  };
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

