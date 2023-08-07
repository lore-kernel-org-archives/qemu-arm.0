Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1564192ejb;
        Mon, 7 Aug 2023 09:16:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxIBrgETEh0jsV5138xTctHrsh63m7u0NlqnW85UwkOtIbpULsOB5MOCeQ6jN2bp09nkxV
X-Received: by 2002:a05:6358:e48b:b0:134:dc90:b7d1 with SMTP id by11-20020a056358e48b00b00134dc90b7d1mr7342864rwb.25.1691424960097;
        Mon, 07 Aug 2023 09:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691424960; cv=none;
        d=google.com; s=arc-20160816;
        b=DGpP7ocTNbLWpS3DoeQnN/hWzfZU60L7zj29+qx8hVBHncpTUIE28z1d+zKe0srBra
         inpuTTkrAqgo1EHFB5kCia58fx7lrga4Nqae/jtDj50feK9+IZ/gWeXjD35jGlSGS2hI
         mXxzBIgoxepfYEc611i9Jt258DuAnZGKWPIfrHZ6Z110pvL66yvhSV3LZqvy1fG9DBue
         mUqSEkvUYFljE5uX/xdUQ6uKLE9C5TAtNb8+OX4ET9Zv+XVsk9bo6cKXgMyItZDDDSro
         UUJJ9gV/pbUZparVGmRoLmVxZknQkFXhvx0WPAj6F7Hh8TvBZObrxj6nROIY2wPjjGVS
         2xnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NTzGMqsBG76+Mj9TCM0lCzACEfbqMAiSZLU5eXNdJVQ=;
        fh=vaDpLBJmz5JjobJK3RXWYZonZ7WwqDVHFeS4aZ+rLcg=;
        b=Fakfqc8O60mgGYaMlN5hZowy4OVI06dX3CZRysLh8y7105iu/k2eY4OGWz3Kh3q9Ke
         mM+KkqscNkkU7tDOF3cqFpNMrOYM3QqkBwOY/G5GcMNmaLEW5rb/et6FwfFo5OSAMx0k
         cOXsIQuhPpUxRqQHppZdUVVKAPKULrrF8hvmOOAVtrHFgJaLkZz/P2G1ft8dbuWsvU6V
         iw/Z5mcRAIgMsQab5GKmJU6rNRZB8G359bSqSQ3bmyH+N+UbsrPN0HsUXusES27LyvuY
         MwytNYX5CpbyGcpglfMo+3iBKGsTrIYzq0mpKbIvD61dZQ/CCEfTjj/xm6pt6+7gvjEr
         yS0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nnns/hNN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g30-20020a0caade000000b0063d15dea1f3si5056768qvb.574.2023.08.07.09.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 09:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nnns/hNN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT2td-0005Aa-7i; Mon, 07 Aug 2023 12:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT2tP-00051y-Gp
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 12:15:39 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT2tN-0006ZO-K9
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 12:15:39 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5217ad95029so6085614a12.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691424934; x=1692029734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NTzGMqsBG76+Mj9TCM0lCzACEfbqMAiSZLU5eXNdJVQ=;
 b=nnns/hNN4KcrSBXQdb6Q2FoVEBUR4WTxCaMuvQg4N5BWyNrBe8RPPTLadWsRa9Gvgz
 C6Mm1NRu8BUzf10ICG4tArWD1zkCr00hALO5whKhpcAwRchHDrJrOxtxIjUY198eCqCi
 +Yx1UoFvTOmSChMhSp8uL4RC92DY65+0VMFRSEnmONBbKCo2lj8EkJJhsMWf+LRKbIOH
 QQiMJozeirMAcNu2Wdkf7gFHUTKVla3tkrVr9zm0x6pjh0/vpzFp8KXlESBl18TRA4jQ
 /L1nrqwCW0XGjVhxohkLqVKON/+qw3Y6jKMJxGb3uHYI0vlWRZHJVa6enIS9mlD06NPH
 5CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691424934; x=1692029734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NTzGMqsBG76+Mj9TCM0lCzACEfbqMAiSZLU5eXNdJVQ=;
 b=S+/GaoxcQtMtbw20x6LbpZrjZzTuHlyZmPl77lOx9rzsSkT3AhpXxNlVMIgF03Uyfl
 lkCXrtTf81HizLkqQ4kVn9CKsqdtEOcEqAd/HWQC5J/czuejl4MpS+k/0vPPw1GeCmsL
 No2EdJx6Mmsv29BH+w2GOPKVcBnttKe6eU2a+dc97pzknMAAI8kZoSwSstg1juru9t5w
 /F1z/qmVooLEnUTTlA/QozjXdbwIh1CKiURkJ8lBWesanI2U2Qq7dCJ2yf8J9frpGOaE
 FcNsPm9lPupjp+K+ZO864vZQv5yxnpBv/h+NNUi3ZTNueMQtLu0j59bDUcRRlEsIqsoA
 DRsQ==
X-Gm-Message-State: AOJu0Ywm6CkUJJLYYE3euLdNWVe2zjI9zkwZYJv9qN76VbLZR6evlio5
 F1p8pT2HHwQEn27hX3azDkqK5jZDGmPpPWX+irYI2g==
X-Received: by 2002:aa7:d8c2:0:b0:523:2274:91cb with SMTP id
 k2-20020aa7d8c2000000b00523227491cbmr6897090eds.12.1691424934674; Mon, 07 Aug
 2023 09:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691010283.git.jcd@tribudubois.net>
 <0f53f1ec92eebc4cfa7acd6b170a9d1f6ef754b1.1691010283.git.jcd@tribudubois.net>
In-Reply-To: <0f53f1ec92eebc4cfa7acd6b170a9d1f6ef754b1.1691010283.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Aug 2023 17:15:23 +0100
Message-ID: <CAFEAcA-A7+XbACR-91b--fGfUcjv+boRzZEr=FM3WS5T3EuMAw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] Add i.MX7 SRC device implementation
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: hHBuxDrkWKQ0

On Wed, 2 Aug 2023 at 22:08, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>
> The SRC device is normaly used to start the secondary CPU.

"normally"

>
> When running Linux directly, Qemu is emulating a PSCI interface that UBOOT

"QEMU"

> is installing at boot time and therefore the fact that the SRC device is
> unimplemented is hidden as Qemu respond directly to PSCI requets without
> using the SRC device.
>
> But if you try to run a more bare metal application (maybe uboot itself),
> then it is not possible to start the secondary CPU as the SRC is an
> unimplemented device.
>
> This patch adds the ability to start the secondary CPU through the SRC
> device so that you can use this feature in bare metal application.

"applications"

>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
