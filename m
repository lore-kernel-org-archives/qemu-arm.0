Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D487BC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6C0-0002ky-4S; Fri, 26 Jun 2026 09:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6BP-0002TM-MK
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:01:37 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6BM-0001hG-LL
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:01:22 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-664ae993e4bso102376d50.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 06:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478871; cv=none;
 d=google.com; s=arc-20260327;
 b=aWGKy3zD4X1Vejt+/wTlFxI5MSE3DdDGL8NiDnEMjYD4rRcZY1Z+5Ct5p9QoXGlN+w
 6+ngYO/9fKpqKwSqd7vCsZ6Oed3FxR956TAwc/XxeqFo6HdITuUlsOke3w4ucP6AUjly
 t7ZqOBXURGN3ymse88Sj5/XI1AvO05iKjaV4kBtf2NpRD8myF7UG/qzScAYExX+wWMEs
 V6g9BposDm368qnHBnHa9gtlxryyuuj/TZSGNaFusQWNPKYzrHFNRwp/1T8cXyQFtkXH
 6qVJHNZjWAj3NpYUaV4VPlttxYetnGE0eKmU5lQ7eKIVsgiqgN3CFueoFpogmLYWCESU
 EmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5hQKVPBDERSSv1YoWb+/cMPA0IlNXMYJYmiObjWxW+g=;
 fh=qOKHI3ingJ81SYn05iK4tduOkBqQtreV4MVB13qAEsQ=;
 b=ZqWOoio8RdR8CaBlMNI5bNxHIhzc8fsq+mEWa+DGoBjCE6G9iiSzcDnuiWrRmXc85L
 0ZmU2YDvhsPBdyKFm4ZFaBnbg4jT+Yd8dfyKY1cnLH8l9IBhIBxKh4amQ7osTgQeWCyo
 XTj7om5xa7EuDBVrjijuEeQO493i1RwgPX1PUIJLuG2rhaWg7PTgo/04ar3ru92IbK0G
 GhDbCYbsx20A0EuuGFYrArIX+pJVDKXliaA6MUieXRILRO4zjUDvjltVNhcv3Ed5whv3
 USGjPdgJkByLnCZpDwTrvnMcrJcArua8+EqGv60E/efdK/cC1ZSBvQLZFVrGlTgEzd1Z
 DdAQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782478871; x=1783083671; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5hQKVPBDERSSv1YoWb+/cMPA0IlNXMYJYmiObjWxW+g=;
 b=pOghHqYAR8wMQzLTxX9QI6z/YlVs6S2ik5/mm6MyLBlJ9Wg6QEhdQfbBRAj1SywHDa
 XNRyNjpZ4RN5yQ8ImVjPU3LsXwZoUk2cWIJZXiO8fD0foCvPneZ4Uom3CT8Ga+txU1R6
 7OCSyT638NBofIiUcoqA9x6kgE8m1sUlpYhtcMuzCNVyrxzZIRve/Jpn3K7iSp9cMKeR
 agIrgMo8tx82v7vv44v9MBCruzjoM6cxbwWt+bqKz3wWcTTsbejKeq+hqNY2BoK1foDg
 7hNNEzGsaDeB7MIb/j969eEaqv6T/2MnOFAAG3BkegONgGQdMnWybRlERmd1h1mN2ds8
 HI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478871; x=1783083671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hQKVPBDERSSv1YoWb+/cMPA0IlNXMYJYmiObjWxW+g=;
 b=CN2C6blMBG9KIeKpiYt6UHVOalYojAy56PEH7PsSVx333iev8Xkale5bo/+YkBV2jz
 x7oSMQXEXJQuG5mfU0F3i69bGV1VsyhQ/uDD+XpHLmx8zfbQCBlgKYeiSfVmOuH2zk1N
 87rovzQooRKkHj8HI+FkIuy+g2S4H7iJJXoFIvI/ctXuwzyFLypIiIv0FcgmgY4ySWdE
 sMgI6aC7JyDO9odu1RehGfp4aa5LfTqS8vuAZDjD3iIQ0PEBhOPxL2G0oRqKJd+UJkmb
 c3LF1XHVROcldLXgCV3CTI8gSohS6wlixQU2FSGz53FY2gf8chxMvaRgyjoNLUr//PBG
 iZhw==
X-Forwarded-Encrypted: i=1;
 AHgh+RohpRlo2j1zGZdk0N/wWyP8iYLTsp3F8Qx2vcgJIvZSBbvemR1jn7+zl5L3XRzAa4tRhwdxApUVJA==@nongnu.org
X-Gm-Message-State: AOJu0YxBQZCa6MoevpQrbsQx5REoIz7+ck0kJkjAMeQ/2WKPffZhNDs/
 LUfcVhqoL4NFbv6tR+5Mp/ee17WNJLy+xKqRZZkJs2Yx1OyNMwTtp+u38GW6aiBq67dgtWkmBDU
 4x3KZbaj7z2PKARH6f/aLmFSr3nEeO7xtbUWktxm9bNKRTL7kq2U11g332mEl
X-Gm-Gg: AfdE7cnm2BLZZnQdk3K122wxu5cQ+gNE8JgcsejyVvUfvPxJqEb4tM7aVR+7qQYqg3Y
 d6+nv6LvYFHF2nB7Ei77b0y2GAIXdQqO0ElLSi27+cdS6oxwwSpvapjezaGHkHJZaSzQAW6OJ2x
 WU1H+lJWK87W8FLsduuD2gvUyN5qRXxGg7NpVdJ2NwrEeJGB4FO7iOqqn2iuaviUufQtUc/5OOn
 +9UnQ1fJfZ2HxhqVN9AysfeVNE+gmieYZMImLUY/zUuF5fF6XDcFQa4QiYLpb+nSUhWTkTGbDaG
 xJWOwUi8I1gURTW2dQ2FBq1+2H3whI+peFPwclsPSteGnZwdpPHF//CL
X-Received: by 2002:a05:690e:440e:b0:661:4e42:f89c with SMTP id
 956f58d0204a3-663557114e1mr10653833d50.41.1782478870543; Fri, 26 Jun 2026
 06:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-9-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 14:00:57 +0100
X-Gm-Features: AVVi8Cd2UQwawxIhNw3tvwUn2pS31JykeOR1kX6y2oWTfpb-kzAeIriPXWv38o0
Message-ID: <CAFEAcA-G085VHSxKhOHmj0Jid1MfFdZd7B+-XCbG_odU4JLwGw@mail.gmail.com>
Subject: Re: [PATCH 08/15] target/arm: Implement FMOP4A (widening, 2-way, FP8
 to FP16)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Thu, 25 Jun 2026 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 +++++
>  target/arm/tcg/helper-fp8-defs.h |  1 +
>  target/arm/tcg/fp8_helper.c      | 16 ++++++++++++++++
>  target/arm/tcg/translate-sme.c   |  2 ++
>  target/arm/tcg/sme.decode        |  3 +++
>  5 files changed, 27 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

