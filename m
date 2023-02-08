Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp6449057ejb;
        Wed, 8 Feb 2023 04:08:28 -0800 (PST)
X-Received: by 2002:a05:6000:1211:b0:2bf:95cc:744f with SMTP id e17-20020a056000121100b002bf95cc744fmr5945089wrx.56.1675858108037;
        Wed, 08 Feb 2023 04:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675858108; cv=none;
        d=google.com; s=arc-20160816;
        b=ALlvnunQ9dTk9yuLfYvhCC+oO78d3BZcAXL8qB/4M55nL6XGR9HTbYHnxL+S7dvdwA
         BGnEYS2ztrCeAt9pUCirtZvlcGIYG2HAlUbYVLB3LAL+UfG4qWYk8vRu+lW29Avg2xfY
         DXgXviRQPQt6jtLcYO12Zs5FV/SAsUAgoZJiOJqtZg7006WcWMjoOffa247lx6TOeidd
         BrFwLh3z+ccT7BNqwyfvi3sPMBuuxtcqNaTIFX9GaIe8xh5wr5pn4+/ASC9cHLVvn1Tm
         IGphigm56ATr9hLEEAJuJ/oDPfZpyEv83L5sgtB/G/QLsZ93Kb8wyfYg520/6deJNzOP
         mh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Q4rbePfwHcTQS8Q3p4+GaUBlxWCk6uuCllBf0wNPDsA=;
        b=Qwq7eH8PpP8FWmbBhCMl00EYIF2ZGm5uBtYUmPQ8iCp/GVCPYarNAN/c4AFB2PABda
         rzI9EfclhJXy9AdPp2OHaYVd4nFQyC6njK48jVxVrPDRwem3rdI3gLndKksROY/LESOw
         ZxiXwCT3Is4ZDNdQroThGDK7OaYJSW51Qj/9KD5Drw5i+mkbf0GIZM0p45MdT5+8JyHt
         LDmg6vG8NSAIg/wXIGgFmX3cDBI7ZsDk9pemAGANDjp1VvFdWE2o9z1dVaGnN41+cbYp
         X9xHN8MQ/kMeUFeu7q3qUfffPjWP3cxyTw5MLFfH9DHg5rf75KIuLS8B9xPjQCPyCtgc
         qBQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5HeK+Hl;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay10-20020a5d6f0a000000b002be01aa1a46sor6207483wrb.5.2023.02.08.04.08.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 08 Feb 2023 04:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5HeK+Hl;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4rbePfwHcTQS8Q3p4+GaUBlxWCk6uuCllBf0wNPDsA=;
        b=i5HeK+Hl/RX7/TYppxtRahC2bt3iV0eoaCNNNmlf7fKjSdvwUvxmLZ/mooRJvgjvcN
         IVzS76XgY+l2t5+ZQo/dBwuhe5bVu8aF1U3Ug63+Xc+JLUpYLrJh7DgSPiJ9TbN/8nEA
         oQxc3QUxgWmPJTN2F3k6v4H+ppXqg29PD5TUwBhlV6Kxj2b1L8VXFnobQt3HwODM7vG4
         v1D/oilmFPekV/OovcuSdxyZPRv/agSJhkrdSyJ5UEewDQ51dxuddiHTZuBsgbX4No8A
         WE4gS6ju6kQU7r+jz2dfolunQpabWn8/SqnrMnD1GGMipLgRmhcr+IEfWVaPcPoWMuRp
         qOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4rbePfwHcTQS8Q3p4+GaUBlxWCk6uuCllBf0wNPDsA=;
        b=zYHj3jZ2APA+HnwHz8LE9xPoX9vCT8TFDm/ocwn80tKCd5yJi6B1Nqs87NU9PnUjI+
         vSbZ4GCXp/b/QTo2hK19LVcOij4FnZkGwUv41RWy90KU3oMXmuUrH9AHq54ToVJbBeoK
         JgZwGD2YXso6T9xPxwk8ZJ9Ubv1GNJUO9/jGO+VH0wJIVge96DThpEykQXX7/zgUhU8/
         GluvxXL/3Su7/QPdWUR68zCp2ScL/Eo5LYQsxAa8tTkP0N1OiExevNJgeQ1bbPjPiFYq
         yFwJ3RIKLUgqQNHXdktgCAA8+/3AZN4Qv2JFhcoMANeCMBbEdft/+iZ93Qn2UqmIFt4w
         qK2g==
X-Gm-Message-State: AO0yUKWKAJx1Xkg6GfchqiLxxJ3gvU8KeCQTunZm0FymBlWeRFSHfI28
	jDdypXWyOkduLuMPpHKJcCUOErbP
X-Google-Smtp-Source: AK7set+yD8n4U+WP5rpf4tYpIV9TuDBVNjdlsyBLpIgk8ZQAmd3XCttjjI3xkwdLDikGtGile1gKqQ==
X-Received: by 2002:a5d:6e06:0:b0:2c3:e4eb:3c12 with SMTP id h6-20020a5d6e06000000b002c3e4eb3c12mr5574176wrz.64.1675858107755;
        Wed, 08 Feb 2023 04:08:27 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id d13-20020adffbcd000000b002c3f6cd1f0fsm3366884wrs.83.2023.02.08.04.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 04:08:27 -0800 (PST)
Date: Wed, 8 Feb 2023 12:08:23 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
	berrange@redhat.com, eduardo@habkost.net, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 04/16] hw/arm/virt: Add support for Arm RME
Message-ID: <Y+OQt1r2f9hATsMQ@myrica>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-5-jean-philippe@linaro.org>
 <6b7d1132-9274-c019-440a-8deb84189b21@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b7d1132-9274-c019-440a-8deb84189b21@linaro.org>
X-TUID: nZ/9zUd99WP/

On Fri, Jan 27, 2023 at 11:07:35AM -1000, Richard Henderson wrote:
> > +    /*
> > +     * Since the devicetree is included in the initial measurement, it must
> > +     * not contain random data.
> > +     */
> > +    if (virt_machine_is_confidential(vms)) {
> > +        vms->dtb_randomness = false;
> > +    }
> 
> This property is default off, and the only way it can be on is user
> argument.  This should be an error, not a silent disable.

This one seems to default to true in virt_instance_init(), and I did need
to disable it in order to get deterministic measurements. Maybe I could
throw an error only when the user attempts to explicitly enables it.

> > +    if (virt_machine_is_confidential(vms)) {
> > +        /*
> > +         * The host cannot write into a confidential guest's memory until the
> > +         * guest shares it. Since the host writes the pvtime region before the
> > +         * guest gets a chance to set it up, disable pvtime.
> > +         */
> > +        steal_time = false;
> > +    }
> 
> This property is default on since 5.2, so falls into a different category.
> Since 5.2 it is auto-on for 64-bit guests.  Since it's auto-off for 32-bit
> guests, I don't see a problem with it being auto-off for RME guests.
> 
> I do wonder if we should change it to an OnOffAuto property, just to catch silly usage.

I'll look into that

Thanks,
Jean
