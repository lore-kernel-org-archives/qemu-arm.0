Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2251606njb;
        Mon, 21 Oct 2024 02:41:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqqCMTMmezR8Hpsz87RKY7lSJmN+cG4TXZcecofVk9BJantGlkyumWx9+JYcjpavcD2Q8PKc1vmCtyzA==@linaro.org
X-Google-Smtp-Source: AGHT+IGanw6mZm2SZjH3yaDXFpELRk/orPc6mknLnNp3xeFd5JTJ/21Z/tCyJ1O8LGXApyHdgUVP
X-Received: by 2002:a05:620a:2943:b0:7b1:36d3:3404 with SMTP id af79cd13be357-7b157b45460mr1554871285a.1.1729503676518;
        Mon, 21 Oct 2024 02:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729503676; cv=none;
        d=google.com; s=arc-20240605;
        b=fCNwTqnFDZPkTRLhXBOiu4UUMHfrBfg1l0TN0hfjMOsi9rWBJLSMb5e5punG4rP/t9
         RDmMJAH96uprp/EN7BNxctFn1JU3hQkjrh1E49kZobAXCBmJLvp15FR/u4jDA3wAZIo9
         IPKhOJQZ44yMOOrHOU/LHrMdDPBxRmyuuWgVsmi3jm36cZ010klpbJeXwbMhcHpPIxmb
         xWxtm21fCTOxAGTe0yyhnAOBqnV7/VXYM6AFFXSxsYtBYuh5Z+egiuID76eIunKDuSwJ
         P3NiQLZtKir3zxOYUdR3UdJrgOf5keEY+k5/y2Y4uL1N+LsNIgqfJYwpTGp4u8OHfGSy
         0O7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=uIUwD2vgey+5GYdZyfBIJjxez3378edwOrJpcad1FbM=;
        fh=QmkLNIluqJsJNNgGhqTGmpYlLMx4+YPZOGeqXlmv2kE=;
        b=VAviliDyPPo9tlWwNy2m0ypiIUZb4i2chD4WzRKrAi0BG74BSktGprlO+t+uOJfl8j
         +JhXn+hZ+d63Qq6yQPMM0rl3S8ihwxPAwI/Xk24OBVOtFCBfjzgOuajdANL5lkpNokXm
         hIlqwqYPrgQ1YsRGC5+NRlrXovu5NnnjGtOXjUt2VntnoIafxKULtGl5idNjCtnkazp3
         GmSv1NqRadZzC96YWkIenzIbajAf5dwRUNvhCesimKaPh8CdrXNmRbHvVHqQ2VNvczPk
         RPM93LzY/fddzsELQZDaw8Qf8Ru23SZObTHz0DKv2BjVabRCvA38sBJTwAZxqRVrRqAG
         3YAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Gv7P/x//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce00a03b08si36257146d6.514.2024.10.21.02.41.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 02:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Gv7P/x//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2ouL-0007Tx-FO; Mon, 21 Oct 2024 05:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2ouD-0007TK-TO
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 05:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2ouC-0003x5-1a
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 05:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729503650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uIUwD2vgey+5GYdZyfBIJjxez3378edwOrJpcad1FbM=;
 b=Gv7P/x//wvqQzHqwXi9nzk5Lb2fWNYW9SZGSP9oAknf0Dit77utDpC8a3z7R2oO8JIvsZn
 CKvGcIAvNIPtbONXV85UmW5m5GKRZisEnrg41eqPB7q5czEuRZO4V33/01kS35/AEBMowW
 rmqtG/qqYqiEvZFuNPqAos66buWBDx0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-BJor3x0rOW6MHnytoWPCDA-1; Mon, 21 Oct 2024 05:40:48 -0400
X-MC-Unique: BJor3x0rOW6MHnytoWPCDA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d4d51b4efso2073804f8f.3
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 02:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729503647; x=1730108447;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uIUwD2vgey+5GYdZyfBIJjxez3378edwOrJpcad1FbM=;
 b=VM5z932/1R2uZRyE2wn2+jTdVnkoXTKdTkrcUUl+AzmOR2t8uXFEGVSp1LFG2CfkWY
 JN4UmQ9In9biQ3/qP1WvM7D3q7Gb0XVMWgCL8Sc1EI8MSd0A+JPR6NaB97y7h/yVEYMM
 GqnrzarLTwrx+xOqge325lrNexnhJFHC3cZOHGc8SKo0z/EISzayt5un2pRPbGdMspKR
 X5tmy92DFvuwIs/6GuD59gl/nOWdXMEu01ZAZ2Rxlc0EYMJB8a/fnZ0AHoE78Gaq8MAM
 jHMU2N64mmPnk0G1ZZkrUcKHcTwp+8bYATU9KMWnUVxkAH7a6Ltck9rTWHl4Z2pBkXZC
 aEhQ==
