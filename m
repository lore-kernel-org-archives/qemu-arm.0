Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2408107ejn;
        Mon, 17 Oct 2022 06:49:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KS7GWt7LRw9BURrTzYJhluOlq6+L4MLFIHe9FogU1iDLCPmCtAqXcayUtaaLCQig+OQ/O
X-Received: by 2002:a05:6214:1c48:b0:4b1:d428:6266 with SMTP id if8-20020a0562141c4800b004b1d4286266mr8454912qvb.129.1666014595255;
        Mon, 17 Oct 2022 06:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666014595; cv=none;
        d=google.com; s=arc-20160816;
        b=ELWLW/3I+LPCSGM0SBhB41d9EW8Hychtst0kchXue312oLbkMGLXETZeig7p3r5fvn
         6nWfcm9pF3JfzqZnmGrWp7FJSu8fA2f7BYzbbP5xQb14VovYC8vINkXZ5yMRcrpu9gRy
         FuU7gZaHj3XG7uZq9QaXWqGoFmSQqMRQZKWrSCz/Q/RdRa9FRKOLjuGfsd1ID3AgBpmR
         vEsSzGaDXW8KNdZZmoP6dHGHfISzvGt8aXUpgBAtMjP3AgrrTMDA9SAM2ai9afgS53ka
         fmCDB/drpZsjvpyPSYylUjwrZGGgekWaMb2J3BbBiLEfsvwsgP6pNpMkx81z4SvKB38U
         U2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8/BGGq/QH0s2OVfDeopbmaZFz3D1KIp/wJ9aLF5GcOA=;
        b=MvK7iYDPX0ALlh9yIvSxXS9RU8mb1QdEOKPuDSmqeIK8qYRZ8jsv8F9Ykqwz6gqfP0
         D4tnf79+irWM+p+oNuDBb3KPbzTRj5qXHt/f9QcJkJqHTbd7dwOWwAnn9STrfjKxii78
         7xEspVr/J6Z6Yr+J9KzFo+JF1MXG/SErZNmUCJyX/Gs+mlkDYHHTiUtDIex3ilYAuu+f
         lW7vTxKBj3U0Srk59klcfPYxa4kkq/k2y9CyR/ZyYL6XWRinHkMYrC3E7ZmdD8wgHJoC
         xFpd0KRGfLpR4CtwuZD5u9cn2PUOLsNTvCo94AKKc/qxgcND2axU35sw+bMH3+eSp7gy
         CpFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1MdygQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05620a0f1100b006ee8da2bb15si6504001qkl.566.2022.10.17.06.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 06:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1MdygQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okQV8-0008Od-P8
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 09:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okQUE-0008NS-JL
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 09:48:58 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okQUD-0006mh-0j
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 09:48:58 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n7so10839354plp.1
 for <qemu-arm@nongnu.org>; Mon, 17 Oct 2022 06:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8/BGGq/QH0s2OVfDeopbmaZFz3D1KIp/wJ9aLF5GcOA=;
 b=b1MdygQ2evI4u4zmQ7zTPSF5MP//0koofFHlVYqGf1rYc9/a2wAkYordoEs8EwpxTy
 5jo95JHgr6WX1x0yCPpjIy2UeCsxQSAC7nWdn5OkD6gjyfoIRkPCbQ08wyz02RhZOy+p
 rvfNuHPsq6d8hUNAT32Y0pvXXXGp8AGFRq7+kdcQOPN2EHC8JTp6Ki0mGOjWYpZWv6z+
 rtBg/pFqjifCDXjxIkzK5eouhNBhRwMlJa713uCk684o/InH8nTeRXxYk1cJ7BJvUF7v
 bTalezpPvVQwyWT3ArYpPQOBOGUs8i8Nghu7S2Duy1EKbhaGXFgOW9ZLEC7FMp7D6Vpu
 QHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8/BGGq/QH0s2OVfDeopbmaZFz3D1KIp/wJ9aLF5GcOA=;
 b=0Grbf4eHektTd2+I1JuWCb/czkIfLVvHksGrQMyZ7cfAIdUh9aPscjY7ljuPuZnTkS
 lp2hEmLH58BOIWPU5WlS7rQdG/ztcoxfhzm/VBmZnsNvR0ZqigpJTjl1j7fJJF+wYvk1
 Jlk9Cik4SOUgl8XhS0gY00wyg941nWHqgGD9ROIDW/zM3P9HrL1FrWOULW8TozVf+DrO
 eQ/ppp8LPqYJ671RTcAvk/iZucIrZsLRlU7F+K3mQhEudmwnj6j+wMxYm+90+yn119+h
 kHfJYuGj305sKfWZPjOyqer2FMOm/4WMmvA666lZB/4+z/DYZnzPuCoYN4Wp0rEsvPpN
 QaJw==
X-Gm-Message-State: ACrzQf2U8ycXCvC9R+mLKyl2gkxzwJ1G3V22ainFlCU0npAq6XRiZSvc
 Sgtl3Qh/X9OpzJzeLxX4xiy5WJHmhXZv2pswZrdZhQ==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr11783402pll.19.1666014535602; Mon, 17
 Oct 2022 06:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221016220932.274260-1-richard.henderson@linaro.org>
 <20221016220932.274260-10-richard.henderson@linaro.org>
In-Reply-To: <20221016220932.274260-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 14:48:43 +0100
Message-ID: <CAFEAcA9i6gXEcQ2F6=Yq70iCx_XiRdHRu0V8pTEurXYDotmA_w@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] target/arm: Enable TARGET_TB_PCREL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r0CtrODuuO7l

On Sun, 16 Oct 2022 at 23:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


>  static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
>  {
> -    uint64_t dest = s->pc_curr + diff;
> -
> -    if (use_goto_tb(s, dest)) {
> -        tcg_gen_goto_tb(n);
> -        gen_a64_update_pc(s, diff);
> +    if (use_goto_tb(s, s->pc_curr + diff)) {
> +        if (TARGET_TB_PCREL) {
> +            gen_a64_update_pc(s, diff);
> +            tcg_gen_goto_tb(n);
> +        } else {
> +            tcg_gen_goto_tb(n);
> +            gen_a64_update_pc(s, diff);
> +        }

Why do we need to do these things in the opposite order
depending on TARGET_TB_PCREL ? If there's an obscure dependency
then it would be worth commenting it, but it would be nicer
if the semantics of the functions were such that they didn't
need to be called the opposite way round for the two cases...

>          tcg_gen_exit_tb(s->base.tb, n);
>          s->base.is_jmp = DISAS_NORETURN;
>      } else {

thanks
-- PMM
