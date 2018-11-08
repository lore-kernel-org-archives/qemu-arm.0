Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp392810wrw;
        Thu, 8 Nov 2018 09:13:15 -0800 (PST)
X-Received: by 2002:adf:9b84:: with SMTP id d4-v6mr4666078wrc.240.1541697195400;
        Thu, 08 Nov 2018 09:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541697195; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZJl78dUcXU8mkB7gCBM4/PCv/t6yFq0ACDFIZGPeUlW+qBhCDeUoHdstFCLJQ5InX
         GcZ9IScdWUZLZrmQlwr9UpB1M/pF6AGaGvARgNIIw6j9WVpyPRWbUTxVKMEkLB4rDzUO
         kgswE1bk3XAz4HjoWW4f+WnpJVCEdZ9EJnF9+oRIBh0IaJVLS0L0rbp6ROiqCqXjLLSI
         8E2fuc6an0GnGIu6Dov1GlD3qvMKtukqbKLKK32n0s3oOEmri8E2dnOzIXoDRePdU9lq
         bhOMxr8ktfjvhARIPUZDML43QDZzqkOCftE/w5+4M9Ap+Ub12S0yAuRDt9ZXp+aVYaHQ
         rhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=pKYxYoCXspZ4jVfCzjdjg199y0gLfThUh6MyMWVtw30=;
        b=mag1CzJD6wmctcyVjXtuk5SRt8q8E0qbvCt+ghgSc7OP9C9ayVLhPi1u6YM3LIRuY/
         iDZe+J6uys2/1IqDSmsca1jrKgMJNtWxOk2IIdlbrVeku6vy8fWGoN24RClPlHzmfw9Z
         ec0J3Wn8B9OjwafsU71oIUrUigBTFcdPYDA91u6KXXx9TiNWsG8himj9mca2qDznTvI4
         VdHfwxkVsaXRyYVeb8njuoEJbOO8wPzQ/oMEw2rIaM/29upnu05RTMFNZro88X6zRf/K
         LJheQql5v0BMcj4Q9thfI0QkcIPbWhifaCfwkkNs+jQePWaL8/Geu2av0hbFQF+I8FCH
         DtQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WI2EjIL2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s198-v6sor3314007wme.10.2018.11.08.09.13.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Nov 2018 09:13:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WI2EjIL2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pKYxYoCXspZ4jVfCzjdjg199y0gLfThUh6MyMWVtw30=;
        b=WI2EjIL2ocLxJ21ZRoLXLMmCVTf9b1lcFbmjpfYJxel268NmQFOPRWQLJKxxoJ51Iu
         K+FXx20r3yZ0YMLJtR4uyoJi/yUUFPC2h3NzVVqkcOOIgr9+GeIhmiIg4AyPU3i3Xpx5
         Tkgy2pqzdxkbyH3YYe2AXJyor9RVNRmM83Tg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pKYxYoCXspZ4jVfCzjdjg199y0gLfThUh6MyMWVtw30=;
        b=LatnUaHdJ8ytEan2pqAKebfezC74ncZ7OgVCTUvqceaaL+10kLaadiRft7xRLggSBQ
         OC/cXWL1rEG0Vmay6omQ5EKLeWW+FJfULZDViOmxw3TEK6AdY7P+ZvTjmQEajDaIpuxj
         IvCF21Zb12Sg9oqGQ3JDJ0ci8wdZiqJ2Ch9q9JMOD7U8XfxF0wqPwIta0U/CEqgTo0Ph
         1e4PEdb+0JMJXne1webDbQuTNdVM/xXhwen6kkrKpAyyUWyVEStU37rm5RfJJWXuyBh4
         yx3PJiDJ4TD0zE9rkTi9QWX8uS3r1QoV3cXR1QH64rw1Yj0NL3V/HUPItv/248s9F/d4
         wi8A==
X-Gm-Message-State: AGRZ1gKQqN+YolNBefjQSmEA7RjkMLR6lTIy9yW2o/p5saTFYn2ZC/s2
	BqtblDRF+IC8hB4kiqT1vWE+sXhs6ttcVQ7p
X-Google-Smtp-Source: AJdET5d+P901kNrVXE8VnGKRMutjkLRAqj4nMTLnbtcf4OVe2/ibFMHcQIZfhqtqK6/l2dyF6GUWMA==
X-Received: by 2002:a1c:dc42:: with SMTP id t63-v6mr1980925wmg.17.1541697195030;
        Thu, 08 Nov 2018 09:13:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
        by smtp.gmail.com with ESMTPSA id t77-v6sm7385885wme.18.2018.11.08.09.13.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 09:13:14 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 3/6] target/arm64: kvm debug set target_el
 when passing exception to guest
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181108163329.19940-1-alex.bennee@linaro.org>
 <20181108163329.19940-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8f40ec14-1e86-c865-c396-6ce5cb09115f@linaro.org>
Date: Thu, 8 Nov 2018 18:13:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108163329.19940-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 65GLfq9V5mOY

On 11/8/18 5:33 PM, Alex Bennée wrote:
> When we are debugging the guest all exceptions come our way but might
> be for the guest's own debug exceptions. We use the ->do_interrupt()
> infrastructure to inject the exception into the guest. However, we are
> missing a full setup of the exception structure, causing an assert
> later down the line.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
