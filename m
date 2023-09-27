Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1882962ejc;
        Wed, 27 Sep 2023 07:25:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHNiO+QSbt4ogGVAl6BBOgKrXnkKP4hu3YTfI/LjahueN/JnZoPj5WO5FhzX47P53K3Pg0
X-Received: by 2002:a05:6122:369c:b0:49a:b0be:3a00 with SMTP id ec28-20020a056122369c00b0049ab0be3a00mr900756vkb.8.1695824722555;
        Wed, 27 Sep 2023 07:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695824722; cv=none;
        d=google.com; s=arc-20160816;
        b=ayuq9c6XF/BichM9ab9Be+pEZamNhNB6VoT9Y8jzTk1KsdueVDyBBBSkNtiuNGJNt6
         lg1meKcv1aET6PHQGlRnbkEt6tTyTqLsc5HjxwhpyKGD9YKZ6pPW4Ko80wZDxt+KHkw4
         BTd3KWdFPE55kiLgzH5rOMKFk6xds1+518Oz/4uXm8qpo9fV+yytkOHxs+rN+vP4r04k
         DeNDFRn2aQTz9J5dxg+VkdSaqXAIIpIPMG5PrwJLF7b66QeToHu/hkEzEyBqRRMWJfjK
         YrSV884E2xi7QFfmaP9zXs8oOt8MhqpqLOXDZR2uFSCpoeYSV9WwFvN7s/MWhtCbM0ve
         17Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=uEV3RARKEJVMV8WdrWIeCRPMCdojUOSEeKIO0o8Dd3I=;
        fh=J7zUGI8Q59JzBOAUi1g+Z+vfNr+zp9OaG84FXGgrxS4=;
        b=R7pYSE1GPTL9O6+pmPiJzfwMeeZ5Gd1Y5WOGjnQFDPFSwI2oSzijEC1zcyxQDMenpV
         S4PnOWgk4iALWN3bfk1086OoCiDW5frEIFGyGlI/dEQ3f1gITjjCi5dPWIhJ22nVAPAw
         gjesSVd6f1CSxLRQ5qygUmfqEIu6fGIlTQzw/C3d2EQ/+xOLH6YWbVj/N1nTk2/K3ZQi
         qL9PtUn1vjeZmceX2k7pwGc5we1ZJnO/qHwFD+S8knjjtUt/Zw8fNtJqsu85jPMtgT6I
         tQ4MQiZbFJB5OKOv3pU4Wn8gQ+Oy6Vg6R9zgL8ccfXepLiu4zACNKqC8rt53dcDTvZRs
         VDxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BP7bwzFY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fh8-20020a05622a588800b00417f7f78604si6981590qtb.636.2023.09.27.07.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 07:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BP7bwzFY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlVT2-00088L-5j; Wed, 27 Sep 2023 10:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qlVT0-00087u-UR
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 10:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qlVSy-0004DD-UC
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 10:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695824679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEV3RARKEJVMV8WdrWIeCRPMCdojUOSEeKIO0o8Dd3I=;
 b=BP7bwzFYptsodTNsW0dj8tdo89UGknD/s0xA6wo97X5mpeHnix8gHWbT4Ck7ulbRh8v/Ny
 oKYvrbY8RdoyAe8dpKNXwYpbsBD5g84v8YKH/AjluKz+mNCEj23DK/7gPtJH05/9vRk7tl
 Trvv380+j5vSRLT03Ma9AVvp8ERXHIA=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-t6vrONphNBCYjBNuz-3ILw-1; Wed, 27 Sep 2023 10:24:38 -0400
X-MC-Unique: t6vrONphNBCYjBNuz-3ILw-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-7a16fe687aaso261985939f.3
 for <qemu-arm@nongnu.org>; Wed, 27 Sep 2023 07:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695824677; x=1696429477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uEV3RARKEJVMV8WdrWIeCRPMCdojUOSEeKIO0o8Dd3I=;
 b=sJJGFLhmUomqKeNXJ8Fkeye5tAh0iKmo21ghrxT2hayTWmNlyQg69SnsHhkj8T236c
 JIwC/BDHvcZQBVf07oEzkaEAmlzKjmzz50GO07rj78TdN8q0Z+N3TRK9Ul86GoW1215x
 Zr8EpZvxKll3WEQteE94/sXOIgHc7EpJ2d7Ripk5ogZtxa2QYD7Xvqn+/nyb/NWTQ4aR
 Co0TEolxf+WMS1UNk/PbPedaU2UCihkksE2fGtKyCWLhXeOP5FQVS704HNPODIn/wgRK
 ULW7mk9q+R0sW+uBnH+OmfmYRNvlUSmfdzcAqbpA94OVrFMawmGopIUPaicnWjF+Fw3O
 TBMg==
