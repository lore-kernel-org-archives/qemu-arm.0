Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1162434eja;
        Fri, 1 Mar 2024 08:14:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXf42OxvDYX4Vd98R43Fj+CRhOhJ3MB/VhHVUIcsqsGfXLyT141xmWtWPsf6BzW/KZQsgqU2vxjr1LybP0E/fGvNkxd1daO
X-Google-Smtp-Source: AGHT+IHNpxP0XatR6XB5Ew/niv+AhrDxIvCNkXlJRK8ulcCEtYrq3j2joo4B+Im4VvALm509oF3o
X-Received: by 2002:ad4:4f14:0:b0:690:57bc:643b with SMTP id fb20-20020ad44f14000000b0069057bc643bmr1770343qvb.13.1709309693117;
        Fri, 01 Mar 2024 08:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709309693; cv=none;
        d=google.com; s=arc-20160816;
        b=h17zoaf+4n5lBZ2UbE9lFU6B0fhLgWgc5TUaWsmzJnXTJTZ+khU9dFQFKmovOjlLf2
         M2DPL/A9xNTUTOEBKHwP3RDLyw1QI62OQEzUf9GmPxkP0s32xs///bt644Twa/MC0eOw
         Dq3fLzBE1n/oHhy8YP2pADwz8QfN2DObd2a3ZKjJitkE7ZZ96ZpmzqUETjl5KaCR/zCJ
         UnztfCLXslsRhygN0S4r9GAsCfSP12yNiUfcmn7jIJLwSsH6CV7FGJs9OwgRUemutUEH
         U+XL6jCTYg0c2TCBoyxS8F307Di1orNsX2CoVavm6M3/mQnWWRFjkdBAgCrt+4acJbkb
         GHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=QBP0TDDVdwAOEYm7nyivjARpTdtgcQHk6YZWbsGSFTQ=;
        fh=BSmnamMHzAW+WbUPOrljaZeWLYiz57lBzreTZ1E4fzM=;
        b=e4Fs0iHZZ0CucPGszjEUsCfXvkJFvjrdaIa6rLIvtjSRrGuaaxjB1R5Nzp7TJiTWyC
         4uTekL28OUhBza+U9izZp06GIAMmMUDAkBQy5Y/8p/F1K5NAgS01m/fXZmRQbOgbDre3
         dLt9hfQssKvbHQdbhgNihcTUBIfrJJMFWVJChlC/6MZXjCgm7qhYs0KCl+DAXTtf3UUh
         oVxOLvbdVAhPxu/PIkNDSaWzNCsnWcMq8agOn/IVc/Pag3EGndGKZqItf2DP/vpfLiII
         Qt0cTer9ZOltbY9hij2mRXEtIBS4VvufuDjnhRLzv8WMY2ZLtwV1QGpq4HfQPg6IpqWK
         WMjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UnkzluvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kf7-20020a056214524700b0068cab7f4d3bsi3702168qvb.181.2024.03.01.08.14.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 08:14:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UnkzluvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg5WQ-000869-5G; Fri, 01 Mar 2024 11:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rg5WL-00085P-GU
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 11:14:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rg5WH-0001U2-Tj
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 11:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709309634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBP0TDDVdwAOEYm7nyivjARpTdtgcQHk6YZWbsGSFTQ=;
 b=UnkzluvI+WMs3+CBXG8Q64sxEnYt+wDSoDupj0tiJQcQBR7pIsGCIzEIwE8okz9ukXX2lg
 ppfUbkdk29mfeNtPI1To9XQlQvLetFyYbSv5Zu6iCIQYIxQ76vZtsoYCHpGlbGdnFNyhOv
 vkATTNn22ki4hkJTC4p5TqjKybNFfCQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-FQhMvmajMO21UjkH1OtgCg-1; Fri, 01 Mar 2024 11:13:47 -0500
