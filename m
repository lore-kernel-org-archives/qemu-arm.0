Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1260888lfm;
        Thu, 25 Jun 2020 05:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzQtotoK0iULgm7uFiSav8KTJlf6IjbP2e/PavrXWjE7lG5Mgj+FaGeoqHKapU+CqqxeDD
X-Received: by 2002:a25:beca:: with SMTP id k10mr54178138ybm.9.1593089580251;
        Thu, 25 Jun 2020 05:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593089580; cv=none;
        d=google.com; s=arc-20160816;
        b=uA838WVf3F92/XLkVuha7YIh2DihWoSkBLoKSoeIhuifPY1nK6/afLgEEZsNaU/gRz
         4wpSJLFdgup0/Pzd75FfdHYzVjAPwhb4ZbD/wwFQ6g8rlcarEV42HLgEfaC5C+AdWGaW
         17dzHr68da+woneozPQ2/5ev5yHvPLIIPqhq+PdiMcqA0xFnEVlAMXgsZAl4ca3e+1ht
         PLAbkOGsRDZCdhNaG+3LokRb6ZAJ0CZ7AVVR6zrRh7BZF3bp8De7hiN9IroaA33Li08W
         3X7ucKf8AIDw3OyjrptsmjwmDPqpvV5mIQk/P6P4Nys1Dfa9RaTYAgOvrIJYicEQb7pt
         OnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TRmR5jxbbH/BD3vaeRPCJmypThe5SmJR6ikhO7kPtlQ=;
        b=SHzuGQDcczBvTJAg0Wj2nM9yBmP7dShcwKGgvcSO+pr2EVMBrEeIWZjfRHp1q+Yu5t
         L1Fgkj8ZV3S/XnKshtcWP3uT8RliN2RPGe540fXTmN7/m+73YJWUeGuf9vF1yJFp0OYX
         3M8sQDd9r2GZVgonmQXzmQBMB4qNZbd5timA4gYEwqLf5w1sW9S0XD1KIZRZ8La2gPmt
         osNkwpUE9Zrf2CKvKI+Ip1mSMiDdJnfA7KFkGs83elztcfh3Yc+S4Pcg3rd8+/z38Jvb
         Day4zWJDQ4JC8/R05sctN/QA+5csB5c9fijRy7PMFxqwb0uHdevBK7+y2QATmT+LCBrh
         Vzjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rWapsl79;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o196si21919987ybg.262.2020.06.25.05.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 05:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rWapsl79;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joRND-0000pp-M3
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 08:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRN5-0000pR-Ne
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:52:51 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRN4-00026b-3r
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:52:51 -0400
Received: by mail-oi1-x242.google.com with SMTP id h17so4846673oie.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TRmR5jxbbH/BD3vaeRPCJmypThe5SmJR6ikhO7kPtlQ=;
 b=rWapsl79pfwmxqonKF0dxwWxkSjE8ualxWXEfXzGUTJ4RuylsSUc3EX9oQhwR1IvJO
 Bir0TiVYp9LSpFcK6n18Q8n2zcmfLOcE0F8NFtMpygcDfpM4IBAUXzqHJTph93MhxWTd
 bffgytpZUBfKRkyJ6VEEYIp/ZsyMZqxzaxkP+Hkjy+UWz3DyIkgtLqB6YPViCxPV1i2m
 K6as0JxFRm4sN6Al/b5tB/I7B79T4YgLdczBXM18M8TifqF6Uc0m6229uH8pVSYi66u1
 gxRCVYP/JgPe7sSXvQywbciYbpQwZdZZEPb4biJLM4zcbllG0JKjQR6fJJX6yIWNnA45
 Ycww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRmR5jxbbH/BD3vaeRPCJmypThe5SmJR6ikhO7kPtlQ=;
 b=fO9+M3ZmF+hbAvyKH1i4mQPgNWkUf7hO8IKBCkWKbxPa528k3JP/f5nQUXxqTFqGqi
 vQYJYeE1bmnYLrECrfZsiCe+vFp+OX0nm4nRcLeJY8e3op1L91jB/8sRq/H68MvVSt3r
 jRv5Z2VxPI1W1mqLTo76K0kc88MXuFEIdaGuifEfWPXlVS7+L3mGXqNgg6DqzjuaFYDg
 AgdcdNRoZrFUZAng/RIjaBI4OLmVrJxNmUQKKH/jq8NU/FRBCprrEeWeM1H4yHQNh5bH
 6ln8mVVi8JwX/R0Crq3UOPtXQ8bYnZ5aITGuSr4+G1TcIWMPYEH/jDranSnwbIuN8Lao
 pEJA==
X-Gm-Message-State: AOAM532Lc6zuAwtl30hp0hM65cLnX7+8qNkqV9ndEZemvKYe7NZTvvBD
 44v3ZvWMY3kiHkCXdy6fzC4kFh5fp2Z3rtBEIE/2Bw==
X-Received: by 2002:aca:568c:: with SMTP id k134mr1868783oib.48.1593089568750; 
 Thu, 25 Jun 2020 05:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-39-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:52:37 +0100
Message-ID: <CAFEAcA8xy_Q-6zXexBEHLR=WSYTXVvttL9V4HqiMPmtRm__TEw@mail.gmail.com>
Subject: Re: [PATCH v8 38/45] target/arm: Complete TBI clearing for user-only
 for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z9v9tgtujbEw

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There are a number of paths by which the TBI is still intact
> for user-only in the SVE helpers.
>
> Because we currently always set TBI for user-only, we do not
> need to pass down the actual TBI setting from above, and we
> can remove the top byte in the inner-most primitives, so that
> none are forgotten.  Moreover, this keeps the "dirty" pointer
> around at the higher levels, where we need it for any MTE checking.
>
> Since the normal case, especially for user-only, goes through
> RAM, this clearing merely adds two insns per page lookup, which
> will be completely in the noise.

Can we have an assert() somewhere suitable that TBI is set?
That way if we ever do have an SVE-capable linux-user which
doesn't set TBI for some reason we'll get a useful reminder
that we need to fix something.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
