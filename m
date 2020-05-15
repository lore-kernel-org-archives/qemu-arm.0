Received: by 2002:a05:6214:92e:0:0:0:0 with SMTP id dk14csp152264qvb;
        Fri, 15 May 2020 15:33:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoF1ZZFKDJDASI8odk6IGApISJ1u5hbE0jhRSqu16QJLrubX7YFlAc5H3RG4wXbduv4bf/
X-Received: by 2002:a37:a753:: with SMTP id q80mr5880823qke.492.1589582032175;
        Fri, 15 May 2020 15:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589582032; cv=none;
        d=google.com; s=arc-20160816;
        b=t43mzvOflN6kspxDaJjUwfFN1ZsfQh524SymtmXut04DJDF+kOi5v3Y+WS3NbUX83Z
         A44G+3/4AK7bhYj1DcxDm4tsJzsl/7OG+eh3Nqtd5RpztrqoCQhfQKWvHQZcU3LJEn/L
         G2pZeWfj50Yux4Fetp3OalDk+O4xVJrkg1XdjCL4hur5tj8n+GsyIeXpyorGRs2FhNBl
         U4IJA3ZYajzQtrAkbDFoDHkjO+M0cV0daR9nfs0iY2IU7Rj+rVzhF4urVisCMIvWSs1M
         Eu7RfulPwJ0xVOE+dN/y7mZhLXm4b1h1z7klA7KJQeEwird6CQo2MhiEFZyfU+OV8ucO
         lVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=C3jzRQ2lc33ZEkCVnum/KVNJe2dNst6uUm3942B3BRY=;
        b=YfMDOFjSFwtmPoeTF67tPqJ/4wFxtahSQX8GwkaJuK+byraOj6K1c057tOm1AaLZK0
         6pWok/F3NNG0D+UkU92Zrc1u6ZulfkSkyDymspG4IKE7aNywBCo2O1SpD9zgoApy3olG
         FUKss5MiLdE9I+gJ5QWdv/H/UpjwaNQOb3E2XbJ3BTtb5r7KfPcs08NhAmq1DpiXVGFJ
         xZMTYg6RM7ooBVnrN5CZNHiZMPkZ2AWFYJvG1zvEe9dnKr1FgvRDxS3g3VDJQCykVHMR
         iF5JgqFGS86m1ngxJ+Uq7srLtbuLvhgTflxJvAE1wPe/T/bLBOra9vQQGN8z4aDXCwI3
         UCag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7YCYvm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si2037217qkf.251.2020.05.15.15.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 15:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7YCYvm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZitr-0003ky-NJ
	for alex.bennee@linaro.org; Fri, 15 May 2020 18:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZitk-0003jq-48
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:33:44 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZiti-0000uJ-Of
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:33:43 -0400
Received: by mail-pl1-x641.google.com with SMTP id q16so1493271plr.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 15:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=C3jzRQ2lc33ZEkCVnum/KVNJe2dNst6uUm3942B3BRY=;
 b=O7YCYvm0lEYetispI6xcgl2mp9kAhFCIIu38f08Lj+pdXnHCxbVCjU9vjFuDFHuLc3
 1jx3fo/4S8bo9X3Bqi5up09KIa3ziOgiTke58fgA/JNvj8sFQc0DyuFAFBc5MxWD1Xoy
 XOr2rDsa5fA/UbMbFHObV+WHez2pAXUi9uXpnkCY+8LF+ZELjg0DUizcY+EUDahmL+gX
 Sg0W4IWu60kSyh9/1xjW8DpwmQvQZKmOAnicZMEP2LVgbefM3Z+yMb3Nzp1fwWy3/YN2
 BTif71vjiV9iLnOs0lJmxF0AUDxdCMK0hEa6geDV2Aroitack9rdUfKGzqDv4JhtUqJY
 8Xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C3jzRQ2lc33ZEkCVnum/KVNJe2dNst6uUm3942B3BRY=;
 b=iJVy7Fqof9KP6MuWQj6Z5qgGDn7bXYESagH8t8yyu4xGIQHs4TBNUnJUMJwKe+dkgr
 ZzYf61+NVDU4ofqC8vmvEwyUUPWPMQ2/3kWEEasbEeGFu08QvwUXS0ltSiGobO19OOj9
 QCC2FAiR7+bMAK/hdku61dPtpRvVDMCdaNSdqK0MqpWwAhcrWemve2OU5ZEIT64iiCXW
 Mz4i+8VDY4BJJp7Ae+lmr+vFmJGM5gpuX4OkNWs7+g2X4jXRVrPTQEQC218mzRkexVQR
 HbpxAJwgn1BoBpppPEyQkV8F48egCsurxWxeYyuFRc5wJFZOoIGRBZ6P75RQjH3o4LIU
 u2HA==
X-Gm-Message-State: AOAM532Bs1OPoSZk0sHlfCyoDEVeOrxp7ITtVMK2mB6m2S3ywkAIvRXx
 UAQVdJFM3IwLe87SiB4YFfyhGA==
X-Received: by 2002:a17:902:301:: with SMTP id 1mr5590450pld.65.1589582021025; 
 Fri, 15 May 2020 15:33:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 140sm2730923pfw.96.2020.05.15.15.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 15:33:40 -0700 (PDT)
Subject: Re: [PATCH 03/10] target/arm: Convert Neon VSHR 2-reg-shift insns to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64785172-4e44-24a9-f965-fcff3f61d364@linaro.org>
Date: Fri, 15 May 2020 15:33:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: xY7Gm/xg3ZV5

On 5/15/20 7:20 AM, Peter Maydell wrote:
> Convert the VSHR 2-reg-shift insns to decodetree.
> 
> Note that unlike the legacy decoder, we present the right shift
> amount to the trans_ function as a positive integer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 24 +++++++++++++++++++
>  target/arm/translate-neon.inc.c | 41 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 21 +----------------
>  3 files changed, 66 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
