Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3558444njb;
        Tue, 10 Dec 2024 11:04:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVb6t4NJbfd2X4OFk7N0sS9BWJ2DYKAvYoGGxtRIj9bKhHh+gPVHAm6Yh+gWzYQJILm7AbyVS5i45uCvA==@linaro.org
X-Received: by 2002:a05:600c:4447:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-434fff9c4fbmr59855955e9.24.1733857460633;
        Tue, 10 Dec 2024 11:04:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733857460; cv=none;
        d=google.com; s=arc-20240605;
        b=MNUjFaLSQvrhwDZHHxgd5t8vAg0AwDhtMNema9l1nRvHXGocCOPp60znmZA9GM4MPY
         w+Prx8giHgARL5ZIouXuuJow2lxxHuFp1WL8vAvJVKmJ4bQKYj8yJjv5L+8wchvi7uC6
         QzxlEWek1K9k4KwvFMOL++yG7XqLfzDmcl+BL9Nq6G5qAMabNbhU8kLpgDLWFIEJL9bM
         UwbIvGS7H6Nyp+pazZwyK/OZ+Puc+xNxbas3wCurm/xlWCsyClmAmIomp19fVXEZUE+J
         1I5/FTZ4vxng1HqU5oIA/PHd0mvfqbS3p5ZweIVBDDyx5rHCv5MGhP9iT4cZuMKIvJ89
         BWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=OGkjgJoVOIfscBofiFo3Qdxd7d5Imd8MkB+b0+Zyxa8=;
        fh=6mFAovTo33udE5FmszFO9JtJtUyT5aID7DV3HbO82Ck=;
        b=JX+4gNiWEPPK8ITxIeVlgW1+grUnc0l8V41tt7+2HpXkbvpjSNgHdkYUDrhfXldRPI
         5BfV1paICdaJUODQ1DCYvG5i5kcbCENHH9V7vargxZnKM7H1xNk7AbFDIRDKfnMzj87N
         /voe7o3/khhEokC9Xe+8v7tkkltPtd51PnaJl/ZSJz7x1G81PYisSzLB4aDffIQPI6xp
         OkiuMXQT/cr1CxfV03n0OpQUXM6BMionjbOwxb44jyYvZqGk7CGvpmo0zOT1hCziEKAM
         JuqzJuxsA7blTkgFHtGPw31ioUv7il3fqj+hW2wV+nGxfYwwcMF99n4G/3yGuJs3ba8k
         kfWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zvPCZnNU;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434d9e9cc71sor54345045e9.9.2024.12.10.11.04.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Dec 2024 11:04:20 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zvPCZnNU;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733857460; x=1734462260; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OGkjgJoVOIfscBofiFo3Qdxd7d5Imd8MkB+b0+Zyxa8=;
        b=zvPCZnNU2CJbc4lzZI7qqXhd/rbI9ssxO5qYrnjR3kDQCoJRtZGEkIzOFY1AIt+R23
         7aNkIpripZpp2Pgb218qXcOZwzkDD02u3qnCxB47HMwDG8SUROa/rLqdYy7iCGAeAvWx
         POWeNNFU4CIB0TxD9vmYNFetUwB5NKyNTm6NS1T6iH33ai6t3OTWPEbqUm2OHEEhqH+k
         jLCUDEIGJpd6K/eH6x/OgGj2o55Ptnak+CrgyP3jQwYAjKOfwf8a/coVhsQJSIJvKVW7
         ZkPLhYVLavaybhjj83Dh1DrJtyoRHStEcgt+u4jAmKwqDnJLiNLcHECfmzStd/E3TSbT
         lrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733857460; x=1734462260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGkjgJoVOIfscBofiFo3Qdxd7d5Imd8MkB+b0+Zyxa8=;
        b=gocQ7w8bRRnBf29OYNL9QQb8GdHK1NQ4bizwJ4rapTyTxWwaFN0ii4y2mhC0x+xZ50
         8hHI+KCDz2piQsySNW+kQc1AOxm1KpxaxFY+8yXW8eN5OGT/znWA4U4sH420xLmB4ieh
         +6WgqXhUXijJElcDedOsn01/Tqc6cQDJcj766djCZelZ2lQJgF/lyWquNvSwdvrX9hqb
         YS7N7n3qPuI0tkkdO0nAx9X9+YSj5vbEksfipvVjo8u0++nlyvST+XEbP0sCUxFTIGUB
         ZNYYqXKBmobJF93DXC1yrJ4DncydGTnsjSGCXvlmHzX8vqOg/0XYc1kwZtl8MJKL7xWD
         dR2w==
