Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp378464ejq;
        Fri, 5 May 2023 05:27:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7YqPBL/WK4HfzQj8TCuwkqRteqmusbyPN8rGAThUrl5LuLwjh10Ainlo/KDBJOv4mFn0nF
X-Received: by 2002:a05:6214:246a:b0:61b:17bd:c5fc with SMTP id im10-20020a056214246a00b0061b17bdc5fcmr1836989qvb.12.1683289676897;
        Fri, 05 May 2023 05:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289676; cv=none;
        d=google.com; s=arc-20160816;
        b=RYWWnJrN/bSXAIG7f5/9DQjiDAj5Q0eW2dpZN9UVJgOdLljKUHxkqVYtQ5oAc/q6DZ
         INDepPlZxbDTXcEWGObxEa0gSVBvFFPT+yzv4F0lTbF1s+EDypsGTKBOZU8jem51Yl63
         dXzCgo5Gzposec41VZxJ/NQdOmDrpB7AkD5W+m0R4uXGR4PTMLhxO0Aa4lNxsMCqWGNb
         P2MgWRxiG0M36ui3vxTwuqCJKBWrtayXegMvexrXGn6Zd9jazTcscHnyhITqAcgIhQhW
         TfIe9ICN9jNaL+h36HQsXUunj/7zM5fj7sYQ8MlFwbOIpjsWaZSTcYWTpCNgFcPHKUzK
         eWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2F1zis0eSGuvuvC1CHrwppmig0EsQfqxjrY7ags+n+c=;
        b=g2ECWmOZhyAI5EHQXDMHHO11YCAktM3ZnR40/N1qSJ1iNPGNEM2ap3NmRYV7g5u/qp
         EWmC+8D+knL5CAdqAbVwccfkCFmaP0P+fWKUSKuC4OmYL5rI14l0Ne338p30aj5mtYVU
         0cRKEXSHCFefgb7XugowUueArGfKVZ18vMTpIt/y6b52m401bAyKUBx53pwr6i/jfQ0J
         uiZ6CnJZ5S87uEfkTxC8s45SH0D/ySjehEoaOJa/Cmzn8AOTZKYmL9zDaapU+0xP+3wC
         8mIqBDRlWbL/e1OMqY1mfeWjVCglQRKJYqMCX/BqUD7PsLl8HrmqyH+9XeyFaJO/Qqn0
         IFPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWg0emqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx11-20020a0562142b0b00b005e8d8daefb0si551034qvb.537.2023.05.05.05.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWg0emqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuXP-0007JX-Cj; Fri, 05 May 2023 08:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuXO-0007J0-AA
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:27:50 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuXM-0002tW-Mf
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:27:50 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso2947145a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289666; x=1685881666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2F1zis0eSGuvuvC1CHrwppmig0EsQfqxjrY7ags+n+c=;
 b=VWg0emqI7GA8hOcdlTJORLW7q7ml5AUoT8YzS+xp3odTs1/kk330qyHb6UXrNqLNaW
 Hia2NVcVIBi7F2cvkweDALF+LY0nbvHiRXRuJd41VLViA+FR5FP48R3AkD0T9Sw8vQcC
 HrQuj8WwsQPU4ep3vrumByWG+getnTFhodyY94iSTnAxppslQ7o3lg4AmRbyfuxOsuCU
 imp60jRWJxjk9RUqR65Qlcyw2RxHt+auhjDv9FhXnJuigykjQv61L5ql98pWsz/7iEtM
 eMddf9HMHVbpOwmDgqeZ8J4EcNdFG49rEga6I1wY7A1VI3/A2enyVwHuKGwiwj+Xraxu
 TtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289666; x=1685881666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2F1zis0eSGuvuvC1CHrwppmig0EsQfqxjrY7ags+n+c=;
 b=ZAVhGbDpvWWeK5fzYfl34twOL9bykuVJVxiV0hZXF37PYZiqmZ8UOA4vcj82LyBTDk
 oj/ZG+8f3fGMWuDA7D569MS2gDr3V7g6TEoIDDywINo2kzFV+P0x+ODr4JbWJ/wLT45x
 pBHvqH6DOpXX4g+bqHrqkNTkSgs6PGm+ISTZ5ANjkmSn5A3S1n6Nuamt16xm6zZBn1v1
 /+31nSyPxvylP3CXOR2BPS3m+WVdEP8fsgI/wioZDRtbuv8vJBQXXsXn8jgEFpUJmJdy
 q4MKvWHpE7+GTNoqGiRe3jljkP1g+9t1Z3hXe77LiPk08lKvUOT05Lxfg70f/scxa6QZ
 2kKQ==
X-Gm-Message-State: AC+VfDzYnL8NcwG80E8BX5Sd18u+CYHnJTDq49I+53wrkkH7poNe2Bw6
 AXTuNhfQZM+d7Mub9CEWqO0H5J6+FOkl6F84Xt5A6w==
X-Received: by 2002:aa7:da55:0:b0:50b:c780:2581 with SMTP id
 w21-20020aa7da55000000b0050bc7802581mr1184503eds.5.1683289666062; Fri, 05 May
 2023 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-36-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:27:35 +0100
Message-ID: <CAFEAcA_Xw_EHn+dbm5-Uc9NnZwb3F_P5sPZz2uG4yVg5UTX+Hg@mail.gmail.com>
Subject: Re: [PATCH v4 35/57] accel/tcg: Remove helper_unaligned_{ld,st}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: 5gBcZy/mG3Os

On Wed, 3 May 2023 at 08:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are now unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
