Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp133584ejc;
        Wed, 18 Jan 2023 23:05:27 -0800 (PST)
X-Received: by 2002:a05:600c:3489:b0:3db:695:461a with SMTP id a9-20020a05600c348900b003db0695461amr8430146wmq.7.1674111927457;
        Wed, 18 Jan 2023 23:05:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111927; cv=none;
        d=google.com; s=arc-20160816;
        b=U9qKGjbNxteNF/epcJDTtNa5uH2Y92Mi5e1CusrHNeNwoGQWCL9pWnotrvjgmyUFBy
         qhKBgAwIGtKKa8eysgZ6h4qYCLEpWvYHiNi3fyk+KgFwgXDNtTsXFKn5Wt02QGBGya6e
         hkeZlWUmjQvAqbA51p/vbTjk8AW3QyfaO+Gdzw5qOwTddEqW6myE7sav5LOK4jFWO9Cl
         swf02Fp2E1MamoFAyB7cKWXeY467Rno4fA6l10szP/sZH21Qw4yiXwbF19ZiXaCvTvWv
         5q69t6Kg+28+Ep/TmRptpsk2E3mfC3kX1rXlWWFzSNwHac8I9Ejl7f/YvLfJmpt95RQb
         Eoig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VDNXl4Vy80BJtWqZjof+hdjwidnfN1NLQSiLIXhcVW4=;
        b=Tufba79a4C6zF94vvIPiXCbBBQiJMqiEBglf7PuDFVpDD3gh8OCyWQnl39BzAQ6kcN
         mVE+qZEWbW8IpwwpYgIkqlndGSqba3oXbQ9A6Obcz9zCBTasngZxHfo4yeNvAB2Yuq/y
         2+j1KKDPnH0TCCSUQc3m2OuGmXxiy83zS1iWiM3nZ7d2YeUtAY7cYfXtyqDBgJw+IuKk
         VZYYoCG7GsV34Kwr2c7i+UKcioAcpxS8XdQJDvESIz6seHtxrI8i4xcIRk42b42K8tSk
         XqcoR4NvbmF9pjbElYqg/pFMCAYpAVIK3URLFjtmVk1hLDG16+8Cb/9iZmJeGLqCxDcY
         ri/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFTsvxWH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o15-20020a1c750f000000b003daff66e3c2sor1355862wmc.12.2023.01.18.23.05.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Jan 2023 23:05:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFTsvxWH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDNXl4Vy80BJtWqZjof+hdjwidnfN1NLQSiLIXhcVW4=;
        b=zFTsvxWHYI4CutbtrcqNV148RabGyQCSL/kobCZMYCbdwhy5ZgOBV9ns2CWKex92jB
         AFaVUAjrV4ybE486SFzHfCOkunw2nMljMj8+0wSFmMn5khmR9zWd5bmB5wasiY7vVi9P
         xEvAqZAcOqxMW6NaFSEWdzz3sBYBioC2Kg3l1TRM1nzIJ913ZJrmxLgDzLJOTpoBeFh1
         KP/ktAaHjlID+2RuDiMuG7kriEFyDBkHJnHWymwFVX715qMmTzfDVCnNHCTVRurCFdtA
         RHjHUmiDDhFWWVxM8cSnB8KpQOKtFozTV4mKIIVHE7ShDDzPJ+/Me/5v/xebIdJGgK2J
         XQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDNXl4Vy80BJtWqZjof+hdjwidnfN1NLQSiLIXhcVW4=;
        b=YP7PwEUH4phHsw1M0E36Nq8C12yl1Gi9+wUs5nP1dM9fygBDFT8kpOzeJMQfgHvUJ7
         c9UAy5XpOazukmwWlmj/lqESRyBr5MjIMbPnb97fcz41nag8pI7iZP0zvwSPLPsk6CAB
         iik+KaeyA9L7/77rR3HVnKXXJk2Qv6QgXvKkFirEY7BveUPFZ4w9jOu6u97sJiAr7R0Y
         T4uHY27H26ENYaJ0YdLMe3FVwgE5pUXZJ19Obj7EDZnz9RjLoq+j6mf/UB7vcKJ/BO7t
         leu+qrwL/2G41miOolcKaN/LykPVBvsXX8NmC1B3tgMc/ng2FpSL+Ubz25wucRemAiMf
         kLRA==
