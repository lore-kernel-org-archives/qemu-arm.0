Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3279FFF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 10:44:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHJRa-0005JP-O0; Mon, 27 Apr 2026 06:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHJQu-0005Fq-Gj
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 06:43:20 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHJQt-0001E8-2o
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 06:43:20 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-65005a8840dso8426042d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 03:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777286597; cv=none;
 d=google.com; s=arc-20240605;
 b=AnBaehZSdOEqj/Oh9rSrbdGm+2V+o4BdfCGTq59aFU/WR4m8AfzPKdN6/DGnHNhmvw
 P4d7tGBjbDoO9fwT7nNCm4JTe4ygIuMwGZUxPVhzIJUStvl/Vxe7piSkfNAdUO2vSD55
 bycCPJLpqiKHbvPrCJhF0fuOp+1E6opvMwMWUV26KuvjEu8pSife7URYMKsd8HfGbPyv
 HVrk3UT9qK0dOLph3SO2Zze4EV89NvVxmtXiJdY+Xz6huhHN7JF6bcgGyI20I6FfD/Zq
 AxEoTqq5Ib0swTFmghCjksUpP+vWdSaR+tNC3ONsdGJoFgXu3C7BDbOiMb1O5hO631a7
 iRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SA/p4WJP2E2300b7hYm1QwSr22CaEwN4z32UNz+3FuI=;
 fh=Y83ZuoXiuCy7YSjAcX3TnfmyrdbWMRs2LHjc2KbWLPA=;
 b=aAYG3mBeAPLq+wO6j1KR5Ee1LYyfds6A8+T5UijoNNqLg/sS2bkAPm9I/aVWBSRUv3
 ukziFK5wGs5QqfhgzlVKslgmMntq4pAnlp5V3dWUBwHfhonZbxDSNIJow/fzmov92T7M
 Np01kZsm/ggl3x9lot7D58lA5ILzQ1XvTl8t4t3CALmuAaDl5/DMHJ7qAT/WkUt+0bcw
 RWZlAxU2w9Y9sGuDX4g3HbA/i6n+oIsqyB8nXI5vAdl0QyErDIHAhzeg2BX8w6O/K8QU
 50UQ3AmsliDpfIXFJyaSJg9mXkyqhBgbkc4RrEEptobAV0KJ9Pu/Qobqnl5MOlF9omyV
 5jZg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777286597; x=1777891397; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SA/p4WJP2E2300b7hYm1QwSr22CaEwN4z32UNz+3FuI=;
 b=qyj01+xgyvj5GHd8g7jGKI8xh2D3I3zYhWQFjmq5s0ERXvbZvLUL6DnYPYhXAms9FY
 z3BNmIPYuuhYtFE8qXBU2ZRjyw8vKRWZX3SFmhgkQLF70uL3o9TIMCub+fQW6HNt84NR
 4OBgbHLtfM0+1+wGVYR/3fYGv9E0Sn5xVGe4fYipdfGyfDSuBEu7CzIr6K532nrUJVFD
 sxFdwmbEMgcCUzG70v8J9KWSmO/WdXUMmxr0Q7G2gnVrIQT1A060MVsEPlHuvumYwwUu
 XiqVljIBL+N14+fTq/BItp1JnQgjlFhuVvV5ai5n2GsqM5EEoFlJ7yuhpqnicwi9L6r4
 R+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777286597; x=1777891397;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SA/p4WJP2E2300b7hYm1QwSr22CaEwN4z32UNz+3FuI=;
 b=Mlio5RSRaa7TkF0quDuIgmbCWx3g+yTqKhf/knac6TCXG7JTk+tGB83f6w7Lpnbbu2
 usTMHUGa1nCcAXr4KEGRsxjNruOhN2VQkjF0W7D7xgNGAMcCAE7ygTgvQHPRWWHiyTcJ
 /esNw7GsflHF6M1soKn1h9LrKjnQJBXF3SnQoQswNvpB5XCnwrJpdUxSOI0ZLfHIYOd4
 ATzRR45f9ZHHlO/xHeuFd50kdjC3EkETx75DE9AvtjAwWkQ69lNHGAzwud48Z6ob3xkE
 acnEn1m3TO1X+QWig/1f9uScFkE50FUpYxWkQOIUlTBEbaZjAuRlRcUaQI3FBXa3W4tO
 7ltQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VV2lKu+a/sO/hXn0Pp0LHehDSiY3+jgtrr7QwNvkcMh4z0aWfh8cZ3OriRY7TeEfobgBkV57UCg==@nongnu.org
