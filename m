Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2586557ejb;
        Wed, 24 May 2023 07:19:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MJUl+XbgAqapPBZzMYWTu+DxASwrIw2Q7wKCKwiybdggggFRvod+vSR7iRJ5JTh9rrhUk
X-Received: by 2002:a37:301:0:b0:75b:23a0:d9da with SMTP id 1-20020a370301000000b0075b23a0d9damr6573941qkd.48.1684937960231;
        Wed, 24 May 2023 07:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684937960; cv=none;
        d=google.com; s=arc-20160816;
        b=m8XQvdSowNZTg0jQiJbOL5jd+6XxbIkDljFhUBjN1uqaKrJ4vIYGinpshlKHaV94Ib
         6BCARR4yxRxqyEZliQUjRk5vJkBW1QbhcymR76PBoZoD/PMs8SO0W0BWR+4c37MOGCEA
         4BRr3KMMH1UTTsN6zgjQv31ODycwh+xMdb7KzIYglR7mVdd7XHm4QkC7RlHY1xQ2usBe
         xEvQPxl6QQD/SQ81bTtqXQZk3F61dq4qo4Zb+CvrH1dhzk3F6HILHiU1pFJMe4dqFYTN
         VpQkEdSefytVBQgWl98NcWjjvu6axdNp3K1Jb0kdukMwAn825t0D8NcjArRSJu+qNV2T
         MylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oRL4br8rQ4fNGs5xVXBCwyQFdbEwpLBE3Moduh9YvJw=;
        b=uqSw2XEzV29AZc2DuRaG8NE3cJj7bL8HBFIidz6GGXV6PFDweDorg15ARWYyShPhs7
         EPlqKUncXECymPfjWjE8MXb2jiUdACLj+hXDZXNfUQAND8I2IqUZYXSGbs655zApRCzu
         c1C1w7lPiLV9zcUu9tNIRXwn/UW/dd12B19wcESQ6KdamFjZy4FfglD9pmBb0UO4FABq
         3NXHgSsSA+l9IfSn8MarWPe1R22/0A7JIMd+RX7REQ2axd+0/434jjYy4JNtY4aF762q
         DiOwTK9MdZjlavPtHACEc66WlVBd7Fag0M0Nx+tpK25m+gme8EVCjL1cOC6fIrlvNsOJ
         rAZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QRhpKuyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28-20020a05620a12bc00b0075b02c6d05esi5514671qki.383.2023.05.24.07.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 07:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QRhpKuyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pKG-0000rR-7D; Wed, 24 May 2023 10:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1pKA-0000qw-SF
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:18:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1pJy-0003H5-1G
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684937912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRL4br8rQ4fNGs5xVXBCwyQFdbEwpLBE3Moduh9YvJw=;
 b=QRhpKuyGGWs4cnNxiX5zTmq53pdpP0k/1rUHZnYBtTSSyvuJk40GHlyMyi5BEYKDznwHKI
 8W2WawH39GwttOPPTNp8XnBNggL6HIgPMv7LgU0Y0NvERgXh7KcjKR7DeihdMnqGRjsHwz
 K18EI6f7pPgm2nonMzby2kBQf4i1K/g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-5oNLeEKuOmGuwEZl7Q7vPg-1; Wed, 24 May 2023 10:18:30 -0400
X-MC-Unique: 5oNLeEKuOmGuwEZl7Q7vPg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-624b4176bf7so6492636d6.1
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684937910; x=1687529910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oRL4br8rQ4fNGs5xVXBCwyQFdbEwpLBE3Moduh9YvJw=;
 b=HukdeQXWz+qcjedwq9E7sfIWpmpKU5AdndWKe8s1zcdniCkaXtifQVFfS4xfRYqmRI
 Aj8hKxspNQH3NRsmKrIYLLLQMa1rzUz5B+zGR2CP52yS7bHNUZ7bo8wKDHKkQdH5YwvA
 P2jk7UzCELL/qi64QDWd50w+VVNAOHfMek7XconHoN+hawcuViJ+4Lh7/M1zviLBfZHy
 4+kmUqIBXwqcmb3GneDK3il4dICUBLPhlPAVP7E8rJ84aPeeZzpKRg0DyggUG/I80Eem
 fzZsiAsGP7qsBS12Xswl8rQKrtgA3l7JrhM7xNbMbEFVT4SYQaebux7mBsldxYvMvYKA
 0TmA==
X-Gm-Message-State: AC+VfDzRra924rVXgXSiXqyiBvh0jyOyCWybM2vwAcFZG8USB83V732W
 IO9Vl3dx6kb17tiTuENl8LsqsWL3r9juRU7pjQ05A6eoUsYOfZcyA+w8dicciF2yKX2A+7lSDTz
 6v/rVS7AQZ4dI
X-Received: by 2002:a05:6214:528a:b0:56e:bfda:a14f with SMTP id
 kj10-20020a056214528a00b0056ebfdaa14fmr25221768qvb.9.1684937910387; 
 Wed, 24 May 2023 07:18:30 -0700 (PDT)
X-Received: by 2002:a05:6214:528a:b0:56e:bfda:a14f with SMTP id
 kj10-20020a056214528a00b0056ebfdaa14fmr25221747qvb.9.1684937910152; 
 Wed, 24 May 2023 07:18:30 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 u11-20020a0cf88b000000b0061b7bbb7624sm3601142qvn.130.2023.05.24.07.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 07:18:29 -0700 (PDT)
Message-ID: <8833f725-9834-b131-5d79-13592969257a@redhat.com>
Date: Wed, 24 May 2023 16:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] tests/qtest: Run arm-specific tests only if the required
 machine is available
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
References: <20230524080600.1618137-1-thuth@redhat.com>
 <1d3d36da-3b7a-ebbe-6339-0c707b329e45@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1d3d36da-3b7a-ebbe-6339-0c707b329e45@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4HQzyEwp2p+6

On 24/05/2023 16.01, Philippe Mathieu-Daudé wrote:
> On 24/5/23 10:06, Thomas Huth wrote:
>> pflash-cfi02-test.c always uses the "musicpal" machine for testing,
>> test-arm-mptimer.c always uses the "vexpress-a9" machine, and
>> microbit-test.c requires the "microbit" machine, so we should only
>> run these tests if the machines have been enabled in the configuration.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/qtest/meson.build | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 4c5585ac0f..087f2dc9d7 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -198,14 +198,15 @@ qtests_arm = \
>>     (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? 
>> ['cmsdk-apb-dualtimer-test'] : []) + \
>>     (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? 
>> ['cmsdk-apb-timer-test'] : []) + \
>>     (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? 
>> ['cmsdk-apb-watchdog-test'] : []) + \
>> -  (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? 
>> ['pflash-cfi02-test'] : []) +         \
>> +  (config_all_devices.has_key('CONFIG_PFLASH_CFI02') and
>> +   config_all_devices.has_key('CONFIG_MUSICPAL') ? ['pflash-cfi02-test'] 
>> : []) + \
>>     (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) 
>> + \
>>     (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>>     (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? 
>> ['hexloader-test'] : []) + \
>>     (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? 
>> ['tpm-tis-i2c-test'] : []) + \
>> +  (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : 
>> []) + \
> 
> Also ARM_MPTIMER?

Not needed: config VEXPRESS selects ARM_MPTIMER, so there is no way that 
VEXPRESS could be set, but ARM_MPTIMER is not selected.

  Thomas


