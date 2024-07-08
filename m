Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2705009njb;
        Mon, 8 Jul 2024 06:55:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPZ6Gqp6oI3SxyEg732fCp2j99xF7nBlS5TXSmT1+HehdDsDGkVZJhdM/FX1iF1onwEsO7niSMsn1K9IdgZRG2Umbrz1GC
X-Google-Smtp-Source: AGHT+IEIxCZct6FejELGrB350o1Ek9i68+o9RDzQ1GHsear2rqOdgRGCLK29pZeAwoIkiBhfFG51
X-Received: by 2002:a05:690c:720a:b0:650:f06a:9285 with SMTP id 00721157ae682-652d812fa1dmr150133757b3.52.1720446916253;
        Mon, 08 Jul 2024 06:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720446916; cv=none;
        d=google.com; s=arc-20160816;
        b=ns3KzjJe2/k7FwrvwkmYjl13AB32ZB2fvOp961EQyHw9NZD+Ywz7gFwKLFrRYZ/tL1
         zj8QYYSbR5Vb/vwsHLGRiMp7w17NhCYC3BfShTj64JMzPRKBVEZBlqIhJpBcU2ZmXRpu
         7GlNjfP9Di9R+G53Zzbj8NZoOQh6AppSfiXv56MaFaXAhRhf8Gr+lyMLQQEtxtJbcnDE
         5InnrP+sZflMTh71yo94UXnl0kKvlg2JQsRk1qKlnP23fIwSIuplH2dsTL7ZbTi/78LD
         eKfRAmY6AM+oB9Bx9f1B50aHHvizdS3I81eRhSn9woAZDk3F4KZhlm8S5UecwXjCX69h
         qulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=gN92sDqkGK7Io4oEThtAQq6k4cj75NNnXWY/QdVzw68=;
        fh=JTa/6237ODKVNQ6AM+tSTHcyUnVfELWohhq7ILR3q/s=;
        b=C0bzVqLXQaD78C1YeFTR/afC94LRAUBVhZ7LmjuU6CKSUsMQFqmGXLYDrlbeH+hNii
         pN2M8O0KQxfTgLZlZjO8/v6B7DZACxEn0h7yf24mSYomD8oXqpZ5IdkQ7g80qXusW6Gk
         jYVayYHR3itfPEUkjmvxcB01epk6VrTb39vgC1EB4I2yFdM/xxp4lbUZIzvzmzlYg6Hk
         k/9J3yA2FCv7s3HyiJZjssjNKCoL5cv2U2zB8Z40jGDc3L6ELQpR2ep+SJTxG68HLc3H
         d58p02Is6Un22JN1QF9nWYx2z0JJTfZx/TPdN7uCZ7di4O3Wtl6N/HAlJJLHduSn7Ki0
         wOBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=coQx54Ud;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-79f0edb05fcsi218913285a.556.2024.07.08.06.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:55:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=coQx54Ud;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720446915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gN92sDqkGK7Io4oEThtAQq6k4cj75NNnXWY/QdVzw68=;
	b=coQx54UdWBe/PUzLTR+opGGScrSDD5LONhCMQ+S21IBWHh+WygU3SgkjSzG4Yk+ZWbiO3w
	OKNHONLweJlSCtc0GyDNC+4SKCsVj4DeaZ1SqDJIDIkpW4Sfr5J9XWBJDbtdLXK/vKIBas
	eaG8SeBII+5MvyACeRxlnKWchRCMO2o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-ZQJMGqlVN5icNqn6obeePQ-1; Mon, 08 Jul 2024 09:55:11 -0400
