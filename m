Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4980589lfb;
        Tue, 27 Apr 2021 10:14:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb7dEbO5VYm8WFLeFvtZHs+SBzjYiAqmU1gQVWC/RJk81hUkNQqn1S9LCldT8/FmAa4BUo
X-Received: by 2002:a92:dc4f:: with SMTP id x15mr18864667ilq.27.1619543662268;
        Tue, 27 Apr 2021 10:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619543662; cv=none;
        d=google.com; s=arc-20160816;
        b=zH4sDKiOvoz7i2kG29x/4I9xlM1o8Ps9PrLn8XVWcZDGpr8GFx5fmMfB85PCIlpQgJ
         q3CKBKLadvoj/CfQnsJssxGv1CGMsT8J5v2VhTwXEHQ78G/qnvCDXuTRiWg5S/SWXjhH
         VBprb7/yWTzF/YliThabKQ4BoyRcDVxdbd12C+FF5VlW18UDPlqqYvDuaEMe89Xx8nKb
         4R/snHvlQT1oQUYEzTTfbBq4YESD1shM19b2XQe6EuW/zhvAe7pJal3RvCZpUlXnIEhK
         KuMVbloo/Ua5q3NVS85Z/dN1ciTk4HfXgnJKQWNq46jBDitqJY/jLxPCS5Fqojcx7HYf
         G2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fcVzIEyCtvAbmGLh9pJwWN6TByhzeYrrJZNAy7G5ugU=;
        b=fDy283jQmyyTeJLlAk8IESFVD6i9qFqyijeKWPL5IPrhCjkFQ2OEZUZJePy4SeXAIt
         z3DdcJqKJ8A4dWD8cmvNfxOSEtVvunnHGELP/c/o2uDoQ8FIgFYajt4bas0P1/0xYZwg
         eqvCtbpLZGapKFu+WmPCwJ+qDEPkKT+AfKUy22kIcWNpyICgekEiSkHrOZPozT4d1ot6
         sdmuU4S+2AO2ud9m18VlRHqugAK/3v/twNjrufXaPHHVfx3yzNK3o4vqn0VrV3la85vg
         cloRtseuaY6fgVoSlJLCZruFZwNdmVapoMgZcOTtM3qOfgJ2mAvPgWFERiOspj4Zwi90
         RlZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OZydZe5/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si345157ion.91.2021.04.27.10.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:14:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OZydZe5/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbRHx-0005od-LO
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 13:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRBP-0000qY-6L
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:07:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRBJ-0004zD-Tk
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:07:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id lp8so1225421pjb.1
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fcVzIEyCtvAbmGLh9pJwWN6TByhzeYrrJZNAy7G5ugU=;
 b=OZydZe5/d2EfsN7US05WdS9FGBwIUGZDWlgaM5JZVeBwxw6QJ6pFtw40weUrMAxfwL
 xCzabCKkqowcoB97DKLhYRCk1GTmi0N0dBRxgCmmDg9NlZ+gyFgSbykh+GXZARAW/EMu
 loN4ZdBNDhuQnPRFBlef0jj/VBq216EZMKB0HKMWsuHyE8Hk9GnXG++Ob3lhQSqNqbS1
 J2RnYZ+RSRyemZDpNCrdzpifxEU3sF7pREp40zcuMerhLvspOjXegQxf+IC8PmHIcKjt
 j40BDQ+uEoWbMopC6zsK7NHeQ1gNhNT8rmsx0RM1nMa6B+efgnPAEpxnfGUNqhr/YZeG
 bjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fcVzIEyCtvAbmGLh9pJwWN6TByhzeYrrJZNAy7G5ugU=;
 b=KaUqNHFPn1LOb5ExumCBySuBRwJyEsvhIYtTFBEm6cYq5f+XSVLVYIRabkznZwu614
 SbQVsgUR/nFAKx4ES8/nU79pWBgPVOgsXCuaP+cpPvfUvwo+2rL5FQlDxbMAXsRDUpNh
 RupxPDkx164I++mTLmq3ghLCIaHq2FxNM0Ikj+9ejdLSd18ezVJ9LFy1Wdpb/8fF4KBz
 NBQhNQ0k245pqbtaYusRcSBjxTFLkinqNo+xyo1j9eI5knkzm+KWNgizCM5gOp3r7gUn
 ErIzxj1SMgzpAQbUXbQV5ekvucmZwofZ2F364EJXGQNOxGVK3/QYpHAJ3s4FSB1+3aU3
 ESXA==
X-Gm-Message-State: AOAM532bUAGEv9iDAYDMXnqSBLLOBi3C5Kve/ZMoOnnSiXRkybKNv1pV
 M3nLXhABQcJRja9/My5bPn7YOHrFzb2c/A==
X-Received: by 2002:a17:90a:9e9:: with SMTP id
 96mr15181064pjo.130.1619543248596; 
 Tue, 27 Apr 2021 10:07:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k20sm2994637pfa.34.2021.04.27.10.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:07:28 -0700 (PDT)
Subject: Re: [PATCH 11/13] target/arm: Move NeonGenThreeOpEnvFn typedef to
 translate.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4bede5a-d5e6-99d8-ebe7-379e4facdf3d@linaro.org>
Date: Tue, 27 Apr 2021 10:07:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b9eVCYy1Ij3n

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Move the NeonGenThreeOpEnvFn typedef to translate.h together
> with the other similar typedefs.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.h | 2 ++
>   target/arm/translate.c | 3 ---
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
