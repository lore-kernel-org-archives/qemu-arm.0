Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1093219ejc;
        Fri, 3 Mar 2023 06:04:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+eoCdf764Az8vl7mIby8iDtUQmhVKMEVbs1QPslySQ1tlrrFbVAC5IQOcWQnHoCEWK2YYa
X-Received: by 2002:a05:622a:118f:b0:3bf:e471:6987 with SMTP id m15-20020a05622a118f00b003bfe4716987mr2810473qtk.59.1677852279825;
        Fri, 03 Mar 2023 06:04:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677852279; cv=none;
        d=google.com; s=arc-20160816;
        b=FgskJo4Gzme5OZXyfBeq2+bFyNeXCstDrDc9iu/X3og0MLROU52YHqvPqnDCqQKse8
         Jz//cax326PwwzaGDTe2Z9r5muBvj7n0YvYlPpBqiZR0i2GzlViJHFQZfprQGJKSKw/q
         VWOn+OGU8eoAk3Ndvt3DahZGgK5ReE0/I0mywpFn46B1YMC+PJy6VL4gEGQc+ILlNbs0
         BmfhtGuPBOsmxP+2dIY+jO8qQUahMqvyjI859aUhjfhzX6Gwn/JAxXCHtePWixuhMtun
         3vULFIZrrlsUm+hZJ4+gm5G26DplpKrpcXranODpf4VnZYhEV0BIUMSlnFURwHkYnPaV
         PcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1lb7CZq8sImzf1Iqz9TFeDKTgP9++0M9xsvkBd8F1Bk=;
        b=QoasTZLXHaUR4lNWd/OzbtHSdtEKhys0JJ6b+pdWdLYqrn3gkXbQXIKxxRNaIbd9Wo
         wGJSPMi8JNQdxduoFFpRTBaxnHBqthO4zpPRGTAfwLT35gsgpMmZZZWwXs8qXsceXx8r
         7rD1bDyFf++s6hLBgA+d+pM9RKRkN+E35QyjBnsAiFy1cRrVJehlk/CUcOTrvd700bbW
         BaE5wuiUkQfA0jTFHZPNfSarN0T6dUiJHQW8Wqja66aGn8Vzrefq7jLm/exlY9Kw9aCb
         lSg6OTlhqrCKWDmoWT/YfcDAN8dfiIcLOdtEQBYPaOPbAFRWPBi5D5TrRywRB1ToEs0W
         7xWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7ryU+yc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020ac87d8f000000b003bb76cd864csi1798091qtd.717.2023.03.03.06.04.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 06:04:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7ryU+yc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY60u-00065H-Bj; Fri, 03 Mar 2023 09:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY60s-00064j-Di
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 09:03:58 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY60a-0007xf-Qa
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 09:03:42 -0500
Received: by mail-pg1-x52a.google.com with SMTP id s17so1535146pgv.4
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677852219;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1lb7CZq8sImzf1Iqz9TFeDKTgP9++0M9xsvkBd8F1Bk=;
 b=d7ryU+ycWykm3mRHKygRvANp8jemR5uwqBnMncPAXYbcn3bjXodlU0o9AkONb8/Klo
 GzX3zJwnvwwnOvYmG6JGSjDDFx3rNKbuD5K4LipE8CaYlOqBgFLst2uiGUgonZW9CeLI
 yy0Ywo2uh9opboESlUA4/Ldi2vBWY1bTl/Hqf4s1EbaH1koLn2EK0xB3I9tLbTOuXiDN
 /vN+ZHobwmi+BR5oKv1nOnMUYtMds6JrMZJe4iMVDf8B8IAk/UyR1FV/Fw1b2gBKXYKf
 9focd7DSs1qWdd/atI9SxIptyPPMVRU+kDZL6blW5Whe78N+koc8mxdaoOPmWI/anWwx
 MrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677852219;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1lb7CZq8sImzf1Iqz9TFeDKTgP9++0M9xsvkBd8F1Bk=;
 b=3bBnMzoTkHBsiHcjG/HMmYHbn9kgtAJtdd71h+s9EPKVNnYXxFGLcMgp7O9qcFCw6f
 vwNtIghNTq5XxkJOUBWFGwB0MiJg8c0482vxgiLk2z4kgCFRfZkoBKAnTS7T1jWfsaN3
 MBFMDau3mZTnoUm0kb3oFIBMRb5VAxdIuVScGoAN+rMj2e+H0740dJ8HOmvQpCNNyeiR
 ZPS3XB6FV4yxGfLSZIbnj1Q89K6V9IVdJYtti7qBIx1mV81p35x8nn4obGgaqIaQoj+j
 7A5hYfBSbnsEp+OlladjAxlpC39Z9zxHH7eoV+aPA+OJXxTDDf4uw8r4g/WdN08sNelR
 YHlw==
X-Gm-Message-State: AO0yUKXZ0fyzRgEI3deANXk0E9+5CPOf7O5Z9qtm3PqlliZ3PsKji1MQ
 XeonR5pH2cWy48vd95iHTfpE76qAmEKyYCzwgh1nQQ==
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr514634pgb.9.1677852218976; Fri, 03 Mar
 2023 06:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20230227213329.793795-1-richard.henderson@linaro.org>
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 14:03:27 +0000
Message-ID: <CAFEAcA_L-62NjxXmRXZoAwwYGN2KrZ=h_MVGbxWhO6L0aA677A@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] target/arm: gdbstub cleanups and additions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fsmwUBiT+own

On Mon, 27 Feb 2023 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is my pauth enhancements from last year, the corresponding gdb
> patches for which are nearing merge.  If lore and patchew are to be
> believed, I never posted this to the list, only pushed a branch so
> that issue #1105 could see it.
>
> Since the cleanups there conflict with the recent m-profile gdbstub
> patch set, I set about to resolve those.  In the process, I merged
> the secure extension code with the sysregs, since they're simply
> presenting different views of the same registers.
>
> Changes for v3:
>   * Drop write paths; there's quite a lot to reorg in v7m_msr, and
>     it's not clear what should even happen on the exception paths.
>
> Changes for v2:
>   * Incorporate feedback for pauth.
>   * Rewrite m-profile systemreg and secext xml.
>     - Since these are Known to gdb, do not merge the two xml.
>     - Upstream gdb only knows about {M,P}SP, but David's extension
>       to include the other registers makes sense and Luis confirms
>       that it's ok to have extra registers in the two features.
>     - Continue to share code between the two xml, but separate
>       out the mapping from gdbstub regno to internal enumeration.



Applied to target-arm.next, thanks.

-- PMM
