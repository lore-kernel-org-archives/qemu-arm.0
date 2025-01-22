Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp602359njc;
        Tue, 21 Jan 2025 23:08:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULRooyz/gxerB29SnpatUjDnlbbiNcnwaRZBLbUgYMxEiGMfqtd+AIXIKeVz7UCB4CifwjB+daLkLftA==@linaro.org
X-Google-Smtp-Source: AGHT+IH3I0Ydx1oD4l+3oeXczzozsNuS6D0QpYzWaXcfOtq4jtb+RPwH+vIzvaQE4b5sJvsX/bCB
X-Received: by 2002:ac8:5a88:0:b0:467:5da6:808f with SMTP id d75a77b69052e-46e12a940c6mr297438321cf.22.1737529704862;
        Tue, 21 Jan 2025 23:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529704; cv=none;
        d=google.com; s=arc-20240605;
        b=EAZpWoTYNGoaC5mnytbTideI1Hl30v+GQYywAJFuxNmJ+I3eJdzMl82e7l+P7r195N
         rkeJtcXETQEhGGd6Kj+RHvzJd2jtpNKZ/h5BXTXOnVpQzE+AorZYozG5FxPBeov9sr1J
         KJdpx8oNza39LG6jDAaN+pBOvrSVUI7TUuSDFFKz1RgFJRmL9fGapLv5p9RSSJud4EAg
         fLXAugxNjpsQo5Kq3jPaNFEDUER1W2Ga+xcxrqgWymkpe+UCAx0mhkdSDPFCWKq1tDNm
         AZGoZ1tCJfHPvuzW1mgAUe92Bx1wF6xKP6atr3hfYduMqVGut5Qgleul8xQs9w6BsAV6
         xpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=+Zmshx/iq2URjE7xdp3QBu8evcKClfweGR4BGQPyaIc=;
        fh=us9NFVGEzM+rorQ19tpAzc1OG54/YEavFYIGUrZpmt8=;
        b=Z7nCJ71NwfSOmXaY4H1ylF1GNNvwpeFKziXqzmPGTV0c1dH96bnfb3RdRbY39xHLws
         zFp0Isd9noHhQCcuzuxW++aQaIfUc2SCNjfKQKybJFiH8e0F+5uikd9qr2Y1jAo5dcC6
         fe7qwiwp4deXNsPXU5dASs9MzQX1YssrvftXPZWYXELKE+YFvzJ+1cdNYhdQwl85mUPN
         xPrlKJWRP73TdWvON5nyOPy30uVpURDTjBDUn3Gm1avXyHgLiy4cqQKnuQEKHPVD8Czr
         c+vxfCCQ7T0LGCagQUAb5iVds4RLXb8APmbP6fYI2mM1EYPT+MwKlOI9ugUzeRtQzJ8l
         3x7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MSBHezX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e102f194csi151900591cf.129.2025.01.21.23.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:08:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MSBHezX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taUqb-00045b-0E; Wed, 22 Jan 2025 02:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUqT-00042M-N2
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:08:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUqR-0008CR-P8
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737529689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+Zmshx/iq2URjE7xdp3QBu8evcKClfweGR4BGQPyaIc=;
 b=MSBHezX3R+/5ReIZKjl7JAoBoEpTzqH22UTtdkNWdW9BNwpBeXGvPg/PcEJ39KGh/DpkVe
 gD3zol4mQeEI8U1qiyoXjo/+AnBh8YmWIDlqhk4IbQNfv3442d4lEQazeYGaDq2ctlOYML
 HRNwOdWrzfGt6G/jmtnBQkOYWImi0/0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-5lt5tW27Pc2zy3oULwmOGQ-1; Wed, 22 Jan 2025 02:08:07 -0500
X-MC-Unique: 5lt5tW27Pc2zy3oULwmOGQ-1
X-Mimecast-MFC-AGG-ID: 5lt5tW27Pc2zy3oULwmOGQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4362552ce62so33618035e9.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 23:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737529686; x=1738134486;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Zmshx/iq2URjE7xdp3QBu8evcKClfweGR4BGQPyaIc=;
 b=Ft6pSt7M+wLfnRajTfn18wxnh2fk34rxsbwZ+Cf25sJG2Zab/XPW+UGcbyHWFyxo/V
 sHkQqWIKt6M82lnCGcR5lyzXoWieh+pUBMRifRn9JnSn6uAQbRzCNo5bygnAY4d2BVdd
 YpEg9045KMIVjoFXBxnBTNlP/fdgJ13LIUcb8aWwpO0Yba4T88lt5aPXw7di7oXz9NgX
 tkSrhWIf6/bkEA8Sox2SeVMX4414Juy+W/F6m0tvrl0Q3oTdouTPn1MOZFKLOJEzQQZE
 3KTUXNKA1KwTM54lU9nFQOpmHwQDKzZlve+sruRVOnFqYc33ymMUjLVq92eqDm2zsczJ
 MunQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/wKjL6cvB+ut/7ovpzMue8FPnvU6RmsRCRB1mveCGc2Qq4CrDw1u97ojNiJMniwrQGHy3gW79VA==@nongnu.org
X-Gm-Message-State: AOJu0YxS2Gjp/K2mYi8uVTIQRS6qJbVg+LnhxfQtJEB3hq1TqHMidJpg
 Mq+cLQKptzJhRkSOj+mfLUFKRht+AVmT21AhqoGUZUhyAiAyKi3W7eML1ssPoqXp27whNfD3SI8
 wEgQ0GBTj2mR10UbvJpGdLMi1MHLsgN+4hxbdknMLGlhB1ljvUw==
