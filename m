Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2160692ejf;
        Mon, 26 Feb 2024 08:24:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4sxk9OuxhrONeDDkAcy5BDjLfHl23zvWJgU1+GlySno4UBJYImV4DWCCVCLlaIK6HoRc40BaF9PAtTmNPLk1barYlK9lO
X-Google-Smtp-Source: AGHT+IGgZsuuns65QbiVWElVKSWQNHdEmMIuevMMgJFza/ljQ76x/fyWzTVHfLJMKFvrwMuA9Lbx
X-Received: by 2002:a05:620a:31a1:b0:783:2a45:8329 with SMTP id bi33-20020a05620a31a100b007832a458329mr11092572qkb.76.1708964681466;
        Mon, 26 Feb 2024 08:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964681; cv=none;
        d=google.com; s=arc-20160816;
        b=UHTEcvgrZti4udWrDHPJq7VRuhhCC9AW7UrDsuqG+6GDCRGAjirRqZpq68yS0u7isC
         wISKZZDz/D+7RildS25CDiQaKRRd4Ik2eiGhme1oLIF8MaMRHh+9DJceiESv9mZj5ASI
         AQTqJ9r7eFgvvDYuby0Ywsu2Fdz0odofIdGRbbT/LnkY5g57aEYtY3XNBhZqKYJlFFe3
         TEmVi6dj3R9PSSOXJOFGgvS6Xe5gOg+8x4IHlqPYzUHiZ67AGNtWd7zg24rl0pUvLfgs
         7w767JK6dv7IQ3VQ7PwTx7rUplLvnlZ2mt1t+5s3AUPwY2gZKxuvaNBsht15ng/2wqCt
         NLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vR7946qHB7+4iUdASnofJkurKOXitHS5prg4KT9MhR8=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=QIU8Y0hby/IQ/At3b9iy/WrP1yaXA6S6QuR6ra/dr8InP7YdSCpxzbevZ1O9FYJkce
         1UpiANxcf+698Sg7K+DD0F/xinZJp4eIvNTMhLra+C5vK4IAfdSxGnUeL9p0aBLISo0c
         hnuaMTvgXxHWIrynDhlDOpDz+rX91g77yJvFBjCbpK/BNYAE4pcTqf5nzaS1vNDM80vs
         4IMum+fVcfoS+C856sUJD5W85AMhUNjv7qKgJedcCYLvrIMsaxLzR+DKKMfDZXUkrf5G
         9UCHie7ZyIBq3pJlVeOKQj8kna4u9Gu+1fFl06CZjB0P1joqZdEObXjDsZDZpLsDJ7jx
         jrNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whve5BI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020a05620a167300b00787a61b385fsi5304349qko.232.2024.02.26.08.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:24:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whve5BI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redmS-0003fK-Q4; Mon, 26 Feb 2024 11:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redmR-0003VC-1H
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:24:39 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redmP-0001Gr-Ja
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:24:38 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so4306246a12.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964675; x=1709569475; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vR7946qHB7+4iUdASnofJkurKOXitHS5prg4KT9MhR8=;
 b=whve5BI92b9P/IhWji6Hw8w1VIe1gHtl1qE55vQ3sdziTlucaQUuKt5gczhbfytznm
 9V6I9Qn8vp7Mrjx2uv/aG32rZrHS+rTS5XXpwr47GKg+EzaGUJvBYpG6e9oWh7E//+QD
 w2UORVbJmcXCQ5kvcqLI+fMuyf69pJxEQxhk/XgiWHAFWTLxwR69a3lIABdMNqQq1gOH
 GA3s1GAzOKu+5MV/w+oWAIO7t63JiWzgDWvco0UIWduc9I9C3jPMzABCMw/5SjhrmF/b
 9kBQpSm8ziSVhOYmK972OGWv6mZbQPUEfryCp0LWtbT2GiPy/2Ibh/aiPbwh44vC8Jv0
 Wxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964675; x=1709569475;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vR7946qHB7+4iUdASnofJkurKOXitHS5prg4KT9MhR8=;
 b=KgCtaYrCop68LT53xxptUiUftgSwSmbvPsdafU+sqrN0fCaMLI89v730eYJFyz5g+1
 Ow7RasYJmwizTvEt0G9rv+Ql7oRMYX6Q8ZuaOyJdjoDdhuvDezDSMsZnj1Y/kVAG91X4
 wUC1JBnVolAdyZjGgX04SFqoNsqS3oD+jjewQk3lOUl6y20vSK5BvTCUcU5gSpcWiOM0
 akvLyKgtya7tgPEQmCR1bgSRh1DKWmpOpEHJIzMODI4XWeOatgL4H42TV0g9TP8/nham
 0ZewdHXe5rbg7EYURB6NHM6slqk2E3YAxdmQodBvHtq2JXm/YmRoz9rDHF+ClYzO2X0A
 dLIQ==
X-Gm-Message-State: AOJu0YwtwDNtEU9gHn6cT8ooEDDV3Pw21TGImHPJrA1QixHnhfPSOy1i
 SFz26QiVq9vw8tJu9WnT0rPQmcLVxiWlQMdOYdnOlYoyAZAvyZ8WH1rC6u8J2sHP9jNYiZOx5mc
 jpF4/VcwK8nwLp9PlWXgTql9K38ccl5sYhqDBNCWJqTdy0r9s
X-Received: by 2002:aa7:c615:0:b0:564:26d9:b4ac with SMTP id
 h21-20020aa7c615000000b0056426d9b4acmr3820310edq.41.1708964675632; Mon, 26
 Feb 2024 08:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-37-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-37-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:24:24 +0000
Message-ID: <CAFEAcA_Afm-RggHNEUcniPmtKyKfJJ_Z35M_-roW8meSmz-TQQ@mail.gmail.com>
Subject: Re: [PATCH v6 36/41] Add mailbox property tests. Part 1
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ZktKcQcim2OZ

On Mon, 26 Feb 2024 at 00:06, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.c            |   1 -
>  tests/qtest/bcm2838-mbox-property-test.c | 207 +++++++++++++++++++++++
>  tests/qtest/meson.build                  |   2 +-
>  3 files changed, 208 insertions(+), 2 deletions(-)
>  create mode 100644 tests/qtest/bcm2838-mbox-property-test.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
