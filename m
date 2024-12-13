Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp475691njb;
        Fri, 13 Dec 2024 06:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgToLBa0POeOAxYVZK/P9+R70LfLUZ5y2aZ2ZsxM6iniK/Kl5NZz/Eb7QgVCC62zQ2Mp09HThd+f8ozg==@linaro.org
X-Google-Smtp-Source: AGHT+IFrfVMRnuXk66BXIutAEaigjSAfHnGJXLpdPi7BTngjLk4abz68hLQL1OxpTuloCMAtKp1G
X-Received: by 2002:ad4:5767:0:b0:6d8:7db7:6d88 with SMTP id 6a1803df08f44-6dc8caa1257mr47853496d6.28.1734099729076;
        Fri, 13 Dec 2024 06:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734099729; cv=none;
        d=google.com; s=arc-20240605;
        b=cTKkvPzQ5o8Ua0bJPxgMNglUOhIHY+FDkm5XOXKfkJhlkNhrZNr2Uzm5D1lkMeZTZm
         z9bdNrBYK+J8BUHkAL9/FKXBDsBkCT6PF4sVQt5fHSlXsWbzha6eFvvxltN8LKmBUsUV
         WsgHbLH/Y17cGvqhT7MJUj85cEbo4RkH0otqqdFMpz3mibgKqOJ8rWZ6BfFDVHQ28i9R
         iu+VMSEPAaBdFAet97MatBF5LwrAYIIRl/YCoJa1koBcM5FX60VdM8G5kujLkHU4xtrs
         n+fVdyjYURj1U5RgkcKXN5TDZmqwN4/jOPjEDZ2BuPBZ5z+muRJoj6ONcLt6NYcZlpZz
         VTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Rd2Q1V+KzbYu0703L0vevvYSqhm+/QO3ZBD28YeGU7M=;
        fh=seoBapcud00pl1A4+WjWN8aE42MLArAhclEbrRoAIjc=;
        b=GB3PW90MV+rqAMsdp0EeQcAFbUl9hDyeNw2NphsY0H619gF+2h4arPtlL/R/xS8Ctf
         861zSbBH3m/yI3eonoQhpfWh3lFBOyqJoIpPGHRyPEsQw83KJfZQg0X3BNO4cdU+YF5y
         QDTUChLI2r/BPs4mbjYYmBQWgrfv6yb/iqPho83m8M7bmydQGRX1Zbqw6DO7lnBilqzZ
         Z4uHf3pwM2DWpuKK+qwc0snnWaD/AtBqiLp+Wb0p86TJMhhM5Ez9BBM8IsL4haR5lICr
         SlgPobijjlqce+Q7S+K5glBHsDbYIrOzWKGZkCp0jRBbfu9DmeL8S+GqdQjfjf2i8pb9
         RraA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uaj7uU4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d904778f67si161834746d6.209.2024.12.13.06.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 06:22:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uaj7uU4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM6Xw-0002u3-Dz; Fri, 13 Dec 2024 09:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM6Xv-0002tq-Ih
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 09:21:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM6Xt-00029U-VM
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 09:21:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso1510995e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 06:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734099692; x=1734704492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rd2Q1V+KzbYu0703L0vevvYSqhm+/QO3ZBD28YeGU7M=;
 b=uaj7uU4bqB3q1sWTsxkQRCxekWrAOu4EXUy1dLFUawJ3yDJq9dr2g7ZvRLHvjU+Vv3
 zKub58cYUsxoWg7mF76ybXYJN1F1K2fge9huZHAgPUBz1DaIOXZfe5IhdgzxtxeKWJYA
 AaGnKsRUR2l5g0x5hzTddgdvRFdm3vItFCLN6bCYRFsUSfjGdcMPpboa8kd+RLV+Ocr4
 dUAC5fs1PdlItk5v287Fk1K4zOtYXPqdOwJP3OaftFP0plKkC0L8JnZ8CC8VB4+LApRs
 c17KHIG4UpSn4+ybB5g2s9WCZ57umdjmx9zFRvHRwWps+TOdwqauveCCgGXE5I2kxDOu
 lQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734099692; x=1734704492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rd2Q1V+KzbYu0703L0vevvYSqhm+/QO3ZBD28YeGU7M=;
 b=opmLO5OMYzFJtpowI/b7OgnhjN9DJrqnRweHnNUoz9ORPGJZozhEVw8l3UJgovU2II
 UwReaoL197a5AEnC8bU/Ro+pG496ua8vor/LzzCCFW9J0CO1d97/xt0H8vHXvlL5WVua
 5STxUrfOxoTrTeTrYQXOX753CCvpjUMGEzfGw+oRzGdGaMGvTtUka8oJmRUhWNqPjL71
 E9JJF4zArmxiykU82s2fUuOgjp04qI3qZbF8SEVIRJnxRCS+OogfxlReZHpoxW4XKNnK
 2WxU2rKYVADP6fWXl+0p6BCc2gkMc7FLIFeOPx8SrKpNPyQ9ITTYKI3zUnCioMaNg34e
 /hbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm6JemvmXmOTgmp+NgnWiJ2YktC0o+lToYSRVUQJxYsnu7GZ1vva/saJB68oyOjT/exWKm1oerxg==@nongnu.org
