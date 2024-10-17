Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp176633njb;
        Thu, 17 Oct 2024 06:20:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJmES0Cq3MBeXjVcmHNKZMfYsKth4Ob+R//hoiI6TW6n6lduK9wmtwPnVDT99h3Al6AaHk/pHQEAOopQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGWNun0aWPXEXhiAbivrqFP4hXbPxJA5UELWw8LMuheeW3kCVTpSEJo4gtt61i17RnCGz/O
X-Received: by 2002:a05:6512:2581:b0:539:e1ea:c298 with SMTP id 2adb3069b0e04-539e1eac668mr10673877e87.22.1729171217945;
        Thu, 17 Oct 2024 06:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729171217; cv=none;
        d=google.com; s=arc-20240605;
        b=klK0RjcbMMVsj1iZskVcWA23uAJoytX/k94p3cNAfZmVSqa4KF+MkiidFRgTGEpd+x
         8yPNMR9RGxJ6MhLYMD91XMzIgeAUL5f3elEZG6BKkOmKK1dxTPJkDLdmNDWPrb/fNID3
         AuNTbNuwNl+l6y5EgtndYhbEpwpeu3VH64Mste8+c+7dYBckhE3QCXEEjlLPeKTCZMzx
         vv7q9P0XQHvw+M+8bvnziVO7pNBoB6MV11jffzL0F5tnzrDMMXq1sokU9YGqdYHDMUpy
         ddtQPCRAT7R86jLwvJBz6gArRwj/bXZAvzfl89Ry5wHNZTrIR8nYKWaOxl3gX9ZGfWQl
         Mymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=E62gZNpWiyFhH7uengib2bNXbojFXxmR8Bf1vXi1JKU=;
        fh=2SLEZlaTQSHedbEvbXM5ToW9pz0vPKTlNBn5Vl9ybi4=;
        b=aefvWwmUjbFDS7woCUNI4N8Ht8dFMTYfHs+OfaAERb+xJMp/d5iImnLG7/RfS0IPLZ
         14TE/XnYIAFhKeUrMbfnZcMTaAemfGovYQ7faph7CX6j+vb8YWSRrk+akMCUHmghBsIw
         J0XuvnF0QnEgVjUP7vsmAUx3c3Mr4ZJv1X/emt+KbzTdh9iy2/B1sg+WLSDfvrBdwmr2
         rlPSUgEw5OMuBEAV3iSfex4+FZkUlrK+tFwbVeI6ZzEqBFvXRpCWTNRPkmkshMGgchUH
         3Mnc8aFSdaKptjXG9QGKqmG0jHFhSwPVYr2g24aejByRuEGC4YOgNV//iPDV0li+/3rw
         2woQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fcc9ae0si2831958f8f.716.2024.10.17.06.20.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2024 06:20:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XTpLc1979z6FGlY;
	Thu, 17 Oct 2024 21:18:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 446BD1400F4;
	Thu, 17 Oct 2024 21:20:16 +0800 (CST)
Received: from localhost (10.126.174.164) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Oct
 2024 15:20:14 +0200
Date: Thu, 17 Oct 2024 14:20:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=
 =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
	<wangyanan55@huawei.com>, "Michael S.Tsirkin " <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, <qemu-devel@nongnu.org>,
	<kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>, <qemu-arm@nongnu.org>,
	"Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH v3 1/7] hw/core: Make CPU topology enumeration
 arch-agnostic
Message-ID: <20241017142013.00006c41@Huawei.com>
In-Reply-To: <20241017095227.00006d85@Huawei.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
	<20241012104429.1048908-2-zhao1.liu@intel.com>
	<20241017095227.00006d85@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.164]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 7zMolHV1c4T9

RESEND (sorry for noise).
Quotes in email address issue meant the server bounced it.

On Thu, 17 Oct 2024 09:52:27 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Sat, 12 Oct 2024 18:44:23 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> > Cache topology needs to be defined based on CPU topology levels. Thus,
> > define CPU topology enumeration in qapi/machine.json to make it generic
> > for all architectures.
> > 
> > To match the general topology naming style, rename CPU_TOPO_LEVEL_* to
> > CPU_TOPOLOGY_LEVEL_*, and rename SMT and package levels to thread and
> > socket.
> > 
> > Also, enumerate additional topology levels for non-i386 arches, and add
> > a CPU_TOPOLOGY_LEVEL_DEFAULT to help future smp-cache object to work
> > with compatibility requirement of arch-specific cache topology models.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > Tested-by: Yongwei Ma <yongwei.ma@intel.com>  
> LGTM with one incredibly trivial comment inline.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> >  #endif /* HW_I386_TOPOLOGY_H */
> > diff --git a/qapi/machine-common.json b/qapi/machine-common.json
> > index b64e4895cfd7..db3e499fb382 100644
> > --- a/qapi/machine-common.json
> > +++ b/qapi/machine-common.json
> > @@ -5,7 +5,7 @@
> >  # See the COPYING file in the top-level directory.
> >  
> >  ##
> > -# = Machines S390 data types
> > +# = Common machine types
> >  ##
> >  
> >  ##
> > @@ -18,3 +18,47 @@
> >  ##
> >  { 'enum': 'S390CpuEntitlement',
> >    'data': [ 'auto', 'low', 'medium', 'high' ] }
> > +
> > +##
> > +# @CpuTopologyLevel:
> > +#
> > +# An enumeration of CPU topology levels.
> > +#
> > +# @invalid: Invalid topology level.  
> 
> Really trivial but why a capital I on Invalid here but not the
> t of thread below?
> 
> > +#
> > +# @thread: thread level, which would also be called SMT level or
> > +#     logical processor level.  The @threads option in
> > +#     SMPConfiguration is used to configure the topology of this
> > +#     level.  
> 
