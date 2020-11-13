Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1740499lfb;
        Fri, 13 Nov 2020 13:54:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxww7jiQUgro+Ca5dNPeG7Yg4qRo7V0ilNJIn/fYMVxqzQBy/l0xEJ3WzLVXO+1pg8TxLr4
X-Received: by 2002:a25:b316:: with SMTP id l22mr7576954ybj.395.1605304484122;
        Fri, 13 Nov 2020 13:54:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605304484; cv=none;
        d=google.com; s=arc-20160816;
        b=I28XAUlQsakseBKRelAvMBFg0P5Rna0BA+UKFoVZghNolRUS4TlwctENKzDPi91sE4
         87aFKyTnDn68QxhaOaFxoK99uEfRhrk1Nb6E25Mgn7MrFeslobECGjyfiKSNgMQCGIAS
         2B6Zc4nyRIIhMtSQRX/HneXB169iErxrcEJM/yvs52UfJA5Gbnqbm4CLTLNfOqsU1cvz
         IE5CvaEPyh1zbTRagiltNhEYlUSHMRNoz7/pT9chKD6KMhxVHh0qVqbv5MAzEVpzSm+k
         8x0zTwwbuC2idB042TT6RwnUiUANGWzobEiBSvlDGuX71F0kOF5ayU9JjfZi92FCj5D+
         K7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/KDwDwPZ10fx3D8quFHTsGGhNP/WVt6JhdufgI66SSg=;
        b=cdx76lOKmkURYBVdgBlS+wJgloy+r6t711+JlwmLw1xy+i7PlP+arlICBJsLHtZhvz
         Ad3+8V4oT0jlBRdWqwmif3GlMWFR826SLh6fRYHlg5jtDFkwF5pWu89gxHCzADsnyTUZ
         MC8V+n3x+QpjmDZSTY3Dg/eFYdphiP8lTwYupT+7OkJT+y9rmT20wmkF2LS1Jmn6C9tJ
         oHe9ekPxlvcDVIaYAoK5a9S37O1Bf7kw5hBwUQpmjuuyUtzsvzBqJN/yUG18kADlZOdc
         yKtesGzH2H+dk4HRQGpTeEUCNFr0vCOgkWgdyPtpjXzOPfrM2He3kO7nXrjOwTDOzan1
         usJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XHG42vhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si1289569ybh.182.2020.11.13.13.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 13:54:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XHG42vhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdh1n-0003Dx-H7
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 16:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdh1a-0003DF-Vy
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:54:32 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdh1X-0001aX-Em
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:54:30 -0500
Received: by mail-pg1-x534.google.com with SMTP id f38so8197792pgm.2
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 13:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/KDwDwPZ10fx3D8quFHTsGGhNP/WVt6JhdufgI66SSg=;
 b=XHG42vhp20Eub3Iv0H/PIPKvVlmk93fVwaWgYcGki/YKepIE76saKW+to6ddeLXM3c
 NyJZt0C0Foz9DJ5JRvLqkBWf1LTTTr/ldKrbWAu/lmo4MOUrO08S3YZVjDjbbkOIf/3a
 NFvbauRLJ40TXiE7PAHct9qsM8bGWLOyGy3MjY6fqa4zN+w2JuDJZcoF0Fvpb1ECMeEj
 AJyGAP3+mnAIH6+WtXDrVbUwuR9kpP6xalxYkkYzavbn3DVh2YY0+awEwPSqUJ92Vsxr
 N2P83ILmFu7yNB2VYb4nUnB2YUa/qSpRK9DMHNKfvkgQAnygJZI2vSQYOFIMnOwGjpj5
 n2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/KDwDwPZ10fx3D8quFHTsGGhNP/WVt6JhdufgI66SSg=;
 b=YfQuddtNot4wEuncK7EKMtgwhZZxKBsdm76i6R2IPKY+Hl6t4nY2bbpDReLdbCJI/d
 mA0kuklTT9GCGVcUV6RMNL/5K2pPvkjsSOjGqPn5zqh2IhGpoUwtsWmSdBOZhaFB0cxg
 4Ws5YNYXDp4pmNq36o9KHbpzWZ6lWNMvh0/ryhgajqWUsaJ5iuimF+t2WQumW3VBtK7d
 y31gog7mxcmuvsGBPzWFYbDifKVQqVS/agGhKDkvV5yaLtI1QX729nFIsa5PCgipHXTa
 03nV+7rUrvKcDC36Dspfrewu12P/SCLhp0cRTHTXH1wYsMBDd1XQv5aIHS6CfL5bXcL2
 dtiA==
X-Gm-Message-State: AOAM532D0L9zmOnkcbfpJghKbX+6+kg1XSeTHSre4yjfj73vnqVK5nHy
 xlSPJ8d+QKM2xr+JqfxA3TyhS8pFq8UjTQ==
X-Received: by 2002:a17:90a:a104:: with SMTP id
 s4mr5164750pjp.60.1605304465536; 
 Fri, 13 Nov 2020 13:54:25 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 15sm12051782pjy.0.2020.11.13.13.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:54:24 -0800 (PST)
Subject: Re: [PATCH 14/17] target/arm: set HPFAR_EL2.NS on secure stage 2
 faults
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-14-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc4e0a70-872b-2e38-1af4-62b44e355c60@linaro.org>
Date: Fri, 13 Nov 2020 13:54:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-14-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: qaTUg31SbJXr

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> @@ -3444,6 +3444,9 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>                  target_el = 3;
>              } else {
>                  env->cp15.hpfar_el2 = extract64(fi.s2addr, 12, 47) << 4;
> +                if (fi.s1ns) {
> +                    env->cp15.hpfar_el2 |= HPFAR_NS;
> +                }

This should only be set for SEL2, not non-secure EL2.

> +        if (arm_is_secure_below_el3(env) && fi->s1ns) {
> +            env->cp15.hpfar_el2 |= HPFAR_NS;
> +        }

... like you did here.


r~
