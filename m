Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0179BC5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 16:46:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww0U1-0004lk-11; Mon, 17 Aug 2026 12:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0Tv-0004i9-Ki
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:46:40 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0Tu-0000bt-67
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:46:39 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c2022323c37so451490766b.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 09:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786985195; cv=none;
 d=google.com; s=arc-20260327;
 b=G8G96vM1Ggn2fAioXwgbiOgNi9Fnjst3OwGwXWBiwCmDkVqcVqeOvtIm98nKF7rPij
 +Rs1M1cHNpJS81LjAsSyMjPNmmAnKtu+WgA0AqNx5YBTGOnmP+59ZMgrDoKGTWahQPuM
 Q/j8nrzRmLM9nt/rX67nbg+CMti/22KKxI+Ihiid2xspO/2gi+2orGiqBearVpGboo/l
 yeDMHyG7dqI1OXmfMsS92C2DihxoV2DcThah9XmlkM0KXwiH0Kx6vttzR5o/EkQHgIyZ
 mNLz4uf/rrYclGQAlGSCHi5ZBJTkXpj5nyJiwkOZShc1gVsiDzglJD3lVAt+ehlIbSOe
 RZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AV6goHSKGsE3VVTq5jrrNh8OWghK6XxWxIOBN/w6kL4=;
 fh=paPKUy7Q7Yd8OX2bvonf5epLZ0UO8QVZmEVk8BwESSA=;
 b=HZiJrZATzqoa3sxFy54VdeEKayT1UE+Qn3jbC8Ifa4c18LVtCAHfc8NU0k7egT6vVQ
 X13mQiO6VOvs08fgJK+rI0U00glAmfYgUsY0PjuL3SQ1N7BfSuDkIhXMCFUI2RlEmNe4
 ZcxzVz8ZABYlbldXs96kHR9dwGnsm1ysP6yt0Fssa8OmU2Q3PWCfhZQgfBW0//cq30W9
 04Fr3jlW9hbkHtjbRJclB31ZCGtn/paGer0i5oXUwLdzjSJyIoMsTNMt8MhThbGk+MfY
 TxB4jqVTf8+eWTk1q7OEwYJBJnmgt/oz1FkNyZAEjK0TnNNv+A4ZY6IhuWSW/3sHPgOM
 I1Rg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786985195; x=1787589995; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AV6goHSKGsE3VVTq5jrrNh8OWghK6XxWxIOBN/w6kL4=;
 b=Tg7td4ZfornlkPUXuHjNCDOckFmQPGGJR1Bbqcz4BRWeI8+AgSuH2IZaEZZoLFTuQN
 dgTQSvEf0b4W2Lk1NAlFOmfvFqrLqiHwYHo8zrrZY4/tcQGMbguFuSjLsYFIhc7xkmKN
 RtgoRJZEPDoRHlP4V51PukJVS5mN6xW/OFOHXXovDbxpdSuQIbrhnI5zRqEohn5yjPh3
 wxSQIfE8fsNM1eDAc86sJQ+i09YvJmJVvIIc6QYORkLN6tgA+WShZ7U+S+bKeqhnW1Nz
 ygjbDAXOhGsPJVp3/DzP9GfAZGT1hgZij6bWjn4nA21rb6hoUkOupa7E5KbCsRJq0RrP
 pJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786985195; x=1787589995;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=AV6goHSKGsE3VVTq5jrrNh8OWghK6XxWxIOBN/w6kL4=;
 b=tC3812h6TYRVAS95e1a45l+GQ4NkuBqcBpdkA1NXUfo1CEbvousfwA6PqzfXpoxYZG
 V5Xvj0sNcsaod2J4lpoC5w7+FosC+wbDLflVthMaj8yTL/USXpoaVY17glKui0+/5Rhc
 gpgB6Y+8TFbbXPw3yWBDfusRt/jNlZpuLRC8YJcWdjeQDcvOrIJiG2RFAQaIMXbsXWki
 LUpsEY97MHHA/caPg6osJSH2eBlo3eBALcu1uAhVohwFu0dt62nrwWFPWN/fbGYKxhjG
 gXDzK4fMjHczM0xVdZY7dnyuATnkv4Wm+Zf9wCnG56P/qQhLV82HQiXzGntOC+/pHll4
 op7w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpgL+unXbJ5PofWYh9wPsKL1SIPtATLptwTGs2m1vAb1AmGl0dFvMFCntG6jgadcL1kHX/E8MTeYg==@nongnu.org
X-Gm-Message-State: AOJu0Yy4iVoGp7wyKI6Y9FtSxaQ8ngcimFgjz25hdVSBLJjZCXd2p8t+
 4pkngbBf5DO9GIpAjLgKAIS1hMnnYqWGCbAFf88wEK1jGtwiEYIK3LqlD1WTHCE++oErszIs5ao
 dOWjeBEfMEI3u3A+jvw2P+fIobE5gZ6JHyc42rEVGxsthNYeTMAQ/
X-Gm-Gg: AR+sD11qXi5vt+ha8iwlN4slGZPnAAHbDxkXTJOE9k7YmxgDKicINc09d7KMCodxmr4
 aG8qcxh8Uyo56gzCfY6fXgoVSGf4Ta5IssB0T14zMpXObq90cyG1ZHdZJfdopJzXEpfp91Nh1wo
 7KL/l/YyD3dlI5pat+bAXWALqrXahHkAc4fl+4FRpQ6ZFTVK3j+SUP0cySBUxmL337Ufktlyz2J
 iTycGD19AlVERbYKuTV+ikwhY0r0phTgTdVXp2mYL6pt5yeVG0fo1NaJuqV+sxJpXyYB3fL+rNB
 SnbkEq+SPbSx37h+kLEHPBEns2ivrKROF3At4GXAybzbsDWweYbpNBFxp6kov8sezFuAawd8xJD
 4NxJSW61jCT30IOUTfSnDhSQL9/ss
X-Received: by 2002:a17:907:928b:b0:c16:4e5:944a with SMTP id
 a640c23a62f3a-c212a1d6bf2mr1218417866b.21.1786985195282; Mon, 17 Aug 2026
 09:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260811191540.79882-1-richard.henderson@linaro.org>
In-Reply-To: <20260811191540.79882-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 17:46:21 +0100
X-Gm-Features: AcwNN1Xe53c6TAmOJb9lfsZLZ4m_quFlY6T5mqrZYlWgXwPrMYhO73vZZI3FaWU
Message-ID: <CAFEAcA_7dF4EjcpkjhxwG24J4W7ST4eVVLM0YBOeFK097+GpAA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Fix SVE2 WHILEWR/WHILERW zero diff
 boundary case
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, yang.yanjun1@sanechips.com.cn, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 11 Aug 2026 at 20:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_gen_ussub_i64 for WHILEWR.
> Merge diff == 0 test with bounds check.
>
> r~
>

I guess we should have a Fixes: <whatever> and a cc: stable ?

thanks
-- PMM

