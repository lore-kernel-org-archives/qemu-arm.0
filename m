Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1869405ejc;
        Mon, 13 Nov 2023 23:42:15 -0800 (PST)
X-Received: by 2002:aa7:d14b:0:b0:543:5568:8dce with SMTP id r11-20020aa7d14b000000b0054355688dcemr6602791edo.30.1699947735401;
        Mon, 13 Nov 2023 23:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699947735; cv=none;
        d=google.com; s=arc-20160816;
        b=V/HHMN16+8+zkeE1sdiu1u8nVzg6DJCV5c8jBAU+qC2/6SfziimYhqORjEyUFBVYPu
         sJyjnATjKyGvNh0Zi0M1fnZDSLT8frVAwoFgjxDTWzZYSgArYq1tBYsbVX3IeKxpWDGQ
         ntYz7yh0VpU9xi2dRamZk/X2iJoNQsWQ296Cl2RFveaRRPD0a4WIzJyuVYHgZ/1fVZz5
         Lzjwx3s+Ld0GBLSrNz9hjpApuKOUc/ZGsg+Oml2zVPKUgyVTSwF/Unx72bOn66CIeKHH
         jhJ2asr0aMKKi5ik//v7CYeAbPjIPFxG9HY8ZRVs9jsK/aFWsxD+0BCnGj9zZ05G5N6u
         2wCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=afwXf5UyfyHio4t/MoTziNc/oom0veIJS2FP26Ef0EA=;
        fh=5/is4kH9lY/BShTIZC9RCkIedUQUh9oC1CtBFck+mL4=;
        b=h6F2Wrd+ihOrmpagatoecvQHFc3xiotGdb+46phB2zWSkYRDtYK52CdOXpGP+p3ps3
         f0BaFCnurAYfunptgRyzhHSE1etb7sOaQCvIw3O9Y69Iz+VJ3NJbSElBIRjQCphgPBj/
         UCTsflCfQWbOzJHPUF3Q9B9vn5KYXbrWjCwQ6UgQxF8zYoN5u4Yaf/9AKStkh1rGfEw6
         LP7Pt0cmSvS2+MMyb8iU3C4apY/Noe7iO49LLWZwvSphxzIBqs6eGisqYwUFHSwlXnJn
         PZDd3SyKNIPaMsKT2ZyNaA1XMa4i8JdiPf/HUp5+NGr74ufHy3V9mMv25uXxeiNNC9hT
         qhCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4933ZnH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f21-20020a50a6d5000000b0053f978ad01bsor1455625edc.9.2023.11.13.23.42.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 23:42:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4933ZnH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699947735; x=1700552535; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afwXf5UyfyHio4t/MoTziNc/oom0veIJS2FP26Ef0EA=;
        b=S4933ZnHlrRJ6MBivJne2zLOYAB+FD0libEqlwtxzAr/Yb8qlFyiPt8+F7wRN2dmxT
         OvjGyPf9XLs7Q0bKLHrhbIfu3RVLGIkTxO0YG2DMpoUNoU1AcmIYllNng66oy0FYVKyN
         aXhMvAWtAxGEQfxIoML3hefLtiOvKnQQJ1U34bjjTUu4XU9/R4GZQVWhvz0lqbYr6Dbq
         NVrwCGBCezS8yvqy35V0fwCjMDhxkucuoopJG87QjxR7saeJ9IDvMkJjAzzwi+HtMD8c
         GCR05C5AA79YTPRZb5GOeGZtJ/2QWP5HJc5E40E29HTkEyGxICfvbM7iFL0bHz8geLk8
         rtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699947735; x=1700552535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afwXf5UyfyHio4t/MoTziNc/oom0veIJS2FP26Ef0EA=;
        b=uiIvbPuR79RNvR8rZ7VAEZ/gnkKZG+Do8WGP7gXMeTt9+CzjtzSpiwn8LDtq9YTUAY
         NklJd4Dveu3GGoUY9B6aljUkLzX5j3Bh8Ln2ifODi+L0ZMc0omT+aiGT60GZbviD18/9
         sOkiJAPaOP6TCmU1HDjQSuPgME2UXc4kt32CUCeoZIqNxYwt7znsQH1dQlDr3MW/SbJw
         H0ZZzcboo250Wm/DDqvRzC53wNIc092pqgE7OKvOs+TT797YyAz7udmnw4mXy8EnhWe9
         ahXHvImzb17N1mjE0r0WjXep0lINtJAncJU5YTwHJESp5JRQLMrCBOJgaPJZmg/zgFgr
         9mfg==
