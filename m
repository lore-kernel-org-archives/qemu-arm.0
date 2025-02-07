Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp289311njb;
        Fri, 7 Feb 2025 07:57:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXPRNEjhT9FZYzk2wd+eYEy71dONoe0glyJaiKY4mstenmfpnsCmVwEIW9KPhg31eLUjK5vTaG0iXFcHw==@linaro.org
X-Received: by 2002:a05:6000:400f:b0:38c:5bb2:b932 with SMTP id ffacd0b85a97d-38dc8da64damr2660785f8f.3.1738943835824;
        Fri, 07 Feb 2025 07:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738943835; cv=none;
        d=google.com; s=arc-20240605;
        b=Ls3gtetyLUiZsTTeESs6ox1TiozzKiQ1eaVheiSlU30y2/AuntLY3XB92eagIFA35h
         kT+59eRitNv7NDMvsT7tqALZ/KvpMFdVfPT+LxKkxs+38tkBGnf4f6KD+Sq8CoMlhGeD
         qUuUW8BNmMStpAFLg0VqqGofZWNKqNkPGW+JVKMyk67vztwMwZe9WLNND52edKB1gnbK
         EEk4wGGu8B8/HdGeqQgseymfPTY1fu5T8fKqN8a0En869XcAorGd0Bv4htT6YfKsRVa4
         HFLb9rHiGhqGPnso2D7qM69op8+9H9ywl/4j+0lOFIeRtHLa0DjeTnSb63oACYnxzKH+
         ypuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=jqvGFtgLIcssDAnzxgAxV/XWOhETlMnJ77XRKC1k4ck=;
        fh=x6APFmbnck5evsJd+X0DlOgXg4mWZKViJLCWlzqHOKo=;
        b=jMFusoTTzdYOO1J6AeK9D9VdyGIsX1lkCIKn5PZ+uj8lSMIVpiTldblhuwC3WB+XSM
         v+bjOhusL9OTvnRY2abNJlNjJEjk2xe51CuAJVo9HHPhGDX1/BMT7+qFrGkQfy15/uzo
         bIgf9ce+FUaM/Q1lHmrbMpmm8gglCxD6RLPJR515R8L3MGTLbho3s9RGoigGZLu1oMhb
         +q6uzY1cL4793y8/+okpDUZoOhVFjYsdC1mmMy7UjK9zCjquGdJAjkVEjtvG8h2/N0vO
         dneQxI8GoeUnEcTiomAXuJFw2Mx/8Ts3NPqE5u2/1W8r8Sv0CVnOjSZOYKVNKTQkiwJI
         nEvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSgAyjwM;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38dc6d4f4d1sor1134912f8f.4.2025.02.07.07.57.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Feb 2025 07:57:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSgAyjwM;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943835; x=1739548635; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jqvGFtgLIcssDAnzxgAxV/XWOhETlMnJ77XRKC1k4ck=;
        b=vSgAyjwMZ2qPiW1yEk8NXt+supgm3F9riJxhfZY4ZSuxrzJoJGP5NYzIkBwKxScmqH
         gfO6PHOwqTp2RL7wHNL9pKmJk3rksbwM3SxG1DK3NnbvbZh3W4OJ/GQ2J91XXbrX5hzl
         +XxHf8+oq8stFWqeCwQGE+KMBO6emlqU3EBfRmDONZ7UtMLsnqeNKEeo//NkiNcs8Yaf
         i54DnJoo67RuHo6jzjUTBxvlnWz0OMSq6aaYgIfhtDaVMFXzdcXbIpiVBVtLiZVPmqaY
         pFknLe0znY/lVOq816Rpv1tWlOy4/ltIT+rNyk+zRpxF9iDTstaQD55JHAkxtmsCV8Gs
         Bg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943835; x=1739548635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqvGFtgLIcssDAnzxgAxV/XWOhETlMnJ77XRKC1k4ck=;
        b=i2CoFE7Q+r9ZYek347cnwDqx/YGVpt+z1jchim1SdAW7Zh+Y5vrZ3pzIuuXzJzBrOw
         xIHlNUR0RgN2tVri72SDYFODWnVmeORv1o62fQlhblEoxMvNY2Nsw+iMgQkUcwoGGZWF
         nNyHi3Ph1fgXsq/6WnJpQc+KRPoIa06JJDypR0I7o9xuzrh4PYw2+eIDcs6accUCisRp
         jclf/NU/B3qiqNqGovTz2mv+UnDcjBGiKhjpruw9U87I67O16FTPJ/voz8yKzyRsAUAM
         yiLwz6b6A8512aI6IZaVEiLPPkpYZeV/GQObi4lluZltBqEmbntgKq/KrGJ/Y6v7jQQJ
         XaHw==
