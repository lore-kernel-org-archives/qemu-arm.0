Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5590104lfm;
        Wed, 26 May 2021 09:33:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8d9nPmo3rhPNIXCkU5AV9k9yofRQio5Yqx9UxaH4Pp8ErAVrah150BzxXassPMxVF5mWS
X-Received: by 2002:a17:906:11cc:: with SMTP id o12mr33884838eja.547.1622046826967;
        Wed, 26 May 2021 09:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622046826; cv=none;
        d=google.com; s=arc-20160816;
        b=OyZfhBw6sV/FzXf5AzFpOwPqHXjgs1MVlRJ0I62HbqbxdkrmQkSbluDg6/9rbBVsG9
         xZE45ONyu/a5Bzy8kuODTZ0IEPBSLPMaZ8wKrXp/64FS7xpdMIz3U5WhR3XKxxkyt/2e
         AaZ0UlOy+stAUotTFnkVPdgACRgCVaE/WxQOIfe2WOTB38bYPOKbWUaS+kvT8SP3vxc/
         gTGTrovHXtjEr1GHb62Nx7gzQ9v+Zs833HrkKNIKrut5EjNCFRVT6tOEej+m2yW+63DW
         GP2FjG6dVY7Oo1tQNhSyWJxNBCOMcsgyyQg1g0L44DoHYJHh3TEL0Gl8L4LhyUSbD3Va
         9kyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+8DfRYpfdanrqAB/wuirJR62lU9KY6YLBGRcjSyK7RU=;
        b=qi9MoYXO3od3wPMTip1BvMmYEZQ+ZOSecRDOMfV5ri+4zv4JXHfZbfEuzNktnsZWTK
         2v0WIycKMzcoHn4gmec4jQIJUSTNI+AaVhYWw+S3kbfmsN9rk6imwSUFvvQArJsoByPW
         WD1C2VVL07r1pB4X+THuf8OZXm7STuZHpYqJiAs0yBnienD+7EvQGCjwpnA2PammWCeB
         6Z58gcXY5UUQET2rq+esnIDlkRtUHao4obrkQHhBH7ODf11lGKMafi/m+66HfJs75Lpv
         93OZ3rK04l+srtc/Wmy1yn2VNMpe85Tzlj9bHMrMpbXONlz2soKda8CcD9amhDt/r1r1
         AZmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g5FzWEG4;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i9si17545717edb.271.2021.05.26.09.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 09:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g5FzWEG4;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622046826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8DfRYpfdanrqAB/wuirJR62lU9KY6YLBGRcjSyK7RU=;
	b=g5FzWEG4m0PmXwUSypjCjJhwMbbwxqzXhnERfg6USJ+6BoZ2jirbTm8Gd6Sqe1qMsxGrsj
	oneH+lsjTlgmTGroTtbu0woVIASrjTArZQ6Z4u3NvZZethIN/+lw3JaDSJ/GH1dudXkAKR
	2OdT+CPRycAPDeFZZNF/xmJMO5F7EJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-tIGEffeTPfGM7jL1NIMpFA-1; Wed, 26 May 2021 12:33:43 -0400
X-MC-Unique: tIGEffeTPfGM7jL1NIMpFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5405E107ACE3;
	Wed, 26 May 2021 16:33:41 +0000 (UTC)
Received: from [10.36.112.15] (ovpn-112-15.ams2.redhat.com [10.36.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 239A25C3E9;
	Wed, 26 May 2021 16:33:38 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v2 4/4] arm64: split
 its-migrate-unmapped-collection into KVM and TCG variants
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, kvm@vger.kernel.org
Cc: shashi.mallela@linaro.org, alexandru.elisei@arm.com, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com, maz@kernel.org
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-5-alex.bennee@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5fe1c796-c886-e5c6-6e61-e12d0f73a884@redhat.com>
Date: Wed, 26 May 2021 18:33:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210525172628.2088-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-TUID: 2kul+qwlwqsU

Hi Alex,

On 5/25/21 7:26 PM, Alex Bennée wrote:
> When running the test in TCG we are basically running on bare metal so
> don't rely on having a particular kernel errata applied.
> 
> You might wonder why we handle this with a totally new test name
> instead of adjusting the append to take an extra parameter? Well the
> run_migration shell script uses eval "$@" which unwraps the -append
> leading to any second parameter being split and leaving QEMU very
> confused and the test hanging. This seemed simpler than re-writing all
> the test running logic in something sane ;-)

there is
lib/s390x/vm.h:bool vm_is_tcg(void)

but I don't see any particular ID we could use to differentiate both the
KVM and the TCG mode, do you?

without a more elegant solution,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  arm/gic.c         |  8 +++++++-
>  arm/unittests.cfg | 10 +++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arm/gic.c b/arm/gic.c
> index bef061a..0fce2a4 100644
> --- a/arm/gic.c
> +++ b/arm/gic.c
> @@ -36,6 +36,7 @@ static struct gic *gic;
>  static int acked[NR_CPUS], spurious[NR_CPUS];
>  static int irq_sender[NR_CPUS], irq_number[NR_CPUS];
>  static cpumask_t ready;
> +static bool under_tcg;
>  
>  static void nr_cpu_check(int nr)
>  {
> @@ -834,7 +835,7 @@ static void test_migrate_unmapped_collection(void)
>  		goto do_migrate;
>  	}
>  
> -	if (!errata(ERRATA_UNMAPPED_COLLECTIONS)) {
> +	if (!errata(ERRATA_UNMAPPED_COLLECTIONS) && !under_tcg) {
>  		report_skip("Skipping test, as this test hangs without the fix. "
>  			    "Set %s=y to enable.", ERRATA_UNMAPPED_COLLECTIONS);
>  		test_skipped = true;
> @@ -1005,6 +1006,11 @@ int main(int argc, char **argv)
>  		report_prefix_push(argv[1]);
>  		test_migrate_unmapped_collection();
>  		report_prefix_pop();
> +	} else if (!strcmp(argv[1], "its-migrate-unmapped-collection-tcg")) {
> +		under_tcg = true;
> +		report_prefix_push(argv[1]);
> +		test_migrate_unmapped_collection();
> +		report_prefix_pop();
>  	} else if (strcmp(argv[1], "its-introspection") == 0) {
>  		report_prefix_push(argv[1]);
>  		test_its_introspection();
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 1a39428..adc1bbf 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -205,7 +205,7 @@ extra_params = -machine gic-version=3 -append 'its-pending-migration'
>  groups = its migration
>  arch = arm64
>  
> -[its-migrate-unmapped-collection]
> +[its-migrate-unmapped-collection-kvm]
>  file = gic.flat
>  smp = $MAX_SMP
>  accel = kvm
> @@ -213,6 +213,14 @@ extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
>  groups = its migration
>  arch = arm64
>  
> +[its-migrate-unmapped-collection-tcg]
> +file = gic.flat
> +smp = $MAX_SMP
> +accel = tcg
> +extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection-tcg'
> +groups = its migration
> +arch = arm64
> +
>  # Test PSCI emulation
>  [psci]
>  file = psci.flat
> 
