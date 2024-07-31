Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp252766njb;
        Wed, 31 Jul 2024 02:47:44 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWSB2s8TaTbNvOiXCynFJHUsizMfidbkzMmyQ1Stdq3pRO+wPDL3DessKV6tBfoPSDKDHd9+QrNZEpznRAx3F1gSRryI9UA
X-Google-Smtp-Source: AGHT+IHcbhPDJrog1sNjSIII1ug3jIilNhJwu/bymbIG8vmJqc1NB1NyTy4P1o/wcDui0Sj+nXUj
X-Received: by 2002:a05:620a:40c2:b0:79c:ad5:cd7d with SMTP id af79cd13be357-7a200ced732mr858348385a.23.1722419264183;
        Wed, 31 Jul 2024 02:47:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722419264; cv=pass;
        d=google.com; s=arc-20160816;
        b=YQMPmbpyHY88GUmidk0Hl0hJuccfdx9qDVRRr0+UJPG13Amsln1ApJrFl9LCRsWcf0
         BXWrPZ50ZsQiyvBiwZZh0GsMb4xhsOz4zhJoAQ/eE3Uu63VzClhuREceVsWsQZnysJ/j
         387S/VPvhdn/hLA++T5Et1i6JahoQVYcQsD12H1rxvlUHHUpA0GN3Sk0iBwr+MkfgVOz
         /I7XlSUOqn27QUDEkrtyJ+Y0DGuEnDH5z2hp/HQqNkDpG7DdXtx900ObQ0F+S736y0fU
         QA2IW0HPJ5NXEW7iHwnB8jn1CmkuYZP8omEWMMxWR1o975bKtUuGf/ymyqOotd3VQ/jC
         vOQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:references:reply-to:message-id:subject:cc:to
         :from:date:dkim-signature;
        bh=RN/EvGyZRi8fcJaZUhpv7a+fbx4w4De6uL4ewPPPpWQ=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=HujI+yGGLOFNEPuMg/7emb74g6QAOi/5rZoFe4JYqplctKSomVXLmF0bNwV/NGgwLO
         VZW2cygG3sZrOn6/JkX/1QBRDFhsk2LGrkSnPsbMJrjqx/A6XCeA/alcIVLTo5Lc9+lX
         AeM8Ksoze68qHeTuRMTWSYpjJiy16m3ZQFcJmaVgdHD0aQuBtkhhrgrRuPtw+nVUHCah
         bzApz34XkRSqzJsZ6ntH0llRZp1DZ2Gx//vlKikIo7GY811KsLTBObTf2fvIReWEScH3
         7MUKUVqn43DTDAIyl16Rf1eh/6Q2ybKj0xWWhUAQLzV6qoVYrA/vzilkMRuKLPggoIQU
         f2ow==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dq+dD5Pt;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22745-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-22745-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-22745-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d73c6fa7si1490947685a.193.2024.07.31.02.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22745-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dq+dD5Pt;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22745-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-22745-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1BED1C20ED6
	for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 09:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1601AB526;
	Wed, 31 Jul 2024 09:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dq+dD5Pt"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12DF1A8C18
	for <kvm@vger.kernel.org>; Wed, 31 Jul 2024 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722419249; cv=none; b=TlhQCtDubfh9Di4TL9+MS+rqWichXQrerdBy8kGmwBjuB45exgpvqMitUoAdTKX3TVZgC0qpD6BIAgFN5YBvbJ01tCoE96w/y/deVL/QeP7f1ok9CCQYG08J4L1g4OwuonaE30n5WGqOEAfQOz4EdKkYt7zJyujLBOrCEhJv+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722419249; c=relaxed/simple;
	bh=gheqssgeEc2AwC9Q5jLNO5k0zGItL2PaL2Pduhwkzl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntcJ+bFbpwvS/vAxXC0gb9eJ615Fo9lwuQXen748745yLNZ3wTgxUOFH+lkAk0KppNu51wyJ1ljTSnBS2QDuTFstIADGm169kuwcbMg4CPugeYSY9vYTFN3tS4K0aYn+wbEqnXjDI6Ikcx0jjaF84Cf6yeXSM6wVGs8ThhfrcMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dq+dD5Pt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722419246;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN/EvGyZRi8fcJaZUhpv7a+fbx4w4De6uL4ewPPPpWQ=;
	b=dq+dD5PtTBFFDLILORCaNoQwj/rm+M6ex5pcHK/5f4oY/HhENVkG2XHx8IsOtyMlImzWgA
	ZN/R22oektK27F2qeqa4THO4TnV6mNmyjc94S6OskR4Ss7VMraEp6cFor8F4XZkWVW0Tt4
	j53JY2Pd/ldI5p5oWFhf3Ek8CAGv0uY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-xHAaDux5OISdUE05SLOgAg-1; Wed,
 31 Jul 2024 05:47:23 -0400
