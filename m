Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D42CAC587
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 13:14:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwh78-0001Ww-Mq; Thu, 11 Sep 2025 09:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwh76-0001VN-Uj
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 09:13:25 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwh6w-0007XE-R1
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 09:13:24 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-62733e779bbso1045503a12.1
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757596390; x=1758201190; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BLArwD4h0WuYLDjVYgR3IWlbms1EKzAZ7hWpKqNofrY=;
 b=na/pRSC1/AF71OiBZTny6YWoYoY6PIyUaOVZy17A3MoUtzrLC3+J0fXlS0oWiOIr0x
 yv20J8qk0md1eH7ve592gxQapK1MsKqta6FpU+9+HI0E8LTqGh91kJMMQnIGsREpv4hi
 A/5ovLjKZGNs1b+CMHDIXxFlUOqvkZX4xmNkphqrzs20dKRtER+KLWK+1sPLWjKrJdPS
 W2Sup9Z03dsKOwuQegS/FIGTngXS/n9RxLLB89fzL507n4qIbcS+vobCE/Rq2+Ml+vU0
 kv/hfds6ARfVgSh6oRpz8JUAwtIini1j+CKwHW8wZk5JjgrDEOC13Zd0gAkqeyWiSJqR
 4LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757596390; x=1758201190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BLArwD4h0WuYLDjVYgR3IWlbms1EKzAZ7hWpKqNofrY=;
 b=mPVlVbNGz4zI3IxQ3IdWU+MAbotRnXdATXvru6hSxSqAD9hsa9NTH5kMMy8OguYey3
 FCe8lOklP1gCID5gill3VF1ykX6zKDFyG7ZcKpW82JS3Wi++Ugdwp8pvzMUNdGaFCirZ
 g/qB1qoiExKjfmoQAdl1WECivBUyE45fsBcwGPg1i5RAlvvXi48EQpwGCoeiLxhFxDV7
 SeT7GtgC863WT7/uaRuoIZrKVstslpyFUYh5qijJqXvDwPL40IflvjBTZwqLKusHKKgg
 mDlxjOoQ+WeToNzheIsk0Ek5yqieuIjY0bnDBqBZbXab4+9sK3HsE3oZlaI6aY8UjTj/
 6b0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTDt3Vft9RXgwQlFbTAWrvbEiaSLadZGfzxuw/VDaZ8K7mSSu5lrqKRyCG/o2tEhpDatlbhh0DDQ==@nongnu.org
X-Gm-Message-State: AOJu0YzTHN2WkoT/0LpuV5q0ZvalC6Kl77LIH6jc6JI2IyRXdS90Dy4k
 Feith8um6HCBQ6h8ltwrKzBaZYAttTd7Zhy3QNO1l+HWq+r2xWCmbwYe7A6UuCrkDfyatQiNaET
 kfNO6T5znZn/zLkES2fllADzhn9dpjwSGfQFORHPvDw==
X-Gm-Gg: ASbGncvfQDWFDrtWwmSR2Wc2P3n+wkPrzT0qryLM9kv8J4/T584TPwzvlWmqQoFWk8V
 XFC7W35LQKj82oVtHmfYK2rBGaDquBo+yjYn5sH9X9/2V6wkagp7HbE6wkU45z+3iQ6D7+iP1iY
 M3qlC2nMCz+OlumVFw74XuX3KRLDChxyag1nh7CkpM4Oww1FgmVeAmZK590OqTlDtnddPGwxm7F
 zq9TvrLfTxP+cuqUeU=
X-Google-Smtp-Source: AGHT+IF1Do3jJJouUJIYYM5Oe7bMecITwlXX7e9Z49dzvjsXu2b7hjeaXyKSNiI25DkAz8KnlclYlmcM9ZOVih/biQ8=
X-Received: by 2002:a05:6402:254d:b0:628:20b9:2621 with SMTP id
 4fb4d7f45d1cf-62820b928bdmr14561690a12.2.1757596390349; Thu, 11 Sep 2025
 06:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250909123747.567480-1-thuth@redhat.com>
In-Reply-To: <20250909123747.567480-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 14:12:54 +0100
X-Gm-Features: AS18NWDgOwpwP8VpUus8K1NUd1-geWRZuvI1MgI47EqU8IPPNQcD1WfFs7OPkfQ
Message-ID: <CAFEAcA9h4HDAsSBUQq+3MCOcjyHJxjgyz6pz6GfzuboZ69=Rjw@mail.gmail.com>
Subject: Re: [PATCH] tests/functional/aarch64: Fix assets of test_hotplug_pci
To: Thomas Huth <thuth@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 9 Sept 2025 at 13:38, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The old bookworm URLs don't work anymore, resulting in a 404 error
> now. Let's update the test to Debian Trixie to get it going again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/functional/aarch64/test_hotplug_pci.py | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to master to avoid the CI failures; thanks.

-- PMM