X-MC-Unique: FQhMvmajMO21UjkH1OtgCg-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-36512fcf643so28762255ab.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 08:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709309627; x=1709914427;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QBP0TDDVdwAOEYm7nyivjARpTdtgcQHk6YZWbsGSFTQ=;
 b=SKVA7gCtxUuhzybzxT3WaiK45nbRMC/jkb5CsWPxsdMGMUCh/fdQhJo3SoVFUqcV+n
 +wsJT5GXeN/nX3ReaD2AxJFLUzw457JZf4wjh147aJ3kAKHzCNJoh69OwJClHIOoEuvu
 WMn2HWd6lgrQ2VV1pD0mpo5ssTKnBnw3sVLPOzp8mj8fPdWaG8EIpwbSXBRjJdD4WoGO
 RPyk27eBCeHSZ8SWhEoaD3/F6vFgslcRP10Zdx3xzXKb0ClDqvtM1ppYvfCfNpQwrK1B
 CcYlMO/0iedoGFrE7f9pfLp5oJrVWOI3HDuqpM4zZ6mOF3LW9tsiz8lPau7cI5TVPz2r
 TGkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk1KXcxIs6UKlGQdnVwzYP/9hrlLpRuH0El1l91CBW4G4STMoob15YhJnmixb8C4oHcxtrGVq3hB0GMKVNeFjX9249
X-Gm-Message-State: AOJu0YxOtLsb0/kf880yabF9NorgKqvFvkYBFGAKMYne+OJA5fD6/Vmb
 Qr0xcH6Hn7caQ9Q0zOQxos82+7YkqqIWkn6NsGazF47pP8pzC6u202KjrMJkAzSt+plz/dizI7d
 ad3X6vLYZR0OBnXHuEUNv4d2kScVaIE5eOo029TaZhX/+iv5xFw==
X-Received: by 2002:a05:6e02:2181:b0:365:b570:cbbc with SMTP id
 j1-20020a056e02218100b00365b570cbbcmr2581690ila.10.1709309626897; 
 Fri, 01 Mar 2024 08:13:46 -0800 (PST)
X-Received: by 2002:a05:6e02:2181:b0:365:b570:cbbc with SMTP id
 j1-20020a056e02218100b00365b570cbbcmr2581648ila.10.1709309626618; 
 Fri, 01 Mar 2024 08:13:46 -0800 (PST)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 p1-20020a92d681000000b003657c7530bcsm978325iln.16.2024.03.01.08.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 08:13:46 -0800 (PST)
Date: Fri, 1 Mar 2024 09:13:43 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "clg@redhat.com"
 <clg@redhat.com>, "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "david@redhat.com"
 <david@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>, Zhi Wang
 <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Andy
 Currid <acurrid@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>, Uday Dhoke
 <udhoke@nvidia.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 1/2] qom: new object to associate device to numa node
Message-ID: <20240301091343.2e69359c.alex.williamson@redhat.com>
In-Reply-To: <SA1PR12MB71999E1863F1FD4C2505294DB05E2@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-2-ankita@nvidia.com>
 <8734td3uty.fsf@pond.sub.org> <20240228135504.00005d12@Huawei.com>
 <87bk80vaft.fsf@pond.sub.org>
 <SA1PR12MB7199F868F1C300B1E795CD39B0582@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20240229102230.00004277@Huawei.com>
 <SA1PR12MB71993D9D99F4756C17CAE9DBB05F2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20240229163232.0000478d@Huawei.com>
 <SA1PR12MB71999E1863F1FD4C2505294DB05E2@SA1PR12MB7199.namprd12.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.096,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9SDAczOV5STp

On Fri, 1 Mar 2024 08:33:42 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> >> As for your suggestion of using acpi-dev as the arg to take both
> >> pci-dev and acpi-dev.. Would that mean sending a pure pci device
> >> (not the corner case you mentioned) through the acpi-dev argument
> >> as well? Not sure if that would appropriate.  
> >
> > Ah, looking up my description is unclear. I meant two optional parameters
> > pci-dev or acpi-dev - which one was supplied would indicate the type
> > of handle to be used.  
> 
> Yes, that makes sense. But for now only have pci-dev until we have any
> acpi-dev related code added? IIRC, this is what we discussed earlier.

Yep, I think we acknowledged that this device supports either PCI or
ACPI devices and we only currently have a use case for PCI devices, so
that's what's implemented and what the interface expects.  A separate
ACPI device interface could be added later or derived from updating the
interface to accept a generic device object.  Thanks,

Alex

