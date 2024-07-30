Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2459823njb;
        Tue, 30 Jul 2024 09:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaQgzRD1Myt6PLg5nC9OY92HXsRd0f8T6PcX3t7EAVN8+dP+a4n38yaNVXH84o/O7EY+lsvbO18r+d2VBp1QlOhNdUz8LA
X-Google-Smtp-Source: AGHT+IEBPsPoSzOlUlVv/0uVPgYRtSISt7qecVFKdOEFNQu/3thXobpihK26cvxu6lPoFqERg/aD
X-Received: by 2002:a05:6122:3d06:b0:4f5:14c7:822f with SMTP id 71dfb90a1353d-4f6e68b27b5mr13332191e0c.3.1722357271802;
        Tue, 30 Jul 2024 09:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722357271; cv=none;
        d=google.com; s=arc-20160816;
        b=pf1OkBpjl7VVLT/zfmd80eB8IIs+mPZujun2vg4zfRCgpSGOQR7atxfzwDxCF7WR1a
         n8lvjze9Em2Rivzr5Qn79dG7/GfpScT/Mn88Xq4RJaw8gmz6O8hcYKrYSUiDc1Omb8Wx
         cvGT+nm9LEFAXGEqKsdGEfEXsezMp8rV6g7r6tQ2ZQ9pEA89frMXkj3kRuUN1aiT1uT0
         beavNRGAYNfDMSEEJ6R0Qy6QMy4EgbOQU96+rRioqfNMXF0gVb+AZ1rMhPShxHl//o9m
         E+kZnVAGLdqsjv+/5Vs/9zdfXdR29khD479w7bxJDmj6u5E0VgDKPqyxWtpGEw8tqt5P
         AwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7+f3k17eQadsbAgEbGJb1Y9DtYp+3wVinJe3pKCPgLo=;
        fh=kvXg6+NHNGmy7Ne8I/dZ9HOjmQ4RL6C6C7Q97Pv2A1g=;
        b=hwQpEAY8CV7pl5Jhs62xCz836SAQim5VsJxZt3sOd4iMqCh7baYmww7aPDy1+puZw5
         xtsh40f0S69Nl8b0H+v6Afp28M7Ljax/T8gu82E+rMJpKRxVbT4i0s+7AbBB3fadmxsW
         XAOnzJMCEtYTe8Pl3TemTLdirHn2QQjAiTkZOFha36ABjL7io64CURKRG0/pDZc+zf5w
         buFqV/NhRYdFptoBXxxIXKkPZ5jMmWxzDmtmWsVL0Ab+zCQ5vvww+5rvaNFhSZpkVThf
         7Uo7ON+2DnPjtcRrcFUbb4PUntDlj9JGY+ux6Q4PK1P7pwVGDPTlssaSnVpuIHxjUEYB
         FVqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PnuPnptv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4500b8f5688si76875461cf.18.2024.07.30.09.34.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 09:34:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PnuPnptv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYpnk-0001XS-UR; Tue, 30 Jul 2024 12:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYpni-0001NB-66
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 12:34:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYpng-0005Ql-DQ
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 12:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722357251;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+f3k17eQadsbAgEbGJb1Y9DtYp+3wVinJe3pKCPgLo=;
 b=PnuPnptvOB8B0rQ3hv1Ug3VPKPLml798cbe3uEqOyTQhnd8rGOv/oKv2URABX0VoH1eMpW
 rqCjFkEBmBP7uF5VYshwxIjEgIQ/Wtsxzc573ehYfKsmzA4LXJVYTD3FEOB8oZ8FS+PexZ
 Tf26jcXahgazOAq6LD2huP3stzZ/Rx4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-pJIY0PuKNsST1RVY7QzdJQ-1; Tue,
 30 Jul 2024 12:34:07 -0400
X-MC-Unique: pJIY0PuKNsST1RVY7QzdJQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3098D195609E; Tue, 30 Jul 2024 16:34:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2D6A41955F40; Tue, 30 Jul 2024 16:34:03 +0000 (UTC)
Date: Tue, 30 Jul 2024 17:34:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Alejandro Zeise <alejandro.zeise@seagate.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH v2 1/2] crypto: add support for accumulative hashing
Message-ID: <ZqkV-OQizSWac5yo@redhat.com>
References: <20240729190035.3419649-1-alejandro.zeise@seagate.com>
 <20240729190035.3419649-2-alejandro.zeise@seagate.com>
 <fdc53976-2000-46cd-a65a-c9976fc8c9d1@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdc53976-2000-46cd-a65a-c9976fc8c9d1@kaod.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 8UdcZcyIXJOS

On Tue, Jul 30, 2024 at 05:58:38PM +0200, Cédric Le Goater wrote:
> On 7/29/24 21:00, Alejandro Zeise wrote:
> > This change adds an accumulative hashing function
> > (qcrypto_hash_accumulate_bytesv) and implementation
> > for each of the crypto library backends that QEMU supports.
> > 
> > The QCrypto API did not support hashing in an accumulative mode.
> > As such, hardware hash modules (like the HACE from Aspeed's SoCs) are
> > unable to perform such operations correctly when the guest requires it.
> > 
> > The creation and freeing of each library's context is abstracted by
> > the qcrypto_hash_accumulate_new_ctx and qcrypto_hash_accumulate_free_ctx
> > functions.
> > 
> > Changes in V2:
> > * Fixed error checking bug in libgcrypt backend
> > 
> > Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
> > ---
> >   crypto/hash-gcrypt.c  | 105 ++++++++++++++++++++++++++++++++++++++++++
> >   crypto/hash-glib.c    |  89 +++++++++++++++++++++++++++++++++++
> >   crypto/hash-gnutls.c  |  82 +++++++++++++++++++++++++++++++++
> >   crypto/hash-nettle.c  |  93 +++++++++++++++++++++++++++++++++++++
> >   crypto/hash.c         |  42 +++++++++++++++++
> >   crypto/hashpriv.h     |  11 +++++
> >   include/crypto/hash.h |  65 ++++++++++++++++++++++++++
> >   7 files changed, 487 insertions(+)

> > diff --git a/include/crypto/hash.h b/include/crypto/hash.h
> > index 54d87aa2a1..fb8ae2d099 100644
> > --- a/include/crypto/hash.h
> > +++ b/include/crypto/hash.h
> > @@ -1,6 +1,7 @@
> >   /*
> >    * QEMU Crypto hash algorithms
> >    *
> > + * Copyright (c) 2024 Seagate Technology LLC and/or its Affiliates
> >    * Copyright (c) 2015 Red Hat, Inc.
> >    *
> >    * This library is free software; you can redistribute it and/or
> > @@ -25,6 +26,8 @@
> >   /* See also "QCryptoHashAlgorithm" defined in qapi/crypto.json */
> > +typedef void qcrypto_hash_accumulate_ctx_t;
> 
> 
> QCryptoHmac defines a similar API. I would do the same for the hash
> accumulative mode. See hmac files.

Yes, ideally the hmac APIs would match the hash APIs.

That said, the changes I've just requested are already a
large amount of work, so I'm not going to demand that
the hmac.c code is also changed.

Alejandro: if have you time to update hmac.c that would
be awesome, but consider it optional.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