X-Gm-Message-State: AOJu0YwFmV79ltW36O0EOTtpGXDf/NVo824FgMumspsf2ZG5n8Mrw12f
 gvbDuCD8vJ2PC4tqIwG/qRNsBOi44+EwzNd4CH0ILgRAXYl6/ILGxcOlnMWrWMarReQid18+wdb
 K4E/c/Vj52pkQPlJtS58Z+s2k872xOdnUvaolWe11+A==
X-Gm-Gg: AeBDievU7ABv8YakQm5C38vBZTOr4REFwx7j8d9OJm0AAxM9wBPLbgH8zibFy9GflS7
 Q2bHYnG7cmiKlrOFj/OLcP9XVRWKfhjTg9Yqg8C5wcWjg4sbt+HiCvZ9rppLcokJrsShFutDq2f
 IoF/6aof65r+czGtMp9of1lwn19YZk/IoJZcLlFP+0/jV3Fhuir24oc3z3YBnHAs/+7P6lPHCU9
 T3VrOfJCX7s1lXUBTA7lXiarE7PvfKp6C39y/KsvDlDnjzZjPLErc38n0LyekpSSkLuyqvsZ5Ym
 vcwxK+OB42cn7I+eTlxBqnLzblESkZ4agrWuUfTtNEfgPO4AAdOx0yKfBBBGZRPsE6LL5b75xCE
 5Zw==
X-Received: by 2002:a05:690e:2501:20b0:650:849:db44 with SMTP id
 956f58d0204a3-65310a13c3emr28702564d50.38.1777286597272; Mon, 27 Apr 2026
 03:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260412110240.93116-1-yangyanglan718@gmail.com>
In-Reply-To: <20260412110240.93116-1-yangyanglan718@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 11:43:03 +0100
X-Gm-Features: AQROBzBLkDZMWh4beHsvpnVOqjj5HKT85qoUTmyXv7wJ7j_18ZlP1SkhXct8gFY
Message-ID: <CAFEAcA-6+Qekb--xqCa49yNtkKAgkLnWLf=Q+Bf5WER9cOxmeQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] i.MX6UL LCDIF device model and SoC wiring
To: Yucai Liu <yangyanglan718@gmail.com>
Cc: pbonzini@redhat.com, jcd@tribudubois.net, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 12 Apr 2026 at 12:02, Yucai Liu <yangyanglan718@gmail.com> wrote:
>
> From: Yucai Liu <1486344514@qq.com>
>
> This series adds a basic i.MX6UL LCDIF device model under hw/display
> and wires it into the i.MX6UL SoC.
>
> Changes in v3:
> - merge the previous "build symbol" patch into the device patch
> - drop the unrelated hw/arm/meson.build line-wrap-only change
> - fix commit message formatting (use real newlines)
> - use 16 KiB for the LCDIF MMIO region size in both device and SoC map
> - rework register indexing/storage to match 0x10-spaced register layout
> - apply SET/CLR/TOG semantics only to registers that have those aliases
> - set CTRL1 reset value to 0x000f0000
> - remove redundant 32bpp host-surface check
> - move realize-time cleanup to unrealize
>
> Yucai Liu (2):
>   hw/display: Add i.MX6UL LCDIF device model
>   hw/arm/fsl-imx6ul: Wire in the LCDIF device model



Applied to target-arm.next, thanks.

-- PMM

