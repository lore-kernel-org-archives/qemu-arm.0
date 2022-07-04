Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3184764lft;
        Mon, 4 Jul 2022 05:24:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1taLJ7WtBxT11TNwvaFLyboSZ+bk/bVZ3OB0wqFUOTYuB6nyOI2aWzOaVQlNQ9h6sm9USN/
X-Received: by 2002:a05:6602:3689:b0:675:49c2:504e with SMTP id bf9-20020a056602368900b0067549c2504emr15360828iob.201.1656937441456;
        Mon, 04 Jul 2022 05:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656937441; cv=none;
        d=google.com; s=arc-20160816;
        b=0l24ZBJoCgzLdnrNhn0nsxS50I1CVAckGU2kMjfHsOTCYwx8SND3V+vYHu8NLdgaWe
         gTjhnpt3t2wpPET3RlESxpNMYHexZzJ1zgXpdlnXzl8GmAcqxIxfg0f7SXAM3nHt7Dsp
         33o9WZjxC7wEbI5qzgVVVjBZ0D7UJJAY5DZD0kbBBHwwLa9a/0HjjiiH0+hB5eUVa6iY
         4QPKxgWz9xFO/dUKB0RbpSa8cNYRUPta9nCjfF/YmUE3AzLvaDLNcTa71St2pNrxgLkv
         KVkKzPwWek8D7RwcWikzZy0vLMDLgoLsfb/XyfLv2yHFllu6enxkG1l1LKLs45kUF+hV
         xR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IVuNHrUSuKl/7cZufdtsYtzvfEF2T6tVzAeRkCsOZkE=;
        b=EcCT7JOc4qFLAXQ1oBjqbfOnuh18v+ylB0S60U9Mj87DplUAixA3R9XTdQm65FFSjD
         1MW7nkFqRFBi4hYYodKii8ceuKzCINkVt+STvH0Pivis1kd37F4hG4hDxwZkrd9uRsey
         bFuX+jRbj1Cr/UyEECXOQSkxu0NnotBbn8Aj3h7zMaw5p8SzSm7kl+qVUa9PdgS3fJCi
         pyrSXvF/Xo4UyS8B4S95rFfLTdY4bRFwBa+zicDZePZLF96pvW9FadgFkXjpQHfOWXJj
         +Uu3khx28EQlPh+5C1APi8M48d8Jexnc2n4qg+HrhmjXssol+lgDLdHstzzGFmFvcynb
         0LiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pu9XLbWE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020a92d183000000b002dc1c43e97bsi457058ilz.22.2022.07.04.05.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 05:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pu9XLbWE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8L7Q-0002Xj-Jm
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 08:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L4d-00012X-Ti
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:21:07 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L4c-0000KV-AK
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:21:07 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id j7so10231352ybj.10
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVuNHrUSuKl/7cZufdtsYtzvfEF2T6tVzAeRkCsOZkE=;
 b=Pu9XLbWEt9IiRXRGs9RgCoVBDr1Vi/cvtPjYkX5oByF+QsK6hmgCTwZZ1aLtWszYVK
 g6ieIA4z676fhtCQ/vwYi50dYAOc4L1kSNNIexLC5SPr/2EamMmKSEYqUDBPw0yQ3VwW
 06lpVqGNSfRHHY3bo3H27Wlzn2qB6nZgCHcsPprmxJtgF5aGrsRqob/7LxBx5zmJ5Nl2
 UgIZDSOft1PN4S/YMvc1JEZ1snm6DD7ezIAMMfWSR6b+Omc4O2J/wGI7EYLKEjjBpvTx
 krLDSbXwNlHEJU6pqOXwrqWID0N6rpSsIX8l7ygquBXBplmhyyG3PkJw8A95LEMVAczD
 RkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVuNHrUSuKl/7cZufdtsYtzvfEF2T6tVzAeRkCsOZkE=;
 b=P+FXDO59ffbfL0aNXT66k7SvRtC6WLfID/K69u1ZJr3QfaJJh5/YbAqCj2ja3Ddsuz
 MfvFn7abu12XE79nBrQ6HK5Oc+pfR/3UhzGeFAaSuKFbW5/YKp7rO1Z9KnJX9D0+cjsf
 Jy5r66GfzM2NvYHYY3T/IGZHLopybjm0iicItPV9woOoBVKZdefe9F0vxx/GX8+znWBL
 wLTfZTdeo7zXHoboHlrOWifHb5hckLAHteetMwXZ8EMQXxf7AJirPBgcdAwsd8QjpQbK
 Bgt6Fo2S4RoAITVBmh3BB8drXZ+LdxVoF800dC112ngIGszU6n02m0a61UikVj+QlQMJ
 zFQA==
X-Gm-Message-State: AJIora8T5JUghcEzgG0p4yTpmkXt9IjFo8UJGjtJpvf23pWyq++p6ewA
 yYqLApB3+XwMYHQSNk9npw8E5MuJOrb4voGH9m6X7s1q2Sw=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr11912646ybf.67.1656937265266; Mon, 04
 Jul 2022 05:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-43-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:20:54 +0100
Message-ID: <CAFEAcA_gw6aH3ziJY4u_GpEhtS7HY_a7zWFB66MYarHBLDFR2Q@mail.gmail.com>
Subject: Re: [PATCH v4 42/45] linux-user/aarch64: Implement PR_SME_GET_VL,
 PR_SME_SET_VL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wKPLtqHgArzv

On Tue, 28 Jun 2022 at 05:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These prctl set the Streaming SVE vector length, which may
> be completely different from the Normal SVE vector length.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
