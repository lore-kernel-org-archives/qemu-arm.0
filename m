Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2240571njb;
        Tue, 30 Jul 2024 02:04:47 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUn8j8ELzGqPToz4wWNF2sjlIy7DK8N57tpKz7y5Qi8at2Ht5s9O7ljrDXv1GPq3rq+sT9O+wWbTmj7Bx+BLukAMc3qk4+Z
X-Google-Smtp-Source: AGHT+IEh7+VSVg/85Qmeuhn4xCw0xk/6qBJBhJ4Lm1PFvzyppB8v1GblbtnsHvaxCjetnhHF3oTm
X-Received: by 2002:a05:620a:450b:b0:79f:420:5a0e with SMTP id af79cd13be357-7a1e5247b1fmr1311688085a.18.1722330287466;
        Tue, 30 Jul 2024 02:04:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722330287; cv=pass;
        d=google.com; s=arc-20160816;
        b=qXq2pR1AfpP7CxMwZ1OLAaQoAU0osXTWmO9TAvBAKSWd99eYuw8ppAGb+DSrfXvWFV
         1QYyH89cexKqIaNknD6j1UdHZ5LVLzMh10OHXCrpH7i1cEiTUh2/PLJQ8to+khI59gUl
         8h8SzNE+3l81ehu0UG/QXUO1LuDtngHpS7al7kLSEKyaJe5Y4VkRqwuosSQ5ruc53G6r
         2Z7rnSD2I9i43U9acU2VeYf5qU6qU6ybFYPGXQEq3ZXXJlV+o/OruySiumUkv6C2Y0IO
         1w8AmziQp7uDJ4UOsQ6PpTN6bq0wJW6ytCxnHwvDJwoegzuOiGe3BAnMPgjG8Rhp4Tm7
         tH+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:references:reply-to:message-id:subject:cc:to
         :from:date:dkim-signature;
        bh=9wRwh217Un2hFDaFzFKg356O+MexRdgTYTnpDkS6INU=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=VD0Bkrl8R+X2rzIUnFIfQf+JInrRp3DF5FyRe1szJvk+kToeEMm6ZzV8JyDiH6XDqG
         PDAOKVxg9jjG4mAcpPMr8eGGovRnp1Flu7H+OaeAVeCN2KvPp3SZ8OB+oum2TAut0fZa
         M2YARvkVxp9jy//Qkf3+E9CTvdwyjEA/bR3sWj6nZMijCMTnUIbgsOb71sxvD3OcJgQD
         DCPvuZ8jgc4FF+r1mlUaF/XX7QIM5jVf609mtZqrfgo8XvsUJ0+IB+oqErDfZPmQd2ol
         8b1It5DI6+GJaFfmvmBYq7OC+aYSnoR21R+lEA8Xx8jwL1gq2K8dtNAbav32PNyDDUqG
         S9Ag==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OB581UbO;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22643-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-22643-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-22643-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7462b89si1239720185a.532.2024.07.30.02.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 02:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22643-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OB581UbO;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22643-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-22643-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B051C20D27
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 09:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B30D1946D6;
	Tue, 30 Jul 2024 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OB581UbO"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9119306A
	for <kvm@vger.kernel.org>; Tue, 30 Jul 2024 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722330258; cv=none; b=IlVzIk0hfO0PQ2Qn4bg6fhwGzRCXJCkMBh6KTeBbBgmWrdICxH18TmGVS1RmcasphL/QuHYUKPoYJs03FG3H637GuRcBeZRyxAxiCFEuCtT0pLKsMyK5+iKgrZSpfQhSY5RIbXHJXHKJBvzd3HHMdZo3RRwe/+1QtbuqcOMbVkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722330258; c=relaxed/simple;
	bh=hkeLUQvyStoyziZ7lJOSv+SJIwqB0VOOSI2mPGPFG2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lr4OWL122obOnMZ0iNbbnIYe1f0fyGMJhgGHwVh2WfRqrA/awbG7ZB2gQPwJDyadNuOYJO84GAkSPMe7au6mE7VHbDG3g7bgRsUw60w2B8mMxa7G+dt2eO2vxASsYFcgsGGI6h1fePTR3EIf9vHo8pADCnlcm7HNJdy3Z4ov9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OB581UbO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722330256;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wRwh217Un2hFDaFzFKg356O+MexRdgTYTnpDkS6INU=;
	b=OB581UbOHbOybhnKU3GTpkL65ykzcYipu0LBzGB1J/38SjwV1XhMGOg5ImI2/x14o1yHaA
	FiCwIkAbjcKGhVv5hX0G7p0/lVRE79MOu9ban4q3m4adKHFyNnbfUBNYPtNOImiPgCMid/
	cs8jBlU/ohpAtNRXJHypCmbmLHZ/WPU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-340-0TbbOKwKMhqHqsxLILtYIw-1; Tue,
 30 Jul 2024 05:04:13 -0400
X-MC-Unique: 0TbbOKwKMhqHqsxLILtYIw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 966671955D47;
	Tue, 30 Jul 2024 09:04:09 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66405300018D;
	Tue, 30 Jul 2024 09:03:52 +0000 (UTC)
Date: Tue, 30 Jul 2024 10:03:48 +0100
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
Subject: Re: [PATCH 14/18] qapi/crypto: Rename QCryptoAkCipherAlgorithm to
 *Algo, and drop prefix
Message-ID: <ZqisdJz0KqgY5_BF@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-15-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730081032.1246748-15-armbru@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: RhcQl9eQK3Go

On Tue, Jul 30, 2024 at 10:10:28AM +0200, Markus Armbruster wrote:
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> QCryptoAkCipherAlgorithm has a 'prefix' that overrides the generated
> enumeration constants' prefix to QCRYPTO_AKCIPHER_ALG.
> 
> We could simply drop 'prefix', but then the prefix becomes
> QCRYPTO_AK_CIPHER_ALGORITHM, which is rather long.
> 
> We could additionally rename the type to QCryptoAkCipherAlg, but I
> think the abbreviation "alg" is less than clear.
> 
> Rename the type to QCryptoAkCipherAlgo instead.  The prefix becomes
> QCRYPTO_AK_CIPHER_ALGO.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/crypto.json                        |  7 +++----
>  crypto/akcipherpriv.h                   |  2 +-
>  backends/cryptodev-builtin.c            |  4 ++--
>  backends/cryptodev-lkcf.c               |  4 ++--
>  crypto/akcipher.c                       |  2 +-
>  tests/bench/benchmark-crypto-akcipher.c |  2 +-
>  tests/unit/test-crypto-akcipher.c       | 10 +++++-----
>  crypto/akcipher-gcrypt.c.inc            |  4 ++--
>  crypto/akcipher-nettle.c.inc            |  4 ++--
>  9 files changed, 19 insertions(+), 20 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

