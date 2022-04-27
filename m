Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp827869lfu;
        Wed, 27 Apr 2022 01:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZHOK47uxQYrJk8E0H+HAF6MOT/FiF3F1IkAXIKcqd3sIA9TlQOEaJ9yd/PagswFkkjKlB
X-Received: by 2002:a05:622a:648:b0:2f3:642d:c12a with SMTP id a8-20020a05622a064800b002f3642dc12amr12096137qtb.464.1651049059071;
        Wed, 27 Apr 2022 01:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651049059; cv=none;
        d=google.com; s=arc-20160816;
        b=zoRbfZQO6AXm/eq2pesTm950XzPK2d2akoM9F5kujvr5wzhM7F7RrRGFChdNZzfL3Q
         lwS24exqE6Wz4kXvKQTpI5d+7tVQvYMtEbIviLMEovt0mz2wbeoCP9o8fhfG0JdVWLNf
         3knoOq4VheStzH43tpUqQ8Dh6CsVLMmI2XZic2/Xdc95glGR0EkYqODFcJahX33UcIo1
         Mzw4z65XOjhTyaHG2A3MXvVltrATwecsMez/zduJHGs4sPifsXmmArEdawauUPjZTYpX
         03J4whW7cpL7hiABLEbtms9zD1wT98RPcBupniiwWdiCOXRRlQqXZg+KUI2FH8SeVREY
         uVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=IWuRpfkiVDKQL10C62MYbue5OOQF/b4iH3iyGS7/XG0=;
        b=bMGZygWNV3GRiN0y0L7e6mWXhKo7URuGlQwcvIOQyr3m0AqXlUDa6FB917wexOFdnA
         ZKu4rMAUTIaIdnaRCPjReCmUauzUeKGtaRse0S6+lAP5TJqpIy+XNWzA9Nq1sjug/TaW
         M+xXxEDWqNjGkk13Sgv5Ek9qrLkgVoxLDiWjE4h+K1J5bNg59euK8JKhVyiQ6U//VQNw
         aY6s+H8OXA3iiZnmzD8QL05cWoMdeCKTHTlq88NO3yvAVXxnvFeYbKTffbRffBgdaQV7
         29TeXTbw6cXNe5eGjtDSnmUQiEko/KFWPirwNsBBLDzeWinxohDvdk5MUkWQFs6lzVyG
         8n9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NWEW76Ef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv11-20020ad45ceb000000b0045637043d9esi207821qvb.538.2022.04.27.01.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 01:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NWEW76Ef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njdHW-0005VT-DY
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 04:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njdGI-00053T-D6
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 04:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njdGF-0007Lo-Es
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 04:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651048977;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWuRpfkiVDKQL10C62MYbue5OOQF/b4iH3iyGS7/XG0=;
 b=NWEW76EfCPOiP4lXCJfwiB0B3XjyTM64zx9mVdeqCs0wEuGNMut/TBQbT5ZO78lSwpFAf5
 2qdAiqdnrS1l5HWRPTjMG0rhWG4eUaqmKZQI1zoA+d/79s8kkiVgYXM7JCMJ8gOwxQdWqh
 1sE43IYByPSJcPy/19Uhl8x7YYmQ0xI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-uqGaBIjjN12iFf4HZ-RskA-1; Wed, 27 Apr 2022 04:42:53 -0400
X-MC-Unique: uqGaBIjjN12iFf4HZ-RskA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 081121014A69;
 Wed, 27 Apr 2022 08:42:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BF7BC50941;
 Wed, 27 Apr 2022 08:42:51 +0000 (UTC)
Date: Wed, 27 Apr 2022 09:42:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: LABBE Corentin <clabbe@baylibre.com>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmkCCSqUxnzGrJoS@redhat.com>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
 <YmWgn2OGoZ9Uyirh@Red> <YmZ1pCU+0bP/LFPU@redhat.com>
 <YmacD3eroYTnjUdx@Red> <YmawTE9AfYxyaZoo@redhat.com>
 <YmkAEEEuquXOpqzJ@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmkAEEEuquXOpqzJ@Red>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C8ruGO9J47DQ

On Wed, Apr 27, 2022 at 10:34:24AM +0200, LABBE Corentin wrote:
> Le Mon, Apr 25, 2022 at 03:29:32PM +0100, Daniel P. Berrangé a écrit :
> > On Mon, Apr 25, 2022 at 03:03:11PM +0200, LABBE Corentin wrote:
> > > diff --git a/crypto/hash-nettle.c b/crypto/hash-nettle.c
> > > index 1ca1a41062..b9342b4fe1 100644
> > > --- a/crypto/hash-nettle.c
> > > +++ b/crypto/hash-nettle.c
> > > @@ -26,10 +26,22 @@
> > >  #include <nettle/sha.h>
> > >  #include <nettle/ripemd160.h>
> > >  
> > > +#ifndef nettle_sha256_compress
> > > +#define nettle_sha256_compress _nettle_sha256_compress
> > > +void _nettle_sha256_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
> > > +#endif
> > > +
> > > +#ifndef nettle_sha512_compress
> > > +#define nettle_sha512_compress _nettle_sha512_compress
> > > +void _nettle_sha512_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
> > > +#endif
> > 
> > The 'nettle_sha256_compress' function doesn't exist in any header file
> > from nettle that I've looked at.
> > 
> > The '_nettle_sha256_compress' function exists as a symbol in the .so
> > library, but it is clearly not intended for public usage:
> > 
> > $ nm -a -D /usr/lib64/libnettle.so | grep sha256_compress
> > 0000000000027730 T _nettle_sha256_compress@@NETTLE_INTERNAL_8_4
> > 
> > So this #define magic is definitely not something we can do.
> > 
> > IOW, unless I'm missing something, I don't think we can even
> > use nettle for your desired goal, which leaves us no impl at
> > all.
> 
> sha256 is only necessary for the upcomming sun8i-ce, so it do not block sun4i-ss.
> I try to contact nettle to add necessary headers.
> 
> So for sun4i-ss, what do you think about my qcrypto_nettle_compress implementation ?

It is reasonable in general.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

