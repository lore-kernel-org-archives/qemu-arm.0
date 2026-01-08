Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB6ED14880
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 00:55:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdeId-0008E1-3F; Wed, 07 Jan 2026 19:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdeIa-000857-VG
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 19:54:48 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdeIZ-00021e-Ab
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 19:54:48 -0500
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-2a12ed4d205so18802905ad.0
 for <qemu-arm@nongnu.org>; Wed, 07 Jan 2026 16:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767833686; x=1768438486; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K0Y97GfwIUeGjV7WhFgn2+cDOBfhZblbtIsq7uReysM=;
 b=srxaHJ810pMDcGkwHe5GMU5S2tC0dm8JAW/ft1zKQd02oZXk72OjMCLsmZvlOpXhug
 ziGJdpfgGDbXqkfn6rrdV3tC6LmwRFoYDGc0YHfu8XZ1P8gjud95rOQN5HIShU81OQwS
 pKuhu45wumaxzU3QWsADjx2DdXsMVn4d4vVI13p3S9fTyfD7JOEEY5VLmDe4oVra18tB
 MR8aI2uETTk7QUxJjodrx5P9Hsu6lWxylN0CsjfDYB6Yhtu5wAJYdLfFNoHggzLOKF+Z
 Rvnwal+46a05z8H2ArZpmx0oXWkqt2XshH2u9WUlHOEQx1mxIN/eQk9ZEWrZ0Vd2XRom
 HFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767833686; x=1768438486;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K0Y97GfwIUeGjV7WhFgn2+cDOBfhZblbtIsq7uReysM=;
 b=pVZtofUqxUfxccYjmMh84zlp+TcoiIr7W5Yn0x1hyqiq9EhARq8EOLoA3YNd9y8/nM
 wQHKn7190Cjxfqjssr37Cx/0zbBv/63RBeq7esQF1z2S52TPGUmGuv8qLGbX+CpKtNe6
 M8mH3aPEcGjfSCL4oN9LbSwwVMkTusBlKy248bh4w7aMn70H60QqCn/waSdqMz6arGQU
 HdlX7Pxefs96BUaWJl5aXDT1HkqFztFIeG6NY00IbYdTpVtw40+jsW7PaAsndGgifGQS
 r8spLBT5XH84UoGvUi4qk7i09QFYEWek58ZrDY9IWdGzWanJcJghNWdQ9qXPSC2eCWIk
 GakA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPhPfruPQlTSD2pzSlwoe6Y7noH2Hp9ZTea8Zeh2EEWHQqTJt4YO1cWZJ4Po+jwNzH1V6hdsYNdA==@nongnu.org
X-Gm-Message-State: AOJu0YzFgSQrVhB8mkKgsA/FF09HxJ5vPM9U/R7ixFMAXSAjEW3mqTmi
 StXGTULf74XVkYRMEGOM3v9b4+XcmGrSKjj8q925yUQuSBglfQtxh0B+NGv/pFA0PtQ=
X-Gm-Gg: AY/fxX7BMgU5hjqnAKHPuFlg0Z7WGcGCtsLzJZy4bzAkzxVD1tMB4x5rolZ/1slSbwv
 64QjFHMixIN9Qi5F3hTK9aY7bx3SdHXbhcBw1I5RsJe0R9fuCTMug+dSsfWezlzS/aQXXKnvnIe
 J05w1brUJqafqAuEmHVUKVnXgJ6HzJczHTWYEHvLIbelvYM6y3Uj46dYvT1mM84lYhmUkAezDwt
 J/RGw0Rx3C1cajDaxpf9UD7j13ZYAz5GycFDHH2+s6P9F3FdLQJjIKcq6UMwG+5RINkNVwy3P3h
 JOl9L0wQjltqjkGzbgZbBfmS1h7/Z7SVkK0Y3ahsC/tNzkcH7Mt2OrHwY91QLPY8LnxC8k/05x0
 Ps5fkHzB+9VMtv9ZrwO9OJOZembU9afULJ8kjqY4KvQAz0/JoWCgWka2e0m9N8mV/ZpmJz3u7/V
 g1u5aTkUHiJU8UGHbEjKPCKI9YVnnKc2fg2Ts949h6XEbmRJPRlfK3e/f9
X-Google-Smtp-Source: AGHT+IHrhL1/L+aJVULGqMJE4OxHaxulGzE4ax6OBWGkBO17sxRQ0IjXhD0n749vw4bX8xezADd0iA==
X-Received: by 2002:a17:902:e749:b0:297:d6c2:d06 with SMTP id
 d9443c01a7336-2a3ee435e58mr40779415ad.20.1767833685617; 
 Wed, 07 Jan 2026 16:54:45 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cd3632sm61416805ad.95.2026.01.07.16.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 16:54:45 -0800 (PST)
Message-ID: <d1611864-a119-4b5f-8df7-894ee7160f38@linaro.org>
Date: Wed, 7 Jan 2026 16:54:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] target/i386: Restrict WatchPoint API to TCG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260106231908.16756-1-philmd@linaro.org>
 <20260106231908.16756-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20260106231908.16756-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 1/6/26 3:19 PM, Philippe Mathieu-Daudé wrote:
> Watchpoints are specific to the TCG accelerator. Restrict
> the cpu_watchpoint_remove_all() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

