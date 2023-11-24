Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1385940ejj;
        Fri, 24 Nov 2023 09:22:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF26HE8W/ZlicywQSXZMjee+A8wmoVhtoWDJIH8TLn1caMQe52nqTfjEjFUZGpSHxnHiXp2
X-Received: by 2002:a05:620a:b1b:b0:778:9542:a765 with SMTP id t27-20020a05620a0b1b00b007789542a765mr3410635qkg.64.1700846557112;
        Fri, 24 Nov 2023 09:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700846557; cv=none;
        d=google.com; s=arc-20160816;
        b=YkxQQK8t5oX8OlsMdr307DQreNSNx8ptkC2XHM/VfLflBfYrW1MCg6NWoCCJRfLS/c
         pPsdXLqJ3NgVeB7FNVK5pjDvkI8zWY8XxPuPHbi+hy5SoLVNnqqYbqaiA4eovF+f3UsD
         VgUukS60UdjhdpcHXbQUbloAO4W4z5htij87Rx6ZwzXfMYvNuW0d+jlxdE/SJUxTxspV
         /GNtTJQLqnKIvtRCsBbVJMF14Yj6zGTn5UbNAk9zXohKmhKMGuKr0vGl+oE6AiVS5R5d
         UqQUxmcL1rBV/WvK3u37BK+yt/Li357ap5kNPdv+75d8CzpO6bae8gIFerW49zd/rqtl
         koYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=GbwVEAyIA/kYKuPaAGC4ZANIWJJ2zj0+CKI2aHaLj38=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=qx3Oz96/82rY8/82qq5E3gA/YMFPkTIMPz/XvYFjJUZin/HdnuwFbaek+rQ7cpM7hk
         rii4bkxxl6Iz5XVIXCqR4ZNd7nvCheFIVMTvJgei690yx0pgzrTVv7CZTzr48cKCG3s/
         Z8cLRzQfAtxnwrNZ6Sk/bGxIdy4EJ7RRYgguUtTGkyque/cUfrPC4LZeet47DYka0eSF
         T5wqMvAnOcBl2+QMRSguUy9Gq2Mk0XpAhkEDTbVCrJE21Hw98LaBm5Dgb3f4HYiwiCJI
         YPTeBTxK9FpQ1895JxKd8SNbvpDgaw0VGxqR2ZgIUsnesNe4qTwj+8EIxNgVnVlzpTAK
         Qsbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MKLac3E/";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d16-20020a05620a241000b0077a4af92713si3797605qkn.565.2023.11.24.09.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:22:37 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MKLac3E/";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700846556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbwVEAyIA/kYKuPaAGC4ZANIWJJ2zj0+CKI2aHaLj38=;
	b=MKLac3E/e0XOpX/6QhuoDbGPDh1LzJcdITRSwH4pppr5Ytg8ZgpoHplDGdz3n4fO9oM+xb
	jGShYo+xbNw7miRRT52YRFFpYGGWNhy88oK4Hk43CifTkgBY3SZ8HcVjJMc0GObPRzmQ7S
	QSTITwNGE3kai0bj3N7HF5RXddWhJwQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-kvu2d8yLPAi-YnmPGDCTmQ-1; Fri, 24 Nov 2023 12:22:35 -0500
X-MC-Unique: kvu2d8yLPAi-YnmPGDCTmQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77d7d4b1dccso95629385a.2
        for <alex.bennee@linaro.org>; Fri, 24 Nov 2023 09:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700846555; x=1701451355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbwVEAyIA/kYKuPaAGC4ZANIWJJ2zj0+CKI2aHaLj38=;
        b=Wyqe0d3c0EckcvP4VEfCbW0QOd7rt1Mwu17ypFgqWxGQ3ep9ArlWJXuXdwxM0cHGWc
         rRtejtLNDQTpnXyg67e8v07aQSJvD0XXGUBwsSDHDPlHelO/DbmKIF/W+s4ukdUYN+7a
         iLhendLXP5xKa7quaqp+W1xHJD2urxGZFCym+Udi4f+ZiD526eZ7E/lrqEHOwKGDtMFn
         y5Dd5IjBEfoZcONj35bDPZpwSbRykCJMkwW9aHp0/ELqpiwCCGGFaWzrNCjqoUgsVHby
         RJ4TZQTlLU6NV3QrUAfBgtVMT7VmJIOPa+KAyYGnXdhD2tZfPvwM3s+V0VjswpvRr4Op
         9UFQ==
X-Gm-Message-State: AOJu0YwL7qCfYPn9E8/YOeuR3RcQhoSl7+N4ehH2hYcB/0OSc0j934Hh
	ZUiwtJJDIPIlE9Ohg1PK3Qhz/L5l9AJi+L4Eq65m7BKJm0x3v4R2bGqw15VAbAGzoelgFJVa7hc
	0NJFVuNxkjbEHoSMn
X-Received: by 2002:a05:620a:86ce:b0:77d:7349:a094 with SMTP id pr14-20020a05620a86ce00b0077d7349a094mr4414896qkn.40.1700846555333;
        Fri, 24 Nov 2023 09:22:35 -0800 (PST)
X-Received: by 2002:a05:620a:86ce:b0:77d:7349:a094 with SMTP id pr14-20020a05620a86ce00b0077d7349a094mr4414846qkn.40.1700846554961;
        Fri, 24 Nov 2023 09:22:34 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id v20-20020a05620a441400b0077d63e97725sm1370129qkp.95.2023.11.24.09.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:22:34 -0800 (PST)
Date: Fri, 24 Nov 2023 18:22:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V7 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20231124182229.34dd52cf@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231113201236.30668-1-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: xi+zaCVZS3v7

On Mon, 13 Nov 2023 20:12:28 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> Virtual CPU hotplug support is being added across various architectures[1][3].
> This series adds various code bits common across all architectures:
> 
> 1. vCPU creation and Parking code refactor [Patch 1]
> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
> 3. ACPI CPUs AML code change [Patch 4,5]
> 4. Helper functions to support unrealization of CPU objects [Patch 6,7]
> 5. Docs [Patch 8]
[...]

forgot to mention, you probably need to add to series migration code as well
as it should be the same for both targets.
(mostly copy-paste from q35 or piix4 and making sure it doesn't break old qemu
(aka not enabled/sent over wire if cpu hotplug event is disabled))