X-Gm-Message-State: AOJu0YxSPAuqT6n4dLcNGbuhJtd1Le85rDzRCVWAFl9ZnQePCKMSR31V
 UDE8b4CF2mVLViHUgxaxsarqWKeQ1qaw8tq9uzpaZztoju2mrlDK+3mzOMOZb4Crc+apqaZ9/Cf
 QdemDIfvQNT/1
X-Received: by 2002:a6b:f314:0:b0:792:82f8:749d with SMTP id
 m20-20020a6bf314000000b0079282f8749dmr2247504ioh.10.1695824677780; 
 Wed, 27 Sep 2023 07:24:37 -0700 (PDT)
X-Received: by 2002:a6b:f314:0:b0:792:82f8:749d with SMTP id
 m20-20020a6bf314000000b0079282f8749dmr2247482ioh.10.1695824677503; 
 Wed, 27 Sep 2023 07:24:37 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 n16-20020a056638121000b00439c46ad69esm3840840jas.115.2023.09.27.07.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 07:24:36 -0700 (PDT)
Date: Wed, 27 Sep 2023 08:24:34 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ankit Agrawal
 <ankita@nvidia.com>, David Hildenbrand <david@redhat.com>, =?UTF-8?B?Q8Op?=
 =?UTF-8?B?ZHJpYw==?= Le Goater <clg@redhat.com>, "shannon.zhaosl@gmail.com"
 <shannon.zhaosl@gmail.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "ani@anisinha.ca" <ani@anisinha.ca>, Aniket
 Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <ACurrid@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Gavin Shan <gshan@redhat.com>,
 ira.weiny@intel.com, navneet.singh@intel.com
Subject: Re: [PATCH v1 0/4] vfio: report NUMA nodes for device memory
Message-ID: <20230927082434.3583361c.alex.williamson@redhat.com>
In-Reply-To: <20230927135336.GA339126@nvidia.com>
References: <d09b3df6-74f8-c93b-b26e-59de5b2dd114@redhat.com>
 <20230915084754.4b49d5c0.alex.williamson@redhat.com>
 <f129b30b-bd0c-4e30-6be9-384b2b79a26b@redhat.com>
 <BY5PR12MB3763FA9922B9059DC14CA80DB0FFA@BY5PR12MB3763.namprd12.prod.outlook.com>
 <b67c18d1-a648-81bc-1144-33fb839f2aa3@redhat.com>
 <BY5PR12MB37636F9E84CF92020769D859B0C3A@BY5PR12MB3763.namprd12.prod.outlook.com>
 <769b577a-65b0-dbfe-3e99-db57cea08529@redhat.com>
 <20230926131427.1e441670.alex.williamson@redhat.com>
 <BY5PR12MB37630E29E6E83BCD63FB3F2BB0C2A@BY5PR12MB3763.namprd12.prod.outlook.com>
 <20230927123318.00005aad@Huawei.com>
 <20230927135336.GA339126@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9VvnZqO8JnQN

On Wed, 27 Sep 2023 10:53:36 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Sep 27, 2023 at 12:33:18PM +0100, Jonathan Cameron wrote:
> 
> > CXL accelerators / GPUs etc are a different question but who has one
> > of those anyway? :)  
> 
> That's exactly what I mean when I say CXL will need it too. I keep
> describing this current Grace & Hopper as pre-CXL HW. You can easially
> imagine draping CXL around it. CXL doesn't solve the problem that
> motivates all this hackying - Linux can't dynamically create NUMA
> nodes.

Why is that and why aren't we pushing towards a solution of removing
that barrier so that we don't require the machine topology to be
configured to support this use case and guest OS limitations?  Thanks,

Alex

