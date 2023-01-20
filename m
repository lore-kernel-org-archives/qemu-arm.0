Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp887408ejc;
        Thu, 19 Jan 2023 23:08:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVz5UaU4uXaVFULJLpQUGFH31xWjT5SkqGktBLJjOCZFy+z7xBnyWMpvnOwx01od3zlagP
X-Received: by 2002:a05:6214:21a8:b0:4c7:b0f:675d with SMTP id t8-20020a05621421a800b004c70b0f675dmr26994103qvc.9.1674198515966;
        Thu, 19 Jan 2023 23:08:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674198515; cv=none;
        d=google.com; s=arc-20160816;
        b=TAqYO7C5PMoeL1CwTdAt64W/uUK2UmMwiw/DNqpBYi3N1IP6b1EeZTxrtnV4Mnt4Lz
         jCJHE1L9w2uQN/Yu6DQdcI8Dk2H3ZVshD1mbKmBLDw25V9yMEOfGNPZvnPm7DSG4hfl8
         y5cmXrQo08LhQD3KV3emJl4FQywtgqYFgFbjRg/mNWdMv4lKqTrpEigw9SXPtflGnTml
         iiNVsiiBjPt9IgDCb+shZO3soyoXuLoFRVobEAlOHr6wsVwdO7+VIA0WVbAevZdA0Xbb
         q2oNggzk7BAVxZWhjBRMxfB8dF9akv6FIzVsoYj0p4XjuCfobJ9psACFKuz05cWeglzt
         x+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bMJ3V9AYtYIV6jg/SO4fWzGiyyLDrfEOLIuwcZNQWec=;
        b=ITPI0TLJrz1EqTrXKyqss0ZoPMYgOshTHEmrRmEn9dgVOiX7NnOWtoJpPMbsM+8vNg
         IDjOnID2dPYYZu5gcgsPBaPe8JqISpDhd8V5UzgVzpJg7UySaDD2iE0yB7/wgtXpk/lS
         OC/kkeNL1jlntpRcysaQqghA622mYl9LcxL5Lrg9gt81f8XPdwA8VlHEGykSJ3lFpjLz
         Nu9rhmsvVyx3nxEus4lLiH79F5lGLw8q6H510ua8gUG7cMER6RemTMwXNo3aW4g+RdGQ
         Scjg+PinuT5Vw+ODNkCc3Wx/P5rxvxx4IrvYqhfJgNckbcS3RhOYXoCxpBGrvqtXS2MI
         OuKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QcJNOWMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn1-20020a056214130100b00531bd0ec2efsi24936969qvb.34.2023.01.19.23.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 23:08:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QcJNOWMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIlVe-0007hT-8h; Fri, 20 Jan 2023 02:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlUG-0006cv-Lk
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 02:07:00 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlTM-0006Ea-Cg
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 02:06:01 -0500
Received: by mail-wr1-x434.google.com with SMTP id b5so4030592wrn.0
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 23:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bMJ3V9AYtYIV6jg/SO4fWzGiyyLDrfEOLIuwcZNQWec=;
 b=QcJNOWMKqN8hdkOYKXMLV6i4SuWlU+QSEc9KDfp4C1GsbjJYVvEOJm9Biih6IbI7gn
 GzRo47r7Rvr8lYYwsJu8SqWmIqFqooCBp4LeQmi3LLKqNTFvO5gKRGCqSHXXWp7U5Sqk
 GZ2PvUOkWA3EGLFqRouePeVZVj07qGLD6oAVcpXPp5lx6BSYbko0D/cb/Hu6GBAk+Y16
 KVCDGp8Kc8eRRs+fh/Y0k2LfNCge+SAuhUSlbLlU+DFD4zUwMEvpjbOIVyZOixAwKiht
 k/Xim3nXnlEFYRalZ6SyA68nSsCIXS29mH19OPhC0jGbGh8FFoCI4ARatfwwUcnP2yXB
 6CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bMJ3V9AYtYIV6jg/SO4fWzGiyyLDrfEOLIuwcZNQWec=;
 b=RZON2DPeLqVC6LnYQtF60/0VTtnvQ1mTX4WheYEqpmKVyJTGTYPTwIajmjjOkj/HWa
 Esr8AnUi8O1JgRBw4msl2JxvJz1xR5VBhs4FMhx2YJYwZ/YVHDQyAvpZUNWppn8KPO86
 ajkKhp1YrK2n28zAYP3oCcab20278Um/T8vfqeUReq98Ph5MPByyZisaqmzC0Qaosjp9
 NA1tKJ570QTDG3q1jXwZlLQKndH1qZwwJw+dnR3bE8X+Z5ssu++z6fgdh+oI5fHtwoll
 u4Xww0RC75hF/JcT9Em+OK1lWuhyY+pViIPW0DnEsKX10282z/qP+0xvzMQXz1ZJYSL/
 ddmA==
X-Gm-Message-State: AFqh2koBsS4W5yd8TH+tM03enfS64FnJq39gorf0nOGOmzwFvtTN0lVH
 BWfIcOU62avHcXjvvcLaqIVrsg==
X-Received: by 2002:adf:e88f:0:b0:2bd:f388:841c with SMTP id
 d15-20020adfe88f000000b002bdf388841cmr12306688wrm.42.1674198357935; 
 Thu, 19 Jan 2023 23:05:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002bdc19f8e8asm23593549wru.79.2023.01.19.23.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 23:05:57 -0800 (PST)
Message-ID: <c5232976-2538-50f7-a6c8-8767fb62596d@linaro.org>
Date: Fri, 20 Jan 2023 08:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/11] tests/qtest/migration-test: Build command line
 using GString API (3/4)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-10-philmd@linaro.org>
 <45067c0e-5f83-2ad4-ffdd-e187dab052a5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <45067c0e-5f83-2ad4-ffdd-e187dab052a5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: IEJVUSZL2gaz

On 19/1/23 22:17, Richard Henderson wrote:
> On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
>> Part 3/4: Convert accelerator options.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/migration-test.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index 8377b3976a..015b774a9e 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -603,6 +603,9 @@ static int test_migrate_start(QTestState **from, 
>> QTestState **to,
>>       got_stop = false;
>>       cmd_common = g_string_new("");
>> +    g_string_append_printf(cmd_common, "-accel kvm%s ",
>> +                           args->use_dirty_ring ? 
>> ",dirty-ring-size=4096" : "");
>> +    g_string_append(cmd_common, "-accel tcg ");
> 
> Maybe clearer as
> 
>    if (args->use_dirty_ring) {
>        g_string_append(s, "-accel kvm,dirty-ring-size=4096 ");
>    } else {
>        g_string_append(s, "-accel kvm ");
>    }

Agreed, I first did that change, then went back to have simpler "one
big patch" in v1. Now since v2 splits the changes I'll do that.

