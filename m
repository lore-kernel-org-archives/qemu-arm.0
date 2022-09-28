Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp317033ocs;
        Wed, 28 Sep 2022 07:10:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM63XIKDnWP9oXrL2t/mShXG4NnNkLY958pHRqh00gFtDlXX/DYgEZybWVGrU4O9ACCSxXb8
X-Received: by 2002:a1f:3d46:0:b0:3a1:fb78:c224 with SMTP id k67-20020a1f3d46000000b003a1fb78c224mr15147824vka.22.1664374234864;
        Wed, 28 Sep 2022 07:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664374234; cv=none;
        d=google.com; s=arc-20160816;
        b=Fy3+fLcZw87tc2f6jv1Sdok1KcA/jRgcb9tbe07hwrTg9z88UVk8iOmrKXOEPQB2cp
         r0CHqO2vpk0XNCpXU2MpCk8gMp4uvvbVyth4YrX5Shr7c5JwU6PD7zsxlasYhb1ZDRwE
         W04PBvjmrN6BJ3GH8UnyFm9YVPOI11ewj6O51/TTVu8pfu/UuamnuE0/REztLUPmyOSL
         Zj+JqzFytKDHcBzrKp9kozVK5RBE9dHtB+apa1lvua0+o7sH0RXZXgN43B4gGv+9fSI2
         8w/a2L0he0XpCsb6mFKqFVJ0M5dKzAqgssZ0A9OO7d9vtJMBXQQ8/p6kZMfNcdiIT2Vx
         yvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BdZUaBJNIT4uz6dQ23vgSdA51kUUyLq6Gj+LpfRLMwo=;
        b=jvwGlAqfrGpI+AIxChjj7KX5zlIaDnwMOuRom3z4vkvmnSM7wuoX8qjeCe/p0lpWQn
         ENXgIz7R7X+HMOJbjZktCTu0kf7f4OGUn4tiaVn/rEz9gbTYNzMYwtGY9/rouHZJEFRT
         e90+CcH1l2TozYsc7bokmVnFM8aemws/xTUiyVnYM7Upi6lNWVUepRBQJF9yXrazmP+I
         ZybtKiRCZ3cbKeSkbI+c0zSwjJTOkii8tKVJfZ6dvMBtZQHuSBPDzgpepzLnBb638wpP
         4UybUOq5VE8Dbf8D75OyRCtuGegvee4cnPj4gQo+8Dex3wmqfJgiooNND2yGMfuPqjyf
         cyBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="os/uSPpG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a67b745000000b00397f3af95b9si1011497vsh.435.2022.09.28.07.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 07:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="os/uSPpG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odXli-0000S9-En
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 10:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVyO-00067D-Ga
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:15:36 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVyM-00040y-Pf
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:15:32 -0400
Received: by mail-pg1-x531.google.com with SMTP id e129so5977092pgc.9
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BdZUaBJNIT4uz6dQ23vgSdA51kUUyLq6Gj+LpfRLMwo=;
 b=os/uSPpGoGgOZ2kR8P9v3ItD5MfSFqKjFiM9ilDo1z/yMai3nq3nB4STdonn8fO6ZS
 ksgliIBb9X7U1ruS5VQK/Y0udu7kaWo9+ERNhj3rBsAclyQIaaPgYBqrsxBFWpq98K9x
 /5yKWbDmCIxbBBHfXYPUcEV6h16eQRGsF50gohcCinafOg15fag0ZTPw1poJRPIU+7SJ
 Z/rp2kekB+MWzS1mGJ0HRHvXtb3t1xikUIjVlR/Axy+nooj24iDMSI81PGHFKu0DY4PY
 PtKPuy8CNT9QEqEq3/EMYJSHkisn7qwB/HzukvzFDRPxXM7XhBqTHOLccnsZfHTfKYKa
 qlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BdZUaBJNIT4uz6dQ23vgSdA51kUUyLq6Gj+LpfRLMwo=;
 b=o5GH1YLXdqUHim8SjjX2/rNQQKV9KJ9eZBvwv3Dx8n6WjvY6dTy7nJVTkSGyYxSftq
 c6Hy5m2WkAdLBjUl/OTKpvphAMlsDTaTl/Qakbvcbc+YaqlYsn8Datf7w0Gv/YMqs1EI
 P5o48pKmzVqB5QT0hNnUA1nq9zFll2Tapi10upJ4SWqcAwrDIcQCjViRME9bvzqsV+Si
 LX6+wJp2W7PG1PggvFF47xqhrZBpGVd2UaVlkJYR85SjTboWVI2vP7nzbSS/pr5zJbtU
 vtG+yw8Gswl1fPyfuiu+xRQo5pUbKLimipUZQF53IUK0veCP+qZU4fiYQI0ooXwPXo2B
 nEkA==
X-Gm-Message-State: ACrzQf1TLxAfOUMAWfsqgpeDkQidJxCP2NNbHXhIufzVkv7dlA2hF/wI
 zj1w1hRkAvk9sFrmGBF8gVqG2Q==
X-Received: by 2002:a05:6a00:4006:b0:53e:815a:ff71 with SMTP id
 by6-20020a056a00400600b0053e815aff71mr34301291pfb.4.1664367328173; 
 Wed, 28 Sep 2022 05:15:28 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 cp16-20020a170902e79000b0017834a6966csm3523509plb.176.2022.09.28.05.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:15:27 -0700 (PDT)
Message-ID: <b4934613-e1a4-e6a8-58cf-dfe91d19a01f@linaro.org>
Date: Wed, 28 Sep 2022 05:15:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] target/arm: Make writes to MDCR_EL3 use PMU
 start/finish calls
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
 <20220923123412.1214041-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923123412.1214041-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: ZHtN76ZzZwP+

On 9/23/22 05:34, Peter Maydell wrote:
> In commit 01765386a88868 we fixed a bug where we weren't correctly
> bracketing changes to some registers with pmu_op_start() and
> pmu_op_finish() calls for changes which affect whether the PMU
> counters might be enabled.  However, we missed the case of writes to
> the AArch64 MDCR_EL3 register, because (unlike its AArch32
> counterpart) they are currently done directly to the CPU state struct
> without going through the sdcr_write() function.
> 
> Give MDCR_EL3 a writefn which handles the PMU start/finish calls.
> The SDCR writefn then simplfies to "call the MDCR_EL3 writefn after
> masking off the bits which don't exist in the AArch32 register".
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
