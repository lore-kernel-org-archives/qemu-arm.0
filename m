Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C534CD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:20:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSlh-0004z0-Sz; Tue, 16 Jun 2026 08:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSlg-0004wU-Uu
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:19:48 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSlf-0001CV-G6
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:19:48 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-66077e90382so3728860d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781612386; cv=none;
 d=google.com; s=arc-20240605;
 b=YaA7X3JXAn0HCcybLS3YuNusmX1ObVh3qdIdTg59kENn/M4Fm199Ch4c+2owjwvUUI
 EBQdLO+MJuuHgliNuLNEf2SMNjH71GB/f6QYAT7ZpWWdObvIenrDzw8gUiUUpXAlx5zz
 bAQwSTQXZ9BcGo2jlndJghsCdrPd+5+++6KqCu7hJTl9nWmAhlb4w+oo2y42b5MJhSgK
 zharV+gMjarkcG5dvBOAUphDi8d+ANQ0CabMa26+yyRKesjsMuYEPoXZsBAvE8j6vpEJ
 jLnLJ6RLEn0A3XJwQVt9iMDX2OM6UtplGIymd8xcQaEso5YTgZkRPVQgjm/nq0yHIEWz
 l6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CMY0c9nN2PflzEseX7iLu28OGDZiOlhEH0Gku+6bxhA=;
 fh=3FJToZGfH0R/CAAMumoQVPbIFZZJA5jsxnkjFns6lUM=;
 b=TNjeCQR3dWpTkUpwhGGx7PcXoPJreU+Z/pGpnPImiRzGPNVSpH085hDll/BjxByFX7
 O12Ae5B89a4sWMJCOMXNdhf99ZoJYR/Oq/5XNogr9FfcKFNM4sL7ogNJq+ommmwjtBXH
 bEevTUO5VMxqG7qL3x/HgnhpfAlPqtErnX5F6B0XCap7J/q9ubey+B6wndRvGtdX9eiS
 RAuVsu2RvYXPCHH7e7+GFDi2ZYDSXQTPzDoGX3MrMwvEtm2fAqmTdYWW7RpnB793TIMD
 7d7MuM0IOC7cXmHyd05bVy75z1yCtx9mH9irUdqLbXeRSrtXwu0jPG8kertB/O1y+dJB
 Qzeg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781612386; x=1782217186; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CMY0c9nN2PflzEseX7iLu28OGDZiOlhEH0Gku+6bxhA=;
 b=kOwr28HIC3o6u6G87Hw3gjxBhfj0O+TXGE1cQYB2f9eqtVfxAfF/zyqdbHvCY82Ndp
 SUXqFZvfn+z+KwoyzI0jIpmXuZtQuJ5j6uFgGvzIyNYBeNi9m88PDI5HvVYLNo3mlTp0
 K27vsauGa33MrFaLv8/1AUSGJuD6oFItlJzVDfPL/+PKMQzKIFx4wmpmg7zDMvc3NcQy
 xOqAaDk+IPOqimVnO+k8reAj3t5x9XrW6LjEzz1C40xYYSIUkN31u7ppl7wqM5unpFKk
 ro/zd26pUn42vT7vYyzaAW9E4CBX/+W58w4bZmBTSquUKnhz32jcZqTVucd6ECWoJvcf
 puVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781612386; x=1782217186;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMY0c9nN2PflzEseX7iLu28OGDZiOlhEH0Gku+6bxhA=;
 b=K/7Drb26cUMtFhmo71HNI3xSnUrKlWnwGdaDPBv4ukerT+3B2/cW3V/sU+mJqWGvD3
 oXRmNTlhFoGoMdkpow+UN+4vTIVWwxkpIzH0YMhby/i+G8pZkeWwelLPLzFFQMOCM0Ul
 oqdElpuEeTtCrO3aNfT+874gDHaQklOKCEhlLvjt0Jcap9pyJvOulYS3p9M8kIv7rxxJ
 5GluSJAwqHTJ8wbOWb15DrZk4uHTfDHGnj+EobZitPCTJC2Myr6nPEqL+KxE/wRQx7xg
 5+TfVZ9xbBoIcShCv9XomLZWVgPDo6iqs4QnfxE0Doc9OCbNMWv+mmGDMvFW06tvx21d
 yC7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8IiyOhN/irf9pW5uP2LPba8MvC7V30Q1IekNDpb+qCkZFyqIw7q630OP7AWMoEhLezaUIpxITKwA==@nongnu.org
X-Gm-Message-State: AOJu0YxJzh+AzzfYD3qElqxQY0RbbgIzoAbe3CDOf0Rfi/TwA+/mRoO9
 1uyd5Bl7YejGsV09xRwTYI2wRrP60PVyaIeku6j123QvsH1WJ1tPKs6crsX/D1rpT5isOGtWc3J
 ezWJe/iVD8I8ZKSum0Yp/L39bO6tXw+URTkLJFwOLyA==
X-Gm-Gg: AfdE7clyBxlOPr0a3T1UZ0UB+MHQ5B3vFg5e7tRakpA6OTZFuhX4c2cJ8TrRuJo8Pyj
 jhcEbtgE/SrxEFvwdCqaTU8kYTEirqKUmjGdYnf3aePrHqn7LcZQn0gzRxKxvFQ4GQ7zi7T8eAw
 ocpZSA/SmLdd/pWZqAP/X4CRepzcuuTda/ApXFHkf474UVmsZ/L6vSql7Sz6beQYdGe3CBb71nY
 6Ox+QYuXts1i2ExmYe0nmwjoPG3SstK3/ypjmczLIPdd6/ajS9oeXZ+EtCHTvvZlTZ3SJNYQuih
 0w6wIVH6i1SPP9B27jj/TKKJQNX7OUXmqKhnV/Mf8fMkkwAoa0n9igWh/mBBdbVNPFs=
X-Received: by 2002:a05:690e:b46:b0:660:481b:c56 with SMTP id
 956f58d0204a3-662b62e9a4fmr2385910d50.58.1781612386247; Tue, 16 Jun 2026
 05:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-5-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:19:34 +0100
X-Gm-Features: AVVi8Cf_xV09UFt1spNZ828d3wXD1dx5PAfMI0Qz6dYgJg_cUD1rw6ZBQIy4HbM
Message-ID: <CAFEAcA_ts4O_b6JFuy6-h6bpiaj+jYved84WDiy8d21h0XmUhw@mail.gmail.com>
Subject: Re: [PATCH 04/25] target/arm: Expand DO_ZPZ in translate-sve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Prepare for adding zeroing instructions for some of these.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

