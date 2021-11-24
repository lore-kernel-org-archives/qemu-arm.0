Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp10729088lfk;
        Wed, 24 Nov 2021 08:15:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPgJhA9EU5VBX0NrOv/unQkt4hlBIV3b4oBewq57Rkk2BvK3iunZiz+I+RlSOWp43/teMd
X-Received: by 2002:a1f:3807:: with SMTP id f7mr1492415vka.28.1637770498994;
        Wed, 24 Nov 2021 08:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637770498; cv=none;
        d=google.com; s=arc-20160816;
        b=Au16GsknrsHorBlB5QERqy0YU4xrFnfZEDpMEC+3IsyV0RG2zsWj9+uOFcdRkEZpEu
         crZZWwAIKM9BiRZBObYyS+7/oD+vTkfxeROfR2XmFOO3bZZyj5ibiuA80Bgxgu+rvNwB
         utjxhPwuNziuPo6g8c2H7EHApzplaxmW3psIuIcr7GrxGkPd9GW0R+9GwhnCs9l+pLHJ
         iiW6Y6cRD/HkvSvXKSYwJ9t0V3ji3AjWrjIDRQlKRuyv0fwAI5a92KVLqmT52SuptjOo
         8aUHlAG8Q+KYroMlFcULmu427zhNGIaNxRiia44DPvGJk10hpIMjyfqzl2h2Uzsp1zFh
         yuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=mJrAXo0yOwYDhqzWJltPdXBtYsqn5jxXKwheMp22Ick=;
        b=RPmQs5Uf3hd/PClaJFgc1sX5+W+nN2VWBxe0LyeCbrpbBbm5ejOtYOSiQ23LftwrXL
         sfk/68M2hMz+enpJDDTmD+Eo6SJz5bYlVV7p3w4P6v1jF/kfkEdO2bpJc8I1fFxXmaLv
         cVRMjPMYAN9dHrRCYp7sbheWiOxaz9WFC+il3TgbBizAa65UXa9cAG19FqZU/pk3EKgt
         rKrN/IlQXSHzE2XkfQOxk5POCU11rnVf0eS05CuguRZdGCK161WMHVzO/91NKYK5MWRS
         dKsIHgYn6q5kH3yu9tirpyHdj6lUB6/NVT2ogA4XGj34nlNMc9sKBae8qYf4rLN9Peo3
         AOoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KSYP4Kse;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f142si296879vkf.185.2021.11.24.08.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:14:58 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KSYP4Kse;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637770497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJrAXo0yOwYDhqzWJltPdXBtYsqn5jxXKwheMp22Ick=;
	b=KSYP4Ksema3QDuI4H+r1I3D/4mQKiSE0y4UR1/xEpVRfL3a8oFnR6qxoC+voiQNNX3Hjcg
	6JC1Jo9J6YdW/1mPinzHdxyOEkmuQzmRmdWdVI1YJuNr1S8qPWSVoZCu21f+CeiDSC5Nd5
	z31zeEQqlgyooMOS28HGXQgPEuyYlJ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-cNAgct4ZMcKNP9_8_e4Jsw-1; Wed, 24 Nov 2021 11:14:56 -0500
X-MC-Unique: cNAgct4ZMcKNP9_8_e4Jsw-1
Received: by mail-wm1-f70.google.com with SMTP id 69-20020a1c0148000000b0033214e5b021so1570261wmb.3
        for <alex.bennee@linaro.org>; Wed, 24 Nov 2021 08:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mJrAXo0yOwYDhqzWJltPdXBtYsqn5jxXKwheMp22Ick=;
        b=hsb4luZ11e4nORxESxZbYiv7s9kLuad34EejovD6P2IqkEK1L+nG8AjUlDEI81g4ju
         bW54wzBynNy9Tex2rH0YswrgJXGxNo5hueaf8/VfjcQoBH0wQ33xDaQc+mBjZBST+P7g
         G4luETOb2fo58v/cJDc3YW9UtCr7Ir23zm3eoybukBNxRS4tX1Uf1K1FeHNX6SGbqmmm
         3X21QnLDmfBb7X6+LRmwVGtTfKOaoQ4HnyA50Whe2n86sgFp3qZ4+omq+KuGv8XIG1kK
         W01suVz/OwhvVvPKkv71K1M1Sip07+C+tCCimolaPXIVRKRlWzkpDMJSXVrgII9Tw9yY
         FByA==
X-Gm-Message-State: AOAM531IDcft3sSsUyC7zN64Fp+ts43rtFgTyWfL7jlKizun6OpYw4HJ
	3S3tio+xG29S/omMPiVc49eFefkXsRDNJ3ZQpviyLVgaaVlK0hOU/3GhnjAO6b0QdXbLamhlAnb
	7zbzjXW4KlXujw1oLLwhE3C366EmacdAuh00obb5zHl5ab/djPmod62LUAmPKbktFR7c=
X-Received: by 2002:a1c:448b:: with SMTP id r133mr17043689wma.85.1637770495496;
        Wed, 24 Nov 2021 08:14:55 -0800 (PST)
X-Received: by 2002:a1c:448b:: with SMTP id r133mr17043615wma.85.1637770495102;
        Wed, 24 Nov 2021 08:14:55 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id b6sm5303470wmq.45.2021.11.24.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 08:14:54 -0800 (PST)
Date: Wed, 24 Nov 2021 17:14:53 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>, maz@kernel.org,
	qemu-arm@nongnu.org, idan.horowitz@gmail.com,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v8 08/10] arm/barrier-litmus-tests: add
 simple mp and sal litmus tests
Message-ID: <20211124161453.aqkcykcfq5gphvzw@gator>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
 <20211118184650.661575-9-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211118184650.661575-9-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: P9+KPJP/gIFM

On Thu, Nov 18, 2021 at 06:46:48PM +0000, Alex Bennée wrote:
> This adds a framework for adding simple barrier litmus tests against
> ARM. The litmus tests aren't as comprehensive as the academic exercises
> which will attempt to do all sorts of things to keep racing CPUs synced
> up. These tests do honour the "sync" parameter to do a poor-mans
> equivalent.
> 
> The two litmus tests are:
>   - message passing
>   - store-after-load
> 
> They both have case that should fail (although won't on single-threaded
> TCG setups). If barriers aren't working properly the store-after-load
> test will fail even on an x86 backend as x86 allows re-ording of non
> aliased stores.
> 
> I've imported a few more of the barrier primatives from the Linux source
> tree so we consistently use macros.
> 
> The arm64 barrier primitives trip up on -Wstrict-aliasing so this is
> disabled in the Makefile.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> CC: Will Deacon <will@kernel.org>
> 
> ---
> v8
>   - move to mttcgtests.cfg
>   - fix checkpatch issues
>   - fix report usage
> v7
>   - merge in store-after-load
>   - clean-up sync-up code
>   - use new counter api
>   - fix xfail for sal test
> v6
>   - add a unittest.cfg
>   - -fno-strict-aliasing
> ---
>  arm/Makefile.common       |   1 +
>  lib/arm/asm/barrier.h     |  61 ++++++
>  lib/arm64/asm/barrier.h   |  50 +++++
>  arm/barrier-litmus-test.c | 450 ++++++++++++++++++++++++++++++++++++++
>  arm/mttcgtests.cfg        |  33 +++
>  5 files changed, 595 insertions(+)
>  create mode 100644 arm/barrier-litmus-test.c
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index f905971..861e5c7 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -13,6 +13,7 @@ tests-common += $(TEST_DIR)/sieve.flat
>  tests-common += $(TEST_DIR)/pl031.flat
>  tests-common += $(TEST_DIR)/tlbflush-code.flat
>  tests-common += $(TEST_DIR)/locking-test.flat
> +tests-common += $(TEST_DIR)/barrier-litmus-test.flat
>  
>  tests-all = $(tests-common) $(tests)
>  all: directories $(tests-all)
> diff --git a/lib/arm/asm/barrier.h b/lib/arm/asm/barrier.h
> index 7f86831..2870080 100644
> --- a/lib/arm/asm/barrier.h
> +++ b/lib/arm/asm/barrier.h
> @@ -8,6 +8,8 @@
>   * This work is licensed under the terms of the GNU GPL, version 2.
>   */
>  
> +#include <stdint.h>
> +
>  #define sev()		asm volatile("sev" : : : "memory")
>  #define wfe()		asm volatile("wfe" : : : "memory")
>  #define wfi()		asm volatile("wfi" : : : "memory")
> @@ -25,4 +27,63 @@
>  #define smp_rmb()	smp_mb()
>  #define smp_wmb()	dmb(ishst)
>  
> +extern void abort(void);
> +
> +static inline void __write_once_size(volatile void *p, void *res, int size)
> +{
> +	switch (size) {
> +	case 1: *(volatile uint8_t *)p = *(uint8_t *)res; break;
> +	case 2: *(volatile uint16_t *)p = *(uint16_t *)res; break;
> +	case 4: *(volatile uint32_t *)p = *(uint32_t *)res; break;
> +	case 8: *(volatile uint64_t *)p = *(uint64_t *)res; break;
> +	default:
> +		/* unhandled case */
> +		abort();
> +	}
> +}
> +
> +#define WRITE_ONCE(x, val) \
> +({							\
> +	union { typeof(x) __val; char __c[1]; } __u =	\
> +		{ .__val = (typeof(x)) (val) }; \
> +	__write_once_size(&(x), __u.__c, sizeof(x));	\
> +	__u.__val;					\
> +})
> +
> +#define smp_store_release(p, v)						\
> +do {									\
> +	smp_mb();							\
> +	WRITE_ONCE(*p, v);						\
> +} while (0)
> +
> +
> +static inline
> +void __read_once_size(const volatile void *p, void *res, int size)
> +{
> +	switch (size) {
> +	case 1: *(uint8_t *)res = *(volatile uint8_t *)p; break;
> +	case 2: *(uint16_t *)res = *(volatile uint16_t *)p; break;
> +	case 4: *(uint32_t *)res = *(volatile uint32_t *)p; break;
> +	case 8: *(uint64_t *)res = *(volatile uint64_t *)p; break;
> +	default:
> +		/* unhandled case */
> +		abort();
> +	}
> +}
> +
> +#define READ_ONCE(x)							\
> +({									\
> +	union { typeof(x) __val; char __c[1]; } __u;			\
> +	__read_once_size(&(x), __u.__c, sizeof(x));			\
> +	__u.__val;							\
> +})


WRITE_ONCE and READ_ONCE are already defined in lib/linux/compiler.h

Thanks,
drew
