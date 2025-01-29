Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3722204dly;
        Wed, 29 Jan 2025 00:01:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULXYTvFlIAy7o4ywY+TBP6M9QZjJ1eH34mLyNTl87lZ4CIpQ21G3Y8A7BYyVfHBYpij6PCqykx6bVU/A==@linaro.org
X-Google-Smtp-Source: AGHT+IGjH5ZM+ofmPZryRwnqJvzNcrkUz3Ed5uhYx5Z/+OsHOcl+IvrRghxFlR1bQ152/7SmuQFf
X-Received: by 2002:a05:6102:3e15:b0:4b2:5d67:94c3 with SMTP id ada2fe7eead31-4b9a52345edmr1624602137.18.1738137706207;
        Wed, 29 Jan 2025 00:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738137706; cv=none;
        d=google.com; s=arc-20240605;
        b=TDZNviVOYxWScrde6Xx2B1W63V+9bIL/4Hpov0lzdysVz+YMT2rGfcDy27+AF649aG
         rj0bmZNLS5z4uoV5QjnO5F36MTpDLRm5gWcwWH5OaTjGPtRNgt8bHqJGSF2pAEP9Hw5d
         EgNt6e1DhZ9H9Qh5IA6wweqLFNWH1LX1P627O45KSethasSuB3szNq1IDgt/UXw6fZIf
         JxgGA2ojL188mdx0BdqjPAwkZLBBExyz7JY0iIgXlrYDaIc1WkFXXF3Dfq+tQo5/VxJG
         5uG4oMCUBNwthnRNXAo6hncAy9dABenYUwtr1b0XYj4TObkB49E5KIKzmz8Gbt/HEV03
         JeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=err2UpLg6YtFBMBFIJKjfIDlmGO+wT8SNDOdtpjl1ac=;
        fh=hFPCe9YnM+9gRjBKHHRaSLT79muCTSg0YnO/F0ONcQU=;
        b=WkNZUtseQBT0C7h2D3oxncZLFoAkCw1cuKuj67NfnDNHgMFdxcDRpSNDyr4fdC/FVd
         XIaCfQfG2vKcKwKEdY/WNQSueLyGxd1mJeBIPsbLPbJ23BDQqBqdGVLRn2ENCixYSus2
         pxm5n1LsAA4e9susW8J3lyATIKVeWJKZuV2D8FkTx4R0hRAMeYyhI/3EwPi9V7lDWYId
         u8Ime6FWMgogCxRakVuqr9tynfAku7zq0fzzOJR3cJ1Hx5ckhReoqUFzh5onzDTpnszU
         dq/QpsPZEdneKYyxT8/ERJAtB9anF9UK4+kYZm/Xhgjzjn2rqhJo7gKA8n77MuCjXvU9
         4FaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DHjESyWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b7099ac589si3643962137.440.2025.01.29.00.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 00:01:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DHjESyWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1td30u-00077E-9H; Wed, 29 Jan 2025 03:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1td30p-00075G-Hz
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 03:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1td30o-0000hS-6K
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 03:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738137685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=err2UpLg6YtFBMBFIJKjfIDlmGO+wT8SNDOdtpjl1ac=;
 b=DHjESyWzueIP39TwoFhyFH0CiHLb851t4Y93Dbjmkob2Aoon2gdhoVW80HMG4aRpEiO+A8
 mBlACp1DzT/k39kR51yRHCH40gCSeYKqk6CzUKinJF0YXZ7IUps7oF5M20VNjGIRX0Sq9y
 VWPfkUdA9jAvYVVtRTfFWDsleG4yNEQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-JjCCcj82MBmYn-62fpmN9Q-1; Wed, 29 Jan 2025 03:01:23 -0500
