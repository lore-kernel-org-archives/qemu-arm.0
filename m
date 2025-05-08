Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp310064njb;
        Thu, 8 May 2025 03:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfxWnS6Bu5PFHmyIY37+XCjNjiZfRll9bQYUjka0FgqDUQovkYJau7ZUlGVw2511IHmCf4JCA/enKFgA==@linaro.org
X-Google-Smtp-Source: AGHT+IETRi0TPyrCCxb1ok+LNQJFuAgSwZSqiaMHB21pqSBPxHgkx4rolhmgTXdYLIc4ZSPb3nJu
X-Received: by 2002:ac8:5aca:0:b0:476:9847:7c6e with SMTP id d75a77b69052e-492260191c1mr108410101cf.19.1746699149456;
        Thu, 08 May 2025 03:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746699149; cv=none;
        d=google.com; s=arc-20240605;
        b=JEAMrsdjcoGuODvmESA2w3Y+vdhQMOqnQ1gbW53WOsVMyk+FhlDX4yG1xny4HBMVwA
         3td3tEb6//R6uy0j/A440vcFO3R1RX47Zt2VyAVbV5GVLiwFEz/V4Bu0YNX5sbpR0UnP
         6grfN28BlJGrw7Tu7xhbaUtWEew+Y+IeHrTAMGbGOgBn9WgdjTwaG6xBFPH93Fo2UiST
         oNKjFqXRmwdbu9EHmGlnVFMxNLBHXexSMaZzVcGXDyM25krTBLb+0Y5sYZ3x/zmaleY8
         Rq2mytpSWhJdu1H6wnE2HMOTgvhlx9cHP+iyaMKeYdqt1aD9S4YYJfYYIscOznJeNkCg
         tsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=eicgXcIuwU8RkG57txb3mlJ9bwtZIK0qYzn3+CdidQ4=;
        fh=82WjWgZy/4vXoLEnAAyQB5BnsJ3HQRBxUmDULqeKpnQ=;
        b=H1qA/V2XRTz4dn/XViCUUR2d7LhDaTW1i81O1Cyy4CYuoP9BDyzFfaLCBPE/hjZOKg
         ay5BB3edCZFIHKQMxPhIhTFEbVerfCZQwSJ3XZ8YIQAdlvoMcg94CAhOna5nCCc1QkZF
         8Lc6tzSMXEM1FNh82h5yAaYmuOsS7GjVc3Fp3glgc4BCqnF0GkqoZzSWO1378uMFhAif
         RcCkHLXQJFAOdbNs1cqyE5ZxhiEYKk6o4WN6vrDGRFrzEcQRI7lVbXfLWitbXSo6CeZ3
         8C9H7LNVqYzKo9DVL9fIu/V/v6NQ6hltQ//pGV59XIndwcXRcQa0a9kif9wHFLnuYUt+
         3xSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QUj6d98m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49223927e07si43444561cf.630.2025.05.08.03.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 03:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QUj6d98m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCyEh-0005At-Rr; Thu, 08 May 2025 06:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCyEf-0005Ab-Om
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:12:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCyEe-0003JI-36
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746699130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eicgXcIuwU8RkG57txb3mlJ9bwtZIK0qYzn3+CdidQ4=;
 b=QUj6d98mL1EObJxFTngjYpm96WzZFn/LsdLRZo2Zoc2Hxuj6BTWMLjPh4XGwUWPYZ/oivO
 LP0yC3fgB5NJxLh1qwbZFnXnEaYz1JzOoQDlK9XBNEnhk6i+i00lV0pp5byige9iG2RF65
 1box5nih4jnyIPwKDo+0In0fvqvhYh8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-BdmZACDUMYyJ-6G708GKaQ-1; Thu, 08 May 2025 06:12:09 -0400
