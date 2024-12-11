Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4212001njb;
        Wed, 11 Dec 2024 09:04:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXoh6Qljvo5bLe7iVZYI8mQIOrv227fzg+F5QHreGOHhx19Xg9RzY4UTU0wzKQvQbtNeukKGRR9DF2NdA==@linaro.org
X-Google-Smtp-Source: AGHT+IEWz47yGj9mxC5Mvr5Zc+5NRc1BLuL5GMZ9T9w8PArlLNxqO7qg59i650po6tfOlOQlVoCn
X-Received: by 2002:a05:6214:20cf:b0:6d8:9c92:6544 with SMTP id 6a1803df08f44-6dae38e66c7mr291396d6.7.1733936650100;
        Wed, 11 Dec 2024 09:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733936650; cv=none;
        d=google.com; s=arc-20240605;
        b=XGVajj6LGM4iTZRAAbTro84WKetuWglvcBtKPNrK7IY1p41OMPV5jbJLnfnmXf/3+l
         bM+pcuhJLB6shPkcAekzOsTyDCWaPXIt7f6IWPll+EvCpLSQiJH1DTQgJV3WuSFSj+SU
         F/zQ0bgD+HdKwj2oP79qkkhzOxTNSMWvVzF+FGtxG/xO00CPQlo9Zx/DrcQgztehurJ5
         dkyfanqYDT/++Yea5x8ZZgmnn0FiA1//GzvoVE1homjHZMdvuywP0lvuSnfokxlvlZ4P
         MxIWroQxQ+wFWcrQyFtCVHTuvBHe3MPdYO7RGF/wRaAxc7J+WPI64qUf2damtMqrQMm6
         lr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uUa4Q3n2z6EKzMTLHCiTTArjkvUBuMkHdOT7pp3q7do=;
        fh=j12eJzCEHW0zxpjwys2L6hR27Q+ytqeJEklya+EUgDQ=;
        b=BesM/GdC/ZzgIduZ4k+RARVRkG9cOp7alHnibv94g3rsH1wMznGFnW+zGomuu0lJkx
         +2Fa+fEvLkoEazV+vcV9QpkkjOJ4/pC5ue/+jPHnDNHaF2ZBcryqKdYl7qLBV3O4WmbE
         8V3SHAr8QW50hMeUHNLa5ecrw7fT28OpK7bbvMWJ0uYY41F+tiSLKtJUyAhykG4CUGA0
         9JIwy76envN6fnx/Teez+YKE3Gvr5DVozJy+Kn6NryETeNmKclkvhk5zpB32Lo15x7qC
         gCFjusXowlGlkulVaf6D/3RbqsJR4UVb1RSV+u8kGj4YrUt5TcaCRZqA+UphtBgEaXqg
         GoCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIZ+dm4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8ed534becsi145088876d6.420.2024.12.11.09.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 09:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIZ+dm4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLQ6A-0005cc-3N; Wed, 11 Dec 2024 12:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLQ5P-0005MR-0t
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 12:01:22 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLQ5N-0006in-MV
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 12:01:18 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6ef4b6719d1so57390897b3.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733936476; x=1734541276; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uUa4Q3n2z6EKzMTLHCiTTArjkvUBuMkHdOT7pp3q7do=;
 b=KIZ+dm4kKfkOp060AtLeTMXRR8uJpPLieikltoh2x/GV4CNcJc7wQEF6GMo/84pbqe
 QQzPZt22VegrdDNmMlBoYRlJYdfApULiFjZIW/0N9vbJyvPtZEW7t/9ieJzqZbhIcjfU
 mhRNDCIbMkISpqQ1bHOOCv2KwhJlG3oZrEKav53ntsE/8o+z/tKJv3Ew+OccNgZkVjIR
 zSp5pG3XBd5E6Xcjw7pY5tLFSevdKuwviz3A5Fn15l+jWW3S/IZRuO3ckkKqBDo/B6zK
 lkA9V0FyxBeqLK4Q4z85IJhiwf9n/ZhluALHUrzQ31uwiS9QQzcuuYY3RuHhSZkDddaJ
 b+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733936476; x=1734541276;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUa4Q3n2z6EKzMTLHCiTTArjkvUBuMkHdOT7pp3q7do=;
 b=HeyTMyqGQAPzfeHwntKSzRsZllyWrzjN53RPfUu8M0Cq52GMkkbNI2NVTw2KQpaNuu
 lctQ/v8xd+YhRx7QQ0XP0w6EuEZ9AqiBsYZpOSI6UARAGkxFsDA2/mW+XE2JKLj2AKBO
 9GKGeYVicifcEO5OQbM79WPN5fycAF8p54xOwsfwK0Ce5yksOtRf7ZvdCqD9mfslv96y
 7da23W1OXN3EyKlA3zBGVGHfAvWIbSPDqd1oKcBzyEY4eAcPhtAIvOU8esogXVrxrUDs
 GZCDVQKh58R3itIJsdS043BGTXxTV4Tp/YuXeTa4ldIJsAuBI6PBzX0MB57TDc8f5bEZ
 dwzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNwTIJeGBpYCjLUFQqav7NEbdFSs8u21o970PZBP3O3Ue3idkk8fKgqFutlS6chRadxIH2DMmhPA==@nongnu.org
X-Gm-Message-State: AOJu0YycRyVhJBdgcR2vKybzl1lspZm9BzyB4k/AUNRIsi1Y50AEz3P7
 ef5qX6P2ncysbfOGKTkHqT3xvkSUY4UmAh5t2aKIKXyny//eJPMBBWNsG5d6gmUi14XNWg1QXK+
 e42Gt8xHrkFIVZFWzY5mu35mkvMpzTw1noPkFVw==
X-Gm-Gg: ASbGnctuYWF6zJIn0SbX2CMIjNLFrsHuWyAZ9lZX4B8P5Pqcd2/W7wNfQ6ETTgDOOj+
 iVMVtQ4rJCuU37ZFx2PAD1PaZ+kF37GgJ2i/S
X-Received: by 2002:a05:690c:6f10:b0:6ef:910d:7846 with SMTP id
 00721157ae682-6f198a3af41mr3156767b3.1.1733936475841; Wed, 11 Dec 2024
 09:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
 <20241211163036.2297116-24-richard.henderson@linaro.org>
In-Reply-To: <20241211163036.2297116-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 17:01:04 +0000
Message-ID: <CAFEAcA-s0W_1syz9UO-8-tQX-5C2sEa8H0wMyAUSMQNY1pRj7w@mail.gmail.com>
Subject: Re: [PATCH v3 23/69] target/arm: Fix decode of fp16 vector fabs,
 fneg, fsqrt
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-TUID: gKehqOJJL65r

On Wed, 11 Dec 2024 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These opcodes are only supported as vector operations,
> not as advsimd scalar.  Set only_in_vector, and remove
> the unreachable implementation of scalar fneg.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
