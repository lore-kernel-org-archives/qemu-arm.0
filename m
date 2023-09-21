Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp651529ejm;
        Thu, 21 Sep 2023 08:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO9G5F2Qe47ct2sg/lwUZLMG3tg1qqWpg6XS+ZV4ZQdFpnzFfV4pRpUS0g5iIrnAvY+LwM
X-Received: by 2002:a0c:a709:0:b0:64f:8415:cb76 with SMTP id u9-20020a0ca709000000b0064f8415cb76mr4651844qva.14.1695308681760;
        Thu, 21 Sep 2023 08:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695308681; cv=none;
        d=google.com; s=arc-20160816;
        b=VxQmhitWBv5OVeVtyFDhenr5JqRhdi7DuUCQXqsGtzJMQpUPJC5+EX68yRAbFTiezf
         fEN+cGx3mDtaaBMdgLXikfmF1o61Z7DsTayD6FtVC+ycrbIHoPZA47kvHk5+Z7tMyZNZ
         N1pxbts5cJV+vDn6vRBU9jZBQuYoMHSIQHocWhBahCmCID1XypmurxRICedqRc/fQzV7
         TBqrj8SXtypmuRgbzZ3N1nQyt3NA60NBVnrePTaoCHAjFf7KEVKkdVCMZW8oWi6P1rva
         pi6i25djpyr+lT3rLGuKT2TsUfugeEU+S2BK+ZxVl9V/1TtOlu90elE3yevM+skr6q9B
         gG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZTK1H1bUdqQ7gWN7sjQJRsSILWGa8uEA2Dtkliuxyqg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=HmJf9YJ/KTzZy8xXNUTJW19fi1qupabo1j3Niz8k8Ttf0NuXiVJ33Lv9KqGaelqobe
         9T64UahXSnhxkZlGEe7VHLgnBnDFogVZfcy74Fovw5fMT+Ts+sUXloFVQTZBQmNWJF4g
         0tjhgGEo0/8vRFLiuN4PfIZx1BzjvtZiG0LuXBuMZPSs0syFZnj5H8kqTaExm4l5xTGH
         ghrmUR/rXqD42qyYw3np4pFsWW8TkkeNT0gYvFjPFi666kgXGAJf1QZKZq/Qnp5lFxpa
         0hf+g3Xhs5hmVdBNke3YOqkgDbv4+x34bsM7jk0norLZZld5dUOivsyCAqH0WrPeSk9J
         6//A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AllDDRR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tv10-20020a05620a3e8a00b0076d990f8864si1013133qkn.259.2023.09.21.08.04.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Sep 2023 08:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AllDDRR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjLE7-0007yU-D0; Thu, 21 Sep 2023 11:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qjLE5-0007xq-Mo
 for qemu-arm@nongnu.org; Thu, 21 Sep 2023 11:04:21 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qjLE3-0003zI-9T
 for qemu-arm@nongnu.org; Thu, 21 Sep 2023 11:04:21 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-532addba879so2223406a12.0
 for <qemu-arm@nongnu.org>; Thu, 21 Sep 2023 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695308657; x=1695913457; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZTK1H1bUdqQ7gWN7sjQJRsSILWGa8uEA2Dtkliuxyqg=;
 b=AllDDRR6ddhcBohdHcgPSKF3sJKNFvyle9HXZg9cQjFLftcJ675OedPyRdWtB+FwC6
 qq2QMXD0fsNb4UPtvYPxpaN+d6O9E7TsVvf3g+M3OsBhA4yYtXp64frOK3zFOtGwaweQ
 SovpJlgHUgS+c8fuqZQ8aRzlf+lq4nvwK9ZjgGqQYdG95iyVS6KZEGwhq7hDx52qxLac
 2ci0kYUjhT94UvjlOkCMNtfKislk4OKwySfZgf7iSjhUV5JT31eedy+lJa7kFG3TaMoS
 154HzJ44IiMLDgUKJy+MgH90NJVs2uUUxH41+q8iRoR49ncxFRsvP7qC7BX7K64NWF6y
 7g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695308657; x=1695913457;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTK1H1bUdqQ7gWN7sjQJRsSILWGa8uEA2Dtkliuxyqg=;
 b=KliTCRSDvXmvuj0YoB78TXDKqKU6HCv7r5v99ODa1DbVeob4zVVPm3Ke5No3RYvnV9
 FbzZDRR0ZgLfDrsvLgtZjNUlxSHyLr/6oP5Ooa/nbZDbb52oM2DeOtJbdHEHY3NyncfO
 bxOipu3CWYEUN7rOH8QoGdjUMHNA1+oo2ZHxDcnbADV7HIwxcS5rMOEh9pdR3peHhxTI
 4Ofi/ehHtOFtsKR/5+J4RgOXFxD/mAApFiRdiPbhv4UOi3uxilF4VPMWwHr5dKAU28sx
 8mf5E4qgBhUzJw4FwBkXEv1N7/ao7Yz8aVACe/gmKGmlc3zlkD9DeAJKu13IdteI+UZk
 QhTA==
