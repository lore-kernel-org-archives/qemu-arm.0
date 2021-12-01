Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6214693lfk;
        Wed, 1 Dec 2021 08:41:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypkniFPgLkJxkKQxN5/JnkStJ7uJAUQVaEGsIkH5gQOL+XkxFPST0BGEPVd5piBdWRLcc7
X-Received: by 2002:a05:6402:653:: with SMTP id u19mr9832288edx.106.1638376867867;
        Wed, 01 Dec 2021 08:41:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638376867; cv=none;
        d=google.com; s=arc-20160816;
        b=DclBhKf3u5WkL9ild5s7684PmSvi9uU4QEg+pgV0bD+/dNny4f6uhmnMKj+eBDfWPC
         srlxDXO0cmOBZ0nOpLE9HMP2FZ48pszobxrNdXRnydK1qfNFrtCN9N5btRwiZdOm6O0d
         /fbexEiJKKflzPe+P+Gf2WxJsAEfMMaXckgv7pHicYhLKjkSQkeFDA2eAJdyUW1hfDdq
         rJWADMhxmaPGW9vHIF7Ss+XHujs21bmMadXGz0nEPbMsBe1jENzKyJNu41WURQikdsrF
         3agjutlhyC1a/03bmFQ1VdvWQubx9b7/roWK5o49ANv5So9NPtIJL3b9mNtkPTaiu3Vn
         wE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=SnH7pitgX4lHmYlmAxxzezWYSXvVY830GNF3XqnXOcQ=;
        b=YQtwGy8ReaYTqeFFa2SApe4l1bkHObKTZkzqVqIVHQu0sODjwVaAOGStyi2Va3FLeE
         4K+d8cKI6qubrqFx1TkBW80MjGAnbQ2q6vlAfzheaYcsHWg5cjYVKxt4B/roH0dBrBkP
         Kvdds9K90HYhbN0TkXpA8mNxEVnL/eX6HtK8xZ3LOBsTfta9B0mFss9fEy6G9aX3JUeB
         E0fV7eMl3aBwTDerMdyKf8tAtH5pZ+YojW1S1P9FOpBisVDX0ZF6823kFENW8UolSr0B
         XN/iSZgbO91HMUd40qKeMtIvEqL4z8xtDyPtsgxp76HeBCSoWq+jzobBIgOVyS5NbvQ8
         nnHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CGzh5whj;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dz9si491636edb.349.2021.12.01.08.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Dec 2021 08:41:07 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CGzh5whj;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638376866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnH7pitgX4lHmYlmAxxzezWYSXvVY830GNF3XqnXOcQ=;
	b=CGzh5whjJ7q3ePFVaPG5/oFoFm6Jj4DE9fkrgTSYONeE1w3jU0HJDlRYAmy5lLZIU/Swhk
	IlncOtRsXUl2n+0l20B9HatMlAzxD2i2p7hy+ex8E5wwDhyoe+eWFUmy+jhd1Ph2FlvL/n
	fh232Wrgkcj7Pawjf+joGyx5NzLyQ/o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-G2h8UycxMfmQUMDYeqIOmA-1; Wed, 01 Dec 2021 11:41:05 -0500
X-MC-Unique: G2h8UycxMfmQUMDYeqIOmA-1
Received: by mail-ed1-f69.google.com with SMTP id b15-20020aa7c6cf000000b003e7cf0f73daso20777656eds.22
        for <alex.bennee@linaro.org>; Wed, 01 Dec 2021 08:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SnH7pitgX4lHmYlmAxxzezWYSXvVY830GNF3XqnXOcQ=;
        b=fQ3JPl+6+SifhXPqipakJwbN/AwRA3Tp4iRB/aqfFN7r7bnnMeR2WOwbi0chGDuJZ9
         xb5yYK0m5f+rTVYUR218+wL7kqwdg5Z8YOv5KCfUnf4BV7LelIythAvoIYi22BBAvGRY
         M4Ln1ng/azeU2JmuIWdVY0eFVDbBY6vJLrl5NYsu++WSVi1aZkLPOUQnu3FLaBHoCO2F
         qBaOhNl1gM0uuUWWNuQVFLVyAMvxoBLlSjZE0+wNT3pyRhrRR3T6DPSd6HJ6OXyYqxsk
         jvALQBEjNIP7hmdzeehu6ADtdKHxwbCj2lXjG7svEgRkkVV4oi1CnXCHQUFzW8S5/sI5
         p2nw==
