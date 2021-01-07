Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp477549lfq;
        Thu, 7 Jan 2021 09:32:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweeVOEDmYky2hgnqgyr7Dst5xF7Nk7GG9YnpBh7tIzw6ryC7cgTcHQ6jfRBB6OL727eC4/
X-Received: by 2002:a25:2d5:: with SMTP id 204mr15553481ybc.204.1610040745867;
        Thu, 07 Jan 2021 09:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610040745; cv=none;
        d=google.com; s=arc-20160816;
        b=HiheFfdHi2kWmJGDFVKnI8NQA0QP2R6L3JmFKRRnOUjuVG6mzNFW7jYP3SRnEKypVQ
         8YVwRXnnrEmHfSLSjaI/Vxb5p19O9oNci4caxRnytBEsuLPdW7K+KlvbkvCnlMhTQ27l
         TDDG1i84h8EGJ9Ngxsw9j8Df4lVgOoRPq5DyVWkiLh8aQ+E5rU29WHPPaCqdnLwA3Pd/
         KZAOO77P5f2Pb8Ta/ephqdA2g+Rz0zeWwxrki+DdMc2jJKAV6Z+MYEdJt1tY2+BDohxj
         gxNtWeEj6vaYz48LF8VpuDTSh3B50AFy3EP+KbMG//pSPBj5Gnye4P1GTKPvM/IMMG+I
         uwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mvTLsZ5nw5HzzJA/lwxTKgry2kh/Z8ZHZttFBx5Yi7c=;
        b=hJ5JiwC+Tbw7osSIDvEhy18EkzruQ2mZDftw9iEUqq0DjOrWvzt535EH8B0ZJhHiy8
         H9Rz5yIz+Vr34yOBLFNZ+lMayHFJ4277sjYI8DJnqPNt9F6vJ5ykp9JTy2tLViOVADNM
         RhnriSSThRia8BZMEkswGFwYFzFB8c/y14Yb2amvX5O9cof8ZgI0VIB3rip/eSk0YwJI
         sU0O1AkkekcRyzKa3wJbOMcCLz15Vab3rvFBnTIVB9mHVfdZvfWt18yzwQhIL/kBnvd3
         3uIIIgrhGWgnY6ehUL65GMp5m8AdiM2zjMd/nGgGA65LgrKJOs5KKNk/tyBKcH3AZrKp
         Z9yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afHUr8pp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si6352288ybo.308.2021.01.07.09.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 09:32:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afHUr8pp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZ97-00060R-A2
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 12:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ7R-0004ec-A6
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:30:41 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ7O-00089D-QV
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:30:41 -0500
Received: by mail-ed1-x532.google.com with SMTP id dk8so8587058edb.1
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 09:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvTLsZ5nw5HzzJA/lwxTKgry2kh/Z8ZHZttFBx5Yi7c=;
 b=afHUr8ppTPjfOOlbK4w6KkBhLfKrA+a1zHcKBuUdH+l8IYeonZyRWWxnx8MPuoq4FW
 1Jjp9AbJ58wJMvXO2tfpDmffNyiwnF7z25at65Xf+AkfybLB/dVZD8el0KeX+ABxPHdj
 WUedb54kTjCauGUCWsFu/G2vh6Vbq+aZrMBfnIZBTVSE3X3h0AgWPD1wE+VetVA2a1aW
 I0Eiutxqs09DUk6TwkiZvFTTwVYHNJa0ricPfyLmtMEQzf/UwzjzE9BXfFAadV25+cMG
 beLuFOoH8vH4s330DRm850Hh8Iidl34oN0eClqvP2qVMY220wiEt+s56Iuw1oIqGpivU
 OmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvTLsZ5nw5HzzJA/lwxTKgry2kh/Z8ZHZttFBx5Yi7c=;
 b=OOXAsbl3AXcg2OjZXj8BvctqHB9B1kplJna8e+13ihdsidcYQ7v9JU1lNCi9bLAx4I
 ApBJBqrtcZYxwBVyiYHzshNupq9lgS6Yq/NRX3S1hbLI9rvDtr6uOraXKKsS3qsFwN0l
 YwkKkfsy03gAatBJziwRoQFW8ePRCELIsMFB56AWw41HGbxWnlK86y9XiE8zq+IncJMT
 HWrDtKrhjO2ZBThshJ4WIbFaTz6VtnyLgVVddxfvpP4P0qYZUoSEm9y9bprqeV0qFRe6
 tdP072RYgym9ou2pXmqjPvqisbe+BJ13RzF/X4MvMoKXZ2VUv3/KlyeieIyRMjIwtvaI
 QXQw==
X-Gm-Message-State: AOAM530xnQ0SmCnTx2/8wcPxMkn1DgJxWxsoW/df0MrhAJq16mznQp3E
 vZHjDjJP8Nv0BF3pq5upufydtWKaMueSNvdWUq+JDA==
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2511354eds.146.1610040634479; 
 Thu, 07 Jan 2021 09:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-18-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:30:23 +0000
Message-ID: <CAFEAcA8Hj0_hdjXy6ZM_So3Yn08VJ-DBgG1BmSQfKRny0vPCDw@mail.gmail.com>
Subject: Re: [PATCH v2 17/24] target/arm: Use finalize_memop for aa64 gpr
 load/store
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LZb5eThpal1g

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In the case of gpr load, merge the size and is_signed arguments;
> otherwise, simply convert size to memop.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
