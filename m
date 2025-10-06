Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D7ACCA470
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 17:01:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5oYy-0001El-GE; Mon, 06 Oct 2025 12:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1v5oYt-0001CI-Ml
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 12:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1v5oYp-0000GI-8b
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 12:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759769974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6sjNx4pNptKayCfSwStMD5Umt0eM5azCeWjr8uZtIG0=;
 b=EDIW0R1e6XKLs6RiJvMRSISzN8yA6tD7cErXpxDD2zTagJPsOJHbUit2pl09pDRETEXAsG
 oGCrHr7v0rS8R5cwkij+QwMbJMTZ2g2wb+OoKRQo6dAoq04oixIluewf2EzqvTMNCCxJ/G
 nWM8fE9j7HsT2btuI2jWjkHbVsgKGWk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-Bs_3xqyWOhSxdpvRF5pXRQ-1; Mon, 06 Oct 2025 12:59:33 -0400
X-MC-Unique: Bs_3xqyWOhSxdpvRF5pXRQ-1
X-Mimecast-MFC-AGG-ID: Bs_3xqyWOhSxdpvRF5pXRQ_1759769972
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e4d34ff05so25440005e9.2
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 09:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759769972; x=1760374772;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6sjNx4pNptKayCfSwStMD5Umt0eM5azCeWjr8uZtIG0=;
 b=ry2jfayMVSZWwn7G6HXurGdR4ktcjoCdpjrg9Dh9HiQGvekhquNoOnDTPm7AbnMH5K
 3r/aa+1FmHZbT+I3Odb4LbbacrUBrI73BvHI1HztNZTpJm8ovCzHpZTQk2WqdCbrrBKS
 8jKi9Io1pv5GEo0n+jiewvk5KdwS90J4l32CwwZFzDt9z26c3Q2dAjszTzer0+HwztmB
 LMpxq4TzjUERn6DNubQa/Odmdt3X1q3mWe9fOFDKxykooK4HXp1UU4C+yHCyAuK7TC7j
 Iw1I4UGLyUGkvSpGbyopkXqM7uavcZsZUMlhbVcvnuE8M3uWKl5sf2y3ogiZtdyNIq7P
 NRxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCfwhPlm8/UQYKoZdduIM85Auq6sG5w/HAC7xJOuTFCEQ+HIJLYTZTGqqkIE2jqyWHYB78+Z1jHw==@nongnu.org
X-Gm-Message-State: AOJu0YwfLFn0Odt3G1f7uzVkkMQfdV8nJek9QtsKcb/d+hHTDCXdSE2i
 Qxtx+44vLsnXNk8ssoJVzvUVM72LCEXHIvrrvrseKMaYUFZCSM6X1iBvfHTv1PlUa4TE088hz5u
 rTdef4SO6ArCVHnKzyRNlGgiryCrKOnHpgsi31Q1WMnRH8fzhd0dWJw==
X-Gm-Gg: ASbGncsXJ1ETvzF9+p+0vrYqdEkhymrp8QN0dpLTudnwYqoOvSYU1rNeB7F/K/zzskc
 QVmk+2ClIFqm8LI+Ek0Wqe62G7+IhdhzvO1nrT3UHuHCcYlXT+FVrX7pDdUvKRePwpuajKLhv4e
 iyBalyWOQgICFo5WqlLGV4DwwmIKGC8MT5ygVkswtRFIrAGJGhAFNq6iYpvMxasXH85yNTXEfvb
 PppH/ZR6f7GWDcrLo64DbhNhPoQmKSQQQnCodrtaeZ6uSMVYinGk5SS44tIntFXXEWCDFZ6T86/
 Aac4NseY7hNV+DHXkB/CdL2c/KugEANRYZTKTVjwBkVrLDrIKwc6VzzZRkZAyWeuUWquKbOmR68
 YvwaLc56/
X-Received: by 2002:a05:6000:2001:b0:3f2:1cd:3d00 with SMTP id
 ffacd0b85a97d-42566deea21mr8377625f8f.0.1759769972208; 
 Mon, 06 Oct 2025 09:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdfX06qivu4mqcKtCgrxS7RiJ/zi2HiKIiCkxcvSGr7M0jESrHzV17+rEOjVVzlj114jSPJw==
X-Received: by 2002:a05:6000:2001:b0:3f2:1cd:3d00 with SMTP id
 ffacd0b85a97d-42566deea21mr8377612f8f.0.1759769971764; 
 Mon, 06 Oct 2025 09:59:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4bdcsm21723996f8f.54.2025.10.06.09.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 09:59:31 -0700 (PDT)
Message-ID: <48ba99b7-8a24-48f7-98a2-2d609b957fa1@redhat.com>
Date: Mon, 6 Oct 2025 18:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 12/23] tests/functional/aspeed: Add to test vbootrom for
 AST2700
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
References: <20250505090635.778785-1-clg@redhat.com>
 <20250505090635.778785-13-clg@redhat.com>
 <12c11d52-b1f6-490d-bc0e-94cf0dc3b66b@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <12c11d52-b1f6-490d-bc0e-94cf0dc3b66b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DktykUqea_JvqJDGkgEzILd5ppIuImkBxRKfvMZbqXk_1759769972
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/6/25 18:35, Thomas Huth wrote:
> On 05/05/2025 11.06, Cédric Le Goater wrote:
>> From: Jamin Lin <jamin_lin@aspeedtech.com>
>>
>> Add the AST2700 functional test to boot using the vbootrom image
>> instead of manually loading boot components with -device loader.
>> The boot ROM binary is now passed via the
>> -bios option, using the image located in pc-bios/ast27x0_bootrom.bin.
> ...
>> @@ -110,5 +127,14 @@ def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
>>           self.verify_openbmc_boot_and_login('ast2700-default')
>>           self.do_ast2700_i2c_test()
>> +    def test_aarch64_ast2700a1_evb_sdk_vbootrom_v09_06(self):
>> +        self.set_machine('ast2700a1-evb')
>> +
>> +        self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
>> +        self.start_ast2700_test_vbootrom('ast2700-default')
>> +        self.verify_vbootrom_firmware_flow()
>> +        self.verify_openbmc_boot_and_login('ast2700-default')
>> +        self.do_ast2700_i2c_test()
> 
>   Hi,
> 
> just a question / idea: The ast2700 test is now one of the longest running aarch64 tests ... 

yes. I should split the ast2600 test in two too to improve parallelism.

> would it maybe be ok to drop (or disable by default) the test_aarch64_ast2700a1_evb_sdk_v09_06 test now that the vbootrom test has been added? Or do we really get a lot of additional test coverage (that we don't get by the a0 test yet) by booting Linux twice on the a1 machine here?

We don't need to keep 'test_aarch64_ast2700a0_evb_sdk_v09_06', since
ast2700a0-evb is being deprecated.

May be we can reduce 'test_aarch64_ast2700a1_evb_sdk_vbootrom_v09_08'
to 'verify_vbootrom_firmware_flow()' and a check on the kernel being
started only.

Jamin, what do you think ?

Thanks,

C.




