Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1418637lfg;
        Sat, 15 May 2021 10:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh9VAWGpyZnnMyohT+I/jS+/JdM+RKvLSoQ+2cgPba3hUnXEBIdlD7ewt7iGVAFw9NzE1d
X-Received: by 2002:a5d:9a8c:: with SMTP id c12mr39156687iom.166.1621099271973;
        Sat, 15 May 2021 10:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621099271; cv=none;
        d=google.com; s=arc-20160816;
        b=OtTA37Ll2UNDAJ74s7NXqwVRvj2yl3JgCtu6FW7iHI6+acq7B31yf3M0VtIXq5D08m
         eYvkC5jqhMt0XT5lPAuIeIuoDaKIz67aILsLwb+YpWoIkbTC1wTxzWTvzSYpyUZfv2eV
         dyO+G99QgOwG2/ZU9A0Xrvb14s51y0WVbN8NOA47l7HDyT5oh0p+ZcpRaNlAJxwvLuQe
         XWXvOUUN/LnRTAjKza3pSWiHrTjMuiH/CFoMe359TzGStbRM4SYUETJbzT6g7BJE+2vw
         yo99MEqT+lmcm5q7jxT5qRTsa845AtEQq3CnVnSP6g46f1hbhqVMXlOrpCdq8jUVBUX7
         1nYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NS4EdOOlhrcW8ppu/GnQnSaaZUpfTSbYrZEaNHxvkrI=;
        b=O04lkN3UiJh9fK72TRy9LXXJYm3X3VDrP0JvmcW+Y/azkaKq2qYIeZGbgbfU8QExkW
         xZweOjQgMd+NVAG9cw2XwcQDPnd3xGFkDmMcLrSzzc8kwsuZ5s+kH3nEp2a83XHUye2z
         wXpWgJxrTjrf30msBoMD6C8rcPc+q7Tl5Osan7eQ359wx1Udx1kcLRKz7gd2anL12lGp
         9ForoeVdPVi+xIubPpXv98ByG7bFibEvuqnJEZer3Q8Hoz2En5A1Cmt2ycow2TjkDGF3
         h9dB42ow53OhwGGI6xazELjwTou07L/vbXOkgCqaqJRY5OIa5X4I2Uys9CY2/Iuohawm
         7psA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q/uTDHXh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si5456876ilh.23.2021.05.15.10.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q/uTDHXh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhxyR-0005zv-B8
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxyC-0005ze-1a
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:20:56 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:45959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxy4-0003Zu-J6
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:20:55 -0400
Received: by mail-qt1-x82f.google.com with SMTP id j11so1921108qtn.12
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NS4EdOOlhrcW8ppu/GnQnSaaZUpfTSbYrZEaNHxvkrI=;
 b=Q/uTDHXhDjw7FPQVV3bVJo4lm8pwVoFzXhaE1ROafHceKnLigXQIPuvy0VbeX9tQhM
 fmrZ7wLKATCBqJZWucN1IEKTMidVW8WRJgBUbRiKFkWAVXdFRhG4OmsZiUk3uLHvmBtN
 /n2RkPVsVsEyxDsEZ09BgvIVHmxbEVCaX3XsOvEqCkZDR//tZfBBfxMDPDtedv3/Lwnh
 zjkevnlnLlfcYRJlhiTI4m6BVX7FDUJF4bzjx1GxxdAqZUAWyO0uMrvNttJ+btKzYxqT
 HmaLU8VXbsmA0DNJ1cbJizRTT062LgeEk2Ha8aYxtKkJSyRjag8yKHXTBS5bHTZSgHsy
 WNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NS4EdOOlhrcW8ppu/GnQnSaaZUpfTSbYrZEaNHxvkrI=;
 b=XR4kbM56hnJMXcqSpShsgvCJdwh4rSiAx0lOHkq0UhjxTedZ/V62QR3BdIBfleiozV
 D0XbENLXGQcOfBvU/xvfC+1XrdN4t0CQtsVHt6o7SpSKv4U2i93Fk6jXmvLRLWXdR7cM
 ssscf8VFKg1Bva+kq4LkwxtxSDmc7r6pTMgyGAb+IG6xoyuWZhkdfd6Yg3gpO13n7VNn
 XkNRHmbZPXsWL79ZX3BWC/ezpeXatYiTvjFz7tx1rBJswTUmH/Wu/uLkhW7gpC7j9JgP
 VrTc5NhYYzvcSCQImJZJvuBTzkS3mSaRhZZhBr+6272kUr9WHtGnQnfg5J4+117S2gSO
 xR+w==
X-Gm-Message-State: AOAM530Jk+bQrbQBGEV1U4OORV1tQtRD+Jr6dQGnG6Ju29TiVWvaFqdF
 b8VHJfpA9TjzzerVsnIDIfg/yEFcO6ISGPwjN8g=
X-Received: by 2002:ac8:5d0b:: with SMTP id f11mr50328913qtx.132.1621099245913; 
 Sat, 15 May 2021 10:20:45 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id h8sm6955587qtp.46.2021.05.15.10.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:20:45 -0700 (PDT)
Subject: Re: [PATCH v6 77/82] target/arm: Fix decode for VDOT (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-78-richard.henderson@linaro.org>
 <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac0e196d-6435-8a6e-f777-47628dd88fd1@linaro.org>
Date: Sat, 15 May 2021 12:20:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t8aD1IyIk3bK

On 5/13/21 2:25 PM, Peter Maydell wrote:
>> +static bool do_neon_ddda(DisasContext *s, int q, int vd, int vn, int vm,
>> +                         int data, gen_helper_gvec_4 *fn_gvec)
> 
> This patch seems to be doing more than its commit message suggests.
> If we want to share code between trans_VDOT and trans_VDOT_scalar
> can we do that refactoring in its own patch, please ?

It appears as if a rebasing error squashed two patches together
(git commit --amend vs git rebase --continue after conflicts).

I nearly made the identical mistake while splitting this apart again just now.  :-P


r~
