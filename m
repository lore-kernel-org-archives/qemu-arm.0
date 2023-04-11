Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp504992ejc;
        Tue, 11 Apr 2023 06:31:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350b3EAq/qs5IrVL3WdQwWxNugEO5OVi5rLZEB+onjllZOZ8daWQhuDEgmvfiRXqVFcFMK9Xb
X-Received: by 2002:a05:6902:1005:b0:b6a:e856:6a5c with SMTP id w5-20020a056902100500b00b6ae8566a5cmr12693468ybt.47.1681219880700;
        Tue, 11 Apr 2023 06:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681219880; cv=none;
        d=google.com; s=arc-20160816;
        b=x1upv9TCNz1mV1Ti4JeUMMSsuMGszWs+zqmJMUkJAIvnoXs/JdIx/SFjrbUlaiwfro
         sZsuGqUyxqwwdKyWXyPrUBG4a3z21K/csfyVDQhmHL1FCQzp/Wn71jw7NSF1spdMublt
         44CbR0dmSZTwkXrFHSDnbLIcKjAHiHNmzewZgbFgNBI35+qv2vo/lBl7tihGm3N0fLxN
         fZkyOZsPaxi/cJZSumTRxrMorZtib9kilDuq42Ffpoq4RUwOXOXn/uvdHZFiKFxgr2eX
         w01we2e2tOt9l94QPVOd7o8ePvdAuTI5+7/4TLOfGRT4zyZdz31EwSOoUmaudiEYoTe2
         FaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=O94aUhfnuvCya4y4UJ4vAvaQByeJn2VCA9Aoq3zdYtw=;
        b=hbjftqLg/Hk08WheoLpu3uTX3pi5zHPeGDd5ikwTLb9ST4zKqDDTaaP/KCtvvoHYPw
         lliF7z5/t6wA2+CWPI7Zj4dwaMu3yTPl1YwxuqE5j3ePaW5DU7AAInb5jt1fjM6ABb1d
         +CH4cVWz7w47tyWHfYLlmP+dfndr5LJ3eHCiGvOaQ26jNe89FnOcAHyc6oFJjovRMGwU
         NmFbPLH0ruDdpUM29icMoBGC6guJkWNGOBbtmfb5DhHFjja6LEX4Bdv3bmpejO1VcBEG
         vDuC7+jtAW5LLmEER8rFZjhw7ky1cuTscRYbBhJ8M6hlBuVAK+KIuRoTSv37Vb90J3xB
         X9ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TGCvBN1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a05621420a100b005e71e040239si8389278qvd.115.2023.04.11.06.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 06:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TGCvBN1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmE5C-0002ix-8a; Tue, 11 Apr 2023 09:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE5B-0002iY-DR
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 09:30:49 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE59-0006zX-QV
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 09:30:49 -0400
Received: by mail-ej1-x630.google.com with SMTP id sg7so31783177ejc.9
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681219845; x=1683811845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O94aUhfnuvCya4y4UJ4vAvaQByeJn2VCA9Aoq3zdYtw=;
 b=TGCvBN1Jifv1z2hM0rM86d2ghsl9+LuLBRxKMMC5nMFV/KPKkxsOMEHuPPMrIqRQLd
 uaOZArSvb+BhIaYZpbVA7r2XtVImt8oqHXpsp5VP9jCkjd4aRMC1MOMSYQNsH1VIB3I5
 +9wc1B+h7wGOKEhdA7QNpSIXFrY72rZB/3jTs6olkMnyX2Xh2b+GcYfebNoJQ3f+iZmd
 G97QkEkvTw41i5tuhrVcCbzefLxMfqw6EJAALRzj6C7EKWSEowe6GC6jvfP3lSEuVUwu
 yiarORchwyeKCc6nHf+OLf5EI4M/PZtm2ZcAjOLNYiNgHg3MnNri/jHW2xxh0phjKjSc
 abHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681219845; x=1683811845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O94aUhfnuvCya4y4UJ4vAvaQByeJn2VCA9Aoq3zdYtw=;
 b=mdTWcsYJgwGsbgX44QYmS8KErRBwa7spqU/4jdI/DYRl5Fya8O40cYaTfDu6SUnADD
 EQPybMv/2ocEFHogO23GneikEMqxks3klbKzRzNhYTAiaI8b2SZH2RhjJuW5JcPcEQZP
 I5Ww+eqHbJbZMjMtphYi2EndwCY3J/YOOeGlxBJHYCKkotFWSVEYpHArZknEl4/ja7OL
 o8I0KLJKsJ7S4TyRpZRxTKQi4yfMx2h+gNrOL3a2yOZg/+a+7ZYIOeHh/GEfcHgE5HaN
 mt1AVcZDFW/xsfDsS1rUjs6nLizhRmrYJOH7DNiA4Uc+U+yM4NTHR/E6K9OymXew8L9l
 O1fw==
X-Gm-Message-State: AAQBX9cLvKXWBx4EcTKYTTwyBCQ4NL1sYAsZ72OwfnvgGv/UaemWKYHo
 jT2jH2p/Jh2jjv09jKupLmUdI3HW2J0zVHtoiLwKsw==
X-Received: by 2002:a17:906:730b:b0:939:a51a:dc30 with SMTP id
 di11-20020a170906730b00b00939a51adc30mr6251322ejc.2.1681219845376; Tue, 11
 Apr 2023 06:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:30:34 +0100
Message-ID: <CAFEAcA-f-5VMWXWWadvwHPS=x7taoBP+Tpr-BEc2j8XTDfhEMQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Basic Allwinner WDT emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: 4arhowSzee9k

On Sun, 26 Mar 2023 at 21:23, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> This patch set introduces basic emulation of Allwinner WDT.
> Since WDT in both A10 and H3 is part of Timer module, the WDT
> functionality is added as an overlay in the memory map.
>
> The focus was to enable reboot functionality, so WDT interrupt handling
> is not covered in this patch set.
>
> With these patches the `reboot` command can be used for both Cubieboard
> and Orangepi-PC in order to restart the system.
>
> Also, Cubieboard avocado tests have been improved to include reboot
> steps as well.

Applied to target-arm.next for 8.1, thanks.

-- PMM
