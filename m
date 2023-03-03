Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1346181ejc;
        Fri, 3 Mar 2023 09:34:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+vLrimaOEEPr3KYWNHVAKRxhYUfv1KBFc7zuzvKPLxCpeAE+zA9EgKhmUyJLXUT48LzW+z
X-Received: by 2002:a05:600c:1c1e:b0:3eb:2e19:ff3a with SMTP id j30-20020a05600c1c1e00b003eb2e19ff3amr2241301wms.7.1677864890581;
        Fri, 03 Mar 2023 09:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864890; cv=none;
        d=google.com; s=arc-20160816;
        b=N4lVBXP4dmjNOlPgxs2b7D9VJmeBc0BWniyLEa+RPAJC0XNAbB1Lh9glXvoeA/CN2F
         hheXw5hPW3XKn53y/YDVplQpzTFzEUw5LNEX7nQJbQyIdQwOfCgLbSZ8OHAl8pqxQaJ3
         CgH7u8Wly8bI5UfhFB0gH4Y3AeEksHPVf8Mr1FJzxaPnxj4jQzt3Dglsp9c6IgkbhjpL
         VjDuKNfTvKn34KZg7UU1g8s3gV0J7kMetOQeC6SR4aCKaicSXWFTpAJQeDkG0I1nVh89
         z3ocSDz46nVD0aJSsjAheUJ+/XirG4Q8Bu84eVgvQgZcvbmF72E+dsGnL3w3ztR8wJUH
         hOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+08/rGcbX4gYG9RNH9XyCmG10A20EblO6DeLZdgzWaY=;
        b=sAT+njBwgE1Lydu92D1NKcodD5Bg8ivFwBerRvTpOw3XfaJzm1tp6G2CY3aCJn+S1A
         9i1Zwsol/6UhtqKx8QsESzeHgs6LMAo5Lb4JoSzUpmPIcI+WorxK21Q+GkPcTBuE9zce
         Q2K5LCNB/LWzvjhxD7Ygdan1n5FGGYrL9Dzk5OPfalOkWCzYhC+RiBZ7/mAZneYAWSmj
         8VH4kWvjaDWSEq91uHQpL7ny31Mh0lh+KP87T+FUnPWr7URle9ecCrHuFXL5a9mZ5OoR
         Lw9cHBG4N7NeCUb5toVxgxXVbOGLiJi5RR4wzdgA0RG11Zt56K7eOi3thya5IhuwHWUU
         0Brw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+TIVkub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a5d6e05000000b002c6e8af1043si2283633wrz.747.2023.03.03.09.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+TIVkub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9IU-0007NV-Fh; Fri, 03 Mar 2023 12:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9IQ-0007LY-Fj
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:34:20 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9IN-0000Mi-TR
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:34:18 -0500
Received: by mail-pf1-x436.google.com with SMTP id cp12so2052388pfb.5
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+08/rGcbX4gYG9RNH9XyCmG10A20EblO6DeLZdgzWaY=;
 b=a+TIVkub8AKKDpijee6t5oYcCSms4AZsDNzJRr6ftlAKGJ0pQXkhq+vohmzxyNNwOl
 wzLb+YuV5xDbBjakuX9F+PiBSJDYFP8VG4pgXqQHQFO3SReEpLXOrSJ6Bgovk9Gcmi3s
 xGKtvCm/XtMnpjoYJLLnyeXjPNd1gUzIj+Rq/Qt/UkwvKLYUY6SudTXJWV2aLbrqQyjr
 N1N+HJdb/905RjtTPojI548kl+RB3D0xU8BsawqdvNnaE3kilPGqAnLxkgz+R2wLGAw3
 4JtikUh7Ibpj24+/uEYS8jLF8y6iaoIX4t5gWBuXTg2qoj1z04MsGR00H9ZhwfgkVr8M
 b+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+08/rGcbX4gYG9RNH9XyCmG10A20EblO6DeLZdgzWaY=;
 b=QKaPDHvaCkFdBJLSSn2S5BHTSiboFlmONP9ajGTPlSkbk8Az3+GCHqZ0+dBsWrzNZw
 JCRUHsa4dlIbL9FRKGJVZnwtgVnoXD8L0bPhL5+Di9CjFVizKyk1Xe6GeERiiQs32M30
 iPu+7jbsoN5x4LmP06SynI0yfk8l0bqhz8yxDnXEX86+GwSfW+LokpooT+6QJtJujtEs
 mJiY8zF64UvdxemTWLwjFSem4pjcMF9B8zjxcH/P/xRNEJBjxh+XBeFQjpz4DAS2KUJv
 sYXZ6Z5JBINqPVWQa6Z5GLTcuYqJGnpZ1FW2q8n7z9wuukAWcw7SGlKUv7SJ1GdCo/rY
 K2oA==
X-Gm-Message-State: AO0yUKXot6PTHkrR2SJ70X5FUMBEKrBSg0aUzhnX81ql2zWUXM7WlMcP
 Zme6hgsRTKU5BD1/YYwG0Pfz2Kz9ZVTujRonDaM6woB40/VmPg==
X-Received: by 2002:a63:2918:0:b0:503:77c9:45aa with SMTP id
 bt24-20020a632918000000b0050377c945aamr735029pgb.9.1677864853915; Fri, 03 Mar
 2023 09:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-10-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:34:02 +0000
Message-ID: <CAFEAcA-nW8yfRSAZQ7xayTyDRJz7Znt5gd8cjwGbNXrai58EEQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/76] target/arm: Drop new_tmp_a64_zero
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: 7cVOycPbwYh2

On Mon, 27 Feb 2023 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Only the use within cpu_reg requires a writable temp,
> so inline new_tmp_a64_zero there.  All other uses are
> fine with a constant temp, so use tcg_constant_i64(0).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
