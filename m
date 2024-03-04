Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2722871eja;
        Mon, 4 Mar 2024 09:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsQq40qFaQEoXcWpXZdlIY0Hsch8A3rNXtS62gkqyJW87hiD18BHQQCXxFtvL9dVZH9BUuxGGiCeXOAXo/aEtE/CW2rWdZ
X-Google-Smtp-Source: AGHT+IEY47XBgjGIQeRSVhvP6wl4B0ODRgZPctKDBrmh8FSfQthutZJ8zBtQsI3xBd96Y2f4MalU
X-Received: by 2002:a05:6870:d87:b0:21e:a332:ceb2 with SMTP id mj7-20020a0568700d8700b0021ea332ceb2mr11410571oab.31.1709572356239;
        Mon, 04 Mar 2024 09:12:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709572356; cv=none;
        d=google.com; s=arc-20160816;
        b=e5MLlS+t7BbBCtNVSVciOcoEWcxV8IKxnVlpzj5vHl7z7Gd6h+MxvddaueJLjFRSgF
         /S+2+71Ahp8Wbvz/124ZYabuUKizVP93YKjOtkqeyv3iwj029HOLC7hcIuYZva6tQgvJ
         1YpeRqURMjPfSJTgHsPOScdb8Xovz/5Fixp62Af56sgjUmQZMwAs4gw+RCLl6qZ+TEkg
         r8aeJ2mELrccY/tjyXkR24nx9Wp+CNMELXuFaC22vgdQyb9EcxjolFmUxmYZShP2xJT/
         TnsXmL9v0TFXgcUkpvSv3L86WO25LMuxriE2lspgGvLTawHEHMJMA389lv5vPOENKGrt
         wvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4LfOMCUWElaLQCseVTFR5rKlr+ZKIwfpeoeyHpX9pkw=;
        fh=X/etly1x7Qg/hTi7wXgufJLnIXm+JInrOR4eF5qZ4jQ=;
        b=AVn4kR6fGzQ6mkhkhgOH9AF5Lv4Oo72628tiXSioDCLy4nobwEuIhM4iNMBMoJaMtE
         B+tn8eg35efdtdjrTlu9zAtXKnwVs3Zdk7W9Cu9MQ8Riy9rOCKb4SFQEOzpm0x/D0inq
         lRMhkqOXsO82zJTDvmzFwm0D0uerv80GAw2DqWPCJInfg9xzWj4tG080nrYWo5h90mt6
         A+6bKbMXq/vm11IuRzQiZhY+DzaNlVbatYt8qQ5G6eDP30KaJ/OQOWq0S4u9lD85nr6K
         W0UqK5/A/DB8fWpFDF7s9n9jkbGhxmLqGeGfc9OXbmJMLdZlwKF1tu3bID0dBP5GdMbQ
         JTMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yg3R4NLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020a056102335300b00470393c7f27si1675373vse.828.2024.03.04.09.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 09:12:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yg3R4NLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhBrU-00078J-H9; Mon, 04 Mar 2024 12:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhBrS-00077f-Sp
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 12:12:22 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhBrO-0004LK-Kt
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 12:12:20 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso5968503a12.3
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 09:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709572334; x=1710177134; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4LfOMCUWElaLQCseVTFR5rKlr+ZKIwfpeoeyHpX9pkw=;
 b=yg3R4NLb2Ns8neYyLvAWLuxKL1dOr1mtS1NaLuQxAFFfCrExamN0QyvSTYM1aJH+1W
 6AaFty8/PIrR+gemgoWTBZI65wazZOfOByeTSiYGXWYg0n4E6OOpsZhBiLH9hlATFNKp
 MXQGsgQ60U6rjABbRijlx1zpHsXo5BjPvgVgpn+Rxgbr0+fCjCxM9iF7uGEWrMlhWm+I
 8Nn/dHqTXR01BXXrNJFh0EieiJ/GMkDzgfy1zM9dtF5zrTrktTPrp/Tl/DnxOyUUv3Tb
 F7YDim24lIkPDFg0FULGFUEvvH0oa8PjNsSEgEWDvfayhX7XjUentf4M1tIKaVIpvYPv
 U0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709572334; x=1710177134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4LfOMCUWElaLQCseVTFR5rKlr+ZKIwfpeoeyHpX9pkw=;
 b=fjzsLbXyGBHQcgKDzfU6qfaQBA/GYzMjdYLxN6Tzcs79o2+WU9WaUaxNGcTn4LdaZ+
 veTfHXWm0hKJ9xU6IfrqBblF/6gea3N81tMsO9KsYpu5Jnd6UAR/XnyLkXOjrpatlX12
 cK0uY9o3I6o4TurxmCuRKrJjHRyEK9LcyWGcvI2iusTANp9xRzUmiV91bIpXkMjC8GJT
 tR45iQOH7userRtb5iBbejmK8ghJFEtpW9C+fg5uiqD7JOiv7FAAaCHcOgECjqhvvsaB
 0rQ2oGdPZZQ2c3R209SuHcDy90iNICYwoyJJb+Xg+IDEKfW2C7GcrgyLsQ3PS81UH0co
 QVyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq7KWUlmM3A/5kpXY3QAZ2c84yJ/VZdkO6HgVOTvYnlAS6fqfc8OhDipoL7jqv1OtKyLgPmtFa1pzEmdDd+tX0L6LF
X-Gm-Message-State: AOJu0Yw7hyckEp6MJWa7MU11KVCkioyPIlNkpY0thcVTS7vxDEnQJV+v
 YkjOb0LQwrVOgk1QWdZ394gEVBptyi/X4y35x+FsUbf2Mr8NS79mRDnRNUadRCZHjU/uVE1qFfN
 Z4Q5/mBPDFG3zothk0AySxq3u9rYNyc7DOzxQ8Q==
X-Received: by 2002:a05:6402:5c3:b0:566:66cc:633c with SMTP id
 n3-20020a05640205c300b0056666cc633cmr6693150edx.7.1709572333737; Mon, 04 Mar
 2024 09:12:13 -0800 (PST)
MIME-Version: 1.0
References: <20240301204110.656742-1-richard.henderson@linaro.org>
In-Reply-To: <20240301204110.656742-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2024 17:12:02 +0000
Message-ID: <CAFEAcA89y3vhSNsgYaFXP6ku1-UNVk8DbH+AKeHfMWbzNinCsw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/arm: Do memory alignment check for device
 memory
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VLw1fou0QGMv

On Fri, 1 Mar 2024 at 20:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> v1: https://lore.kernel.org/qemu-devel/20230223204342.1093632-1-richard.henderson@linaro.org/
> v2: https://lore.kernel.org/qemu-devel/20230621121902.1392277-1-richard.henderson@linaro.org/
>
> Some of the v2 patch set was merged last June, but the rest languished.
> No substantive changes from v2; only fixed rebase conflicts.

Applied to target-arm.next (with the comment tweak to the last
patch as noted there), thanks.

-- PMM
