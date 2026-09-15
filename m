Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD27C982C5
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 15:32:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6V8t-0000Pq-V2; Tue, 15 Sep 2026 11:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6V8r-0000PW-Sv
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 11:32:18 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6V8p-0005km-H8
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 11:32:17 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4aac92dbso518999d50.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 08:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789486333; cv=none;
 d=google.com; s=arc-20260327;
 b=LhLU5eee6LCsVPahC56R48Y6tWFxEyp4VcVMt3yBn4I2QJQaV8mOu3rSpPlobjlZe2
 iJ8h1aoFPNz+23l8uN9sS4/AevucwzI/yGCFaU96u7F69ZbkFvvd6Q/6xtx+rF1MV8sz
 dXGvKNV1r6m6ePTh3rW+A033Bftah32n5ag0BpaXQ4uOX6eEr2uScD5+WMkD+V+m3aSj
 73E7sqZH3yUZcM4yOU0puHmIAGTAOsnWFhgT9lmMY3YE6aaKwTdh6FZYtxU0WDX4zzwi
 oVUmHhwi79RyhWUJtFswCGJZGBJcsOTdJUrQ34q2KrRw0hv2AJ6CJfDQ5IOsb02wd21Y
 aDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=kDfQfufnfBJUyNtSydy9xsVwpmfRYg7ynzDy9E1+p48=;
 fh=NOSum5azIrZu+WcGb0PU+bF1PpES+8TOy+xrL/WzQvw=;
 b=fFCzpsbywSWfoa7fY9d6eepKVZeS2n5IssvAoFdcx1xMDluAWydM9vRcNLAoQMnxul
 fWwkQT+3RU0XPTwfAT9QB5Vl5ElfL5+mzFO941YcqJ45DS97hHrAoTO59GfQ7QeGW5B+
 7Bnf/dwHVkMA9nY+1BfzoI5+og7PwaSeOsvO4PxDmcDxRtM3+2J+OkIepPWaTD0EHKNy
 GzKquxoOiW18m3XokgJ06WMHO3mnvy45PSiOcL+CdSN/UaDZxILqkqdkKOk5G51nDpPi
 rRlI4rsUVJiGaez5h7YgVEQiiV4MqnOTae2cWAgtIMFZz+BYfakupGIle7WVpSdtpNnP
 kC8Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789486333; x=1790091133; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=kDfQfufnfBJUyNtSydy9xsVwpmfRYg7ynzDy9E1+p48=;
 b=U371fyrn3aqHSkqmJ0cRmbyP3AM9NFQhGsheFNNNZxIIT52zoTEfZCXzpNqgoIzlhq
 O8zeeDgBfbfj/3U4Kt5JYwfagc/w0Z9PPx2pdRCbnUMViyxoZtx63PqpM4Gt3L8NPxUi
 Cf8UE4CaRJnfvw11aCk5GSYR6WoqI3pZUs3qLzCNk2Dni4qZEdpig29jyhwHYzdUSDw4
 2t1VJu43uQMofQqN3mUVSt6QV4jpdeTweiUL0LOVDLWJtqURqMkqUq8dUj7nE+996pnX
 UKkb77WY9bvmg5SCTbVL9kLeYegLTpzQ1Bz2iaKsEbgnd6HYLU2HhDoaEQ3tn/UrL0CB
 WbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789486333; x=1790091133;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kDfQfufnfBJUyNtSydy9xsVwpmfRYg7ynzDy9E1+p48=;
 b=i18m5CYjg3aTWTLvIl6wfLwAkj1+MBu9vcHbHACDaLTMl4yOJQi1Ql3PUzCzhiXvOO
 qagGPTi0HD9/jJWNV30QqwmYsboVJuPKQapXShA9os/RPg29dl8u/PwJx7bO+2Flq7Vx
 9BcWWSYzLsHgxmHbVTBPAKd8diKLKtOrAs9AlkTHItA1Yv2P5aeGha8nIHc2R16F5UrK
 zRQb9X+M7SYPXBeRDAAUP/HywkcZGRdf+dzZ4UZS4hR06e6DtsyYgXviC17BGrSSypCJ
 mvbi/QGyE4SsKx8sK+yNVoN3OCB16h+fcfYn2TQCbeg2jxyY3ac2UE/RRiLx1RR9Xwa2
 31DQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx0FjZCEYFnd8n/qwrPPaifM35h4AMtryxzmNNhcs6hLc9b0RKcmiT6oqZFX00C4IpE9UZ5E9H12A==@nongnu.org
X-Gm-Message-State: AFuF++lux3QcWZDpPp2A/4pl1Ydy1Qmh/P16P0qCp+4eT/AN6qgs/bYc
 TMntfZVOW3BZPAscIl0Tioofsl+SzRaT/RR7LFFMBS5U6dm2NbR6lOqFMrjDqcCb8xrpKIEVQgj
 MEUqpAGDJCflKZ60+SAQUycEdC9Yqts0if8P/dGRODQ==
X-Gm-Gg: AYBFou0iz1jTXMe1ZNFFL71ISveOtMRYANkEYjV7lkR0KjdmLArdiXAqP6MYENIF8qg
 xxqMS3S6/7+VWyULLSrLE3Ch+doeVAiOUAiRt8dG1+vnANOZXWWrCDstcyzOLcUD9V3DRTt4He1
 nqmkcMNHc8iaCO/wDkpwjaUX6YdXL8XMyLeYTh3jk1oVEWszTELsYxVE+iQK+gvE3V5WE9h7o5o
 PCeLCzGrTPqBJmwOOfZGKZ/IGS5qJjzOVTLZQvALdd+320SdzZ2AZEQYefZwMMLMjVT1a+2+S9a
 LOu2CoSfHOC4H0qHPqFFjvdRknyA0twskXWb9SGSJLkqtDrlo2WTOX4gNbPWDHqtOu3UNvRZTai
 WXxTtvMq4wRpyzslNbwQE+UFbvmgdph6+4s3vJ70=
X-Received: by 2002:a05:690e:4084:b0:667:b84f:e402 with SMTP id
 956f58d0204a3-6715cba53f9mr561851d50.50.1789486333292; Tue, 15 Sep 2026
 08:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260913-allwinner-gpio-v3-0-a9affa474b3b@gmail.com>
 <20260913-allwinner-gpio-v3-3-a9affa474b3b@gmail.com>
In-Reply-To: <20260913-allwinner-gpio-v3-3-a9affa474b3b@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 16:32:01 +0100
X-Gm-Features: AcwNN1XK-5z_vfTfxjcU7TSFEKGqx6VwiVAAk7VJVW6c2JCjP-nmIdD-OUAPr78
Message-ID: <CAFEAcA9SRQz2aK8=T2y=n20Xq6RcFE61aDLxOyViYNj-V72P_Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] tests/qtest: Allwinner GPIO tests
To: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Jack wang <163wangjack@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 13 Sept 2026 at 19:18, Strahinja Jankovic
<strahinja.p.jankovic@gmail.com> wrote:
>
> Add Allwinner GPIO set of qtests to validate functionality.
> Tests cover input and output port setting, as well as interrupt
> functionality.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

