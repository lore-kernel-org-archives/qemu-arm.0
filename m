Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp203089njc;
        Fri, 21 Jun 2024 08:27:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+ie8RyzHe1I4vNq4TLEN3ZCHfffLEGcEycylRzNUO11VU9KYxxOr5oUn3UoMRw30MGYIZhxG7h1I9dFgYSwV9/Y4PhBfc
X-Google-Smtp-Source: AGHT+IEd400qF/lbtWIkTzySC6TLeNJ2VHW14TSeRE6W3hynngEPjJeVbNXs9sQa3LR7jNWwzOqA
X-Received: by 2002:a05:622a:1103:b0:441:5a4b:60f4 with SMTP id d75a77b69052e-444a7ac0f9amr109000101cf.45.1718983625091;
        Fri, 21 Jun 2024 08:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718983625; cv=none;
        d=google.com; s=arc-20160816;
        b=ks6CDlEePicn5Hm3DPqmBplgvhL5PCqDilS9zkF7tZNNlUI/7g/I7Agtg8MT+KkE1W
         NKY4ZMo1FKuHrN736UYbVZX1ZWzctBcvkwm2Cgzxi8IexsCrWFM8bkDDbDTHrS4p6FJu
         9jSL2mfbxjXp7VP6S2wHA17+J97eOvjO0iGbMZ/zEAK/l5v1LPIB7e4dx2KU+oXAIBQM
         31fZ/p1N4jShBwWjlN5n/9CNKlxYjN5XKltbOGPDm/5i/G34Ln4kBdPwsDptgIwTannW
         RTvbAgOp6aNBjUSgsIxfYq5xpj/PQowvU7mfQRD3KBZRwQVX/uKdkUiZuy8V01XRiV3x
         nzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yvEkVzNY7yrQw/krJMG+Ot2KTDEEfd7QbNcyjwOCtmM=;
        fh=HTsnZdCgy/k4crsuV6VhgU13KQVV5qqMq9H1eFVPKmg=;
        b=JG7fNv5n4u9MFXZXBY48r4JusxLXk85JnhFcoQERyOlcxPV2vvNDQKAoVJPHM9t9au
         q4V0a0tYXH1NIpSD88Nr6XQvkVZ/Ukr+2IZ8FqsJyjNugyJGhUz50u+RQAkiDKwMDlCX
         CnpSVEzPJXzt1j1f6mDcSYusMpL/mYn3rynGw05SSOQ2caiJn3n5TgARsFIc6XKCf3Kp
         OgNTcwOV3fEsb0av1t2OzMBwk0lvU3tD51hSwvKRWzTrnwfwUL/z116S26F1VURupMTh
         FpZQY6KJO521uaFjKPWcd9d894EYBAG4SaE43a75u6XXXGh+5hv+xAkXdUGvinxeJ5dW
         9hGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQSIxFEn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c09629si18713011cf.320.2024.06.21.08.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 08:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQSIxFEn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKgA0-0000kR-TD; Fri, 21 Jun 2024 11:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKg9z-0000jR-IW
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:26:43 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKg9x-00018Z-Lo
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:26:43 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso2676490a12.1
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718983600; x=1719588400; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yvEkVzNY7yrQw/krJMG+Ot2KTDEEfd7QbNcyjwOCtmM=;
 b=jQSIxFEnvASFX+thgr3Yl0OU+uFmGcsDbPwW5g3pSAhIBrVOkPhQzW6TAqd2ndInem
 9neL+pLBprJlmBfrOP/VpflTRxZCBX88gNpfYVEPKiWy3/U9EV7uR8q22wypcc4OUo4b
 NUll9qgGZ1ARUh5dieaRbojRGCp2iJ96RRsoyr6Svn7nUDXjijjRde+BWLbSu+vp2hby
 jVJJXK7slXZOg3KO0ebO9nsYyKUCfaPa19146owkk/CkQI0HkSqJbSWxEBRiz7CnI46W
 PhSngxvLtuw7ruWLTlC7iIEI+v0viiXyE+aVpTsnRwWiBs4ddSikL6UH1ObQh01oVwqb
 uYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983600; x=1719588400;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yvEkVzNY7yrQw/krJMG+Ot2KTDEEfd7QbNcyjwOCtmM=;
 b=HXk3O3+0YntMTWH9frQJpcjvFTwix8i9GBCz4/rdMHvEBs+HxDsWuAl+aoB/S4ECCd
 UUhO4VZw5aRdjheEVL3PEj9hzDOA+IMLH703qTfpu37elbpguhtyEMwBOzhbPmz1BZYb
 aT/uDg0Qai53sVOCURe843hQGOMhanwMksC70wc19SlFST+Y5votTJO7DYf2zYthHJkf
 4NXDDQa/ftMuzq3n6NyiPqSsGCvrK4Q5ueYzLDCIv7GhL5/eooAzWgz5JOA1tGtj0H07
 JJiYEtFYYEltoeosjR01xmTuODIsztHd9bNFlwdToLI9gh6uJ0GdTUfHnJ4Lrpl3aNK7
 gtow==
X-Gm-Message-State: AOJu0Yz9AK0l7fWYkq+HE+CffTuGil9IVKAKQcU49RXHwbYE6iWEsSfe
 r9Q5Q38S9XOkheC9fXj9SgaiPDnrWSw+2OvpD8QnA9WFEqiwPFWFhSPPT0/i6E4LpaUq9yj0RDa
 Ho93Ehryo13Fk8PCoca6UwOhz9qo9do4iVuDzDQ==
X-Received: by 2002:a05:6402:1208:b0:57c:6188:875a with SMTP id
 4fb4d7f45d1cf-57d07ed3adcmr5398641a12.26.1718983599869; Fri, 21 Jun 2024
 08:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240607103825.1295328-1-xiongyining1480@phytium.com.cn>
 <20240607103825.1295328-2-xiongyining1480@phytium.com.cn>
In-Reply-To: <20240607103825.1295328-2-xiongyining1480@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 16:26:29 +0100
Message-ID: <CAFEAcA8cUZV8PviBY_wf5Hko74t=cDvgW=as6e-++aVy4kSquQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa
 machine
To: Xiong Yining <xiongyining1480@phytium.com.cn>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com, 
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: +5H86YJL0tQH

On Fri, 7 Jun 2024 at 11:38, Xiong Yining
<xiongyining1480@phytium.com.cn> wrote:
>
> Enable CPU cluster support on SbsaQemu platform, so that users can
> specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And
> this topology can be passed to the firmware through /cpus/topology
> Device Tree.
>
> Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
> tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Applied to target-arm.next, thanks.

PS: for next time, you don't need a cover letter for a single patch,
only for multi-patch series.

-- PMM
