Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp293093njb;
        Fri, 7 Feb 2025 08:02:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYh850bGSFomZC/xR0RgGKa/LdSIPH9rNMuLNyIZGq7s1UnPMLkwZ+iqrqBl2t3tvTd0icEgwzx1eBIw==@linaro.org
X-Received: by 2002:a05:600c:358f:b0:435:192:63ca with SMTP id 5b1f17b1804b1-439249a8ae8mr26299405e9.21.1738944136390;
        Fri, 07 Feb 2025 08:02:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738944136; cv=none;
        d=google.com; s=arc-20240605;
        b=FVoRLNPoUBwTpR03OF/kqZ+XsarblqfET27TxGrVtLjBw8fI0rai4VxZCMsSBbVU8Y
         WuBNtbZN1wcL6LrYcnTalSDuCJW49GgJ+FwLdMdn1WStuFQcN/f7FcNTGUJcvRRQbybO
         4JWC8g+L68eOms/D6BzYtt8HVKJycZtEeSBFZITQqZalBnrcuMMDDjTafvmXnRWASSS9
         A+m34pGmZefIPu9FSacrCqJFOZ0uL+ShARS4VSMKXW2J+0WI3wgqLKZnzT5Jf9/LB/J7
         nh7LKmYGu/CCvAejIyBlBsq3dteRGxhfG1e84MG6vp5iql4fy3Zq/27ufzdkZEJ4sxlK
         KUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ihNlawI4mCyWONJEzR+1GSzo+oI1gh6OJ485QUuU/o0=;
        fh=hpGO9bl412+0h6lzC6qvJdv/tqB4fK+Y5NvEPQlaZQs=;
        b=OqOjOMRKJPQe6IK7n69yHMsRJ9+HsWR3O5kv8jkizHtzQ430B1bNqDNkHDnTiHwP1R
         VErZcaBqKvWk7F7BorsC8d8WQy27oeMbCe+AMpyjxLpDKYv9XI24cR3sn0O4hs4z5wMR
         kKiRGQ7/AyScalkNU7+3sLwce3yREMdY70cEjbN6zyLALXr8a1Jjb5GbrKujMSPC7dXT
         EW0tt6Tc2lRjPJ3KT3fkmX6hrtI4bct/dS8226Fd33sJVt8KH4QEipxLYScXhUffeig6
         whJXAr7y5Ak74BfoukX+xqvuFIfkLGMPCOfnW7/sQgAkLqOlU6AnCDd9kI4sM3k54ZV3
         JwVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TmP9drgx;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38dbde3933esor1384082f8f.9.2025.02.07.08.02.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Feb 2025 08:02:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TmP9drgx;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738944135; x=1739548935; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihNlawI4mCyWONJEzR+1GSzo+oI1gh6OJ485QUuU/o0=;
        b=TmP9drgxn9DdvreRxwUlcbDAFjfxoPMuwDtKyC8/4q7yLi08H2vUAt8tZiohdUsSCY
         avcKklggoLx9tqxeDwJSI7WK+4XP9UctUST7XWI+/TEfIUW2W26JDHt5aWlabmxAVtS0
         ujRGOHoTkey0MvHA8tBH2FdImQUsxqNumzfWCYQBy4mnBdAS/QEZLaDaMB0euo+QNPEB
         4ixuGdGo640++tzYMEXf0L9jS8Iky3UziRu5i0YWFKW7qO6+lnB8NmKKdHP4t5YCueNs
         1J7fp7YcNmVSHc265tpKotyi30wlW2WOeFfBuUr1nJe99Ezy3EoJc5gSUvKt8nhPO82H
         /z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944135; x=1739548935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihNlawI4mCyWONJEzR+1GSzo+oI1gh6OJ485QUuU/o0=;
        b=rzFNiyYuZgdHZbmyCHI4b00DWBg9r5etXJl68bfthml3/NCMrPNgzFkfi7j6s8ZALs
         8p4wd6qArt7M2/Aekr1xRpA9m4Fk6mOApj9gQBHgcmOcUv8MaLhzLJDstkjHrn2sgFZr
         gJ+RuA3+ZRYy1iMSn1ZIOIe03oaQ3cP6e6KmnP3x0CFCgveO+F2Tkl8RjCLYmGKcOXMY
         vF6Fipk66Tb7lhJtXcfeIcKrXuBlLa7RaYJ1+Yfno4w1fQswQX/WCNVnUJrsPgJHNOaG
         1KF/kP5pYw2j7Tsi1cS93nz2dVV2qBbwapI7SAd6sXLZ1l17o5wisyrzEbc5oLmmBV1+
         a4hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFprmOLLIr7Ldt1ORDRxrhDrilmG7lTHBDP/soOUG75qO2O9E3VTD18WYDgbmtID9wu18R0WTSKSwotA==@linaro.org
