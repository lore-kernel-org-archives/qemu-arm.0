Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2256718ejb;
        Tue, 30 May 2023 08:25:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6s3wqAWCdPsrwhlYuHbjFXSYffnl9VtB6w5nK0cs0YCUaNf3nYNnJOOuY1JB9Dlh6H+gvj
X-Received: by 2002:a05:620a:8802:b0:75b:23a0:e7ea with SMTP id qj2-20020a05620a880200b0075b23a0e7eamr2268475qkn.75.1685460330293;
        Tue, 30 May 2023 08:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685460330; cv=none;
        d=google.com; s=arc-20160816;
        b=DdtH20Koa4Yvsc9gWHPBza6XlFej1GCGnLldD67mnwwm48zW2fqs3Hzxm6ThW0w/Ge
         CaK9RTKsQeTM3TkT8x0qvyAlBzMggBCSlSFCf7AGM7RSXkx38rhJeDPbAl03NgUijaOe
         Y1zfS9bk7XIOR4e0Skwbe3wae4XkZRyuz4Z9eGcy1fLZ0GFfcSdnBhRQFOXjl5klujZl
         ZTdW6qq7VflEUfDIeU3/VZ3qz+T9fGi+cwjDR4kCyrQK4GS4NiUPcRC7ogg3IOsv1EQm
         J908Il6GTA664JvmmtHrdiKjYRXCsJygj4CTwIWgXyfw6oXmg5aYiB0JcYkPmwzELFIe
         YKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=j4QbYHmZ9uJKn683nbgPSuxd9jGSqiNvJwcu5+e9Eto=;
        b=cFLCG+YF2uvBQ01K/UfGvz3x2n+mAC73mF4ldTuhU2mRuc7okN/kcRXBQzOlXRr1Lr
         OkH4aWt/sA9t5z/v/6gdN7WC/P408XpIWNFHmt7AG1BFmVrX9FN24AmMO9y9C75Db5+3
         hCwsQmaHBZ/Js10qZzUEh7VBj64AjodZ0F/LJH0WOlET/htCFZXHBV+OHXr3vSMvXzBq
         pJTuUQ8agLsPYpK8VcaUYT/mUAbHKsYpha1DBCwuILGQWBbBzQBR8dkygjnrgCcrKOMC
         qrp7CBEPJNV3i4m/RBad2khzN7t+rf99jE2wpEO9mOakRnZ5GMvkd43vixQRsaT5rKXh
         Wxsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cwwi3V0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25-20020a05620a10b900b00759453c488asi6669358qkk.357.2023.05.30.08.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cwwi3V0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q41Dp-00023f-AX; Tue, 30 May 2023 11:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q41Dl-000218-8z
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:25:13 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q41Dj-0000WA-HF
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:25:13 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5148e4a2f17so6930295a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685460309; x=1688052309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j4QbYHmZ9uJKn683nbgPSuxd9jGSqiNvJwcu5+e9Eto=;
 b=Cwwi3V0XJZUKzDnb73e9d0pU26ckIf05du+8hL28N5c4a4LghBjpMsxG8VL+3uAjVc
 aW2pkI9PmnDyuitLCpmhiDxB8JppEG5O/6GnbGrTn9Wm7iZXRv2hop2uzYsPfoUOKhWz
 Lbw7nQv/nsqzSKQaBqIaWLEbqfYWYZ9F2ydAD8SKtqc1+PoRvMKiGNZTmDHTUNOYnL1x
 /q6mR40hUoS7Chy63n+P07hRyYMtY07FtW/i5T1IwH65p6A0MXr6rnr0gjviVcAmR+MS
 H1r8Eo/9Z8l0Eky6c7noMZECp4MQpzkslsBlLklAB3QQiJq0Qlc97lu3lwbHVQpA7OM6
 OYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685460309; x=1688052309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j4QbYHmZ9uJKn683nbgPSuxd9jGSqiNvJwcu5+e9Eto=;
 b=JNsj6MitrZOrCCc6gVf4W11P9vpy5LsMbHpNSQ54QUQbn9Q+yGOJMYdahbXKNFx/ui
 dkgX5Rii0eq4/I2b7fV4D9uvjS8HRjSPNPRtezEOZP+Kl+MBv4gPKkFqAdrQlMUnkFIx
 yj2mapsOqi+YaAYYnma3SuwKcR9o2vcRlNJhnV1MJ5Ynb9gFAd6JKyAajdF7uquYs7A9
 phVX9jgGk1Uerg937pt7UF9v/nUPFSeq4IPv7s4YEwWI9nU7DkkaymQ/mIsbEgOuG85b
 tKUVvmjc/d2GMoe4bQPnViIwnoMHWG4vuty3aAgXoxz1uAJIkssYSXsF6dLeoPEKrvzl
 Drlw==
X-Gm-Message-State: AC+VfDwlRQ2PDfBJuo9sk9NE3273TX1LaBHD5SGWZBy93LmDfkJpJ4ZB
 pIZJaWC6FEWn2VjsnKNVJr1zLvV/m5hpuYz6h31KoA==
X-Received: by 2002:a05:6402:6d9:b0:50b:fb85:8608 with SMTP id
 n25-20020a05640206d900b0050bfb858608mr2013380edy.25.1685460309268; Tue, 30
 May 2023 08:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-4-richard.henderson@linaro.org>
In-Reply-To: <20230525232558.1758967-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 16:24:58 +0100
Message-ID: <CAFEAcA9iW4V747qTFNBBUZ4yQAGbBFo=MhrpRQbC-BXXGZ8HiA@mail.gmail.com>
Subject: Re: [PATCH v2 03/20] target/arm: Introduce finalize_memop_{atom, pair}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: wyfGZ3BwWBYC

On Fri, 26 May 2023 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Let finalize_memop_atom be the new basic function, with
> finalize_memop and finalize_memop_pair testing FEAT_LSE2
> to apply the appropriate atomicity.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
