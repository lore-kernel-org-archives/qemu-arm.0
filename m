Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp225115njm;
        Fri, 28 Jun 2024 09:37:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGMmcMWGmIxuiSYVggtYsXBmbnLNbQxkpN1X/At3hgWPXj11cTAkYW4baF48f/rS6DlmTTUTtAduT7QKcflVzilbv1uXDA
X-Google-Smtp-Source: AGHT+IF7bvOpTUNOAH8QkxsYyrG/oRkIcahV01fcwUOX1673ze4Tcf2j2PFofuRbSMw4ywQw7GWW
X-Received: by 2002:a05:622a:487:b0:446:34e5:a636 with SMTP id d75a77b69052e-44634e5a6eemr87263251cf.6.1719592675695;
        Fri, 28 Jun 2024 09:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719592675; cv=none;
        d=google.com; s=arc-20160816;
        b=jyOws1J6gdN/6S95eeABgEbFODx45MNLwia5HY4tKkN6F8snRGZIqvRYepaSLh/SBV
         kjrOmF+FxWdIKyViKOfPlpU0+4uZIPY3/1M/iPcxgqwfKBoqENeqAkV/y3Kao2/gPX14
         BdfEKa6E4ilZfLrASKLt9f94z7GA93n0AjZvGGRWJPv+yGXWl9cA6vPEfAVpJU/0GPqS
         uL/dBEuAkx2I/vsfvG345ZsIXdZa8DkmijyhX5kOWGSshclk0p75bNs4tSnDa7P0ec8k
         mkYbsP6W0EcnlhprOJbtsD2eqFnkWzh6hXs5ytr0PMMQofj7a5bJB59IE1A3W4zBAsiG
         NFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xpw5m5WnfpE8whE4dgDf3nv6xN6hBRVBgVHir/fOwr0=;
        fh=Z0lv3RGghKRXx8c86hr83lU521yHl3kybFi4245w21g=;
        b=fvvfpf5m+zlrc+zEDAhM+NDzMThGo0/JcogE3bfYD+YFo+aB+S/iE2rfB3v0bMCfyR
         fHHfcurDD3Ixf+lH0kLUd+CjT60oFu3miXboLxUwaOhicS+2zsWRYOmzXi/det01aj+y
         8hrs67H7HHg7YiWBzpqb3hHYG85ikMwL1vMucbraM4gb16wVMtJyk3AxUhUWRHd7inpu
         49nZLaOsU/iYkGOP8tnZqL6sXYlBWQgBLbMjOqEMbIrPeSBwv2Of17dfJh2OfCvVicc5
         I91gLqj8fOXanT6KsPR1YQzcW+N3ajboADQ0841vfKXOT34O7bW5sXqmcISQPPFuPZFq
         R6Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suRZibdD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446512ccb36si22907021cf.42.2024.06.28.09.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 09:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suRZibdD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNEbR-0004qV-19; Fri, 28 Jun 2024 12:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sNEbL-0004pk-Nj
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:37:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sNEbJ-0007Fk-VC
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:37:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4256788e13bso6187025e9.2
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 09:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719592648; x=1720197448; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xpw5m5WnfpE8whE4dgDf3nv6xN6hBRVBgVHir/fOwr0=;
 b=suRZibdDp7HQk+WccLxZv9ABhZZANgbssC+yCdckF51XMALv8tx5ccWo1yEsFNpvhR
 PhH+y+PHoy31OVeehezi6X1Vy1MgTTagAbW0YejaeK2wcK8B4lDmJah+yq6ha1gRgA7h
 oZOQKzpoDngwvJNkNLmsJupd1vfaylHW+0Jx70uyVBxj3iyPsXJRUgTjMhuOdPD1ujip
 Wj6VB7+jweWVY74/TEODwg5jQyUsAMmg/kJ3+k9hmcDtUihNw5IMNS1vcIGSUDezQFyQ
 tBCwiL++txmOM68FfwTUrYCp9DTa/goj0urG6Pv70OzIOGUyAMU4aa0vzpWr8br6ja+X
 XeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719592648; x=1720197448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xpw5m5WnfpE8whE4dgDf3nv6xN6hBRVBgVHir/fOwr0=;
 b=l7KozdB/pNXgy2sYdSjlLgwn9RoY2/CtMRHBgw9G1ZouZPsz3Kg2UDg+almqNoymGp
 vmwjY8cCHTJACURqRiTQPDhI1QFyxMr6sh8onNRv7F/ZQAvO3/4Uj9vpCesmww2JQ2a9
 ZgSr7M7Puk0CpCi144FJvzfIXLaKCxVxEcA44rHe9fF2kM1y42zwLD01Xw6X/TuAwtUY
 9VK8HBi2q+EjBfnnazNu0rM0OlBNqzI5SQbwIWO7qiYcImIEFL/UpJvT5jB1ny1Ipyo0
 vcdCIn7tLwNDQ5EgXup41i+oluP0/mMrGyEjF6/htbQ8beu6DTmZLISvVf3qfpJ5ITIC
 LWeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNQ9Ped54NDPaCMhieyOvYqzOhMXHeMIHwoNruSaj0osGaDgZHgogoUHAO2fxfgT1Bt70Uw2Xzwuwn9CE49AP+pCXj
