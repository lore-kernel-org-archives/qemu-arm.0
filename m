Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp94998lfc;
        Tue, 25 Aug 2020 11:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwHCfKUb+guMD8W3jEU4TLIUsBQD5SorzZPezJeUQNiYYHvfIvFXRZ/zBoru9DIIEMQvBn
X-Received: by 2002:a25:c386:: with SMTP id t128mr17069550ybf.344.1598381177484;
        Tue, 25 Aug 2020 11:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598381177; cv=none;
        d=google.com; s=arc-20160816;
        b=djk/IdpFQHOSMgGpnssl/IPTkxdlCYOSqCFRFzrXISQzJtpILog33H8LUgTjCb9X6g
         dvFBGBwPMIv12tsRlkA6H4kX30lF0leRaZs5JzsaU9OJtBoDVTapRDAhGb8dN+qucT10
         aKWAihzvcT/E7tOJIBvLtdEjy5AhdOAuNblwkekV21JImd5xCCDfFXw8w+Ddu8+py7hv
         hx10JCJ4AdCA8mqCAgB/8c6oLT8xo6s9503NYrRNSq5UOAhFdFMKwIMLenZ8s2pEWo4H
         yzhblWj7HkmxtLPyPc0Dzg04mBdj6j/pE0VDAqINoTomp36XHKgSE8evu3PWu07HGhg4
         tX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GYeuTU215V4fkLhzsMXlj/DA8b/3CJKxXhtBc+sIQJY=;
        b=fykZhsDrkHwNRHFQtEyKzVdsFM66BJQ9/rEOVjgdwpB836netjZm2fUYTH5g+ps+H7
         I3NojuKbEGtYJHiVBPqttciG9J6iYFq43ZIlBjWFmy4Gk+TBL24VOQzDsQareooQeKoV
         CCJUZMBh3BoWY3ObKA4FgOcStsNtVm94AWFgWB1qm0Vj3DPhUkzq21I+Da6Y1YZ9/U2b
         41kKdHm/HDrdts5UDx9t2OxrsGU0YHuw8riM/SI3VQaVCex+Q6WsOFDYqiEvh9bAO/QL
         ZWBC/v0xheH8E9QiqxouUWLgPIafvOX9f0Cyyx4DIASDjfi0tn54pBnPJeRzz9TwIyqR
         Dr3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMICxFeF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si15661086ybp.144.2020.08.25.11.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMICxFeF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdxY-0003SA-Pb
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdxA-0003Ql-P7
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:45:53 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdx8-0001Rz-Bl
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:45:51 -0400
Received: by mail-pg1-x544.google.com with SMTP id g1so3648551pgm.9
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GYeuTU215V4fkLhzsMXlj/DA8b/3CJKxXhtBc+sIQJY=;
 b=RMICxFeFQVW3W0NwYsHCCPBdRgjZwrHkLDezOl0/0DdIHQ1ktR8WNuliBSHXgFP3AO
 5qLmRMddftUIjx8oFKKRKl+KbQUl2C6QDKE7xPs+vNiKHXHh/OVGdnEWcuBP5End4qgo
 ZugoIaPp9V2xi2OTZxAJXV9ZNUT7ltfPxPXyFopn/1F9V5eYcYSNcaymKCatABLxo2G8
 LXgw9vL8GOUEIG5YB1are9c3ACxXqA0uOXV7rTabZtcxb/01FqM8Z+wZD+wJwa38b1vF
 LM+Vv+VGuO1+6sW3isyOQiOSwMu3QszqcML8oUnKghSTofifOaM3fUfi3VRVKbtzWFGE
 FMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GYeuTU215V4fkLhzsMXlj/DA8b/3CJKxXhtBc+sIQJY=;
 b=IZKgcr9igCMOXdfBQTv0xU/OepoWAgonilDBU1XW7yL0y/hvEPO6PSufHUim8TDrGB
 gOb1XoVypkfJmqQVt2wCMCv40otcvKfKrr0i9Xq3bGGgZDN0rXH9cK9AuUZ5sRnbLTz/
 51LIr5rZ5d1E24jaJ/bJDnn5X7p204w0RbhzCZQIY8x4ddpbbyMIlUDguNtrXYIW7WuL
 pGTO7fXxjsC/p/rpYwJpFaNx2XQ2FuB5BGKDgxHOIn1AeM9Xt357bpQOJj3LLwV+hIDg
 0QR8S2RlBFrVbgzyy5/NDl+HWKxmxx5WhqnOoCe1w0zQrAUDS2SzmeGOycbGGuHm428E
 qqJA==
X-Gm-Message-State: AOAM532lZ73FY6QpTM8xwRMivjBOPSKV/imCTA7GgmkIfgY6G2tv0iO1
 sLJbX87t9o9Ak2jl5KJvX7Tacg==
X-Received: by 2002:a62:e704:: with SMTP id s4mr9249033pfh.177.1598381148227; 
 Tue, 25 Aug 2020 11:45:48 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id o9sm166708pjs.47.2020.08.25.11.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:45:47 -0700 (PDT)
Subject: Re: [PATCH 12/22] target/arm: Implement VFP fp16 VCVT between float
 and integer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7403253-be9d-0003-fcc5-878ebf26c2ff@linaro.org>
Date: Tue, 25 Aug 2020 11:45:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qlng2snVuArf

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement the fp16 versions of the VFP VCVT instruction forms which
> convert between floating point and integer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp.decode          |  4 +++
>  target/arm/translate-vfp.c.inc | 65 ++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