X-MC-Unique: JjCCcj82MBmYn-62fpmN9Q-1
X-Mimecast-MFC-AGG-ID: JjCCcj82MBmYn-62fpmN9Q
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so1905625e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Jan 2025 00:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738137682; x=1738742482;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=err2UpLg6YtFBMBFIJKjfIDlmGO+wT8SNDOdtpjl1ac=;
 b=bHuazTP068yzRsbtUnAMcePli9+t9mVZdXfl/lx7/LNDaVWD3gPM4wSOjfdjosYgej
 cYP31gcAtX1GYGlb1Io+FrZVYjZMjBr7RZWBOjhj052CgYZ88+jeUg+k8lxAXbqHHtDk
 gGNXigCGEs/W30D1/nD4jN9HKpgGnnYbADPVqlOYk0sYS8eiTKK3PLHcQQLYr6O55bb2
 Lb+qczHhVSkRKV/bs1g4B3g31pp5QHbaIrKLP7IEhF9Gl5HDlmW87C01etalgEJY0AYx
 z9e9pErWQQsB5DLmwPZCJE+z9c5ax6QoWHU41v8eGl1ROaohvuh+2Eks4PTbaYASkPXt
 AmCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMbzY7xGat9jft3eo8vDWvMKKlH3G6KUikcrIyOA8GaCIvUytTCg3p0XYkEQT4UzYOmTeCLq63BA==@nongnu.org
X-Gm-Message-State: AOJu0Yw5MVayvJn3WEeaDGAClhNk80hnq4fo9hn6Q6kye/nK/VwQuRdr
 gx9In32rfFaaFjShi3+/uWdainTQDLreN4LAlrfToZRcVeyIwf40UbOdUy+L8XlZaQ9VVO8CZ/9
 NjeIDlFbIqY/fm0rknTZ6QU5HaI0LZ0u7T8igDMH3LYDlJPmseA==
X-Gm-Gg: ASbGncuEMMkvCy6ianLXWoNToHuCfqc1+a0p265SUvieZPPmtZgTestO84Lr50mDfy9
 S/YgYfceyCAb/Drwxhn8Wn3EkfvYT0mPeSvFwOZSAaFhXMSJwSTrr3LhVz5/AX1c0zsBVdudm+D
 ID9elhgtDxAY29NtHKf+8R4SzAS6qnPhCr1hMO35do7vbLvN6ioYTnZmMQoz2QLYqIGyuZmlV9E
 81aO5j4qj1ZNljtOP96nsCATJSlV0zKCTi9oZxmwuCQs+p+GYk4WJdW4AhL7fr5U1ObIApA/EPA
 XMAsDkXSPWmK2xJ7KUEt2pasoNUihBYlgrf3
X-Received: by 2002:a05:600c:1ca6:b0:434:f3d8:62db with SMTP id
 5b1f17b1804b1-438dbe86462mr18562165e9.2.1738137681875; 
 Wed, 29 Jan 2025 00:01:21 -0800 (PST)
X-Received: by 2002:a05:600c:1ca6:b0:434:f3d8:62db with SMTP id
 5b1f17b1804b1-438dbe86462mr18561625e9.2.1738137681243; 
 Wed, 29 Jan 2025 00:01:21 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2b231sm13107625e9.24.2025.01.29.00.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 00:01:20 -0800 (PST)
Message-ID: <9ff7ecb1-cda9-4681-acfb-3468bf57c271@redhat.com>
Date: Wed, 29 Jan 2025 09:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] tests/functional: Update OpenBMC image of romulus
 machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250129071820.1258133-1-clg@redhat.com>
 <20250129071820.1258133-4-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250129071820.1258133-4-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BeRLTcPPPc4UkYYKtEl6XOAt_5hN9MocqylexSAyVAI_1738137682
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ECEMm3PcHHNr

On 29/01/2025 08.18, Cédric Le Goater wrote:
> Use the new do_test_arm_aspeed_openbmc() routine to run the latest
> OpenBMC firmware build of the romulus BMC. Remove the older routine
> which is now unused.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/aspeed.py                  | 16 ----------------
>   tests/functional/test_arm_aspeed_romulus.py | 12 ++++++------
>   2 files changed, 6 insertions(+), 22 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

