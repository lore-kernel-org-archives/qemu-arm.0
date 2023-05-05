Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp292043ejq;
        Fri, 5 May 2023 02:45:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4MCMlweI1hNmbYAmIWk/3xoy0kVAPbZ97ajLKOnT141AycZKtYxGQVitgJBu41dWfnPB6I
X-Received: by 2002:ad4:5b8b:0:b0:5e9:48da:9938 with SMTP id 11-20020ad45b8b000000b005e948da9938mr11557934qvp.11.1683279927943;
        Fri, 05 May 2023 02:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683279927; cv=none;
        d=google.com; s=arc-20160816;
        b=zxcb8HR12ogvtsi2kl6KZFAhxN3G1D1Vy2Gx5kiBo0Vyb7fo+aE4rLs/hX1vS1Paqs
         coGE1XfrYFU0PsbAbc4eVu0YhH0rh5h2eP5H81bJ7VehZTjQQZ82CRyYKbvOKmvTvr9D
         iN8arpCWwIucnnYT+kOI5mwuIiHEL0rCP6yyP2acjJeP1BkETOPW5XEtB2PPHTHEcv/q
         LoyN7BdLnXIs/Fj7EpR/F1BI2uFWxXHoqZMHeD8xy+QxuU528kLX8STFVNpkWomK/zUd
         pQsyH3zb5Fj8csWfxlW77NhjghH0dc67hn56wWwXpNDBGu4OtS5SNMgATJzycvn0/V6O
         EzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a1WD+C4dJ1IAEdT7Vk/hZTN1+IxIvCygCU4Mv4ZPKpI=;
        b=skgwA5+umr9QZV5leWtuNoxfVf47+ncS6u6xvY1Kq+Dn8gFbDB6T7Vf4Dr7f6Qu7xA
         ZO/EijP/jx6QDkFdx1vcezjPbJ02nXIm3xazAqeKF/tVRmWahYUvrxKvWttzhry5bWey
         aH5U1X5lF5S2EOlYqiBIHWCPUIlIt5eKHjQjOnCgoUn6gt4vZVAqGGQTBEizE1kFZdQ2
         rr9nfNb9nQ9z+AhHvZJaHoRVmH6tS/cRPU1ZpUNI85GcQ18F9FmKzkQli315gvBjc1do
         Dm9JFPRK5uLqYnelttjoRNIuUt8sCAywtqN7pMfJLbN9tDOpw6cnzwod3GF/i7ZntZBd
         QQpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DOcqxeSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a0562140d4600b006194dfd52fcsi453361qvr.594.2023.05.05.02.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 02:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DOcqxeSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pus00-00077C-23; Fri, 05 May 2023 05:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purzt-00075q-J3
 for qemu-arm@nongnu.org; Fri, 05 May 2023 05:45:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purzq-0005qw-3u
 for qemu-arm@nongnu.org; Fri, 05 May 2023 05:45:04 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc2feb320so2423055a12.3
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683279899; x=1685871899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a1WD+C4dJ1IAEdT7Vk/hZTN1+IxIvCygCU4Mv4ZPKpI=;
 b=DOcqxeSu/bMOczf66pZ+OHLAFH+Jr8gZCsoI4/VYVy26cgWL8Dr9oq4rP+V+kzUbjk
 4cxNXbe9shiWhZ/RNXObm3F/PDx5dnxSG/dntcqoqMu35n5smjFdbuyj+diqnOzUUQiX
 E7soXGucW4NBPrSGd722qqTHtQBjpmUzEIoNwlz90Jof/sZbqL3MhwgFqlxAlkDcBbqL
 Dn/O5LfeyGVcUIX0xaf0hvHzQMvDlb9GOR4BcsR3NMKXQSu+/PkIkgF+ulhG6JLGWZ8q
 RpVwd0a0dE1xchV3CNih/YfKCToRAx1+1ivVDEwCMT4L8kP/BxUjAOehljCT0R/e/1u0
 hNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683279899; x=1685871899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a1WD+C4dJ1IAEdT7Vk/hZTN1+IxIvCygCU4Mv4ZPKpI=;
 b=lnEoK3GHGY4JYfFk0wAjdBZ6qL1uknS5vb5JZtgZX0vuCTcLvRQuYdeLPCDhqEFuMU
 CbCbObVQ8N9sZjC0C6iKt87XEcjWEDDPyMCJQls47A2ly4nV3mJZSLYQPHmj8Je/aLm9
 iJ47sS+DP8oHlHPlLhtleVGpuxQZuGEi6aU8c9TfpG7HGVt09fC4Yh8j92nf7ALu1nPQ
 EnZzGk/hM9NHqgy3urVOPfR2sNHlTkwWuZz3lq6wftcoqMcNJtlmM0ydxR3jtoXL4cV6
 em5BHv9JDW64l8VRkG/jCBZFly10BPwlMP0lwBt9+vG6ol1NHVCLbgypdgCySxQMQWwm
 0imQ==
X-Gm-Message-State: AC+VfDzYlDYIgzf7y5XmGiJQmhjc0UiL5oQUZ9x+//50+JGNoYzy7Ppp
 ENeAsr12sLkfYdX3R1Zdm9ty5Yn+xmxRZdw8Id5UxUQODajgvqQe
X-Received: by 2002:aa7:ca57:0:b0:4fe:ddf:8d8c with SMTP id
 j23-20020aa7ca57000000b004fe0ddf8d8cmr915781edt.13.1683279899509; Fri, 05 May
 2023 02:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-12-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:44:48 +0100
Message-ID: <CAFEAcA8gc7xkrkATWkrb2=vktB6zpA2TS4s4bZvHQxvdArQB+A@mail.gmail.com>
Subject: Re: [PATCH v4 11/57] tcg/tci: Use helper_{ld,st}*_mmu for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hqsCzxVJVdyH

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can now fold these two pieces of code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
