Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1321226lfb;
        Mon, 19 Apr 2021 09:29:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdj5avGoqal1PMsQwyoj695DhaUZL+Uca7vz0FVMD2nLKhGSa+P8XMpI3T29mISoosT8+B
X-Received: by 2002:a05:6e02:1351:: with SMTP id k17mr18426655ilr.37.1618849786118;
        Mon, 19 Apr 2021 09:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618849786; cv=none;
        d=google.com; s=arc-20160816;
        b=u78U/x+BI8WA2keJKD22UwYs5AZUqkvNaX5/ln70cXr4l/d86j2WG6IChxJE6del8m
         iV8ZzSm/ZtUUaGwXPlI7R6vXhrq8TJQUUONtiKK/rhd91hrE9GiWQQaR5pB0Z7LQcDVn
         lsP/Fv7LJsZNOKJzmXa2y3pi5UtiHsHt+Wmj15syDrA9MBlp5MPn3msThYAnBi2+COQq
         K1sR9lVnZMOhubENMmZ4YGHVC9uw8r7ipmNsq7eJfVqQv9suy0cXdKelAmkOHoVSDM8L
         Nq2EcS1Nbi/YvnG0+1h+5ro8UHJf8HE4G7R4W1pWWfv+m+8IC+ZQBToJEicNTadX+OxF
         ZllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zXwnwN5tqNWAFfi0o6dM6Hf1uRXNTzIRfAoMwRurihE=;
        b=cQwGJQtvxGOTcLj0EQKLPE6gbGq8zdBh8ildDWzcsStUIrJGcDYw45j0k8hE2X1yPr
         XKsi9Fny4fK7/RLMvTzd4NQ/GY//7I1uyJSVab6JtrXrurJV0GUTToe+9IyYnDTDNCnt
         S8jHLDQMEAfrSEdp/jC7yqYQDqio8gP3QNluUZtSm54HHXPFvOgWD/SPsfKmDvsLCLPZ
         nxw0bHRDOR+BZyvedJIUYxAqKtRWSrt1fssAQlfrT8nJzyUSfmKoqyHscO4oDX8xfLkd
         0yV0ZuZOr2l/IPFJZhnJhJ0C29ZKt99Az+OiNW4OGn3rQLGCwfwj2sHQEqC/Hd27/6B/
         znhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZJx2OJSd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si8083751iof.36.2021.04.19.09.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 09:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZJx2OJSd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYWmP-0008Vt-Eu
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 12:29:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWmG-0008Ud-QR
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 12:29:36 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWmD-0004nD-QH
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 12:29:36 -0400
Received: by mail-ed1-x535.google.com with SMTP id i3so15803843edt.1
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zXwnwN5tqNWAFfi0o6dM6Hf1uRXNTzIRfAoMwRurihE=;
 b=ZJx2OJSdB1Bwsvb7MbWEpqv5ozXM2o//Nb1co1wg/qT+bi+PZCezcSzRU2XeOxh23A
 LVEOsapLydkuurXUOYHpd/88udYBU1Rs78t3B1TztxricutXCzK353D+S4ISg4T8T3W7
 mxe/3Gm44EThtG15AyHvDbiO0m5uqLwyfhEaytIYRnnuO+laiV13tzbU2LWaeX4v0NME
 tc7zILsRLqQaF33KdWQiZPx9McRfg3pLij2JMDT7oeNQQxitXybONLbKeR65qDCzbeW2
 nWUi+/Go5kPYb1/lp6vBUJF1Qwo7t1wuzjFJDT8b4dGSq+TRyUoOAYniY2b5+VTR/R+f
 xUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zXwnwN5tqNWAFfi0o6dM6Hf1uRXNTzIRfAoMwRurihE=;
 b=bUEk/75AXfRgecxdfitYMHguo890hdU34b1vqyzMeuSaGp5io+9vxF0Zj/PPAnVq0z
 QI+RirhO+7Hm95Lo/9orOvwPXiwHQgbmOWzRMyVLMruhtMBsfGBLwIWcvLBjC58eG1VP
 syfH9ZcHoyigtHLTG2LloNhu1PnTLBHW+/u9OG6nwsgKOmqrlBbc9Db4QaBn4j4HZPnk
 8yBuppTcZN1YC1edjlKYbTFUBuqfK7qfaRbYaOo1T/VfS2hi+FZMWba93zJrUEKUVaQZ
 WhpHMbokIHw3zcPdgPr/jWF613Ln7NkUMyLRD2XPLvpGWuTo39vg7pSfV4yExO3F5wIG
 TEOw==
X-Gm-Message-State: AOAM532vLwOkF/3p3fEggOujJ4hWwK9AwnFChtEyUjZyGJy99+uHXdFZ
 VrCYzpXsPm7ONVoVVThy9g9QSDAyn7reox4KO9LqIA==
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr26616620edb.204.1618849772296; 
 Mon, 19 Apr 2021 09:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
 <20210416183106.1516563-3-richard.henderson@linaro.org>
In-Reply-To: <20210416183106.1516563-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 17:28:40 +0100
Message-ID: <CAFEAcA-jjNAx-zZdLRS6CYb+1w8UsezEGc+YzqvKj9-MKWrdcw@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] target/arm: Split out mte_probe_int
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHIm8vEzK6/j

On Fri, 16 Apr 2021 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a helper function from mte_checkN to perform
> all of the checking and address manpulation.  So far,
> just use this in mte_checkN itself.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
