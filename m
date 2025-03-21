Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp515008njc;
        Fri, 21 Mar 2025 11:35:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkQmOno01F/JSkmgrkM1aUwlpjKlt9aiRJqbVdndcdbaH60B80nLG9MR0T3OqE6WIbpqDZy4Ht+iHmsA==@linaro.org
X-Google-Smtp-Source: AGHT+IG8aRnQxG+sRZUfHH725fJ9jrnE6vjOPsRDR5AXhLJ6ezZxWZAwv4XcMEb5SOwicgP1lPQ8
X-Received: by 2002:ad4:4ead:0:b0:6e8:f038:39be with SMTP id 6a1803df08f44-6eb3f2c88a9mr63633626d6.22.1742582113161;
        Fri, 21 Mar 2025 11:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742582113; cv=none;
        d=google.com; s=arc-20240605;
        b=SzeK4iwOUc9mqeK9cXNe+UpDpqo18G55PbmekexNnZ/X7o3FKdK85QepkOJ6ls3vr/
         IJWskJ2ZlvFskVY+335aO2uCNWZ6yeLDK8EW26qvDegSdibTByAv80j4I97wyJMnweBi
         7KWvn3EA+DWjHnuKvUAeq47bDp4bc5rnFvAQgkJzmvAK7V51NgSfQ5pI8L71F8X1q9xS
         UoJZbY+Tagwp+424QrRvelYWUXwaa/XyssmTHrqNJNNJcx3O+03UcyLKMzu580Tqriyy
         hTpPGb5QJutEPHNZfbhjQYc/SmJ6QCk+ffAwsOtSjJ+0oDxAOo+0v+qm62gtJOmwQY6i
         +n0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:cc:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6utVSUq9dQpE1zqzZ+/BSTzzWX67gOfXFvpw8L7qmOs=;
        fh=i9R8H94lBRE3n5du37lIIhfU98mniIXsIL0bVQDwBLI=;
        b=ASMmKrH7cHCojBL1/YyOKGc5HNSaBHABWEWrlQmLee6B27T85e+omin1CvQLNQEq0Y
         S7ucadDSL5W6geDHomiPadzdlU3w0qAEkOV+Lvp9UZ5fAlW7ngcftfPB4EKd/9uGIyQc
         9fBWXpc1COhWx2Kp+zWw8aPxfwh4nFnoOlFTEx/wUpr9Yh6UrQUJhMVpERHgJnXEywot
         FIj8JoaCqyl6LuLwwTNoUAuIDL0fjX9g86BmT1a8K1UDZjLBMDwAsAzL/HLuXeAJFriF
         8b+8vXGYUvIlYZ8HuWaN7traspCrtrh66swN+aMiiChFfTlh7qcn9xb2m5OZuXfiPoeI
         prbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Alok9HyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f01b0c7si22878186d6.341.2025.03.21.11.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 11:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Alok9HyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvhD2-0007gR-MY; Fri, 21 Mar 2025 14:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tvhCs-0007f3-Fr
 for qemu-arm@nongnu.org; Fri, 21 Mar 2025 14:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tvhCp-0006Pz-0F
 for qemu-arm@nongnu.org; Fri, 21 Mar 2025 14:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742582091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6utVSUq9dQpE1zqzZ+/BSTzzWX67gOfXFvpw8L7qmOs=;
 b=Alok9HyMJT1XmpHIT/MXg+p1bxH8FVnrXW803VwuA3Y8Ro6kDghFXiTvVRSlYGz9OA8QaV
 V0xMF0AaGtR11OR6DPaNnONNB9BumrGBYJRQnRkFiuIAUlV0oMHGQ1gYoa5jlGvsUru4Fr
 ahKLyqwj0JmoP8nTS0xbxcz6ZLc556c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-LjQmfHP4OUy4hH7p4J2MMA-1; Fri, 21 Mar 2025 14:34:49 -0400
