Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1266472lfg;
        Mon, 25 Jul 2022 21:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u24wN1iFXsBCJ6K13Izm9W8UJa4pg59vKReN5rlZtzywsPoipJbUye7H20uB9ro6iFuin8
X-Received: by 2002:a05:620a:408a:b0:6b6:14ec:b6b7 with SMTP id f10-20020a05620a408a00b006b614ecb6b7mr11453131qko.353.1658810483110;
        Mon, 25 Jul 2022 21:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658810483; cv=none;
        d=google.com; s=arc-20160816;
        b=BitgJMQz74VXDO7t9obucd4IdHJmI090jbXJE8zwumuVSTrXcgEkcrqJliAQFLOOUK
         zlwbI37gra/aNr314eOEL13IPbQEyx8ZtTIb+KAeI7yAvEy8VBQhZlC/Bd0NWK5IHE5U
         ksbSmKFlIYkCb+t/lIVtJd3swOFPmtVoloBPDmavhgW20m4dwx3UmxfhRWiB6IIIxAJ7
         I2bVCtgGLNiPjzXrvZbRvK3LUikTFe8XjsBrSqYSR84BNCj8XHrfZro4Y6p4RMeQfA9p
         weOT0T6yglW2FGWKavx1f7U+Z8+mzaJSEv21cqGujZVGtRvkeYX+DIXucH5WR9NWF5gA
         tK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OsbmZy1iQp03ox7tQRMghj+VEKCMy7YUpaAQ5jYopM8=;
        b=rCRN2Xgo72cirbo+mwoteAV2ucQRuKUr3MvHggXRXb+4Opsq6eiH0VY3s3yt0nLv1M
         Fey7qwBq72QjJmrNJfV9UHkPTK19ESrV9U55QAjLRrj71j30WIOcA2JIeKcUaRKedvv7
         4ibHvp9UBa6YRFvJahoXfXyBtTg8zWWu26jBLhc8uaEcP+R0Qktq3jDY5aaBOu4zuuP7
         19vYo6c0uf85AtaMwDqZ8NGq9KAU6cfGqZ0laMM5mQz1LOL2oInINRFc8Ik3jKiyoUYP
         7cYl5Esc7MYL1dkM3lWfEP2qdDyAmhpjzwA+MBDCqgbr85hqj7soTClQ67v0t/8gq8Li
         mFww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jr7RQI1H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21-20020ae9ec15000000b006b5b613d406si7992227qkg.282.2022.07.25.21.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 21:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jr7RQI1H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGCNm-0000uv-HM
	for alex.bennee@linaro.org; Tue, 26 Jul 2022 00:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCNS-0000sh-Gw
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 00:41:05 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCNL-0000AO-9H
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 00:40:56 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y24so12266443plh.7
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OsbmZy1iQp03ox7tQRMghj+VEKCMy7YUpaAQ5jYopM8=;
 b=Jr7RQI1HFkWNzeb060gijixXCOYftEFuTaz48A2OYQ8bQzXj6QC9NWCviNZqTV2qPs
 qOmvq0UJvi2SvSW8pXhwmFWNoXM53FGhB8/ULEdMYJmWAeAuo5lEFqamidluQMaBSufZ
 jvt9B0lVRUqK8ZPXZ6nMQp4tkcdP2oIQxsflz95qUYRTH8K1SpjM15Hn4zVCJkDYZJ+c
 sBFjJVJSQT4yMCg5h5z8nvNgm1fExBNTbhm5elp0WuuWlGoraP6aiQ8wEIkgfP7S8NRJ
 3R24wSa5BcQy1dxc9ZE5YRMbghuqUvdbPV9XQXqfkQUj64j+ltMKVOdORd5UybKVDTMV
 s2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OsbmZy1iQp03ox7tQRMghj+VEKCMy7YUpaAQ5jYopM8=;
 b=bPraRKAB9b0gv9yEwpiDx10xs3Oj6YL/KzgFCi5nZTkpASaQddRMNAn+8B0rnjF06D
 HeNJ3GD/6k+AvoWGuVtyFqevb78iKhGBStrlHvir04pHTO6Z7elY7fYmk+f1oQg+7pGC
 pvoXpStui527n9PtZvtoU6DQwgxP5TTNIOdJeHyUpInAMIO6RkJajH9GMIB/FS+7e/YC
 oQWtRA6aG+Os5Olae06Z2E0ifntRBSX+VBJrMokCF2jBao9xv4WKKsbrIXjauCR+J0uF
 uFj0VPG2PNJxlZMTgjjRoYmwWhD33kCaZhfG/bBK8TkRR7jyVgUft66AmFH8Vol1DC3e
 2Yxw==
X-Gm-Message-State: AJIora/t/Lv6O1Pv+q7gWW1Y8/eg/XUOI6jHhJ6yjZyuDlYNcGp0FFjO
 EHzgZ9HyAIFZ7X+As6l9IVBltA==
X-Received: by 2002:a17:903:31c9:b0:16c:3024:69c4 with SMTP id
 v9-20020a17090331c900b0016c302469c4mr15342359ple.81.1658810453146; 
 Mon, 25 Jul 2022 21:40:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:673b:b40:a955:bc1b?
 ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a1709026bc700b0016be834d54asm10067069plt.306.2022.07.25.21.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:40:52 -0700 (PDT)
Message-ID: <4d385c58-2c8f-6f40-7953-50424f766b9d@linaro.org>
Date: Mon, 25 Jul 2022 21:40:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] target/arm: Create kvm_arm_svm_supported
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220725181457.41083-1-richard.henderson@linaro.org>
 <20220725181457.41083-2-richard.henderson@linaro.org>
 <8d493056-fc22-cc0a-29ab-15a810ff1c30@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8d493056-fc22-cc0a-29ab-15a810ff1c30@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2OP2XoeHpvvm

On 7/25/22 19:02, Zenghui Yu wrote:
> Hi Richard,
> 
> On 2022/7/26 2:14, Richard Henderson wrote:
>> Indication for support for SVE will not depend on whether we
>> perform the query on the main kvm_state or the temp vcpu.
>> Mirror kvm_arm_pauth_supported.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/kvm64.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index d16d4ea250..36ff20c9e3 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -496,6 +496,11 @@ static bool kvm_arm_pauth_supported(void)
>>              kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
>>  }
>>
>> +static bool kvm_arm_svm_supported(void)
>> +{
>> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
>> +}
>> +
> 
> Not sure if it's a typo. Maybe we should instead use
> kvm_arm_sve_supported() which was introduced in commit 14e99e0fbbc6.

Oof, it certainly is.

r~
