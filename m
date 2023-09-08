Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp424351ejb;
        Fri, 8 Sep 2023 06:29:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxg4U7z9LUgbuULB2yOdWjIfbDLcW2BpNZip4/oSP5mNa2MtOJW1rqGwpsqp5EyIQaiKIm
X-Received: by 2002:a05:622a:ce:b0:410:32b5:3095 with SMTP id p14-20020a05622a00ce00b0041032b53095mr3340891qtw.39.1694179776286;
        Fri, 08 Sep 2023 06:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694179776; cv=none;
        d=google.com; s=arc-20160816;
        b=p2f06RQTXl4vLMoxGh0IQeN2rrXI4A6Ds4PFwqnq/1paOiyCS8hm036sUjyj44dzF0
         OPBvj+hfaYlaJ+nPwjK6ugzdo4bqMlarcwtbDeln76PSoiENPJ+DOi6ro6pIO1895PA4
         S3+pQvt/5wmYygW3gniFPyxLbQonjjzKIrrV5Z0yGHGbj0qxQfQfYwjhlD6whRH2gnHK
         4S0Nul320ANaE/Y5oZ4RJqBhLg6eBpy1Ik1mjA79IV9/ZaDjd7vd+Y+gNwzrD8FA49xT
         6o2iEPQvFYJwQuzKlibkWT300EbVET7Rh8NODhqzBMUxd7omJ++56HnP2UBmBeut56JF
         NDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fmsKpQrDbZTcm6DbrI2zVy7d9sIh1qYxIKXlQT8nL20=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=mlAc8lBMrQPltw3FMgV9CkzM7ExHPDhbkiAVbwzc2zwMHMWSUYJd+i4H88Lz75ES4X
         nnaohsZ/KFEm9z6Exm7Z3Ibvf2h7F9uMl0v5NE06LjtQvZrQhrdB9/C3CDrk2wFCQIAz
         xWCZmC0zikFWExYls10yHHA/pCRGnCsYXkgtTSdzjA2+Sx6J+q601DfJxnGODPU+Fkjv
         yKm5GUhZSRYHTpYU3yiAVgA9g3BdcCI48Wk+I0o8Yab8t+3QRpeozwIjYShBLe+XC8kb
         zSIZJFbA1kNoUbLPCf85X3ROSGIWN7XURu2vii1yUx4QnsDNxHZZN7GwEHJzX+O5Q4vr
         Cj3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DR+V2vlc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14-20020ac8598e000000b00411ff2766d0si1214416qte.168.2023.09.08.06.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 06:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DR+V2vlc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qebY2-0001pU-QV; Fri, 08 Sep 2023 09:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebY1-0001ob-GR
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:29:21 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebXz-0002Jx-9B
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:29:21 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-529fb2c6583so2755515a12.1
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694179757; x=1694784557; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fmsKpQrDbZTcm6DbrI2zVy7d9sIh1qYxIKXlQT8nL20=;
 b=DR+V2vlcRiD+Vj59ykDse/RMLqXQ+YCCtn6/RVJ4vQrEl3QkVcd9SjLwPHtjC4vUex
 gCRlpduAc0yevsxLj9daP1XEGohtTuUAZPJPF0KtZo8LKmT/WIUaaKm0qsApNzrHeXAj
 kzFsqsfsESPATcYo5jlyrW/xieAKyuM8gx1/SNMPW7hFHl1zGgpha0TiU4sxQP7lrykX
 YbeCiCeHAcYIuGnsMQU/Rh++at15XaE5fuAOaAadFPQ3sy5n87XIIYYcdAPM2tmuw8ZM
 tbglnss8SrHRqzhzHbbOuSMk0AQx5ER01o5XKRpbN+QVoPWghoFnACOjMi/TMQ36j9Qb
 zEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694179757; x=1694784557;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fmsKpQrDbZTcm6DbrI2zVy7d9sIh1qYxIKXlQT8nL20=;
 b=i2BJlrdPoiWfSQ4pmYCHUbIEE3ojyxMUJ1f18ZdEpO5YzhFwMJJv/A94E/ulomGt9X
 NW0pthJYxBNMMEhylgq/IuT9j9rPtUTb+j+siQltHpEhRJLwYzbXKNa5eFMb9AWeGdc4
 Cxdp/Cc7YKzY9PB/e6oxiEFN7yjvE4AMflQB1VLRBNTPkpcvIclVLAe24bgSF1dy48UP
 cAjAOw4IGws5I6Q/ZTp6G/yt6Lyua+OVqoaWGqGn0Q6zzs27cicKxmy1Ok5M9A6uUrcV
 BLF0AP9NcKxsqGqq29LcIUQj6driCTNgrqHOH0AcJctB/YTExKptVG6MqEjUkP/fam2T
 73Og==
X-Gm-Message-State: AOJu0YzazV8LUv+xCeJC0u2ieYUTcuZI+lmlHzmRKGgcJ9WFH/osspHC
 BsTuyXEe4DuZwt70Ep38RhRW9vos/swbUWT6VycZQA==
X-Received: by 2002:aa7:da46:0:b0:52b:d169:b372 with SMTP id
 w6-20020aa7da46000000b0052bd169b372mr1983109eds.4.1694179757639; Fri, 08 Sep
 2023 06:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230831232441.66020-1-richard.henderson@linaro.org>
 <20230831232441.66020-2-richard.henderson@linaro.org>
In-Reply-To: <20230831232441.66020-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 14:29:06 +0100
Message-ID: <CAFEAcA-GiGGm0m5g2RjidRgpt+tGVHFqScsk6u87oQF4wERzuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] target/arm: Implement RMR_ELx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: oRTOICfumf/P

On Fri, 1 Sept 2023 at 00:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Provide a stub implementation, as a write is a "request".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I suppose in theory we should have a feature bit given that
the register is not necessarily present if the CPU only
supports AArch64. But we can add that if/when we need it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