X-Gm-Message-State: AOJu0YwgLCl9ea5nGG7khAv4E3PvZjfygYNEyjyfqfvAnSbVQTf93x5F
 P4TK4Vj+CYsoWrHrLMRAQXrZVc+Y5k8x3CKY+6y/QJWdHKTpZbNJe3pZGzqIHLs=
X-Gm-Gg: ASbGncs4CWG0a1gIHTL55pa0iMcSMczpLUINpU56j+ZwRLuQ5HmXqpcplLAu3y8JE6B
 TN9tPG+4LMNklnuYhDy4eeVV4TZGkTfjGL9Nde/pkeN9n1s1GTaiSJbfhsDKuzWkNfmy4fptYf9
 C6V5qNHABo1m0FMGxjVm9UbFAAtnbaidDOJfc2Hx9maXkOFwMjTmgs1kLwyskPiPIUmg285nrro
 0zJM/0sZNB/voO8q2nXdmbMCwepnButWf9C6YNUXO/QguTyEjsWqmdzCNT94ol+Hh3kS3cWnWef
 xmNi3kLpTUOrcISdHEUrzmyvp3tpzg==
X-Received: by 2002:a05:600c:450e:b0:431:6153:a258 with SMTP id
 5b1f17b1804b1-4362aa38680mr24750545e9.13.1734099691771; 
 Fri, 13 Dec 2024 06:21:31 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625716e5csm49855985e9.36.2024.12.13.06.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 06:21:30 -0800 (PST)
Message-ID: <ad581f8d-7370-4485-81d7-2d0d7b41811c@linaro.org>
Date: Fri, 13 Dec 2024 15:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] hw/nvram/fw_cfg: Skip FW_CFG_DATA_GENERATOR when
 no data to generate
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20241213133352.10915-1-philmd@linaro.org>
 <20241213133352.10915-4-philmd@linaro.org> <Z1w7EhdPij2fqM2F@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z1w7EhdPij2fqM2F@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: ryiQqNPmug74

On 13/12/24 14:48, Daniel P. Berrangé wrote:
> On Fri, Dec 13, 2024 at 02:33:48PM +0100, Philippe Mathieu-Daudé wrote:
>> Allow the FW_CFG_DATA_GENERATOR interface get_data() handler to
>> return NULL when there is nothing to generate. In that case
>> fw_cfg_add_file_from_generator() will not add any item and
>> return %true.
>>
>> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/nvram/fw_cfg.h | 13 ++++++++-----
>>   hw/nvram/fw_cfg.c         | 10 ++++++----
>>   2 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
>> index fcb06f18cc3..5211018fd8f 100644
>> --- a/include/hw/nvram/fw_cfg.h
>> +++ b/include/hw/nvram/fw_cfg.h
>> @@ -30,8 +30,9 @@ struct FWCfgDataGeneratorClass {
>>        * @obj: the object implementing this interface
>>        * @errp: pointer to a NULL-initialized error object
>>        *
>> -     * Returns: reference to a byte array containing the data on success,
>> -     *          or NULL on error.
>> +     * Returns: NULL on failure (errp set if not NULL).
>> +     *          A byte array containing the data (if any,
>> +     *          otherwise NULL) on success.
> 
> Bit confusing wording, lets say
> 
>    Returns: A byte array containing data to add, or NULL without
>             @errp set if no data is required, or NULL with @errp
> 	   set on failure.

Thank you!

> 
> With that change:
> 
>    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> With regards,
> Daniel

