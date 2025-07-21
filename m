Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77506C83F25
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Jul 2025 10:21:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1udndg-00071q-H4; Mon, 21 Jul 2025 06:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1udndd-0006yk-G3
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 06:20:53 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1udndb-0006w8-AX
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 06:20:53 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-718409593b9so41707877b3.3
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753093249; x=1753698049; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2P+qLiv05cnvssuW4eCw8tGUsEcJd5QTQNA1qCHuACo=;
 b=bBb2Ssf3aphGVc18bH/BiNKL1pYdbssvlY5MnMfWr1MtkoWb9V2NiDwph+eQ19Pt7l
 nKZCda/IuoEGVHTp5qBhU6LVVBRiLUChtpdaYokg8Gd6HNaqtcO5pgDCOD1MSFczzZ85
 IqrAG1yCQ5g5nX/qDfTfIEAKUX8vJGBfMPWPLJv74DCZAE9qxaA0GHYEx0oqvoVAQ5Ab
 ghLsEjrksuXdA2yHSQPOwkYRtOS96TCmeBySVYFNvqbIJi23jrMF04tHrp6lJD9KdaBm
 XnL6N3TOZNEfeyHZDGk7P4QwAGaeWJprca2zyImWhwg95sdVXokYA9rBAveKnLD7RfPi
 NNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753093249; x=1753698049;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2P+qLiv05cnvssuW4eCw8tGUsEcJd5QTQNA1qCHuACo=;
 b=v9K53eFx6lOCaP6XQfnPDTf+KkVccrHa/JW7qWxCh7Lg2bxTNBZbk8/v63xBFpk0Eb
 fm/sKU9IwyCEp/DLn0JXlPPwdNwD1JHeUr0hWKLyFqh2nA2P6MiVW/L9s+oWt6mm7AbC
 dSs9WZ5R0rWEzhjlHRMTer+zzh3BD+RJeqJMbbgfRIyEAAFRzIhhBBKDPdixHQU6JIfN
 phsufrH6tH1xbBMz6tejREmGJ2mosXtdpzf2OFWUGPIMbQIZmWN+FzRN8KK3MBsuAemY
 lpxsOurdE5D2e2d8NfG7oeWcitOc8CU9seozKA0FDtpXeQZLjjlutcCEHIu2hP/YsYen
 QPQQ==
X-Gm-Message-State: AOJu0YwRj0oz5NQP32l88nz58L860o7E+wZDGdbvciSCAQvw2AU0hlu4
 ctu9BivP01gW708rPD2EfhMOqLj2rtDA8IfId+KAjHPDbIj+YrZjuTskFQ8SHF/q4z25bkVt51a
 BQbBQyVSTRwZuXm52DsIPQANZCCR5UtzS2oHYZlZJpA==
X-Gm-Gg: ASbGncuEQdgtHVNSQLQzLYBD1Kj+2Oh1483cDME/LBRTW2aoWsm6OQCLRRprIMk2HJe
 Ub5j4ISjSIF75LEyyE6QLGWyEYSpEYitphCsRinESkpqKELhfbx9Je5PRaXElaqxoJa79xSRRJY
 U5x2+iiMP83MSvlT2LZfgwge1yyKQ135r/UMwFRldPpT8TWk5moDb1Ompk0yvEp5EHvjTK+/F/y
 hhE7ued
X-Google-Smtp-Source: AGHT+IFjHqkbWecQJ449Vlj0JfptaVmkGwDhLyEaWVI9yAZ18vLUd8z6Jsq7YpTFZ/iTAPH1IOCJ51gxePwb3xMIZiY=
X-Received: by 2002:a05:690c:3703:b0:70c:a854:8384 with SMTP id
 00721157ae682-719521a381cmr113637457b3.11.1753093249508; Mon, 21 Jul 2025
 03:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250714160139.10404-1-zenghui.yu@linux.dev>
In-Reply-To: <20250714160139.10404-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jul 2025 11:20:38 +0100
X-Gm-Features: Ac12FXxUnKM8-lSzqXHCTPcZvdgIZ6_qDIiv1MjX5fd2v2FOC3tFqcnk4jBIp_U
Message-ID: <CAFEAcA_iFDX7dmodE5WfVOov77YXVOk4tcJuE67zKVwQQCaBdQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hvf: arm: two small GIC sysreg emulation fixes
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, agraf@csgraf.de, 
 mads@ynddal.dk
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Mon, 14 Jul 2025 at 17:01, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> * From v1 [1]:
>   - add patch #1, as suggested by Peter
>
> [1] https://lore.kernel.org/r/20250315132030.95209-1-zenghui.yu@linux.dev
>
> Zenghui Yu (2):
>   hvf: arm: Add permission check in GIC sysreg handlers
>   hvf: arm: Emulate ICC_RPR_EL1 accesses properly

Applied to target-arm.next for 10.1, thanks.

-- PMM