X-Forwarded-Encrypted: i=1; AJvYcCXBekeXsmICV38NXav+QGWKvguWg99mo42RZlqdYJ0M9fG05ZgS4X9Axl1w2Lag1wry2pwye0inptCRbg==@linaro.org
X-Gm-Message-State: AOJu0YyVpSxSmDNXSXftqgMCPAw5oUFkN1+yr1XvIGDeH54OSxsXuXex
	GGjlRNSyjRhMj67HGAcyFpEqPIpg8/iLSWvFaf9iKOMQAcpU8hrpIcsYE8amQB/1fJDMp/WmsjH
	3ORU=
X-Gm-Gg: ASbGncvvJkK9WKVEEsPX1at/c+dnDL6ljPXK+D9COm4x88++47M9ecfHtgZNWGd5k/i
	XtE16PrVARjRZzWEj3x9WqfzCWZ/MCkFIdsnQ3o6xnC63TkO0eWAiM2tRSCAoNeTJIsp8dSyXh9
	pGcWWJ5IyMdWVfpk3y2jcHxF1vmyUIgqSWxQWMKglR6kpCNS/IzSes3mdWAdRSLEXP26n+DV9jY
	AdNNHEJNnSO7Y0uLe9QCjYUI5Dw2XoaDoCrQgZxsDf7N/TDn2R7
X-Google-Smtp-Source: AGHT+IGvBRJU5VrvHHgELZZRyrW8eCUnsJp+fWL4M+Lzf4Iil54EchS3zFf3fpkiiJ2mrmbyb8g3kw==
X-Received: by 2002:a05:600c:458c:b0:434:9ec0:9e4e with SMTP id 5b1f17b1804b1-434fffba059mr67946935e9.30.1733857459913;
        Tue, 10 Dec 2024 11:04:19 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b158sm241081475e9.8.2024.12.10.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:04:19 -0800 (PST)
Date: Tue, 10 Dec 2024 19:04:43 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org
Subject: Re: [RFC PATCH v3 24/26] hw/core/loader: Add fields to
 RomLoaderNotify
Message-ID: <20241210190443.GA1212502@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-26-jean-philippe@linaro.org>
 <ba650cb5-488c-4127-a307-ea16c9e44b5d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba650cb5-488c-4127-a307-ea16c9e44b5d@linaro.org>
X-TUID: DY2mYFSK0/1G

On Thu, Dec 05, 2024 at 11:21:19PM +0100, Philippe Mathieu-Daudé wrote:
> On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> > In order to write an event log, the ROM load notification handler needs
> > two more fields.
> 
> IMHO it makes more sense to squash that in the "hw/core/loader:
> Add ROM loader notifier" patch introducing that API.

Yes I'd squash it if we decide that the patch 25, which needs this, is
useful. But it's possible that no one actually needs it so I left this
separate for the moment.

> 
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > v2->v3: New
> > ---
> >   include/hw/loader.h | 2 ++
> >   hw/core/loader.c    | 2 ++
> >   2 files changed, 4 insertions(+)
> > 
> > diff --git a/include/hw/loader.h b/include/hw/loader.h
> > index 0cd9905f97..73f317966d 100644
> > --- a/include/hw/loader.h
> > +++ b/include/hw/loader.h
> > @@ -355,6 +355,8 @@ ssize_t rom_add_option(const char *file, int32_t bootindex);
> >   typedef struct RomLoaderNotify {
> >       /* Parameters passed to rom_add_blob() */
> > +    const char *name;
> 
> Description of the loaded ROM.
> 
> > +    uint8_t *data;
> 
> Or 'blob', blob_ptr. Maybe declare as 'const void *'?
> 
> >       hwaddr addr;
> 
> Now easier to document, where 'data' is addressed in guest memory.
> 
> >       size_t len;
> 
> Size of 'data'.

Thanks, I'll fix those

> 
> >       size_t max_len;
> 
> Still unused. Drop?

Yes

Thanks,
Jean