X-Gm-Message-State: AOJu0YzzMUnIjuLhVx+KkRK7/sefRCIuhPYcv/QfidVwb1LfBDt23r6L
 aer+SLOrfrqo9Hss1YqBut86g+eJ8Xv54jxb1CyJBqu+TNjPtuce7RV/c0BV3t/XnUc/lN2Vu5T
 wLV0Fnv9MbXCJcHqvJC2IS4ngRg7xQwdsCdv5lUdRZm6iOVPMQ88uYFG2vunM
X-Received: by 2002:adf:ef50:0:b0:37d:54a0:d0a1 with SMTP id
 ffacd0b85a97d-37eb4897a21mr6832664f8f.56.1729503647557; 
 Mon, 21 Oct 2024 02:40:47 -0700 (PDT)
X-Received: by 2002:adf:ef50:0:b0:37d:54a0:d0a1 with SMTP id
 ffacd0b85a97d-37eb4897a21mr6832650f8f.56.1729503647167; 
 Mon, 21 Oct 2024 02:40:47 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-50-24.web.vodafone.de. [109.42.50.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9bc9csm3833373f8f.108.2024.10.21.02.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:40:46 -0700 (PDT)
Message-ID: <d3d9a95c-6c60-48b5-89cb-bb3642a742dd@redhat.com>
Date: Mon, 21 Oct 2024 11:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm: Add collie and sx functional tests
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <dcf06645-dac0-4099-8946-38ca9deaeccf@redhat.com>
 <ec2cb5e8-77be-435e-8aa7-4314cf412c4d@redhat.com>
 <CAFEAcA8MY8DWABNuYuzH57k-nv3J4s0eMR=FuRt1TVd8P2GU2g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA8MY8DWABNuYuzH57k-nv3J4s0eMR=FuRt1TVd8P2GU2g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.527,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: c6CiHXYC0xRu

On 21/10/2024 11.17, Peter Maydell wrote:
> On Mon, 21 Oct 2024 at 09:01, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 21/10/2024 09.15, Thomas Huth wrote:
>>> On 17/10/2024 18.32, Peter Maydell wrote:
>>>> This patchset adds new functional tests for the collie and sx1
>>>> boards, which are the only remaining ones that survived the
>>>> culling of the OMAP/PXA2xx/strongarm machines.
>>>>
>>>> For these tests I'm indebted to Guenter Roeck, who has kindly
>>>> built and made available the kernel images, rootfs, etc and
>>>> documented the commands needed to boot them. All I've done
>>>> here is wrap those up into test cases in our testcase
>>>> framework by cribbing from some of our existing test code.
>>>>
>>>> Based-on: 20241017162755.710698-1-peter.maydell@linaro.org
>>>> ("hw/sd/omap_mmc: Don't use sd_cmd_type_t")
>>>>    -- the sd card test for the sx1 board will not pass without
>>>>       that bugfix
>>>>
>>>> thanks
>>>> -- PMM
>>>>
>>>> Peter Maydell (2):
>>>>     tests/functional: Add a functional test for the collie board
>>>>     tests/functional: Add a functional test for the sx1 board
>>>>
>>>>    MAINTAINERS                         |  1 +
>>>>    tests/functional/meson.build        |  3 ++
>>>>    tests/functional/test_arm_collie.py | 31 +++++++++++++
>>>>    tests/functional/test_arm_sx1.py    | 72 +++++++++++++++++++++++++++++
>>>>    4 files changed, 107 insertions(+)
>>>>    create mode 100755 tests/functional/test_arm_collie.py
>>>>    create mode 100755 tests/functional/test_arm_sx1.py
>>>
>>> Thanks, I'll queue the patches [...]
>>
>> Unfortunately, the test_arm_sx1.SX1Test.test_arm_sx1_sd test is not working
>> for me, it seems to fail the shutdown of the QEMU binary:
> 
> The interesting information will be in the guest console
> log, which seems to not be in this log. But the first
> question is "did you include the omap_mmc fix that the
> cover letter and patch description says is a prerequisite"? :-)

Of course I did not. It's Monday morning, apparently I'm still too tired to 
read properly ;-) - sorry for that!

/me goes to the kitchen to grab another coffee

Ok, I'll just ignore the patches for my upcoming "test/functional" pull 
request, maybe best if you simply merge them via your arm tree instead.

  Thomas

