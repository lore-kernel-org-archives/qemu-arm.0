Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1418675ejc;
        Fri, 3 Mar 2023 10:58:36 -0800 (PST)
X-Google-Smtp-Source: AK7set94LjHlXaVo3KhForuVz/u8MZSgij/9n7g449d4SZynpuvGUpojo86T1S6FX8+56+K10MQ7
X-Received: by 2002:a05:6214:1c4c:b0:56b:ec30:67eb with SMTP id if12-20020a0562141c4c00b0056bec3067ebmr4564356qvb.39.1677869915836;
        Fri, 03 Mar 2023 10:58:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869915; cv=none;
        d=google.com; s=arc-20160816;
        b=bPWhpEdv0OL8cS90FX+7YTbAWT7QcDlHZt9YMEGxT524mpkTqx5I+dEp8V6G3zNeSU
         fB+9ReD9dZbiBUx6U58t49AXHUM4LQPwp4VKzPJE+8XbCeuQu/Gatx1C8fF2lPDIXd/c
         sC/vfEWbDTS+Xcsws0wdq6XkZVBPofiy/66KiX/EZ9SOIPNoL5t7T9CQjMnhQClBggvy
         bwWJw6W2ycO+PazcyOCGdx3lJw8xy8HWjGYzL5PBA0ZVgloiJRAWlYKkjs554w0Usrik
         5UYweXEoPCKebrKJHxULinYKdb5FGk2/1XCwkkHWvucjhio6bkywfsLZ2vzCgzuV2FTN
         luyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GfA3i0EmxeH++b2Q192tc6RbJRiSyD2bk1j6HbEja+I=;
        b=IhvmAYA9togcAiGTSYiGm8oABoFohWIdkei0Mc21wayMvtmrNerMqyXeKLZtuR/IE7
         ptGZh/urvClPaDW9pUMGfKr8c/UeV6N/p+u6HsFhJ9IPpWe/LRLNqKVZO+fR9pVHqsq9
         A9n8z4xdjCQrUErZ+kWuQc1Z48f13kARM9IQZH6d9aEzS2Za3zgAMwCEbG6IaZNBj7Ag
         FxXHDpeZ/0MthyFob0SZIsOs7q9ljPzvuwA9GFhkgC1Xfdx5RNmh6i9gmFeaMs057Ixm
         fffb6MskkBkBJDoVowC+bxFWml6tGT6iAWx5CznsI/xtwoAYfOvryKFFEMP84Ch8rivo
         CTPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRz4spGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020a0ce08a000000b0056bc02d626asi2141784qvk.242.2023.03.03.10.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:58:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRz4spGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAbh-0004RH-2S; Fri, 03 Mar 2023 13:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAbg-0004QY-2T
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:58:16 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAbe-0005dg-9Q
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:58:15 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z10so2073290pgr.8
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GfA3i0EmxeH++b2Q192tc6RbJRiSyD2bk1j6HbEja+I=;
 b=PRz4spGeRvfcxUkeMsThb62DGoOt+Q6NLG57kpMUkAIvsbAho7GayP86/hD4/2eHbs
 VC2jDfivdibNWclyldfnI3v3w4TBOfaf7WBrGsgKlIQ3AeoQeimp9Mrg+1SXFIMPdKx2
 d6U09XgEiGWsuCfwVFXpw1le+kIKn6HpSM7VqIMJCBG/nB0tRALgu6D/BVJXo1ncq4E0
 gmaAX7fB/j9txjnNbU7VYHlhpN6lsM5iDInEerFt8gwJTLEcKLsD5G39MuIKeIr1rmYh
 DjfpeFbYjglbHr27gP41Wnwx+Trnr3OufMKYZydx43Q4AxCA86NdM6Rd845FBiIGjBKI
 diBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GfA3i0EmxeH++b2Q192tc6RbJRiSyD2bk1j6HbEja+I=;
 b=QbUT2ozTqqW4IuUgBiTgWjkz6qXUvSkYsNGBZhDOrB8kzXbE1AKfzOaRVeX2mSrK+x
 yJ0rEH1JMF5cIEnjr8pvO10AJbrUvTgIZn26oeDgwfIzbr67DgDJwivh5sYE8tmHlshc
 twfpKDDRiEZjjWBM/2ohKlKkwevUdS9Jio5PLjDSBT+NoHFesMQJBaJuyd6I0RPXVxeE
 8deY96wQx4GVs+dD3vCPYT/1dOXdWHV4rhxOeaithdoTWWJaUbsiy1P62/sbThXQAS+W
 VfLUqLbWMmHezyyIpB4A21mZl+Gf5FSK/Mf+uMeJ/aMh1uFdlgK9Acxwp2NASvp5IH6W
 veJw==
X-Gm-Message-State: AO0yUKVs03zhCT95CDm05+ZH8Ee/5GgYJYClTRVVKpNbRcnlCHwi3OPn
 7RDbIF9Cvy8B1eBpVNwT60oiLyH/thiPTxyBWRJS6A==
X-Received: by 2002:a63:2953:0:b0:502:ecb9:4f23 with SMTP id
 bu19-20020a632953000000b00502ecb94f23mr909019pgb.5.1677869892789; Fri, 03 Mar
 2023 10:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-35-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:58:01 +0000
Message-ID: <CAFEAcA-Zy+svcJgBXDu_VQm=f2cyYRyZiiEw6pYD0zqy+jV3FQ@mail.gmail.com>
Subject: Re: [PATCH v2 34/76] target/m68k: Drop free_cond
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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
X-TUID: 9iPGEao/yMo7

On Mon, 27 Feb 2023 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
> Remove the g1 and g2 members of DisasCompare, as they were
> used to track which temps needed to be freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 40 ----------------------------------------
>  1 file changed, 40 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
