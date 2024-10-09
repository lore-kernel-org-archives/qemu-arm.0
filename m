Received: by 2002:a05:7022:110:b0:8b:e46e:3391 with SMTP id 16csp645201dlk;
        Tue, 8 Oct 2024 22:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+19Zayinn6Zm8dcAyPcJE6r2U2xnzC5l5CpKlFKLGpIEWPQ4bio1vh8uNnLH6+aVKtrxsT6eI3PW2/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHNI3aUx/8noHzmxodWGGqnqJs7JScY/rcV3z+a7cCt5W2oPq/KMd08De/ue+mwmFcwQ/g4
X-Received: by 2002:a05:6214:5d8d:b0:6cb:8f04:5d5d with SMTP id 6a1803df08f44-6cbc90ad45amr22576936d6.11.1728453203086;
        Tue, 08 Oct 2024 22:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728453203; cv=none;
        d=google.com; s=arc-20240605;
        b=F1fjrzKkXtHGpNyEapKIYO0UvqftlLd+lcusBkgRmCxdl/tcYW1++quHXx2cnq1a5w
         l7UnGdVTydvHPl9LVOkvHDyxCgkokmj41DajVKqJpLDsXMZI7qaqlDD7rAKJUI6nAN+3
         N8DOExgT3p7VX/FE7FIYunWmGj37xwYIpNwd8H2eulhH3Hn9eAc0al5SAwZt1kCSVGKa
         uBGS7rI9cA0KoX89tSZwGC9TCZeU2ZsFBXfqrxss309g8h74CJgH8nHeuBAvdCE2tDBp
         s+fe1yPO3IqEZMuALCHzFhJ+oO38s2KCm+WLZus+EPYlGfHGZYHpniOx1qgPoMP0uWFy
         gxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=btADGO9iSO33HjFS1BlTheVkTNHQROV7epkx93f2PHM=;
        fh=wNgTrgmq0VRUyaeC2SHc+pkwJSD6QOmCg7MKZWreEQM=;
        b=FYjs5Aqr5OlK8gD9P5RAVh5MxVRaWygfSPVRIULaUNloftmiHGsje2BxBihf9bU1rP
         n28zXw03crwIOMLwM/WAqYNFvck2FmSqYR6GzvQeHmyPiwqFXjb8+My2SwWknJfQvgnY
         fBTq1nQWi03eP7EqzCBD95LWOcdwSR7VdkRXBytc9/+i48LbBizPjip1fQfH8D1fygs0
         ybQRka8TI1yRgX7+5UDa8uPhbLpvUEJKMbwpf9C1Knk74mnijwQ9U83QmI6BDYj0UHaz
         gIuc5d2PAFYzBiK+By1M9JXYUUCaZS+7k1R/EgYTFrdNoks4wIgrRUcVYfbrdQnkXUNW
         1q4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EfqqOq1k;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.20 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.20])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbc89b8a2esi13157436d6.372.2024.10.08.22.53.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 22:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.20 as permitted sender) client-ip=198.175.65.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EfqqOq1k;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.20 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728453203; x=1759989203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0ilS+TEIzCQiqFlC+TTsmPgQDdJ1qwzqdbAsWGUD5hs=;
  b=EfqqOq1kNzwrZicM2xwM1WB/VqbkdzEomTnV9DyCXnUg2JPXKOFSc1OJ
   lOgLSE0k0htVMTcNrLghSdwS7L0pomS8aQ36LiXjYvI5WxfiTYyKA1u3x
   d/0CmzwAAZSTNw+9yo3nbpnGddpjR4D2DCt1FwFygUoyN22tgdtq6F6Ye
   LbpxRl+yAqWUWFZ2zpbg/jS+XR3Thn+x64JM+DqxxyaSlkvOUWrpy1RJp
   0DLvaQge4xKw85ux+1ONJVbrUefH7J5LryfowyvY8bi4dlHwjPnPt53Qi
   5txBndhYw6riIb0gaA0jFjwZAVpLlBmRhdEyqM1+KDALIsZUJZ6M1AWW0
   w==;
X-CSE-ConnectionGUID: O7lwD6wJS7WcLAnsRe2ztQ==
X-CSE-MsgGUID: 7NX2MV1ORHOnhR49GSDLHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27546155"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27546155"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:53:21 -0700
X-CSE-ConnectionGUID: 1uy9UXJzR5WlZmqSMcANiA==
X-CSE-MsgGUID: DtsvWWfiTvid0l0/6LauKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76449252"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 22:53:15 -0700
Date: Wed, 9 Oct 2024 14:09:26 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sergio Lopez <slp@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC v2 01/12] qdev: Allow qdev_device_add() to add specific
 category device
Message-ID: <ZwYeFofVARVuL1i6@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
 <20240919061128.769139-2-zhao1.liu@intel.com>
 <20241008101425.00003b90@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008101425.00003b90@Huawei.com>
X-TUID: /FoNIB9Zd/8i

On Tue, Oct 08, 2024 at 10:14:25AM +0100, Jonathan Cameron wrote:
> Date: Tue, 8 Oct 2024 10:14:25 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [RFC v2 01/12] qdev: Allow qdev_device_add() to add specific
>  category device
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Thu, 19 Sep 2024 14:11:17 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> > Topology devices need to be created and realized before board
> > initialization.
> > 
> > Allow qdev_device_add() to specify category to help create topology
> > devices early.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> It's not immediately obvious what the category parameter is.
> Can you use DeviceCategory rather than long?

...

> > -DeviceState *qdev_device_add_from_qdict(const QDict *opts,
> > +DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
> >                                          bool from_json, Error **errp)
> >  {
> >      ERRP_GUARD();
> > @@ -655,6 +655,10 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
> >          return NULL;
> >      }
> >  
> > +    if (category && !test_bit(*category, dc->categories)) {
> > +        return NULL;
> > +    }
> > +

The category parameter is a bit not a bitmap, so, YES.

Thanks,
Zhao
