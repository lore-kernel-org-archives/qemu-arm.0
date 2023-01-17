Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2488525ejc;
        Tue, 17 Jan 2023 07:49:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvYQBbM/VILzYs8j9KJuTaffqdKOsTfAvFADe7ZOedhX9hdFHy7zhd1wkMQcWfFWWn5VGUz
X-Received: by 2002:a05:6102:c04:b0:3ca:6d6b:bcaf with SMTP id x4-20020a0561020c0400b003ca6d6bbcafmr1530633vss.29.1673970550872;
        Tue, 17 Jan 2023 07:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673970550; cv=none;
        d=google.com; s=arc-20160816;
        b=iDdRwWqp0I0PXt4wq8Ye6AuwIWeRhVKK2KEF6Y6lgMUJ4W4vapovfDhkz8Sy+L5TnY
         uAI+BT2GNMYcRa87YzgTmXXBzt1eSkiP+g9AL4qRPlxL6UiH8k9a8sXX8ob6F3f+eiZg
         5zAyt0MFNBzfjy74KSyE/5b90KPLmjDvXkIepZG9AY3SdqZ3FKBDv+Nz/9PWvI8QXAQZ
         xTZDusJmj7mCnEHCiW0sanhLomR9A+1mQmXeANNepSdSt7tHGWC2G1GV6gcotanW3Ape
         SJ+GQD8n/XX36xz2r6qf5KAyzCSH6GVBxrL7L9gGWSyRy6ZIXr8x2wRf5UnZjGRqt9r5
         qJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Hj4Q2euY+utrkP+JXzaQUcU+iG3h00AI27hYYVS7I70=;
        b=zvqCV1akuFrQqLUqv5l1N7JATWkJoSRN752+NWJwce1uY5iDl5bFVjwSF4aAR7Kws1
         U4X2pWwzP5f5aiLB8UBGM95YVInL7xFI72yrrerzQvoG6CAcPbr8UrPYSbLx+L6nX+iW
         /gzJ8gMgQtDmKQ5oFVKOZhswZ4CoNhGVPAAzJJ61o6ha0sP+SrBML4oUUKnzgG800DDu
         /S/xYIxv0Cp0rg2kdoqFmzF1xBguWjM3rTv17ZGaef8RDORI34pnfOxC1Ba1j12gWjRy
         xEQH93we3mgAOw/EeFZ7XhZRWZO72vO3iURwyKqHywqaWUphjqpOIOXDtqaoop+feXRd
         AkPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MyKwY+Uo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a05620a414d00b006fec356aa37si20481812qko.508.2023.01.17.07.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 07:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MyKwY+Uo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoCw-0004xx-Q0; Tue, 17 Jan 2023 10:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHoCp-0004uq-4r
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:48:59 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHoCn-0008B9-Dv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:48:58 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 7so22281403pga.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hj4Q2euY+utrkP+JXzaQUcU+iG3h00AI27hYYVS7I70=;
 b=MyKwY+UonIdAFQPbKvcE7UBjAU8YkrQoLz9xbEyAtgyK36ZsSqVZCAdT4BJ+vCgB4a
 x/fzq9gHGvhAStcY9E7AXU6IHvGWdgPNuBQfO94skP7+BL5h/1+qkSq5+8HyI755oYdO
 UH9LVtlQrpI1ekEDV04gsPj0LuSny+5kOOHgKep8Ifj/1jJCQdOr5jvG+4eYiqQQTFX4
 nO2p4zXVfqE+fx/XydnnsWr0UvOkMR2eHyyTwv8O1iKFR++YdKJ6kVoOgagBKKUGt+WN
 aPqo60wzo84r/EyIUjv/ILsxWTdxsUOg3xfN5xSDLYzr7EOGXVdHC90r9CqqmBO62SOL
 QJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hj4Q2euY+utrkP+JXzaQUcU+iG3h00AI27hYYVS7I70=;
 b=GZWAraPFNHmr6jXFWyaxUrb9Ai1SyZ3UuFcaj0vjETXOthvbaDZdV8eadxZGakz4qz
 20dWXycT+W4Av0OkpTMGynTcyMrPWvOpuigoUg+PuLzawlROSyj0ISttw73stk6kkK6z
 kFTFaKuIz+/b/TxpscRNxs4ZeqG5Sagm2+DxdvrSzBjmNhdP1GvJgH4XOqzpwOxN2w+E
 pnRzLQZRccBw1+e5UppbE/sUDCM0KxPK2kBe3PbCAo1UdE23dexsJrgZW+g/h+8ZejMK
 OY60DbCwOLIf5RfTY3gFe/8388NDviY8rl5NfeGG7lPz9hzJyggbMadCWrjf9RYQ0Uoo
 7wTA==
X-Gm-Message-State: AFqh2krGZG72mSAs3bDMHue5xZgoQp/00pDeNLar4SJPP22dwfSEWChf
 lg7XHFqL5RZuBHshscxsUlrhJA==
X-Received: by 2002:aa7:8515:0:b0:58d:aae3:bcc1 with SMTP id
 v21-20020aa78515000000b0058daae3bcc1mr2778058pfn.5.1673970535997; 
 Tue, 17 Jan 2023 07:48:55 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u83-20020a627956000000b0058cda506a4fsm5867459pfc.145.2023.01.17.07.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 07:48:55 -0800 (PST)
Message-ID: <16c2871a-9e2a-5113-a121-5373d6e4bb71@linaro.org>
Date: Tue, 17 Jan 2023 05:48:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] target/arm: implement DBGCLAIM registers
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
 <20230117150405.2940-2-eiakovlev@linux.microsoft.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230117150405.2940-2-eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-TUID: ZypgiOoDNh+p

On 1/17/23 05:04, Evgeny Iakovlev wrote:
> +    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .writefn = dbgclaimclr_write, .raw_writefn = dbgclaimclr_raw_write,
> +      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },

You didn't need a new function, just .raw_writefn = raw_write
(which then uses .fieldoffset to dtrt).

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
