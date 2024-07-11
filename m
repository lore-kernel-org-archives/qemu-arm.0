Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp161800nji;
        Thu, 11 Jul 2024 06:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7kkdG5lbs8caIxzZaldYP6zW0tRj9oLgZN74BKzC4sQ5uTPMA25IoVcEoM5Pn/h203+BCBBcn50LTtcrm50GNrzdBnL6F
X-Received: by 2002:a05:600c:63c7:b0:426:5f0b:a49b with SMTP id 5b1f17b1804b1-426707e360fmr50145875e9.23.1720703003707;
        Thu, 11 Jul 2024 06:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720703003; cv=none;
        d=google.com; s=arc-20160816;
        b=IGt4XKodmeyQ8xXxnNK6Ipz/iL0zxZAuVudp7bBCHzdmROmllq+5/JmAu+2ewnpXkq
         BwEmk8XZjziyP8ueRC/lVmxbwXovjOGVYawD9v09uMSvdbbDNuH8fNPGdpD5tjn3a8fV
         8WvRAKe0bO60JYp+2FRFppFXSnu9E29+UvhPP/XBSkcxiWup0h073JRXdQqSFtB03rkM
         CA5UBAhd6Eh7k/iMl22xP+t8vk9lZEf4KGJznFHtIsptngP0LIScEurrqaylTo7bhWB5
         ES9SPl0MndaGjc9W3aOrutTAO3n/igEsSNkY9ltaTHI1Z212XrRxNjh4U5pJHT8wAeP4
         bGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=T1tEsDBDWsovvb9XXtE9YS/ok36swrWeL71lNKwHwT0=;
        fh=KEaT9gbigjWAVYjFNSJwByrKX8d4S+6bmJ373KhPcjE=;
        b=xu1AXu3yaqw5FDFKWNiVIoGW4TkNdvtmliF+1OIvu/x/0njQBZsQAhELHVayiLxecC
         es8SKAqSG8Dje85EhZGxorOMOlvQ43pD/oa2FtgjnpniMeqhR2dPeGoKTEIwdRKbRqO8
         MJ1N7gGZsCN1FR3dL0C9To49G/2SlEi89ucZHDtcA6PL7QA0YvzQVTu7fUBjg0ceu1fH
         G5C4DTdtefumAlU+RJ3hD6+4ibw5im+W/VYmAaS0+JXdp9h5cq9kwR5D7DC4oCE16DyZ
         as+lKCsbpRDZ4j+grN3/djvNrs0RDqyVZ0m7Z5ScRQcbAy34LGiiO9tpeX9lX/klkeXb
         GRvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OAAfqAZ8;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42798c03ff9sor635135e9.6.2024.07.11.06.03.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2024 06:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OAAfqAZ8;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720703003; x=1721307803; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1tEsDBDWsovvb9XXtE9YS/ok36swrWeL71lNKwHwT0=;
        b=OAAfqAZ8x2m2fAZz689yOLw7JD8B3sPOOqYAtLEOQ7FSG4kjHhqKBHFTzcW/Np8p9k
         tsEbuckRyhO5kb2Hv4Rbreyrn9TuwYAT24iN4SmetfLL50jewQL0uUy73d9Er6nOsnd8
         V7GrhmAQDuZqzVnLMeNvQ3azVD5yDvfV0oXqUMEeCBsu9CLWlpT/Z16JfoKCbK3yQo3c
         +qWdgF3YIONVmtRZO12TkqApyv790vmkOIssnmRqiErGC/iEVGABsYOrITQhSV/Jcv2Z
         tM/ZP+rwDCQPYWt4mI/yCCKyuODGclw+LjatznbHbKZ1KTlhNJD9jwG5xCMN6hzPHVh2
         tHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720703003; x=1721307803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1tEsDBDWsovvb9XXtE9YS/ok36swrWeL71lNKwHwT0=;
        b=qkjtGAGNjm7jY4W6cVoHWh80V8M5SdOZ3iV4wa6XnB5KFjc9/DXPBvl7jpq4+0SSdh
         h3FW0njCSq+j+6URbiRL8jsRQHPVIUaQFGVsEl8ngwO5GyBi4jq1ntPb4216zYIsdvC/
         afQzan1oO36sFe2MZj/YIrFM663S/sqVzNdXMG3MwdV3oGP8Ot8HEzmhFvaNFOkVvGoC
         CWdPRMXHshioFiewoIswqS6YTy+O9bkN9ncFoz+KHdnFINhi9NUDlGUZLRi16MTlWKhg
         Z2yfiuy26dAAqkF3yGzQjH5ImRIRRfTo4AbeM1NOtlPT0fBpPxYhuouOAM5Yi0gpuExM
         o65A==
