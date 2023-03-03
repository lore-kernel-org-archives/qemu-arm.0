Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1412841ejc;
        Fri, 3 Mar 2023 10:52:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/8drgxq1aPmK4Qbl7oUBmug0GBqnCXTWgq4nI69Th1vd6oYoPCShcK8bJDPe702btXYGvW
X-Received: by 2002:a05:6214:ca8:b0:56e:c238:b719 with SMTP id s8-20020a0562140ca800b0056ec238b719mr5258643qvs.2.1677869540545;
        Fri, 03 Mar 2023 10:52:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869540; cv=none;
        d=google.com; s=arc-20160816;
        b=uSzW3SeZy478ltqJ3zgpxG1oYDvBzw1CHUGV/BND6x+QcsKT6a3Tb3n6ixwKB0ws2I
         /t3cQWBnAuMri2GLnEQvxbWpn7lxlhUNet66ZqSWK1N3pYy1VXzme1pKyLFHSDzUAG2w
         oqMCZLz1An+oYjU1ZKgP087ivfAYH5eNr458KFZjiT4xl13bZWNBRO3AZQMQQc3vpF7K
         Wf+h9DMEgoRfl8Kjt07oivOh5IPYHQuPcenRb533vET5iUjhaMyzallunvAgFfRsje6F
         8vtTFmZtaxtPRvQf1Zx0TCtWBESYjWFm9A0+OapzfTQgPmJzuDldxiu78A4+M1F0OfRU
         Wpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tp5TZu9VT6ivsJzAdWz1St/BEwsgSK6X0Masrs8K4dw=;
        b=gmsQR2a8BODepDpJ+6NO48Ib96+j0Vcoz0qPAOohUP/6mlNkdYZpis/ZVnoCvi5BLB
         Y+mPtkp8cJnkOUsDGEf3I+gvOx7wmzaoGIxn0vmslkwiddacGtUUYaclTYwi1qkUP6Pl
         HXrqr8XYES3rb3cRR2NvJUbXc0s59HE5sAH3SJkQhfYRJo31uW5jVCk2EsZRAWL1heRR
         SFydfdo45dL5hXW6ZZ/LuAJuqYHfGhOVeaqY3GECGq2EFSkOevmOwmglJ3pwMmlbrAHJ
         R9UIui1dvD/VJJd25FB7idzW5FAizHO+fLOgN8DZ9FKOp5nht+I74m5nkjWL6H0FjGE0
         fOvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ej8U60bK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1-20020a0cf141000000b00570bc9840ddsi2138983qvl.237.2023.03.03.10.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:52:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ej8U60bK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAVt-0003bI-OX; Fri, 03 Mar 2023 13:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAVs-0003aZ-Dk
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:52:16 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAVp-0002vD-Ra
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:52:16 -0500
Received: by mail-pj1-x1036.google.com with SMTP id y2so3532971pjg.3
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tp5TZu9VT6ivsJzAdWz1St/BEwsgSK6X0Masrs8K4dw=;
 b=ej8U60bKGtWB1JksTNw67/kpFGq7l43FsffPZYsDl6JYfZRsikMWs5kHdQtKRAB1lE
 mWBvgggcGnbY3sdUzQh6Ym0bJS2HIBV+JPwdfA9JLb1vjyTS8m1NJB+3+NHpYZ3TbKrL
 92/E2O+BGJG7YgbZkHNIyq6soJKmte3XLoV/VOjA3xQQ+YqzbEuWjniCUYaZl5+3R76u
 Jd0sGEx6mF1ttR1qygIO9dZSlQHEy4hipkF88+7HQeRe1jyEppF6pD4mwLzIQrlHvrUR
 7fS1dWxlhyMrxk7e/sYjl4bRsz5iQFRAc6fO9UJB+HEe5rTe37PwGGh8x+gecYf6ITAm
 iQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tp5TZu9VT6ivsJzAdWz1St/BEwsgSK6X0Masrs8K4dw=;
 b=Z3SjlQW92n9vOO9BMRYTOoEGLQFxCzNHz+L4YvktbgQR022Yu/JuAmwsZ2CHiBwWHB
 mH7wq3u4pXrVt2vzui+8r5qMMGpPEDurFxcH4UNW583gAouACZoCTRxO4LcIywoOoY/J
 ngat0BZGydwW+xiCvtkEip6UG0TJRBTbtWkoRS2r9Qtdh3JV7jP29g+rYIRcU3YdoLIC
 nj4IaQ4rptr9B/e5DlZW2gK147dHeu+CcuzC/iAYO1IgCGrXUrSutH0UbOopZUahuIy1
 U05AL6I2tPryhwdJllF16dPw6e/oJrDUxomXd9TWnX+qY/F3L836hlirrWe8+TWs5lTo
 5UDg==
X-Gm-Message-State: AO0yUKV+pPvkYl4dQplMVLFg8ZLfiqxj9LDK6eNtdTGWH5Ns7pxm21Hx
 D9lA0Vy5f3ukU1UQuUuJcNCHNkw0qXQJCzPx5t/YnQ==
X-Received: by 2002:a17:90b:241:b0:237:ea76:41ed with SMTP id
 fz1-20020a17090b024100b00237ea7641edmr1012358pjb.0.1677869532626; Fri, 03 Mar
 2023 10:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-50-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:52:01 +0000
Message-ID: <CAFEAcA-z6qz=w5uLySG=F_OQ7MEJnJ7_K=Md9-GTYVvtC9t2Aw@mail.gmail.com>
Subject: Re: [PATCH v2 49/76] target/openrisc: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: w+DYW77caSeG

On Mon, 27 Feb 2023 at 05:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/translate.c | 39 -------------------------------------
>  1 file changed, 39 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
