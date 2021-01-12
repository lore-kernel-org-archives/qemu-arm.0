Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3088021lfq;
        Mon, 11 Jan 2021 16:03:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5U0JdYCnLyOSDLhSDSu/q7vYSCMPA2YGB7QotR/5mNIW6ysURevfAWSG3WElC1C9329+m
X-Received: by 2002:a05:6902:6cc:: with SMTP id m12mr3051076ybt.56.1610409781204;
        Mon, 11 Jan 2021 16:03:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610409781; cv=none;
        d=google.com; s=arc-20160816;
        b=o/cfGEMZj082+Ex3xHbOBoWuZnvQl9CpAL3ywl6haT54ZqFN6uh5PHb8AGTAkm4Ye2
         jpiixrNT/N5ojMcqhV82GSBvMv4MKdhRLQNBAJebsbxuVRk6Gdd0vbekLQ0phas8LTLB
         aB6EoMKM3iUhnPd3PjmHfNzOGtKGrPAuA/YJtwJQtu6UXEKrYDwGUwhdxducdaIW7uA7
         GTs1xURlxYPKUSih0KmcQVFvsYKcVIM3c/Hl/RP86cVsllkx0b0H/I0gURB5EPG4cHXi
         nrt6ozOmmwMn6l44QWCTlZpjuewb/IiVudfYkdSv42n5N3oZepKqnaI/evFJutgLsNix
         VUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B/xCcpZT7AUXqjxug7629sTOGA9CVKu7LttJVCOlUIA=;
        b=w3DHRnaNaRgsekcXi7o4plIhAaW5jLHpXfnNjlgjA6dUnYr2pSosMefsQyfd7BX9sY
         0LUCIUoi99sOgr9VH3k+BH+ajRGFQOI+AbBbdkzPXqR5g1+zVMn3bsTRbFmrQNhL2zdK
         GJfDWCeaBLCp+8Zl0NkrCN15o8GfsnA0JqqPJ8gKv9ZwYvNGTIafrlyN0U+7O98lP28p
         JuGXEBOr/iW14Bt8YXuzjlYmBMXreATzC4H+DqlSRNKWCDarXar2So0iijpWEqJKoOVj
         bMnZusEr7f+uvJpo0J7VAuFhB06DGKc7zET28uiVKGJlq05ryTevjw7HFQDC2dHHV6db
         ZcoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kVCWLw2+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f85si1141417yba.418.2021.01.11.16.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 16:03:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kVCWLw2+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz79I-00012L-I2
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 19:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz77q-0000zJ-6E
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:01:30 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz77n-0003zf-VD
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:01:29 -0500
Received: by mail-pj1-x1032.google.com with SMTP id lj6so511611pjb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B/xCcpZT7AUXqjxug7629sTOGA9CVKu7LttJVCOlUIA=;
 b=kVCWLw2+wCRJL/4onzNH51iZQ2xzoRexl/IIRwQ52OEk6ZbCOi1QY+OEUZQbKDRk8l
 wh4Pn0yY9rahV9TXsAwseZdXGKYaUzd3emfQ6SXsU1pZQuSkweh4JAUBmLrymDmB3bnD
 27l9//Nu8KSuV0xWQhatDOk0fHDmoxhrJzl/pbUS83v4p0xDELlFT5bYImTzyHLDyS+l
 4ymu/fIcWNesA3TfuYJMtriPqs5hRxUcmB3bbxyhwFLJEEIIli7vZ0F+N9fmPUcgdACt
 H/Jh+g7WdKMqPSofDBohnjh0RYNJqtMvoE/mLd/n9dMPYBWsZKU7oXN8tkMVYoasMD6+
 lAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B/xCcpZT7AUXqjxug7629sTOGA9CVKu7LttJVCOlUIA=;
 b=ma1FidLwVoXuwRltVEZuFCYuggE/mv1odSoV8I/Id4w9a6RlZo1P2BFx5DyG1oP9Od
 FtnR5WT32nIgZ4ooSAHylCgg/cAVpijqKhB9iyZZEyIDEoIxklDBiDA5w3f+dc8HYaCd
 b1nVqhs69Ln942KQksCNemt2Z9T7EMADAwE1r9ipm7BjiyJX26sbIud0dGjEyGvIt/I8
 qz6UtmYRkarR37RszBjfhTp2DWV2Ypo6A2x9O9EM2DkMc7AjSOVETPHG9ZnMgHzuJkBa
 DB2CkV19+sH/pOrfuqRjdemTF3E5KhhULtIKU3R1LUN4el2uX/puYdR6ZwkaE9p98Ju1
 kXwg==
X-Gm-Message-State: AOAM530ClLkNTyB9qXLT8ySDcHYSwOjBo/00RfZGAHrCCYesGcEO4Yyt
 +/5+VgOgamu/F5Q/zUBvn0VLsA==
X-Received: by 2002:a17:90a:ba88:: with SMTP id
 t8mr1364626pjr.229.1610409686410; 
 Mon, 11 Jan 2021 16:01:26 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id b11sm778926pfr.38.2021.01.11.16.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:01:25 -0800 (PST)
Subject: Re: [PATCHv2 2/2] target/arm: enable Small Translation tables in max
 CPU
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <20210108090817.6127-2-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c89d84f-ae3f-d888-51ad-ed01cdcdd833@linaro.org>
Date: Mon, 11 Jan 2021 14:01:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108090817.6127-2-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wke+cJllFXI/

On 1/7/21 11:08 PM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
