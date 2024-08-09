Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp793029njc;
        Fri, 9 Aug 2024 01:38:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMcgTQNqxPmNen11Ha/Cw4ka7tPH3ei99VukILOcdUX3ZIG/ZKw0ZTBV+2Wv9kQO/U4v7m7WaU6ztMxs5AvISGkYrf9W7l
X-Google-Smtp-Source: AGHT+IEE72WSiVxsyIK26wOcJtBuyl/7MoN5Qx9La5ep+6HmELtuJvM0Fg6h+uHRnu77EUxPPqXc
X-Received: by 2002:a05:622a:190c:b0:44f:e11c:b0d8 with SMTP id d75a77b69052e-451d57e8a3fmr79377641cf.7.1723192681067;
        Fri, 09 Aug 2024 01:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723192681; cv=none;
        d=google.com; s=arc-20160816;
        b=VhtgyIrnNIS8i8NF2qTfwdP/02xnLa20fJlgvDJ7Bq8z2Zqrd0+6gViw4FO18B2ZVu
         HWmrFwD2Jn7R0PUBi8pqBXsKtzzS2tHPMsJz2G/yYnKVCJ5WzjC6nJniWiA3Gw73OPO6
         YDwsRel9yJOklPSKJmbnTdLimU2khopolbc3jJjaSBbmh0PpuWWq+AZqaHoo/NVI0uuD
         NhRw7rrQdV6n2mRRwObZtd6K3+yj1RZsNw15HCvNqGd4DNB9Hsi553WonNOCNYlAodYv
         qguu0p4EVG8ERSN9BypWkUFrT+zL0cqRM3d2ZCCbPrMR8HOOqApfe+OECngKw3caxF7d
         ERLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=VKd3eR8jDeRz/IODE/Js+qkGQBKX4cfBn9uHikOevn0=;
        fh=sAx23CqVvQAllLTEy+L6nAI85TJcLDAJaM7FnacxZ7s=;
        b=MleJVvxiJLtriyn42iB1UgsogbWi0NsKocPgRSBV98A0Iavq2NI13gICT+8LzP01QU
         0WWQF01rUZAGO8xYGYyXyuOI/6BTbdLh5KvlXM7H0NWMEyH6GKU129nKmhbN+LSN9Uqu
         PSpQRQC9B/oPZ1WSLecuvKGgaPn8OdfrqB+DGB2NQeCkueay7jYDcdF3jfTFwg8Mddqa
         OjLQKzdr99ZqWWQIeYcYaxt/n85WWUmIWDR+pn6sS8reYcunsVBOS958tK33CbIaKEIy
         P9/kmy4gfiBJfOHOkycWPsT+EIQtKJ5durrH1P0VXYnkCwvsCj8L1DeU83nkb+WTXeZG
         nCeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J6jmAdPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87d770csi66440631cf.389.2024.08.09.01.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2024 01:38:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J6jmAdPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scL8A-00053y-3z; Fri, 09 Aug 2024 04:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1scL86-00050C-Dd
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 04:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1scL83-0001Zn-IG
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 04:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723192662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VKd3eR8jDeRz/IODE/Js+qkGQBKX4cfBn9uHikOevn0=;
 b=J6jmAdPKUmUWpk17Ad8G9OmQmUHmuZs4iJlqTDMm5+J4VoBn11F6Ck46sB8AP8RzNQjFUF
 HLvQzu1jl/e+bvpqTdklADGgACJ2+6t2nSagyj21KbNiSVA+a9kVrH06NuZrKqx+BwO7Js
 wFZ36TC5hDM+cD19cEnUQ6ZUZYnpGDw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-YUDCWqs5OIeM-INmBRvKtw-1; Fri,
 09 Aug 2024 04:37:37 -0400
X-MC-Unique: YUDCWqs5OIeM-INmBRvKtw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D6AED195608D; Fri,  9 Aug 2024 08:37:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.27])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0421119560A7; Fri,  9 Aug 2024 08:37:31 +0000 (UTC)
Date: Fri, 9 Aug 2024 09:37:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alejandro Zeise <alejandro.zeise@seagate.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Kris Conklin <kris.conklin@seagate.com>,
 Jonathan Henze <jonathan.henze@seagate.com>,
 Evan Burgess <evan.burgess@seagate.com>, "clg@kaod.org" <clg@kaod.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 03/15] crypto/hash-gcrypt: Implement new hash API