X-MC-Unique: BdmZACDUMYyJ-6G708GKaQ-1
X-Mimecast-MFC-AGG-ID: BdmZACDUMYyJ-6G708GKaQ_1746699128
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a0db717b55so180167f8f.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 03:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746699128; x=1747303928;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eicgXcIuwU8RkG57txb3mlJ9bwtZIK0qYzn3+CdidQ4=;
 b=vtB+SmIYK5A4M3XijGzqBuOFifq36DS01+onHgWzRWKmC4CPk5lBecSCck6LjXyeRT
 vQkqijPCnRaM0XFoP2eUcu3Lj31TxcjN4ziY9WHioifypKIbqKLPjsi+k2Xi+wuEM5fK
 aPFP/J4b4k+GPT7UkxyrhOS8uiyik4WEpUm7sZaNwL2Ms6Yy9NwTGmQaTlmxz1NOT7JF
 qhMkheKJT/Sl8wT8zAWw2zZvAU0FVTon19b/kJRZKTJimNQXR+15Yrmz69dvXqDAKfvN
 HZTBX9mpnXBHF11Ex8Q+rC/ddWtDryGsFWjtxFWox2OtFCaB4qhpSXLUf5PXLVCyh6Wa
 5Xbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg8MZzgRftHnEVe4oMhfkrTRkKX4NP8g2Sk//B+jnZVVdv+RnFfMj4Os6qipAJbHaD/stLUSDtnA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/Y/hkFmvcmU7/oXmtxMn59AxB9V0p2wc9975NanKaGhwQd3XU
 bpJ27R36ayFBcs/mudBhUTI4vGXrqCQEOD58OmPCIp+IvOpOQaxYO7hoBoGh0p079AIE3ie2UmT
 m732nrIRVALkRwb7ZIFCDJWbqlUyRA3fTyqGOpO9dvSOUWALydA==
X-Gm-Gg: ASbGnctXAzkVr+2WMGgcxjbRvuqHMUzbiQCyULr51GoSai3IRxHuUVcpSJ80ygw7u1P
 tXg1Hn7hE8Ayll/WwtU0la+3v0WYIQNbIliBjVn8SAj9TnOSsUCALNG+3eVQ1y4+KlauNXLoB/7
 NMd0BQG14Z3SuOTx6zaVGeCO/KlDKNQgO6Yb7Qym0/Dkz63ZoP23rerXSImJFNlwvN+EnRRMsij
 3sHOc0tXRTwegHaYN5gt/YiQTIuz/0tg1g7AMO/Gzhfc9k3h88kYZbQcBjsmj5q9/XkCtmj28Dq
 QDtYeyRzGwYeKVMz0dmFXKTWcYvBcINJ8uWmUmSugRdMUOBK5d76
X-Received: by 2002:a05:6000:2410:b0:3a0:b9e1:2a1f with SMTP id
 ffacd0b85a97d-3a0ba102708mr2134764f8f.51.1746699128182; 
 Thu, 08 May 2025 03:12:08 -0700 (PDT)
X-Received: by 2002:a05:6000:2410:b0:3a0:b9e1:2a1f with SMTP id
 ffacd0b85a97d-3a0ba102708mr2134734f8f.51.1746699127786; 
 Thu, 08 May 2025 03:12:07 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-115-173.pools.arcor-ip.net.
 [47.64.115.173]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b350f604sm6303011f8f.21.2025.05.08.03.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 03:12:07 -0700 (PDT)
Message-ID: <74e85995-f130-40d5-9832-4bae10ef4e36@redhat.com>
Date: Thu, 8 May 2025 12:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Revert "meson.build: Disable -fzero-call-used-regs on
 OpenBSD"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
 <20250508093519.144004-6-thuth@redhat.com> <aByB5B02zxvUZo7P@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <aByB5B02zxvUZo7P@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pnBfaffQdJcOf54WSwh-5rAPX4XX_VTafYrl-KRtzIU_1746699128
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HN9TvG6w1w1M

On 08/05/2025 12.05, Daniel P. Berrangé wrote:
> On Thu, May 08, 2025 at 11:35:19AM +0200, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> This reverts commit 2d6d995709482cc8b6a76dbb5334a28001a14a9a.
>>
>> OpenBSD 7.7 fixed the problem with the -fzero-call-used-regs on OpenBSD,
>> see https://github.com/openbsd/src/commit/03eca72d1e030b7a542cd6aec1 for
>> the fix there.
> 
> Is that fix also backported to OpenBS 7.6 ?
> 
> We support the 2 most recent releases of each platform, so for OpenBSD
> thats currently 7.6 and 7.7.

Sure about that? We claim to "support the most recent major version at all 
times" and "Support for the previous major version will be dropped 2 years 
after the new major version is released or when the vendor itself drops 
support, whichever comes first.".

So for me that sounds like we only support 7.7 now, since the support for 
the previous major release - which was 6.x - has ended already.

(Apart from that: Does 7.6 still get updates or does the OpenBSD team drop 
the support once 7.7 was released?)

  Thomas

