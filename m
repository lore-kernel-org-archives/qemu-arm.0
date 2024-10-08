Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp50573njl;
        Tue, 8 Oct 2024 01:57:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNyHy94nHvPg96iBHwaVERZLlRAsR6Pfg44/4aQEXHhX/FuemtyBDkDBbfXVCnWXIFgMIG/3Y5+x9EAg==@linaro.org
X-Google-Smtp-Source: AGHT+IEANVaK4JFnbOWBWK0ba5rKK2pkJIaJfxgTqYKozHFrys6R7uXg/Hk6/u+UMl4WhHri+hyL
X-Received: by 2002:a17:903:2445:b0:20b:ab4b:544a with SMTP id d9443c01a7336-20bfe49471amr235175675ad.43.1728377868014;
        Tue, 08 Oct 2024 01:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728377867; cv=none;
        d=google.com; s=arc-20240605;
        b=O9wocL+7ilsn1GTIpppUJlpfBwKNt4qRAuQo772MmolABv+o32GASWCITOhbzYef3+
         zmQr4oD1D/RbjinsvrL+wSKUMRem+4+wBDpFlhGczc5RAW4sBUntSVuCM2BjNUQ1Zsuz
         zE8CJwC2GTKpSgyH1/DY2WirgQu6iBfXHgXHVj7eNyv1eq2DqpzmwiomJHGmkcF04KoI
         LRYQh3+mO1EEJZvZCgFYamFpeeSHmLj4Fk+9SILIjcX2M4q6Kbk3SqMOyjVWj8UD73ax
         nERPUScxcyvX0eSHK5ZLdE9t2ufXcggOL3xQAuN0+i0GkA/XvPocDxlQKrKgyEIhRKho
         Jabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=tqTIfk/s5GR1HWM8+ZHyrT2n8dRPxzc9xsmZWIcngLY=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=IAXRan9Wsui2wnHaoNleA7L8nB7Nkl/kj1joSO1Cb/OT29oEIlXofV8RLdYMBDEEqg
         5Xey4aQfQRYHxBuLzvGllY7m0d7ul7SBgx+/arVWQsoQCUf8FjBHJOk5ARcfqnQvyuK/
         B5r5aVcy94B3UruuuZwxRlNnmqcECYQRsWIkGL+eal8H83CCFuB3QzPsC9szJmenItwq
         qrRBECh0e9pOoZS/WPJm5eSPEsS0m++ZP/FNgWszpbe1mVBWdrKmik3ZPvc7YdT2kVzi
         VqN7PRtVsndWIYgWQ2IvXtFVOjg1aPnW+1Khh9OWXdjxe5Wyp+DOHx45e+uRpWL309rP
         S6bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-20c138b03a0si15182645ad.5.2024.10.08.01.57.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 01:57:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XN8zY4dkHz6K60q;
	Tue,  8 Oct 2024 16:57:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 029A0140CF4;
	Tue,  8 Oct 2024 16:57:44 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Oct
 2024 10:57:42 +0200
Date: Tue, 8 Oct 2024 09:57:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 4/7] hw/core: Check smp cache topology support for
 machine
Message-ID: <20241008095741.00003dbf@Huawei.com>
In-Reply-To: <ZwPCHRRdYD6/S7GN@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-5-zhao1.liu@intel.com>
	<20240917095612.00007b5a@Huawei.com>
	<ZwPCHRRdYD6/S7GN@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 0XHi1dt8okW8

On Mon, 7 Oct 2024 19:12:29 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> On Tue, Sep 17, 2024 at 09:56:12AM +0100, Jonathan Cameron wrote:
> > Date: Tue, 17 Sep 2024 09:56:12 +0100
> > From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> > Subject: Re: [PATCH v2 4/7] hw/core: Check smp cache topology support for
> >  machine
> > X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> > 
> > On Sun,  8 Sep 2024 20:59:17 +0800
> > Zhao Liu <zhao1.liu@intel.com> wrote:
> >   
> > > Add cache_supported flags in SMPCompatProps to allow machines to
> > > configure various caches support.
> > > 
> > > And check the compatibility of the cache properties with the
> > > machine support in machine_parse_smp_cache().
> > > 
> > > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > > Tested-by: Yongwei Ma <yongwei.ma@intel.com>  
> > 
> > Just a few trivial comments inline.
> > 
> > FWIW with or without those changes.
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> Thanks!
> 
> [snip]
> 
> > > +        /*
> > > +         * Allow setting "default" topology level even though the cache
> > > +         * isn't supported by machine.  
> > I'd flip the comment as the condition is doing the opposite.  
> 
> OK, it's more intuitive.
> 
> >             * Reject non "default" topology level if the cache isn't
> >             * supported by the machine.  
> > > +         */
> > > +        if (props->topology != CPU_TOPOLOGY_LEVEL_DEFAULT &&
> > > +            !mc->smp_props.cache_supported[props->cache]) {
> > > +            error_setg(errp,
> > > +                       "%s cache topology not supported by this machine",
> > > +                       CacheLevelAndType_str(node->value->cache));
> > > +            return false;
> > > +        }
> > > +
> > > +        if (!machine_check_topo_support(ms, props->topology, errp)) {
> > > +            return false;
> > > +        }
> > > +    }
> > > +
> > > +    if (smp_cache_topo_cmp(&ms->smp_cache,
> > > +                           CACHE_LEVEL_AND_TYPE_L1D,  
> > 
> > Short line wrap.  Maybe combine the two lines above and similar
> > cases.  
> 
> Like this?
> 
> smp_cache_topo_cmp(&ms->smp_cache, CACHE_LEVEL_AND_TYPE_L1D,
>                    CACHE_LEVEL_AND_TYPE_L2)
yes - that's what I had in mind.

> 
> > Up to you though, I don't feel that strongly.
> >   
> > > +                           CACHE_LEVEL_AND_TYPE_L2) ||
> > > +        smp_cache_topo_cmp(&ms->smp_cache,
> > > +                           CACHE_LEVEL_AND_TYPE_L1I,
> > > +                           CACHE_LEVEL_AND_TYPE_L2)) {
> > > +        error_setg(errp,
> > > +                   "Invalid smp cache topology. "
> > > +                   "L2 cache topology level shouldn't be lower than L1 cache");
> > > +        return false;
> > > +    }
> > > +  
> 
> Regards,
> Zhao
> 
> 
