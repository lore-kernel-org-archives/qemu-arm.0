Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3203450njc;
        Wed, 16 Apr 2025 02:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8IQ+HFWKGnwxKJccoPUAsZU7iHUYABJeJGAxBXW9QV9Y5Oz6I/uhwmyM9qmmh9GibAZV2VYxSU4x6vg==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ3V4IqcIggCd3k2VjekKTzX6htglg4cV4LJ4i/QBjNVsczD4Z+QQX1Ly1PkTX+7C40NeT
X-Received: by 2002:a05:6214:2a87:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f2b3032873mr15927166d6.36.1744794893853;
        Wed, 16 Apr 2025 02:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744794893; cv=none;
        d=google.com; s=arc-20240605;
        b=TCiOXRRHcvyyFwcSagAeYkJ9jtNlkiX0+Yz+1cKZxnvY3GARC8y6hjvDbYZbaqguzw
         Q1tJ8YpvWbP7zDudWAxDEcbH++ZjdCfN8pns1F+DCWKEkqJuGWgulTq9YtxP+Ztn8yzN
         aTJu/KxfuAdXI6wYz5KJMvfF1rPwTLI6noJo0kIIvdAINTQR4EGxh1WXosfV1wLoz5hO
         msTVtTkMTkTbWt/Ulbh0EcZkMQWenX/FwT9sfyG6eYHPMxJtIau985e61UIFsBpf62vD
         lYIX0ezvzPh2aCVDgU+EdfJsH4y9/d6/RMlPVb+5FbVo/XmBKlJrZbB5RSUt/RfCxUxf
         /y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=S73o+5gdR+idz0e6i/LO+q57mH3U211Z2J6LdwxR3Fk=;
        fh=HkvfAVmkKIgIf9kTBUyad/T2MRWeMUD9XbqRVHQQwk0=;
        b=VAuN+YxqJEuqbCjHXX44axsOvR8JSA1z51S7inIhOaoHSs0sfDlVmWODTMScuNI3bq
         GA4utkPkHofzi3k2Cq5RFEoLjLLdMWCTOaiBhaYttBvani2O29XNe9o30e0m7UzEoaFp
         bsI5efJ7PDg0Quh07JDB2wOcY75Gx/HT0qzxt4K11aev6l+g6//3/mvfdHL/bGlD+UBl
         tgJe27LaFCH93/sY+v8sX3GMuDgWyZMPFnbRbuCDFnkOhfRUMiNvDaG1FJHiFZIAA3tN
         jIzMrjjvmgA3OahElpqJGhi30F4zF9vmQWgd+iGdzoE+3k5/hx4E65/H5AODRnB5Wn3O
         lbZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNvCebPT;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2a4f98cd6si33120516d6.10.2025.04.16.02.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:14:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNvCebPT;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744794893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S73o+5gdR+idz0e6i/LO+q57mH3U211Z2J6LdwxR3Fk=;
	b=RNvCebPTvrU1UhPxXQVo4crcscaiBuDgewOnebxwbvTxwxSIUUy+d4QtuCruejTKQs0HWF
	jp8NO8rVc+aaxiqPpZqdFaerE6Zt8WVLEEmo4g4wdfa/Ih5AiT9hZNx0K3zGELQrIUKpGu
	c7QPZ4M258koPSFAUPZhuunbZQOWsZo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-Euy7TeJWN9m3UpR5nutDpw-1; Wed, 16 Apr 2025 05:14:52 -0400
X-MC-Unique: Euy7TeJWN9m3UpR5nutDpw-1
X-Mimecast-MFC-AGG-ID: Euy7TeJWN9m3UpR5nutDpw_1744794891
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ea256f039so49346615e9.0
        for <alex.bennee@linaro.org>; Wed, 16 Apr 2025 02:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794891; x=1745399691;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S73o+5gdR+idz0e6i/LO+q57mH3U211Z2J6LdwxR3Fk=;
        b=jBL+f8S0c7sf4PfzUkheh5p+5PvvRmgI6ows79GhRAeMiBe/WuS74y8sdjU0zKXYnD
         Lm4H9v0AW0YI6R0sCwBufo2PkpUokpiSfp6rp/rLXoLEctnvCYgfV6G8pAWoD19aldmz
         /bPkzzMIxC6TW+3MApuHQ38jgC1xiozFSZ6hemb12Lh2kMpNiGAV0c8Slob7okgtArnr
         WNjHTZzRDb0ORubSkWgDrnSjUde8ObgYJt80E7tbk8l5aD0PEOkIn0uttEK3IVotL4bo
         D5mfZE90zX9lRCokgeDtPawHEOFXS0RIZ6fMeFadsm/5d+RIAwh1ycv3P386DA6fMOQv
         ZSJw==
