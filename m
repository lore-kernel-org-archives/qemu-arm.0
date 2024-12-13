Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp475037njb;
        Fri, 13 Dec 2024 06:21:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGG8nAwm2SCutGERvyWk73oGKDgUwqITtYf51FcjkH5d1xEXLOzUPVXDOwn+QTUhPbNHDSVypS8W6o+A==@linaro.org
X-Received: by 2002:a05:600c:674a:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-4362aa37154mr29349185e9.14.1734099669693;
        Fri, 13 Dec 2024 06:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734099669; cv=none;
        d=google.com; s=arc-20240605;
        b=FI/rd9G6b55edTdb9LDHQMfQDSyJTgnf3lCDai/ctl8NiAkZLlLp0CGGXV9GzosJkj
         Me8RuqNOGk//cN5v2V8D1adn31So/RcRLzw9nGXswjIryvRLrw3awQuTTO2mrS6MmwPK
         qw0xrlgYsgnUckq72OMXGGsuzJTJP+lPi0+obc3XMxP+7H3uVA1FfyFqsdmvwk8sDAby
         2ymbwBYxUJAom2ACIJz/2luUVLU19oMgTsUTGOkgyuAc2k4TmL1XlSZO8+IylYjFDEHi
         3vBZTpduLLGj00RUXm6sRDWV0BxyndlJNyvpZoumO+tQGPmADbFSKImZfVMZ3jyOGGYK
         hjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=CvAkTEd2t0N78KnkaFY7J8Ykhsjgz8VYz8UpFQcFSoQ=;
        fh=xfprfUf0LPr70Rh0PnrhOBSaVP0YnZTpf9oXd5sw1dI=;
        b=kBQSct9vdC7e0OF6JaB0BShAGWH4s04IYh7Z6B67wS3yTXzkCK1CkqXszty74nsW0+
         CA3UQJpplhV6jNvwJsucdX1vSeN++prUmzjWk1jHgZtVt6vzUYNbCu5MgVn3KCXYHF/K
         xySnfRTuQTakUhEvr1akWgsBu/fTuwTfT5p7fPNwJfACEKcwmbENL9ynDd0bo9aFODZg
         q5XR+oGTQ2rtwPffxNTDFgDVQNrzqhoNOILL76eQ1sr/G8ZAJSOCEEl8LvD/5SokkfZE
         S1LSVyZH6TfQM/bDT0lpMYTIzhuxbz9HHoXaFkfLkOPTbJSNJu6CTPGu08UeD6/FfNeU
         cBMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jlIlv7jH;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43627f36a54sor14314465e9.5.2024.12.13.06.21.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Dec 2024 06:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jlIlv7jH;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734099669; x=1734704469; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CvAkTEd2t0N78KnkaFY7J8Ykhsjgz8VYz8UpFQcFSoQ=;
        b=jlIlv7jHKxZOLpnvrSfY8KKWtCku9F+ulfppY0rCFiTxIA2aaV70ZprOLT9/2X5ZLc
         pewCdrznFC3LgjaXagFrHt2DF+hNXfjBioxab2USPweCF4zXYpSl8sRlqb+dwP/H8jyt
         d3tUk0ws+jOijAqykQP1I3rN3Bs35/8gnh3XYB/gdctw8VFY071TdnriFDZ4Sz2eGwgF
         Fc0l+n6iulwbJ+b42LpKheKDFyU6tz7j3vvc3eBgHidMgeWR8SvIQWLKp61MOGo/vRXW
         o4nhUR9H8BIk+L/Lfgkjsgrb3JMqdDtGtO5AOP1oZK69sgk1+8LNmM9T0haQwnC6KOyz
         JtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734099669; x=1734704469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvAkTEd2t0N78KnkaFY7J8Ykhsjgz8VYz8UpFQcFSoQ=;
        b=NcQSvf+zWRoX0X/wrhia7O2zAPa/EbNA14c/U2869nPguc8BLvY08YHytsGYu6o/Sd
         0IoPKiTHvppv4ZsLBuaFzcVpJe2U3p6y9fkAJf+dFngaKJJ9IMd5N4B8tI/48oBcaVvU
         E4q5ZMH/lMMH4iNOFQE5326j1cs3lrYpJUi6W9bujJxZ+ABYDWmajRD04n1WrVoKYjQt
         dbG4E63oQYr0lZgkV2KXureu74yKms065GYuokHU3U4W6+kQrkohndFTO2sO6fafjtvA
         BpV0ne6G8o7oZeTJ5daUgg5HhUAjXNfowcq2Ubp7x/M5OCf4k8As0ZiQRtQoy0GzvFZn
         tnhA==
X-Forwarded-Encrypted: i=1; AJvYcCUX7csAMtACleNjpvbvsHnqf4kRMnUqZL4PqqCLIfZ594xMF8bXQQxWQOsaW0Q+Q3QyM6ty5pDPl0Pr8A==@linaro.org
X-Gm-Message-State: AOJu0YwaDFdmL3gMEZ1F62Sd+YMg/eQ74bvjN665dv9z78SjxZ/5WIHE
	SShTdw8XciSLl4jPTOtQwKBX+wRoLZKfNYcetD4B27a/cCytQWDayPPIEtdpoPHdVg==
