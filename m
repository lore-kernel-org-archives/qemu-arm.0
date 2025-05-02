Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp823768njj;
        Fri, 2 May 2025 05:58:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXd3vtouF8BhnzlOjPK6xLFfuXBo06Lws6NjunagU3K5cpG7+oXy5QOGzNk8WykM0ZdBnJUVec/DFEYsA==@linaro.org
X-Google-Smtp-Source: AGHT+IENJcmdrrcnBrIn/v3eaaW8GFISS405V8Ed2hCJglHh5wBJFtRESQracMWppD9KLKRjWr8k
X-Received: by 2002:a05:622a:4815:b0:476:739a:5cf3 with SMTP id d75a77b69052e-48c30f6ec45mr40383801cf.1.1746190689601;
        Fri, 02 May 2025 05:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746190689; cv=none;
        d=google.com; s=arc-20240605;
        b=iM1iMkby34zEXOpcD0EAXmatWcSb0nN0iWz6oyuYjGN0Dc322ALTlUkFOiT4Wy8q07
         ahcbqGKuMxgmZ2mvOjM0KCc60OZSQOALUlCNPOryZDifSM52r9t4YFBlpL/EeyCyb9Qu
         puoFa7CN0cg+eu0KQIoncwmGO/ue4eIYMOSYWdZ8AScBvQQz7pZ5AcPJEGqGAXJGQcP9
         7Js69gSu8jFGQQJWg8QBBaZ0TVg44b2GfRS2bVZkRPL4p6usBY/1IiACo9b4XU63Iof2
         40dA+dowucpL2PKQyImMtZQWKSCpba4KIPtcsb0hYf7cTVU/13r/Z4WVVaX3uGOlSd/k
         yFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jud06qPeZcXPv8io0aY7bnQqJL5aqwCl4h6qzivT1eI=;
        fh=UyeVMFPUySa7+r0hAU5aNhWJ+HG1dPvSSbc18fs5aoU=;
        b=ITqgClrm8wJkkXfoy773MpJ9naRbCaRo9ijdxaDh1s7ajIBbeSP5bR/5eXiJMTAQi5
         hyA9aYC4kpSustaooZuCVekwFXe9aSInFr1Q0rDo5dHbkQJ0cYrMGQUMp9JLt1ZvzdDr
         E3a63EjJncLQitAHZyGGTDlJW14N3B5ER5BVjIbbQ0MA2cwC4R05yuJRQi/byjqcws6S
         lwRpsyaWMr6mAxxdeW/oxI9S7W4vT8kEpDkRuiYRAh5fWWXsOPXEDrklJ2be6fxlKM5M
         cdXV6G+8jDxigjeh6h9mBA7c5Xyu6ZJK5CjUa0FSXQooAFVv4BnOciYvIueDQoh4mvUT
         onww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIrFB2en;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b9824715fsi28100181cf.291.2025.05.02.05.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 05:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIrFB2en;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uApxk-0002kM-S1; Fri, 02 May 2025 08:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uApxQ-0002Vl-GA
 for qemu-arm@nongnu.org; Fri, 02 May 2025 08:57:38 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uApxO-0001fz-TT
 for qemu-arm@nongnu.org; Fri, 02 May 2025 08:57:36 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-70821dba48eso15549387b3.0
 for <qemu-arm@nongnu.org>; Fri, 02 May 2025 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746190654; x=1746795454; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jud06qPeZcXPv8io0aY7bnQqJL5aqwCl4h6qzivT1eI=;
 b=sIrFB2enseezVLl67482fV8PQl7ulmrsdrw9V6Usr9vbyU6AlbbpotpY6g6O4bjhRh
 1FmcX4jeXZxO+E7psybyITT2rwCLgJAg7CJeEhR9uOXioVj5cuEufG4meCzHBQn1t4G7
 WJoP03jYz5TrEm86d7f+f1W243gDXAA/OqoNgKhG3KaSL5hDkTw8vypqSDztIK61Gc8f
 cMXNcHaOM8yDl1ht8jBpxBEwHNb4LLkEN3VOQ/yYSZg0/Q4JH03gTXenUy2suwfStvUt
 BeOdhrlptmpSJ2AI8Ztk69I5kp2cVFJd4iSWj/0t+8zdA6RYRFKufBDi2B9O9q2lwfSi
 WeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746190654; x=1746795454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jud06qPeZcXPv8io0aY7bnQqJL5aqwCl4h6qzivT1eI=;
 b=N4rDtcArbTetlKAwuaw895ppWfQz4weqeyKkrmPbR7RNUCdlOZB1lbVISKoDS2xWfX
 j1wjajJ3qPlt/df8/5X+18R2We15+VHp7CTZT39zGvVdsTvzROTsU8o4Yl6tyO+xp/NC
 PPqUQYtsvw3+HCtWP9ljFsAcvuCvyJ/xFqnLEdFUJ5pRuP5HUYXt5YkNKcIeLc9krLcb
 ffXgoXAeDwV3iMrKr/Qc+++Z4puii16PnKjtSKNCoUxri7myKDndVt04to14Ylbl/BoE
 F6m7simoc1bkkB4llfUa7rNaWhOD+AYCUJCtiqPW5/C6p+X/Ws4Vx624mHqiiTFYQZ0s
 +8YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX042vBc+xe29IT0hzno8yRNk44QrV+BNGpv5jb9SU8x2qj/rEb9bFI+Hn8rEJYgI7Dn2tThJA/Jw==@nongnu.org
X-Gm-Message-State: AOJu0YxcAxIoZGADpLxt52QJPrmAr6nr9YZhBArv6N0JXMalReVY+Jue
 2BFk035gGMk1o2bO+0XECpyn+ZZgvOKHjgLjCuEBEmJ5lVZ+xWjwfdP06HzBqftAW1N0ZpYPfvR
 UQkl+jNRpv5GOmfnd0Dla6UX5nOhGfZfvdgAfPA==
X-Gm-Gg: ASbGncu0Xmif7LeNZuOxNlmiTRuyRN0xYrSiUbjXPFXhn8X84cGmDQwzZjzZ/7xl1er
 tUy2D+NTBrUYc4UmgHnaukC3ySw3rbbCyMvdaSHOMEf+1zc/KrS+CGiI/lxtz3HRavZUlWqgqMO
 AanyOONYbklJaOR+JErOte2ow=
X-Received: by 2002:a05:690c:4a0d:b0:6fd:6589:7957 with SMTP id
 00721157ae682-708cee17dccmr42816337b3.32.1746190653780; Fri, 02 May 2025
 05:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250402135229.28143-1-mads@ynddal.dk>
In-Reply-To: <20250402135229.28143-1-mads@ynddal.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 May 2025 13:57:22 +0100
X-Gm-Features: ATxdqUGAf83SQnlNk5H7J17wVTf0-VJZICRohSKvi1cqEXkGHa5YU8P_IJwHp-Y
Message-ID: <CAFEAcA-v11LC=uVXcQuZR07QanDPPZ4zJ6egCk2Y463-2aDk7Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix GDB support for macOS hvf
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <m.ynddal@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: z+BMxjufykZ9

On Wed, 2 Apr 2025 at 14:52, Mads Ynddal <mads@ynddal.dk> wrote:
>
> From: Mads Ynddal <m.ynddal@samsung.com>
>
> In (recent versions of?) macOS, calls to hv_vcpu_set_sys_reg were failing if
> they were issued outside of the specific thread that owns the vCPU.
>
> This caused a crash when attaching a debugger through the GDB stub.
>
> This GDB stub has worked before, so it is unclear if Apple changed the
> behavior of the function in a release of macOS.



Applied to target-arm.next, thanks.

-- PMM
