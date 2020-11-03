Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5080535lfa;
        Tue, 3 Nov 2020 11:41:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5F76DODtdQLzLdSyUtxxsU8+YUYEioTKv24vFGclZrjgJWFPPvgzvO6KuuxOR3lJN2Svp
X-Received: by 2002:ad4:5191:: with SMTP id b17mr29422111qvp.0.1604432496293;
        Tue, 03 Nov 2020 11:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604432496; cv=none;
        d=google.com; s=arc-20160816;
        b=dvFJNBQaCJWCbumYOKPv/UjXRz3folzsJpdvg7NnrXAbSzqA+AUGv8RTLdzHiyok+u
         xvPXzEOkmBZIr6E7m6uGb50lTgNW3PMkgB8m2hVETFWVtr/VE5UvRHePrhuWc8ZVRWvA
         JEE640/WCzrybCK2eDQb3CGfICZSd2XOaxksuQZ94ViBnzOatQ9m5aBjK2JBCmc1XyWw
         vvCs+EBbq2iSkk6TOTCtEfhDUq1AKqiJdzmR0rt54SbQndLfULSSjoYdsg/SZrZhEqhS
         UiuyIGEu22IzQAIHYMgqziACuAgfNfD81x6MyZecAeB1EZ30HiMTv1A9YT3dyPgv/tDa
         bEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9ZcnE0/uMsOY+4a+OUMWobkCPuUgWa58ZPgCxjXvr8g=;
        b=sCoOExA3Ks24bjoVj/KVdcmddG4tbLwz0j6kBzkb2euLoordnnZJ5fHC/Ah3CkfLtu
         VsDEH7/tG0LppEocZI7kS9lNfi7wm7/sEV7t8M6AROHTdkwK+AUTjQG1cfqIML8tDsL4
         ZY2fasxBG2BVnRtBZ5muoRe9ogNY0zc8EyxmneUEY0nVucxNUVhijsxevOzbgz1WS46Q
         /M9cHRKuC2nYw5elhTgn1C+vNEjk9p+5+QKnGn7xGiMtCbfOuiW91oqjWjJXKqM3kezE
         TtA8aYg6yWkx/nyE4rpShetUi0n9dGvo6zg9rNSs06lGgtQY81p9hikK8yxTukrSqj9S
         P1/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJyiUcei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b62si11574933qke.205.2020.11.03.11.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 11:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJyiUcei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka2BT-0007sS-Q0
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 14:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2BL-0007rs-Tb
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 14:41:27 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2BK-0008MK-AB
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 14:41:27 -0500
Received: by mail-pl1-x62d.google.com with SMTP id t22so9050996plr.9
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9ZcnE0/uMsOY+4a+OUMWobkCPuUgWa58ZPgCxjXvr8g=;
 b=HJyiUceiQBfReKmskgWjFsiKqlV+3+KsetjpSLDl9sOM4pDk51ff6Yx9Z7rgJhRb2t
 f/daZDamx+1+4/sr5xCo79ktgGQHc3a36axv6RBzQGnPsIJ/O0igdPSC4Lz7KgxckAG6
 KrZG6VXJvpeJilWUXfpUMo/oJYvvlINwNxpRquvqshh/iUkKOOS41BC9SEj4QuM0jfCk
 iTl4h6f4WtkaUSBERZcWXnuDZBHw84KtcynXIkTKtShrVXgIo8gRZ0SZDRUt/lJqUYuK
 JtpcE3Ke4lKRb5NCSRtX86nqDkYkPZ80ScC6xp4Y+GESyGoOpm7IwjjpsT52JF/rJ5ef
 +LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ZcnE0/uMsOY+4a+OUMWobkCPuUgWa58ZPgCxjXvr8g=;
 b=tGo2cqLfMd7opl6ze68JUuQaGnVUFy4wUUv3cOlDKTQvLoQ4sq0A+NOCfJPUg6+L2h
 rqLcCQpCaUYMKbODGs9GFRDUa49jzp/FKfFASTg+ttPMYiYJH+C0TG5ujcNDC2DdONRD
 C+azhoxWTqcxZFNV0XvkuOE3G/kX3KVQsIgkahfbptm2VI1AMzHA6cLXmQwmcRsvRjmI
 vEcs76+1cbHWclEzSBNivB/vR6ddXc1TX3OlZiKOlIo+VadoMFljSN+Zll1tqaDzLo1i
 c0PYAhPYWrsutTe5LN77ycpQUpImp8o+Xdxb5Sfs2IdCYG2c0nIouqCLS2KY41AUkGqC
 C5LA==
X-Gm-Message-State: AOAM531Q1C5ky2Q9RiQSIJX0vrIRXfUblZB+UAhcgxPXL03T243uy9Uf
 Qx3+OydJKISvjIC2AYR2T/ZvbQ==
X-Received: by 2002:a17:902:7b94:b029:d6:4fea:ad36 with SMTP id
 w20-20020a1709027b94b02900d64feaad36mr25796831pll.59.1604432484737; 
 Tue, 03 Nov 2020 11:41:24 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id p17sm15917809pgn.28.2020.11.03.11.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 11:41:23 -0800 (PST)
Subject: Re: [PATCH 08/14] target/arm: add MMU stage 1 for Secure EL2
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi.denis.courmont@huawei.com>,
 qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-8-remi.denis.courmont@huawei.com>
 <e1bca2e0-d926-02cb-c462-5e9d64a51999@linaro.org>
 <1674144.VLH7GnMWUR@basile.remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d91134ea-891f-8ef6-5b17-909508984c1b@linaro.org>
Date: Tue, 3 Nov 2020 11:41:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1674144.VLH7GnMWUR@basile.remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: MLKyq6d4XJw1

On 11/3/20 10:49 AM, Rémi Denis-Courmont wrote:
> It could also be argued that E2 and E20_2 should be one and the same. The 
> regimes are distinct but they cannot coexist. The mode's TLB mode could be 
> flushed when HCR.E2H is flipped, I guess.

I don't think so, as there are other implications.  E.g. regime_has_2_ranges.
If we merged these two, then we would have to differentiate them in some other way.


r~
