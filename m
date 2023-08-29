Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3928253ejc;
        Tue, 29 Aug 2023 14:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG43cjBDbCjzMmMSPa5sXNOLbkj3O1w3G5v5CqGZPJnryhJkupj1ZSygG51gVdxUTHR23S2
X-Received: by 2002:ac8:57c2:0:b0:412:1c47:773b with SMTP id w2-20020ac857c2000000b004121c47773bmr180910qta.63.1693343377367;
        Tue, 29 Aug 2023 14:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693343377; cv=none;
        d=google.com; s=arc-20160816;
        b=JjLcO/GLF0pYxxE5TasFgAdiiLxBAWM7/Mzhqmn6FG4udnInDILMKV9AuGNU9bOHV8
         wuux7JV3TFPOxZP/uJPnF2xIAtyo/SypzFW4eC3ONEu7dPZz8KxHgSBTX3AMwUHZraYK
         7hRJEnQkCIaeMWL9j8zyIs/gpIMoHgfOd36eCGZLLSFl0gS+nBpQC0tdIGFSMjVGgsQ1
         ltdIeU88QlkSjeH5Jv2qSqmfUwrm662EX9aLpu555ABciGAmY6OFPmeQKZ7meSo171yu
         XD4HfL2XRjYIVfVB4+hdlzH+MUufzwF52dfNoEDXNgZmbn8DW4+kZ1j674IIlAQAjrQP
         bKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gqNE4/JQUpb7CobD9wA6872guc9yXl/a0O63kdH0V80=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=cwHDAolqNaUrXaA9QTptTNOlRT6WJgGhLGigmTdHzDUH8YoC7LEWJZLoPQYT8eQ/J5
         AXgbY7HKC60d19EKc/0RDBUtpXw/CD1PJyQh6wESEh1vQIOfAO/SnRZNr/zXZCDD9ok2
         UffWtbKQBziXZwPa14QAiqIW4MBJs3jyuxDt3r2H8uFyDtufyAcPoTrvDYrz9hXxN02J
         p1xCYtiHk9VY/x1B6OF8D2rbf5ZR2u/Mmys7IcNuRpNDfcc2qy+HO8eoxFENbPbGQ4bF
         TnLwLsE37mGAMmcg+82Pa0Z5Rql/8lIOs1vxyvKJYdZkca0UXdWjya0DXBt3Rpp6gnEI
         uG5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VKHdfBay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a05622a004900b00410a9f8c7e5si6335614qtw.110.2023.08.29.14.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 14:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VKHdfBay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb5xi-0006gc-LC; Tue, 29 Aug 2023 17:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb5tV-0005ib-WE
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 17:05:03 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb5tS-00027p-FG
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 17:05:01 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so2836363a12.1
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 14:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693343097; x=1693947897; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gqNE4/JQUpb7CobD9wA6872guc9yXl/a0O63kdH0V80=;
 b=VKHdfBay8YIuosgtSeE8VPVl9icjFAUy6lm7ln+YoG7a7YoUBEmWxT9QwhFRDUgy9Y
 lHx0mtbkY1VJlIoyFeg6ug6Wu/hnHane3tgoU5bdyml6iyk86WHnFvIrmOZ6VG28Udx2
 iBJH7jeA81TJbkFE8YvbfB4BTYFRLM4xuEFjuMoy9tMiU8tlVD/teMzJrMxCPmwWM0z/
 WYTI6dz/7UOnqxNIvL//hwvQnKB0amsDGd5wU/yvGtZT4q+AclK4Avb/GSP8c/g3499U
 1rTqlWKYBTKNN7O2jQxE5Aa1eGsf/WnM+gUQiQ19qI9ZMJ87XNJW0gODbcIT1Q+Cppwy
 Ym7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693343097; x=1693947897;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gqNE4/JQUpb7CobD9wA6872guc9yXl/a0O63kdH0V80=;
 b=FZEVwu9dAYddM+hMRyjlyPm0q41BcPhYKE9m3sjvOLR5RWN1OjwYnhsD7zRJsMMvQh
 CMVz+czLR1mE5Ssq78Vem6eUtBhSSAEiCvKP06B354fbzwLnq3TcaTCaMrYPDjemLwqc
 Qjl0H/nOemtILo3IbhzcUPDOtLzQ8SNFwK//uRYetJDNwBGC+EGf5KyQzA9R/IyP9W8R
 a1Mud7hRgwXtTFrMClwiMQMhihkk9CXYBLuV7WoHAgB/5O3Eto+hfPwIzrnQSfcVi3TC
 BlMVC7dp7TUZtOKdg0AkrluNV+xtJK5CKpeymWz+zQCxUbAUe59Lgj+P3fhgbGmWEuZR
 uSzQ==
X-Gm-Message-State: AOJu0YyS+M02IX9VIEpgYeo5GIQHfaQCpbbr9AvlSnSwqVg1lk5Iz5uI
 1kn27Quvawal3yXMeJ5sjSNrAw==
X-Received: by 2002:a17:90b:1b46:b0:25c:8b5e:814 with SMTP id
 nv6-20020a17090b1b4600b0025c8b5e0814mr349418pjb.44.1693343096891; 
 Tue, 29 Aug 2023 14:04:56 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090ad48200b0026d533216e5sm13277pju.46.2023.08.29.14.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 14:04:56 -0700 (PDT)
Message-ID: <d82f93cc-db75-0956-805d-02aa813e4445@linaro.org>
Date: Tue, 29 Aug 2023 14:04:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] linux-user/aarch64: Add ESR signal frame for PACFAIL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230822170209.1130173-1-richard.henderson@linaro.org>
 <20230822170209.1130173-4-richard.henderson@linaro.org>
 <CAFEAcA_5C8D+B1ad9RftcckknzS-WMC0o=t-zQKpzC7_9gfJ9g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_5C8D+B1ad9RftcckknzS-WMC0o=t-zQKpzC7_9gfJ9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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
X-TUID: 7wlcmZQhJwyk

On 8/29/23 07:46, Peter Maydell wrote:
>> +    /* See arch/arm64/kernel/traps.c, do_el0_fpac, and our cpu_loop(). */
>> +    if (sig == TARGET_SIGILL && code == TARGET_ILL_ILLOPN) {
>> +        return true;
>> +    }
> 
> This works, but we'll need to do something else if the kernel adds
> some other fault later that is reported as ILLOPN but without
> an ESR record...

Yes.  I'm not happy about the separation in logic, but I can't think of a better way at 
present.


r~

