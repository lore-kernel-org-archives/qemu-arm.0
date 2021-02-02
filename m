Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp188341lfo;
        Tue, 2 Feb 2021 07:01:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7AlR6rgf5VOGYf4m+RZ8eBmCbyTxcrd6G2+1kyNvHsWmq0y//yQrmFUC+T3PiK5i3q3pG
X-Received: by 2002:a25:5557:: with SMTP id j84mr21008167ybb.472.1612278073228;
        Tue, 02 Feb 2021 07:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612278073; cv=none;
        d=google.com; s=arc-20160816;
        b=cz4EuMtX/gHUz7ALvWu7Mww4722YXJGnWUiorig174/hKP0r2ZzJ1KUctgFz8H2UOY
         jQ44KDOu6Vr93ZS/vtctAY3AkzAgWMBFJI3h6xPGy0oZzjprNykCsEW8uudMXYvgnnRQ
         u+1rlnKkysQj+69ef7+dF0DE1d73MnZUlAyEpAcwRy0+gZF5iwhXMsgnX//uTF2EAsA2
         Byu+Yt6eKsMlm+Gdd34l3C3tjp7OV56ccxALwk3uWuYxhuyImG+AijHdys8js2J5zH/U
         INHucDv7e/GRFsyxl4+Jlkzue/2tYJEw7QIYEec4dR/vkZ2G816/TS+AiWUOpkuONsaJ
         qqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yHnxhOqk/eWecdIgWfGTIuHn7pYl3vv+BgylfG2927A=;
        b=MKtoAnXerL6z5ZRhn6klcIL685Z+Ni+V+P5lFXp33vXyPSWRlnsqZi0PxEueKP7J5M
         2YKlkTNssIWWxeYqATQlj4YvFMpqnVavqkAaRJZjjgZQi4+3QEjNhOzFOukjKYGAmzaQ
         tT1PU6suOqJbV/wyJvBMRm3RbDCF3jd+6NMu+G7YkX9YLLjxbK1YQbmR+H9KMY07koS3
         a8a50yVB/TOAYvhIwFDt413goGgTBGV1F8h7I4z/4/ENfo+E9kw63vBbRIrtCIKtCr+Q
         ddG0JMcWoawKSV0ymty/0NIPOWk2Dqpr4KykoKJRzqQdN7BzCUqaEqYZb9Kuik2RGPpW
         fV3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvlV1Ffj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si20972078ybh.326.2021.02.02.07.01.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:01:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvlV1Ffj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xB2-0007aM-3T
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ws9-0000zX-Ss
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:41:42 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ws7-0000wk-92
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:41:41 -0500
Received: by mail-ej1-x634.google.com with SMTP id rv9so30295670ejb.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yHnxhOqk/eWecdIgWfGTIuHn7pYl3vv+BgylfG2927A=;
 b=RvlV1FfjwB4zjHW0LIO92VhNb75JQImSQ/cPsJEJHWa7k9+i90JUFVprhCpiO5yE0B
 YIluFDeWoHGoTYnvbG56Y1kJCijgHnKw3yYQ7O9C2DIjAYx75XVyP0aMzMF3FpNjzdOn
 L7WpgNncg6zX67raQzxmuzjLnA+5wE/6jiM5O37r8Ni4RU0P0ngy/ERPkJJcDKEoSHBx
 Q8DFA9KMY8Kn0YjX66aM4B7ybqByLvmMXuh+8jNcoWMGiY1GBH/UvrB9xDADBEvwOzEE
 SIHxA1XoHIcfyGtVNUCzyg5WsFEHqk5Xlb7gdxn85QVSBmLZHDtW4U1n7ZA94SMdxZM9
 K8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yHnxhOqk/eWecdIgWfGTIuHn7pYl3vv+BgylfG2927A=;
 b=ql1J/gU5Aa0nzl1Ndrr8VXSe6YRTgvi8F0/Hsuq9soDdTOjACFWeM4XTsj/Bk4YPAQ
 rF6n+PpPtLFdEgvxnFDhTnAeyneAXtczRPDHinmc8cYcptP6XmPeGSqUwE+ryD40bTY/
 YP97suHpvwaD3vt/wSgtXBNVID14uDtBUvX2NQjjZJA8RcNu2pl8Hg7Jbv5k7kBnTnO9
 HGUH+BYo0c2y63Vm7zvvsqvwbkHnmbci+EbPLfAWyCLhdHB8plRadGY57DhvyMHQIC2e
 6xLALgvAnachVbK09hj0q1qErdICWpXxA+5UC2tAiap2RHifCcz0HuRouQpZfFEMIHY7
 V0fA==
X-Gm-Message-State: AOAM530ofc2ammBtsgsaBZbc7jT9XdBa5/SOQ1JrJOv3iJMr6k7rCzUi
 d1oZi03TQmCH+gjZePt+/unidPbjUmm+yrCoXgDG/UZsL6M=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr21981811ejb.382.1612276897774; 
 Tue, 02 Feb 2021 06:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-15-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:41:26 +0000
Message-ID: <CAFEAcA-Bo3F55iX_x4StXh=WUZAkKPq7K2zw0dRns1Lkpi5ouw@mail.gmail.com>
Subject: Re: [PATCH v4 14/23] target/arm: Use the proper TBI settings for
 linux-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WK2bKyDCTgUq

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were fudging TBI1 enabled to speed up the generated code.
> Now that we've improved the code generation, remove this.
> Also, tidy the comment to reflect the current code.
>
> The pauth test was testing a kernel address (-1) and making
> incorrect assumptions about TBI1; stick to userland addresses.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h      |  4 ++--
>  target/arm/cpu.c            | 10 +++-------
>  tests/tcg/aarch64/pauth-2.c |  1 -
>  3 files changed, 5 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
