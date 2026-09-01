Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF25C61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 10:22:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1Lck-0007Wd-KP; Tue, 01 Sep 2026 06:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Lci-0007Vm-KY
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 06:21:48 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Lch-0002kc-4j
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 06:21:48 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8588583a7c3so8418527b3.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 03:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258106; cv=none;
 d=google.com; s=arc-20260327;
 b=qCA4j7m9iE3H7NSh2EiOIkL/wCbVWKHO8izFUu48c61XTHYJ9Y7XivxcQE3XY2KkPz
 zQ5IIzoqCbG2K9mQqrxs0EJ7FJgnJ9owg9XjfU4p/apoY/QrEUyRRQ1moXiiSRKvsbcX
 zueckLITQ0htIoJb28aNMmehBGnsOhNupi1i85ahjWAzae9+p4V5bmsnXByJ/Ifvo4jh
 2mE5QuKsHY2061ho9gRYEIVskJLSGI8etGQzU9DZK69jFeH/EHe81izVLAJ3R0guqGCL
 yIBEjAnyUb2fGjSYfqvcS4YYK5q5fbVm2rWQGKWjne7aAsma/cnIgzhzxnx9Op2nj1JU
 g4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=saqhellrFWocQ7FADiaFFQw3HqBJcvRBLe6SXMt4eVE=;
 fh=AGIy65og22kZBirvwkAHEO7QDoPA7FiM2CdOCBLu8mM=;
 b=cUoAEC4Gh4I7RqCdVGp+s8p7RrhHJsyC7zg52wNCSsnvdfDmb/NEo6lyRwbfCfBfSR
 poxtf6oa9u1F/K9r0BBNHe0Ujz51YdKP6foaUMxPehJdJ0M8iQGSSnZm5f1TXgQky0lZ
 M2vil2MZwgflcgT+N/34C2h9ekgUqsvV7PjvmwH4UFvqZdq5CYcu/QN+taH9+1m+sOiz
 gRw9xaWEBa/ABw9yEt8iNOk/d21y0UCewHr67W2pl+XSCJgOPSYJaOVN7RPwOJGeKPP4
 +FXn7oZaE4a7sTAsN+MJc4DdShxENbR3RZVXcXAjVuxiYaD6C2uM/tcPTirxwqEvJ12A
 ywFw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788258106; x=1788862906; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=saqhellrFWocQ7FADiaFFQw3HqBJcvRBLe6SXMt4eVE=;
 b=j1rDMGJgiOo165ANmiuXTKn0jnS0NftloiO173b/TusE2aPbzciBWBzV8wnAcp4met
 t10M7ToXx1N2NUzO/WhUYKZ5CrUQ1ni0Bxxi1JommlpSbuiP2n5H3cU1pKLV68OvGoDK
 KYkyF1Ydjn6nfBYcr5ZdVq43bJs+3Kirmw9VYt1U2taZcQ2JCShf/B9bWaEUfFcuvdUM
 al17xzL+1ysXSV93e+GQTklWmoA2PXSJCP9hhIANtmBtdwDZu12JtEdy9k40S97s+CmS
 VtbkrkU+nhboqi0yIBYuAc30zk+1zofP+IoHgS55kQImUwDZcNO3ER3D3rHtrsel6iLD
 myNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788258106; x=1788862906;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=saqhellrFWocQ7FADiaFFQw3HqBJcvRBLe6SXMt4eVE=;
 b=L1VKK3gS9dksvRrzOZaz14jMjzwebX4aeEgzf9mONIQqngXlIAfvU3kDyVClt6gmxa
 rgk7Ro/tuoA3WVih+RKd8N+00lQuUO855fVGY/jCrDbb4XZMxcGoYFJz8Vg2Qe3/ci6Q
 QcP6C/JCuZsC49o0L2mlum4RFFFh8Fr5ab5MjyhpW+qYlJ9YFUZxYRD5wWQjRvd+PxK2
 gUtIZIBhN/ZUlyz0CdHDJCLT7F8uqLPj7vIF/E/VM90rft+DwpcElUh5HZyZV833zNo7
 nXP3pbaehQYfNMSVSxieoixvAud25fq+qJm+2k8NS/V+VMOIWgQI7aRNI8Oim8Yg10lw
 W0kw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+3/H7z+A5XIcE61p9/g6CB5Q1pNVWBSTJBE/WC6xekKQmt6BIcRxVsmN8Q1IG+ffWpWjLX4HnVw==@nongnu.org
X-Gm-Message-State: AFuF++mjLWqiSTW9Sl0VDuGIlTot1p7ZAwkGXoRT/iKtAeUviV0D6G3x
 i2gp5L6UVAGHg4SDVsLu+fQm+pwuheX88sD6X67Nm/uYlW9PScX3cVeK5Oezq2farjTYmjxZBWb
 P0qECsp5KDdhQ8tZl/1jnEiqyjuHeXxulcjjVh0huOw==
X-Gm-Gg: AYBFou20eFJRdP1AJ/5TS3/SBauI0T599LcpeizAZEXKssB3n6KWeXyslID4wxAJzLK
 5QY8T8NFemVGb57KOZ43V/fXB2/lh5hUdCexzmde0j0MNMPRp0Dp2cuWDqcBX9290luGVTlW9pj
 i2zBQ61iebiWac8KBye7+RSO0iM4qVU8foLgZK23RKWltZZf1gF4vlO1bg67tfLE+sPCB03HvUX
 OXjT6wf64YMvyPx4zd7mIxi0OBrlw2dg9pcEVVDG+2N6BTWaD8qwLDbz1Yc3mHUpsWpmQNhLWk8
 1aDWpfdJ8yaQU1NrdUuGFk/tqUt3eo3SRY5JGJMj/KopdIft6EWhaN2VXSgoycm0ppHKViJSOHQ
 6vrCjfbc41TucgnAntsSbrGuHwM4t
X-Received: by 2002:a05:690c:7013:b0:865:7a80:36b7 with SMTP id
 00721157ae682-8657a803886mr65663587b3.6.1788258105617; Tue, 01 Sep 2026
 03:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260826174213.614571-1-richard.henderson@linaro.org>
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 11:21:34 +0100
X-Gm-Features: AcwNN1VBjtHsQyYXmN1wu_rgG5KRPdv8GejsjQAP23VsaVLskBfokbtEjQ_1Cqw
Message-ID: <CAFEAcA9bC_26m49m-aj9OJUZWiauTD=a80bZpybXpuAi4AcvNA@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] target/arm: Implement FEAT_SME2p2 etc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 26 Aug 2026 at 18:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260825213000.221822-1-richard.henderson@linaro.org
> ("[PATCH v3 0/4] target/arm: Introduce cpu types max-v8 and max-v9")
>
> Changes for v2:
>   - Based on max-v9 split.
>   - Minor patch review changes.
>



Applied to target-arm.next, thanks.

-- PMM

