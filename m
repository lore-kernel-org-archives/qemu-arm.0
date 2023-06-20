Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp351002ejt;
        Tue, 20 Jun 2023 08:58:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4kuXEqVE/Q0tyvlYekubAIUQBuA0eKx+5/N6K5pTmSwXPABKl8Rj9S5qw0CA0+k4QLzVLL
X-Received: by 2002:a05:620a:4d81:b0:763:9ec1:a987 with SMTP id uw1-20020a05620a4d8100b007639ec1a987mr4674721qkn.72.1687276704473;
        Tue, 20 Jun 2023 08:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687276704; cv=none;
        d=google.com; s=arc-20160816;
        b=CDDJ6PIibXS9ojgGU6MQN+YkvYNCb8xKWXrOUNSvvTvH+h3hy1b3XKxcresLvRl5b0
         /rKIKktV1hf3YQUUufyb8iBCAP3vFGaYDDQ3PGFe+uLAum1dDHu9iWwCZlkXlzGBRTwu
         8Ng4NpSigfu/95+FlgJ8eevl4KLnznqhWXa2e2Hsnz61z8tBaqLpPIBsDHw1AmeiJlZU
         tw1xekxDE12InubJC/+eKbj/H8XyBCn7v+tJBF/9EV04LzYkhDjc1WNZDd9SwLj3/HMz
         tIQshfDENoChDYCXoAl6RXGlv0JcjjhDVekrtGvRSnQ199CK+X0SOhFcjgwylNmnrhjf
         /aDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bX7xD1gi/Zj6TIgOtdEm/yhxqYg6z3RCy8XN1DX+kvw=;
        b=cD457BzqvS1LMK8/BgTyFyu6gxlqHlGBTwiRC5/YKWX6tl4XpBq0JAraPcir4m2XiP
         zDd8g8gW/t1ZWR6Uageqbn2MZTiCSkmiu5DrUPgK+KkpOIoXJ/VHOPSIpgnUm/3qOBrs
         DadDL4eVBRQucqmlBayG9TkbhzYBit4BPc+BoRXq1JBErikumbZ0TGP1xUk65c/cdlJ8
         U3xxTJWcf9CWfV2FBkw1aYR0cQnp2pvo1hvVmRu9V87utOnXjwiz43FnjRJXCtnP8BhE
         PVTkeZk7K1QH8cTXZyiDahyL0CQRxcrq5gw2fJhkqxed6ScdQY6he7jg3dEX0Sv/g5qT
         fWNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIIUrse2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020ae9e50c000000b00763b5595c66si484994qkf.207.2023.06.20.08.58.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 08:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIIUrse2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBdkK-0004cz-Do; Tue, 20 Jun 2023 11:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBdkG-0004cF-0B
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 11:58:17 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBdkD-0005zH-Ul
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 11:58:15 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f7677a94d1so6562721e87.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687276689; x=1689868689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bX7xD1gi/Zj6TIgOtdEm/yhxqYg6z3RCy8XN1DX+kvw=;
 b=IIIUrse2r13BC62uNFUygApX6FrEMYYUTSY8k+9PEGIPXYutb+hRNhaNBwcsb5sTrw
 xQFRQhfgIBywrnhSYi2I6qWJ2clHWfD+zgPodxLIat3+/TbpBbv2Kz/N9+oOQeVwcho4
 I9wj/YDhd2WxzPc3DkLo3FzzwuFmn8nh3l15ax/md0/MLPQwFEM2g2mVgGkH0uK5t/pK
 XncQ3pglExhhFY/FznaxVgB9ecHC1O20yzMoSLYA413KqY2R6g+uPQA78v5Rl5Cqltf9
 fX/VM8EonVLBD4mR95E0hJZxb8KajF9yXPV8MbXuiwOAs8I0WfZjnMhh0q9jTox1BtPh
 gPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687276689; x=1689868689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bX7xD1gi/Zj6TIgOtdEm/yhxqYg6z3RCy8XN1DX+kvw=;
 b=kCOTp1JtZRkAUr9XkeAqWE+HW2pqv0F78qYF0SLR4XXw8QMz8JPOGfzdlgsAJWypz5
 zNo6eW3+b3dMdafpMB7mcL9YlCXZ+64bmpUAxmsM80zmrXhhf/blcT/rvzTzENg4MXg9
 TwqUcbuAe0JItOUovHqCqWzs4heDXujkFl+Y01WBy6QH1ymLxRt4q87kOgVgiuF6Ko2Y
 4yI/OkbjRY6qPCN1+qiC1VWGyeLQAn++OjxrqXVOmX/0iBQ0Vc44mrdfK+jdkZYF28GS
 6N2OWbuZpYxE3OY7kn+RuD1cFGxx52qb0m41kCbrt9k9cvlodT1YzStfYARJifAD0YCA
 Rh2A==
X-Gm-Message-State: AC+VfDznlnwxGxZEb1O9KqzSbU5gEo7wr+aiBaKX8BC9dOvDbISyXy5k
 IEH9/9WG3DJ+2F5sfkkIw1aaZ9azwwdzfRgpBXcDNQ==
X-Received: by 2002:a19:6558:0:b0:4f8:6abe:5249 with SMTP id
 c24-20020a196558000000b004f86abe5249mr4606846lfj.3.1687276689535; Tue, 20 Jun
 2023 08:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230620124418.805717-1-richard.henderson@linaro.org>
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jun 2023 16:57:58 +0100
Message-ID: <CAFEAcA91RPvuC_GArpu=x3rEpv1-HsfdEOTGf50N7VY9ZwgtjA@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] target/arm: Implement FEAT_RME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: ckee2bvky952

On Tue, 20 Jun 2023 at 13:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v5:
>   * Enabled only by cpu property x-rme=on, not -cpu max.
>   * Rebase vs SecEL2 fixes, now in master.
>
> This doesn't have the magic RMM memory, which previous patch sets
> included for booting Huawei's forked TF-A.  Upstream TF-A does not
> have sufficient code to build either PLAT={qemu,qemu_sbsa} with
> the RMM enabled, so that can't be tested either at the moment.
>
> All I can say is that this doesn't appear to break anything else
> with x-rme=on.  Which is less than satisfying.

Have you tried 'make check-tcg' ? I get:

make: Leaving directory
'/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'
make: Entering directory
'/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'
  BUILD   arm-softmmu guest-tests
  RUN     arm-softmmu guest-tests
  TEST    test-armv6m-undef on arm
  BUILD   arm-linux-user guest-tests
  RUN     arm-linux-user guest-tests
  TEST    semihosting on arm
  SKIPPED semiconsole on arm because MANUAL ONLY
  TEST    convd on arm
  DIFF    float_convd.out with
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_convd.ref
  TEST    convs on arm
  DIFF    float_convs.out with
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_convs.ref
  TEST    madds on arm
  DIFF    float_madds.out with
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_madds.ref
  TEST    munmap-pthread on arm
**
ERROR:../../plugins/core.c:221:qemu_plugin_vcpu_init_hook: assertion
failed: (success)
make[1]: *** [Makefile:174: run-munmap-pthread] Error 124
make: *** [/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/Makefile.include:56:
run-tcg-tests-arm-linux-user] Error 2
make: Leaving directory
'/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'

But I haven't run 'check-tcg' recently, so maybe that's an
existing bug rather than something in this series.

-- PMM
