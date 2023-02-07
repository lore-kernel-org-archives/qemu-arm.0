Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5498828ejb;
        Tue, 7 Feb 2023 08:01:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9exw/Wm7Btza2ZMT03nXebRRzLPwpJUX00K2h4GytIlfIOTgQCwrB6QFx886D8oLy7+VpL
X-Received: by 2002:ad4:4ee9:0:b0:56c:2e3:1565 with SMTP id dv9-20020ad44ee9000000b0056c02e31565mr6609273qvb.16.1675785672540;
        Tue, 07 Feb 2023 08:01:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675785672; cv=none;
        d=google.com; s=arc-20160816;
        b=vrCI5guthZgxJZZtgYo8Gkgu8Px6jp3w6P0PV1oNu1LFAnRkWDpYb9jngJrVib3JAj
         tNKbztZdrPin2c3uEDCiG6GJvohb3LUByFSiXSWz1Vql3FSkGfT+F3pak7Sov1qNfUWc
         qTuF/2iuDT3Aoq7eF8tR0Ft1rE0pYcR3W2nNLRriwcyyquDzG6BIHf/Xmd7Hh4o7aNe5
         +pJthZEf28UYykzIcM0epaGANEC9rZq2QqJk9KpfKKjTbwd8jCf+v7a0GOCBB1peJrx5
         j2Y6ifh/SZmPtThJeaazfVvLjhAAv2J/r672rDADLCl8toK7uhh1guPtgVHP289v1li0
         6FuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fKEA1h9BQhuGfYQ+kwubdTa7YvZekBbXd3t+/9/vabk=;
        b=XFK7itLrYAMtWP/GbXIZuGXudnH5Dcd7s7yxP1WVBEzIehAiBToJpRF2dWBTxO9TP/
         HYmYdF5I3Q7STOWTh12Z175t+vhSpdeONq4oEyPUIGeHrdnMN3P8h8hvq38CYUtHtw7P
         T5TgnY6fw7I2Xx/eJkSftL3kwT1N/QemRDm8n33DZtkgYfDqjsyF1vULvOmA16JG1sQD
         ShTNMPRGT0vhR09mTdb23pZkGSuVU35ezTxbUWYSYIZd66/zv7DYL1G7gR+mcDs1aQ/L
         ed9d+eP7MJreQc6fuwTUqgE2PRMc2NvqQ8Vxm8Wyv1QgQhQKVtx/vDYlKSlWWl09CBbX
         1kMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMwLyPFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020a05620a24cf00b00734576d9feesi4418425qkn.545.2023.02.07.08.01.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 08:01:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMwLyPFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPQP6-0002NH-PN; Tue, 07 Feb 2023 11:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPQP0-0002LD-58
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 11:01:04 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPQOy-0001wZ-AH
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 11:01:01 -0500
Received: by mail-pl1-x632.google.com with SMTP id g13so11289915ple.10
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fKEA1h9BQhuGfYQ+kwubdTa7YvZekBbXd3t+/9/vabk=;
 b=SMwLyPFJHWwWQ+y77+/PFP6jALdmcMZbNmCiVTOgKVcALeGasLGzjyu+esQPJvaFv1
 gcGyyEtxZhwdhAiCEiRHiaqOhpFRtiIc3mx3gaTeof6aOZqsqmTqIWDrx3L9B/LaSgTs
 ZU0/4VHI0TC8jtASm6IFRxddo+eugHzhO2B+IAEwDdAPq+XftQxIEnTXxvSr96fl5Yhy
 1+fyILXQJrVhSjQqb5NgxqePQXHoYKB3rcC1WUzXITa4kyklJbCmwUfFkMOXfq8vHg6F
 sa3DO+z5qO1ZIlXLV9pFtc+oTjZG8l2VD1aHWKUeOVtVihOfurB3oRs97V/jVux6ixYH
 0Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fKEA1h9BQhuGfYQ+kwubdTa7YvZekBbXd3t+/9/vabk=;
 b=MDPEQaFinTIlLrRG+8ZbioP0rqw7tRtHbwsXgQx/6tnnTAp1K9B+iK1F22tZ74osag
 IG/1EuALpNZwH8cXcNtfVZJ1L8aO70cvnxkheCwTlIJP9B+ReQHKpgRhg0NGCVeEitfx
 97aV2LaA62Lhrj1xaQoiRzMTCds9ys4jQeLk8skSFn93Y8GoyLsVuvt+Qek9+zRyZksN
 fmZ6xEsrzMqJjWklrFI4cYN5Wfzdce4diLRsQA0dZsE1gKhWr9DCfczefZDY7KrBtuSU
 NJ6+OCsC58LvqL25m4mR5Tp/xS5k51zjUv6gSk5XtXNKFvuqrp+dWeAjG6AdYe2zd8Ua
 8l4g==
X-Gm-Message-State: AO0yUKWgXdNc8afGRqgqulFqnHe8gaWIPozYioLj3H10GI6XZy16Rhwy
 dJei3t/lAWdfByy8GfG7B8aXHyFerHh+FgNkhV/NWw==
X-Received: by 2002:a17:90b:3906:b0:230:eadf:4a2e with SMTP id
 ob6-20020a17090b390600b00230eadf4a2emr761859pjb.137.1675785658730; Tue, 07
 Feb 2023 08:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-3-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 16:00:47 +0000
Message-ID: <CAFEAcA9+BLL3m+SO6ht8hZktSHN=AKpmK9vzJwoWoZeGHC=hYQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] target/arm: Rewrite check_s2_mmu_setup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wgIS333W7Dl8

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Integrate neighboring code from get_phys_addr_lpae which computed
> starting level, as it is easier to validate when doing both at the
> same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
> especially S2InvalidESL and S2InconsistentSL.
>
> This reverts 49ba115bb74, which was incorrect -- there is nothing
> in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
> pseudocode is consistent in referencing PAMax.

I'm having difficulty reviewing this one:
 * the latest version of the Arm ARM doesn't have the pseudocode
   functions you refer to, so it's difficult to cross-refer against
   the spec
 * the changes are too large for it to be easy to confirm what's
   just been refactored into the other function and what (if any)
   the behavioural changes are

thanks
-- PMM
