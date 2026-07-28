Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E772BC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:45:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woi6i-00048b-1P; Tue, 28 Jul 2026 09:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woi6g-000483-Mg
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:44:30 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woi6f-0008OC-AM
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:44:30 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-6688acd1a51so5057509d50.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785246268; cv=none;
 d=google.com; s=arc-20260327;
 b=VsO5sj8Jxat32QI2I2d3vQC8gb2J4UbvO0o3hyRbnxAlSS2ewtYRbdrGHqMjrMrrl6
 S6hiqbR56SO8FC/KquQdEh+GVHFvEFCA3hLgsa6QbHbPJAX61vTp/F4IfvfPpDeD7KZs
 CrhNI7eI1xwSiA5cxba+yBash2akMxmYFS6uNTycyPZI3rGNCFid+1Sk4keMcUGcjKyA
 42eah5j1B/B783zCx1h9DV+bOXnSb2wXYeT2r8wQMb7xifHqmHkFep5uz+UyH6Q3HW4N
 z50JEm0gDwIzX9nFJPwCUfxdtEke/PleQ27yNaHT7biKHP/XLgUqZYaKFIxS9QZGeUjv
 6JYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TZ4ELxbCc2C7PNjqxVaTv20MiL8J+V2ohP5HRYlBugk=;
 fh=//mDPPI4ftAfa/fin/CWYKoUuwBhzCTWH10GGiPUODc=;
 b=VMFgXnZxuJykpckmypDrWieQa6JG67SMb2A9CxYxnom+nj7XPFZJtDrvQHTtT60vMT
 fuDiGqRfaG64L7WdQeYfTC8NfCE415D097H282LRtxmKGOXIvqHU0GKYkSUOMJqthCwH
 2jkW7skZodMbsL1tTONixA5rZaf2m6MT/qMIC8ElwoWgAL14WgUdSUVSpl+kPgj6vwgy
 e1mZNQ/RB5Wqyxd7TDHlCSJNU5oaJ3FKCYtEP+Svsy5RYRU3aQKtjFdwfSS1gHZUOYC5
 N2Xmv5+bNewdVb7W8TG7UudVDULAnRmCJ6W7j1p95SrlE4huAchKdDKcLmKBEUGN/XGd
 gHOg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785246268; x=1785851068; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TZ4ELxbCc2C7PNjqxVaTv20MiL8J+V2ohP5HRYlBugk=;
 b=wa0nnD2hlvspu9xg1jhDDppCECXP2BodV4FDTL9GqUCl4w5sdQyZWbPFbbFfXkcldq
 8Z0/JUKyronS2yy4Ne79PAdN0elj6Ruh3ANy87w/NYExHIxy71H782wpOyshB6KMU2Zu
 /MjjPA9nPqkeCIjY94BR7vr8A3+zJ+gOnVFAf2IJk02OQBoHFgoHMPomEx7GjCsczsOC
 dUyn8ghhtUHfiqPRCXy4hMJdJat0U9xZKmmBbdQbi4ilj6QZ1EFAIK59k3JvOulgIHum
 uuPrGcj03uTiAxcijW+LYfPUD4qO+o1MItJTQqLN9K5jtZAfIMANLX1kbkUSjFEMn1kb
 /VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785246268; x=1785851068;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TZ4ELxbCc2C7PNjqxVaTv20MiL8J+V2ohP5HRYlBugk=;
 b=BUZci9M6SvJ1cfSMg7VIRg6sxj0kjYr6Z+u0HZLw7Wn6fZ1FU9fZ72Lzu0gs6vkJb0
 OtrvC5knke1KvZxXwGx1aRiZQonPZvYpWt0xwHnSbrBfOJEqAh3J8y8aT7qredqJjhYk
 MU4eiT2inPqUiHeHLMWEf4r+96MhNQvBrnvUk2ibS01uMCwDWTmxdaaAd0C2hR3ZWE/h
 0XSNOPyWAwDdrZU72Ykn55BmQCM8CZ3FpcKW942zq5qeQPliqdrRkrjWCadpTXGKtqda
 0138GFAjMf5oYHy8OnUtdsghVDkSe6V5qJh+sDrmtSXTE1Q4Hqjkdkteg/oHOS3HviZA
 5D8Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RraMCGoDC+EqXUCgSRxa+le7ultFLFJd87DIyoxa1SLpYYhEuggY1h6XyOsO5+SqFyQj0DwBxFHwQ==@nongnu.org
X-Gm-Message-State: AOJu0YwhV9IufY33WXnyWxpL0aF0gbtaH1nJLnL6qYKgBMzUbaQYGnYV
 waNkkJ5CEJx7jxawOaObjyQzHMCj778IsExQWUJhxJJ5tlCetFuKqe68XD4WKgt9QhzZujZOA11
 BknKv8bKMkNxDUx2rb8BvWkiXaOPVk9Wna0XHbeKTgg==
X-Gm-Gg: AR+sD11CFopZjqzOE0KQ5rtfmsCy7EhSRyHqEgmExR9rQHOEPsCZvTS1nnoiftPVzeF
 pLvBjsk7X3Fx1o6nZuNOpCSCGJSxNvu9QLSNhonxpdflVQRYVFkY95f0mYMo+zKaMHAZPIL/teG
 SuOKDyd0SXP5H6sIElbasTRu3T4eXa+ln7ABfuOgxFHbMEhd4UtH1DMpWdQT/RNGpNB4XIO5iSG
 uWJuTaMQbkZkMlc3dF/ApWG1RNvZB01B8mdsCIQdTosUNtObPSm/Gh3DQtv3LF4fuG/KNvYXtda
 O9Xpw0Amgm/PXW1VhOhZk2xhABtm6hOMxjPbMnN84Bb9aQ==
X-Received: by 2002:a05:690e:408e:b0:667:b964:d72b with SMTP id
 956f58d0204a3-669058a41ebmr834165d50.107.1785246268280; Tue, 28 Jul 2026
 06:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260719174905.420725-1-richard.henderson@linaro.org>
 <20260719174905.420725-7-richard.henderson@linaro.org>
In-Reply-To: <20260719174905.420725-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:44:16 +0100
X-Gm-Features: AUfX_mwop3LAdYmP4GW2p0dsp6_lCdOcMNGsCzu91IRcACd-grA7RuRbYDc0obU
Message-ID: <CAFEAcA-quyjPnt-idF0Q-hLoPwUEpmsW117ULa5T4KEg5ML5wA@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/arm: Enable FEAT_SVE2p2 and FEAT_SME2p2 for
 -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Sun, 19 Jul 2026 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These features are tied together if both SVE and SME are enabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 2 ++
>  target/arm/tcg/cpu64.c        | 5 +++--
>  docs/system/arm/emulation.rst | 2 ++
>  3 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