X-Forwarded-Encrypted: i=1; AJvYcCWrihqh/BjFB6lM4l4sJL2K+lXIbQwuJNJMXvHTF99EDsY/26pPQmYXGfA43aYQYHKsl9/NCgDuaDkZqg==@linaro.org
X-Gm-Message-State: AOJu0YzzdsGKgiQaTYAKfBwEhv7KT6Kwh4X5OustdI9OM5zq5BuSW2Ip
	Dr2J+E3Ex71ATQc+PlmMk0NzK91FPu5zU44K7/IluKMVZY2QJeguN3p23Kix/FXpBL2wz90pPRi
	C0IWXPJhxpvBKE4bZmooXEcq6J8T/sUsxvNOZbsfgjYl4BSvzIqOipg==
X-Gm-Gg: ASbGncs5SyQey75N3BzQ552fXw5OHEZuA3Z7e39VVtwU/f4z1zSo80WTBfb8mPBvqYh
	ep/bzNGxsakh6Kc1PDgKS6VM27rXrBNqBG4xV0+ek7P66yu3e6wxcDZG32CxTjMc3CVbFf7jWk2
	ftr35a8a0uujrNSlFzQSWyzEwIDSXQHXceRi5y57J+SVHDJI5cGKnOoUjwykwrxfTHjHmnQPT1E
	UmhNjy2C7ZjM3Ia6d2okL1vbmV5kIeO2ioZFQ4oOJ/E0uGsRCPi0PNieXfaIjlW9DjK1p2fx6Wd
	vrJGZP66P8dXtHUCniiyMrpfK3IpXjQ4L2JVQO5YHqo=
X-Received: by 2002:a05:600c:5025:b0:43d:988b:7732 with SMTP id 5b1f17b1804b1-4405d6255aamr11632655e9.14.1744794891077;
        Wed, 16 Apr 2025 02:14:51 -0700 (PDT)
X-Received: by 2002:a05:600c:5025:b0:43d:988b:7732 with SMTP id 5b1f17b1804b1-4405d6255aamr11632415e9.14.1744794890747;
        Wed, 16 Apr 2025 02:14:50 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-43-176-89.web.vodafone.de. [109.43.176.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8263sm15485835e9.4.2025.04.16.02.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:14:50 -0700 (PDT)
Message-ID: <307e2854-4320-4c8b-b6f9-b8ba2627157f@redhat.com>
Date: Wed, 16 Apr 2025 11:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] hw/core/loader.c: Fix type conflict of GLib
 function pointers
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 "zmta06.collab.prod.int.phx2.redhat.com, list@suse.de"
 <qemu-ppc@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
 <Z_9qIQhjsI5zOwXA@redhat.com>
 <CABgObfaj0ycyc2jVSJEVvQJ1m+uLf=_HYiOafn2MECgU36aspw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CABgObfaj0ycyc2jVSJEVvQJ1m+uLf=_HYiOafn2MECgU36aspw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9gDNq6KVDfFN_XkT0BIGx2agjs9QDrrTdTO-WmkYIZk_1744794891
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pPv+p8K4uYhX

On 16/04/2025 11.00, Paolo Bonzini wrote:
> 
> 
> Il mer 16 apr 2025, 10:29 Daniel P. Berrangé <berrange@redhat.com 
> <mailto:berrange@redhat.com>> ha scritto:
> 
>      > -    secs = g_list_sort(secs, sort_secs);
>      > +    secs = g_list_sort_with_data(secs, sort_secs, NULL);
> 
>     I don't see what the problem is with the original code.
> 
>     The commit message says we have a bad function cast, but the original
>     method decl is
> 
>        GList *g_list_sort(GList*list, GCompareFunc compare_func);
> 
>     where the callback is
> 
>         typedef gint (*GCompareFunc)(gconstpointer a, gconstpointer b);
> 
>     Our code complies with that GCompareFunc signature.
> 
> 
> The cast is inside glib; g_list_sort casts the function pointer and calls 
> g_list_sort_with_data.

Did anybody already report this to the glib people? I guess it should get 
fixed there in the long run...?

  Thomas
