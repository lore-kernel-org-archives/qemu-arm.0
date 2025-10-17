Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F223CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kbr-0004U6-IT; Fri, 17 Oct 2025 09:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kbY-0004JI-My
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:34:52 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kbR-00008z-AN
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:34:48 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-783fa3aa582so2432917b3.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760708072; x=1761312872; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zU23yWGtSetwuWLS5SAyqN+GewwgZYsp4hXqLSA2xTQ=;
 b=MGMHqj0JoftpTZ5BhBKoiJFLv47A2ffNJfJsANoljYtTFCLmE1KBVIKDt/rHKH6BQo
 z6vtamKtZKN7wUEY3XRCNNKy6x4gvdar7Z4Qvx97+1T+4ThsHKbY0J64kqVxDaWL3bYe
 MuQAlD5g6KcxZ/S4lm9j/cCiUZHCmxdN8YbTtLQQ/s+X30qGB7tlko3BycTlaj3ikC2v
 FVBPolYNNc5JdmO1Ozv7j+C4NiL0INNjdTcMJSoXD9CTB4w+xLJDkwd+ChPVgfH+adPI
 Sy0mVxuZCQc30B9RH1mqeKBPn2PCPo7lnY5h1OPKZN5Iy70IIKaDFfnixW8VE7w8uWYR
 /j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760708072; x=1761312872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zU23yWGtSetwuWLS5SAyqN+GewwgZYsp4hXqLSA2xTQ=;
 b=dlA3pGo86LoPlQRy0dQacDYIQr1WSIMh2oE3lvRF5cAAd7+9SulGZnYqPJZYs6WC5q
 RFGZd32JVeGkRxuSTlnCuugpIbDOT3P7WD0FmU09j/LJ16wM1Gz4/Y2n7l0dufBm9qIC
 HmV7i6wk/Wid8FWAngwutQqTokZbcMyDFWoqUNzXSlO8ftGGrwM4wTX/6jzt9KgGla2X
 SYoXW3+hAaAKMU5GuecHavZ7isOm6OFsfo0udTJTADua0/J9GbRpYJ0L8h4H3bGCarI8
 OeIM6MUO15igtKFYNtd1TWngmxrEPnZmiNftybN/kPZyKzVSeSc98+VoeFquOguHwISD
 UAwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw9SSR2MZjuzJh+rdLHFvtmYAAkLMSduRUoitIaxmfVB8Qm/PzpaOcVxkBhmnVCxCyYQinf1au5Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw/GhF4XPME2Vg0EWT7Bdol7WKpk1YZV5J18WR4AqCj4q3lelXa
 /k0+c6bQ2C5+ViaZEw+M7Bx6bs0sYMxk7q5O0TQWAeoj9KZ5omYzar3e3ZvReZiqCcqp4dnSyqd
 cWSvsTFbkM6YGf5YoJoa3xtPnz0xduzeFcdwTB8lojVm0WDMwUNsL
X-Gm-Gg: ASbGncthGytCNWsIQYe2bA/kSgZAXW/K4/4F3ZPaY4dOOFnJDzu6cf9059HpFPtn1EU
 q17JGVu44DFUSZLCgCQt/OUWf4LCFLYnQAsmv87HYELIw7kyWAMGRHz/cGShpdu5lxBIxcUszR8
 Rul5wkTRs3Zk/kmmdZxyqrCjcGJGAbIQ6AY+JoF74vg3qqaWoyLDbBp8jid/t5h7RUrracndrdZ
 UZ296Hyd25aUtq4GuMy1NdNwKRbeQePUyna0j3m4/zdIYM7yTaavccKXMyWog==
X-Google-Smtp-Source: AGHT+IHNj6Hn16xb/wtZGMMzSy61F2WVi+0rR/OZMYChgRQ/dXTByA1NI4KKESVUjB6oxsMM2gb+Qq5FMeHXntmGGsE=
X-Received: by 2002:a05:690e:4182:b0:632:5ba8:1bb5 with SMTP id
 956f58d0204a3-63e161395c5mr3448885d50.21.1760708072371; Fri, 17 Oct 2025
 06:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-12-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 14:34:20 +0100
X-Gm-Features: AS18NWBs8X9ldjDYHkAX24-dX5s7TD8iVpA1kJ2Ohte3MQtLfk26shTo3wJHFec
Message-ID: <CAFEAcA9VbjnWPV+WmtHPc+H46aW96Yq3VQEBwzKzOzqA5M1xrg@mail.gmail.com>
Subject: Re: [PATCH v2 11/37] target/arm: Handle ARM_CP_128BIT in cpu reset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Tue, 14 Oct 2025 at 21:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

