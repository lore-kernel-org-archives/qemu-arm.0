Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4063681ejv;
        Tue, 2 Apr 2024 09:18:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0AZv5bC8MOlb1wOiuWUDZs6cAxuVjWuV3wrUGZ9oxELHbRTTWC5NzJqYdDgxBsnse/fXhWGSLrUwZG+gae1/YKaJzIuFX
X-Google-Smtp-Source: AGHT+IE0wK4JUdSJC4Rivbl62ERvlI1wqkx2xOJ6ZzvuITg14hBzpTv/WXQrx3NQeC45MBTjtxbE
X-Received: by 2002:a05:622a:1a84:b0:431:8155:10f2 with SMTP id s4-20020a05622a1a8400b00431815510f2mr25515751qtc.3.1712074694099;
        Tue, 02 Apr 2024 09:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712074694; cv=none;
        d=google.com; s=arc-20160816;
        b=InBP7fXfPW0kt8WxRIw5i6DwTqatMr+qJ1GgTweR1peOc7DA5IsxX2Z0l4Iufru0bN
         l7VHNMlCglKiEoQQCS9bLu5WHiKXhHE+Ad9AEm2vZczVZOa63lMR/zXPLZhmonbuKHiE
         rvlt9Fbye4DBMRizN3MYzCF2bnC8uiJTcasdxUVaX7DNF7KXv55c1qYvbZ5qN2daJqZt
         clLB4ebb+HvDvh2vyVN0F7jGBzo9fcaTs20jl0c9MRkNc91ZpaaoL2Jk5SrUkLGqezSf
         Ec2ZBjv5WNcqS0GOxh/3BZS1uo52/AswXZO2868VROOclxlVRnYdh1u8M44mVErKF8L/
         tf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OBENLPQZl3y0UeDh+S51CxIOH52m3JOW+ZQe8gjUV7I=;
        fh=EDw/IDgrjTh+Lba9YIzISv3yH77CViq7A5B7AyLj1b4=;
        b=eUZj3N8zWC57C9dll5JYer5DQiEd6VdUx6zWqY9CYN8BWOYxxM37+kZCPswVwJy+uz
         E0xL9RcNiqAtgK8jJ98PH3X+Tb3XikdYawVgTI8yP6bntYPqu4elpfqU7BiCduNAQ9l/
         Aw22GWeyCVFLFogeBxZPwwK3lSwFqlXGU34TtdLQ3sq2eKbrERtvhXd6N1vlrM83Cuea
         /ZT/pMGHjGx2NSauZl+jb69H7iAilQ2eLI4NKTvsFwMvwgeWopdvaIHNye8kn68GXXQr
         SBAUFPUaFTclrGfxu0o0AduPvPHY+K94rYaIaP+sWJ2yoG3wlyDRU7Ahfd7cwfoPW6N1
         pzpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CcXB8Et5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020ac857ce000000b00432e06c1461si6076145qta.629.2024.04.02.09.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CcXB8Et5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrgpq-0005JS-QA; Tue, 02 Apr 2024 12:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgpk-0005B4-Is
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:18:00 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgpg-00019U-6N
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:18:00 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516a97b3139so2360961e87.2
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 09:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712074674; x=1712679474; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OBENLPQZl3y0UeDh+S51CxIOH52m3JOW+ZQe8gjUV7I=;
 b=CcXB8Et5BB5BweGbdCBGrUeJM413rlvbQzy+SkC3DM7biAHv4FejjOfNEhkMERiu1e
 0NjL7XAmOcmWFmTPP37kIdEzjY7K1ilzTuHXf/w6eo2IEw9DI2ml20bFHvNWMOvB9aTn
 L9eozk6VtgqZ6R13c8smW2u0w7fvb9pwXNqtL6jkG1roQU7aBWWGXqtZeUrH1SmMpJrX
 f0vbQS+Cmi5aGWReqOnyyZpTnaEBkBZBTkkiZgcZshekqGzKnm0QVWQCW55znUeFgVG7
 kKAFXSobJ6U5VX18kU5YmjH1v4zsYO1tcwwQuKvLnDUKlS0UW/JLw5Bra7Kikg2f207T
 EJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712074674; x=1712679474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OBENLPQZl3y0UeDh+S51CxIOH52m3JOW+ZQe8gjUV7I=;
 b=pRRqtMiJQonc7lYdn/s/X4v7Rz+knw9DRnDof3wlVOUlk//5a9tGjFjKusWGOFR8sx
 J2jNWGrZk2DXFlbJkPiTqM99GNy8aMjBpXjWujzxAmtTnXe9g0+VIhntxJWgaHCC093s
 5kONdf4e1dp5hRETd4fSWqtQ6d6GAviKU744FFOVMztTFpwXSDleMB1ElMA68u6lcuYl
 59RuuPvFjDlECQ3s0Y9DT+UyxlVijcbgKSw4GU8DQjtcB22AQ6CSa/5Zy+CmUSg1XML/
 lT3yz7IesDUqikUY6cpieCYbRpDidXmYHuIOpC5JPy/7yNATg8JQikXD1Q08/PbzNXh7
 WBaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNEe8ew2engnlrDeu3PI3Ee4PnWVxMhSiz17nqVzmt0T59B8V+700w6FxHfwPnBn+IBAQsRQUZgKB7hFZFIwQdOuHL
X-Gm-Message-State: AOJu0Yzs6XHXXKu9v0KXWq0ZYE/hwJYn6tyIwp6KHOQx2elBLyAMcKg9
 nIS5H431XbNF36G9SZVYd3XMgENoVKbCY8pAm4J8MFK9kJRTklpRDSEjT9C9lQoW68+2WQzCtfA
 S5W5A768eTqpQoHnnO/6JdbiCmdfeHZTPJprM8g==
X-Received: by 2002:ac2:5445:0:b0:515:9479:a997 with SMTP id
 d5-20020ac25445000000b005159479a997mr50711lfn.10.1712074673862; Tue, 02 Apr
 2024 09:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-22-ruanjinjie@huawei.com>
In-Reply-To: <20240330103128.3185962-22-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:17:43 +0100
Message-ID: <CAFEAcA9fSMZ+PHgnfHb95_bcUtsYxesfDOixbpmunsYZ7iqFpw@mail.gmail.com>
Subject: Re: [PATCH v11 21/23] hw/intc/arm_gicv3: Report the VINMI interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: s/EllvAscrvR

On Sat, 30 Mar 2024 at 10:33, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> In vCPU Interface, if the vIRQ has the non-maskable property, report
> vINMI to the corresponding vPE.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
