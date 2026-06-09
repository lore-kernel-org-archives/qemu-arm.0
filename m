Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C769CD98C7
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:17:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz8K-0000bQ-Fs; Tue, 09 Jun 2026 12:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz8G-0000aU-Te
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:16:53 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz8E-0000US-HB
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:16:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-bec43ee8ff0so824166166b.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021809; cv=none;
 d=google.com; s=arc-20240605;
 b=KWOu5wq7xPLewlqFEj2wPSR9DZIdnbj6OvTU9xGhZWNdmDAYmi7vIiordM6sWO4d6x
 Wgyp0O8FeMWspPqWvT3yHhk3V/c9tVNM6Ei53I1Dm0PVij6Lh6CNVXmdNMmsmN0Ce6Ni
 H6jAw9IS8QNqAbTcZJlLYOCOGLxy/xr8aEoN9TrrFeutHmqGEDUPWB4xUCesiCUgiq7g
 uEjlZbuaQZJ3Lyxt2GF3lrK/RA575fI1rk+h4CNsFCuU5kAnwXxxrnburweZ09apYNqR
 Ljoqj4cFwhnKUxAgEzgjoRW7aSVK/MuOpJj4OSOka9KnyZoTiMhmkYlSSBxximfDfNvv
 363w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BEqauq72TLGkjzw9cT0OndMnZkUOXqb47KY3x9X+n2I=;
 fh=bmqQcd/x8XEbY9L+WVzTfkDBxdy8Zh2PdijRkY2GlsY=;
 b=aqxjeZav8rLYs8eL6VrSjixngnxOy34yl4HN+6eeeWuDHKgEDajSJbrLjR5neJpjsP
 nS0o6xhe2UM4Vdsz2M5etw0fzUHYKotZG0h9Rxz+OG1Yek7fO+Iz3/fByQqmfHlA2Vuw
 aGOtyzTyUzkTdDsiH3+x0wCCJsBs4H++s27DL85ktBuDo4k098AK+wjfs6Og01+FO32b
 G4/6jlUq2UzELAlVpRaO4d6lJFKDDv5Z3plwPSZhf+apx6W93moy+drBoaOeN2KHyNrw
 jkTrcwZqCEgUpmtga6EDdKC6rWTYp5ARd48MZNpL2Ix8A6IuW65r/rNfKArLEQgHCIKU
 gHeQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021809; x=1781626609; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BEqauq72TLGkjzw9cT0OndMnZkUOXqb47KY3x9X+n2I=;
 b=Zq0XExNxBOWfPPRLkFfPK4+/YuMTNtTOewTFF2FDHiDY2pzV0YOp6/yi1LkcMCM8Lk
 IPdYHGKKsKJiMT+4mG0RiBx0U4/HnoOIy1jlDTFSZYYIWn0aweebb4EFLfLA0+MJooHG
 w9xwoI95XGC3sqWxrOamiXX1r1jcsBwJVFKkF7Un/H4UO1k+alSpPjF/+7PY5sBsf0j/
 q7lQPxurGDWOVqw2Q6ZzxIwAsbZW9Kvbody0NGRSCfo5PdtmEsJo3plLO4r8bZ/3DiCz
 IT1KWEW01m8eKTvD+RRsZqWLug1R3b0hnp0Rhendfhy0vhBv2yb/6ez1X0qZVZ6pP7H4
 yjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021809; x=1781626609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEqauq72TLGkjzw9cT0OndMnZkUOXqb47KY3x9X+n2I=;
 b=fnjDzjCDOeRwQHLf/kWb3lT/Sgl/g5kx0PJzV9QZn3pTYNXq3DVcoJVIybQb3Qqbve
 EeO8khVwWpD0Q6gnIsuWRKGjBfcQM0e6UMtCbmSxwUJzzfAApQnL2j15ssikHafpuRPJ
 b2db236ZM2iqyZW3p39ruzFmYnw+j0TbMj2K5NZtvammOBY9YX97czkESk1HbhN4Fium
 w3QpvQAye0mEEvZNveqI4Rhj2SWs2LKv1ZbmdBx+BgERcUE8HLczKK4h4j3Cy3a32As4
 Yf01R562tzo7KahZsa0cz/HO4gh1hrgnNxPfmnif3Wj8OkBflYBbSgsWFsC18e5C7lOX
 Qt0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8E8pJESDhbVkfMeL38PZkShsA5bOjEUHvnFbqyAf2sLJKe71SHN99K7x2iDsEvprs7Yo5JsMdgcA==@nongnu.org
X-Gm-Message-State: AOJu0YxjlKeM11TbXLPmUjavdjKSSIYiUiDvLjfZ/r3fyRymKNxVX7Pa
 fWgTuwN0O8gAcnNkjQkntGK0MEFKnt9z9WO2Mn5KPWUYhKOp/JxLU9Nu536dwsIP+eHmfoAnpjV
 kt5jssXcTOY3uP25fgBH2DP7GY+vqBogYIljNYzYv+Q==
X-Gm-Gg: Acq92OFBJyzXp8AuOC5enH/f4PCj8mHjB7dkrEMjUe8F8AdNzYDhA3DermtWgAUOAmy
 TED0OTZgUVRTGFELQ3nxzi/DP9BUzxOo8sF3PXyuQMV5VNIan4dcpwaIN9Mz2FHW0RAgZ575x94
 Y2wF/b9qq6GPn4q/BDURg7tt6CYSKRl3bJOdtLpr65l4l2O/OBMG4CT3DB883/tydOAbPJ2Fi6F
 YXFcI5N7OhFiZlzdg/vYwrYDon6IOphZi7dtjTIf4NiZH9gZ2g2edC0CD5Bve5SpP0Mg3NgGe5E
 X7gnO59s4QJTHcP7JaravkG4V3kxBr0woGnsWT9elJjh/9ARvX4Q6ncV0DLrDljwILkjfhXCk8I
 j7w==
X-Received: by 2002:a17:907:a4a:b0:bee:7c9b:fbd1 with SMTP id
 a640c23a62f3a-bf3a68ee6f6mr846975666b.1.1781021808726; Tue, 09 Jun 2026
 09:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-38-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:16:34 +0100
X-Gm-Features: AVVi8CfPTYJBhk1Wajx3ZkHr89Mjyjll8BC-2Yfm3-rKEJYXEC7ITeVYzY-9aXQ
Message-ID: <CAFEAcA8AjjV8iCR4WjOhYGCnxFPdr1JAa26=LAfdP9E5NRZg2Q@mail.gmail.com>
Subject: Re: [PATCH v9 37/45] target/arm: Implement FDOT (FP8 to FP16) for
 AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Wed, 3 Jun 2026 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 ++++
>  target/arm/tcg/helper-fp8-defs.h |  3 +++
>  target/arm/tcg/fp8_helper.c      | 39 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   |  2 ++
>  target/arm/tcg/a64.decode        |  2 ++
>  5 files changed, 51 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

