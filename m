Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2237957njb;
        Tue, 30 Jul 2024 01:59:03 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX/mMZyLCX/hrqpZdr/tdiyrGFw9Cg8EaLjG/9zMKVdWT03i/NL0B/hF/V4rTUe3SaahyBRQPJLD3X6iYOxW27AamTypIhh
X-Google-Smtp-Source: AGHT+IHAU4lJe/JAv+BEMhlW8az54O828+6yXb6gPBFIHvyrDwqfw6oTfQ2wXsiwcKfjgMTaejHc
X-Received: by 2002:a05:6808:1449:b0:3da:ab89:a808 with SMTP id 5614622812f47-3db2389b4ddmr14685786b6e.20.1722329942820;
        Tue, 30 Jul 2024 01:59:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722329942; cv=pass;
        d=google.com; s=arc-20160816;
        b=q4AZVejI2PnCUDbhYf3mKEgaum0MUmTC8I2ggOVo53dQDnxN/cv6a8Y0sy4pa91VgB
         e21I0uDbWV5gllJ7ku7aMNwmmEpLijK3jeGnRqv21ezwIR67WA0Ih9UQyFrIkQfn1ifJ
         PdZbh6X9Ho0c6gK1hL0Q1eInLChA23IamXOSbzsd8sEaommDDa3h+ITPp+PTGITi+gge
         SdEj6bLGMisVmw/djEEmqkXu2y9TWWR3SMc5zzVlungUmujSN8BArB/Rm7MCxkde3Ca0
         sah8+ir8jyjGAt1OHGkJUraM1yYG2uZKhvmFMGdJZuft3j6mg9oTFlprLFlVehTD8SR0
         GtcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:references:reply-to:message-id:subject:cc:to
         :from:date:dkim-signature;
        bh=IQX8ZFMjIj2potml2FZBpjzLpa45uiXgT4fZjM+dvVI=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=cSun4FFMWPt4h6Y8cEo7yL38qizyBIrYyAtrMB+r6gZtwRXnC9iCzq5i0XCckumAqi
         KugQYefP9xTxRHARcll5q0X01tKGSSSCFk64y1rB0MZAdMe1YT60l0DoI1lXu00QlqFt
         NdcH1dML9TZvXb+tAEgXIBNWpCZlFTAxYDz326c/blcd1TOBRD8yAaQcZwVoioXhMff8
         9PmbAE/RkcjR10yiRDFo88sNMgsJoVSD+FidtpDGaRUJe+Xqr2yLhRKe+beradNz0xLD
         a+wqs47lNQWJjAJyjoMlM910r+EGppjoF4kYWZewwuKCrYwl3WhIFgIrLLGzLul+E8U0
         x+cQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIxZRhCX;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22638-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-22638-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-22638-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7a9f8a3a51fsi11881649a12.507.2024.07.30.01.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22638-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIxZRhCX;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22638-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-22638-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACDC9B28FAD
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 08:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8044194147;
	Tue, 30 Jul 2024 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GIxZRhCX"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3112B193097
	for <kvm@vger.kernel.org>; Tue, 30 Jul 2024 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722329924; cv=none; b=uWhnqG0WIZCJMILrakXQhIWJCV7Q/u1sQQAUafvJfTpXt7XuzTJvXWiC/pH6Y3m2B7prLTIcpuo1W4YOMo9aQ6YoRjZeOPXPkSVQra89Wf5wFbIhjrBLs9KQaRzUtvYvoP4PLBPtxncQYiXOPJnXi+GKf/0KD5N6NyU8ICQ71X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722329924; c=relaxed/simple;
	bh=buoqWu24ebRt/0jXk3H7ygOd68cU5vsbr8sfoqBvJRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/aeVbwym/Tt0aKQUaNmBP0GG+I1JQ4tNnS5t14FTxtrrZZLz0ytdXGJ82Vwfe29ZCVZcRGmh+ciDCHGvyi7dj20OxtGAKYVcGiuBLPTtu0ddmoMMUR9YzJBO8q7+8pe+Zy6kvFOW3NM5A4BcSLV/ax4R746dkA2lsyCmr5HVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GIxZRhCX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722329922;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQX8ZFMjIj2potml2FZBpjzLpa45uiXgT4fZjM+dvVI=;
	b=GIxZRhCXB2tukLPMST/ZzgRQkZtIclKxVxGS1F9qHJPFrSzlCaTabkaXahsCEPT5JLvQkF
	57EZoLrpCetXrSHfmKhRrtx4FLY3dS1Mue/LKfjb9GuV8FRuEMtn+cYUU4LY1rX/4vpPEz
	VyZnacbNk3Bwky/OxTr9ng7fJincV6w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-Ej_woTwqOdKkYDMrHSSCWw-1; Tue,
 30 Jul 2024 04:58:37 -0400
X-MC-Unique: Ej_woTwqOdKkYDMrHSSCWw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 716A41956064;
	Tue, 30 Jul 2024 08:58:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB0A41955D45;
	Tue, 30 Jul 2024 08:58:14 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:58:11 +0100
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
Subject: Re: [PATCH 10/18] qapi/crypto: Drop unwanted 'prefix'
Message-ID: <ZqirI3t9i6E6yltk@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-11-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730081032.1246748-11-armbru@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: Axq0kCN8vbqA

On Tue, Jul 30, 2024 at 10:10:24AM +0200, Markus Armbruster wrote:
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> QCryptoAkCipherKeyType has a 'prefix' that overrides the generated
> enumeration constants' prefix to QCRYPTO_AKCIPHER_KEY_TYPE.
> 
> Drop it.  The prefix becomes QCRYPTO_AK_CIPHER_KEY_TYPE.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/crypto.json                        |  1 -
>  backends/cryptodev-builtin.c            |  4 ++--
>  backends/cryptodev-lkcf.c               |  6 +++---
>  tests/bench/benchmark-crypto-akcipher.c |  2 +-
>  tests/unit/test-crypto-akcipher.c       | 28 ++++++++++++-------------
>  crypto/akcipher-gcrypt.c.inc            |  8 +++----
>  crypto/akcipher-nettle.c.inc            |  8 +++----
>  crypto/rsakey-builtin.c.inc             |  4 ++--
>  crypto/rsakey-nettle.c.inc              |  4 ++--
>  9 files changed, 32 insertions(+), 33 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

