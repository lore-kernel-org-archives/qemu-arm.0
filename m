Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC5BC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 12:59:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd69K-00014H-0z; Fri, 26 Jun 2026 08:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd68u-0000nL-5d
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:58:49 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd68s-0000iw-KV
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:58:47 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-662bf1dab83so1456219d50.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 05:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478725; cv=none;
 d=google.com; s=arc-20260327;
 b=Pcgr0Yu5qzcuWfV51tdyQmUUAZU4jQUahWcC0CkBHCP2ceAHPPy3rY3iOSJksDRFtA
 lSP7c0J9+75iiex9k7w18hjjVibaAgnxDQ6PPMuDlMRf4KtY61gO0g50BqRznA7ka4hn
 /SJzHw2T2fIDqZSeM6UvkepOnV1xVtPwSmDSBkyo2n7M0T+sSvFmX4xIG5Ekoau+Oc3G
 eOd78rJ1vbpOJ0WHDLoy3vkIyzRJpHO5HiNjlEnrA1SSgkjbUn5Ahyxm9QSsCn7IupON
 PExJRvhYQX5o2facNZOPsIQ1KannFliC0ohquqc5Z5BuAHdqP/usllWRXb5VxaQC41Qg
 xU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KMriQSIoTveX/5Lf9JctRkml484nCp37hCXyI1oC8I4=;
 fh=SM/DJX8LlxsnnEOFPYT0DcyCZOzdSi9dUtssYzK2ACc=;
 b=GpUaeNVBakhN8DOe+MlphiZ4cpn1C1bIfA8S94WFGVJvfsNbPGFZL5KofeiLZO/Sh8
 N50IIOhIsaXBrdTkj28KTTEELdczqoSKTdmtNQW5RVSXW96grqfD3tVA/1c1sS+OmNAj
 xiog6C1qSbvku/x/3Vd/UAKGLxRlU1H22rgOhp8FOfWtS/oWtAekGe9zVaZzR/4y68rH
 t7/GgEMK/r21ZeVFm13SZvzcc6vsW3m6H8okgXW7bRuXI6mrKmIdlqEvSSdZjREzTzYo
 1Vzr+yFpByVLUILOiOfVVqIcyVrLg8O9EdksiFhsiZNFlPXA+s95IuRfAeGlmj4lSjKB
 tVUQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782478725; x=1783083525; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KMriQSIoTveX/5Lf9JctRkml484nCp37hCXyI1oC8I4=;
 b=u4dZJXEy/K3VW4X+nBLc9E6Klt5UtqsQXpw0lfJJO9TPt7h14LBCRm3D7164+hjVHr
 4aXlz749FISYJfpq3Qa9tW8vnU1nU7JZN+D37ytMErwH0FLpve2tOsCtgaYDK+dXO4YZ
 1aFY4dESH0LUFb4ZJKLFHD+02o7ExGuZSrSXYr9jPkY+DGmp2QwSLcDD4QeNooxBlyQl
 j6QFK0PI5yzxV0pBSKWXNgMMzb3Dyg2CmeABv2eUWt9kbcjhY0ilJzlPVSCkB99EImjA
 UMuSVHE+EerydEz9sCA21y4/xRKzf05ufwg9+c+ZU+tAT05GqOyA4mzRtg7jxxGtFxYb
 fKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478725; x=1783083525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMriQSIoTveX/5Lf9JctRkml484nCp37hCXyI1oC8I4=;
 b=jhXVBq39rJNvGPxUM1XoL5lxC4I/Qq4V/M22vdvPFejNl7fh5qeLOVXb5ZQnrHYPMV
 WF/9gDivADzXgTl1+3gGLJkznSF1M0niQnhU6JMOB8j69Ev3a7Gj3G/fqDV6NsBe31QP
 FcHyimGJ7F8BpKqOJVskD4UujFWFhznGMx1j5C7km4iOiYDRRf316NDFjIjqXvY/O4yZ
 3ZL+iia2cvr9mtoDNUKcbN1IdneyM+a/8zrOTzQGdARiLMQ3e1iNmxI6b6EubWVGjQST
 AKG6I+zzrY85SA1q0QSU/KUHP+h+wWx/i574Wzz8dG76ZA7xuY9j1ayx5v+wHx+hrhPK
 +1wg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqBtN9I6cEqWE4GPfWOHvB7HEERrq/R215IcZa1syZoK9vBd/9x/TmGLlgct/rH7jRNkGfksAnYBw==@nongnu.org
X-Gm-Message-State: AOJu0YxVjfRggLeIbt807cjslCgRreyYHWpDaITR6/R50Vu7wwbYLuqY
 d9TqsQZGsCOG4T2HwU83di++F8lsU+PH2wnJehpgf68AAt//WDynlxj12pk/LzVs1YfLibiv9I+
 yXF0Zv7SIA683kJUov2YGDWBSIiJiFkdt4SWplbPa8Q==
X-Gm-Gg: AfdE7clDEN7f3rmDYARCs0NqJY/X3HOO1KlVZB2ArXJEyM5lAbk2FO8hUv842J5pqQv
 ez+0dm1N+c/bfEzBABlNcPx2WizfPhg9QXEahYNQ17gHWPrhO7/TyHK3rJfTfPM9/Z4heY2Aa77
 r1G3foXzP8DVexS9iWfvo9KynqV+l9ZM0rs19qQYocUobI6CW91ouzSjxlaKb1XAj4DVNtljgch
 43HeVRBpqZyvkREoKtw0IT+CBMlNiv4kp8HtylWW8iVYldDNUkUS0Xiz9Nlnl50Z30ySLC2tSvL
 kd21RH0zRW+JggUvvSt+uAjM52cofgtUBoinpDS4f6HbG0oTyMUjwsGh
X-Received: by 2002:a05:690e:4511:20b0:660:3426:3fe1 with SMTP id
 956f58d0204a3-66487deb904mr4292233d50.24.1782478725576; Fri, 26 Jun 2026
 05:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-3-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 13:58:34 +0100
X-Gm-Features: AVVi8Ce-yemMEUq2--ji5hjhf3INgNTLfn8xTWBhDYBYaKk05wd5vYyY_zFlO80
Message-ID: <CAFEAcA_Aj0p7jNRhrMysgLL2fyLPrmzUQOS8N+mwh1Ma_DFg8g@mail.gmail.com>
Subject: Re: [PATCH 02/15] target/arm: Implement FMOP4 (non-widening) for
 float16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Thu, 25 Jun 2026 at 23:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

