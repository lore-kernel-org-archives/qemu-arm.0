Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp463211ejv;
        Wed, 27 Mar 2024 06:31:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVklibVFvAgHadOn3P7jtKbJ1bSpBw/FYwI333xCIxXT8gqudy4Lg6SHdMTep2x9BIkLqGLPGYxn4/E2R3HU4sJ3pC8Re/C
X-Received: by 2002:a2e:8349:0:b0:2d4:3e82:117e with SMTP id l9-20020a2e8349000000b002d43e82117emr5799ljh.32.1711546313858;
        Wed, 27 Mar 2024 06:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711546313; cv=none;
        d=google.com; s=arc-20160816;
        b=cqXraaMM90eJKE4KV+NDMCjQkb33JY2GWtWRyVJUf+13Wflz152vfxGecCqQn9Ca2E
         bIr5vorv9x+DM87llVb1X2Ts+poY1EyYRyWA8latd74zkWcHUISJ+5uliUL/PF3tfZBG
         sAOuyRAbEl7HXsQAIL9BbbeyXiVQ9ciL8DjRdLe/A2xzwmre57EeeOlJvaPujz9cZMuI
         MFMJJtL1rSJJUXqTgS1wmQrzu/H8C9n4VWt2U6Enlhn9YafHZXw5Yp4K5K5sloaZFvzw
         HCaaxeqRFTDauklsvV8DORRjhFWvacvpXDR958Cha8kTOXy0KqGH28TgfI5EakzImgaK
         MIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ry50isKBz7xwB9eIS98LGGV6NnwE9fBPbss1bZmyVbc=;
        fh=xkO6liuNTxTwTnOJMlJ6IlIRkEXnbyObqfxsyahj/Y0=;
        b=l2va1Fac5kzpzQopzt4Qb3WKtK3Bk0ZbDQiX9D9YVZ0NT6l9zNjNpeXTsanm4ErfXE
         9C+RsAo0QcrwnRnsz2D4eUO+MfPqoOa3/DB4pvroqshpwaqmOX/XCzlxzQ30eZabLCLg
         blpJn8cUamZ/32hmRV6qkNq/nkTTgNbPxFLgXN3O1O0IiZYhxuJPdVa5vxBkTgXdLF4D
         Lv56I3N6HJxuuHks1F9PiFOaBX2poKVIBrIf38BhLkVcT/AwiwEwrYQThrWZEn73gvP4
         G+QaYnYsSjuAu5Z390aXjI04PR6IlTZ+shrFXqxHROYh8ScH6/TW1OWWny6QWSFyvSSl
         MWRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=fRkam8qT;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c6-20020a05600c4a0600b004147ca02aa3sor2513515wmp.0.2024.03.27.06.31.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Mar 2024 06:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=fRkam8qT;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711546313; x=1712151113; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ry50isKBz7xwB9eIS98LGGV6NnwE9fBPbss1bZmyVbc=;
        b=fRkam8qTp7zrpfV4tE4sbrcu5AcWvpPQB69/9LTmANRvaXeqLwecg1pYUOZHCrdtQ2
         OFvkQinoRwdDhKhOniMoZTDx4A5E0XYI/hgTcmoL4bZkGuYQcj18Beg8LS/QWqbVl4IH
         udHkNlIOO8geBxOVFyfwC2nFs35WMgwO3Mr3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546313; x=1712151113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ry50isKBz7xwB9eIS98LGGV6NnwE9fBPbss1bZmyVbc=;
        b=gIwAHjg+z6iSly73JSp7D9UntUjoVnS6Cc32XZmLzDz5GZqFnFcH+n7qP8UaiaINzF
         wTBEXCwE+B8DzXm948ivK82xOiymqvYKV2rEy7KAmWpNgKFfwvM89vPKrOi+3sld1S3J
         ESO+PESMBFrvm1oG2GT4QLJW2cWDhcb6oP4oCDh4EItHL5N/tjHxrxfWZrf6MzT4CMrW
         e31s2a5aFplQ2Qjv717lDbUn6FoHbtJo08ds7wBW/1uOuR+gfqz2SQvX+3IA0wAwMOQF
         0kzeEEHLOP4grjbukJDhme2g4xfHfJDxThDZ4XtX3yUUQYtnov9/+nXlYSGHApBn8d3I
         qiBw==