X-MC-Unique: xHAaDux5OISdUE05SLOgAg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAAAF19560B1;
	Wed, 31 Jul 2024 09:47:12 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.33])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D59681955E80;
	Wed, 31 Jul 2024 09:46:55 +0000 (UTC)
Date: Wed, 31 Jul 2024 10:46:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, alex.williamson@redhat.com,
	andrew@codeconstruct.com.au, andrew@daynix.com,
	arei.gonglei@huawei.com, berto@igalia.com,
	borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com,
	den@openvz.org, eblake@redhat.com, eduardo@habkost.net,
	farman@linux.ibm.com, farosas@suse.de, hreitz@redhat.com,
	idryomov@gmail.com, iii@linux.ibm.com, jamin_lin@aspeedtech.com,
	jasowang@redhat.com, joel@jms.id.au, jsnow@redhat.com,
	kwolf@redhat.com, leetroy@gmail.com, marcandre.lureau@redhat.com,
	marcel.apfelbaum@gmail.com, michael.roth@amd.com, mst@redhat.com,
	mtosatti@redhat.com, nsg@linux.ibm.com, pasic@linux.ibm.com,
	pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
	philmd@linaro.org, pizhenwei@bytedance.com, pl@dlhnet.de,
	richard.henderson@linaro.org, stefanha@redhat.com,
	steven_lee@aspeedtech.com, thuth@redhat.com,
	vsementsov@yandex-team.ru, wangyanan55@huawei.com,
	yuri.benditovich@daynix.com, zhao1.liu@intel.com,
	qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 11/18] qapi/crypto: Rename QCryptoHashAlgorithm to *Algo,
 and drop prefix
Message-ID: <ZqoIDEjiUqK2dZx4@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-12-armbru@redhat.com>
 <Zqir1y4qyp-lwyuz@redhat.com>
 <8734nrgj5i.fsf@pond.sub.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734nrgj5i.fsf@pond.sub.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: c4B8tnOYJuAX

On Tue, Jul 30, 2024 at 02:26:49PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Tue, Jul 30, 2024 at 10:10:25AM +0200, Markus Armbruster wrote:
> >> QAPI's 'prefix' feature can make the connection between enumeration
> >> type and its constants less than obvious.  It's best used with
> >> restraint.
> >> 
> >> QCryptoHashAlgorithm has a 'prefix' that overrides the generated
> >> enumeration constants' prefix to QCRYPTO_HASH_ALG.
> >> 
> >> We could simply drop 'prefix', but then the prefix becomes
> >> QCRYPTO_HASH_ALGORITHM, which is rather long.
> >> 
> >> We could additionally rename the type to QCryptoHashAlg, but I think
> >> the abbreviation "alg" is less than clear.
> >
> > I would have gone with this, but it is a bit of a bike shed colouring
> > debate so I'm not fussed
> 
> Either solution seems okay, so I went with my personal preference.  Do
> feel free to state yours and ask me to respin!

After reviewing the patches that follow, I'd observe that picking
Algo has made the following patches much larger than if it had
stuck with Alg. Basically changing both the types & constants,
instead of only having to change the types. 

> 
> >> Rename the type to QCryptoHashAlgo instead.  The prefix becomes to
> >> QCRYPTO_HASH_ALGO.
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  qapi/crypto.json                        | 17 +++++-----
> >>  crypto/blockpriv.h                      |  2 +-
> >>  crypto/hashpriv.h                       |  2 +-
> >>  crypto/hmacpriv.h                       |  4 +--
> >>  crypto/ivgenpriv.h                      |  2 +-
> >>  include/crypto/afsplit.h                |  8 ++---
> >>  include/crypto/block.h                  |  2 +-
> >>  include/crypto/hash.h                   | 18 +++++-----
> >>  include/crypto/hmac.h                   |  6 ++--
> >>  include/crypto/ivgen.h                  |  6 ++--
> >>  include/crypto/pbkdf.h                  | 10 +++---
> >>  backends/cryptodev-builtin.c            |  8 ++---
> >>  backends/cryptodev-lkcf.c               | 10 +++---
> >>  block/parallels-ext.c                   |  2 +-
> >>  block/quorum.c                          |  4 +--
> >>  crypto/afsplit.c                        |  6 ++--
> >>  crypto/block-luks.c                     | 16 ++++-----
> >>  crypto/block.c                          |  2 +-
> >>  crypto/hash-afalg.c                     | 26 +++++++--------
> >>  crypto/hash-gcrypt.c                    | 20 +++++------
> >>  crypto/hash-glib.c                      | 20 +++++------
> >>  crypto/hash-gnutls.c                    | 20 +++++------
> >>  crypto/hash-nettle.c                    | 18 +++++-----
> >>  crypto/hash.c                           | 30 ++++++++---------
> >>  crypto/hmac-gcrypt.c                    | 22 ++++++-------
> >>  crypto/hmac-glib.c                      | 22 ++++++-------
> >>  crypto/hmac-gnutls.c                    | 22 ++++++-------
> >>  crypto/hmac-nettle.c                    | 22 ++++++-------
> >>  crypto/hmac.c                           |  2 +-
> >>  crypto/ivgen.c                          |  4 +--
> >>  crypto/pbkdf-gcrypt.c                   | 36 ++++++++++----------
> >>  crypto/pbkdf-gnutls.c                   | 36 ++++++++++----------
> >>  crypto/pbkdf-nettle.c                   | 32 +++++++++---------
> >>  crypto/pbkdf-stub.c                     |  4 +--
> >>  crypto/pbkdf.c                          |  2 +-
> >>  hw/misc/aspeed_hace.c                   | 16 ++++-----
> >>  io/channel-websock.c                    |  2 +-
> >>  target/i386/sev.c                       |  6 ++--
> >>  tests/bench/benchmark-crypto-akcipher.c | 12 +++----
> >>  tests/bench/benchmark-crypto-hash.c     | 10 +++---
> >>  tests/bench/benchmark-crypto-hmac.c     |  6 ++--
> >>  tests/unit/test-crypto-afsplit.c        | 10 +++---
> >>  tests/unit/test-crypto-akcipher.c       |  6 ++--
> >>  tests/unit/test-crypto-block.c          | 16 ++++-----
> >>  tests/unit/test-crypto-hash.c           | 42 +++++++++++------------
> >>  tests/unit/test-crypto-hmac.c           | 16 ++++-----
> >>  tests/unit/test-crypto-ivgen.c          |  8 ++---
> >>  tests/unit/test-crypto-pbkdf.c          | 44 ++++++++++++-------------
> >>  ui/vnc.c                                |  2 +-
> >>  util/hbitmap.c                          |  2 +-
> >>  crypto/akcipher-gcrypt.c.inc            | 14 ++++----
> >>  crypto/akcipher-nettle.c.inc            | 26 +++++++--------
> >>  52 files changed, 350 insertions(+), 351 deletions(-)
> >
> > Acked-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Thanks!
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

