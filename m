Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp614955ejv;
        Wed, 27 Mar 2024 10:27:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5XjemgAgZOXQttQIVDMxEa0ty/hi3FYXTtzR9laXLzddVj2CEWuDos4YAMBL3xC/Vqa0jKhwgBF2540M5h5yn4LoaUYPt
X-Received: by 2002:a5d:5604:0:b0:341:e369:c60a with SMTP id l4-20020a5d5604000000b00341e369c60amr451611wrv.2.1711560425868;
        Wed, 27 Mar 2024 10:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711560425; cv=none;
        d=google.com; s=arc-20160816;
        b=S00kjmQuH2cdj66XFIgjBNz3Qn7zzk5P+wUaSGMayxl8xefvwJYi2u9eg5bqPmraWE
         RTMnubtcy+o5nq5PpKa7YJb0//x6wHMCIu3ClTa8eEuThc1ONGvHqwadsGr61H0nUGh6
         6lXKz3TtCDpcqxRvq5yRkDQ9TZzIMHyF9cx7Zm+iorTHsqwFbg6gJMqfHtiXkHOgAbGb
         N4ViRMME+lD9Pu8EE2cJny5L1I2El5BkAaq/p2yxtkv63kbjVp/mQXw13UJxuWBD+Gfz
         i50+tM/FLmEqDmy48O28KHNsBVJCo26aMCvsTkv32kvP35aybdaKpvvveibdrI0ANUSo
         6NwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=LOeWq64vcMpyC+dfgqU4qcoJI/qjRuI1jSd1ZXO7Aa8=;
        fh=5zrsqFDE/BpeSVteG2+JyJN+M6DwTuVvnwlAo7/dmLM=;
        b=GlnovjNRDgab+TFNA4FkB50jmXl1UJSMRPhdhWJY0TXIMb6Z6UOozo3ag/pNdW968n
         6A/upIalwJR/CGD5r/xJTPt1yXiWF5J5j6eaBVc/Y3kwFq08fUExf1sXFFtfZi9b7cM+
         eEh8t/k0ai+iGGvGegXB0CtZQpj+7DeeyH0gYpdZ2GjDfaYkdR41q9C6jJcYp0h/w5GX
         5g8kMqci4p/HFM7Gd6/fAFWYhuz9a+4G2OI/ZOkpBOgpgAgbJHYIwgyfOTVxddssW2ji
         KSok18PBcIPTL2sJjMPWExgx5JkeR+pmn68a15rwrsJ7+OC8RXVBeUD4pd64sFuWbkiX
         /2lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=ds4yEkBQ;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dz17-20020a0560000e9100b00341b39311efsor3255968wrb.7.2024.03.27.10.27.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Mar 2024 10:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=ds4yEkBQ;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711560425; x=1712165225; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOeWq64vcMpyC+dfgqU4qcoJI/qjRuI1jSd1ZXO7Aa8=;
        b=ds4yEkBQ5g/MjZHJ51brGmQN2OPfYhRIrXcN2NWL/pgy6Kg49+IbeFJY0hMRsUMpDo
         3nW5Td8NAXIsf46LZ3JJ/OO5nQ2TVh/QyXYJWVBKT01hkhen/sFxY9kVuOHsSw3FIk36
         +VgK8kfod7nuQ+2NOEMujnZp1vKyoU4GNBkv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711560425; x=1712165225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOeWq64vcMpyC+dfgqU4qcoJI/qjRuI1jSd1ZXO7Aa8=;
        b=IrMaNiHxBKRhEoxquyMzlqB3FsiTzqH3G1YUQ91fl4IYyP7YwIolvFYe9Yed6L3E2K
         Be/9eJujvguRhNocXE6r3gW1Wh3LTdfB57aWy48ELOr4cc2mSbVEoieHZACnlHth2Zo5
         Azu2GNn678QaAo8dmN2C7+KG2vJcJ13ZRz/8PZUN1lzpkI0r3bcHMkExH6w9BVXvLxb3
         rXK3um2ACwF6LcOVJwmcAE39DyLHvVdKCo+L8f2SlOZ1R+/8J1pbbm6fAdT9vGgn9qb/
         h1l/pLRUISjLPEM48ep01YueEXP7jpjR1w4gPBcu7G7pO69zii/9fb0k3uVcfrpeKwbK
         VFYg==
X-Forwarded-Encrypted: i=1; AJvYcCV62/NrjYRLZbdpuRQ9pcxLdB04KuGxG9Dfop0MuT11BEXOG5RgrzWQGocxpE+mg5GOy4JCdcK5g3bA+dNQLp6TZyVAfm5l
X-Gm-Message-State: AOJu0YzOmZejrdnZmBAu9bVyk5O1b75UXACqx+vWT4xr7X2BqPIK8fPh
	ZfKK5OAJa44yc1vmtiyPoPkYigRH3gqdsCdZ6YR5iMnr0vcJpQUQSZUvcuxHkzM=
X-Google-Smtp-Source: AGHT+IHr9JM+c5QDCOdkTDoDNItACvq5s9onzO3m1fxTIw9ef9+p/5BHroxQSnJUYc67vBX8mZewQg==
X-Received: by 2002:adf:eccc:0:b0:341:d64e:4966 with SMTP id s12-20020adfeccc000000b00341d64e4966mr424121wro.61.1711560425465;
        Wed, 27 Mar 2024 10:27:05 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id fa7-20020a056000258700b00341c6b53358sm10953709wrb.66.2024.03.27.10.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 10:27:05 -0700 (PDT)
Date: Wed, 27 Mar 2024 17:27:04 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 16/19] hw/xen/xen_pt: Add missing license
Message-ID: <71182998-214b-4e38-8420-79edb92ec09c@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-17-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-17-philmd@linaro.org>
X-TUID: k3bgDTnL8xV5

On Tue, Nov 14, 2023 at 03:38:12PM +0100, Philippe Mathieu-Daudé wrote:
> Commit eaab4d60d3 ("Introduce Xen PCI Passthrough, qdevice")
> introduced both xen_pt.[ch], but only added the license to
> xen_pt.c. Use the same license for xen_pt.h.
> 
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Fine by me. Looks like there was a license header before:
https://xenbits.xen.org/gitweb/?p=qemu-xen-unstable.git;a=blob;f=hw/pass-through.h;h=0b5822414e24d199a064abccc4d378dcaf569bd6;hb=HEAD
I don't know why I didn't copied it over here.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD
