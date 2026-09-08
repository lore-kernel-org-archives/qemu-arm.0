Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A35C79FAD
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 11:01:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3tZn-0008EC-0m; Tue, 08 Sep 2026 07:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tZl-0008Ds-FP
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:01:17 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tZj-0000xE-TZ
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:01:17 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-85aa9c1308dso34380547b3.3
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 04:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788865274; cv=none;
 d=google.com; s=arc-20260327;
 b=PJewVu79wdRfsT1lfnweDp+6NcxeBMc2n3t0+yOY10OSgSUU8oRe2dOYlpcpm/u3rs
 gol7JF/cqfT2jguscM/ITElTaexi77oslWrZxcck6/3evmZugDZtYhmiWGLDaLI8mNzM
 bFUMgv6sqVpPEIgk6xwZddLTdm8W8m4onvcdokDEtqm03wG4ENhhlNApo2k7DHSe7nIE
 7PdEVn+7qOmuQk6bID+/yQFIQLuWGuGt+s3r5TNZMUegvW7Xhku9q4QwTYCvJV3w/wOD
 14ShQy4IB9ZkC6JEEULR7yFetJrXuqKn5mQmGFr53DD2h3H4h+7F5jetIgY/qiq0qI0K
 Weow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rLr3Ihk3i+ySxHKRTatouXFLAoY7mX1J9syBaxT0eGQ=;
 fh=hPuyg3v8JfGsmC/hoKwbFPH/8nTh11KZeLMtOq5z6pc=;
 b=dKMxi4aOyB99wxkTDYTKhJe5rz9FTfxB/f3o+8uo5zXUXEyEm1o0ZqnVMdKbCcPs++
 k0OMdlP05yLiXd6gZQl3uCqRXUYXlYjdcy4Weal+1uQ6OxOHfU+jmNMOzMyoy4IIiD7+
 NWnQlcq3YbXew1fXNT3q9xiACSp3GP7ZCrNyTZyUkHzmFvpH6P0ZD2CT0gXYiOm6xnoe
 G3jwJvR+u7v4YnGBa+Oph8pEUFBqNtS8OOiW02QmF8he0TzzTfP6YnKD1mQYAkSshMJi
 83tcfPGVCqqdoEeWLGS+0pqTbKXmkbwEzwoOvPFK8+IcgXnLRvoR+bKmPBTlvj+mfALS
 XF4g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788865274; x=1789470074; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rLr3Ihk3i+ySxHKRTatouXFLAoY7mX1J9syBaxT0eGQ=;
 b=i/jcba2WK6DjjCBes52vAwfI8P2k8iMCY95Td+qUFaQzoX8SAslGtzFP2LGPh3M4fQ
 H/tWJLEdkZ+YQh6rx30SUlLFhEIhwTAbr0+YBemvDGoI8NUbdZLPNSSpvxYLMl/9iinL
 BBTzgKJvMwhdj0KAy4l1SiL8e/WB9C6rrJxeWE8MM+3dinZk9fFkxF/p7sBqRPzsNwXJ
 wqw9a9nk8QEFBoOd5VT2i4fLdogI5EQ1vUjqH6EG+8jyWQrWSA/v+uKtVqO3zPHPWbRP
 bLfCotXNvX8WJAbE2mi4tIrg7KGFtmB2M33EJKL+fkuHcVcLNs7ngnWqA1oAhe7Z97dD
 sa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788865274; x=1789470074;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rLr3Ihk3i+ySxHKRTatouXFLAoY7mX1J9syBaxT0eGQ=;
 b=jFTypWMEFKcqjaUOgDiM0p2c/wBq7BhzoYF9OQoLtw1gC9KuflftR3ARBwglul3rIt
 CM/ldYVZAmYce9g7RHhcinAdBPio859koszla3L01MK8QaFPcrt9zULWC5esqdCFV+SF
 TK9fucQHkXNBykxFpMyEjBn/Axdm0j+uTlT2EsFdIiEX4jU1L0Rj4IqgaJ6+UyWhq48C
 HtZHiiAxbDQLlDfozHVmwIXLwD+jBm7Vud+6Z8sxt7c0/W1pEAGwf5PFMIXm3by8KMbt
 fWPbXUWCXstK5Z4e5UofdvfAo5WsrL0wf0r5z1/Zq0gg9CPHs9c5hmty4VWhcORbwVMM
 ETrg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxuXi5x2J01WuFit4WEHJI5RMT+SvaUsN+gzBJwJ/B12HyJR754b6qkHgMJTTP/ljOO3WFcy1NeRg==@nongnu.org
X-Gm-Message-State: AFuF++lfl44QHYLoQmqDgi8zgPzKOtdeM2se4LQP56wvGNwWZnD3Ksj3
 NDxYNXrtdBTbiR+G9iR5gA5VklDHkrGpctQmuPwbDEWY6AjOV739cFdkR3j33sE/DAXKYdaR+nj
 4tbNMz0bekMorRg1GQb9MPw+Ic87zPNO6Vcyc+4FFtQ==
X-Gm-Gg: AYBFou0XatE6eMkJfU9gNw5qtzwUcIlzr1eDVq1MmBENikAunrSoRTi4NeEk2aUXUvP
 ncaCDT3qeEppALz6nm+tJxlWfICoNYJvEhwC5a2vSM92mzQ5C6Y1Jq6y/KfQxlpH8Ubek32ATSq
 4uy3voVFT1EYl9XUmHMwh7d1+jEYoktnN47tULvxBFGUtS5iHix56bxGxNwZKAae6lofGy1DYo1
 yM/QlPLSgQAGMCZJoMZnQeMyPrsuVX1v/x07t3Ak+BtMOS6VLbOhDV9KM2sB5D/LXadbuVzc3Mn
 AZIz6dFLyuLUtZolFR48gLb+xZsKUxslZOdcVMzARtx40LXr+Kc8LvQctsaCYW1dV0EbUP2i9Dc
 j+UwZ+7u6qQ9GrIJsQM/8lwlyQYMchg==
X-Received: by 2002:a05:690c:e3e8:b0:870:f53:4ff5 with SMTP id
 00721157ae682-8712a7079e7mr113494967b3.23.1788865274290; Tue, 08 Sep 2026
 04:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-9-richard.henderson@linaro.org>
In-Reply-To: <20260828222639.1432046-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 12:01:02 +0100
X-Gm-Features: AcwNN1WuVVW98iJzwutdyBp3r899daI2gpcjaIX-AkuLv_2hRKl02JrojsbamfM
Message-ID: <CAFEAcA8h_8gD=7Z5y42ynmsLi0YDD5BNBHsQ8h2GobpqTydHmQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] target/arm: Clear PSTATE.UINJ when taking exceptions
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

On Fri, 28 Aug 2026 at 23:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Clear UINJ when taking an exception.
> Clear UINJ when exception return is invalid.
>
> In both cases, perform the clear without feature check,
> since the bit is otherwise RES0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