X-Gm-Message-State: AOJu0YwzfxhGY4PHpdvQhBZG6VlWjDvIJ+IhW4KkYhdQivP0iGiM0pIF
	kp5IGSHqXSfSuJInH6hx/IIKBUaTP5DrrPCsr9+Up8GAtjP7V9w1e8rkrobgmobpfw==
X-Gm-Gg: ASbGncud08qudQ1fNbO3N0H/VOGR1POT1gTDOY3NUuioKKO8nHre098ilhucHzBm7Bh
	V6YzfmyQn4k8YK6f62dlM9RtHBMsczIgE6Er683GX7el2S9YxMMrGfi2EFua0crUshkUy4sZGbH
	FCIU8+iVadvwewt/F2YSSXMhcPq64N9vC4tLz7lZ1kQQ8ChjSnYa4Y4icJPYiEgs5cK2kdyJpSX
	r+Uh6iQLPHovy8IrYYHkFMjrK4QyEhnel/BkIkYZPiRyxhTDMdR8FTWaTqsfS+yNV/cGNqqkkcU
	1R+VRXdRUPUAhg==
X-Google-Smtp-Source: AGHT+IFX9WvhugUJsutcR8mfxc4odbBaP7XrnuVWdvintjlRw7EEsftPfsKjc8xNC5EL2MidatfM4g==
X-Received: by 2002:a5d:5984:0:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38dc934bcd9mr2613660f8f.35.1738944134537;
        Fri, 07 Feb 2025 08:02:14 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd36776sm4941161f8f.32.2025.02.07.08.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:02:14 -0800 (PST)
Date: Fri, 7 Feb 2025 16:02:38 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org
Subject: Re: [PATCH v3 18/26] hw/arm/boot: Mark all guest memory as RIPAS_RAM.
Message-ID: <20250207160238.GE3546768@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-20-jean-philippe@linaro.org>
 <e8075a46-8810-4be2-8ad0-b465268541b8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8075a46-8810-4be2-8ad0-b465268541b8@redhat.com>
X-TUID: mtWEU9ZrSLMU

On Tue, Feb 04, 2025 at 05:27:17PM +1000, Gavin Shan wrote:
> On 11/26/24 5:56 AM, Jean-Philippe Brucker wrote:
> > All Realm IPA states are by default RIPAS_EMPTY, and accessing them in
> > that state causes injection of synchronous exception. Either the loader
> > or the guest needs to set IPA state to RIPAS_RAM before accessing it.
> > Since a Linux guest needs all memory ready at boot [1], initialize it
> > here.
> > 
> > [1] https://docs.kernel.org/arch/arm64/booting.html
> >      https://lore.kernel.org/all/20241004144307.66199-12-steven.price@arm.com/
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > v2->v3: New: the Linux guest does not initialize RIPAS itself anymore,
> > and expects the loader to do it.
> > ---
> >   hw/arm/boot.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> 
> I think the changes in this patch can be combined to the following one,
> or move this after it. It logically to initialize guest's RAM covered
> by PATCH[9]. I'm not sure if there is particular reasonable why we
> don't do that.

If I understand correctly you mean I should merge patches
9 and 18, or at least bring them closer together in the series?

I'd like to keep the hw/arm and target/arm changes in separate patches,
because it's a nice way to have smaller patches and gives a clean commit
message. But I could interleave the hw/arm and target/arm changes within
the series (where it makes sense like here), it may be easier to review

For now I pushed the reworked series to branch cca/latest
https://git.codelinaro.org/linaro/dcap/qemu/-/tree/cca/latest

Thanks,
Jean

> 
> PATCH[09/26] target/arm/kvm-rme: Initialize Realm memory
