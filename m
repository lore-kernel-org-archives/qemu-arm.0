Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1713351ejb;
        Tue, 14 Feb 2023 14:56:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9AvjYvy5tjFrvyeqA0yMk02UP6vuqIRqzD2caTODFJT/nsigYpzGHHIjGGbRd7Dn4M54Oe
X-Received: by 2002:ac8:7d02:0:b0:3b9:9625:df55 with SMTP id g2-20020ac87d02000000b003b99625df55mr36826qtb.12.1676415406340;
        Tue, 14 Feb 2023 14:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676415406; cv=none;
        d=google.com; s=arc-20160816;
        b=OdFjZkW5Tjpmsf77pXab1cQ53Oqyua31HGLJs3oSrgbdr6qkMaPpyptCCdCXgiwZ88
         IQog57shMDFUDPxQb/ZmaWI6CZwFeKGmRmjPgfU23yQNwL4v3G+8wMBetYz1+47SCf1v
         WqNEgPr5+DjaD1Q4AD6/XnkSukB1Kban+V0TkKQObu8lv863tdGcHjCGF9LgRVm67Yni
         GUZRoFSWJjMlVFx0YBX98Dq2JigJGRMfXbgJEZJmKJv4XgMz4lYR0Nl979oB2fQcgQGv
         lTsySHiiJyBG15ySDpGtnfODVp0L0ll2dekMbLxrWaqbvOMlIyJ8qtrjtOCGXN8ayYGo
         Ve8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vwLeE02LVEPpg2m8nKgzFw4Fk31sfmNOFStJijCQ4Jc=;
        b=wDXgCcDKEp22mANh7CPbnjdFKyWdiNUSBwuBeeAj9w9KZ5M8Io5j10XiyqY4tMlwmR
         ER/NQnruliaqdp0VnCDLDZXcnUeFDxNEbvbSpmHaBRFa7c6AK77PmYJ6/M7WoscJadAm
         lM+FVsuRTNddzKWPWhS8skbYfy2hFEZGJDTbMDPBRr0miaF29N2nEJyUywZqGDG9SZLB
         LKciTRFeHYRUzqHPUhR7IGLsFhu2CKTN6cgJeJ1XxCT98uWdC3jtBJM1b/UqrKiV+WZw
         OOgL2qZgPh26Pu/ORwYpZrkAiKC//DFtvAWf6jkrVAVo3AP5F3AYKIcK0tWsHvxFqMAf
         34Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H42tsn0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020a370512000000b0072ab59755b1si12939818qkf.25.2023.02.14.14.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 14:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H42tsn0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pS4Dz-0001OF-Bj; Tue, 14 Feb 2023 17:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS4Dr-0001NP-Ba
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 17:56:28 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS4Dp-0000yh-Pk
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 17:56:27 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e12so1030894plh.6
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 14:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vwLeE02LVEPpg2m8nKgzFw4Fk31sfmNOFStJijCQ4Jc=;
 b=H42tsn0IyBuLgG9pkXYYhfIerX25HiH1gGqJ5TRW02CNer6fdrNPpZA1MvVe4jt5GO
 JrHP5K3vizxGVhv6Kz45eIOGTY6zBby5M0mSAc8s5Uhfc+7dSKSFdKy/uP5Tj1xlaYds
 zhSMO9u60NTBkxpEKc+j1H1Q378c3WM9if18oV+5JRzQuPvmEvQvRvX6nr8k1j83c89d
 QsCOsJrDM7+BrnupIoN8ViIuwWixBf6nnekGy15ShI8Urqidjn8SiDENbobT+7B5z6A3
 lnvSsvbzG1b3p3pAYWQDoWLXWKQMwaTo4LIyLpVkgvCCGoJnw/z2gOg6GRDqw7aiZwiZ
 s2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vwLeE02LVEPpg2m8nKgzFw4Fk31sfmNOFStJijCQ4Jc=;
 b=JdURcMrA/aewT7GgIbdQWqSfUKqCVC4yuk6WKIG7QKVca8JvK3uc8UIn4GV8m1NY/g
 u6i9YndGqyGMl1Jfrg4w+rt9IrcfGq/EU+o5IKNilZy0LOQtDCfWIC2xX9HuTdGdiQmi
 mCUnq3fBD3mHnDEXAfDwlGAxlra4NZ9VNh56V2UzpukrPbD7LrUHF4MHhy5TSfNeXEOc
 ahs4j/vJfFEqWRjPAL4n426zVOemoR4c/bLb+qcHWOb3OZQC50jpEHreJdQCQ6bsEzab
 7X8R+oG1MwHElXHXW1nAWVxwXOjQ9Exx135cFV4KL4Zh/IVLv16Pgecd0xPf5lR+H/ni
 OyQQ==
X-Gm-Message-State: AO0yUKXEGztW0DHuCPXGV6TtaD3+uEvnWRrKZiQVPP043X73Ad0mr/XF
 ioTGKQ8/cIeFMLxSbsPKb358yA==
X-Received: by 2002:a17:903:110e:b0:199:2051:3c82 with SMTP id
 n14-20020a170903110e00b0019920513c82mr434057plh.11.1676415383251; 
 Tue, 14 Feb 2023 14:56:23 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 l3-20020a170903120300b00186c3afb49esm10687226plh.209.2023.02.14.14.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 14:56:22 -0800 (PST)
Message-ID: <4b6eefe8-0450-8323-15a7-74958765052b@linaro.org>
Date: Tue, 14 Feb 2023 12:56:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-6-richard.henderson@linaro.org>
 <875yc4kp92.fsf@suse.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <875yc4kp92.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-TUID: 0P6nWxdXmi8+

On 2/14/23 09:42, Fabiano Rosas wrote:
>> @@ -310,8 +313,8 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>       g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
>>                              " regnum=\"%d\" group=\"float\""
>>                              " type=\"int\"/>", base_reg++);
>> -    info->num += 2;
>>   
>> +    /* Define the predicate registers. */
>>       for (i = 0; i < 16; i++) {
> 
> There's a info->num++; at the end of this loop.

Good catch, thanks.


r~
