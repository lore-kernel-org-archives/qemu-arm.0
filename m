Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1601232lfq;
        Mon, 11 Apr 2022 05:57:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKWyWJ5ng+c/ygo56Tda8PBHpS//9U0MWk1KH5f92x5g+A/AAvyOtE9ZvgUboQtXExxKU2
X-Received: by 2002:a05:6214:21e1:b0:440:fa7a:493e with SMTP id p1-20020a05621421e100b00440fa7a493emr26794341qvj.55.1649681856353;
        Mon, 11 Apr 2022 05:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649681856; cv=none;
        d=google.com; s=arc-20160816;
        b=AOPJ+3fwQvkEUA9ahDwyjLbW6Z36wog258NHqBKh5QSQxkQl7ysKH6+lvS4DaotATD
         Qu9PwF3R8AlXgu6OElKjIDxMXgmc2XXCOpNqzvlWZYfptbC/igl5mSAt/3hWy1NKrUF5
         k2SZgsJKfkOmMzn+ds2q1WBTUFHzlTN8qEh2uif6PajaNVkrOMa4H2SLIwa6g1rQvyv8
         APjFMZFhl1hR+9UJRgrZWmCcIohHaf/yeVSMRrAbZm7VHUQ3LhI1i7ldTZdDfEjtMNpI
         vvNh0R66dm7+QP6XX/wMR1WLI2V/A+ydZdsdSpNw6pcRhlTIzlixTag0+SUDezyyjhIZ
         VyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=10lACxEaxG10hmEYQ7rTcMokTMdrQksZmLJH5Yu9fY4=;
        b=RvhrQji2M6Apam0KbQGJTfZr2jM8KsTlqoaS9Tec8uHmTAiEUNpNa+rYV7e6uNAEix
         ba807U31TABtRhU/MBwaNYTPbGiVEPhsba86jZtHbR/alljX09dXJU7i86sHZuXs6jK9
         jlc0LCXYK6wXs4OCnlkbIyQw7zRaHm4xLMvv4tarrMecE2kgKk3ancnDvJfCv9VDmpk7
         36x6IMZaH+Ae31rmNnUmu/t58s7ATJRRmhw/w+rSzxINc+xJNZVpFnt5Gi8IPPHelkoa
         W0u4qcHd84kV4qEE0hMXnnXUHWQr1EXv+aIy8eE6KeTfXbP/h3p9bj3da7WkEjBnhX4j
         p3/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wOE7e+l1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk7-20020a056214508700b00443cc856d36si4414825qvb.555.2022.04.11.05.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 05:57:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wOE7e+l1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndtbr-0006cT-RL
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 08:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtbS-0006aG-Rj
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:57:13 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:39457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtbQ-0002bv-C4
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:57:10 -0400
Received: by mail-yb1-xb32.google.com with SMTP id w28so5187781ybi.6
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10lACxEaxG10hmEYQ7rTcMokTMdrQksZmLJH5Yu9fY4=;
 b=wOE7e+l1H7q6f/WpfQbf3ocW/oNC1Htvk2X3Es2vlyVYhvR6vr+Viy907+L/E9c5FI
 Gi+clH71dYl7s9PfIPsI5DMQcPP05a+Igdy/KY/hd/thtO5pNDemlGBx46hdZcexi/g5
 ifYbNmv6S1823D1sZ7QPJWRm4IefzFwMfhs25pjCOw80INVeeCs1ZSb7emNCtuZqPD0+
 RKMY3l5NwgSCa0G9XMuojHd2fDRnIWPkHBC9+qUNuRXSbVRy4LW+gh/07QQy95dXudM1
 jO/gjM3efR0WxFCOx64qkH+U2x6VzUe5Vmh6BEhhjDoLoEBgytGsdaputh6gXdonT43J
 AEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10lACxEaxG10hmEYQ7rTcMokTMdrQksZmLJH5Yu9fY4=;
 b=MEL7iYYpq0OZTidlcc8CzBD8SSl9oOn+aO51KyZLsx5x51G8YI7KmnPQJ5zqT3MXNq
 BFjd83G6KyJud6EmCT/nUtw+/XJ/pZI98ldn9bXU1gYOokmkUlpgzNYnIr5Hv6+xtswN
 cM0b8HbgtfsPAIcE/oEe2zDT4voi1p3cBMfigYHz5cq9tGJGWk9vK40wyjogz5xEiVic
 HOTIRxg5J8oJqyOHsNYfDuCAVlkvm9hRrhDALZ35OrDrYzH1so+YiYi27MlVFEgb9gX1
 6h/HluI2G/g7Eoma70kxuPfTu4S1wXUdGqrLsJTF0A9Fmj+ldc3cTdOSgBSUJ8y9NyC9
 3RmA==
X-Gm-Message-State: AOAM532WZSvt49lkQ/GojptMhaHF5P7VdyZGPa2KdA2ZIIBXyxt9uB65
 8KT6wMe9GJzgDt6R7NMAgUPY28DFgFrg1BbnTLVW1A==
X-Received: by 2002:a25:3b55:0:b0:641:bd5:e3fa with SMTP id
 i82-20020a253b55000000b006410bd5e3famr9519386yba.193.1649681825769; Mon, 11
 Apr 2022 05:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-8-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:56:54 +0100
Message-ID: <CAFEAcA9yCpO9istX6E=3FaM44oJB8qF+j07B=fzdLvavYMcD-Q@mail.gmail.com>
Subject: Re: [PATCH 07/16] target/arm: Use field names for manipulating EL2
 and EL3 modes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wy2JWiCA2EV2

On Sat, 9 Apr 2022 at 01:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
> during arm_cpu_realizefn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
