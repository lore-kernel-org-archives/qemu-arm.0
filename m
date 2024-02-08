Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp218016ejb;
        Thu, 8 Feb 2024 08:26:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmSWVdoAg+lG2M+m3p9ZedWKmA0jVq1DbzF2cpaWfR8NL3a3fE8q9IRZeYy6MyftZXvvd4
X-Received: by 2002:a05:620a:1aa3:b0:785:9a41:5525 with SMTP id bl35-20020a05620a1aa300b007859a415525mr6907830qkb.21.1707409490604;
        Thu, 08 Feb 2024 08:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707409490; cv=none;
        d=google.com; s=arc-20160816;
        b=zJmAm/687mxWURGkTKGhHB3aVxeV7QNcsS0UzijjyELf8iU+RmC8qUr3rTicGBxGi9
         mSok3OzWdoIx1Hj5XPtGu+opHFfyfwZYvQZeb9htppIOeuD2LSFbrjMQ2Ja3I4w5f8uP
         /M135sGLGGh96j7PNqH4p/Dg22f7JQ7sBwN+O8mF4zNz/6OgOVlfK3lJW0qpTup8AyX8
         xQiet9lH+jbkY2moZ+tFU8lyhskiMV7JZ/E1xYjAhdp3xcdEqo6e+KlznlvNMqvngDNb
         IqOMTzLjyMmkNVhVCo+Gkih56UuXrjw2SgMUTa2OyLJ40efemCKzq3ATvynorC9ryuHu
         Zc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=j1/3N8kqMv5Z8EP+nClXyaiPRcwz8IMdFCYnpkvoizU=;
        fh=LY33YayVcE8YLZ+ya3Nwpvz+UAEIQKnlRZq/rMhALFo=;
        b=aS2rJ8gPCWx3+wOQ6ZD3gnue/fLjiVJhJgP1jSaUwwQnxxSxtcwNe2qTVMxYH07eFg
         IQ87uyoDg9DbOJp4kuKnZqcpyLF7/69VEN1XoTUe+tr3vvzWSb9VdGjBmzlZqVFXYxd7
         3jFhe1op6fDtDOnPfVBoASSJkjBukG0fCuzoz48eJfGgryKaLVLNgjXuh1GhX5yH9UHy
         mxaKAipcTdUhiX15wWaLs2w4TwDs1O7L7f+1JosNuMJeXoz4Lpqs7YScwmRD8/msLXFs
         YyRZNNBcsVfi2KI0SSeEyZTpXp8ZjMDPZF/8cqhaDTdrJ9OsusXbbCmqAm0fe1Hg+IAP
         yJnA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ED1y5Au8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWXHC13Sjw2lRkDUAJC5jeb1NNZZ51IMF2SnsO5oy5mTIptl7N0RhN+diGmQ5cxzzxLIp2tLAFNAWx3IHa4XJtWK/pTqMnh
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20-20020a05620a067400b0078553972245si286389qkh.266.2024.02.08.08.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 08:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ED1y5Au8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY7CN-0005vh-Ad; Thu, 08 Feb 2024 11:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY7CD-0005tM-CR
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 11:24:18 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY7CA-00043n-5V
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 11:24:16 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5605c7b0ca2so30731a12.3
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 08:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707409452; x=1708014252; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j1/3N8kqMv5Z8EP+nClXyaiPRcwz8IMdFCYnpkvoizU=;
 b=ED1y5Au8cmoMxgIGp49Sg9SW3MFN0A9SuyD02vhn/Y2+h63hFgMs8nBNSL/QEh9JRa
 kOXlKAKOyXVRBaJsRzMYd1rPjbfeP8KDf5l8e8qCx9jVUR8G+OAXgyBUlXNMqvyWj4FA
 LIlcdSMGv2HV4SpPXqYOAE2Ti9OeNisprtFuOMuAOCvZRuVlXW0S2/+e8Z6MXpxtewQ2
 M6BMqdAqW+/xIjTSf8PLnn4J9CbQ0W4pXKaj+I/4MD/kguctqiZdoqif5bRCEYUz/MWD
 98+WQy40ruF2poFQe/MD7VjzLOyAcZn6JlA13Iol8iqWDpN4hqAU0B2keAzYdjhZn15S
 fw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707409452; x=1708014252;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j1/3N8kqMv5Z8EP+nClXyaiPRcwz8IMdFCYnpkvoizU=;
 b=PsnWMs3dehi7u6WMPMC4kuplhW+QW6U0O9WhxknvXom+S6amUgKC+TEgJNMMQ+GU8U
 zqGyWEGmwLU684fRDie3hNr8YT3DvZKpdXFCBJSfB7EQOVAwsKPMBKI+oY5N+GvprF1Y
 oIgH9Zm09Zsj46gpc8icOb5z+EWvgUgRVnIrkdqi/JnmN5EFDkTwJqIC+AeDmNUPlwvw
 CuuLwinJN4UzR6cJpiM9kuutAt6OLRxdmttaH8VFrl97QxZiO09oIScVSRy3pojVPBPM
 gSvIAneJ7rCF0bdMD4RR58jgNwplucOmz1hs2XNHbSTsuweZTOphHZ8uYUPuQPlLtUBg
 oR2Q==
X-Gm-Message-State: AOJu0YxguRrOnhdSFMG26e4IaT885tQpUmCSVDOcBfWpW59d6X6/ZzsY
 nYfFn7MPlM8gg+GSxVRxlsgvtNRBblEZpHqhTZ90bxSNn2vIun/oAwOMJg0FBZo/KkHrj+2c1Si
 DBYTlFFYGjgkDnyCTydENC0Ox4J+yOmMonLM3dQ==
X-Received: by 2002:aa7:cd04:0:b0:561:1214:c9e5 with SMTP id
 b4-20020aa7cd04000000b005611214c9e5mr1475075edw.12.1707409452260; Thu, 08 Feb
 2024 08:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20240207025210.8837-1-richard.henderson@linaro.org>
 <20240207025210.8837-3-richard.henderson@linaro.org>
In-Reply-To: <20240207025210.8837-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2024 16:24:01 +0000
Message-ID: <CAFEAcA_aVb0a3=fxijwwrQChXZ1MXRVyx9ChCHSDMEjQcMYrsg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] target/arm: Fix nregs computation in do_{ld,
 st}_zpa
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: ArcUXnKvDC8O

On Wed, 7 Feb 2024 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The field is encoded as [0-3], which is convenient for
> indexing our array of function pointers, but the true
> value is [1-4].  Adjust before calling do_mem_zpa.
>
> Add an assert, and move the comment re passing ZT to
> the helper back next to the relevant code.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 206adacfb8d ("target/arm: Add mte helpers for sve scalar + int loads")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
