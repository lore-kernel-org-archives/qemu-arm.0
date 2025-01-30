Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp127555njl;
        Wed, 29 Jan 2025 23:27:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtr79t5OXflVV4mk0oyhGRPr7cMu2s/mIB7Q5pdm33jkdFtgdG4UHJKWcUtCgYkiMODvch9F22jwFgBg==@linaro.org
X-Google-Smtp-Source: AGHT+IFnXz+rSGm2cx8AxOoCLg1T+FZeTVIzqibZ3mJLorWcQTG0NqRCxZU7/zNuhmBnGFoI9u1U
X-Received: by 2002:a05:620a:268e:b0:7b6:d70a:86df with SMTP id af79cd13be357-7bffcd0da4cmr1074944385a.27.1738222038341;
        Wed, 29 Jan 2025 23:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738222038; cv=none;
        d=google.com; s=arc-20240605;
        b=e3mtG08C0ck/Sri72b6mfJff/8+Zu/EgbYUBsUKxH1tXV0LQ65wSTIIlIN3lETZCLN
         bIC5XxQUADU42PKcbnkeXJUQuO3jPDXOOE3lp4YVNHgEHiiZXSh5SDs6TKQJa6dAnh89
         24AVwrIxNEU9w/Fh0eThEcPC4ydrM0HrdJY+ug87yFNBbzXKs6DPTYSa9E3NsCcE9EuU
         ItuKFzGs7HCPSjOfunTUy+S3ZmOHdXm2s0sLaV2YO/1bljHnJn36dtAJ55wAyS8WaGEd
         4z1Cd3Pbr5dlVBr2ySzWs243qJjI0UN3503QKffogRkdxUTuRGdEzecHUxEOp9NyBnrt
         DB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=BhO/bkEOqZXL4xUWxtJffe4/Jv2vmtmuA+FU7OiMt8Y=;
        fh=rTcLZXd2sNDMeKS6HgkwPWr6GyGrTX91wpM6nbrSiJ8=;
        b=ODlJjUvYJfNgcuC8HaXUneBCM+hKd4fkhd8x4mVqWc2cA4wfo/cyQGXELZd/X3p3dF
         oXJlqxTVuGYNMrbAiwoqM4k/2I8vht65a65gDzAtKm0ptBXWmvaFx69hAazlUig3kf/1
         AGY2BVsNq0pFVm5Xj8Twl1su1SR/9bQmUDRz3NVfQLzPY/eCSE/xCuwJCi+BhNwpsn3U
         5b0bOMqOzUAKmyQKXZq9+vivuFA6gF5wdIcQ4UP9bu1Hmh7x0iAmDcX7f1HM8FevoUMa
         BCUBAQtGE3ZhoC20g0zgvyPOxeOSCUgl7GeEcp43N1oSVidZ+nxYfDc9Pr3EenQ/qWYq
         nzIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZHcR7TjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8bf57asi118933385a.93.2025.01.29.23.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 23:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZHcR7TjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdOwt-0004lI-4Y; Thu, 30 Jan 2025 02:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tdOwn-0004k4-1C
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 02:26:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tdOwl-0004yV-9t
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 02:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738221999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BhO/bkEOqZXL4xUWxtJffe4/Jv2vmtmuA+FU7OiMt8Y=;
 b=ZHcR7TjUqc3AvAeL2KsZUr77BPqe7zkl07BYXAMCj0zk5tc+b5QMXC0YgqlKPq+SGI752P
 92iU1oxh7JmctzVV8Er2InGOimfouaNn5bB2b8h6Oq7ySveFokqZmMyQ6rpSDCcOyMf3xt
 0xnLGT5++D1sx4h3i6U9WUgOOab0mPU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-FrDleC7nOyC1qA3GVFddNg-1; Thu, 30 Jan 2025 02:26:38 -0500
X-MC-Unique: FrDleC7nOyC1qA3GVFddNg-1
X-Mimecast-MFC-AGG-ID: FrDleC7nOyC1qA3GVFddNg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-388d1f6f3b2so166187f8f.0
 for <qemu-arm@nongnu.org>; Wed, 29 Jan 2025 23:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738221997; x=1738826797;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhO/bkEOqZXL4xUWxtJffe4/Jv2vmtmuA+FU7OiMt8Y=;
 b=jArWJlC3/NqsLI84N85mLmE9REIbGKD4zx/lfH/vFEsrXfuux1VMiOvTS8r2IDD12Y
 S8+i66X82zW7NNAb5/6DOISIPohYDPM/wYznjAUG3LsbC2vnb3aH5cmp4qgIEIABhpFM
 77c1ScbuTgKAcVoalLcb2dXv8KKHZrTURVCD2eR2vGtnCeb98+VyMyVSq0tKELkqGb76
 gITWVANaCceDG67RK9J6QokECkKSFLbJe++rz8PadbSz4Rq5MXcR4V0tBforWjIhy4Gh
 GPP8vshHhQYhbWhjQQ46IsnbcJ/F0xyFXRbHMcXVuswBg412D/Lc7r5/PlCSzFnw7X4B
 cGZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvVbecOiM1K1h5VkyiueJP2k4Eb75HOgGaG73i0aiSy3tPsn66Gd0fBHkj2YdequNN/iQuFgSu9A==@nongnu.org
