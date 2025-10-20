Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDA2CCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:54:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vArGy-0002nP-Qg; Mon, 20 Oct 2025 10:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArGQ-0002QT-WA
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:53:35 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArGN-0004fZ-Q7
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:53:33 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-7832691f86cso58167147b3.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760972004; x=1761576804; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nwGLomjMQMrKU6bWnrSP9A8/aZz5iNPKaiFUFnEYuK8=;
 b=ZEDFwkS51HSKDB286InYepIHWQMp+eXCiM8eTG4yiODHSwqW76n3wI2dJ27Y5dLqge
 3oVixD/cpo24TIiaHxj/eGWMTc47xVR4FSGpWo6Qa6oRs88EGUHyH6K0KYaQrnnXAvbx
 isxUNvGVI0Tdzb0mM+xFJj8JvcW6cP09MoGuZO5CSaT9Yxhi+Vyf5hRqAbNKHYOVGFrY
 4t/4ZGgNWfmkxvtFjR4kphuGmZSncGHOJaSvcRxbt79YJrflzDKSixvYJWI5y6+4FDrA
 ZVpSaJ+wUCp0m1rLyx7AVQci7LH8jCm3TTW80G+KcWah381DPz0uHf7u2j4ULqhk8XBY
 P/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760972004; x=1761576804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nwGLomjMQMrKU6bWnrSP9A8/aZz5iNPKaiFUFnEYuK8=;
 b=pxpO50BN3/c7b29TrWMsqtdGMAzwjFUW1EIe3yuXfSR3890lUTJpHmmhBe9/mQ+rIB
 fhT/gV6vD2abeBbUwg3Q/yJCnRr2RAwWlUs4qMoiKe1HXcrZvrXXTMwvKPGS4ekfvWmM
 TX7XPeJs5aqreIPEe7gWdaGCGaUR9LeMoywo8QtJGFVABQVdFIESYpHLD5EODxB3vUWF
 DWjNg5vnmvNZhMJwrIIGgI/3a1wAi8uVIKOkY8j8oWGQWtlM64iCT6N00rGa2aonDcVP
 TRAWEJMW1sQyULkG5hTHr/AqYIHnOfAo8eBKbuoxKuthPjcBCJ3bqF74tK1XeIlGGLqf
 A5/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkACDkV3PbZinT0vTWmQbYFPa4hPshs2dBomMeqvHy1cm3OWuwvAaQVUg7sRQ+snEpdLAHLsVkrw==@nongnu.org
X-Gm-Message-State: AOJu0Yxcn8x2sBIe48HqXT3G9VDpxBKsDbbKcOoQvPEZun5Sh8Rw03Ct
 dsdz2teBlgYfruRd4OeDJhrXdvpFiL+31aYUfP2wBV4ySGwg4NMqR5K0WvtAMErOHQYrsrbgvqF
 /eCYipH9QO5DX+/GBIcAzkL12zvFqTTCNY2UJI0ZfVjG3Rq+5ldZ6
X-Gm-Gg: ASbGncsfLi0Sdj77OOv/KwbjiQ1mTwggXdWgnMG4qcCQriBP2sZRkV5Yru5zJr0aE2d
 +gQhEVRHBhvuuFETjP1eNKg32iXKW5Xdbbit1I6pYpSB8GvoxQ0nVRbyPKDxO1SaMbfqq5K9Sdz
 cypRUhIQSG1a8+jJuB5wNMVQ8htbU/LLtseYx7uy53J5t46eHL999JMDcsnl8Ln9KvGcdo3sF+s
 JkumU7sLj0kpX6V558LNMQTNVmIWxQe8tT8DlNX+5E059jMXE0fTsyEAWagXQ==
X-Google-Smtp-Source: AGHT+IFk7ru9DibFhHgu0PTmdqaEZ6lt7baHnNp6NeUOQDxIHYQUH5/PxQ35S5yAHE55lwkxtOVw9xYTi0pfW4KVQXE=
X-Received: by 2002:a05:690e:4294:10b0:63c:daf9:bf21 with SMTP id
 956f58d0204a3-63e1619a19cmr9992302d50.24.1760972004078; Mon, 20 Oct 2025
 07:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-36-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:53:11 +0100
X-Gm-Features: AS18NWDNRnszK8FOdccPhodhtdOZ1_TYFSc0g7pviMCx8ryZgsYtKgvSBanGg7w
Message-ID: <CAFEAcA-G0n-Qv5K5-=XP71oL2Bzk7TNE25-UAE-VXmgYRcaW-w@mail.gmail.com>
Subject: Re: [PATCH v2 35/37] target/arm: Implement TLBIP VA{L}E2{IS,OS}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Tue, 14 Oct 2025 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/tlb-insns.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

