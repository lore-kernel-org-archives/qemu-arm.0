Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp326631ejc;
        Wed, 25 Jan 2023 04:16:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsQBASrntCdVBdRpI1+ALIR+C+UQt1NM/58wGYgmv2QNxXrXxjP/KnjiF60eu/hrQe5Bd/f
X-Received: by 2002:a5b:4c2:0:b0:7f4:37a0:da7b with SMTP id u2-20020a5b04c2000000b007f437a0da7bmr17068390ybp.65.1674648961572;
        Wed, 25 Jan 2023 04:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674648961; cv=none;
        d=google.com; s=arc-20160816;
        b=hH3OnlL4DKzl/lhR1cW+6fabrDogLvN0rAoqvzok03Lxxf/gvlh0pLO6UU5GOcdVXx
         Bngk7K/TGYoYzFVffCDdmbAKZBtMr40VoPecodDsMbKvXm2dO5SOY5g7hYk7eR+xdyYI
         0UC9K/C6Ppg0DdYlXklMhFbH6h0k49AIXYNStLxgeZM8UJUWdKbvgyHCLgFbvnYRmOju
         aPZ3LOmH2XAUzrhAW2oxKO5gG1+DSy/79WSaxI6NqnoVfU4p7aH25FrZmKAAmuKTEek1
         eK5OrqT0qTPxccJ8OuMV+FP7pZxwqK+EMDokhBQLGXqCuq9u12Tv/4tat8M8T6+4voTg
         HtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=vXuHSJVEYIFR0qE/mFztaCrjX3OKedEb0eJY4virvX4=;
        b=Ixn3r77C5FFuFHmKr2z3OJienBljslVt6MT/4OdjC2PZ9XIjTIQ6GK7itg7wRVbv2A
         6ZkysMck8UJAlHsXk9kXj/Lh++EOv3zPxj/xdcVaoDT+1SF96HQC9cezMlgwm1mLwl1F
         VKMKyPnhZdvBj6SXZlUQTws7my49XqEfQ1f2n4fYxZNn1GHTr/kzY17l0vXCFsUBQK94
         TgTV8N58EOyJABcyIPWztNDLH2dwoWvWwQoKkTuu7Zzho3z+2dqkHmUCd24KCCjyaQhF
         5LMz3Z4fi3rOej6HCIRTVNFR9q71b8M4eddEKBkGAqETehU51o0Mfp/GH19lw4iXCTEv
         exeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QhEZ05N/";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n12-20020a25d60c000000b006eed48061f8si5944990ybg.202.2023.01.25.04.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 04:16:01 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QhEZ05N/";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674648961;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXuHSJVEYIFR0qE/mFztaCrjX3OKedEb0eJY4virvX4=;
	b=QhEZ05N/8wPS9r4OkF1jmNOQDr/cBWQERqIfkwetpvwx+9VxPjgrLEGWYZGMZRjokerWOq
	+vKmf2zXHwes39IY5DkIrMcRGw1mqIHeWQ7HXPyvkhfScwOBDVQ9lQd3ygSQ52x4jgh32/
	KQLSMAEtlUIml3rlYjLs3Oow7r/jeds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-tFhvqzzgPN68A4bnKdCR9Q-1; Wed, 25 Jan 2023 07:15:57 -0500
X-MC-Unique: tFhvqzzgPN68A4bnKdCR9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84C6587B2A1;
	Wed, 25 Jan 2023 12:15:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F68C15BAD;
	Wed, 25 Jan 2023 12:15:52 +0000 (UTC)
Date: Wed, 25 Jan 2023 12:15:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 02/35] gitlab: add FF_SCRIPT_SECTIONS for timings
Message-ID: <Y9EdduuXFEJGglpz@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230124180127.1881110-3-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: u85SKYzSwzaO

On Tue, Jan 24, 2023 at 06:00:54PM +0000, Alex Bennée wrote:
> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/base.yml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 69b36c148a..50fb59e147 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -6,6 +6,11 @@
>  # most restrictive to least restrictive
>  #
>  .base_job_template:
> +  variables:
> +    # Each script line from will be in a collapsible section in the job output
> +    # and show the duration of each line.
> +    FF_SCRIPT_SECTIONS: 1

Ooh, it is nice to learn about this. FWIW, I found it eventually
documented at

  https://docs.gitlab.com/runner/configuration/feature-flags.html

with a footnote indicating it si valid to set in the pipeline yaml
config, not only the runner.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
