Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95182CCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 11:41:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7BUS-0004IZ-GO; Fri, 10 Oct 2025 07:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7BUQ-0004Fk-Fz
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 07:40:50 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7BUG-0001JB-Rr
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 07:40:49 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-635349b6fe6so2020016d50.2
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760096428; x=1760701228; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HnAnwOcMJ2GhF2EY4pQnKOYtxUCKD6UQqaNJzNgnUHw=;
 b=sDhPU8c1NpWvY0yeqNrR+g1NDXrX6reEhjj7K/cKSxJ15JNoD0PPN4Y4OyzhiDzNtz
 Bardw6dearDuCcYvetsCJA7bBJbibpYA2USfmiKHL/aakgT4pvMuKbL0O8p3/LW2PAa1
 JZp9yPzoxzJPRwJ6hgytXI2dy5EcCmSzGJ7qPqFcjaMZgjXI16axBuFLJ/9MApkGNI0D
 ZpatYZLmKRzYZ6EhVv0vFA1zR7ZTSS4eB26M5dUtetMVqI/fzJA6g8pX/W7OraCoRxXy
 BzhYgF0wnM00BmYIQvbpCy/FRQGtu45oOLfcqoBhUaPfiiNA0w8XgB2ZqjF7itGTjSDp
 bbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760096428; x=1760701228;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HnAnwOcMJ2GhF2EY4pQnKOYtxUCKD6UQqaNJzNgnUHw=;
 b=uCtYaXl2cm9FTxCaUQEQO/THVnSBFFXod9o9qS6VRxqeC+r0Mdo4WfI88T9erhwKlg
 PXCzUbaa9xczfrfN/njM5oZQ6BQm+YzFGlq3uOk6Cx/M52DBu0FEL2XgAneCL8/0csnC
 i64LCZufRZH3qxtNxL9Q2OmHoE0wWcNqSCBx95zEaNRF1o9CPGnz4wAV+Hs5nPLQ5hcc
 E8gMKpcneMwj0vigpe3FKMYnOQH7Pd2XRsXS6ME22GPs7XmLqeU1DKzNpbw1cUKg0tu+
 l5v3uNwB/98HA6lgf8xSsfZgouAEATpt3YxvlDySvQ0ZjiAiJZBl6RIcd4ZIPkRbwFIw
 RcAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb+rVsytlh+YQ7mmi6dTZFBqlLmxGMEfqYk+dVEkE62C+SGcZX4yGsaeCtQzg4/eLsFStfZg/+Qg==@nongnu.org
X-Gm-Message-State: AOJu0YywbD0TA54yASwoNLtt2qIuGIGszSxfF4tJv5YO8r+2UIINce6Y
 28ubwZpY3C4GLA9CsHwJcwVOwuFIhNtaRm4TFf/lefEl/9uznlrI+3+jVf/6xrjKrpMQUspiVMq
 NXYZBZEIkAaDJtPwWgJR6ahCpzTBaedeEMn+0yRkaPA==
X-Gm-Gg: ASbGncvUSS2o1s/oQjJuPF1+aoDWn315wa46MgpsFvpphC8bXMQBc2EAy8vsJ3Ewoam
 pjTUo93rJA/I8oBxTvVtvUral3mvNYxRynAIfDH6BsdEeHN4Y6T7sPZAHmC0LmAsW8j1c591E7e
 xyOZHN69b14khMrFSVtjmW2EDqHREg6hhJr6hqJNKs8B0b/D/Ou0GuYAMXRm7VRSbpcRo3PCI3l
 jj9q7viTxBwZ//MvKCpjnf1HfUqtkTHwp8ehkVDEg==
X-Google-Smtp-Source: AGHT+IEINEgWdW1qUku5Zgqhfj0NVzRiaFdLkxrRRfaPNjgpgSNWtv3kou4F2O6kU21QJaN0HwV40JES7D055SkfB+8=
X-Received: by 2002:a53:cf11:0:b0:634:94a:3e65 with SMTP id
 956f58d0204a3-63ccb90be3cmr8115537d50.24.1760096428041; Fri, 10 Oct 2025
 04:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251008215613.300150-1-richard.henderson@linaro.org>
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Oct 2025 12:40:16 +0100
X-Gm-Features: AS18NWBXaKeo0bDbyrVK7r5h8nDWBqOASsFvw7b28occxkzmsDBQRC-LaFAu0HY
Message-ID: <CAFEAcA-q0aB1wTgZrDwk+wgrZK7aGkGv23nmEGxpKmUC31y2Vw@mail.gmail.com>
Subject: Re: [PATCH v7 00/73] target/arm: Implement FEAT_GCS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Wed, 8 Oct 2025 at 22:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes from v6:
>   - Resolve conflicts with master.
>   - Fix size of TCGv cpu_gcssp[]
>   - All patches now reviewed.
>
> r~
>



Applied to target-arm.next, thanks.

-- PMM