X-Gm-Message-State: AOJu0YzyJAlHKetxPlg3VLSK77dB+NGlZ4g9HFlCpKLDAheqzP84eCbY
 wcyRyfZVXhE3PK3FiFOHmKu3D8T+Tp7MlwdCNLTi+/DGx5An5C6bGLU=
X-Received: by 2002:aa7:cb42:0:b0:522:4764:8baa with SMTP id
 w2-20020aa7cb42000000b0052247648baamr8545972edt.12.1695308657276; Thu, 21 Sep
 2023 08:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
 <20230911135340.1139553-7-peter.maydell@linaro.org>
In-Reply-To: <20230911135340.1139553-7-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Sep 2023 16:03:58 +0100
Message-ID: <CAFEAcA9FjmE4QTnnGpzjaV3bVPO8U4yr-527RahAZA9tXbGXEA@mail.gmail.com>
Subject: Re: [PATCH 6/7] target/arm: Update user-mode ID reg mask values
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MVEE2N27huR8

On Mon, 11 Sept 2023 at 14:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> For user-only mode we reveal a subset of the AArch64 ID registers
> to the guest, to emulate the kernel's trap-and-emulate-ID-regs
> handling. Update the feature bit masks to match upstream kernel
> commit a48fa7efaf1161c1c.
>
> None of these features are yet implemented by QEMU, so this
> doesn't yet have a behavioural change, but implementation of
> FEAT_MOPS and FEAT_HBC is imminent.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

I forgot to update tests/tcg/aarch64/sysregs.c to indicate
that the new fields are permitted to be visible to userspace.
This patch needs the following squashed in:

diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
index d8eb06abcf2..f7a055f1d5f 100644
--- a/tests/tcg/aarch64/sysregs.c
+++ b/tests/tcg/aarch64/sysregs.c
@@ -126,7 +126,7 @@ int main(void)
      */
     get_cpu_reg_check_mask(id_aa64isar0_el1, _m(f0ff,ffff,f0ff,fff0));
     get_cpu_reg_check_mask(id_aa64isar1_el1, _m(00ff,f0ff,ffff,ffff));
-    get_cpu_reg_check_mask(SYS_ID_AA64ISAR2_EL1, _m(0000,0000,0000,ffff));
+    get_cpu_reg_check_mask(SYS_ID_AA64ISAR2_EL1, _m(00ff,0000,00ff,ffff));
     /* TGran4 & TGran64 as pegged to -1 */
     get_cpu_reg_check_mask(id_aa64mmfr0_el1, _m(f000,0000,ff00,0000));
     get_cpu_reg_check_mask(id_aa64mmfr1_el1, _m(0000,f000,0000,0000));
@@ -138,7 +138,7 @@ int main(void)
     get_cpu_reg_check_mask(id_aa64dfr0_el1,  _m(0000,0000,0000,0006));
     get_cpu_reg_check_zero(id_aa64dfr1_el1);
     get_cpu_reg_check_mask(SYS_ID_AA64ZFR0_EL1,  _m(0ff0,ff0f,00ff,00ff));
-    get_cpu_reg_check_mask(SYS_ID_AA64SMFR0_EL1, _m(80f1,00fd,0000,0000));
+    get_cpu_reg_check_mask(SYS_ID_AA64SMFR0_EL1, _m(8ff1,fcff,0000,0000));

     get_cpu_reg_check_zero(id_aa64afr0_el1);
     get_cpu_reg_check_zero(id_aa64afr1_el1);

to avoid check-tcg failing when the new features like FEAT_MOPS
or FEAT_HBC are present in 'max'.

-- PMM
