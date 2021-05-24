Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3719942lfm;
        Mon, 24 May 2021 09:51:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXtVBQSgjXEvCgGjU+VeBFSF9nrrEgs/8wkd1m5Qeo5w4rD3VVEjcsBeBQ6D4YXkAZob5d
X-Received: by 2002:a67:15c7:: with SMTP id 190mr22777380vsv.40.1621875089904;
        Mon, 24 May 2021 09:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621875089; cv=none;
        d=google.com; s=arc-20160816;
        b=MRtIarUWKIWgz7wXGvR6/tG4CoNDbUMnCrzwiOvs3vnSKb4loQ5YXbk4vq4IlTN85E
         Vo4Ecj3SD6rOYJZUU8hEWthV2wE2BJl8gDdGN+ZC0QIcUpF7ixuKi485MJaJt6ikyoW/
         lrzKI6vaVi2kiSTDBZxFWFoe0cmYmE1BXQThiYF9Qat4PkM7buuEmKMVO3dT3eWRlOg9
         U6eoBrwPIzijcnFf7xzL0uUH/yc+mQmzEUfH6TYaIRZvGJUcCq+sRezIZKAsE0dhau0O
         lScXD3hVIoMfqDSODCtFQC82K93sKzJ5WNY5I2E2u3sE3+1pUZQaT+ckUfnqSV7XnbjO
         FNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uNuQXjOZ34Ga21JSHpx/ovGuTkcgjItUCRLZQ7OO4Cs=;
        b=tS2Q0dGrgmOTGGzQb1sArZ2d2FEsIjAsZ8ulxs50yJ0M0oQYXjG1vhdFYehdDFxZNh
         7t8BvN6rELvXFOmiMDEsUVgxhwiifbYsZu1Z/t7f7N83Y3TisgSOBXAZbcAzO+jMgBIb
         jbkhQGCqZWLE7wnQ+MktTPXoVE/g2GvGxKEhSoGW5DGykzkFCxZ4WhsHfih5qQXuv92H
         4G6qnJryzTdMgAd84E/fF+wz9gnjoDyWXxdPoEHa+AYNPMjy+ZEU/y8ozAKq+4K2/dta
         PU+Xc2U4P+aE6EStGVJP2xqLan7b8G7CCrUmwkbrylPDMd1Dhyo1BNzoPobvs6r4Rbfm
         3hPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mumWcpVa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si821541vkf.28.2021.05.24.09.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 09:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mumWcpVa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llDnd-00013g-7B
	for alex.bennee@linaro.org; Mon, 24 May 2021 12:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDZd-0007Mo-W1
 for qemu-arm@nongnu.org; Mon, 24 May 2021 12:37:03 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDZZ-0002qk-Vh
 for qemu-arm@nongnu.org; Mon, 24 May 2021 12:37:01 -0400
Received: by mail-pg1-x52b.google.com with SMTP id j12so20487231pgh.7
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uNuQXjOZ34Ga21JSHpx/ovGuTkcgjItUCRLZQ7OO4Cs=;
 b=mumWcpVavGzYztpEEAidsbw3DJ8T1wi978t942bnkTyeIWbokvgxW0QLYK9/WiztE5
 DxiXfjJLyTXS5oqF+NunnzQAJ2j54aM48e78VFK0k+9kU8A1FxjjoiBTol13rgEi/POn
 h9vd5xLl2Ri/xLlM97aYceNQxYkxZeENmrt8huH1nwFDkKATcIa+J4EHwczVggVHzIJW
 EDJ8hfM9BHlDMhgZeUb37aeNTTGSZPugMYZlD4TQ8t43vFs3WIOerevH6av2pH4PUqhu
 y+ShTpWMDGHZgnHwBBzUWBNJkTlYdc1c0IqehvJvRFSmHCLka6ds7TGn+ry2rusea+Fr
 pNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uNuQXjOZ34Ga21JSHpx/ovGuTkcgjItUCRLZQ7OO4Cs=;
 b=eM/ITKECQ0M0Dq5JX1a6y8ETHwVbysD+o53/Q7t5yz6HXXK+lpIjUVKldnqhiPzOul
 pLaZ1xqWap7XEK/Md4JD6A1tuXG1trinJ2QC3VsqgoC45cDSn0zp8rCTWZB79g5ViKk6
 vr5ELymhsnF2lKWNn3lu7s3C8sNuoLtS4mvXJGyvaBHk2xjKegXoX59R4QqrPRKIwvAv
 qIp7tBSw/uCFWKyU4s4qY5jw0+k3NrwNPtb5p1HidzoEvt8gBoopqhxl9bIIM2g1TqyV
 aA+KhFE5+roRggrtK0xAt8Mbb4hHsEvSLkEbJ2yriVijxcNVSU7kuSjjAHYJrAKtoc9o
 LW6Q==
X-Gm-Message-State: AOAM531/BuL6zIZcjrR2l9bvmqbUswhhtagX4aCCMiVXYihgSHtUQLbD
 w0vUW+Ue25NTgyYh+/Da2kQLFg==
X-Received: by 2002:a65:5a08:: with SMTP id y8mr9973555pgs.199.1621874216502; 
 Mon, 24 May 2021 09:36:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p16sm5969759pgl.60.2021.05.24.09.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:36:55 -0700 (PDT)
Subject: Re: [PATCH 5/9] target/arm: Fix return values in fp_sysreg_checks()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92a685d6-2ec7-d7a7-b722-8a0c5b8f177c@linaro.org>
Date: Mon, 24 May 2021 09:36:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OYUCvcFEp1BC

On 5/20/21 8:28 AM, Peter Maydell wrote:
> The fp_sysreg_checks() function is supposed to be returning an
> FPSysRegCheckResult, which is an enum with three possible values.
> However, three places in the function "return false" (a hangover from
> a previous iteration of the design where the function just returned a
> bool).  Make these return FPSysRegCheckFailed instead (for no
> functional change, since both false and FPSysRegCheckFailed are
> zero).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