X-Gm-Message-State: AOJu0Ywwk7/y+QigNDdQlKORssRJAHqBiO+qKqiTkfUTzfcIfFkLvqY3
 dhMBLG3M3p1U5a9IH9CziVLl2h7Tv0o3aO8V4VAEcg0+DZQPgK/TyPVgZNUtJXw=
X-Received: by 2002:a05:600c:5d5:b0:424:a779:b5bf with SMTP id
 5b1f17b1804b1-424a779b679mr74468705e9.20.1719592648046; 
 Fri, 28 Jun 2024 09:37:28 -0700 (PDT)
Received: from [192.168.69.100] (cho94-h02-176-184-4-239.dsl.sta.abo.bbox.fr.
 [176.184.4.239]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256f55c4b5sm27770395e9.43.2024.06.28.09.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 09:37:27 -0700 (PDT)
Message-ID: <83667101-daba-43ea-ba33-1df547020cd9@linaro.org>
Date: Fri, 28 Jun 2024 18:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Always build Aarch64 gdbstub helpers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Anton Johansson <anjo@rev.ng>
References: <20240619124903.56898-1-philmd@linaro.org>
 <42de8f25-3624-4e7c-b38c-ad8e3b8e61a4@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <42de8f25-3624-4e7c-b38c-ad8e3b8e61a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Lq9N5VvO+Jal

On 28/6/24 16:31, Richard Henderson wrote:
> On 6/19/24 05:49, Philippe Mathieu-Daudé wrote:
>> Merge gdbstub64.c in gdbstub.c and remove uses of
>> target specific TARGET_AARCH64 definition.
>> Small step toward single ARM/Aarch64 binary.
>>
>> Philippe Mathieu-Daudé (2):
>>    target/arm: Merge gdbstub64.c within gdbstub.c
>>    target/arm: Always build Aarch64 gdbstub helpers
>>
>>   target/arm/cpu.h       |   8 +-
>>   target/arm/internals.h |   2 -
>>   target/arm/gdbstub.c   | 363 +++++++++++++++++++++++++++++++++++++-
>>   target/arm/gdbstub64.c | 383 -----------------------------------------
>>   target/arm/meson.build |   1 -
>>   5 files changed, 364 insertions(+), 393 deletions(-)
>>   delete mode 100644 target/arm/gdbstub64.c
>>
> 
> Are we attempting a single binary for user-only as well?

No, due to ABI constraints, right? I did a user-emulation
smoke build, no failure, did I miss something?