X-Forwarded-Encrypted: i=1; AJvYcCVnIXyPjmm5s3WN1sFaW9irTLcfD72UflxkA9geoZzklO7Zp0quMlcLc2+3ZRTza+BN1x/Sy9yQzKYOmg==@linaro.org
X-Gm-Message-State: AOJu0YyYbxS5iwCYPuTbgijJ1/UilFcb+nIhpzMkO3HoEe+++fHe6emu
	Ohxv9oojlGGthfRWoPPMSnNuOKbw09d3xsL2BZKjgoMovmiVS/iougLO3cO+1M4avw==
X-Gm-Gg: ASbGncuYQR0x+MfYR24nGwm02f5HTXgKhfxPhwQWPHh/4etRHp0mlIpFgMa445hCGt3
	J2fz0EZZMBA9RcBUzbj0QtMlRekJDauDcjP1aCCWFmujjQ1jBEjvlGexAz3WaXtHKqsy7aB+Mg4
	0HdMPBa8ewGeBiDMqIq20t9W0QFks2Scr+CUwfQygcuiCkS8TIAshW1YIXHNXzWAyhvGwDwkDRG
	6D7nX3P47104q+Ru17iU6i2MfINSNeZJ7HouQW0merlEDsXKcUwhwk69VGCyzHAr/nheqDzK0gR
	It+CsmYCmdmAeA==
X-Google-Smtp-Source: AGHT+IG0i0l5YpSBv7JUxMbvMfBfChO+FTI9m1yzLejFjQzYD8mDS4GA4acnoVtaTqBUwe2XXLFxaQ==
X-Received: by 2002:adf:e90e:0:b0:38a:41a3:ac4 with SMTP id ffacd0b85a97d-38dc937334bmr2151278f8f.45.1738943835257;
        Fri, 07 Feb 2025 07:57:15 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d9334e7sm93748775e9.6.2025.02.07.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:57:15 -0800 (PST)
Date: Fri, 7 Feb 2025 15:57:39 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org
Subject: Re: [PATCH v3 08/26] hw/core/loader: Add ROM loader notifier
Message-ID: <20250207155739.GC3546768@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-10-jean-philippe@linaro.org>
 <73f81e95-7636-4a55-aa29-d288b20005b1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73f81e95-7636-4a55-aa29-d288b20005b1@redhat.com>
X-TUID: zDUZRpMiFqWU

On Tue, Feb 04, 2025 at 03:33:10PM +1000, Gavin Shan wrote:
> > diff --git a/include/hw/loader.h b/include/hw/loader.h
> > index 7f6d06b956..0cd9905f97 100644
> > --- a/include/hw/loader.h
> > +++ b/include/hw/loader.h
> > @@ -353,6 +353,21 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
> >   ssize_t rom_add_vga(const char *file);
> >   ssize_t rom_add_option(const char *file, int32_t bootindex);
> > +typedef struct RomLoaderNotify {
> > +    /* Parameters passed to rom_add_blob() */
> > +    hwaddr addr;
> > +    size_t len;
> > +    size_t max_len;
> > +} RomLoaderNotify;
> > +
> 
> I would suggest to rename it to RomLoaderNotifyData since it's the
> data passed to the notifier.

Agreed

Thanks,
Jean
