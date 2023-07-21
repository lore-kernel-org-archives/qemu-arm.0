Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp99124ejb;
        Fri, 21 Jul 2023 04:29:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGSirXFRG9dFN2yGuwnu1rAVwmlyanMM5P84nkqC6RuTxZj8vIo9LtUt8QMQUUUPEF4Fp0Z
X-Received: by 2002:a05:6102:356c:b0:443:d94e:c50b with SMTP id bh12-20020a056102356c00b00443d94ec50bmr733828vsb.32.1689938992529;
        Fri, 21 Jul 2023 04:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689938992; cv=none;
        d=google.com; s=arc-20160816;
        b=t4ym3vcqnzwwdBgV3nh+d0Vaa2OnZNNsrsq+zfqdqcvNrhmvvlLtLD+fKVPEaT+Mr8
         OT6N4q8Gq8fkRRTdDY0FD+FnfJ+V8NWmQyqp0Serklu7cJYKC04MCvgyTqw7OT/LyT/U
         wHehhpzY2EZcz1bGmSeNu9XO3lVCrUAkU6Ea4tKhy8w9uRgMumwScbGAcqRSnPU+rrtt
         vfjJalFj0AsALdAfZWPdfovYIf67l5N3h2PQzdVkX9crSfchzFKobfgGqTpArm29/mA0
         bB2LRIGcMbTIQRSApqCmGhWGL1Nc1JiUwjm1+RFkSOnSVDZ0OvobYW+Vv0infWKQSxgh
         kaTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=opb+4yG0xu0Weds/zVLnpF98J7OYIWUqtQUmL0ELKN0=;
        fh=uWSpQzHkelb18G9PTYEYQ4iygkY2j/2y+NIM0Jw5q+w=;
        b=I0CW510JlIVOQX88x9nKlO/h7HniPuLAaQRP2MQECXhN0sqbKgZ5jgH5ReW+uYtsna
         KpCytn1imD3s0FNTmEP/jt2cYuAMBs073dJV4WFqsqsc/dX/JubaPQCFO9JHrNDiE+BX
         /BndJhEiAFPIJJHHsU6ZIBpvItjVm2ofifjtxR9q4h/QwnNGLU83GUwazd9rQBgr9vTG
         Mx7Vjvw0FO4PaPkd6tJ3X0vlqRuTWDRedWXk1xSHcVBtCYultXuAtW1qW9KKAErD9yOb
         WJ+JWPdEB1DR9QhczOBHb4uErQFg9aEIuH+3i9p2GOBerh8sfOimfegDODYx5SrXt2fl
         6ctQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJqEXKao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a0cb313000000b0062b6a5ee024si1317351qve.102.2023.07.21.04.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jul 2023 04:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJqEXKao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMoK0-0004He-M9; Fri, 21 Jul 2023 07:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMoK0-0004HW-21
 for qemu-arm@nongnu.org; Fri, 21 Jul 2023 07:29:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMoJu-0005PG-QK
 for qemu-arm@nongnu.org; Fri, 21 Jul 2023 07:29:19 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51f7fb9a944so2563792a12.3
 for <qemu-arm@nongnu.org>; Fri, 21 Jul 2023 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689938953; x=1690543753;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=opb+4yG0xu0Weds/zVLnpF98J7OYIWUqtQUmL0ELKN0=;
 b=lJqEXKaob5vwzvGfOunwLyzPgbsrJdW5Niaoxz1nqtKwBG1U5OQ/RL0dvI8MizM5CQ
 kcd446EMsK7vj5szodbw/KvQliAIjW0/xCqmPfWsL4qKqBbI5WpRoTCvbcbBAcQH3LxH
 XuoNmH1x4+a0RUqnNYKYA5yVFG4a2PuxdMpE14q9ZCnS5xzNrYZY82+idAi5Ta6iciMX
 2J0zJzdw5XAql7g8sR61DBLQD8Pj1RbitWzM2zbbqG3MEKgyBN7V2WxKyLgm8oT+RqM9
 k2lwcvYlPkPqpfkAQja17G/TuhKE6ooUyEjgKk0KAD6IqjXgw/9WXCARHPzSOaqjqaDx
 n7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689938953; x=1690543753;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opb+4yG0xu0Weds/zVLnpF98J7OYIWUqtQUmL0ELKN0=;
 b=f5SUsg8FAvFU8CGL/p4X9EvlPRhCUA8RBKCQoYSrABS4nBlMEWbDI+oNyZTVL0YzJG
 9exotKGGF+FINAoM4StlBwvsAsJG6mZggj6XjMJoSA+ce9a0xdyOm9YyN9dqnvWaodzj
 mfFbMJxEqkbzniZqJTbPx+WOvj//I3KzJ6iYCQJGJM1dKjXveBgihzgblTMJkrNqr3lO
 MjcjE+588aywq13q7OdfANrKSdLNH1p767qmPLEMMN9z8RCgliktSc8jXOah/v9ZmB4V
 frE+1VfQcpLwmEyuQ/HJyDNkDmo0aBfcAluveRkFxI8dUlQbRXs6+bGOgQl5tp0vzHdV
 VK4A==
X-Gm-Message-State: ABy/qLawEN7BHvWa16p/r4JP01p6CXVjzmmwvLnsxbPBhRX4dYO6fkdF
 vfZpzyalCakn31RADT7e8Mh2QaMv123oP82TAyPNIQ==
X-Received: by 2002:aa7:d9d7:0:b0:51e:17d:a1c3 with SMTP id
 v23-20020aa7d9d7000000b0051e017da1c3mr1278080eds.32.1689938953056; Fri, 21
 Jul 2023 04:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230721104437.1199866-1-gshan@redhat.com>
In-Reply-To: <20230721104437.1199866-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2023 12:29:01 +0100
Message-ID: <CAFEAcA9Sr=eE6PNR7e4jnGVj65wnFgDfbUTHpm+PzSU_5Fy+HQ@mail.gmail.com>
Subject: Re: [PATCH] numa: Skip invalidation of cluster and NUMA node boundary
 for qtest
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 imammedo@redhat.com, pbonzini@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: ngH48EesodFD

On Fri, 21 Jul 2023 at 11:44, Gavin Shan <gshan@redhat.com> wrote:
>
> There are warning messages printed from tests/qtest/numa-test.c,
> to complain the CPU cluster and NUMA node boundary is broken. Since
> the broken boundary is expected, we don't want to see the warning
> messages.
>
>   # cd /home/gavin/sandbox/qemu.main/build
>   # MALLOC_PERTURB_=255 QTEST_QEMU_BINARY=./qemu-system-aarch64           \
>     G_TEST_DBUS_DAEMON=../tests/dbus-vmstate-daemon.sh                    \
>     QTEST_QEMU_IMG=./qemu-img                                             \
>     QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon \
>     tests/qtest/numa-test --tap -k
>       :
>     qemu-system-aarch64: warning: CPU-0 and CPU-4 in socket-0-cluster-0   \
>     have been associated with node-0 and node-1 respectively.             \
>     It can cause OSes like Linux to misbehave
>       :
>
> Skip the invalidation of CPU cluster and NUMA node boundary when
> qtest is enabled, to avoid the warning messages.
>
> Fixes: a494fdb715 ("numa: Validate cluster and NUMA node boundary if required")
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