X-Gm-Gg: ASbGncsCm8f7SdJ0waN4nqnrSQn3VHkVOLybktQIZNbJQnS52daFUPKm1bFZKr1LT+P
	6aEAfBMmTIg/bJ+9KdhWbqYN+R4alGq2AbAFIsAw6+bAdeY5zWyRBB+oAR10ycQV8T4hQjlWj2m
	lKHRL5ic1ysn0cywtYMt7g1Rwcjr8RQKNKzJMH/N9hva7TQpA01Xov60fGmoHs+wMlA+zBGBZXy
	f1WCxq4vfb+yCKPNH8BmhP2vNLwN6RuvT2N34IKW/iFucQFfgxJLC8=
X-Google-Smtp-Source: AGHT+IFN/FsRYRGHjcAYYYKeXIveLecauk0OkpjXoob7/5bS6to2uBs27rIfd9QSYXv/8+ECb6hSDA==
X-Received: by 2002:a05:600c:a089:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-4362aaa652emr24683755e9.32.1734099669132;
        Fri, 13 Dec 2024 06:21:09 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553234sm52018665e9.3.2024.12.13.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:21:08 -0800 (PST)
Date: Fri, 13 Dec 2024 14:21:33 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 25/26] target/arm/kvm-rme: Add measurement log
Message-ID: <20241213142133.GC2962236@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-27-jean-philippe@linaro.org>
 <bf154441-1e0a-4029-946a-727621395e25@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf154441-1e0a-4029-946a-727621395e25@linux.ibm.com>
X-TUID: yjo91w8q+JNU

On Mon, Dec 09, 2024 at 05:08:37PM -0500, Stefan Berger wrote:
> >   typedef struct {
> >       hwaddr base;
> >       hwaddr size;
> > +    uint8_t *data;
> > +    RmeLogFiletype *filetype;
> >   } RmeRamRegion;
> > +typedef struct {
> > +    char        signature[16];
> > +    char        name[32];
> > +    char        version[40];
> > +    uint64_t    ram_size;
> > +    uint32_t    num_cpus;
> > +    uint64_t    flags;
> > +} EventLogVmmVersion;
> > +
> > +typedef struct {
> > +    uint32_t    id;
> > +    uint32_t    data_size;
> > +    uint8_t     data[];
> > +} EventLogTagged;
> > +
> 
> 
> > +#define EVENT_LOG_TAG_REALM_CREATE  1
> > +#define EVENT_LOG_TAG_INIT_RIPAS    2
> > +#define EVENT_LOG_TAG_REC_CREATE    3
> > +
> If these are ARM-related structures and constants from a document you may
> want to mention the document you got them from.

Agreed. At the moment they're just numbers and structures I made up [1].
I'm not certain in which standard they should go. TCG would seem
appropriate, or IETF is also used for protocols related to confidential
computing attestation. Or maybe it could live in the reference verifier
documentation. QEMU docs wouldn't be the best place because VMMs might
been reluctant to adopt it because they don't consider it a standard (like
cloud-hv and fw_cfg)

When researching this I found TCG event types and payloads that only seem
to be documented in their respective project:
* efistub [2] with
  * EV_EVENT_TAG, id=0x8F3B22EC, data="Linux initrd",
  * EV_EVENT_TAG, id=0x8F3B22ED, data="LOADED_IMAGE::LoadOptions"
* grub [3] with a few EV_IPL
* systemd [4] with various EV_EVENT_TAG and EV_IPL

I'm wondering if we could create a common registry somewhere for these,
like IANA or somewhere informal.


[1] https://github.com/veraison/cca-realm-measurements/blob/main/docs/measurement-log.md#rim-log
[2] https://lore.kernel.org/all/20211119114745.1560453-1-ilias.apalodimas@linaro.org/
[3] https://www.gnu.org/software/grub/manual/grub/html_node/Measured-Boot.html
[4] https://systemd.io/TPM2_PCR_MEASUREMENTS/


> > +/* Log VM type and Realm Descriptor create */
> > +static int rme_log_realm_create(Error **errp)
> > +{
> > +    int ret;
> > +    ARMCPU *cpu;
> > +    EventLogVmmVersion vmm_version = {
> > +        .signature = "VM VERSION",
> > +        .name = "QEMU",
> > +        .version = "9.1", /* TODO: dynamic */
> 
> $ grep -r QEMU_VERSION_M build/
> build/config-host.h:#define QEMU_VERSION_MAJOR 9
> build/config-host.h:#define QEMU_VERSION_MICRO 93
> build/config-host.h:#define QEMU_VERSION_MINOR 1
> 
> $ cat VERSION
> 9.1.93

Ah yes that would work, thank you

> > +static int rme_log_rec(uint64_t flags, uint64_t pc, uint64_t gprs[8], Error **errp)
> > +{
> 
> $ ./scripts/checkpatch.pl ./tmp/*.patch
> [...]
> Checking ./tmp/0002-target-arm-kvm-rme-Add-measurement-log.patch...
> WARNING: line over 80 characters
> #353: FILE: target/arm/kvm-rme.c:303:
> +static int rme_log_rec(uint64_t flags, uint64_t pc, uint64_t gprs[8], Error
> **errp)
> 
> May want to run this on all patches.
> 
> Rest LGTM.

Thank you!

Jean