X-Gm-Message-State: AOJu0YxRv1UJ4PtuDWEbgEEY2o2CLLMdOE6TLRIkRQs0B9hHxKa4N8Ja
 w5T8s2orzr7WPxQe8nINubbWMw0mnFGnCxOjMFRTsgRTP7zOaOLDAVn5lUOcU8jLAS8KbRgEbZg
 800NfhB7p64n5QVGH4HQjfjlq/mRYRfOA8b/qRIERhjBODyItxw==
X-Gm-Gg: ASbGncuxHVDBrYMj9I+1i7xHuvG267rTJa+9eJ0bNjnv+65N/TELBhT7UFG5qvIW1hO
 tPeUE3dkd//OQYirCK31Og/Ignrk56JhlC+SRK5sygaysrrwbRG0BonchhFoGb+tWY3KGHcOsTa
 EQ+pTHKb2y3i67EhNBOSiyOevfv5kq6Cy8avWsSdv4UAwF7tfhX0UzAQpCXaCBoOvlc6gvO//Pr
 SowLUOlZtWl50+6kcmTwtqTbut6HUlSKb8seUkzLnOOZtCvUCaRvGl9vvK+MFN9TyfJEHPhBePM
 eRInUU1WLpk924gQKaxSncOBXV19ty5rvFErMOPk0kk=
X-Received: by 2002:a5d:6149:0:b0:386:373f:47c4 with SMTP id
 ffacd0b85a97d-38c520b0473mr4000623f8f.49.1738221996992; 
 Wed, 29 Jan 2025 23:26:36 -0800 (PST)
X-Received: by 2002:a5d:6149:0:b0:386:373f:47c4 with SMTP id
 ffacd0b85a97d-38c520b0473mr4000616f8f.49.1738221996675; 
 Wed, 29 Jan 2025 23:26:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438d7aa605asm52817235e9.1.2025.01.29.23.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 23:26:35 -0800 (PST)
Message-ID: <e74c87d7-d1e0-40db-8416-7ba48c2be2ef@redhat.com>
Date: Thu, 30 Jan 2025 08:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] tests/functional: Update Aspeed OpenBMC images
To: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Thomas Huth <thuth@redhat.com>
References: <20250128214100.1196243-1-clg@redhat.com>
 <bee99a3ef4821f69f6f1a2f6cfc77c3e247e5d87.camel@codeconstruct.com.au>
 <78e6b6ad-0422-4b43-95f5-f377ea101f09@redhat.com>
 <4c7dc177de0e36a6f3e6ee444357f572affc30ca.camel@codeconstruct.com.au>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <4c7dc177de0e36a6f3e6ee444357f572affc30ca.camel@codeconstruct.com.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8havE62LR10im9UVFP9I_nWytk20kMkULhElNn5-3fY_1738221997
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
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
X-TUID: E9pm43j3HiM5

On 1/30/25 04:03, Andrew Jeffery wrote:
> On Wed, 2025-01-29 at 08:19 +0100, Cédric Le Goater wrote:
>> On 1/29/25 00:29, Andrew Jeffery wrote:
>>> Hi Cédric,
>>>
>>> On Tue, 2025-01-28 at 22:41 +0100, Cédric Le Goater wrote:
>>>> Hello,
>>>>
>>>> This series updates the OpenBMC firmware images to the latest
>>>> version
>>>> for existing tests and also adds 2 new tests for Aspeed machines
>>>> which
>>>> were not tested before : witherspoon and bletchley.
>>>>
>>>> Thanks,
>>>>
>>>> C.
>>>>
>>>> Cédric Le Goater (5):
>>>>     tests/functional: Introduce a new test routine for OpenBMC
>>>> images
>>>>     tests/functional: Update OpenBMC image of palmetto machine
>>>>     tests/functional: Update OpenBMC image of romulus machine
>>>>     tests/functional: Introduce a witherspoon machine test
>>>>     tests/functional: Introduce a bletchley machine test
>>>
>>> The rest of the patches haven't reached my inbox. Did you send
>>> them? It
>>> also seems they're missing on lore :)
>>>
>>> https://lore.kernel.org/all/20250128214100.1196243-1-clg@redhat.com/
>> I shouldn't send series too late in the evening ...Sorry for the
>> noise.
>>
> 
> Hah, no worries. I see Thomas has already reviewed the resend.

yep. patch 5/5 still needs to be looked at.

Thanks,

C.

