Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp42972ejk;
        Tue, 28 May 2024 08:54:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPaVISiHnLGkqs6UO8PvyoluKktSDkb8wq/7NrniBlPrSHZQ0hrVHgikZ/Tk+ZTcozsGw6z45OHvDpLCZPnY2bijwivQOV
X-Google-Smtp-Source: AGHT+IE3pII1EiR137l1tQyo6BCfZnAJyfX5Wpp6UV1IhOD8o0AKl1Lzf4UV1azP47Qo4So0dxvr
X-Received: by 2002:a05:620a:3b92:b0:793:1766:c482 with SMTP id af79cd13be357-794ab075df4mr1251980885a.21.1716911640216;
        Tue, 28 May 2024 08:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911640; cv=none;
        d=google.com; s=arc-20160816;
        b=PqaRwVp8MVEGcgx90f//BLerC8k5aKoSFHYZbklqECdO3gNsKbhvDrpTwvDO3b+QpA
         lZPnmMcKYwOSvKNpwd7/jnyBOIyDS46bLhHDS/QhkBr2Hskx05SgJGny5v93g2T0YyNt
         azEVx2LosaTuFffXjzPl3Z+1R/uscmx1OX4oMW3i0mX5hgzvLpaE54K046Wrgbj+F0FI
         sAa+ql3qnU78BwhhsJv8SAdtv3bXlQpmsm5v+53RII2XX1SftlsfZ9LBNTYYfcEk2bib
         Cw4HQjUFzfijOqvnUVxTZVhr43Km04sK3MOfomruU5yvjB3Q5ebXVkxUoDCNb8rWI5D2
         D73Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3kJEO62mWg3US9gjJ9OfrPSAyd/LSSHwxTOOro+bxno=;
        fh=hd83fBjF9a9IWB5jhnjB3jgshfv5RQL0tKMXmAMWTm4=;
        b=kqGxXNDrDLq+uprRyQeDqyuUK6nLHQ8CpgPnCn9p9QyaShB+1T+n+uigocUf4X+dne
         ZVvBv+ynukcHhYz3tlQI3t73qEoykHVCaqYF5A7uY+3zRUDec3ZB5zWAdJ29nkBEDcMP
         AJv0RRE4R0TjSAtYYmdCCWgyPOB69DYA/dLPZn5MYR1IOKAHCT1XrBhZTJQHhEdmFe6T
         0JIV5sQpxd0R2SWXSOvss4kHcji0VXCbpREV6YLzXXLqOVXTJgfX+kMvKrnnR7NcvX8g
         uowAVPlsXjLaS+FNJzYew2heHgpkAQ+AJo+j6zc0GZDuAsx6S1hMFj/DxFLOWZS6PJ/E
         f3TQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDu2voBa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd3d727si1041307585a.484.2024.05.28.08.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDu2voBa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBz98-00036m-QO; Tue, 28 May 2024 11:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz96-00035M-VS
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:53:52 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz95-0006e3-AX
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:53:52 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5755fafa5a7so1309160a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911630; x=1717516430; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3kJEO62mWg3US9gjJ9OfrPSAyd/LSSHwxTOOro+bxno=;
 b=uDu2voBaWhraEJRStgwiyrTqvmCr05lce7fgGKNQq9kX73ZCTUe2niaE8o0ZRNWE0Q
 kZmgrQC9Soh5lPC1pTp/LJPzgw7aEH8i28D4Xw3R6cappyrb6p+QFYErPJnxPW21oeiY
 SkaWp6KxTITDFshh8l/UjZS25ThdG3K6vgE6p+MNu1DFb03bRWSp3knmQSM6V2j6XvFD
 yhW1kj+PakJW1hO32A7Dx/tegaQuetOlyUF62sXKssgqt/g8Z/sov+jFBnmc2naV5E+p
 RLa4Fve4R7Zt/c0lIMot3xDE/l8+k20T6b1xd6OwKPGAjKeBpbLi6KKudNjlnItDyRn/
 +NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911630; x=1717516430;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3kJEO62mWg3US9gjJ9OfrPSAyd/LSSHwxTOOro+bxno=;
 b=ePQ0hd+/oAkzztCwpPwdI5akUsjyXHkw+XRVL3dBq2aw4BHUfrVj2OTHMf+nGB5f0M
 karHpU0M2kBdcNxEiEuFDcjT0oDoVboN8K7coTglj4Z3QuLu7iJPYextxVpgeS5+LAOR
 GRe3c7eqZszbbLnU8F+7WkPYJ2EpXZBGayqrHRCtlWMKTctxWQvmAxKIMi+jxRAY+O36
 zSFsyAKYi4HRuYqZaOzrV09x+zyL51ApWQm81QkOWTg6q2+byZ0Yltrw66sHF+e9Wkl6
 ++a1M1EIgiAwiOc2t226h82VwdyTIV6hLZGvJnhg//EBAfNwL5lGYrdrKZnKIJ9eHmR2
 s4UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEainslq/aiaiSLgJQ0ZyZvW2XAFb1xNXkYKmOWHrLvccF/xNgNL3Y6OqeJsT82sAnQ2Ktay4PTUB+52SdjVf989HA
X-Gm-Message-State: AOJu0Yxh2FGi9EIOs9/WyuvKNW0Qf4sWS+VOjMt0xki520tVf7sVYXB1
 WjUqoOEOpQ7+2CLxWJnqOBMnzubRL8+DsD0hBvtcJz/YyF7+k0MefUaH7t2UmNGICi1ZM9oBl4B
 TY0pYVPSwZ9JwiBOxeUVpOm/smHlmWKZ0GpEUZg==
X-Received: by 2002:a50:d49b:0:b0:578:5635:a24d with SMTP id
 4fb4d7f45d1cf-5785635a4c2mr7980626a12.26.1716911630053; Tue, 28 May 2024
 08:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-48-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:53:39 +0100
Message-ID: <CAFEAcA_zkFzbxNXmyeqrp1Gy-xOhbv6OW5ao6rC_WtYP3VXqaQ@mail.gmail.com>
Subject: Re: [PATCH v2 47/67] target/arm: Convert SQSHL, UQSHL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qSsBImj1JyQJ

On Sat, 25 May 2024 at 00:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  4 ++
>  target/arm/tcg/translate-a64.c | 74 ++++++++++++++++++++++------------
>  2 files changed, 53 insertions(+), 25 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
