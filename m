Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3397244lfy;
        Tue, 25 Aug 2020 05:40:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpSzpgFOV8k5S1bvOHNQZXGCOOFJGVE2HO8yycGO8Pp/BsnJUOPlePDpGCJDj5elJVgUoX
X-Received: by 2002:a25:7341:: with SMTP id o62mr15495755ybc.305.1598359203692;
        Tue, 25 Aug 2020 05:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598359203; cv=none;
        d=google.com; s=arc-20160816;
        b=rkO9+Z2SHSgimDHBLPwQNrfWoDv+j1GP5unJRB3WBrsb/UdYQ5VvNBynMebkuyzK7H
         PY+jcfvC/F1Nll3hnMog0/+L9ll5k0AW7XPfR1csHEwv5yBnhMU5A6BjFeri3SBQa8s1
         H413XhM904QONBpgWbtGtMbt6GjXphcqWgVv3EOFmcCcbcI+U1ErkmwU8hWVIcZc0Sxp
         6QE5WvoJXfidLcB1FZ5LuF0LyE+EY+XZ5XbH7QtUmULKKku9cmtVhold74tI1s54Tj2C
         45fijCSFAu/J4iHHT+uKC+ff64gNjzcH6/MOtv1/G/lxkf4V5bNFONPV3bCTbGR10TIY
         1qpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qDG5L3tmh46vTBVfQ/EIwrsUYYSiNhJWo3VzF7A1D1I=;
        b=wv+rlhBL1GRa1NXWc4BYQzbOCJyTswTHrRnpfL9mVrHYMVSuu3JDbaGkUoYA2n4nMt
         esamlAf4p2W+SzOF2b+UUBlDyzR4gwBGrAjdWUhZ+bH6prIYn1ignacE927rwspsMMMH
         15ebIT7aMIXJ8Ys8HZnsVgiUUnkynaurBaGb1B0VoiKVyae+1n3BJ980zzjWFF2aa0Hl
         TTX3ibdn2JhkQ442OgldcOucSxYeaYBxStyLYFEdZu83ovGQdMHHrMtT99wWQWTMNf2X
         ytlELE63gyLb6j22TMtBoisuFjYuBJcxVI8l0s+3cliZAMPckvZ312mQIB/wQvpZ5gsr
         nsHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AiIuX5l3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si14346993ybi.402.2020.08.25.05.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 05:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AiIuX5l3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAYF8-0001wO-P6
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 08:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYDv-0000W6-EK
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 08:38:47 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYDs-00076v-Nh
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 08:38:47 -0400
Received: by mail-ed1-x544.google.com with SMTP id u1so906530edi.4
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qDG5L3tmh46vTBVfQ/EIwrsUYYSiNhJWo3VzF7A1D1I=;
 b=AiIuX5l3ntBuAlXo70yYuJf8yvChAMDx1Z4Y7wvIe54MPU4rHCqHa/Dd68RngNGD8w
 AOHzNmmr69vX7CyHG+J+w+q1Vjiq9Fq4eFV2v5pZDIPq8GdcQp1SRbOEvmNI+0qYoodM
 9Fb+KzteYmA53A5V12dQ6yjPjO3BaWxRq2WkjWFDa3o92QZQDv/yHDRYPLLRwSdOc2lf
 umPDAtYEBfelTUpQOkcYP/+GNS74pNsescAwtzaBuLUve0f4b0kM6FbBSxLTDSHEJw2D
 Du3HM4zvPw3RH8CdSSd9fVWZr0C9qhzMfQSPcZLc7/AxjPReP2UEvg8dxjzu48zCJKx+
 8mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qDG5L3tmh46vTBVfQ/EIwrsUYYSiNhJWo3VzF7A1D1I=;
 b=OOUjFfVu5f5E3gHzcYgwwcjgGWqQUT5I4IK2/GWrKzMXp0rtp7vDTVyleqJqwVsO1o
 fBltUrihJG7EzvDzEBHWqKqkFJWICeX+QW4Zm5GmEexS+nte/pJu+/G9wuz1nkCEmqTc
 aI+iLapD7ZUo3s01YU6xlp2ArJxAyBxOA6hJ/CV/4Rn6vp3WkAoeQ4BVGgUcCfCNJ6pO
 n3GT2cfspbOUwGqYhyMPp3V4Wyryb9kvZFUbfQUrzDMp5kl8KWdjuiExeUpe1wfFRtjD
 goByr1LTQJhEY6buz8I+/fJF9pw3ryezC7wzl+TBZBuPpC61T60NzKo8oGwYrfUO7nXD
 rV+Q==
X-Gm-Message-State: AOAM532iSuk3COdYMJ2xRtzAVC1JnEpQJuXBBINiF0f3FiAxOmJgReUR
 0vh2jaQodTpfFi2Sq3Q8AwrrkTmEk5hOfjPr2VSbWQ==
X-Received: by 2002:a50:da44:: with SMTP id a4mr10308200edk.36.1598359123316; 
 Tue, 25 Aug 2020 05:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-5-kuhn.chenqun@huawei.com>
In-Reply-To: <20200825112447.126308-5-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 13:38:32 +0100
Message-ID: <CAFEAcA9OYmEmN23v5vpVmbmwYUbzN8m=stpu41wGLFmeVe9yvw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] target/arm/translate-a64:Remove redundant
 statement in disas_simd_two_reg_misc_fp16()
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Pan Nengyuan <pannengyuan@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ev9uRgANLFCO

On Tue, 25 Aug 2020 at 12:26, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Clang static code analyzer show warning:
> target/arm/translate-a64.c:13007:5: warning: Value stored to 'rd' is never read
>     rd = extract32(insn, 0, 5);
>     ^    ~~~~~~~~~~~~~~~~~~~~~
> target/arm/translate-a64.c:13008:5: warning: Value stored to 'rn' is never read
>     rn = extract32(insn, 5, 5);
>     ^    ~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> ---
>  target/arm/translate-a64.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index c83bb85e4e..47cce160d8 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -13016,9 +13016,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
>      fpop = deposit32(opcode, 5, 1, a);
>      fpop = deposit32(fpop, 6, 1, u);
>
> -    rd = extract32(insn, 0, 5);
> -    rn = extract32(insn, 5, 5);
> -

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