X-Gm-Message-State: AOJu0Yw9MMK7yBN/F5zF682V8AfmV0wUXwS0lUkXT4ZWTzejRfBsW/N1
	NFGRU1owcpJbULhN0SF5ubqsVdc/
X-Google-Smtp-Source: AGHT+IFce6dsUWO8qArRxaXq4VW8P2txycNkeinwY/EAXtRKE4RItRlBpr4najyISG4uncQiB0ABBQ==
X-Received: by 2002:a05:6402:884:b0:545:5674:4293 with SMTP id e4-20020a056402088400b0054556744293mr6387649edy.28.1699947734901;
        Mon, 13 Nov 2023 23:42:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id er22-20020a056402449600b0054130b1bc77sm4739041edb.51.2023.11.13.23.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 23:42:14 -0800 (PST)
Message-ID: <e6680657-59de-4845-a3a3-af8df11fc443@linaro.org>
Date: Tue, 14 Nov 2023 08:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-5-philmd@linaro.org>
 <a50b0790-03d7-458c-834b-907e130bb5fd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a50b0790-03d7-458c-834b-907e130bb5fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 68qnAJbPEF4f

On 13/11/23 19:16, Richard Henderson wrote:
> On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
>> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
>> index c028c1b541..03f9417e7e 100644
>> --- a/hw/xen/xen-hvm-common.c
>> +++ b/hw/xen/xen-hvm-common.c
>> @@ -426,10 +426,7 @@ static void handle_ioreq(XenIOState *state, 
>> ioreq_t *req)
>>       trace_handle_ioreq(req, req->type, req->dir, req->df, 
>> req->data_is_ptr,
>>                          req->addr, req->data, req->count, req->size);
>> -    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
>> -            (req->size < sizeof (target_ulong))) {
>> -        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
>> -    }
> 
> 
> I suspect this should never have been using target_ulong at all: 
> req->data is uint64_t.

This could replace it:

-- >8 --
-    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)) {
+        req->data = extract64(req->data, 0, BITS_PER_BYTE * req->size);
      }
---

Some notes while looking at this.

Per xen/include/public/hvm/ioreq.h header:

#define IOREQ_TYPE_PIO          0 /* pio */
#define IOREQ_TYPE_COPY         1 /* mmio ops */
#define IOREQ_TYPE_PCI_CONFIG   2
#define IOREQ_TYPE_VMWARE_PORT  3
#define IOREQ_TYPE_TIMEOFFSET   7
#define IOREQ_TYPE_INVALIDATE   8 /* mapcache */

   struct ioreq {
     uint64_t addr;          /* physical address */
     uint64_t data;          /* data (or paddr of data) */
     uint32_t count;         /* for rep prefixes */
     uint32_t size;          /* size in bytes */
     uint32_t vp_eport;      /* evtchn for notifications to/from device 
model */
     uint16_t _pad0;
     uint8_t state:4;
     uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
                              * of the real data to use. */
     uint8_t dir:1;          /* 1=read, 0=write */
     uint8_t df:1;
     uint8_t _pad1:1;
     uint8_t type;           /* I/O type */
   };
   typedef struct ioreq ioreq_t;

If 'data' is not a pointer, it is a u64.

- In PIO / VMWARE_PORT modes, only 32-bit are used.

- In MMIO COPY mode, memory is accessed by chunks of 64-bit

- In PCI_CONFIG mode, access is u8 or u16 or u32.

- None of TIMEOFFSET / INVALIDATE use 'req'.

- Fallback is only used in x86 for VMWARE_PORT.

--

Regards,

Phil.
