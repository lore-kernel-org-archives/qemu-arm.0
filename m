Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp110878njl;
        Wed, 29 Jan 2025 22:40:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSQdbYKJseSgM7KqeZjbIn0nboLSFiqYjII8qJ8UIKh+J17g5VkOjof4Db4mXThWknltj7X0NfZ6ohJw==@linaro.org
X-Google-Smtp-Source: AGHT+IF0mm3M8A/rNGBJBXrG4K0thznuvWl42WO8g32UmfjeOaFcSh8wHABhsioRwP9BBzhmbx27
X-Received: by 2002:ad4:5e85:0:b0:6df:9740:68a3 with SMTP id 6a1803df08f44-6e243cabf83mr106006486d6.38.1738219251717;
        Wed, 29 Jan 2025 22:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738219251; cv=none;
        d=google.com; s=arc-20240605;
        b=BXwajEN8GQIK/iDMFcpw8PT6zmsFD6j6SqFevKJxSzSi03dL2Mc3sOujstu05BTIW4
         AbH5pZuIij31tF6Xr2sRxqGXkRkhEMoOfBbH4SuW60bqLPvDNNxl+sZ8qOBPzsMMFAn4
         zHzYD1tCH96UzLXNIqQFhZoE7hMTluCdnQr/gxd+Z9Ga2bCnPpVPA3/RQeI1xERKaOaA
         rz1IgPa9rd4W/+dpAiN24XjtXHDdFlc+JmL3MwSi8IiKDnTL/CIHEQ+jqFJ5pxGWEyLE
         OixwnHuotz3t6kenKiFaTiyXz/8KjKNjt/Nr/gxW5F+kNJIZOI6ZGHCKqM6ohNYgJQHM
         6bbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=HQKJjO18p/Ip3LdvMZeIgzo9C5VIOgiMZRgRDeBhUic=;
        fh=YPqzAO9uk5W+I05p9p1+hZ8B4KUMzwmGr3apunKu00o=;
        b=h0tUbWciAiUXGBNOA+PItRM7QXXD+YF+31ty8yabRP2aooqK4LZSTEmDTZ52cCzvCZ
         JrTDLLlZM46tvZ5R69jJ/iqPSJkeqw01kGRjXlTOVMo8CNQoo5nQAgOzE3vuo8ILPbbV
         HjBef6WZGZwgStTHlb23jil6FBEIlHqrJR+YI0yCzXjNfkasZ2Ao899UYID/7rfvLr2r
         jsvsBRpKbhpvAs7EYYPkR+7n9DYBaNa7D7FdjS0N2ZjM7cozCBMajHdJ+sasWRKbQqng
         3NO0BJZAMfXu0bLPUDFR4RyvZIjOVJQt7X9WVTvD9kJKTaNJlhmA54pqwfi0QV/ZDCGP
         32/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ccNYbQMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e25497029dsi8059366d6.205.2025.01.29.22.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 22:40:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ccNYbQMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdOE4-00016r-6S; Thu, 30 Jan 2025 01:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tdODy-00016H-At
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 01:40:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tdODw-0006DC-6T
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 01:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738219220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HQKJjO18p/Ip3LdvMZeIgzo9C5VIOgiMZRgRDeBhUic=;
 b=ccNYbQMpPI5c/OU0OZF7DU0INk8zc/pAWZmBw6V/XW2SP/9XWpoERCG6NwbvRrJdHOroeM
 lodvbWh66pUyqcovQNSKyq5SE+sA6T7FUy26Vc396/QL8XpKxKey7MYS4Of1ixQLanFDT5
 TMIlz0+llygqf9GQ6cGKzten06HjTCE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-4QzZbiqGMNKWRlLm2cW-Jw-1; Thu, 30 Jan 2025 01:40:18 -0500
X-MC-Unique: 4QzZbiqGMNKWRlLm2cW-Jw-1
X-Mimecast-MFC-AGG-ID: 4QzZbiqGMNKWRlLm2cW-Jw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4362b9c15d8so1564245e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Jan 2025 22:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738219218; x=1738824018;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HQKJjO18p/Ip3LdvMZeIgzo9C5VIOgiMZRgRDeBhUic=;
 b=JlhPt3Hz9rMy3jxgc2zfVecmI3W7F2XbgkOyKfvJGmIQmSd0zTjEMn+Mha3oohIFJe
 kmwKwYSR56Pyo6fal+fTLeVnj+P3XE270gTLprSrvKliDGUvntZJX4lA4+yQt3qbPd8/
 ajRqDGEiGSB1Gn+j/VYrHKFhn2kWBvg7gFR20OEF7epD2DZ5uGwCvfV2FseiXJDlxFSQ
 /1tzLdftKE40Q9Zv1Ct0Dt2to7nJyCFXulYaQ4KL+Q91KQedpJ8H6qdCHBCLcmeM+Hlk
 q1QjlNko3D8YQwLF9fx3wTysPhMKNfqEBvqzHj/OMX3xSPsBX/IwWJbksPzcGBBvK73D
 pvvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnJG6y/8ZuDNOlZa+Zjvz45qFYFenMnBfRoONDp8iw5+6zGkCnozJ9ggVWYhzm+AZp0YAiTDzSsA==@nongnu.org
