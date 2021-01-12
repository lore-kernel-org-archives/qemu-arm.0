Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3885357lfq;
        Tue, 12 Jan 2021 13:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEQq+B5hjnJx/lG7BpXCmPPJml1SlRCoLkrhh88but754Vm2Mz+RG0uhMMJAivP4RgbJUa
X-Received: by 2002:a25:aea8:: with SMTP id b40mr1949366ybj.347.1610485441902;
        Tue, 12 Jan 2021 13:04:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610485441; cv=none;
        d=google.com; s=arc-20160816;
        b=Kdvq+9AAEXlNWzVblF635lGTgBc5/JbiDp9Y1RHZv4pnx1nKFoD4C8VdWDbx053wU0
         gDg43vVX+YXtU1WPcFphKkbviILQhVuDzFNt/glbBgUeOxGrnelqFcwQRd1xzk5NLX39
         XDt1M2raAeo7KPmT9BEGhnl/Y3uRXrvfpua3hL8H9ifrYtFL7g870qmXA0aeugh7jeyd
         csvfg3OSx2aQk3V/IpmRdc4YiCZuk8cJW9BVLB3bhiaJgGu03m/MbzuwXnKkk3Cva0QB
         +K839TPW8rasG7VQEw6HxxIRbqmcLfa9VPpzOqrMN8zx3VCO5p0ir0zr6P5CpRrRE1QY
         WIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ij1bGkqoJJMpf52GUDQp7vKgAGhOWr/gUxAAsGdkCpo=;
        b=QXMpzpD4lAYxTyRgFMySHYwUBp82qBFBp3zip6WhT5z59+F1tAeTsF6z5pGG0X2GZq
         /PMkGkiOdEb6xzWRaQu2VGCPZy5vGxiuyXt6DovB7toh9a9rxMCDv0Vm115LL2MBYM03
         AGS+7CLgo6i+75ZvmFAL8HeHRXg1OHTBh34HXqmVknm1bOR0eORqH3ENNNEzPKuG/eGo
         P6+hppFisxKLY2nwrjzLMbywOn+tldTjFHpTqPCEM3JnseDqaAwdSovdH0dFZiJdbKjc
         BQeKO/5UcYjqp+gBNsbO4q7PyET/0Lqf5w4wE1swWhYDCPziycxCIDlmDS9709tvMulx
         CLAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uyvk4Pqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si3347042ybj.218.2021.01.12.13.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 13:04:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uyvk4Pqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzQpd-0006Km-7F
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 16:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzQoJ-0004a5-Dv
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 16:02:39 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzQoH-00080F-KY
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 16:02:39 -0500
Received: by mail-pl1-x635.google.com with SMTP id g3so2103220plp.2
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 13:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ij1bGkqoJJMpf52GUDQp7vKgAGhOWr/gUxAAsGdkCpo=;
 b=Uyvk4PqfHzMci7of3y19jT+azlSpVLipBvD4VGZBzhj46723EYkoFDwW2ILo6mTIdt
 KCy9sS+FtW2uJvIghyjck37+MElZZF5ifM7yaWlb4W9llj7dJ50twY1VkfYwS0m14iap
 yPNg2ENOLspqXpZ4Hycv/X7MQ1Cs5U7plwFImPqL7Sky5ZN7DCGjss16M7xvL1fvlw3J
 F776ySf6vFD3XZNoaBm1SIGtVQSCT2oQrcHDsLx0tTsQsTww+eNeioujfbxOxkVqNxxc
 69tv5q0XrSt7GYYtZwUQ92ImOPBTw2oTk1KZ8DathDtMppoubRgEMeFaeCS89H1T/F7W
 Y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ij1bGkqoJJMpf52GUDQp7vKgAGhOWr/gUxAAsGdkCpo=;
 b=pUU4HEREBAWcfLVUWuP23fJwvpVokaqxo32sh/aLeOqPWFcuo2Pu1wIuYMxFK0XihV
 dYUcNOD3xmWhs5mpEjDBTqkM1DC3jrc1llwQM6F+eeF9xHU5g7gz6723mCXUoNXSYRIu
 EuOOnRrPTMWmhpk2ct6myEqk+Im5Q90miUQSWNB8Ie9Sl/7L550dNNZZmhlK3Pui3k6M
 Zj7G29fqlR150UCq4BKGzTFLw1ZR+4W0Gl/qaWVF4SZPrk/889IuA4+6lGaLIgQJJLr8
 iM5Wi9wdTOh0f2w55knWVLLSScFd07FyS9SShDH02yCwYeczvGNEywv9M0vQ3Gona5ak
 emWQ==
X-Gm-Message-State: AOAM5330IU7qAhwiNTWYM42Q28Z9CJZQaeBLyBFCYoEToH9o0nrdcyhb
 PAinvN5J6EtzFQ/rJIxdtLa8VA==
X-Received: by 2002:a17:902:8ec1:b029:dc:8ae1:7a22 with SMTP id
 x1-20020a1709028ec1b02900dc8ae17a22mr1286320plo.6.1610485355982; 
 Tue, 12 Jan 2021 13:02:35 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm3971950pfb.196.2021.01.12.13.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:02:35 -0800 (PST)
Subject: Re: [PATCH 14/19] target/arm: secure stage 2 translation regime
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <12681824.uLZWGnKmhe@basile.remlab.net>
 <20210112104511.36576-14-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a1c73a8-865f-f18d-ebf7-d736d5e7e2d0@linaro.org>
Date: Tue, 12 Jan 2021 11:02:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112104511.36576-14-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //eyskElebTN

On 1/12/21 12:45 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
