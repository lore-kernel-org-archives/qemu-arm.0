Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3937068lfm;
        Tue, 1 Jun 2021 12:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ2u4lwY3FzkMaqmQQu0D0vigMvQ5lKk47A/DW5QI/+qS7OR0MLDhN4LosY7essYbkEC2s
X-Received: by 2002:a05:6402:22f3:: with SMTP id dn19mr14420462edb.240.1622576815483;
        Tue, 01 Jun 2021 12:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622576815; cv=none;
        d=google.com; s=arc-20160816;
        b=y677O8hwV5i0IrG/rs+egldMJQ5U+wOC7A2ir3zdfC1y8JlLND9F288+v+BmuNKSwt
         26fDwj8j/iopHWb9mVGUfqed1OG/4rLvtWeMPRgtih4JnCzKFh9dO69GV/kBKNPb3ETg
         Nu4zAyfPomtCg55OGxd9BWgbRpgdxibZIMt3Tq9ni2C/20/3R2gRnOuVRhy2XM4oqz4U
         vOq22Ir0Fmk7dWNLff320QO9KKxyn9ATIEILIwMz95YxfjwPWhGBEn2sDaFgDyTXahyQ
         rbKxs5by9R6Z4VfM8QK2okMxMjNz5iU2ChIde9ExnNlql7cLYayT2ZKDYAAKz+44lh38
         gcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=mFg6dKRGX05/OpUoApdspKMfiFJcRvSvkAxKURmBAyQ=;
        b=nMQQEWvGHHiOUuOIvVH2rJcsZ/uLs6Gu7foMrRCu4bHM6xTL1Rl3qs3FNyOnvsaoIC
         D8a4i/OP5jVT1ijvSsph0aaz6KfidQE4sgIVzrjb/ULVCMmlDZea8htKFgbb5TZBYLEK
         FndQ/HLBdRw5S9uzHXy7/QkeC67PhwoJc5vqmXJySOYvPGQNDQirlYrcBKoWLMk7uvUA
         enEGpNaaK8t7omDY2xrnSqsmJxGO7B30Pbm/n1sjqptfgGorMtbP+S8wutLRuBj7ln81
         of7xmKE1NDbfsDj+bS1f80XfOxhcGKyXtiyGkiilM1jmKwhdEdR6V1anbgfXoRKIHBRi
         AffA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dsQKmVl5;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id jx13si9440296ejc.576.2021.06.01.12.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 12:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dsQKmVl5;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622576814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFg6dKRGX05/OpUoApdspKMfiFJcRvSvkAxKURmBAyQ=;
	b=dsQKmVl53EZQbqwpF4+a5WTZBuWzTLjK19hLIGfW3O5afr6ZvNvNEJv8UxMlJpFhvfyKnL
	4wlsYMoljcXpklLPdrp+v+HoA3L3Kc1V7d3P94jMNAzC4Osmkb3SNKMiqIolqmwyPx5dhC
	Flb6fn06Svlh8LmJb1JAq5BOCyijgHM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-r21LVOP_PGyEhjLNK3u75A-1; Tue, 01 Jun 2021 15:46:52 -0400
X-MC-Unique: r21LVOP_PGyEhjLNK3u75A-1
Received: by mail-ej1-f72.google.com with SMTP id am5-20020a1709065685b02903eef334e563so53661ejc.2
        for <alex.bennee@linaro.org>; Tue, 01 Jun 2021 12:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mFg6dKRGX05/OpUoApdspKMfiFJcRvSvkAxKURmBAyQ=;
        b=FiBPzNw4Njba3yCupRoezvVyl5HiLAZfXCROx7hgnGkEM1gqSperquy6TqyufJyM29
         19B76P2KtHQF4H/RKxb5ZhyAmqeT4hk2xKOrWQ0yXBptZ3nVIF7B5zqzFF2WaxTFFS1l
         DpnVeFZJDtnTu12OEE/2Z7fX1tgFSCibxPlS13T/cZoUU2oCms1CCvEINiNWJ6kyWScU
         BHnAh5oAU412Y1rJgvn3I3bi5MTyZPSY13Sy+ogYItoM5wSQ48SS2qSMJP55VOaRUAkT
         Qdnon4rFgFAozZ8VKVs/ViUSN7ON1Kn8ciXId4Ir173OdUPt8K9lLyIeshqlQ+tGYPJK
         I7qg==
X-Gm-Message-State: AOAM5321/zddmKEY7Ps1hm6pzXCKJTZVGy9mMlU52JHVMYXm62N7DXmQ
	YRrR3ZZpfbf1JU42V/KEUSjHUNP48AuMN0GPxy+5Iw2lvwMZuDbrER7bTMQo+y8UTpJlOBkndzt
	C/RPzuNtSn6mCHq1uHGkAJKR4WoKXSZBefD11W1JXTfSZXHKe42VJbku/EAsZSj06+cE=
X-Received: by 2002:a05:6402:1d0c:: with SMTP id dg12mr11032450edb.155.1622576810830;
        Tue, 01 Jun 2021 12:46:50 -0700 (PDT)
X-Received: by 2002:a05:6402:1d0c:: with SMTP id dg12mr11032429edb.155.1622576810607;
        Tue, 01 Jun 2021 12:46:50 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
        by smtp.gmail.com with ESMTPSA id v1sm7546424ejw.117.2021.06.01.12.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 12:46:50 -0700 (PDT)