X-Gm-Message-State: AOJu0Yy0nZvxwkzWyyndXyZY8fyAbZkabWJ6odQ5TpRcS+wv3yB0SCJK
 sIb2yoNFhPmFAovQQ+1GWPiuVqROmwhZpOLqWDwtSEPjIgwX1UC0sj1MjYKxBQ0KjWqvqnba21b
 iypoSD6M3du9guk4HQ27ItTMAgW+Y0eFew8uhcnwYo/GCZzVRFg==
X-Gm-Gg: ASbGncuQvF6lFVlkzabpxzdqz9Tbpegf5mi6ufRfF6wNO+zOBA2POW+BAsucny6UFXY
 UUImVmZz53eYEI4EjFBymC5D883+0N3+j3hB0m7PAFCYEOYa+JmeChR7+AIPAriTh/PaZViSMDo
 crA/LyoC6FytO4L3feSnlGKfSxnCXLqMN4/vTQIytCBbqCOhSrgcFmBKxuIy1BaYug7iNRxBAQL
 SqL0znO10vZui3QJ1Y9R5UA3YdFoHgGHMwhv6BtIZkq4x5Kg/q/hT42d+xw/7FCv/XGZvWtyW+5
 mGOtGQl5isBWRth7q3FJuG9aj/wNYgmf/WGr
X-Received: by 2002:a05:600c:1e0e:b0:434:9934:575 with SMTP id
 5b1f17b1804b1-438dc3caa59mr56255575e9.16.1738219217805; 
 Wed, 29 Jan 2025 22:40:17 -0800 (PST)
X-Received: by 2002:a05:600c:1e0e:b0:434:9934:575 with SMTP id
 5b1f17b1804b1-438dc3caa59mr56255415e9.16.1738219217457; 
 Wed, 29 Jan 2025 22:40:17 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d444bsm11892935e9.8.2025.01.29.22.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 22:40:16 -0800 (PST)
Message-ID: <3fe2d7fa-0e2b-48ff-b69c-2c6d805fee12@redhat.com>
Date: Thu, 30 Jan 2025 07:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] tests/functional: Introduce a new test routine for
 OpenBMC images
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250129071820.1258133-1-clg@redhat.com>
 <20250129071820.1258133-2-clg@redhat.com>
 <98b2cdec-dcd2-44bf-a81e-91521e2bd446@redhat.com>
 <815ec281-f4b0-43e4-ba56-1400d16dfe21@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <815ec281-f4b0-43e4-ba56-1400d16dfe21@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jQtA_fJMvuPw2duOWpgff5C8lpbxZ2sSxAGGavGHgxM_1738219218
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
X-TUID: UC3SnNcESBOL

On 29/01/2025 17.28, Cédric Le Goater wrote:
> On 1/29/25 08:58, Thomas Huth wrote:
>> On 29/01/2025 08.18, Cédric Le Goater wrote:
>>> The OpenBMC images currently used by QEMU to test the Aspeed machines
>>> are rather old. To prepare an update to the latest builds, we need to
>>> adjust the console patterns. Introduce a new routine to preserve the
>>> current tests.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>   tests/functional/aspeed.py | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
>>> index b52358bb8c61..51c821944842 100644
>>> --- a/tests/functional/aspeed.py
>>> +++ b/tests/functional/aspeed.py
>>> @@ -23,6 +23,24 @@ def do_test_arm_aspeed(self, machine, image):
>>>           self.wait_for_console_pattern("ftgmac100 1e660000.ethernet 
>>> eth0: irq ")
>>>           self.wait_for_console_pattern("systemd[1]: Set hostname to")
>>> +    def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
>>> +                                   cpu_id='0x0', soc='AST2500 rev A1'):
>>> +        hostname = machine.removesuffix('-bmc')
>>> +
>>> +        self.set_machine(machine)
>>> +        self.vm.set_console()
>>> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>>> +                         '-net', 'nic', '-snapshot')
>>
>> "-net nic" is the default anyway, so unless you also use "-nodefaults", I 
>> think you can simply drop that?
> 
> OK. Will do.
> 
> Do you want a resend for that ? Unless you prefer this series
> to go through you tree, I will amend before sending PR.

No, no need for a v2 just because of this. And yes, please take it through 
the aspeed tree!

  Thanks,
   Thomas

