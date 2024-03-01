Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1332975eja;
        Fri, 1 Mar 2024 13:37:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmIXlHjiidrArohiZKw2CH4bMjNwkBEHWnQsqVoRcz9EHcyJJSx7HYJ4BKJQd3lJ/ADEVt5snDZ3fRm2BunZug1n+EAXoK
X-Google-Smtp-Source: AGHT+IF0fdb3zZgFqBMDIpWlYB7zt56MBvbzAMABUR6mAyu4XDhTXiloPoJA8IEXSfRs8TsnGAOe
X-Received: by 2002:ad4:44a3:0:b0:68f:b9b7:9c47 with SMTP id n3-20020ad444a3000000b0068fb9b79c47mr3094753qvt.29.1709329041193;
        Fri, 01 Mar 2024 13:37:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709329041; cv=none;
        d=google.com; s=arc-20160816;
        b=cbASiLb6DQ44miiDoPpTDSf0rwsN7aIFwNZ37W9uQp+EOhPfyHARtH7wDpaXYfwYru
         0bjT/+cUI3xHfx0R6oq6P8ap2x0K+7+GVeqkMjDgy51aJtpedc/p8RSAdgfyf9757/gY
         QRJFvoOAV3LlvIp/8AKIWkbrV6H2BDssj+9vBJFltGpw3/L/mWjO8r8+M30hroXX+0WO
         x8mfyTGYZXTJIscuhVUwKp0ue7qzTmRB9F0fWcKFCm675hymnqC3npZ7gXjH2lt8fKSS
         M9cGOa5vjXksKqTmG38hYzrtWOpOhf7eIYTkDsHGnNRQkgKkqZyIbSawtCEOKxAy+7jV
         FY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q5GiP80IalSN5F7eFL1OJ19Krnw4i3TpXLYxT0jJhPU=;
        fh=pFnYkCGJPZDwn4oU2ghxtUYnOnOoc9FVNF2yZ/0Wq/8=;
        b=qfMnzKrAea/aN68hzk6RqXOMIerG6LuobF8YFG/SbIvE4z7Ymx+N6osmm+fELDlQkE
         faa+umn4mwwpVuDmYxq1COg8Zt+8RJ5brU6/XmWxsFEmpK/7Wz5nNfSJeJ8qxDEJZZlh
         KW6lIo2Yr7Pk5Gb7WZ6sxfZPx4beonVylcBet6kbxiHerSqFbwU11c6HlF7x7/DWNw4Y
         VYQqyO6nmVclZ/C6sCyEzyKw2AQdqwZeoW16CyTK8BOwmWYFiPOLSFi6kEvPvzkjrlJy
         cgak0kpJH1RpdMmdeYe5A+4FTh8onuhF9ZSZiC1Pf1anYCW8HAbcgsJ1sawzoSbxb1BT
         65fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J37cVQq+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020ad45743000000b0068fbd79c519si4270666qvx.373.2024.03.01.13.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:37:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J37cVQq+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgAZ7-0008Mk-R7; Fri, 01 Mar 2024 16:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAZ6-0008MJ-Px
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:37:12 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAZ4-0004Se-Mz
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:37:12 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1dcad814986so23165725ad.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 13:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709329028; x=1709933828; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q5GiP80IalSN5F7eFL1OJ19Krnw4i3TpXLYxT0jJhPU=;
 b=J37cVQq+cxbhwasccpQ42gY6mgk4Zt8yLGQLy0AisizK783g9eOidVDnp2Jm2sC3r7
 x+mbHpS7DZbEvRkUi4pC0Km7RBWhBG59sVfO5JslRXtR0BXF5DCh8jGSeIi4x5/siqz1
 Z1ZPUWnB4mHQaeTSmZXS5QEINDi7+sNDOp6nT6SXBCKR+ZukqaSAPF2J2tn9yneNlNNK
 nIC3+sfbkWALRNPB36za76KPC33ACT1x3wuOgKguIJBhnKP0PrFYugbxYJ/nu7upaL8D
 jWgQoUCUf6eP6SoEqlnqpygOanNM3ti3xKu5sywequrIJxV+nkVJrnkHV6ubOm9rZqtm
 NltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709329028; x=1709933828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q5GiP80IalSN5F7eFL1OJ19Krnw4i3TpXLYxT0jJhPU=;
 b=hlf5bmGK9rdtyNKqkawgSO8mZNJuKL+0X8B9mJWE5lsfyI1+ok5daVI+gYwa1k9vKw
 Ut0/6f0y9P9osueaVWegDbKoXLDA4idbQQ31PgKs7ihEm2EXdzYKTWj/EjOoX+HVzqN+
 G8piBbZmkzb+ZLvsdfrNQOFjddmqP16cObOtJ0XYmqwtCcJlixiy2pzR+DV27P3nJKif
 yKj47UcSXF/s6eSBUoYoGucXLl0CGUAhWJcI9aaOO8GyhXOKoJzB/CIWscQh41Msfhpo
 w1CEC0+NyltZApNs/hPmyJvw84UL6+gsCiwZfMrPh1XdOXxk3EuOqM+BJe3/hKffbFUt
 WTBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwQxuMyyrnTX3B1gx2+CrbaEhI7lnhuT2wzf/h+G6dYEVoqKiRSwEOPV779FoIIDmVaPUEixGihhqsSbjC6UEUAYbN
X-Gm-Message-State: AOJu0YzrYOVMhOgkiWWvR4Kqn7rU6ihEs4A/3lyII/57hFaCDvqPd30A
 TBSG0YBDvgcoV0Dj/U/hEuCFGMrAgWPGCRKHS4K5DfB+Eoy5bxVn2rE0QdSDppw=
X-Received: by 2002:a17:902:e785:b0:1da:190c:3481 with SMTP id
 cp5-20020a170902e78500b001da190c3481mr2642517plb.34.1709329028252; 
 Fri, 01 Mar 2024 13:37:08 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 le13-20020a170902fb0d00b001dbcf653024sm3932680plb.293.2024.03.01.13.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:37:07 -0800 (PST)
Message-ID: <33667149-6f6f-4ca0-aa51-96d3a397ef89@linaro.org>
Date: Fri, 1 Mar 2024 11:37:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] target/arm: Implement new FEAT_ECV trap bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pQo/MpwTU9CG

On 3/1/24 08:32, Peter Maydell wrote:
> The functionality defined by ID_AA64MMFR0_EL1.ECV == 1 is:
>   * four new trap bits for various counter and timer registers
>   * the CNTHCTL_EL2.EVNTIS and CNTKCTL_EL1.EVNTIS bits which control
>     scaling of the event stream. This is a no-op for us, because we don't
>     implement the event stream (our WFE is a NOP): all we need to do is
>     allow CNTHCTL_EL2.ENVTIS to be read and written.
>   * extensions to PMSCR_EL1.PCT, PMSCR_EL2.PCT, TRFCR_EL1.TS and
>     TRFCR_EL2.TS: these are all no-ops for us, because we don't implement
>     FEAT_SPE or FEAT_TRF.
>   * new registers CNTPCTSS_EL0 and NCTVCTSS_EL0 which are
>     "self-sychronizing" views of the CNTPCT_EL0 and CNTVCT_EL0, meaning
>     that no barriers are needed around their accesses. For us these
>     are just the same as the normal views, because all our sysregs are
>     inherently self-sychronizing.
> 
> In this commit we implement the trap handling and permit the new
> CNTHCTL_EL2 bits to be written.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h |  5 ++++
>   target/arm/helper.c       | 51 +++++++++++++++++++++++++++++++++++----
>   2 files changed, 51 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
