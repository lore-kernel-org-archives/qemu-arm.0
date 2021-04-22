Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp941641lfb;
        Wed, 21 Apr 2021 18:44:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOaqtoRTGB1/erT+KEQ5f9/JKU9CS7qPUnjv2aO79erwS/Lz5PTvfxDnxIZ4Jq99progFh
X-Received: by 2002:a05:6e02:11a7:: with SMTP id 7mr741910ilj.20.1619055840856;
        Wed, 21 Apr 2021 18:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619055840; cv=none;
        d=google.com; s=arc-20160816;
        b=m9hjL7AMeXpcvkzV1fCP5++7wmBMcNnmzZXerXGQ5KYMj0io6BBs7WOfPeErdQEA0f
         YfpDh6S7xTZoTHmMkwL78nlS3ntv7sylv1pKch8rWdF66h3Z5/yFV243nQbX7wjSHRfD
         PZGqqXAQv4je4rx+zysnrwBPg4v//LxzF28rbBHCtinNI9nuxO3A/9OHiFwaM4GXcTa7
         u7xwKm/t2R6pJ3SMTkLhikEwaE+HEQLxN2z41d/FJD5Lb86vwy8nY1KiFtJlSXOiEafE
         D1IfUZ6tnplzObo7kwrEXT6Q7f3YSkXD9xqOR8kOmHXMiwoojngeRQZ6X5cHRRCTN4go
         OpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7dwOa0AishVeIO/Id1EttEpKsccjYrr2aJNNtkOnpH4=;
        b=fTUK0nNjaCKpZX/QT9deX7c+5WQhjkk1RekF012xohGXVTOfPIHzTYVgnXlCm7QMMA
         +jBTpG6kjTLq6WRd86ZXS5Q/Q6iywwDPH6wY/6MP0hSL+eK4w573sq40ZDKw70p/zsg4
         CO1zVNUOT7E9RCIvD6b/dVhFeCOgiu7aXmGiUXVS3V/CZYBxT03/EVusoYBVQW39eLEf
         xUOrdf0DbRnohMiYJcvqPRetQF8+kyMZIVtJsTaxnO5hZouCSrx18edxMq4UcHmweyY1
         anY0leDHU03IMtA7MfjYOWxPNOCr4d+pqpVy1kjCfG5veNquUbXmGdqrUPJxwj3MT+c+
         LJ2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vs/LZ/lk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si946512jal.79.2021.04.21.18.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 18:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vs/LZ/lk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZONs-0001P2-6E
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 21:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOMS-0000SX-G9
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 21:42:32 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOMQ-0004r3-Vk
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 21:42:32 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so85483pjb.4
 for <qemu-arm@nongnu.org>; Wed, 21 Apr 2021 18:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7dwOa0AishVeIO/Id1EttEpKsccjYrr2aJNNtkOnpH4=;
 b=vs/LZ/lkLDAUqcgX5J+gJrULsQQVrRemBLmqcBflHTEUsS15TxsWeFjEVGY2aFtAax
 FKBP0nPSTwU+foCFXCDypD8xgfB4M6PvK3nV+qhcdCAnSUCQa8CSOXXajdSp+w3GEdUM
 9XHrjBx5EXuPeoarCjBKbv/WoiM84DNXt73Nh2iz38Kyk+G3QEq8TJin39XnWWGUP7Em
 MshYTUs6bnZ0C9EFncgd1eHhMpwyVCoB9WS6xO2Pw2/klxaApy2e8+ROGu0WJxYA8RSo
 Y4yXkiZX1tKiOAInSRII34UolETlltPvgkX3AfsFNcD56zM0Tse5S7vlJXuy2sZ8I6bk
 DuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7dwOa0AishVeIO/Id1EttEpKsccjYrr2aJNNtkOnpH4=;
 b=RNMJmMgIzKl7QmfYMoTNQFIeLLkVLgduZgmT6KjjhBDNeyyoghZ/HGYkiuJAeWEG0Z
 gzNpQPB+pNnOqKWaKNEndja3/NBsloZxY+6xcHbcolcUmq02ChmYg4E26hRmDoAjXYw/
 VPWfTl4iU6A7DQmYwjYQ3jr42kZ3ot5jnrsU76vbh7AOyooNwy2ztdVb6QCPqWZzJLAX
 lkbvT1Do6ipF/IRd55e/TYNG5pUmIGXPk3lwjZXvnOlEa8rvDczrgG68t90qibA4gmx9
 chtNjJISEMT29b/Bj5WTZSjL5LhtGaj4wfN92hopGEgzkGaXlodISu/iul6/DIMMsTlh
 309g==
X-Gm-Message-State: AOAM533Ci3dBgW9QMJ3I1meRAYTfmHUN8FPKJI733Kf2kLksKUlyp7V5
 JBwqduq5emtQzCuvoFhcwyXmmg==
X-Received: by 2002:a17:90a:b947:: with SMTP id
 f7mr14044749pjw.166.1619055746500; 
 Wed, 21 Apr 2021 18:42:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h9sm497418pgl.67.2021.04.21.18.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:42:26 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] hw/arm/digic: Open-code pflash_cfi02_register()
 call
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3de0cf22-35da-277d-2e31-9f1602988afc@linaro.org>
Date: Wed, 21 Apr 2021 18:42:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hFuYyRwS4mJd

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> To be able to manually map the flash region on the main memory
> (in the next commit), first expand the pflash_cfi02_register
> in place.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/arm/digic_boards.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
