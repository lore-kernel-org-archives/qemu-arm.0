Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp1005582eju;
        Fri, 5 Apr 2024 07:07:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX64T4fKIfdhZpYBXXZG4Oq24he5Y7Bj/2aCl0GLAKFmWEfzCp4jC2KbmLmyMq+w8IJKHWBxCzpFM/RAqwDQJbyonTdOWt/
X-Google-Smtp-Source: AGHT+IF2TZ3LVYKlXvUQAFIi0cfIWWLppu/pxp4fYoeJfXIQN0KY8lIpW+dHr5LEMjI3jFgB9dQx
X-Received: by 2002:a05:6122:4f0d:b0:4d4:20fa:eb0c with SMTP id gh13-20020a0561224f0d00b004d420faeb0cmr1808764vkb.5.1712326020999;
        Fri, 05 Apr 2024 07:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712326020; cv=none;
        d=google.com; s=arc-20160816;
        b=kwNAoOIP1bT4NsRs6P9MX9WSBvNaXDHaVdRct2P0uZxrku7O664hO/IUTVwz06Om6d
         aNbd8omi0UpjR5YZtsflrnkXsQVgm7NkQxZwb36gPZyhrehFnHcigW/3oL0bWE9lh3xB
         SST6VHlyMgIz2g3ycoO7qO39fsTEdGiWU2GjKcW8Fub/vQNqdC//GYs2QfxIrDBAZ67I
         AWGHeMMRIOWtMLurSn0HC9VowAhGk8WTVzrWT/OhsNapMu96mnOxuUwjPAbMxKocqUw1
         cChPGZcO0lkSf5IytQ9/MJ7E93KPbNvGA2kQ6i9TdBGR07JPqQMUx4aMs2sA7iQS/cvy
         Kh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wHGOW1wgnR+5ZgnC3ijf1kTcTTOtgDyd8J10Q0czdfc=;
        fh=cgfMwD2MWIHFRFAlszW3LHEtbvtwk7TrCL5rWfJwoCo=;
        b=bULukNOg8lO8GBM+mEy5s0a2nJI+OCdLq77fh7xKNk2CyNhRhXsRKjR8FC6APc+Ua+
         2433BlNUIiMqPhtpdTtSqv+48RRzYxiLx6xaGzW6+b+T0j7y4m4pJek/5XlBiZZUKDjO
         55BC6wzlhqlu/ufBqMxr1dGMYdHQL5ms9d2Qyq/NDTE7RmE6NCTrd/KZnCIt/9W4NAor
         Fz4WILJm0plPAY9pbGqNg4qN3qImRIQE1lowq2HrYESJAaG5r8BqvlYydGqNPCNPV+EY
         bq4vdQEhduX92vgm4Jzs736mGcZh6ka9dNdb7GmktjyBajn5EWT7h9UX57IixDNgG3nt
         CjIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+aOOMuo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020ac5c5c7000000b004d892a588a5si223025vkl.240.2024.04.05.07.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 07:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+aOOMuo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rskDK-00071v-3w; Fri, 05 Apr 2024 10:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rskDF-00071T-E1
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 10:06:38 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rskDC-0008Oe-Vw
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 10:06:37 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56c5d05128dso2698050a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712325993; x=1712930793; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wHGOW1wgnR+5ZgnC3ijf1kTcTTOtgDyd8J10Q0czdfc=;
 b=F+aOOMuocmjWxyHMo6W1GyF6YavrWF7M5H+Il+p/Dmk83/lxv2wGBERXwtHyGcoQbj
 w7zExWTiM4kVNoJ2qzZAN9tlo3QFUjTnc33Hfsgy5VSD9sc/3F2r4sWlIo4pUelfz3xM
 tqss8ODP5eAubxHw5DVGJjD81gl481mzxMlIeqmzUCjurRnNiZXqhm1hLyDYr1jny17l
 GzcF0d5Tma7/cLkNDJyU171X8NEeHQ5SDgB0pv/ufjqR/eux7LffSj/j+T0wiFOz+FEB
 Y+tpVkVge/Ca32mky/nJWj9OmfDWNGttpVS9hen7AZN2TyvZCcnXHV9Lj8UbfNGK7IIw
 AmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712325993; x=1712930793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHGOW1wgnR+5ZgnC3ijf1kTcTTOtgDyd8J10Q0czdfc=;
 b=Z5uNiesYCebyn5ZcGUio6/P3sZ7dkgSEY1h/+83Jjc8bs84atAD/sjfCWkTeoo5Ffh
 CO967d0roZT+TsFtqcvAGYqgtKx8CeeEijrdLlqntBvXloJzR0ba2zb6kKauvMlDy1tj
 nPTEVpZFC4WBhIQWvB8ALpw3z9dnznlGUqFEILGnE5qmTb/ziw1Yejpti+g+QW8rhepf
 n+25aHwDPNxEA1KmYsxpDCAhKTHE5qF0P+hvHAx6sTNzYZVGMTy0ioBP2xDBZ9rWqR/t
 UwEIpMMY+ob01JkN4e4ztelbOFpQYEhcuZDZZ+hjZo0UmGWRGRWk7kN5rxqJCh4knUA7
 PzQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAdlse0qf5JgNJBMjO5jev/cNqLDPPIGrhbuOQxc4Oye0jWqsb+iuuT/qfGvW7xaDM8nl3oEytlwJJFgm2mQfpMq5h
X-Gm-Message-State: AOJu0YwWCzjgXJCCJeo4EO7LLX3XWlcSLzf+698PAeowgLpN/rTSxOuc
 WqYQzAZjbxJWYFWTW+zeV1vSYaBhj/J0brtSZWGDoqh8k4pEcEZR6gK/VxidZW7jPBMLKJ65u8i
 fqRSW+lDMZ7fdge99oXGHJDmhg+65o+mpuXm9JA==
X-Received: by 2002:a50:bb48:0:b0:56c:4f5:7227 with SMTP id
 y66-20020a50bb48000000b0056c04f57227mr1018226ede.41.1712325992905; Fri, 05
 Apr 2024 07:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Apr 2024 15:06:21 +0100
Message-ID: <CAFEAcA8=qJ763Q5UH5DvL=Wo4zhxvG0kO0VR77d5soYzDHsP=g@mail.gmail.com>
Subject: Re: [PATCH v12 00/23] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: tjPTI7o041g/

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This patch set implements FEAT_NMI and FEAT_GICv3_NMI for ARMv8. These
> introduce support for a new category of interrupts in the architecture
> which we can use to provide NMI like functionality.

I think I'm now done with review on this series, so if you
address the last handful of things I pointed out in replies
to this series, I think v13 should be good to go in.
(No rush, as 9.0 won't be out for another couple of weeks
anyway and I won't start collecting up patches for 9.1
much before that.)

thanks
-- PMM
