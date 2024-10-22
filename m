Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2804181njb;
        Mon, 21 Oct 2024 21:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKZO/EKT6Nj5k8o4PVoc8zZ2SJ0KYSjeMybqjnS94s7plQAdiBcGsInWAVsGWkYnHuiHMoPeeOx3Hznw==@linaro.org
X-Google-Smtp-Source: AGHT+IGrWU6+eKoBhmu8TPreUUjD1qWiezyfdrOiOT0WCjGpCwxcDDxvQgJ2iqolh/1DSZ822i7U
X-Received: by 2002:a05:6214:4b10:b0:6ce:1011:60c1 with SMTP id 6a1803df08f44-6ce10116202mr75431106d6.35.1729570190354;
        Mon, 21 Oct 2024 21:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729570190; cv=none;
        d=google.com; s=arc-20240605;
        b=afK8S1vYIlIc034ByjXTb4qOogNj9NDuX//KjJEeAL7sYm0Nzv7LdCyYtDpGBlwAr7
         fPWz9c4ksnm4w4ZabH9/jOm0SyOjfgKTO80s6fPxCR7JzWAirk+Q8FKiDKBhkNwGYN7S
         u9DCIN15yRpV6aHjsk3L8mlX8pTBfuKzA/8snzw2k3eLsznD/3Nr45687mRXddlhZCGG
         vsM+ZRGHT8cldmDtYoPBxmCvbzFV+EMKdxwJqnwjy571SMc7g13OS8YwSlw8CZ38bz0E
         vINb8mEXzzNjJkX2UhfMdP2wK3ECxOvfU8cvSoWiF+5ZttKmyGNloNWv/XVGCg7HKNPe
         Ulrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=m1HTgPUZsl9tf2efGodSAznBBKC36Wd2x2ve7cTJrS0=;
        fh=ZXFrrLpcReci8BOTa6yOQOtOTLdh9CJT0zfbfqW142g=;
        b=TDQMXvSC07OTNIuyci6YJfJL71LsN3akYdm6+j4HXC2hDKqeSoHF0osEGQ/clHtfBE
         RBB8SoTg1kisFcyV1VCAOsvLRoR7Ylp3brJ1Q4dyNqzc1xK4jfkxd5LeCDH2hQso0DH1
         RyD4jUKiKZxEAbT8KfM+4cjKHJKcmMds3aSTxVoIHpeZupYKen2aTjkXq1w4PG7QmTg7
         9fMZXgdvtsBzV6rvY+KpI0SO4taghTfLV6HL/h+nBfGB17SEu6XAL030sUuuB8vB0wwB
         9GcS1lrXEP+TkraUZOScYu0xMHYHRYBXMxOUBXBnWpiSU04PTQUAwkl94Y7UbemXOzOr
         Gwcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FKtnyBO4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce0089e4eesi56352286d6.89.2024.10.21.21.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 21:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FKtnyBO4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t36Cy-0002L1-CD; Tue, 22 Oct 2024 00:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t36Cu-0002KG-5g
 for qemu-devel@nongnu.org; Tue, 22 Oct 2024 00:09:22 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t36Cs-00045V-Oo
 for qemu-devel@nongnu.org; Tue, 22 Oct 2024 00:09:19 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-71e5a62031aso3582052b3a.1
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2024 21:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729570157; x=1730174957; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m1HTgPUZsl9tf2efGodSAznBBKC36Wd2x2ve7cTJrS0=;
 b=FKtnyBO4/5X/CTWXo/mSAyNytwPnuHWfnEH9tYQ5s7DMBD8yULx17G7ZP5+1U5ablD
 W7jVW54Pe6xGtRDuRJCpVOHYgEtJszpAC0y7DIS65mqrnuGHdWlZzr5AyJ850Oon5g5O
 fZcgqaer63tOuFd2C1uWmTua0Z6MGET5+Ysu99hEPa2LcJN4+7aSZveVpl8dhd/3HTHJ
 Z8F+Ey9EK6tA+G2LtQnsSl48bgRAhTOy1NK2VPclkUJ8HJ7UZ8Ct/rQU7GHfE+cEPGnS
 /Jji1fLLZ4TOVLAMm0l5RQOWzqd4wgY5UPGwaRhWyLZ8V2JvzDcXO2/Cg6dcsWs+z9NI
 yaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729570157; x=1730174957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m1HTgPUZsl9tf2efGodSAznBBKC36Wd2x2ve7cTJrS0=;
 b=B3yhMRG9WbT/JCJ1VdGp96mMH9gUpqIinpMiuuabCC1Q+zh/KTTOTg8lCx6bqbIjpS
 tiwTRAJEVdBZnE36FFgCe6/zjvXig7eJm1T+x4hhjvM/FYmjJPChhWWcOSr+XoC3mGVf
 guuj9SJZC8b+8+qlgxhC+6lx76aQY+Ubq53y2oto+Ni6Rs4ZdrPojToxYUqr9/UHJWyB
 KX0dTF62eMMWKT8ih0kzNGrZzBvPAuTEX+thgccEySAB/qhePlowQ28l/h6NeNnA8Gk6
 SNoBA+LQqYbZLHeq1KAeVsk+j7u8QqGOgcH8C7syOAFMuPgIgzTy8Zyq1hJofO8LguWX
 fJiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7a3ixMVPhTUCU57KxgQ/MzSwMJwSsIH7ozGiq1O6/Q8R/efk4DnGFWNPbBN3hugqwPD25j3UzSlfF@nongnu.org
X-Gm-Message-State: AOJu0YxnJ07y1DyYOrguJorBja/lkjgsQB7qsTCOR4F5s+WbwXt7kORo
 pr3IgIqn82RHUtPGOggPZgnuGI/HoFKG+cyduJSYEIFF+igvz80Ka7hEl17jiR8=
X-Received: by 2002:a05:6a00:1390:b0:71e:148c:4611 with SMTP id
 d2e1a72fcca58-71ea3124252mr20382083b3a.6.1729570157212; 
 Mon, 21 Oct 2024 21:09:17 -0700 (PDT)
Received: from [192.168.100.49] ([45.176.88.171])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec13128cdsm3734026b3a.3.2024.10.21.21.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 21:09:16 -0700 (PDT)
Message-ID: <aa7755a2-e6fa-4d23-bcac-a630e6da98db@linaro.org>
Date: Tue, 22 Oct 2024 01:09:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm: Add collie and sx functional tests
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <dcf06645-dac0-4099-8946-38ca9deaeccf@redhat.com>
 <ec2cb5e8-77be-435e-8aa7-4314cf412c4d@redhat.com>
 <CAFEAcA8MY8DWABNuYuzH57k-nv3J4s0eMR=FuRt1TVd8P2GU2g@mail.gmail.com>
 <a65a224e-4f54-436d-b555-734a8926d941@roeck-us.net>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a65a224e-4f54-436d-b555-734a8926d941@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KySbizbnEo5w

Hi Guenter,

On 21/10/24 11:02, Guenter Roeck wrote:

> Unrelated to this, but I found that the sd emulation in 9.1 is also broken
> for loongarch and sifive_u, and partially for ast2600-evb (it has two
> controllers, with one of them no longer working). That is too much for me
> to track down quickly, so this is just a heads-up.

Please Cc me with reproducer or assign Gitlab issues to me,
I'll have a look.

Regards,

Phil.

