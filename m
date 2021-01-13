Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp629171lfq;
        Wed, 13 Jan 2021 09:36:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2GfnBdDfyueBgGPzFp3Za2/HeobJr/xWw3gBx1BkX/9mod8gdhYmTo9cXXvYMcqvwDpMJ
X-Received: by 2002:a25:3104:: with SMTP id x4mr4827971ybx.141.1610559401013;
        Wed, 13 Jan 2021 09:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610559401; cv=none;
        d=google.com; s=arc-20160816;
        b=nYruKL0uN7xwegU42CAJEMxTVTTsDhqkXFK0uwSvEly+zHm9zzItZK3PVu8P0QhSHu
         nLlY1R7RDQq9mdzga+7s4HKxRoz8gsIX57uSXKwmVgGJf/6fB11486nAvj2zIVdjp7Cj
         u7WivWJ+WQCmz0Ec1ZBDc2Q9EmEaRBC3jZrRyDgWMQ8tgwvLw9mG11IvCCuVlZ/qlO8l
         LHXX+7rLAwkd83iy++CimTILBiT++Ra3PxqjObwh1OJe8iUI/Ev8IvYYgq1Sav7FbaW2
         QFsBpc5fBK6k1Svu9pd8UkPAfUT+Hc8h5Jmvl7bM4gDJZoGQcHcuP/5ANPsAzp0Q6UKF
         Lw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LMvWinS/zxCekTHUcnqjoO/VJjlw17h3HAuR+PFa4cM=;
        b=fPYkDw8yKcgXeZYQq7tuCgAlx6u+I3gxq6+fZC9OXoTursBBMd2YUs7IMet6Pyj+rk
         RgkHZCJaKQ9+4UdFTGdAb2ZiViCMdk1Qxhn4VWrQJg2mpcba0k6dGMgy7knoyXD+09tQ
         bvVqvDASIPNkM9oMSMnM6AgVlOVJudPhmGpHHJEp8GAsGW1GWemviES6Qu1j1aKdMLjH
         xLJedBbu2iwL0/AaEF2/WFcG11G6O0+t0Caj9a4HSwUkR/gHo4KUQYP7UBGdkB6f1XqJ
         YsnhbrrnG/4+3HoiHKRDi9DXZ9JAeo2QmB6zJAE+SH1Xw7nU4cLhmDen+uHujWvpsy/c
         6c0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4+FF+mg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 145si2406871ybn.79.2021.01.13.09.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 09:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4+FF+mg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzk4W-0000cm-B2
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 12:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzk3E-0000bB-1s
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 12:35:20 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzk3B-0001AW-97
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 12:35:19 -0500
Received: by mail-pl1-x634.google.com with SMTP id j1so1470300pld.3
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 09:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LMvWinS/zxCekTHUcnqjoO/VJjlw17h3HAuR+PFa4cM=;
 b=c4+FF+mgUIdIJCiZVr57k3vkhiBecv2vsqvH4IX8ZkVBfVFUN3M+AuoRIVLV1W8jNf
 6MUZUJlCPwkOGPlaYsaZG705gcAOWjvOTMqGckNAPp4kofBO9fXCrbC6eQGFlueb6BHl
 xArulzWsGl/iIutjMNIcUfFnrl8RoLKjj2eCY9NFHxMffpgC7nmuYQVB/evQ18DZF8wJ
 Wv1/iMOxwdXnVhPS8YqnH++3k/tsZnVDCnuwepksZtWgCc02jXlrMKDkXXfczdp9aaL0
 rRHqCajs4qoIc35ELt/GGlwoOvEs+fQBdnZlVZO2VmvHzPpbPurkfRRe0q6espNRS7N/
 eRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LMvWinS/zxCekTHUcnqjoO/VJjlw17h3HAuR+PFa4cM=;
 b=VyQWv/ozJuTA7cCp4+ictHc6ZvqDNzyJ4k4OV3bwGEfDQqz6niqx9RwoJ9viSab7N7
 ufx44GAbaWM9BdRy5LmU9rEDulfZn0JeiRa0Y16K3J4KcZCY3QXfMfUc/jH/4RLNNCTx
 tJ8wCKFtLW6raB8oePsrfQaoPJzweQ1n7vl852lSoMBT3J/fotF5BbEulF859UTT51hz
 wL6hR3coeWROul/toh6+SsMBup7T4a1IEe5JaUevMJ+n4SZ4BrjDTpVprdEm3CR0psJS
 z7NnYO7juwIwbB/xKnt2pWE/c5ZhFRtE9JwQ4vnUED20e4jRrGobdbdPS+1dhrm8dUz0
 Kd2A==
X-Gm-Message-State: AOAM531+Auu5deO+x4jUKIlGk93wwoojkndUTsX1rkpRHBbfPmMe7s8G
 CuMmo3MKEJFy5+iUurVad4gWWw==
X-Received: by 2002:a17:902:6b84:b029:dc:3423:a24a with SMTP id
 p4-20020a1709026b84b02900dc3423a24amr3505035plk.31.1610559313723; 
 Wed, 13 Jan 2021 09:35:13 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v3sm3716764pjn.7.2021.01.13.09.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 09:35:13 -0800 (PST)
Subject: Re: [PATCH 17/19] target/arm: add ARMv8.4-SEL2 extension
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi.denis.courmont@huawei.com>,
 qemu-arm@nongnu.org
References: <12681824.uLZWGnKmhe@basile.remlab.net>
 <20210112104511.36576-17-remi.denis.courmont@huawei.com>
 <6ffaca60-2fa0-ac7d-b430-0bbaee18b25a@linaro.org>
 <4284476.LvFx2qVVIh@basile.remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55d19894-4435-6ba0-69c1-b9078127128f@linaro.org>
Date: Wed, 13 Jan 2021 07:35:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4284476.LvFx2qVVIh@basile.remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2K0B+/ZTp2NI

On 1/13/21 3:12 AM, Rémi Denis-Courmont wrote:
>>     if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
>>         dc_isar_feature(aa64_sel2, s)) {
>>         ...
>>
> 
> Hmm, yeah. Should this be an ifdef on TARGET_AARCH64 instead?

No, I don't think so.  It's not performance critical that we avoid a single bit
test.

> Also do we need to revector the exception code, or leave it mostly duplicated 
> as is?

If you see a way to tidy that, great, please.  But I don't think it's required
for this patch set.


r~