Message-ID: <ZrXVR95hnQwg5zGh@redhat.com>
References: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
 <20240807195122.2827364-4-alejandro.zeise@seagate.com>
 <ZrT62R_5HaQQxDqP@redhat.com>
 <LV8PR20MB6853CD119297E25B2218EC9FEFB92@LV8PR20MB6853.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV8PR20MB6853CD119297E25B2218EC9FEFB92@LV8PR20MB6853.namprd20.prod.outlook.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
X-TUID: ipoi0MXd60wZ

On Thu, Aug 08, 2024 at 06:24:10PM +0000, Alejandro Zeise wrote:
> > On Wed, Aug 07, 2024 at 07:51:10PM +0000, Alejandro Zeise wrote:
> > > Implements the new hashing API in the gcrypt hash driver.
> > > Supports creating/destroying a context, updating the context with 
> > > input data and obtaining an output hash.
> > >
> > > Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
> > > ---
> > >  crypto/hash-gcrypt.c | 79 
> > > ++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 79 insertions(+)
> > >
> > > diff --git a/crypto/hash-gcrypt.c b/crypto/hash-gcrypt.c index 
> > > 829e48258d..e05511cafa 100644
> > > --- a/crypto/hash-gcrypt.c
> > > +++ b/crypto/hash-gcrypt.c
> > > @@ -1,6 +1,7 @@
> > >  /*
> > >   * QEMU Crypto hash algorithms
> > >   *
> > > + * Copyright (c) 2024 Seagate Technology LLC and/or its Affiliates
> > >   * Copyright (c) 2016 Red Hat, Inc.
> > >   *
> > >   * This library is free software; you can redistribute it and/or @@ 
> > > -110,7 +111,85 @@ qcrypto_gcrypt_hash_bytesv(QCryptoHashAlgorithm alg,
> > >      return -1;
> > >  }
> > >
> > > +static
> > > +QCryptoHash *qcrypto_gcrypt_hash_new(QCryptoHashAlgorithm alg, Error 
> > > +**errp) {
> > > +    QCryptoHash *hash = NULL;
> > > +
> > > +    if (!qcrypto_hash_supports(alg)) {
> > > +        error_setg(errp,
> > > +                   "Unknown hash algorithm %d",
> > > +                   alg);
> > > +    } else {
> > > +        hash = g_new(QCryptoHash, 1);
> > > +        hash->alg = alg;
> > > +        hash->opaque = g_new(gcry_md_hd_t, 1);
> > > +
> > > +        gcry_md_open((gcry_md_hd_t *) hash->opaque, qcrypto_hash_alg_map[alg], 0);
> > > +    }
> > > +
> > > +    return hash;
> > > +}
> > > +
> > > +static
> > > +void qcrypto_gcrypt_hash_free(QCryptoHash *hash) {
> > > +    gcry_md_hd_t *ctx = hash->opaque;
> > > +
> > > +    if (ctx) {
> > > +        gcry_md_close(*ctx);
> > > +        g_free(ctx);
> > > +    }
> > > +
> > > +    g_free(hash);
> > > +}
> > > +
> > > +
> > > +static
> > > +int qcrypto_gcrypt_hash_update(QCryptoHash *hash,
> > > +                               const struct iovec *iov,
> > > +                               size_t niov,
> > > +                               Error **errp) {
> > > +    gcry_md_hd_t *ctx = hash->opaque;
> > > +
> > > +    for (int i = 0; i < niov; i++) {
> > > +        gcry_md_write(*ctx, iov[i].iov_base, iov[i].iov_len);
> >
> >   int ret = gcry_md_write(*ctx, iov[i].iov_base, iov[i].iov_len);
> >   if (ret != 0) {
> >       error_setg(....)
> >       return -1;
> >   }
> >
> >
> > With regards,
> > Daniel
> 
> gcry_md_write() is declared as void which is why I had no error variable present.

Opps, yes, I'm getting confused with the other APIs.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

