Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1515029lfm;
        Thu, 18 Jun 2020 03:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeYbDjQQ1uG4zhJ5XnNzV0Y5t5AJukFeyDe3h3JzLbrDFPZzUOshEkw2UF7/lO/A2rUjYR
X-Received: by 2002:a25:7c46:: with SMTP id x67mr5496334ybc.279.1592477427158;
        Thu, 18 Jun 2020 03:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592477427; cv=none;
        d=google.com; s=arc-20160816;
        b=uEUxQRigVWIUmbpfKrmKdbt1nKctnwpwQGSMUJoA3KP+GtapcdKZoDd1uScoovsu+B
         b2ugXR795/Tw8Txw3Wxy+UTAY5Qx8uBTUnZlo8gfSaCr0fj0OuFW04esqOl9mFyc8eLe
         x5RIQGUYjGcwHZuaI44N4qswE+2vF7IrEZHp0rdsavjW0X7hOZ4Q5uAvWBOkvKwtphNC
         jV8jBmxfrEE0OBJSry1X71HcZe7ZEU4n/yFclpttkBPo13dDda2R566mOrbw5O0PkKtQ
         Ajj2m+RMoUYLPM3GQp83bxcA5/7ueIJBekSXB5H7KfEPUQlaYl/xiMa7S8YKpb6C65C5
         r4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDGvjHy243m5K5tUi55Zs4HyAuG/d2zMvqvez3DQz6Q=;
        b=kJJSK8pZh26ApaqZeeM0kegn6qRevvHNBw9ILDUaonhtIwOUtP8B6fYekpSF5IDukS
         EwVs9TpaYskQdnAlQ7GbgIaj+52uTJ00HJjIaK/WnrJrrma/JwWj3UPROtLAoPIwxPK4
         1e2dD7vxV0ks1o7IlRfQt2Io7VMUdABX5jkmmaSY34CMIeZqVGBRBUYbXg9LUird/r64
         vWbHx0wn4SNZo1UGwMa7FykPZ4TabC6Ibzdge+rwnI39gP7KQVw95+8bCXxsLJTACdSU
         xs9Dn4D15WOHTInyL48fN9PurC18PcKD+gcCowimCWxQWLwreP3KxvjN/yGNuaZtqrUo
         Y6lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0S8WLTL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si1959231ybt.471.2020.06.18.03.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 03:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0S8WLTL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jls7m-00033j-DK
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 06:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jls7d-00031j-Lj
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 06:50:17 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jls7c-0001wA-3B
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 06:50:17 -0400
Received: by mail-oi1-x243.google.com with SMTP id i74so4668522oib.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UDGvjHy243m5K5tUi55Zs4HyAuG/d2zMvqvez3DQz6Q=;
 b=B0S8WLTLmYvA+HW/jOLl+nmu/NvnwXLwpww3Ya9v3QBv5nJr8NDQtGu8FoPEDRE9Vw
 xkNsd+RRE0HclKLZE1CESk1VrD+ufZAQKGokICss6Pyr59gBD8TEuNNptU3TWXvZbxRl
 p0LCaJ2pME2710k29fwWMSTqM3mU+xyKQET8MBbWsY7vxnOSAvB/TMxw3S5/YHIvZD6x
 73Zw/uEYnRcI5SAzj8dXZQGnb4O4hPijbbMu0VKwFrREhE1AP04G6t5cV5ukoRxVbiqR
 /AUjEN88xTaMunr+nK3sWDfRAsFmBdE7HtelRb21qZ680B6r2v+Tf0TSbRUa8xKCQuz1
 m0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDGvjHy243m5K5tUi55Zs4HyAuG/d2zMvqvez3DQz6Q=;
 b=VzytKpVttzv4/KetmOySBpTiCj56GXWRlk+VGHbgpQIZ3Fm6A0dOrws1+1fTqKFpdm
 0FFIa3XhKfHRPoRAaR2MpGDrVRCftIrwLHGD5Z+GerhhJnkx7SGTmMT0dMAV88uAn2+f
 78bIyQxCFM0zSSxnkxCSm5b0FJPC8wRE+w6T9LgfN3bwrfLVHKZ92dewNgbVCUEDJlp6
 F9B/9l56ELNUXl8RV4OI1EYvqagHNeS35cyP+4iawki7hj25jPB/jwR6Wek8NV7ZMwrF
 iz4/5K19RuWSrP5XH4XE5IKUdI+JMCB+cbIbbU2jZ7TscCWqc0pWuZf5zdYKiGZ5c1So
 Wu8w==
X-Gm-Message-State: AOAM5314hJUPV1MCW8E1oMVUr2BfEuMLcUeSJ7nn2b//sg+ZNhIkYdwQ
 tMgGLXpr+1R1RBIkdAF0AZbUsTL/VfL5Fc8RP7xXvg==
X-Received: by 2002:aca:5152:: with SMTP id f79mr2269797oib.146.1592477414514; 
 Thu, 18 Jun 2020 03:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-2-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 11:50:03 +0100
Message-ID: <CAFEAcA8fuxsCi13wagPvXnT5VAp8D4DSD-LzjAp=_k-QjdLCkg@mail.gmail.com>
Subject: Re: [PATCH v7 01/42] target/arm: Add isar tests for mte
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0TPZXrgdn2PP

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