X-Forwarded-Encrypted: i=1; AJvYcCUw30l7iwsT8k8EvTHE8pAASeVUsrTNgZTM/zXGOrBzS/7fhjTxfHZRe3ARx3IQ/6Buo9s2tJGWYN+GEzR1QNQ+Tpjl1VcU
X-Gm-Message-State: AOJu0Yxt2/gckYBd+52SKqf1YJRyUPZnsnbAUkHM9b3ILVZnW0gYOpkE
	eZasBeUm+d8a4XqHHeD5QBxGoc9aH5WX5hreo5dsabulNeDNLJ0uDZZEuCm/sCo=
X-Google-Smtp-Source: AGHT+IFYIuYEr12t4v0Td8b3I1GnsgGQezqwN6hoZoxCPeltmyQmrmwtG5G0fLSfp8l9b6esrVdj4Q==
X-Received: by 2002:a05:600c:198a:b0:414:8d7:8292 with SMTP id t10-20020a05600c198a00b0041408d78292mr52993wmq.0.1711546313427;
        Wed, 27 Mar 2024 06:31:53 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id j28-20020a05600c1c1c00b00414807ef8dfsm2209230wms.5.2024.03.27.06.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 06:31:52 -0700 (PDT)
Date: Wed, 27 Mar 2024 13:31:52 +0000
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
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH-for-9.0 v2 09/19] hw/block/xen_blkif: Align structs
 with QEMU_ALIGNED() instead of #pragma
Message-ID: <76ae46e6-c226-49d0-890e-c8fd64172569@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-10-philmd@linaro.org>
X-TUID: 37SZivmY45zq

On Tue, Nov 14, 2023 at 03:38:05PM +0100, Philippe Mathieu-Daudé wrote:
> Except imported source files, QEMU code base uses
> the QEMU_ALIGNED() macro to align its structures.

This patch only convert the alignment, but discard pack. We need both or
the struct is changed.

> ---
>  hw/block/xen_blkif.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/xen_blkif.h b/hw/block/xen_blkif.h
> index 99733529c1..c1d154d502 100644
> --- a/hw/block/xen_blkif.h
> +++ b/hw/block/xen_blkif.h
> @@ -18,7 +18,6 @@ struct blkif_common_response {
>  };
>  
>  /* i386 protocol version */
> -#pragma pack(push, 4)
>  struct blkif_x86_32_request {
>      uint8_t        operation;        /* BLKIF_OP_???                         */
>      uint8_t        nr_segments;      /* number of segments                   */
> @@ -26,7 +25,7 @@ struct blkif_x86_32_request {
>      uint64_t       id;               /* private guest value, echoed in resp  */
>      blkif_sector_t sector_number;    /* start sector idx on disk (r/w only)  */
>      struct blkif_request_segment seg[BLKIF_MAX_SEGMENTS_PER_REQUEST];
> -};
> +} QEMU_ALIGNED(4);

E.g. for this one, I've compare the output of
`pahole --class_name=blkif_x86_32_request build/qemu-system-i386`:

--- before
+++ after
@@ -1,11 +1,15 @@
 struct blkif_x86_32_request {
 	uint8_t                    operation;            /*     0     1 */
 	uint8_t                    nr_segments;          /*     1     1 */
 	uint16_t                   handle;               /*     2     2 */
-	uint64_t                   id;                   /*     4     8 */
-	uint64_t                   sector_number;        /*    12     8 */
-	struct blkif_request_segment seg[11];            /*    20    88 */

-	/* size: 108, cachelines: 2, members: 6 */
-	/* last cacheline: 44 bytes */
-} __attribute__((__packed__));
+	/* XXX 4 bytes hole, try to pack */
+
+	uint64_t                   id;                   /*     8     8 */
+	uint64_t                   sector_number;        /*    16     8 */
+	struct blkif_request_segment seg[11];            /*    24    88 */
+
+	/* size: 112, cachelines: 2, members: 6 */
+	/* sum members: 108, holes: 1, sum holes: 4 */
+	/* last cacheline: 48 bytes */
+} __attribute__((__aligned__(8)));

Thanks,

-- 
Anthony PERARD