Date: Tue, 1 Jun 2021 21:46:48 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Auger Eric <eric.auger@redhat.com>, kvm@vger.kernel.org, maz@kernel.org,
	shashi.mallela@linaro.org, qemu-arm@nongnu.org,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v2 4/4] arm64: split
 its-migrate-unmapped-collection into KVM and TCG variants
Message-ID: <20210601194648.fdymtxiz6lkxycsx@gator.home>
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-5-alex.bennee@linaro.org>
 <5fe1c796-c886-e5c6-6e61-e12d0f73a884@redhat.com>
 <87sg21bk7r.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87sg21bk7r.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: 4EeLdyxnZJ2C

On Tue, Jun 01, 2021 at 05:49:01PM +0100, Alex Bennée wrote:
> 
> Auger Eric <eric.auger@redhat.com> writes:
> 
> > Hi Alex,
> >
> > On 5/25/21 7:26 PM, Alex Bennée wrote:
> >> When running the test in TCG we are basically running on bare metal so
> >> don't rely on having a particular kernel errata applied.
> >> 
> >> You might wonder why we handle this with a totally new test name
> >> instead of adjusting the append to take an extra parameter? Well the
> >> run_migration shell script uses eval "$@" which unwraps the -append
> >> leading to any second parameter being split and leaving QEMU very
> >> confused and the test hanging. This seemed simpler than re-writing all
> >> the test running logic in something sane ;-)
> >
> > there is
> > lib/s390x/vm.h:bool vm_is_tcg(void)
> >
> > but I don't see any particular ID we could use to differentiate both the
> > KVM and the TCG mode, do you?
> 
> For -cpu max we do:
> 
>         /*
>          * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
>          * one and try to apply errata workarounds or use impdef features we
>          * don't provide.
>          * An IMPLEMENTER field of 0 means "reserved for software use";
>          * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
>          * to see which features are present";
>          * the VARIANT, PARTNUM and REVISION fields are all implementation
>          * defined and we choose to define PARTNUM just in case guest
>          * code needs to distinguish this QEMU CPU from other software
>          * implementations, though this shouldn't be needed.
>          */
>         t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
>         t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
>         t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
>         t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
>         t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
>         cpu->midr = t;
> 
> However for the default -cpu cortex-a57 we aim to look just like the
> real thing - only without any annoying micro-architecture bugs ;-)
> 
> >
> > without a more elegant solution,
> 
> I'll look into the suggestion made by Richard.

Where did Richard make a suggestion? And what is it?

Thanks,
drew

> 
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> >
> > Thanks
> >
> > Eric
> >
> >
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> >> ---
> >>  arm/gic.c         |  8 +++++++-
> >>  arm/unittests.cfg | 10 +++++++++-
> >>  2 files changed, 16 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/arm/gic.c b/arm/gic.c
> >> index bef061a..0fce2a4 100644
> >> --- a/arm/gic.c
> >> +++ b/arm/gic.c
> >> @@ -36,6 +36,7 @@ static struct gic *gic;
> >>  static int acked[NR_CPUS], spurious[NR_CPUS];
> >>  static int irq_sender[NR_CPUS], irq_number[NR_CPUS];
> >>  static cpumask_t ready;
> >> +static bool under_tcg;
> >>  
> >>  static void nr_cpu_check(int nr)
> >>  {
> >> @@ -834,7 +835,7 @@ static void test_migrate_unmapped_collection(void)
> >>  		goto do_migrate;
> >>  	}
> >>  
> >> -	if (!errata(ERRATA_UNMAPPED_COLLECTIONS)) {
> >> +	if (!errata(ERRATA_UNMAPPED_COLLECTIONS) && !under_tcg) {
> >>  		report_skip("Skipping test, as this test hangs without the fix. "
> >>  			    "Set %s=y to enable.", ERRATA_UNMAPPED_COLLECTIONS);
> >>  		test_skipped = true;
> >> @@ -1005,6 +1006,11 @@ int main(int argc, char **argv)
> >>  		report_prefix_push(argv[1]);
> >>  		test_migrate_unmapped_collection();
> >>  		report_prefix_pop();
> >> +	} else if (!strcmp(argv[1], "its-migrate-unmapped-collection-tcg")) {
> >> +		under_tcg = true;
> >> +		report_prefix_push(argv[1]);
> >> +		test_migrate_unmapped_collection();
> >> +		report_prefix_pop();
> >>  	} else if (strcmp(argv[1], "its-introspection") == 0) {
> >>  		report_prefix_push(argv[1]);
> >>  		test_its_introspection();
> >> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> >> index 1a39428..adc1bbf 100644
> >> --- a/arm/unittests.cfg
> >> +++ b/arm/unittests.cfg
> >> @@ -205,7 +205,7 @@ extra_params = -machine gic-version=3 -append 'its-pending-migration'
> >>  groups = its migration
> >>  arch = arm64
> >>  
> >> -[its-migrate-unmapped-collection]
> >> +[its-migrate-unmapped-collection-kvm]
> >>  file = gic.flat
> >>  smp = $MAX_SMP
> >>  accel = kvm
> >> @@ -213,6 +213,14 @@ extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
> >>  groups = its migration
> >>  arch = arm64
> >>  
> >> +[its-migrate-unmapped-collection-tcg]
> >> +file = gic.flat
> >> +smp = $MAX_SMP
> >> +accel = tcg
> >> +extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection-tcg'
> >> +groups = its migration
> >> +arch = arm64
> >> +
> >>  # Test PSCI emulation
> >>  [psci]
> >>  file = psci.flat
> >> 
> 
> 
> -- 
> Alex Bennée
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
