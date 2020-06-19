Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1046244lfm;
        Fri, 19 Jun 2020 16:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw65WLlm3bBCwL8VcQ6XyjpURiBjb8By43TipozBOxcR3iZp4Lc769kaiGk3palfhNxWNHj
X-Received: by 2002:a5b:5:: with SMTP id a5mr9058144ybp.514.1592610168350;
        Fri, 19 Jun 2020 16:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592610168; cv=none;
        d=google.com; s=arc-20160816;
        b=rJvpxR897G1aG9g9lcAnsyz9or3BOmkQ778GVBT4TpDER5HRGvEu7sv5nBp9H5VsPq
         O/V7xl5FNBHi1M7BJyguxEcf7nCuaP7hSCyMuWx5Vg/UGOF9hUOCHebvdeqSY6ZSxiQQ
         UkXO199bJskEDl1nMZCd4j68Q9iYnaJBkNC1Q7A/vNiUbyE19izm6sQIDLwlX2d1x6an
         bGktz+fOW1CrQPfji1PRT6o8czc933TB5VJOHygZdZcpL9F3a2ogoiKXg6Wt0Ck2C1NN
         y6Vejdzc81pEMemYdic4K+lpw3IiOcpsPqWYQNfkRpmFboJbjjecDWwnka5BRMIvdH+8
         4Hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XOI2kwt29wClvWAuk3lMsH7YdUKqoH+8D28hALbRyJ8=;
        b=hO4d3LVxbbNUbsgNIDBPpE7M2L/ROfEZVv6DHpGHKJbYCL/LR0JTttb5XaXsJsNb9P
         WRqf5i2jt//CX/6MGyhvA7c1+CGV3uZk15Mza8yvvbvVswJnQPcMiXTj6t+fJk/2w34M
         1Vd71jkx+FnDWI8yRtwkCSaFlpjHrdlFwpZXhS4rQcwUQzPefg2BEOb1024l8hPU8Fv6
         djarA5Uslxl2hD6ZqEH7H6FZV2JS5WlBRoYdXzhyFW/wP3byq1RELM5vIknQFo8wmNUt
         x6CEem8/0ZP4KGuL9Nan5RfwSitopOWGZ4Ij4smHqrf0DVFChr5NH7Vg3i7KPJ/4SYDK
         DTDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tbI103WT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e69si6426241ybc.305.2020.06.19.16.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tbI103WT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQel-000702-Nb
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQed-0006xY-6b
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:42:39 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQeb-00022p-HQ
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:42:38 -0400
Received: by mail-pf1-x442.google.com with SMTP id b201so5165501pfb.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XOI2kwt29wClvWAuk3lMsH7YdUKqoH+8D28hALbRyJ8=;
 b=tbI103WTz4wy2HBK5Oh4U8uWcc38C5YsX2XPE37rxZH2M0SXOjEMrqJ89M8O+Ef5rT
 WRFiWCqszMCUG2GzbC0AFHoXZoy9TDXYDUBQMba9t9Y95mEs/1Mv+tVGrouYn2b1vBTV
 MVJCeztokZZZrd8zIjPXC3eVIo4WpCn91zwdIZWzfxSKRKK3//3bwCS42YlkR6C8asEq
 N+vBGJ9fjdLDllSoATZTDnRPvLwTRp3vWmZGnnqfgHIKWu8ynqfGb0364piiIgUDxW5v
 BDMMPrSPpO6Vz4HFOmtqCh0SAPUydOSivQ0bmmvEFQufLvD6KpKpcAYqHXEo6MMQvlQy
 i68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOI2kwt29wClvWAuk3lMsH7YdUKqoH+8D28hALbRyJ8=;
 b=KpOgLxj7H5Sad760lek5Lk4q28pNnnWVIuTjxydWuKCtdQX9BXf4Jg+du+BMlkBHDq
 tGEyHLEMnlK1zWVI9chFRNLkgbq47RigYVS1HkNQN1XU6pzTOtQyy+9bGOQq+0W5MLRg
 Bhwe7wa21PN07IIWIdJ/PK2cp5OyUymqzqkdHoTUT7GbxifOssswrAJ61mQsVMI5LQve
 A20Z+YckCk/ndH/uZ/r8EORkAHnya937N/dkG8TGr51qvfwBhkfIr3YJCsBHuDCrreTM
 dpcy0f3/eG3aKkt4XT0N1maJkI1LYeGGCjKJfnyU7P0sy79gUaposQqswczmZZ+P6sre
 Sobw==
X-Gm-Message-State: AOAM5312P7N6vOCVjIsewNA4lMfelswvnPtXnBrp8AwJBl2oLtzKugVJ
 F7Ak8Gs1M1qqkXH0GpKgLWvgYoN1UXY=
X-Received: by 2002:aa7:82c8:: with SMTP id f8mr10778001pfn.165.1592610156076; 
 Fri, 19 Jun 2020 16:42:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p11sm7008657pfq.10.2020.06.19.16.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:42:35 -0700 (PDT)
Subject: Re: [PATCH 14/21] target/arm: Convert Neon VQABS, VQNEG to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <50a94495-17cc-f56a-351f-4c0a9e58be42@linaro.org>
Date: Fri, 19 Jun 2020 16:42:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: uZm3vSMmDQ1E

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon VQABS and VQNEG insns to decodetree.
> Since these are the only ones which need cpu_env passing to
> the helper, we wrap the helper rather than creating a whole
> new do_2misc_env() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  3 +++
>  target/arm/translate-neon.inc.c | 35 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 30 ++--------------------------
>  3 files changed, 40 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

