Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B04CAC59A
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Sep 2025 09:53:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzXnX-0004NJ-1T; Fri, 19 Sep 2025 05:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uzXnV-0004My-GC
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 05:52:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uzXnE-00049I-Dx
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 05:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758275549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sfnjyFpOT5GdZ2mchwJy3m59k6aCaH+/0l017FKQI8w=;
 b=PVp06tsLfRsFZuw7L9HbrvPS1fLctWW5p61tVXciX5GouzNv9Jl3iG6uOgmLOYhMA2AmaG
 PM7lMTa+QvKrNjo2UPTo/jDOArqynmYoJQR0RxUlFg5RC371ae4v4dGedTLZn0Ct8RBR3K
 gbnsBh4F0GEJHko2zXDKKU5ERYrl4P4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-jj5oTvOlOk-_NECbfuuKdw-1; Fri, 19 Sep 2025 05:52:28 -0400
X-MC-Unique: jj5oTvOlOk-_NECbfuuKdw-1
X-Mimecast-MFC-AGG-ID: jj5oTvOlOk-_NECbfuuKdw_1758275547
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45cb612d362so10295375e9.3
 for <qemu-arm@nongnu.org>; Fri, 19 Sep 2025 02:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758275547; x=1758880347;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sfnjyFpOT5GdZ2mchwJy3m59k6aCaH+/0l017FKQI8w=;
 b=RlLlN0I7spS8K0lWAW4yPI/BS12jZTS65L59MDPHWqnfI3W+zrSaWEQNRFYaIN9VhZ
 J6cmFyI6B7lqzZMPtc6X/4WtizCTA/uFXsqRLZYGnnxuno4VixfBqLz0glACmXk3Fqfs
 YfErs2wUVC610MMCHRnflRIncLQ6b9m0eJ+dq3FHv+wQg6gxlP/9+zdRXsGocmdNAtbK
 44QvHMcHUVqVZrwVtnXDznhWSg9lqgpqXyzTAsWvc9Bhfx5BbDLTtqF28Ax4Pn6VarCr
 1Uikne4z9nbR0h1UBHen00Ps0X10s9EyrkIXW6dJjrt3MxgA9NDpjG0ywqZu8u0D3CKX
 935Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvG3ICWHRRP+RNFv1LpetQTtlaJk9N3yriWQpw+fmARODvjuVVivSYb5iiveMi+wHliMO6XK/Gcw==@nongnu.org
X-Gm-Message-State: AOJu0YwCEGgXgkhordMyFJlPGH5IJ66BU3Sji0SCUFfgPz9puUK1V++f
 CdiKUaJvNw67tdzUUkKHIYz5viaIyHCxt6JW0A0LbkcbOuqJC+zuLWCKieq6Q15+L39BiXNYsjj
 WehCB9qNpbWY1E+/2ku/kUX3vveTGPjMPahvcQBqSgUeEGIFiM98vBA==
X-Gm-Gg: ASbGncvNVLHerWNEdn8ZwU8cxrwScyIBO/gyC2Smq2sP9rmF/d7L1gfu57ci8uRh5/U
 NRYQ5J3IXiHitiS1rcm2OkJv1tz7rJ8l+msPMKjf1J71mKyxXK7hhvatEhUoFnn6pDTyPIM0Iso
 SUWBRU+Pp9igzpl2YA0vwA4mjGCDJ3rzsnMUJqZWK3B1bYOvBhtacUkZ+n89Dhp+pa3fIZ8yAde
 qQ1LJqbhuJwRsnTSuZxcQuFM0BVy95dwSsO2xA30D0OTXAR7HPrcxYEU5MW+RfOtGaN2TTExiuz
 Rib7v/A6DtCRLMFo7FLrEM3CLXYrff54vkAhEv9wFm34I8iZ4hGg/rDgznNEcPLgngRpCeOmV6J
 8aiQ=
X-Received: by 2002:a05:600c:8a09:20b0:468:5d0c:fb49 with SMTP id
 5b1f17b1804b1-4685d0d011cmr10864015e9.19.1758275546845; 
 Fri, 19 Sep 2025 02:52:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVpovK2DNL4FnXfjUXIt2v1c8OIcR9NHWnSGzLfe82Y6wUzTUS2+Ouotgs9otlyu3IRsjOJA==
X-Received: by 2002:a05:600c:8a09:20b0:468:5d0c:fb49 with SMTP id
 5b1f17b1804b1-4685d0d011cmr10863885e9.19.1758275546477; 
 Fri, 19 Sep 2025 02:52:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32083729sm76597265e9.0.2025.09.19.02.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 02:52:26 -0700 (PDT)
Message-ID: <12fb1c21-d53d-4418-8782-791ea97dd54d@redhat.com>
Date: Fri, 19 Sep 2025 11:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v5 00/14] Support PCIe RC to AST2600 and AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com, wuhaotsh@google.com,
 titusr@google.com
References: <20250919093017.338309-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250919093017.338309-1-jamin_lin@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f2b3zQhnXg6MJ_iuxIfAvafR07aAyBt-E2hvbauHj6I_1758275547
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/19/25 11:29, Jamin Lin wrote:
> v1:
>   1. Add PCIe PHY, CFG, and MMIO window support for AST2600.
>      Note: Only supports RC_H.
>   2. Add PCIe PHY, CFG, and MMIO window support for AST2700.
>      Note: Supports 3 RCs.
> 
> v2:
>    1. Introduce a new root port device.
>    2. For AST2600 RC_H, add the root device at 80:00.0 and a root port at 80.08.0
>       to match the real hardware topology, allowing users to attach PCIe devices
>       at the root port.
>    3. For AST2700, add a root port at 00.00.0 for each PCIe root complex to match
>       the real hardware topology, allowing users to attach PCIe devices at the
>       root port.
> 
> v3:
>    1. Fix review issues.
>    2. update functional test for the e1000e network card.
>    3. update license header
>    4. Adding "Based on previous work from Cedric Le Goater, with Jamin's summary
>       implementation.
> 
> v4:
>    1. Initialize pointers to NULL when declaring them.
>    2. Use distinct variable names to resolve memory leak issues.
>    3. Update functional tests to verify assigned IP addresses from
>       Intel NIC Ethernet interfaces.
>    4. Introduce pcie_mmio_alias in AspeedSoCState instead of dynamically
>       allocating memory.
> 
> v5:
>    1. fix memory leak issue. Replace g_autofree with array.
> 
Applied to aspeed-next.

Thanks,

C.



