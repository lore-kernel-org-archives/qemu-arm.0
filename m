Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp589698ejv;
        Wed, 27 Mar 2024 09:45:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV57QAnXwh2UROGp7sJR9zOsDDGWiIm9hTdD7LiHjdj9ZIZxZ1QCXkZGZbB0kZnynVg9Cr8t+q9JuTCkER7z7Q4uGLMP2LD
X-Received: by 2002:a5d:4dcd:0:b0:341:c210:3d1b with SMTP id f13-20020a5d4dcd000000b00341c2103d1bmr419802wru.8.1711557956619;
        Wed, 27 Mar 2024 09:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711557956; cv=none;
        d=google.com; s=arc-20160816;
        b=VOJOLQZTFEwKUENBsB1qN8jbQ0B/Yicyak2/8SYq5xs2wEKeTQh+rTuJ5E9QVt/sNJ
         /a4+QHyZBWSV9JAjp9taFqJuovNhQpfHYyBhDPQaAPGihAmHWBpWAHiU71JPcv7FBBtc
         gwDYXpcriOF6ZetvaZSEydbCleG2BfT7v4SkCUP/mAuTAJgyFIQONMgqkenFghid1MtM
         6ZQ4vT81Wf56rxsUUixoWKy0fODgDZ7zPE/aQUncJK05sIglmHa26FHjlZ4S/pHxM4P7
         +cl7NFLUY2s2QsTLQhbfPpdH1uFizN3MyzYmZ0FSRb5r/m1hKyqso0Nj4uMaduRDO/qa
         +4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=zBErRmkltSguH2d0/UJYPB7aHlGXWYjo+/5oLZJOopI=;
        fh=j0AFliF1jie1LS/QZGpCZ9DfLLkbtWtJ/Ez/aRhAvGo=;
        b=cYXuwCzrc2+zDlolBvpwumkyIsQpwRneh2gFREwkD64we09/9QRqEKQz5NNo2Swq+A
         Cw0+sxqUjeyOgHcakIDI3vR+1WCeXpdAYpAv4ACp1tkWqB5fsehri3ZNIub5iI9UAkjC
         /sNy5bDVyXGzaeW6Wzc0Ks3r0rFWzVgNhFxDUIsFx5E12BQerkrMFVUm8YANkFkiU8qO
         /FaM49XNYEaLZw2QJNhuU3YNiANAYqkhLlx6pgztmG9roqbqrOxDyO+W58zYYbZm4J8I
         5eMaFiareRjQ5XLHNHVqT7s9VhxuXSzBCzKgGYYVX0bfIZ2HzVk+1LSiXV2FA/jfjoZX
         7uYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=PLHEVebH;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q30-20020adfb19e000000b003419a2fec7esor3313341wra.6.2024.03.27.09.45.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Mar 2024 09:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=PLHEVebH;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711557956; x=1712162756; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBErRmkltSguH2d0/UJYPB7aHlGXWYjo+/5oLZJOopI=;
        b=PLHEVebH/LFTLhsYaXb76kWptLnITT2xzYld3bE9l5guOg1xK3ZTMOsW92eNuJhRsV
         tKwkYvD/EbpZNViBmk9PbLy00x+8rDUWJH2VyvJiHNVE3NGba1wQBLQwb8nZe1Ho0Xnf
         lT5Fu7N3rYwYR0lbQs+G7Ch88vi9jlR1f7mcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711557956; x=1712162756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBErRmkltSguH2d0/UJYPB7aHlGXWYjo+/5oLZJOopI=;
        b=TB+wfB3fnkKKcpfn5CBhVXVkfI5TSVXkenmMusoHqFjJV4XIl3YM2HNicaqXKEnFPe
         AFj5fBGWfG+v8tBNTnnhzyZuNj0fvaDDfA0i9aO3G1cvzOxswl7V3nzMZivlpDiyn9S4
         FaYYKtmCzJV5ZpKjFzbOASpFqDoVfh/FX3cm2Scy7ymAAERut2EloOq4mvs+AX/FkZc+
         4uiXuR+nYA6FaNaCftredSIg7hyI+Ix7Ell/oM2zIWer2fmgnDWPHlhK8lSYUofG0PvR
         RugHXqbvTXiqD3YDiVCwfns4kQtGn/Rr730uFnwIb7PjvVZit6eIbZgkIoyYPX7AiYUQ
         pmFg==
