Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp442297njb;
        Wed, 4 Dec 2024 11:09:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNGR5HacB0U0zHYdm4IAhsF4YzkYUTyxh4EWxllquV5sQycF/sgdFFxtCJDBwHxJNu8AQRrsrE8pV3WQ==@linaro.org
X-Received: by 2002:a05:6000:401e:b0:385:e968:f189 with SMTP id ffacd0b85a97d-385fd5328a7mr6233677f8f.51.1733339398444;
        Wed, 04 Dec 2024 11:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733339398; cv=none;
        d=google.com; s=arc-20240605;
        b=SGSQzFlZZBvrUX4WRx8sW31uIQGF/qvKg/mSSEDpoi2HCqYHr1e1YySpgbVgnhknsj
         alXtWTIkG1c70/bS4ZoZH9NiV4Osqbi0bNIAQ4PN3aPOCU+hzoOuuR9I2FmR0MA934om
         KGDJLtKYn9QYoVTaOyldLKE7uZ6i7TUK2Qs7axheNyG8/lTUmE1wPYJo1RKP60rAeRqb
         igKQ8TDqNgoD2FC5hwVSrGHJ5dOptrJiqR+PgWteXH7+DoXhrJb5vmik9XKse4IdqmhF
         ZBMGFEhWLTZMo/sI8ZHhsJXs2WKYMcsvIdVZ8EMBQYVuIeoSVR6v2Ju59jxcn2jce4FB
         fq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=bOngM2USHeFq8uTvg6lBb0tN7fu7f0bTGVR8zQJEEB8=;
        fh=ny40lFFwdIC330+dahmNWi0akCGcloLXfjrKzeI+0Ks=;
        b=AeV99yrPNKAaT5QjzBrTJvb14dcmKn16yX+f21dpWvWvtVxn+5MUdV9/O78jncSCI8
         Nt1cfsybPzeKsDHIdOgvqv/deuvl46JhbfT0GIUfqX41kxfWvAsmhaArkcuXEK5Otxzs
         JMPYld/FNH6I1a9KOO2ScWFqrCRYk36XvQ/dILtXIGwohZaCGGwfLRWzXiIjKkcJcPaG
         1l674i3PcTXVhpNF6gevhoyKR00J8CRbc6MuwBohht8WHwmCjssNZP2mxOCCYr6EzxUm
         raSqWtdWrZIEbNI/I3s7YgRxQC6cwyejG4y8KX7ZF8lixcwRxVsEYY8Gq/iqraT1V+Ao
         nhNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODIJYyGp;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ebb9db68sor2076582f8f.9.2024.12.04.11.09.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 11:09:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODIJYyGp;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733339398; x=1733944198; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bOngM2USHeFq8uTvg6lBb0tN7fu7f0bTGVR8zQJEEB8=;
        b=ODIJYyGpHpfXMl//CQX/qQpiueFANO/cXQrAFnZ1S7iRIDX/Pzhd7rt5kb0VPTDmMa
         V+14mLqgY/15AIJNaJ2YhxkROQFfHwKjHxnM9/VhSejf9WMERlSb3H0T2tzMYNRlyR8N
         HmaIsPxam+XhWMNDbVTPNo8fdqInLjfAmhSn++91xc6NkRSOBIiwuCHtt0awixovmHG9
         L0I+SWITUEraOGi6lqov2W9RsSIRXVs98QLgq5MmAsv3qDIUDZ29ij9x11V5bRmEvpTE
         dX/ZyxEKH81eFasP7kiSgEUtABr/CN3DIHAVA4Lhn1RQeXwJb/HmAN9dmlu1LVLoaxul
         1cbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339398; x=1733944198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOngM2USHeFq8uTvg6lBb0tN7fu7f0bTGVR8zQJEEB8=;
        b=b4UOFybXiAZutEHWSMblL5g2FYGT71RSuamo7kLuOEnzWthw8y3/JbaCFMdb3lx4iB
         Womwx2pUlOS+h6qY6MRjJ4xALVka0V/aXeaA3xqn08cHwQWzI6nOMopUjmyhyikf9QVz
         U2SoZPjv7BtXztDUOHycfjoZfo+YRD2eM4U45F/E26Ob8BLX32pBZXb1h3CI43vWDwjF
         CJx6CTQLGVkHG0oOvH/vVLuCcAvHroKG47F51tt60XFjDrTPEKuBdIjGhn1xcP29/3V2
         pZeRfqjq/NeFD7j4YK9D7hv6rdoM4LBHWyj+3VNIulnHF+5yMrb5INzVkzMX4UQ+Y04Y
         PcUg==
X-Forwarded-Encrypted: i=1; AJvYcCWlkO214kadjVwVZMZprg2mXiuVLxTeycAHuCXyNUWXUAYC3Tpqr1XcbWu4ch2vO4K5Z8r4t4sVr9w3oA==@linaro.org
X-Gm-Message-State: AOJu0YzZIwlkVl2jTffiIJPn4fy5usYkgRMpT/DE1IJZYZL77VedItkD
	YZGDIe4nICPjDwt9BAcgDYtbs0Rai3sXr6Mz+BmOYzYb5X0zWTYFwxmLoUtbejipqw==
X-Gm-Gg: ASbGncu/Es+VYzbLV0olEQWKwBBKFFJNAwo+S2A3QSeuAm3ZYQNhXmiafgytZ2iujdp
	vPKsM6sLEWmCloRqdIZSdK1etQZw7/TA8yHLGdCC36Kn4qrQyyaapYyp4LGIn69cFXlzkP7n7AS
	/IJ2DWqclH0sU5dbZpDNd3wZuIfvFmVtsGKpAfb1FlhiZyKFYLJtTJJ546Rvx8xz0CK8a//N/aH
	MWM5/jOjv/msH8nmD0eUAQ9vZyac6fmJ5C2423qC9xTK4TK
X-Google-Smtp-Source: AGHT+IEysxLskTX7ub6F4QI9uApjoI3rJA+U0novnGuunCkTE/hNmntYybCKTu+FYjbWjcabq6TTBw==
X-Received: by 2002:a05:6000:2a85:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-385fd3f92f8mr5259423f8f.35.1733339397938;
        Wed, 04 Dec 2024 11:09:57 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e5b10478sm13531553f8f.73.2024.12.04.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:09:57 -0800 (PST)
Date: Wed, 4 Dec 2024 19:10:16 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Eric Blake <eblake@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 10/26] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
Message-ID: <20241204191016.GC2349278@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-12-jean-philippe@linaro.org>
 <87wmgqsbp1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmgqsbp1.fsf@pond.sub.org>
X-TUID: awlb4eYExUPQ

On Tue, Nov 26, 2024 at 08:20:42AM +0100, Markus Armbruster wrote:
> > +# @personalization-value: Realm personalization value, as a 64-byte
> > +#     hex string. This optional parameter allows to uniquely identify
> > +#     the VM instance during attestation. (default: 0)
> 
> QMP commonly uses base64 for encoding binary data.  Any particular
> reason to deviate?

No, I think base64 is fine for this

> 
> Is the "hex string" to be mapped to binary in little or big endian?  Not
> an issue with base64.

(It was big endian with padding on the right)

> 
> Nitpick: (default: all-zero), please, for consistency with similar
> documentation in SevSnpGuestProperties.
> 
> > +#
> > +# Since: 9.3
> > +##
> > +{ 'struct': 'RmeGuestProperties',
> > +  'data': { '*personalization-value': 'str' } }
> >  
> >  ##
> >  # @ObjectType:
> > @@ -1121,6 +1134,7 @@
> >      { 'name': 'pr-manager-helper',
> >        'if': 'CONFIG_LINUX' },
> >      'qtest',
> > +    'rme-guest',
> >      'rng-builtin',
> >      'rng-egd',
> >      { 'name': 'rng-random',
> 
> The commit message claims the patch adds a parameter.  It actually adds
> an entire object type.

Yes as Daniel noted this belongs in an earlier patch

> 
> > @@ -1195,6 +1209,7 @@
> >        'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
> >                                        'if': 'CONFIG_LINUX' },
> >        'qtest':                      'QtestProperties',
> > +      'rme-guest':                  'RmeGuestProperties',
> >        'rng-builtin':                'RngProperties',
> >        'rng-egd':                    'RngEgdProperties',
> >        'rng-random':                 { 'type': 'RngRandomProperties',
> > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > index 83a29421df..0be55867ee 100644
> > --- a/target/arm/kvm-rme.c
> > +++ b/target/arm/kvm-rme.c
> > @@ -23,11 +23,15 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> >  
> >  #define RME_PAGE_SIZE qemu_real_host_page_size()
> >  
> > +#define RME_MAX_CFG         1
> > +
> >  struct RmeGuest {
> >      ConfidentialGuestSupport parent_obj;
> >      Notifier rom_load_notifier;
> >      GSList *ram_regions;
> >  
> > +    uint8_t *personalization_value;
> > +
> >      hwaddr ram_base;
> >      size_t ram_size;
> >  };
> > @@ -43,6 +47,48 @@ typedef struct {
> >  
> >  static RmeGuest *rme_guest;
> >  
> > +static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
> > +{
> > +    int ret;
> > +    const char *cfg_str;
> > +    struct kvm_cap_arm_rme_config_item args = {
> > +        .cfg = cfg,
> > +    };
> > +
> > +    switch (cfg) {
> > +    case KVM_CAP_ARM_RME_CFG_RPV:
> > +        if (!guest->personalization_value) {
> > +            return 0;
> > +        }
> > +        memcpy(args.rpv, guest->personalization_value, KVM_CAP_ARM_RME_RPV_SIZE);
> > +        cfg_str = "personalization value";
> > +        break;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> 
> This function gets called with @cfg arguments 0 .. RME_MAX_CFG-1, from
> rme_configure() right below.  RME_MAX_CFG is defined to 1 above.
> 
> The switch assumes KVM_CAP_ARM_RME_CFG_RPV is zero.  Such assumptions
> are ideally avoided, and alternatively checked at build time.

Ok, I'll change this

Thanks,
Jean
