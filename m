Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1682209njb;
        Thu, 6 Feb 2025 09:10:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX27b+UCcQSzG+TiYGlyx61cdYT0AwTRzyx1sLbkLy1HcCqh1jmuNiIZj9do6fqxtT9Ovr5obNkHA8RqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHFFGa32XmWo0dDSh3JXmuTCNSR/YUhrIIjFesWptosZ8VsDTuyoVYCdiYZjIFaCVWZM7wc
X-Received: by 2002:a05:6102:f82:b0:4b9:b97c:6bc6 with SMTP id ada2fe7eead31-4ba47aef6f4mr5792387137.17.1738861857562;
        Thu, 06 Feb 2025 09:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738861857; cv=none;
        d=google.com; s=arc-20240605;
        b=Vimn6EuJsfNPpqSEDaIRiOyMmcAx4+/8ZA85Cix6S4YfrdN7SawB61Bf1pA6LkGG7K
         Sb1ME0qceK4I/lc4Cra2Odq41pA6qEkHyHqQiWDqen5JsNfCZJL4xen1aK47HYBGZyR+
         cv2hsCbnDcI4/qWUrgX7xcGigzRZjc31IbEwJ8bsArW19WVLnursXmU7f/C1HCV4J9mH
         EEZpFMMkge06+IibnsNpgEWVYwFCliMkXu9v1abGbMv8ELRxW+Z7A6IRpxqKiApA+a7X
         by/XxRiEawjk2nXhO2lsotPAQsW7oze59uxXxyz+K9hOHWC/Q3RcRO5UEy/XRnIaBt+5
         576A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=qR7rCznCmYMMwhJR+p0kwoZQ6SlTJT+Pryh1NBvuhBI=;
        fh=CU1sM9E21f0JsxRr2fz3xrVdjg/7B8epnVV4W6DE7sc=;
        b=avhlj+gFx7QM+Mg1CRcWD5EqFNsQz1HWies3TVCDpydS3bz52DzQy0MHc4ra9x6nPB
         2uGPkYADFOr7+HqGpJLjWcmNHSz9kmkhjZJTHjy5U5GeQnq3v21WYXee5HpbcSFU2KKa
         9ID2jLEhRwOLZzW8sxBnfkb8Liz5zp1ycROkYngaCgH0T/iBQpeQ2wZPDN2UyDTEqTHi
         f4s6da4NuEgaMOmzYpSAx6ncHEZ3QqqPHy2labilswPBaI4gxUdPDRG6wqgRtV+my13V
         c4X0mI4Xztimc9kBlUPOdJYppieaA6Q/a4tegph9ZdqQ33zcZfnffpcnmmMg4DRUn5m7
         9Hpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W47vju6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba778e2d17si344228137.471.2025.02.06.09.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:10:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W47vju6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg5OR-0006Vy-7U; Thu, 06 Feb 2025 12:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tg5OO-0006Sl-VN
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:10:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tg5OI-0004DL-2K
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738861812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qR7rCznCmYMMwhJR+p0kwoZQ6SlTJT+Pryh1NBvuhBI=;
 b=W47vju6Yw9ZdVrmIbusJaMP4+Ur1bFGDeg/+Q1xljnppMR1DWNexY8ESI89PrHpN8fuf1w
 FnLnIXFv/n4BMfxOhmB8H8AC6X47fISla2Eca3YCsyajuwEvG3358HPhG595eOrDdEQ897
 GvWqxB2fj7ZoHdeXV4ijGKDqVdRNvDQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-zxQY7jkQPMGndkEg2wbcEA-1; Thu, 06 Feb 2025 12:10:10 -0500
X-MC-Unique: zxQY7jkQPMGndkEg2wbcEA-1
X-Mimecast-MFC-AGG-ID: zxQY7jkQPMGndkEg2wbcEA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38c5d9530ebso749810f8f.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 09:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738861809; x=1739466609;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR7rCznCmYMMwhJR+p0kwoZQ6SlTJT+Pryh1NBvuhBI=;
 b=D3BuZL/64GUG4Ng+5oe/N+jjz2mMElnipSKHfVqmr30wbz2ACR3o0HiHlIFrZ/Ae7C
 dv/xL5A+BDPb+2rbgYfGAwWE0GgEOPpBQJH7MtFaFNeqUY2gmxwBRu+/NdaKYof+GJiL
 iAyvCsaZwpRIWEOQQK4lqpwnrS2GJABFC+8OGLP0xQPbN5psoqGHsCVehV0wG6W+0QeC
 MvYmJBePPewuA26X3n2uA0uTP6LukydZuVgLpsUSlLIjZgptB6aT1pP0zpSKU6vpXi/+
 JKJGNfnZ5SYN8U068ECSJ6okRkAymy7oADzZY4iyQmIGLwnCrUePK0E7Mu7A2FlLxMak
 WFsQ==
X-Gm-Message-State: AOJu0YynyTXc4ts2Pvap8yljmrRph62kmsSVXvoQ9kAuHEf9qkBe+qPN
 D2h9d6YQpySoCcrVHj7EPM9fG+VCi37+mfMKa88TAytyShOLJMdk0xY6y7sT+ADCRyOlFmR4tIV
 eBIHIj5+sVC2JxA2KG34w75xVuj03o9wObpD4XCaT4b5kCHrKRg==
X-Gm-Gg: ASbGncsmLF6CTUugtbRHIOzYqC1tRjmoZYd4Az9ar65OT76cW3l3Sfsh8u/sM9MDsQh
 mXOkQBxC0H6GTAdP+qrDwKPU1u3advFkYHLIRKE/KbySgq7XOL5Yb+v4VYJG/V9kZa0wCQIE2CA
 PSryx75W0eejYxL4RrU4XDsRmYg6qGpHVDmV7TFEx4CXwkVxmRu5jSFWKkUkqBB/949wLGtmBrp
 b81qdwVd5n8chREXcAcv7J0r7oNBFo4AeLtBbLSPQwQPscYV9Q97RQ26HTz5Mwfdf7eMzG5p4MZ
 awxfsap6hm71dSIpZRtMqOTUNyQcFdqoFEdY
X-Received: by 2002:a05:6000:ecd:b0:38a:9c1b:df5c with SMTP id
 ffacd0b85a97d-38db48fe39emr4956170f8f.50.1738861809495; 
 Thu, 06 Feb 2025 09:10:09 -0800 (PST)
X-Received: by 2002:a05:6000:ecd:b0:38a:9c1b:df5c with SMTP id
 ffacd0b85a97d-38db48fe39emr4956129f8f.50.1738861809090; 
 Thu, 06 Feb 2025 09:10:09 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc73c2e00sm154829f8f.57.2025.02.06.09.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:10:08 -0800 (PST)
Message-ID: <bcde80b6-0f86-432c-8b0a-ba7aff5dfb2c@redhat.com>
Date: Thu, 6 Feb 2025 18:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] tests/functional: Remove sleep() kludges from
 microblaze tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-15-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250206131052.30207-15-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZUGx21sDACGvCfi-HUZOEBoWC8Fgsr_i9xqXj4sKKcc_1738861809
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0F2An1lE4M00

On 06/02/2025 14.10, Philippe Mathieu-Daudé wrote:
> Commit f0ec14c78c4 ("tests/avocado: Fix console data loss") fixed
> QEMUMachine's problem with console, we don't need to use the sleep()
> kludges.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/test_microblazeel_s3adsp1800.py | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Thanks for tackling this!

Reviewed-by: Thomas Huth <thuth@redhat.com>

