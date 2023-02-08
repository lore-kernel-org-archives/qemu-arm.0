Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp6450284ejb;
        Wed, 8 Feb 2023 04:10:18 -0800 (PST)
X-Received: by 2002:adf:f387:0:b0:2c3:eda4:adde with SMTP id m7-20020adff387000000b002c3eda4addemr6529022wro.53.1675858218813;
        Wed, 08 Feb 2023 04:10:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675858218; cv=none;
        d=google.com; s=arc-20160816;
        b=uSr6eGUpwptcgiNH5JltR1WzJH3ODTQHs0AR93uKdCYDKL2TwKQ4YRkLfDrw4h1l1a
         huRGT82VMJbYp4sdFxKsp644A0U+Gqvttx5LrXm6CBHrL8l8iGTRB0i4YgdwlP6gCnMW
         pkoWYD80xou3up2U4DlnLoiCIXDDbOeK2Zu/1u+zUaHf1+6jyX5REUpjDPCL4KI7HyZ/
         BarzR600+avM5tQFj53VWAF0qTQzwoX1mKLuZ3Yf74tPwKBjhC5kV1H3iCTFa2+c08EW
         V90VGw9ZhbPJJN1KIzOT35w9EGVs0Sy01qaE10eoEfuy5BZA/Zm/QRFL7Kc4UpLSiq90
         s+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Yj7A2Iy7u3FcfZSHeT9reKcl3NMlbOAZlTdVmXK/d/Y=;
        b=q3Hxq/XL10S1JdHXokQOpZ6UTdTl29jqWjJcx+VSe5xw7Ki55nBOlV/Hs5SZPfWuPt
         GcTnHruKrRUHfPGmowWOC8Bdm2wNVcl9s5ve71NFZw46E6B3ZmFKs5vZiFw1tzWaqlqY
         egMTSSP1VNTTPbpnOfUSdq/XEI9+3bkkI4N2cErRuZsoyBQ2d0OHaT1soXNnTKrUvb5M
         stqLHcQ1qg1ZU/ZuHHaWfZ69jhg0E0FJLfJS79XhSh8taaYv+MHvg50WL9zgVin9uZoU
         aq4YELIgzQhOCUch9ppvOfHtcp/QLSCZzu8lumWH1vMuQTIM8s8gVRA95rOUq8DCBnbT
         7qsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WwVDVsVQ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u26-20020a7bcb1a000000b003dc42f9590fsor623209wmj.40.2023.02.08.04.10.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 08 Feb 2023 04:10:18 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WwVDVsVQ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj7A2Iy7u3FcfZSHeT9reKcl3NMlbOAZlTdVmXK/d/Y=;
        b=WwVDVsVQ93fMO+mrgqv7RKjIm5mHJFBTCXK2DuEpBhfgbEPn1+cPSjFnXo3hIB9I2/
         aaqGj8OIV0lCsHDBrDrqGL/Yx8mpLdnxItSVNIl+/dfFm9sHXuYq3R4D3A7+GTfWbPOm
         OKDj/1PTIOuiwW/5Wwr7qYyIeXsPz62eE0ZMb+f0FdcmNtPIrIbB+KQf6suV9kfGV1ac
         Su97Vu2qimhbS/2Nuzj8/1P50PF42GGSENT+9bfxndb1wxSuSPaEJlfDaJg9u/NRD0Ng
         lyGJtoODLkAV4wdTpUGt9ipfGxJ6Rc4uTzGkDrXXtAnFc9DWVa3igFWloKCtW6jKQJDg
         dy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yj7A2Iy7u3FcfZSHeT9reKcl3NMlbOAZlTdVmXK/d/Y=;
        b=Ym1bGc9HDV/e77FPTIQbH37X/LMsj9cVJvkT0VWjzKP6O+4+ezDfr8P7yLCDeiehdO
         52lq04dQ733v8W1PalqdNDifkpvsEdu42FnuSD2xnU4YqCWkPBiv2UGuHBmRUtaOjR3B
         wvvpU64XnOsY/ZCCy/rbz34qCV1COMcuBEYyB18UWN3AK/QXQpwcrbVxadzIuiDlQ17z
         d7ZdkNsb4Zx/E8iIKO9L8Jmr9rGmg6spuyCczMG8ybP8tykzNBXqvm5hcmbd7+a7hL8h
         Ws7qqY8K35SLtLfVAPeuRYWSa+bZF+u29okDNuGd5AEinrxIBZXTTwc0X3nAn4LElFXO
         avog==
X-Gm-Message-State: AO0yUKVvF7sv5jZyVwP4JIh/+xCk6Rb5JIr45EAZIi/hq+rOkPv7pWEX
	M9Ni/mwHXj3x3dN7frOimNTZu+2R
X-Google-Smtp-Source: AK7set+V+TidhEf70JlG5vUum881/TglNroruZGMt5W5dh9HSuDU3mexIT3cOm9iB/6wOPi+l649fg==
X-Received: by 2002:a05:600c:3093:b0:3dd:37a5:dc90 with SMTP id g19-20020a05600c309300b003dd37a5dc90mr6412487wmn.32.1675858218617;
        Wed, 08 Feb 2023 04:10:18 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id c63-20020a1c3542000000b003df14531724sm1812791wma.21.2023.02.08.04.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 04:10:18 -0800 (PST)
Date: Wed, 8 Feb 2023 12:10:13 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
	berrange@redhat.com, eduardo@habkost.net, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 08/16] target/arm/kvm-rme: Populate the realm with
 boot images
Message-ID: <Y+ORJftuXd2DjV3F@myrica>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-9-jean-philippe@linaro.org>
 <e43446dd-e6d9-3591-aea8-c77dc83dcd8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43446dd-e6d9-3591-aea8-c77dc83dcd8b@linaro.org>
X-TUID: VG9JYDM+AuuJ

On Fri, Jan 27, 2023 at 01:54:23PM -1000, Richard Henderson wrote:
> >   static void rme_vm_state_change(void *opaque, bool running, RunState state)
> >   {
> >       int ret;
> > @@ -72,6 +115,9 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
> >           }
> >       }
> > +    g_slist_foreach(rme_images, rme_populate_realm, NULL);
> > +    g_slist_free_full(g_steal_pointer(&rme_images), g_free);
> 
> I suppose this technically works because you clear the list, and thus the
> hook is called only on the first transition to RUNNING.  On all subsequent
> transitions the list is empty.
> 
> I see that i386 sev does this immediately during machine init, alongside the
> kernel setup.  Since kvm_init has already been called, that seems workable,
> rather than queuing anything for later.

The problem I faced was that RME_POPULATE_REALM needs to be called after
rom_reset(), which copies all the blobs into guest memory, and that
happens at device reset time, after machine init and
kvm_cpu_synchronize_post_init().

> But I think ideally this would be handled generically in (approximately)
> kvm_cpu_synchronize_post_init, looping over all blobs.  This would handle
> any usage of '-device loader,...', instead of the 4 specific things you
> handle in the next patch.

I'd definitely prefer something generic that hooks into the loader, I'll
look into that. I didn't do it right away because the arm64 Linux kernel
loading is special, requires reserving extra RAM in addition to the blob
(hence the two parameters to kvm_arm_rme_add_blob()). But we could just
have a special case for the extra memory needed by Linux and make the rest
generic.

Thanks,
Jean