X-MC-Unique: LjQmfHP4OUy4hH7p4J2MMA-1
X-Mimecast-MFC-AGG-ID: LjQmfHP4OUy4hH7p4J2MMA_1742582088
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3912e4e2033so1172844f8f.0
 for <qemu-arm@nongnu.org>; Fri, 21 Mar 2025 11:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742582088; x=1743186888;
 h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6utVSUq9dQpE1zqzZ+/BSTzzWX67gOfXFvpw8L7qmOs=;
 b=e3kKbHXTXXyR/1uziVqYZ8WEtJyEtJApdCPg+XNdV65HwDTdwmd9ChEe7ogWRGjHOe
 FDx0UeOvkYtQDZuiQnNsD16Wiwvl+4UFilUV0xXdns4K6ax2/Xoz0O6AJpkqNbJoZEPm
 JoWUeDzv+x5EUcwibame2jijd70PO9zRWIj3le2LH34vDsaDpEvYXGNuvN9DF9Prtx8q
 bvAO4Wa+PQ3vfL/rYLTVAF6t4VvgAaSHReN5ANxlaU2cJ7maB/kHfGZ2U9rTYjiRsBtD
 T+xs9X5mnz7jwFXR9uw4KX0x5P42n8U+ixfV1mtsh+ACZw6IBiZqpHnUvdyqq6mWqgX4
 WbTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXWTBmxpWufv8cXq+u+DqSRk4nXYraBcWFtPrvodDHqvvGK/qu9y4huPXzQpTlomForpewbLYRqA==@nongnu.org
X-Gm-Message-State: AOJu0YwasY9NBCnY39RNcZT2Sb9WKg8nwzMhVOk+BWu/OlpVLpw9vKSS
 cNGn/+aNtFqm6Y1LqsdhbbKaIWPtxzuT6q/UeC6bsgqDuMtDuVPKM02sSp+BMUqlu6TZN2kam2z
 oH2LId4h8l9tIDSAsWrvv48/TOOlO3II9CO9ld56WVO9n5sQOAytoWy9maQ==
X-Gm-Gg: ASbGncsb9kEciMpcmHzXQWsQ8CO5RX+Ti2yF493LJ5x7E6d1DCySFFV3MkVh/gpORWz
 e1E7gRsJrByUbjDRx6XS5w0h75eJmfrRPHhX6A8s+xzSmQD4nJG9l2uQjYZBb3rT/rDAe+XaqD7
 8S0nYDq4lrTOL6kv5ykFyEb8tHh888xX6qKzNEtebXJ+aB76VeXTdITYWEvd+cl1b9iT6E3fzlg
 hrLBr+m6ozB5ZkpiWeru3SITWuUQciy1nWH9O6PkV3+Oyg69sm8Xe/F+8TdmflbyUXjNe8f/s4t
 yS4Ytq02SIUFEAXzcOhBznBx4HYfHv+gBM6vbtpk/A==
X-Received: by 2002:a5d:5f4b:0:b0:391:39fc:6664 with SMTP id
 ffacd0b85a97d-3997f8ffeb3mr3945177f8f.6.1742582087839; 
 Fri, 21 Mar 2025 11:34:47 -0700 (PDT)
X-Received: by 2002:a5d:5f4b:0:b0:391:39fc:6664 with SMTP id
 ffacd0b85a97d-3997f8ffeb3mr3945165f8f.6.1742582087381; 
 Fri, 21 Mar 2025 11:34:47 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-50-2.web.vodafone.de. [109.42.50.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdab7asm85188455e9.29.2025.03.21.11.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 11:34:46 -0700 (PDT)
Message-ID: <e51a2f6c-cdf2-42bb-aa0e-3ef1a4332031@redhat.com>
Date: Fri, 21 Mar 2025 19:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/meson.build: Bump arm_aspeed_bletchley
 timeout
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250321155806.1888867-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250321155806.1888867-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FyaY_3crIH8WSvyb03M0YO_Nm0xrr5OYWGr16-7gtOg_1742582088
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: J8kCV/kAuqGB

On 21/03/2025 16.58, Peter Maydell wrote:
> The arm_aspeed_bletchley timeout takes more than its
> current 120s timeout on a debug Rust config:
> 
> $ time (cd build/rust; PYTHONPATH=../../python:../../tests/functional QEMU_TEST_QEMU_BINARY=./qemu-system-arm ./pyvenv/bin/python3 ../../tests/functional/test_arm_aspeed_bletchley.py)
> TAP version 13
> ok 1 test_arm_aspeed_bletchley.BletchleyMachine.test_arm_ast2600_bletchley_openbmc
> 1..1
> 
> real    2m15.536s
> user    3m21.444s
> sys     0m11.558s
> 
> Bump it up to 480s, same as arm_aspeed_rainier.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 96d28289279..0f8be30fe27 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -26,7 +26,7 @@ test_timeouts = {
>     'arm_aspeed_witherspoon' : 120,
>     'arm_aspeed_ast2500' : 720,
>     'arm_aspeed_ast2600' : 1200,
> -  'arm_aspeed_bletchley' : 120,
> +  'arm_aspeed_bletchley' : 480,
>     'arm_aspeed_rainier' : 480,
>     'arm_bpim2u' : 500,
>     'arm_collie' : 180,

Reviewed-by: Thomas Huth <thuth@redhat.com>