X-Forwarded-Encrypted: i=1; AJvYcCVwtkvHE7VbM6wQ2O7QILgbe+GSiMo2fFIQN+vN6W4YZ2ZqEO9kRm6BPY4Z5OWpRSRP02bNeYxru6xA3n2E3mpDAw3ANnFw
X-Gm-Message-State: AOJu0YxBKRuRKctuSCGOiGc7r+BGuYXv0GbCGVsaRPdHVsjEZCYzge74
	QXhkYj44pEDZ8xt5rq9hQ7pKOb9XLkvnp85LGSmx8ZsnPl8vCMs91Nbnc9xUakw=
X-Google-Smtp-Source: AGHT+IGpIy3vGf4ZXnW5ibtGUcB1DXYHc9NeWjaOzQq8JTFfd0ipLrHkEfSGQkvsU8UA2GxqISwyxw==
X-Received: by 2002:a05:6000:92c:b0:342:86e9:b3c7 with SMTP id cx12-20020a056000092c00b0034286e9b3c7mr76883wrb.37.1711557956127;
        Wed, 27 Mar 2024 09:45:56 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id en7-20020a056000420700b0034174875850sm14015642wrb.70.2024.03.27.09.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:45:55 -0700 (PDT)
Date: Wed, 27 Mar 2024 16:45:54 +0000
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
Subject: Re: [RFC PATCH-for-9.0 v2 13/19] hw/xen: Remove use of
 'target_ulong' in handle_ioreq()
Message-ID: <3a2da257-87f7-4d3f-9ef2-8450bc7b2742@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-14-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-14-philmd@linaro.org>
X-TUID: 4ZyVgeL2/seu

On Tue, Nov 14, 2023 at 03:38:09PM +0100, Philippe Mathieu-Daudé wrote:
> Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
> function to xen-hvm-common"), handle_ioreq() is expected to be
> target-agnostic. However it uses 'target_ulong', which is a target
> specific definition.
> 
> Per xen/include/public/hvm/ioreq.h header:
> 
>   struct ioreq {
>     uint64_t addr;          /* physical address */
>     uint64_t data;          /* data (or paddr of data) */
>     uint32_t count;         /* for rep prefixes */
>     uint32_t size;          /* size in bytes */
>     uint32_t vp_eport;      /* evtchn for notifications to/from device model */
>     uint16_t _pad0;
>     uint8_t state:4;
>     uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
>                              * of the real data to use. */
>     uint8_t dir:1;          /* 1=read, 0=write */
>     uint8_t df:1;
>     uint8_t _pad1:1;
>     uint8_t type;           /* I/O type */
>   };
>   typedef struct ioreq ioreq_t;
> 
> If 'data' is not a pointer, it is a u64.
> 
> - In PIO / VMWARE_PORT modes, only 32-bit are used.
> 
> - In MMIO COPY mode, memory is accessed by chunks of 64-bit

Looks like it could also be 8, 16, or 32 as well, depending on
req->size.

> - In PCI_CONFIG mode, access is u8 or u16 or u32.
> 
> - None of TIMEOFFSET / INVALIDATE use 'req'.
> 
> - Fallback is only used in x86 for VMWARE_PORT.
> 
> Masking the upper bits of 'data' to keep 'req->size' low bits
> is irrelevant of the target word size. Remove the word size
> check and always extract the relevant bits.

When building QEMU for Xen, we tend to build the target "i386-softmmu",
which looks like to have target_ulong == uint32_t. So the `data`
clamping would only apply to size 8 and 16. The clamping with
target_ulong was introduce long time ago, here:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=b4a663b87df3954557434a2d31bff7f6b2706ec1
and they were more IOREQ types.
So my guess is it isn't relevant anymore, but extending the clamping to
32-bits request should be fine, when using qemu-system-i386 that is, as
it is already be done if one use qemu-system-x86_64.

So I think the patch is fine, and the tests I've ran so far worked fine.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD
