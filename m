Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp538393ocb;
        Thu, 6 Oct 2022 07:57:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uECe6dZiaov0Ym+mho0I5ET2AvoFTR+IJ9PzBdAgdZROvaYHi5PAUINb+ngrmCzIVE732
X-Received: by 2002:a05:620a:17aa:b0:6ce:5fe3:1c35 with SMTP id ay42-20020a05620a17aa00b006ce5fe31c35mr336216qkb.337.1665068250155;
        Thu, 06 Oct 2022 07:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665068250; cv=none;
        d=google.com; s=arc-20160816;
        b=l31VznVxbkC9aGT7yVX933B7+tFohoDCHp+VIdS1hQZbmyP9Xtw1RvaZ0sQ5mK8PUe
         6SjOiAKMS/9RausnAnQu/O74bKMhfCR7spqufgPxjsR0yAAXC1tGPw3dgS+S+QfPTWEX
         xTVI3T1aiHPety4RUtTMsVJ6rkQsW6tMndNP8mv3VygjTf8KcVYlovrX4qkyq78ikiU9
         7N+9Mtffhcq+66EfSxENHvHiI2gucqSh4seLcdaf5s3+5ib3gUxsE2kUIJ8WE2L4gK4Z
         J7TOL5/btI/7uz7jseTw73zQQt3zHcIWr6XrQAaQzyRAcJa3ms65RLccp1FTyz1XQ9Wg
         W2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GnmKJsPpq1G3rU8H1DNwod3fmCA+6PhMUWm4sA9zQpo=;
        b=SkXnGh67y/Bf2Vif96bf0VzRI9nKB91mW0Jc6iMSaY1hqGUcDAuTdi89wFpneg8CLp
         CdiP0Du3PJDy9ZGW+KhtCsEE3biCQHpggxBbB+w7INu0rlkYHROgxVHW/Pl7CRUtyvEl
         3ie7JCxaK7FPYMQ8AF96K4FpbPM0t+WBRtWOcDI7ubKOe7GCkoKZ0H0l8hvsT6BdwDhl
         OeXevy6K052PY9b+FZrlTDV35QNX0PnA127m4OUiho3+q3Hc9iZ9Gqt1KpBMuG7nJwWT
         lxMyVgXvsT5bmWnmXI4gNjfe2KAwlKOi3Ed0LPdAtzyqLxAJRQ4z+7hR8O0NbcXlQDh/
         aDpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=djdDndYn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs26-20020ac86f1a000000b0038fa253a17asi2486307qtb.546.2022.10.06.07.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 07:57:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=djdDndYn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogSJV-000729-On
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 10:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSEf-0001ec-Vv
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:52:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSEd-0001Tp-M3
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:52:28 -0400
Received: by mail-pl1-x634.google.com with SMTP id h10so1943075plb.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GnmKJsPpq1G3rU8H1DNwod3fmCA+6PhMUWm4sA9zQpo=;
 b=djdDndYnrYaTdWXsBnBFiezPkGH/JsjI/3WiqwQgA4nZwSJ/NbUpqkmerp4xSMSpeR
 ePymthpdnBWfit9D9iqNw7SS3ARKb/zkpxQLGzqMf6BJoD/pXmokK4YdO+ZawOW90CCM
 tDVIkynahPY3EjIR6sRyDK017tEE1u7nSNa4GwrvgeXyIghsSrQ1Uyr5a4bL+TbgZAE1
 ccGpXgZYpKhlmoH20MR1q9iRc4q4QRqp1r7X9nERvU4DeZdjbarm8+dyEDq+9efQB3fL
 ugrWN3LqVUXvSJs2d7nTvzhPRHtrbyR6XBSDWb9BNk7ZXtlK90/QrIyMGGvJSOTz+sy2
 09Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GnmKJsPpq1G3rU8H1DNwod3fmCA+6PhMUWm4sA9zQpo=;
 b=6qekmajiXT2S6oscD4hCLEi8hpzKElvsZu0NEr3xbQdOBhnPy533vnNLl/9ucKhgEa
 /TMdamCqKgKRq2TclX0oIj5oVWc1K4DnqWJhNyf85asl5wvzJqYkLNndZmgSqUJsjjvR
 52PD5Az99oehJmc6lBiYNUjgCeh6Wnk3PplZ+eQmxQ3OnNNn6jhbIq7pF9xHAfVMn7WE
 FTpnaietcqC/5gAxaqJCwn1z0E4BjGJkAZwDOUI6Yc3Tc9v9cWMKRkzRywDrC1TPRPWV
 c+YB/ZxeKwk5foxnmgAbe5mN4zVMyP4PnQpNNOqiLRmEoaa2GWDG8Go6fOAxHx38HpeG
 TjhA==
X-Gm-Message-State: ACrzQf1Q6TCnl8ZAgISOEfaXZgl+8rwv4MV/SP58G3HFoL1BZUCs8/lS
 fExtzHtFjiLOlHLp20kmWBvdpRarRASmEr88gtu0SQ==
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr295203plr.168.1665067945334; Thu, 06
 Oct 2022 07:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-23-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:52:13 +0100
Message-ID: <CAFEAcA_KmS3ZLBNx4PBUsmRvh-meEA9gLpxUae=9vmtSANGYOQ@mail.gmail.com>
Subject: Re: [PATCH v3 22/42] target/arm: Use probe_access_full for MTE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6wUrRoRzq8cx

On Sat, 1 Oct 2022 at 17:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The CPUTLBEntryFull structure now stores the original pte attributes, as
> well as the physical address.  Therefore, we no longer need a separate
> bit in MemTxAttrs, nor do we need to walk the tree of memory regions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -162,6 +143,13 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
>          return NULL;
>      }
>
> +    /*
> +     * Remember these values across the second lookup below,
> +     * which may invalidate this pointer via tlb resize.
> +     */
> +    ptr_paddr = full->phys_addr;
> +    attrs = full->attrs;

Can we set full = NULL here to catch any accidental attempts to use
the pointer after this point?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