X-Gm-Gg: ASbGncvgaO7ZKOXSX/5AudlSI8Uxv0en3JYZI0llo2O1ZqSMw/Xdy+WxGmtN1sHEbEj
 JmZWK34kQm/xEnEIwKoIgPak3sSlpai/q/2/XN38kZMtDL1529BlokLUx6GO5RkjzvM30GslzIx
 l4561bAo8Pk73E56aBwKfvGg7m6fBkhlXIUvEGa2QvBQA+8YUJwL9yn7+XsHY1cJA0c+Jm/o0B6
 OysdIt6r8aj/qkHP7ajV+dEK02ArMssFhIza27qT4NE4hcM43t4GZzS/WDW+U8aETQrXjqrGg3m
 V+da8CeoVi7G6CLw8dLU20bsqLiywa/v
X-Received: by 2002:a5d:6b8b:0:b0:38a:8b2c:53ac with SMTP id
 ffacd0b85a97d-38bf57b3fe9mr12892499f8f.42.1737529686119; 
 Tue, 21 Jan 2025 23:08:06 -0800 (PST)
X-Received: by 2002:a5d:6b8b:0:b0:38a:8b2c:53ac with SMTP id
 ffacd0b85a97d-38bf57b3fe9mr12892477f8f.42.1737529685772; 
 Tue, 21 Jan 2025 23:08:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322a859sm15156547f8f.43.2025.01.21.23.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 23:08:04 -0800 (PST)
Message-ID: <3bf8a71a-f2a8-41a8-bddc-45d220a953eb@redhat.com>
Date: Wed, 22 Jan 2025 08:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] aspeed: pre-PR for QEMU 10.0
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
References: <20250120095820.516511-1-clg@redhat.com>
 <SI2PR06MB5041DEDC7F75EA997D4ECCFDFCE12@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <SI2PR06MB5041DEDC7F75EA997D4ECCFDFCE12@SI2PR06MB5041.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XLJy6BLXOWmOxQJYlKpb1I-d6ZBps_Cdf2KvefLbPmU_1737529686
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-TUID: 7htSAtPtiOZB

On 1/22/25 04:35, Jamin Lin wrote:
> Hi Cedric,
> 
>> -----Original Message-----
>> From: Cédric Le Goater <clg@redhat.com>
>> Sent: Monday, January 20, 2025 5:58 PM
>> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: Joel Stanley <joel@jms.id.au>; Andrew Jeffery
>> <andrew@codeconstruct.com.au>; Troy Lee <troy_lee@aspeedtech.com>;
>> Jamin Lin <jamin_lin@aspeedtech.com>; Steven Lee
>> <steven_lee@aspeedtech.com>; Cédric Le Goater <clg@redhat.com>
>> Subject: [PATCH 0/9] aspeed: pre-PR for QEMU 10.0
>>
> Sorry, I do not see this patch series in the following links.
I guess the mailing list had issues when I sent it. Will resend.


Thanks,

C.




> Do I lost anything?
> https://patchwork.kernel.org/project/qemu-devel/list/
> https://patchew.org/QEMU/
> https://www.mail-archive.com/qemu-devel@nongnu.org/mail5.html
> Thanks-Jamin
> 
>> Hello,
>>
>> Here are the changes I plan to send as a PR for QEMU 10.0, this week or the
>> next. The last 3 patches still need a review. An Ack would be appreciated.
>>
>> Thanks,
>>
>> C.
>>
>> Cédric Le Goater (3):
>>    test/functional: Update the Aspeed aarch64 test
>>    test/functional: Update buildroot images to 2024.11
>>    aspeed: Create sd devices only when defaults are enabled
>>
>> Jamin Lin (5):
>>    hw/sd/sdhci: Introduce a new Write Protected pin inverted property
>>    hw/arm/aspeed: Invert sdhci write protected pin for AST2600 EVB
>>    hw/timer/aspeed: Refactor Timer Callbacks for SoC-Specific
>>      Implementations
>>    hw/timer/aspeed: Add AST2700 Support
>>    aspeed/soc: Support Timer for AST2700
>>
>> Kenneth Jia (1):
>>    hw/arm/aspeed: fix connect_serial_hds_to_uarts
>>
>>   include/hw/arm/aspeed.h                     |   1 +
>>   include/hw/sd/sdhci.h                       |   5 +
>>   include/hw/timer/aspeed_timer.h             |   1 +
>>   hw/arm/aspeed.c                             |  15 +-
>>   hw/arm/aspeed_ast27x0.c                     |  17 ++
>>   hw/sd/sdhci.c                               |   6 +
>>   hw/timer/aspeed_timer.c                     | 263
>> ++++++++++++++++++--
>>   hw/timer/trace-events                       |   2 +-
>>   tests/functional/aspeed.py                  |   2 +-
>>   tests/functional/test_aarch64_aspeed.py     |   8 +-
>>   tests/functional/test_arm_aspeed_ast2500.py |   8 +-
>>   tests/functional/test_arm_aspeed_ast2600.py |   8 +-
>>   12 files changed, 303 insertions(+), 33 deletions(-)
>>
>> --
>> 2.48.1
> 