X-MC-Unique: ZQJMGqlVN5icNqn6obeePQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-426620721c2so14251025e9.2
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 06:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720446910; x=1721051710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gN92sDqkGK7Io4oEThtAQq6k4cj75NNnXWY/QdVzw68=;
        b=gN9KT3Wwvj47jv6WgKmNGkl9YBGtWLTi1IpUcjaQaWIYUho6JWuIfHMySx72byfULd
         PXHmTOjPNxfxJQWgCGDWnB399t/NEDzzp0z25/YrEQwych+XlDbc3LRFumKSqlykC0yI
         HqiZnm9/YHJ6Nt7Al6ylo2UYJmZ7JA2ttaTxL4VmjklAKfotYO0QzWVmpW0Fpio+kDDX
         1kjjaf3V9ZWlu7VLgO9ZVgEP0OZOCogfb19inkyrhTBbp2Hfj++yhdZoBZX2MwQei+Lx
         EbXF6QPQ5z+9S2xqdjw/hLCfJLugg5yllLbDGiCU9gXtVDLj7ZWxBJULW1ycjMyKCCrS
         g04w==
X-Forwarded-Encrypted: i=1; AJvYcCX1SuP1GZJLxGWdKPRECZmG7lKdSA1Y8jGjzz3xs0h3U3spdLZfppza+a73ciPHu90kndajJMICuMu1kf1035J1sO3zPxv5
X-Gm-Message-State: AOJu0YxZj+Si+T6SDhzDqAPY51GGNd/5yd06FdPWuY4UXlpttdeUDpQN
	sw9tInC4C7AjmdCHbs10SxnBeCrX0i+PCrMJvXhdgOK6A8HfLLi+nniNUhVDiF03sqCumwCmSaJ
	msnKTm7NZgWWRujiqZqvzeYLvlDK24zNH3fqwBddqWkFKsG5b6kQefQ==
X-Received: by 2002:a05:600c:4988:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-426647b1c61mr28273045e9.30.1720446910630;
        Mon, 08 Jul 2024 06:55:10 -0700 (PDT)
X-Received: by 2002:a05:600c:4988:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-426647b1c61mr28272815e9.30.1720446910237;
        Mon, 08 Jul 2024 06:55:10 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd6b4sm27786669f8f.17.2024.07.08.06.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:55:09 -0700 (PDT)
Date: Mon, 8 Jul 2024 15:55:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@opnsrc.net>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU
 Hotplug Event Bit
Message-ID: <20240708155507.52418191@imammedo.users.ipa.redhat.com>
In-Reply-To: <db8c2a7c-cc40-4fed-98fc-171f70e239ea@opnsrc.net>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-9-salil.mehta@huawei.com>
	<20240706164519.06c53d77@imammedo.users.ipa.redhat.com>
	<db8c2a7c-cc40-4fed-98fc-171f70e239ea@opnsrc.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: KcxwrPMpKZ/3

On Mon, 8 Jul 2024 05:32:28 +0000
Salil Mehta <salil.mehta@opnsrc.net> wrote:

> On 06/07/2024 14:45, Igor Mammedov wrote:
> > On Fri, 7 Jun 2024 12:56:49 +0100
> > Salil Mehta <salil.mehta@huawei.com> wrote:
> >  
> >> GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
> >> and non-hotplug events like system power down event. Each of these can be
> >> selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
> >> the CPU hotplug event.
> >>
> >> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> >> Reviewed-by: Gavin Shan <gshan@redhat.com>
> >> Tested-by: Zhao Liu <zhao1.liu@intel.com>  
> > suggest to squash this into the patch that introduces this bit [3/8]  
> 
> I thought, we are introducing a change common to all architectures?

hw reduced hotplug implies GED, so including doc change
into the patch that introduces bit in the code is better
option.

it also easier on the folks that come later and find doc
and code in the same commit (which is easier to follow
than looking for different commits in git log).

> > Best, Salil.
> 
> >> ---
> >>   docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> >> index 0bd3f9399f..3acd6fcd8b 100644
> >> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
> >> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> >> @@ -64,7 +64,8 @@ GED IO interface (4 byte access)
> >>          0: Memory hotplug event
> >>          1: System power down event
> >>          2: NVDIMM hotplug event
> >> -    3-31: Reserved
> >> +       3: CPU hotplug event
> >> +    4-31: Reserved
> >>   
> >>   **write_access:**
> >>     
> > :
> >  
> 
