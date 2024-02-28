Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp40942dlb;
        Tue, 27 Feb 2024 22:30:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXen6NEltms98vfU9fK+L8m2PjPOzuk+YyKI4Ww901QQjtes5lv2zT6jeiI7OoKbm90x8ItCvf9JkYepJ6tF/vJjOKxW+w6
X-Google-Smtp-Source: AGHT+IGv3lxdGwUXF9m9bQ50CLrvnqGV1/PN1yXnUlgehcHSP/tQC0+bb6aPYn+femGVMtVouqW4
X-Received: by 2002:a05:620a:5e11:b0:787:bdc5:7cb0 with SMTP id xz17-20020a05620a5e1100b00787bdc57cb0mr4259480qkn.3.1709101803099;
        Tue, 27 Feb 2024 22:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709101803; cv=none;
        d=google.com; s=arc-20160816;
        b=gv5ZPtNioH7hRo9/cYDurqg/+xEkxxh8lVjeM+kj54e34f5w5u03uo268IpB1Qf1Za
         tw0ACzWchq2t//nIMf53Y18RDPvYxhJXcBgoQA7Jtb4rGxa/6LoKKzo5H+S8DJx5SWY0
         xCmFQ0k12Ude5JeCStIJ9oHCKJNQQS3P2f5fjY9QmXSBvSSsMXfU53Qbr7d/oXEF5ZJd
         3B7e/BJUIYc+flTF0VmoblUaqwe2mMZoD8on+XfhgP9bCzVKkOpYXCSQAK7r0NcYcH2F
         M5RYNT68Xr5mamo6jrHbZRXf27bfhwHKGWFOSZopLtBz7Vwi6VFSeWuVt7UKycyaUwVH
         Ej8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=HtJcM8MeiQuDt8oTen0T+D/ITXNS5s2KD/Y3kyt7mo0=;
        fh=J2ghTm4PdECeW0dOE4goFbMA3ATHz+aLwgaexA57/d0=;
        b=T1wYxg/vHc9ygqnaSnFn549xerpXr6ujrbmz73AZC/qfUjKQSRVlAy8uCXg/eGI9BV
         XiKxyVXQm1af9195JmldRAgkoMTdOhxmY6YmRPF+IsugnFbh9pH2nBX791hS0UCwODJQ
         vEPhQZRt5TKcZGgvqLc+3h4qk5x9dfd7bqT6zyRGrfRndWXMD5trKw/KyTqaluYxgHop
         cYC6lYNCse1RP90UKLjGNOAmq7wIoCFUP+Px59sorPHkktKgWBZq0fG3UDZzgqTzWJQs
         4XuPflIJimxMo9dnjeZ+IRPUeurrudxFfDdQRQrvR1lSxxZ8sGaEbo3yzXONhHmD3dEd
         um6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LtVvPCKN;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f21-20020a05620a20d500b00787b7df206esi8794099qka.201.2024.02.27.22.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 22:30:03 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LtVvPCKN;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709101802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HtJcM8MeiQuDt8oTen0T+D/ITXNS5s2KD/Y3kyt7mo0=;
	b=LtVvPCKNHfS9e7Ujul8qJRjIEVXdA/MOLEGJo5xloeQjIvzqsqgQWoIw1Ctt1I4rDI0ONj
	phoy3y40wxnlN7kIZ6l4c/ooJsSRCHHdSfFrfdh5zhwKKUpvSWsARWSvqspny/aPzZ2xi0
	vEKcI5260qGiTI+yaUi4FMPpN/Pm96Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-dA63K2UUMD2ZLXRxMCZ57g-1; Wed, 28 Feb 2024 01:30:00 -0500
X-MC-Unique: dA63K2UUMD2ZLXRxMCZ57g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7644785CE43;
	Wed, 28 Feb 2024 06:30:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5252DC185C3;
	Wed, 28 Feb 2024 06:30:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 257AC21E66F4; Wed, 28 Feb 2024 07:29:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  philmd@linaro.org,  thuth@redhat.com,
  lvivier@redhat.com,  qemu-arm@nongnu.org,  alex.bennee@linaro.org,
  pbonzini@redhat.com,  anton.kochkov@proton.me,
  richard.henderson@linaro.org,  peter.maydell@linaro.org
Subject: Re: [PATCH 0/6] Add ivshmem-flat device
In-Reply-To: <20240222222218.2261956-1-gustavo.romero@linaro.org> (Gustavo
	Romero's message of "Thu, 22 Feb 2024 22:22:12 +0000")
References: <20240222222218.2261956-1-gustavo.romero@linaro.org>
Date: Wed, 28 Feb 2024 07:29:59 +0100
Message-ID: <87wmqp3xug.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: xMso3COBRt6r

Gustavo Romero <gustavo.romero@linaro.org> writes:

[...]

> This patchset introduces a new device, ivshmem-flat, which is similar to the
> current ivshmem device but does not require a PCI bus. It implements the ivshmem
> status and control registers as MMRs and the shared memory as a directly
> accessible memory region in the VM memory layout. It's meant to be used on
> machines like those with Cortex-M MCUs, which usually lack a PCI bus, e.g.,
> lm3s6965evb and mps2-an385. Additionally, it has the benefit of requiring a tiny
> 'device driver,' which is helpful on some RTOSes, like Zephyr, that run on
> memory-constrained resource targets.
>
> The patchset includes a QTest for the ivshmem-flat device, however, it's also
> possible to experiment with it in two ways:
>
> (a) using two Cortex-M VMs running Zephyr; or
> (b) using one aarch64 VM running Linux with the ivshmem PCI device and another
>     arm (Cortex-M) VM running Zephyr with the new ivshmem-flat device.
>
> Please note that for running the ivshmem-flat QTests the following patch, which
> is not committed to the tree yet, must be applied:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2023-11/msg03176.html

What problem are you trying to solve with ivshmem?

Shared memory is not a solution to any communication problem, it's
merely a building block for building such solutions: you invariably have
to layer some protocol on top.  What do you intend to put on top of
ivshmem?

[...]
