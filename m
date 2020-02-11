Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5403926lfp;
        Tue, 11 Feb 2020 10:29:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGuEgM5QgNnZ1fRXrSj/WaHw76YpmJ8bxzgDi5DOCE4ecGRKvw7yBZHW/JS4OIQzm/wsT6
X-Received: by 2002:a05:620a:6c1:: with SMTP id 1mr7325598qky.419.1581445798846;
        Tue, 11 Feb 2020 10:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581445798; cv=none;
        d=google.com; s=arc-20160816;
        b=EqC/yE7Lh7ncpcHMQCrEQf5Q9+SAhaSqokT9tl/pNThbjM7FuWMzJVOCQ/ejI0CzhG
         KrcuVeaxbo6xyAH+pADK9RMVo2oWdn92ujrjLTnbWtT8bmd7MS45VBnTYsf7Uz/8T6nK
         WSsIbj0JXy34AU+TNZyUd+JcsWb+zpvX9KeeZTfwH1QVFRBTHFCYAWHRlyi/OocPC5st
         IDBpGmykuFWiP1vZ1u8j4DbGxZN+dGCrTc9xf9/XHvq18Zcr7ZV4tI06NG0cOfx6gj4B
         q/UHQOeW1+tIeeojJiV0vtMOhcqasU8MRsE6On9NUdgcHvsDwkqy3e6A9z8nCG+F/K/T
         VEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9IQX76N1HVS8RO6biOhu769HLbabl1tu8cVc/rmMs1c=;
        b=UjSBvREDhFdEbEzemyOQ4g+mj8aI58VEyka39Ieryhi4X5Pra7zAM8PfRtn9T+cgEi
         qB6iY4S3si8fQYYxqmcXy+AzCKPWXxGANFG4rOZM5zVPGo1/z6kAarTIrHEoY5qGPwQ1
         EsCwVdPzX7zK9pxTT1hgPuD7Cd5teHJee/CV8++70TODkZCUn6QXxhkIlfpSkzFstJkf
         iqrQGYvHgjkg9EJBuOJ6wkdUXJVvCX/RtLsLOdzYqexvbcd7zSU8OszD8mBpYM20E/uG
         1Qlw9rZRQIH6pERmukPItJtBix7cup7oNcXg39NHcznErKIpyeZr/dHLj0RKJR5+oNn6
         iH2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c1/f3Sl8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si2372810qvr.176.2020.02.11.10.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:29:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c1/f3Sl8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aII-0007rr-AD
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aHn-0007Sg-5v
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:29:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aHm-00068G-4D
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:29:27 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aHl-00065O-TM
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:29:26 -0500
Received: by mail-pf1-x444.google.com with SMTP id j9so5889607pfa.8
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9IQX76N1HVS8RO6biOhu769HLbabl1tu8cVc/rmMs1c=;
 b=c1/f3Sl8IyBvlBnrrWcrKtWuUbOsdK21+s7X7vze6mydlmhO8cCplVFedWP3+TU+O7
 r4WLf4hSJTxt7z4Yvnd9Ps+Ka0FpNCbpDqXGiaYTIgAhruardKB3Y3jo61qY8pjrhegG
 y/jJYoyhULoys/FMsW274ljtnrI4q9mAwl1FOiQi/jm4g0/xjqdwhHMtFYHYoOBOMIJZ
 Q+ohPE4uviLlyT89pObwfwihPU05/AgZFsrrRAAo3ZwplgtxSm845GgaAe2rGhyYZLtL
 XsKa32wmXSfp62ph9zVovrDWxHTQ1VkUp/hGgtbXSa6QPZCzK+e8N1Hi7trgWSIR4rkf
 nepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9IQX76N1HVS8RO6biOhu769HLbabl1tu8cVc/rmMs1c=;
 b=EwKDZfwEJzbhq2gB2uwc6uy6tlcoyJI1GNJleSom5sgHDceQSClvUZM14qpCQz+yyM
 3nBvpQnt67eGc5VG1S4QY+LMxXUePXNU3THKFmfduvcNEMFlH75ZzJiiVjF4Fa2S8bpP
 pc7hhz0BEJ+jNHRTpFFr9fTVMKMi58EQeZDfnS24sXP+HMsThD4w5hzl0YV2zMsBiUmJ
 TfI4B6Bdpzw8dxdasFpq1H2kgfOo9h+X3qMteo6UlPKZsJlvuF0PcEaHL2pKgWBHtUiD
 WUclx4LAyxS8LFDs8e0UnCoKBMLaqwQE5crBSi6UHFpGe30H1xVI+ftjBQR2xF9zHGwG
 7lLg==
X-Gm-Message-State: APjAAAUkch1a1qMAzz10E8I2MzCKcM90fKuaL6JeNfzHAIcPsd1ihCAd
 z/zfoswUlvyw9eJ9+q+lk3N2TQ==
X-Received: by 2002:a62:547:: with SMTP id 68mr4427817pff.217.1581445764876;
 Tue, 11 Feb 2020 10:29:24 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 gx2sm4041591pjb.18.2020.02.11.10.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:29:24 -0800 (PST)
Subject: Re: [PATCH 03/13] target/arm: Define and use any_predinv isar_feature
 test
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1354828b-4941-0025-4675-c4105b4f3df0@linaro.org>
Date: Tue, 11 Feb 2020 10:29:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IGS7B3BElJYB

On 2/11/20 9:37 AM, Peter Maydell wrote:
> Instead of open-coding "ARM_FEATURE_AARCH64 ? aa64_predinv: aa32_predinv",
> define and use an any_predinv isar_feature test function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 5 +++++
>  target/arm/helper.c | 9 +--------
>  2 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

