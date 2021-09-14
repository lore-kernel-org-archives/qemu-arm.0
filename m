Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp673772lfp;
        Tue, 14 Sep 2021 06:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYyj6FYq6X3izZ1atGlBW5OAz+VHoBvElzaYGsAUet8l+XTJz+w8RF4hAJ9kEQ5C/WMhLc
X-Received: by 2002:a05:6000:46:: with SMTP id k6mr11556995wrx.104.1631625513403;
        Tue, 14 Sep 2021 06:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631625513; cv=none;
        d=google.com; s=arc-20160816;
        b=mcqbSxpT95lC8z4IhWfLw96wYjf64WJEb7fPnnQ2021Pk/hVGioVkA9Mv0rO32ZH1D
         3GVRYmA0DtCfv8DH7ikMwpphNQ3vRbBGu8eQ3nAA1PFYiw5ATIqX+y4sa8ArDJ0v47Jp
         wmRroIJs0exo6tVU2YTov+LIy20ljZNQs4mOwWg0pe6XhZ/emfJTC6aCZDIx4XyV/Nvl
         o9OefPm9xydUYvtOfPbIB4nW5gzlbgqwJ6uuaKCCzYRvBxtMRdjkwCfpyRHQ/nFxZAdI
         +WsWEYY7rd+jqbA2EueNxct3J9jNzflGctZeguqTxKEtLE5RN+YnJPQAntPjCS08YReX
         15Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=V0+SrI3r6YM+qmpwJFk7/gLAWsp77JE/gpGy0bXxV5I=;
        b=nXxCsjd9TbYrpY9vDGbCWNsxEld/4cMsb7UXS2/12lIkyfPtL7+0HLw0r9eaPW7lkS
         +tODHMDXBW14dbJSbGGYO9eP/T6NipaDP3n9fGXPHn3eVrlx4Pz2wKxBLbTOtS9Q1wED
         uEfAtrglXQvVmSpYTEZsBLuBcMSikzvU/6ddUG2dcssLqA2QIIVK/BBzlykzUueBteqT
         aH0SxpLgcW4Z9ZHwzlhm+siILTiKjiIb6mhGnnBugLHfBuQiRrp40+65m6ArvwgA48b3
         Lf7xS3GWxzphOQmgvOX3zjCUmy0MXHEY2PNxcnbOVrkImD2CKFTop60KF0FEuO2bFDnv
         ex5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQpu0+lF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si12132374wrd.526.2021.09.14.06.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 06:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQpu0+lF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ8KW-00064D-Hb
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 09:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8CW-0006fq-CM
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 09:10:16 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8CU-0004hS-OD
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 09:10:15 -0400
Received: by mail-pf1-x429.google.com with SMTP id 18so12127257pfh.9
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V0+SrI3r6YM+qmpwJFk7/gLAWsp77JE/gpGy0bXxV5I=;
 b=GQpu0+lFkFvdrg+C4G8MsxLwQ1B0qrUcx80HuKMOEnST96JZGS08QZzN9etI+NAW/B
 KKhJ0zY51AFFkxpm5dyfot/f0By1Uns6HBrMh+Xr6zBq3t2hAtZXJpbDT4G/WnM4MGHY
 W8gQjRFg0Hw4uGIYHpU1daFrV5m4hrIfT7NyEglr7uhkRplM8dxeeF8igdvCVfd7+4UU
 Kx3XLW3ldAEsydEdjgj7XT0F8bdrVMxzfaPlDWIdz3mGSenujyJzfHf3IyXMsHUDLGqF
 gCpY06oZHFYiWfEX0VHcG20EYjy9T7o0NumelqWP9pCHuWIdcfWV/V020yoVOhyVlPIe
 KUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V0+SrI3r6YM+qmpwJFk7/gLAWsp77JE/gpGy0bXxV5I=;
 b=N6Rb8+UBg0ol0S337URZFxS9BYreA4uFGwZKn1JI7gYqX1+QDDuvS6OvtL83w45AmO
 FFIHWlacAZLC7rWwdOnL5Zz3wfsl0TFscOYwmmgBLRrdrrZE5GOGLviCnZLxrLFxh4ad
 1E3KpAH05Ef+DiPD0pKcjqh/sr2sE5CIIN4i0ze5Iijy8Yg2wPsxsWQFeynTc4VSDx4E
 Wwg9aLiwjJx/dYtZB5yT+VysxCVEq9AfGhfN37oFfju4h3NrdP6+kEAyikQniuTFCSWV
 OSUECTDZfhv2HY/kV8LQDpzR76b3oMMA8IBMr6VqWwvauIe+aulYS/vojgIyKKlce3YJ
 FBVA==
X-Gm-Message-State: AOAM531bxjQR6ceBlkFuUYxq/we8e+DuZElCwcPNcrx7fa4Mt+kUdCKd
 ZRVdFB8niiCf0U0nzbIfP9muiA==
X-Received: by 2002:a62:6493:0:b0:43c:e252:3dfc with SMTP id
 y141-20020a626493000000b0043ce2523dfcmr4661797pfb.60.1631625013200; 
 Tue, 14 Sep 2021 06:10:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v17sm10107223pff.6.2021.09.14.06.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:10:12 -0700 (PDT)
Subject: Re: [PATCH 0/3] target/arm: Set FPSCR.LTPSIZE for user-mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210914120725.24992-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eeea6385-a43c-4e7a-9de3-dcc27c69944c@linaro.org>
Date: Tue, 14 Sep 2021 06:10:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914120725.24992-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wezR9qjpZXlW

On 9/14/21 5:07 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    target/arm: Don't skip M-profile reset entirely in user mode
>    target/arm: Always clear exclusive monitor on reset
>    target/arm: Consolidate ifdef blocks in reset

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
