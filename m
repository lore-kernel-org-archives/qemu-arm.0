Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1647104lfq;
        Mon, 28 Feb 2022 01:42:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlFCrB3kQY7olEBZeklWQ8E3nrf5X8gKMbRDsMwzsREyQQulcV3qzJe3Br7LOFtdke6VbZ
X-Received: by 2002:aa7:cd48:0:b0:410:6081:9cb with SMTP id v8-20020aa7cd48000000b00410608109cbmr18468220edw.361.1646041366928;
        Mon, 28 Feb 2022 01:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646041366; cv=none;
        d=google.com; s=arc-20160816;
        b=OHg7s7PV5DjGvfL8F25NO+eAGKA+7WaU5BVkD6ODF3HDTPIKn5ZMPZ0RZxTBMOSXM4
         YUSMEcLS5DmeHDwrxcIohSkm8lKOpfyqXf+q6/z4kHaK8F6H73L17yI1NzZXJpO4S12s
         ccFJOEsWDBtKh6qUbc9eNjddgF6KinwICnizyuAuuvKLA14iUoa159DatJgMG/okeSLj
         FXmcf3ER0N/446X1CKWexFaD0C59vRzbYWTuSnzRqB6QsRIuWXtIEXzRp1cDnP0gHaeC
         uvienkwEEi/RV9m1xngTtowfvh5W6sHURe3VXYNB3GRpsVLNJedoR/tMvLTSkgiogib1
         +kWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=zj4ORi+r6+QcDfeZvD6rIiq7dCuAx8mcjLOA14axWms=;
        b=OSwMvrNaDsRsliUmRpDd5kT6RP4niZNDuEXVDJ4X1cMO7lFZlMXA9mSDavtXdFTJtc
         Tf6pCgFXIvCSYht2c5H+V0xDhVMeKWUYMCFGNRv4YCoU8jh3kjRBr6sn9+TjV0WdPwJS
         iOFbqw5CcRqy5dKX20VtT2Ih9w0GVfUowDjdqaoB3tooHDd+WOcMnIoc49XoHKS5y5XG
         rxTKZYdpxWnEu/zYBXn6QBkhuLA6Kk5ys7iwYaI4lcuv5d9KyGveI18vyoO8bM8tnSNV
         vTsQ11bspvhbVvy8iE2OiS0IVeD05rxUiY1M13Vi4XpTzjwbpKsWGRUYFb7fO8xBXdoz
         1G5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QEijR9b7;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id e2-20020a50a682000000b0040f5d8d5e79si6363896edc.299.2022.02.28.01.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QEijR9b7;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646041365;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=zj4ORi+r6+QcDfeZvD6rIiq7dCuAx8mcjLOA14axWms=;
	b=QEijR9b7LYwCFQT5ofJOlTntT9MaEkoZ15ocYeaAYV6P9Bp92XOKHlwan1sVnfI+yITLKD
	Dn/hrvoREAV1UJ6xLcC67XwAM487dnBh1LAwHoNZsqpG3wD0t+Evp1zpBcX8zTjZYh6GTe
	WDV1d9YKezS4mQZtkVefKgMA+2WGztg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-cckYyu2GMi2AVlN5pBCsrw-1; Mon, 28 Feb 2022 04:42:42 -0500
X-MC-Unique: cckYyu2GMi2AVlN5pBCsrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFA47801DDB;
	Mon, 28 Feb 2022 09:42:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CBBC827AC;
	Mon, 28 Feb 2022 09:42:30 +0000 (UTC)
Date: Mon, 28 Feb 2022 09:42:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>, Greg Kurz <groug@kaod.org>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Alexandre Iooss <erdnaxe@crans.org>, qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH 1/9] Avocado GitLab CI jobs: don't reset TARGETS and
 simplify commands
Message-ID: <YhyZA2augINEEdr1@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-2-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225210156.2032055-2-crosa@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: ojNglLlEO9DZ

On Fri, Feb 25, 2022 at 04:01:48PM -0500, Cleber Rosa wrote:
> The Avocado tests rely on the TARGETS variable, which is computed
> based on the built targets.  The current set of commands on the
> inherited scripts section will reset those, leaving TARGETS empty and
> consequently the AVOCADO_CMDLINE_TAGS empty too.
> 
> This is causing the list of tests to have no filtering by tags, which
> can be seen by the large number of CANCEL/SKIP statuses (because of
> the lack of a matching qemu-system-$(ARCH) binary).
> 
> With this change, the TARGETS variable is properly computed, and so is
> the AVOCADO_CMDLINE_TAGS.  This causes a reduction in the number of
> tests attempted to be run on each job, and less noise on the test
> results.

This description isn't making sense to me.

AFAICT, none of the avocado-system-$DISTRO  jobs in buildtest.yml
are setting the $TARGETS variable before/after this change.

> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 3 +++
>  .gitlab-ci.d/buildtest.yml          | 9 ---------
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 2c7980a4f6..c038a0910f 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -64,6 +64,9 @@
>          du -chs ${CI_PROJECT_DIR}/avocado-cache ;
>        fi
>      - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
> +  script:
> +    - cd build
> +    - make check-avocado

The parent template has a 'script:' block we currently inherit 

    - scripts/git-submodule.sh update
        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
    - cd build
    - find . -type f -exec touch {} +
    # Avoid recompiling by hiding ninja with NINJA=":"
    - make NINJA=":" $MAKE_CHECK_ARGS

so replacing this is loosing the potential git submodule update
and looses the protection against recompilation.

I'm not seeing what in this old inherited is breaking the $TARGETS
variable, not least because it was never set before/after AFAICT.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