X-Forwarded-Encrypted: i=1; AJvYcCVjsEzhDdNOv73ftVVudTag7Kj5qotmk0H/goY6N+IicyrGH2CW1dboUQiAXB0m7nVDQ1HC1XKkNVg0QeUNvgQsdwD3Z2xa
X-Gm-Message-State: AOJu0Yw8J57iCrOZTRMfnyp7jcH2gm8XYk77RmiO7DI2Y8q1a6ygqIQ3
	IpUyrA3YVtDzhPSoIYej4EH/lkG465M/d4D+/igeGTlVySSqXN0p5TWeaTXZkw==
X-Google-Smtp-Source: AGHT+IFTOGfXRoqpDnrKQAF8LEdAv9irjpAvHVwnuvazB1I19VdY8/QDaMO+oN5nIgRYT0fFU+XY2w==
X-Received: by 2002:a7b:cd95:0:b0:426:6e95:6ea7 with SMTP id 5b1f17b1804b1-427986dc130mr1787535e9.0.1720703002903;
        Thu, 11 Jul 2024 06:03:22 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427270238a6sm84986905e9.20.2024.07.11.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 06:03:22 -0700 (PDT)
Date: Thu, 11 Jul 2024 13:03:18 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 08/19] hw/arm/smmuv3: Translate CD and TT using
 stage-2 table
Message-ID: <Zo_YFuoldgMzJ5Pj@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-9-smostafa@google.com>
 <20240704180843.GE1693268@myrica>
 <Zozi-87pVHOdwJGN@google.com>
 <20240709130004.GB2189727@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709130004.GB2189727@myrica>
X-TUID: sK5kv/40wJqk

Hi Jean,

On Tue, Jul 09, 2024 at 02:00:04PM +0100, Jean-Philippe Brucker wrote:
> Hi Mostafa,
> 
> On Tue, Jul 09, 2024 at 07:12:59AM +0000, Mostafa Saleh wrote:
> > > In this case I think we're reporting InputAddr as the CD address, but it
> > > should be the IOVA
> > 
> > As Eric mentioned this would require some rework to propagate the iova,
> > but what I am more worried about is the readability in that case, may be we
> > can just fixup the event after smmuv3_get_config() in case of errors,
> > something like:
> > 
> > /*
> >  * smmuv3_get_config() Only return translation faults in case of
> >  * nested translation, otherwise it can only return C_BAD_CD,
> >  * C_BAD_STE, C_BAD_STREAMID or F_STE_FETCH.
> >  * But in case of translation fault, we need to fixup the
> >  * InputAddr to be the IOVA of the translation as the decode
> >  * functions don't know about it.
> >  */
> > static void smmuv3_config_fixup_event(SMMUEventInfo *event, hwaddr iova)
> > {
> >    switch (event->type) {
> >    case SMMU_EVT_F_WALK_EABT:
> >    case SMMU_EVT_F_TRANSLATION:
> >    case SMMU_EVT_F_ADDR_SIZE:
> >    case SMMU_EVT_F_ACCESS:
> >    case SMMU_EVT_F_PERMISSION:
> >        event->u.f_walk_eabt.addr = iova;
> >        break;
> >    default:
> >        break;
> >    }
> > }
> > 
> > What do you think?
> 
> Yes, I think that's also what I came up with. Maybe it would be simpler to
> unconditionally do the fixup at the end of smmuv3_translate() and remove
> .addr write from smmuv3_do_translate()?

I wanted to make it clear what case causes the IOVA to be missing, but I
guess if we unify the setup for the InputAddr it would be easier to
read and just add a comment instead.

> 
> A separate union field "f_common" rather than f_walk_eabt may be clearer.
> 

Makes sense, but I will not do it in this patch to avoid making it larger
and harder to review, and this can be a separate cleanup as I see in other
places we use eabt already (smmuv3_record_event and for s2 population).

Thanks,
Mostafa

> Thanks,
> Jean
