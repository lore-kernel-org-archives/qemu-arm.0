Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1908763ejf;
        Mon, 26 Feb 2024 00:01:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdBgT5MD6sw/zjFHZFTmbTbO1SV4SP9QGhMtMLfSaynHBgNxlAkOATqhTuAatNfavQ3+PeOc7YquPp5zZ7KoX0gPVwp0+U
X-Google-Smtp-Source: AGHT+IEE2KMOHcZN+Jgm8XOyqPH4FnooMIj1CGGIMqPCuJMNYK2DuMcQ9EFicj7bn/4dxbLmLq+B
X-Received: by 2002:a1f:ccc1:0:b0:4cd:b718:4b08 with SMTP id c184-20020a1fccc1000000b004cdb7184b08mr2674677vkg.11.1708934461123;
        Mon, 26 Feb 2024 00:01:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708934461; cv=none;
        d=google.com; s=arc-20160816;
        b=H4g/MIVVpNavxtfsSrRRPor0rqdQaivHx/o7TXLhaxNrzOUYqHIBRkPq9GQRMUO7Xz
         c4oVE8Apugn3Kblg4YrARmoy+mgsxfmn2Ql4itPe9kd8PVCpUwEBwQeQs0Ya16PRFSAv
         eYDOtTuJNQ+KwoaoPwA6BDiUtPNWkzCsk/AUNeVHppEa5Gz6tQ3vfH/jEfYX64WBPC85
         aYXMOjOO+Ufbs1u2YeJtnOI56UMGghiGRN8QDhoaamvNXu+DIYQQZEJ1NbvbzCKtmBvB
         8oP5nQJ2E0TimcTuV/SYA4w4bpkJH7UhT4Lf3JSkMVHR/zfULjrBgrH0ZFYKIm8k8IPB
         2V2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=/UiYJyxUM9xkP4u0DXwmFcgzWF7AV2LuaiRxAZcLzb8=;
        fh=uStePNQ4x3Du2YBG04439f8/Uz+i8kzKsHW9jnRuJyw=;
        b=PS5SSiI7EBYltcAplVCsBbbbArBPZLNggdh3bAgp4CDAVC15D6ONFf3lZfplqN7r4g
         xohmgQEB8bVbYe2GZPrVFUvD5akvi+amw7xw8SYjJosb5fBZX2agWCvzDW3jiv71IOeI
         1lXDWUNNmPLT1P/L2xkQve0IxXsAOTNYXXuAfNIXg5XKyRxotG2GO3s4awjijyP3NAb8
         Xsk/Mj28fHpMhBee3xe4DQOXRmNVA2hTW6lTpkBvvdKVEc9plpavWlXFQehuVs5XSgKb
         Ne2Jfa7RgHPiYRYgZpZzbFZCYmb7QjBGGeHOFoPxu8C5V68JtZt/NBYQEbbfDjf8Jf16
         Aqsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iGvyBzvY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d2-20020a05621421c200b0068ce8312e21si4681874qvh.415.2024.02.26.00.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 00:01:00 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iGvyBzvY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708934459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/UiYJyxUM9xkP4u0DXwmFcgzWF7AV2LuaiRxAZcLzb8=;
	b=iGvyBzvY71cxAGB8YNt5ZEy7iNSQmmFGCGA7T7BKq0fMMzQhGz4wvv5FBUgk7Fr0V2eABI
	Whn/9XcnFAoMiXCJS8s6Cmcd4z0FuxU0IXNSnVforpGXQIvDe1eTk5Zp85gQw65PFBiSbu
	hAG1b5JJIUVSu/QjoXRQiRdBbQ2M8jU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-dO4K5sYOPfegLl1EFFAObQ-1; Mon, 26 Feb 2024 03:00:58 -0500
X-MC-Unique: dO4K5sYOPfegLl1EFFAObQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33dbbe709ffso499954f8f.2
        for <alex.bennee@linaro.org>; Mon, 26 Feb 2024 00:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708934457; x=1709539257;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UiYJyxUM9xkP4u0DXwmFcgzWF7AV2LuaiRxAZcLzb8=;
        b=QH1c/XRbm8PEDeGIPSX1jzpkwVJ/BvqCQCcVSNv5ja0gKy4LeR7CEqPbr8DNQNcsqe
         4c4X0LorEIesuBA9q3B1jNFnqTNnwFmcFQHzD+b8kDHrbw1FT2ViONLyG+UNIM3w1aY4
         L/O5MkyL7Vix40HxpRZ2BhkL8nG4UNsuye2XTWVXAbAmgIr4uPlwNuPPkYpeCuUu3azK
         i3/QyyzuZrYbCZ5b7z0WyVj8I38WijwxwcrHJy0bKqZOcqQrdwkF06CTWtRKXx8aD72l
         bdi1Cjr41E++cAiP9YhqBoyFMTk28jUntRZ4BIQlDjpuNgE3JWxMzNmBa1syOCOEaCqq
         pPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLsVhBvIxq4+LStiY51Pg58bnKXHq7LGawJay8N0uocy9+QRcumkNmMgnSoO6V47W0TgGy23AdygcGUISFnORqAhWPvk1v
X-Gm-Message-State: AOJu0YyRn3KQ6PXqrzlH8BE5tr5pNKn80Tx2L6TfJb/AIguTy6CDXGIv
	Pfq/NN0Mp6XbSvHWfCM7+AeqMjUnhNkY0C2mgXZXZEBTG0Y5jfjXloKxubbmvYeI4PstaWgibwB
	lplcu8Pmz/Ee21nh6CwiIiDBuHDKU5Re7n8iDP1yX6vkcyX9IA7djYA==
X-Received: by 2002:a5d:52cb:0:b0:33d:7d88:cae5 with SMTP id r11-20020a5d52cb000000b0033d7d88cae5mr3727528wrv.69.1708934456832;
        Mon, 26 Feb 2024 00:00:56 -0800 (PST)
X-Received: by 2002:a5d:52cb:0:b0:33d:7d88:cae5 with SMTP id r11-20020a5d52cb000000b0033d7d88cae5mr3727508wrv.69.1708934456544;
        Mon, 26 Feb 2024 00:00:56 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-176-215.web.vodafone.de. [109.43.176.215])
        by smtp.gmail.com with ESMTPSA id t9-20020adfeb89000000b0033dbeb2eb4dsm7236248wrn.110.2024.02.26.00.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 00:00:56 -0800 (PST)
Message-ID: <93bdd39e-c3bf-4854-b724-1500f86a8388@redhat.com>
Date: Mon, 26 Feb 2024 09:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] tests/qtest: Add ivshmem-flat test
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org
Cc: lvivier@redhat.com, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 pbonzini@redhat.com, anton.kochkov@proton.me, richard.henderson@linaro.org,
 peter.maydell@linaro.org
References: <20240222222218.2261956-1-gustavo.romero@linaro.org>
 <20240222222218.2261956-7-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240222222218.2261956-7-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SBizrlBR4tf6

On 22/02/2024 23.22, Gustavo Romero wrote:
> This commit adds a qtest for the ivshmem-flat device to test memory
> sharing, IRQ triggering, and the memory mapped registers in the device.
> 
> Based-on: https://lists.gnu.org/archive/html/qemu-devel/2023-11/msg03176.html
> Message-ID: <20231127052024.435743-4-gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/qtest/ivshmem-flat-test.c | 338 ++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build         |   2 +
>   2 files changed, 340 insertions(+)
>   create mode 100644 tests/qtest/ivshmem-flat-test.c


Acked-by: Thomas Huth <thuth@redhat.com>
