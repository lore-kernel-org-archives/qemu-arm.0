Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp266351ejb;
        Thu, 5 Jan 2023 04:24:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvBDAqbT6Q0IZSNGnVOj5d4o8wCInb03c6CdqWqFVyAi26r6NIU1VMKF7tQoD7aCSo5akGy
X-Received: by 2002:ac8:520c:0:b0:3a8:1079:b844 with SMTP id r12-20020ac8520c000000b003a81079b844mr66973553qtn.46.1672921478105;
        Thu, 05 Jan 2023 04:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672921478; cv=none;
        d=google.com; s=arc-20160816;
        b=DFN06a2ujV505Tcr2eCGIxm+7xF3uvKUrF16wrsrT5c7re1e5EZhPeCBugOIp9ITHl
         hlYnYXEyyOTalp+5CmsMlepBPPcGD4jij5fb6Vy1Rl0gvZHXjzlFxzcqeJDY1XzIySag
         cwCwRtt7ApN3jmCErd2oUv0+/CuWIznjT72UhATBuvWedQvHdBS4eWwd9QCx4BKEXxaf
         Per+efdw+LtILGQ6UiAaDkSh5wr3OkRylPYmnLjTLJTE/lpyHNEeeBvhNVoZulLnZAJd
         Pe+hG3kd3tChNluI+UAIFYVxgvy4sVqxCcuPXSjAf1BAy3PrjVf32wfT/pMr2PQjzG6q
         1bXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BudTyNHSL/cxLA+L2U5eO2Ls8z9m7jsXk1TD1P9Ewpk=;
        b=jzAT5m6HDhOTM/WfiU7M34w5G+B1iIMU8i9SQlI1DWo92iV0o2fXq9bOMG3wQ/8P2g
         cbjvPMgsn8TQQdkVQ76zhMY7sslwkKNDNfAhrXixjEy7anLNWP8edgq0agcHN7g7rzCF
         aUq6uD24Q6EKMvedeeZnLrb+3zzeXieH0S8tDVss1aSWuTj50Sb52fSsVd1y50p0EbFb
         oDrA7n/HG5T35lhJdtsRFydfXm+2c/IJt1UeGh1oir1EUdffKB+UpMxXhb/7Q2SJnkC0
         SHpGcdx8o4AA9vdDuTHqaLQg1/s/Bq8Lk4F4j6I7Z7lJ54XkYtaQjMoFSzEXTM0seblC
         qH8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OnSzvRV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020ac851d6000000b003a8158a4322si17486091qtn.259.2023.01.05.04.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OnSzvRV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDPI6-00039P-KW; Thu, 05 Jan 2023 07:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPI4-00035l-AQ
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:24:12 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPI2-0007U7-PI
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:24:12 -0500
Received: by mail-pf1-x42f.google.com with SMTP id y5so150499pfe.2
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 04:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BudTyNHSL/cxLA+L2U5eO2Ls8z9m7jsXk1TD1P9Ewpk=;
 b=OnSzvRV1R9ZpndfzRUHCmBnoh+fgqgqeknYtSzXAv9F48b/IAkLdXeuJqJeWmMCzwd
 u8Mu4b/vM4p35NqmeH28CxlRx5Yu+JJw1EfZQ1QYq8tTze01OI8wyyvbKMA7qCvdC03L
 Sx6ICQHCZgaIXkfEjMg4jaZmcJTORYyGGEyhnk3pghf3yIgMGF2qAoKAzwub36eVd2CS
 etrJQa5S6mQ7G6b2bdP4HILpmvSyaFK2Ux2vil8FjxFhbovMwvIzEI6wfN8vjF+2EHPk
 LtdnKW950YWPkMcstDVYCHNbjiLlxPtYvYoew5Ke7IUuI2qxczSDhyu4rAUqw4t5mgQ/
 H02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BudTyNHSL/cxLA+L2U5eO2Ls8z9m7jsXk1TD1P9Ewpk=;
 b=cSp/OHjpkmUfR4FjRYD+sLLyLQK4kKFnH0rxhrfmWVCLu7aPteF7tFvglAP+cWogBK
 fi55rHInYpkC00Y6il3WthcEgatXQvUy2hPR69x46TFIt7jgkFr9/mzLGuenMTHLaXXh
 nA7kWaCheMGYwr+tTUdoxMC1JlKLaPIDJsfboCtagz/PDV1vY1GlViTMxrLVqqb0dJUw
 fn8n381HYHX2YwsVk3ledz3Tg6LQyAmCWzdxNkbrybYLReeHVQeeoxN9QQtZo7lo5umi
 UBkAJxI7Ycgn/miEhpXb+fQfpoLofaXwdaEMvUDsg5Eo+tzAPVKgiS3l88w87TfCaFaC
 FGBg==
X-Gm-Message-State: AFqh2koIiWAHhzFLqEvdJVihV/vkX4Skl6HWP08sQoGfCpDp/K/jYaeh
 Pp5c2wxEngY1EDx/dtZVvVkJDbHP8zItSH/Pg144qg==
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr3350916pgq.231.1672921448561; Thu, 05
 Jan 2023 04:24:08 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:23:57 +0000
Message-ID: <CAFEAcA-pyZ+GENR-X4C19LoL4MTTV1PcY7Gs26_DzTaFX0g56g@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 0/8] hw/timer/imx_epit: improve and fix EPIT
 compare timer
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SYwcEedmKhyk

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> This patch set improves the i.MX EPIT emulation:
> - fix #1263 for writes to CR
> - ensure SR_OCIF is set properly even if CR_OCIEN is off
> - hardware reset initialized CR to 0
> - interrupt state update on CR writes (e.g. software reset)
> - remove explicit fields cnt and freq (they are redundant)
> - general code and documentation improvements
>
> v3 addresses the comments from the previous iterations, but still keeps
> the scope of this patchset limited to addressing the obvious bugs in the
> behavior. It does not try to improve the timer accuracy, thus the
> following remarks remain to be fixed in a future patch after this one is
> merged:
> - don't use PTIMER_POLICY_LEGACY. Fine tuning this requires more
>   time and currently this is not a major concern, because the timer is
>   working reasonably well.
> - replace the modestly harmful sequence
>         counter = ptimer_get_count(s->timer_reload);
>         ...
>         ptimer_set_count(s->timer_cmp, counter);
>   by something better that does not lose or gain time. The current
>   patchset does not introduce this sequence, it has been there
>   before already. Again,  the current lack of accuracy here is not a
>   major concern because the timer is working reasonably well.

Applied to target-arm.next, thanks. Sorry it took me so long to
get to this.

-- PMM
