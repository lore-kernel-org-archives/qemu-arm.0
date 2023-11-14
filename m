Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2107290ejc;
        Tue, 14 Nov 2023 07:14:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHYkSMWi2m0ab74gqsxCLHTUrn0M5R5M/Xrcn1zkhNfS2RppHR9Nhr3xxRNdqL+iC2xAiX
X-Received: by 2002:a05:6902:1509:b0:d9a:4fa0:dca9 with SMTP id q9-20020a056902150900b00d9a4fa0dca9mr12243177ybu.25.1699974867683;
        Tue, 14 Nov 2023 07:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699974867; cv=none;
        d=google.com; s=arc-20160816;
        b=Jtltm20OocdJ2X/CAaTcgtxv/imPUkUlOUrlb58hvdALAApekiSIIg/RjM6OMylY7g
         u86nH5vdY5FV2X+5X9upke8gl+U26+9Xa65xVLgCknLT8hdt+6QVAanUNAQZGcK9qpAt
         8kC/ugNM4STSPde7jXJPPo5ibJZIIUr3w5bHAFxTjE/dqhQ9Xe/PmH70bVfYK54XwqRz
         ClGobJKsdTy1mT2taxwgg1fXJ8fAd+q2/vnIs88g0UDX4eM9QEXk2zIZPKWjrTN+YUEO
         CMxin5Me9E7sbZFtn+AvcGEl9j5HF0jiMAPjVUae4ZZcYXb76/e+EIfVnDYRA0HP3nUY
         THvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:organization
         :autocrypt:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=Zevbj+27sluhLeonkisRMHT3igYPuh7OylaeV79/St4=;
        fh=EFGs5/zeM9wI3rgwcCox4b5BKU7LpOQPu9BmtW3mDqU=;
        b=1Axs8cuyoNv4Cry+2p60fdhY9ITxVVRT1T/EFgLMbYdjkpK7JV2BhPXJujF5qHNagb
         llZa6jJ5GAEDi9DLybKay6clawVUr5fHQRWPL1kPxJF3/E/5EcnMlQxaaFNHgYnieLcp
         3IpQFfhN9IicNDE8lhXKAXOV7DBcsV1yDNJHbQZFBHDFRX9NXSaJqxV+0LLDAfe4dq3C
         31qYvuXLQ+sP5sjAI0X258ckrOatzCufXBvjaPGv8DTFPFBf4NXAgXgT9yKa1AmTtx8E
         t/2ZN7DMUMy+wXyaDx/xgzUSGH0hXRYc3bqDi5RCfjcttVJqIbJchrCtNcvadSHwXDpN
         HzBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZjYbG3Jb;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d18-20020a25add2000000b00d9ac41e2f88si3921483ybe.580.2023.11.14.07.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZjYbG3Jb;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699974867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zevbj+27sluhLeonkisRMHT3igYPuh7OylaeV79/St4=;
	b=ZjYbG3Jb4RK2mz73Lrhs0R9/lJtKq0rwUiYavSYt1R7fTMHd9RHnACYsopL4Zcr5iCLTFm
	1YxPrU1yYTArafWlrf1zH/2ptJ8xYq3uWBdh5jpYF2Uc2leEa556/Bdey36Zg32+4SK6Q9
	7sqgu7+A0v37B9MzBS7rtgTwaAxz4I4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-csDMfweCOJy_HXohxHyD2w-1; Tue, 14 Nov 2023 10:14:25 -0500
X-MC-Unique: csDMfweCOJy_HXohxHyD2w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-32fd5f7b674so2494615f8f.0
        for <alex.bennee@linaro.org>; Tue, 14 Nov 2023 07:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974864; x=1700579664;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zevbj+27sluhLeonkisRMHT3igYPuh7OylaeV79/St4=;
        b=hz8Gdd+G06slYgfjb6cQijHkiBWBAFw2RqXn9T0qV5uHe9MRcoqE0e1e7qtfz0Colm
         ovAVbebhE2AcIkkVsJP56JZzqCY0wgio+EOLZD+4pMilj5++DqT5sY1F1NAwfKFSciIs
         zEaSxlDslZe506odfak/6XYuJzxDyODa2+OdXTw9Kd+STLxRXCIArYICsM5kEFJutKvR
         iJnEvn5FHdgcYshwfe/2Gmu01gM3QZpO8AOoUPNYYdKYXeWZAG8elVIcYuZ2mP/fiCxp
         T3gfAg0H5SfUnSpIGfxd87HuD+2rjA0jJ4pammZKIyvqFMV+69wfSpyqoTuJvkqtzmIy
         6tRg==
X-Gm-Message-State: AOJu0YyZoiGY/NLX3JEnP7tUDZG7EsDu/HNu4FC5TOuQjKwOwCBAZhz2
	A+lh5KcWDXCX0XICtS1jESAVtjcoe71DOHDH1YQYYdi7D9Ueccdz4L7Y6CyrYRFHBkZLb+COrIR
	bgWcnZmhCozIoOQxL
X-Received: by 2002:a5d:598b:0:b0:32f:77a6:52ea with SMTP id n11-20020a5d598b000000b0032f77a652eamr8145363wri.61.1699974864155;
        Tue, 14 Nov 2023 07:14:24 -0800 (PST)
X-Received: by 2002:a5d:598b:0:b0:32f:77a6:52ea with SMTP id n11-20020a5d598b000000b0032f77a652eamr8145338wri.61.1699974863739;
        Tue, 14 Nov 2023 07:14:23 -0800 (PST)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c73e:8900:2d8:c9f0:f3fb:d4fd? (p200300cbc73e890002d8c9f0f3fbd4fd.dip0.t-ipconnect.de. [2003:cb:c73e:8900:2d8:c9f0:f3fb:d4fd])
        by smtp.gmail.com with ESMTPSA id h15-20020a5d548f000000b0032fbe5b1e45sm8042334wrv.61.2023.11.14.07.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 07:14:23 -0800 (PST)
Message-ID: <32e27c37-d208-4575-8807-99b6a91f7321@redhat.com>
Date: Tue, 14 Nov 2023 16:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 04/19] system/physmem: Do not include
 'hw/xen/xen.h' but 'sysemu/xen.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-5-philmd@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20231114143816.71079-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BXFxpAarcwaA

On 14.11.23 15:38, Philippe Mathieu-Daudé wrote:
> physmem.c doesn't use any declaration from "hw/xen/xen.h",
> it only requires "sysemu/xen.h" and "system/xen-mapcache.h".
> 
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb
