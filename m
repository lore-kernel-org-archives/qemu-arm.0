Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2934743lfo;
        Sat, 6 Feb 2021 07:19:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY02IgAnI08P3iU6C7fPJxBEnKG/ngngOTWHYcIcxhtclmLWmD3XwHhmRoa7kLcx+9d9we
X-Received: by 2002:a25:bbc3:: with SMTP id c3mr13637947ybk.345.1612624745952;
        Sat, 06 Feb 2021 07:19:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612624745; cv=none;
        d=google.com; s=arc-20160816;
        b=OIKNz9z+tX5X0aYBtmJt2p3dZCMhARVOOZefgGtgmOQnbQ9NMjhRggRlJBeZ/r1pVh
         bPRGo0Rkyix2ay11ggvj8H3QaCMEb24eG5mKVtOlE1ZUPtL6BauOwTXWSXELCC3BV45h
         dEokYY5dwKzjYZ+fX5punl6NXjkTwe/IJ18RQHf4w2msYtXwa5j3xWgQN/zDOCM8njh4
         KzKblMfuiFwwO1wz15RaQn4+8EvyXCreaY5LOOkBpadCv4B1EfeehvVu1wGFP12lJYAx
         bmLZe+btuvZzcgbzNnm+ZzopVSrZ8C63tw27CwypnumtprFmFjags672llgMX/yYVQDG
         XQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4vJ1lQKX1v6SenhEmlnLttWdjwQawhaMDzpMNlaY7xU=;
        b=0z72sEkBwkBWwCF0RxORwBVXgytxrIljID9zevG+G0gVI55Akes5TbM5+crknRHxcd
         di4CqvtkZ3fa/2kotYXYe5w4EcdbN1mLBYSdfYnjhZEVaw878xtLbvULnUhQQ/FXz8ff
         XqUKgTscgym4IdFNiB2RRvmHclNtYfnfmo/O/0NbXCCXqYnE2BGPne+BbWh/HHbPVDwE
         V6kLR9fOVGBGjV+mrgrT4vXXxeOP+pOQyR8Ez8niqayyxyT6BqvYWX/l/Q9FQHhSXSPL
         puIHPPh9Awo9C2jpCk2vMS74dneYXkmjNmNeq5OObdAnQ3r5Ov0ze/Smzn1tXTlGvhQL
         WmUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AFmAkW/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m62si11925920ybm.453.2021.02.06.07.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Feb 2021 07:19:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AFmAkW/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8PMX-0001JE-6J
	for alex.bennee@linaro.org; Sat, 06 Feb 2021 10:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8PMQ-0001Ix-2L
 for qemu-arm@nongnu.org; Sat, 06 Feb 2021 10:18:58 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8PMO-0007wE-9f
 for qemu-arm@nongnu.org; Sat, 06 Feb 2021 10:18:57 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w2so17641310ejk.13
 for <qemu-arm@nongnu.org>; Sat, 06 Feb 2021 07:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vJ1lQKX1v6SenhEmlnLttWdjwQawhaMDzpMNlaY7xU=;
 b=AFmAkW/x14HQWXxOAC+CNMGFvGYXymMkdzhRSpvKTCoLcWUNTAdq1SWPbPUCvaX4V8
 qXhEvHQc7lIyOCA2q0ykmdtIP/xURaep4WnCF/92QDn2y1gv5u7MwFEBI/FFf4H74VXc
 VkoqsQRL9YcQzM+izwg6mDoccRrWqCxBW7Tpg15kGbtKuyYbfO0qnxariyMSQYz97wmy
 lUTBTTUva5YmJ9W3gyGS/rr3IBVLTbGpv3HI2qSe/dnh4KXACRNHPRyhAalXe426QpcM
 eCMmkFSCifS0hlSk2bQmAroH6UBqt2I3LWCRcUZXbD6fB551rxpon4pOzCfJb69CVAo6
 kHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vJ1lQKX1v6SenhEmlnLttWdjwQawhaMDzpMNlaY7xU=;
 b=aCtQnFT3qpGNQz1iTJkDccKGufzQcQ9CafD36216zt6mPshtMhk41XECBSor558YpP
 dBypARKlhyxcbMioeEtlqgqg0xySLHfl2MY6NXvrXfrriIJFbcLJMCIceZqCyFtHfbMn
 FHGMRixWRCDQD5Z5/6YXO/o4ZsduUEA6fqtrR1rfkuaBF0IVJRpOQ+2j2SucA7eeZaPf
 aaz6RLohPoQCU+x++Y5ctOVQOVPWL2cUFjpl2ZU+4uToy0kbdYgl5cV4qRSOwuDtTuH4
 HG36K+gJCmczmUfvqX/wA9vbxXvrxYFgpRKQ815jqsT48eFMgbrFdw+fhbg+8hOvNNTv
 CAyQ==
X-Gm-Message-State: AOAM533WeekHVYS/rbkVr90JxtTDR5vqcMQP+dTVrcg7qd6dPYLGHJR9
 sK09Td4b0OHJAqAQOPdUjYzzNiy1/EfXSKazC/cNnQ==
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr9348517ejc.482.1612624734138; 
 Sat, 06 Feb 2021 07:18:54 -0800 (PST)
MIME-Version: 1.0
References: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
 <1612622294-37297-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612622294-37297-2-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Feb 2021 15:18:42 +0000
Message-ID: <CAFEAcA8dAU+kT1WDFfdeCJsicpoFu6tZ-GTRcWuv+oVR-OL28w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi: xilinx_spips: Clean up coding convention
 issues
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mWgLi73mvx/I

On Sat, 6 Feb 2021 at 14:38, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> There are some coding convention warnings in xilinx_spips.c,
> as reported by:
>
>   $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c
>
> Let's clean them up.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