X-Gm-Message-State: AFqh2ko2GLiHOd8HPMdc7nV3TboogUebIZrgROPZDs5Q6fLxnzJLLKrp
	lfH2B+RmZi7lNPIMnpf0F3HVmInb
X-Google-Smtp-Source: AMrXdXsVVbmlupirAKslTN7K8VYDmE5+0ybFswJZ61vY24Vp2wh5ts2uqboyLjrVqB2uyX48NI9g6w==
X-Received: by 2002:a05:600c:3c86:b0:3da:2a59:8a4f with SMTP id bg6-20020a05600c3c8600b003da2a598a4fmr9127296wmb.38.1674111927135;
        Wed, 18 Jan 2023 23:05:27 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id r18-20020a5d4952000000b002bdda9856b5sm17440123wrs.50.2023.01.18.23.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:05:26 -0800 (PST)
Message-ID: <040a9b0e-0e86-311a-a045-00a7c16ab819@linaro.org>
Date: Thu, 19 Jan 2023 08:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230118193518.26433-1-farosas@suse.de>
 <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org> <871qnrcz31.fsf@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qnrcz31.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jNuCweCvhHyc

On 18/1/23 22:28, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Hi Fabiano,
>>
>> On 18/1/23 20:34, Fabiano Rosas wrote:
>>> These are the already reviewed patches from the first half of my
>>> previous series:
>>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>>
>>> This unbreaks the --disable-tcg build, but there are issues in runtime
>>> that are still being hashed out in the other series.
>>>
>>> For the build _with_ TCG, this should behave the same as master.
>>>
>>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
>>
>> $ git am
>> 20230111_richard_henderson_target_arm_introduce_aarch64_set_svcr.mbx
>> Applying: target/arm: Introduce aarch64_set_svcr
>> $ git am ./20230118_farosas_target_arm_config_tcg_n_part_1.mbx
>> Applying: target/arm: rename handle_semihosting to tcg_handle_semihosting
>> Applying: target/arm: wrap psci call with tcg_enabled
>> Applying: target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>> Applying: target/arm: Move PC alignment check
>> Applying: target/arm: Move cpregs code out of cpu.h
>> Applying: target/arm: Move define_debug_regs() to cpregs.c
>> error: target/arm/cpregs.c: does not exist in index
>> Patch failed at 0006 target/arm: Move define_debug_regs() to cpregs.c
>>
>> I am based on commit 7ec8aeb604 ("Merge tag 'pull-tpm-2023-01-17-1' of
>> https://github.com/stefanberger/qemu-tpm into staging"), what am I missing?
> 
> How did you fetch the series? You are missing patch 06. Maybe it is too
> big for the method you used?

Actually the tool warned about patch 6 missing, but I didn't notice:

$ b4 am 20230118193518.26433-1-farosas@suse.de
Grabbing thread from 
lore.kernel.org/all/20230118193518.26433-1-farosas%40suse.de/t.mbox.gz
Analyzing 20 messages in the thread
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH 1/20] target/arm: rename handle_semihosting to 
tcg_handle_semihosting
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 2/20] target/arm: wrap psci call with tcg_enabled
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 3/20] target/arm: wrap call to aarch64_sve_change_el in 
tcg_enabled()
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 4/20] target/arm: Move PC alignment check
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 5/20] target/arm: Move cpregs code out of cpu.h
     ✓ Signed: DKIM/suse.de
   ERROR: missing [6/20]!
   ✓ [PATCH 7/20] target/arm: Move define_debug_regs() to cpregs.c
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 8/20] target/arm: Wrap breakpoint/watchpoint updates with 
tcg_enabled
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 9/20] target/arm: move translate modules to tcg/
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 10/20] target/arm: move helpers to tcg/
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 11/20] target/arm: Move psci.c into the tcg directory
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 12/20] target/arm: Wrap arm_rebuild_hflags calls with 
tcg_enabled
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 13/20] target/arm: Move hflags code into the tcg directory
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 14/20] target/arm: Move regime_using_lpae_format into internal.h
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 15/20] target/arm: Don't access TCG code when debugging with KVM
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 16/20] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 17/20] target/arm: Move cortex sysregs into cpregs.c
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 18/20] tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 19/20] tests/avocado: Skip tests that require a missing 
accelerator
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 20/20] tests/avocado: Tag TCG tests with accel:tcg
     ✓ Signed: DKIM/suse.de
---
Total patches: 19
---
WARNING: Thread incomplete!

Indeed patch 6 is missing:
https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/