X-Gm-Message-State: AOAM530pgKiikvmD27NzyPz5zPk2GSwl+5rtwts2usipe8lM/PDbPR4O
	t5GOGtj0wpkdw4Xk7Q652WggfKHhHdmybClxh57fa6ugKRvTJYpuVOWaNN4D1IauH7Qtyvm7Kbu
	7aiile6Pd5QbC0MhfbmP4tzieaoNIcN0u6ajSEDTuHIgIh4TawxxV7UTjzLncdjxGWFM=
X-Received: by 2002:a17:907:7e96:: with SMTP id qb22mr8301428ejc.469.1638376864290;
        Wed, 01 Dec 2021 08:41:04 -0800 (PST)
X-Received: by 2002:a17:907:7e96:: with SMTP id qb22mr8301380ejc.469.1638376863918;
        Wed, 01 Dec 2021 08:41:03 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id s4sm174995ejn.25.2021.12.01.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:02 -0800 (PST)
Date: Wed, 1 Dec 2021 17:41:00 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-arm@nongnu.org,
	idan.horowitz@gmail.com, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v8 04/10] run_tests.sh: add --config
 option for alt test set
Message-ID: <20211201164100.57ima4v5ppqojmu7@gator>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
 <20211118184650.661575-5-alex.bennee@linaro.org>
 <20211124164859.4enqimrptr3pfdkp@gator>
 <87o860xpkr.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87o860xpkr.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: QGfXpSZZp6b6

On Wed, Dec 01, 2021 at 04:20:02PM +0000, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > On Thu, Nov 18, 2021 at 06:46:44PM +0000, Alex Bennée wrote:
> >> The upcoming MTTCG tests don't need to be run for normal KVM unit
> >> tests so lets add the facility to have a custom set of tests.
> >
> > I think an environment variable override would be better than this command
> > line override, because then we could also get mkstandalone to work with
> > the new unittests.cfg files. Or, it may be better to just add them to
> > the main unittests.cfg with lines like these
> >
> > groups = nodefault mttcg
> > accel = tcg
> >
> > That'll "dirty" the logs with SKIP ... (test marked as manual run only)
> > for each one, but at least we won't easily forget about running them from
> > time to time.
> 
> So what is the meaning of accel here? Is it:
> 
>   - this test only runs on accel FOO
> 
> or
> 
>   - this test defaults to running on accel FOO
> 
> because while the tests are for TCG I want to run them on KVM (so I can
> validate the test on real HW). If I have accel=tcg then:
> 
>   env ACCEL=kvm QEMU=$HOME/lsrc/qemu.git/builds/all/qemu-system-aarch64 ./run_tests.sh -g mttcg
>   SKIP tlbflush-code::all_other (tcg only, but ACCEL=kvm)
>   SKIP tlbflush-code::page_other (tcg only, but ACCEL=kvm)
>   SKIP tlbflush-code::all_self (tcg only, but ACCEL=kvm)
>   ...
> 
> so I can either drop the accel line and rely on nodefault to ensure it
> doesn't run normally or make the env ACCEL processing less anal about
> preventing me running TCG tests under KVM. What do you think?

Just drop the 'accel = tcg' line. I only suggested it because I didn't
know you also wanted to run the MTTCG "specific" tests under KVM. Now,
that I do, I wonder why we wouldn't run them all the time, i.e. no
nodefault group? Do the tests not exercise enough hypervisor code to
be worth the energy used to run them?

Thanks,
drew
