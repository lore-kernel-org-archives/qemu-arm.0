Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp403649dyc;
        Thu, 3 Jul 2025 02:14:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqNDpnYfXWVhRe1diXlliDGa1KMSmVgsVB+6F5Kbs8BFyRHoo4duM7vL77OyuspCXZjPKeSTMvvjoyPA==@linaro.org
X-Google-Smtp-Source: AGHT+IFH/AbxPC6gcwfmq8s8s+DPECwPhTQhV9RwaBcSxk3FdFgW3zHmnIlz2IuOfpZOEZOljCTb
X-Received: by 2002:a05:6214:20ce:b0:6ff:1542:6590 with SMTP id 6a1803df08f44-702b1a53265mr87311066d6.2.1751534053671;
        Thu, 03 Jul 2025 02:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751534053; cv=none;
        d=google.com; s=arc-20240605;
        b=e62QAd56XNvxBeZfU8CmhiiUDw+O5EpMZcFFQaGZgawYdE6PK8G4pcekA+giZMsC5o
         29VoSh6mCbo2MqpnHS4E8kM+Qiw07fIoq/2Cf8LVyeN7EARBm3gai/SffrnWuNWfRMf0
         wLsMMYahUGTJIN2QO6DibWhnlHtXZrlvTd+2UgpQMVijYs8v5UHWjfDO10CXGtUQ/cMp
         LWX9+g96RgXFr0NGiGf3tlgQbHXkPEvcqg1SuB/Wf5UfFA7iKju+Q+jvsGSRfT2EXaMp
         HglfC2ZOY4354zQ1jPu0jy9KEr72SIE8NFmI1q/gg+7vORX3hMTzI+Bt3OePQdS3fPNr
         cXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jShZV7YTb0wir7CgNkRRubWx084G582r+Vo/uc1OJlE=;
        fh=DoXA2ETv7cptyGfb7liyk+TfdGvewVXS6+/uRVdMQuc=;
        b=RrNUvMMmBAXhl61/V/RvAMUVl1em8VZ8pFAQu0wdFRlUSFWFdn/mJ+uWgLllPDebHD
         x0m1UiZh7AeHrlxqJX973pPrEHG9QJGSPtdPCf3Ymw+XdstzXbmtDJxs+tY6qPt5eZOu
         LX68QbQMUWtRMRtU412WS6swWN+Aru9QjhJvW+xAUOi38K6dIKPzPc9JbtJJOkAhnsek
         kJpCOxOJZlPjkHH5Enh2VtUs5ZRUq8IiFIWzQ6lgxwD224Pue0H0YWZdWpj8wem4tB27
         fX0xEYPkmqKBRphFOJ3klywV66Ln1vramk4It35yLhXoV1eGb8GXgw6Vv6LvURwJhOcY
         Vpgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3xcAoxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773ae5e3si170131396d6.484.2025.07.03.02.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3xcAoxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXG12-0003RG-Ig; Thu, 03 Jul 2025 05:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXG0w-0003Pp-LU
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:13:55 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXG0t-0002Of-TM
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:13:53 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-710e344bbf9so54173647b3.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751534029; x=1752138829; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jShZV7YTb0wir7CgNkRRubWx084G582r+Vo/uc1OJlE=;
 b=Y3xcAoxKpv0qpA2nS2OdORPULPRN08m5HGNUFCya80H1uxcXVwWVRD2Xd/cBVJLDfC
 SF7MIlEIBL+ju243bKFTGg8GM1MTQk3ggieir4aSti/OvZ5yT3yfjZOuf3N/h+zAMYe/
 696ScttL74tqPctnP/MvjRwaMzw4qo3618XRqWcT+cvJNO3Umo2YbNifDQOBAJ3WILHt
 F3C9HRrA23VpAuo+PHtOMFq8NcobBrByzm/b8AnJo4zxhl/7n3hzhnuZ1RMvtKN4+TN7
 PEoxOE8B9CyQdpINQMFE5cSwwabSDAChcg8Sh832nxRN3MedxJ33qSVdPbQ8ENJo60/M
 Uj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751534029; x=1752138829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jShZV7YTb0wir7CgNkRRubWx084G582r+Vo/uc1OJlE=;
 b=wbU8ylOyw6pbSy5tY0FP0qvlzogBU439PzfXTY2+T3Ly1icBByUglLotD3k1z1uKLx
 NCGjW6ou2hwk9DMOFEql784fFH10aVfEjl9Cu0w40ZswLRNK3h1WpYdjrl5o+I3zx8NU
 OPYk/DSBNJZ+hPD6Os33aqo/5+i9kJq3a8bSBS8Ywyq26mA3i2ZPWfdTr31DW1urYivd
 u68rB5C/W/uOqDbdzG72NVl9SP2nAiqHRuwUPWxzzfH6h31Aw69ZTAHj2KRCHKtU0iRc
 GEFKSAFAC0itDrOfiCbHQuCn33PfNUvNtF9jxx3/QOnqlIFiRU3QA9la6ssN8oaWaDFB
 Qc3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd8zeeUbU+Gx+JQ5gl/rznoYHkuuULteO3bjdsfbXYtMW2LDSCq7M+qAzRxKGIimSFsYByINRCyg==@nongnu.org
X-Gm-Message-State: AOJu0YyuUDq2NtV1ujLw5UvEdxHWm9t3aV9RzR98C2yZSl8+5Fu2tHeN
 sixB+m8xw7CxKawwtCuxei9IldfulW2QZkY6m/ryQf9auxtjW/f3IhOFLi4YDRAd40TRZvsaMVP
 We15SsGsKbSyCVcBAR3ubde1K7Oy4lyLpNn7+hKi91A==
X-Gm-Gg: ASbGnctVvvQs56Ut3pK7Y+MiL0yD3yQtM57oqIcTOE/UpAh5PL7vDhUjf5k+kqry0Pv
 1XM2/GkbMAuc3jRv7LlHzHrnXk1Z3QxFMmMwtFUGa7Tr+9RCpRuTLGCRNMKEVVJtJBel3n9D/qp
 OzNIK50PcU9oXgj/8petrEPxIwSKbg2wUSP937l4/FObU4
X-Received: by 2002:a05:690c:fcc:b0:709:197d:5d3c with SMTP id
 00721157ae682-7164d2c7e12mr90705157b3.11.1751534029352; Thu, 03 Jul 2025
 02:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250702122213.758588-1-richard.henderson@linaro.org>
 <20250702122213.758588-10-richard.henderson@linaro.org>
In-Reply-To: <20250702122213.758588-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:13:37 +0100
X-Gm-Features: Ac12FXxHROE6WicPcu59BvDqB-HVVYixTkL3nUz_AyIcPRqHhTNHHNLyVVqSsOo
Message-ID: <CAFEAcA82qZu54fsQjfmy-s3VdzsJrGYccTQPdM7oQ0ienk9LpA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] target/arm: Fix bfdotadd_ebf vs nan selection
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: LrNQiVD8Liok

On Wed, 2 Jul 2025 at 13:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement FPProcessNaNs4 within f16_dotadd, rather than

should be "bfdotadd_ebf" ?

> simply letting NaNs propagate through the function.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 0e1850182a1 ("target/arm: Implement FPCR.EBF=1 semantics for bfdotadd()")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +    /* C.f. FPProcessNaNs4 */
> +    if (float32_is_any_nan(s1r) || float32_is_any_nan(s1c) ||
> +        float32_is_any_nan(s2r) || float32_is_any_nan(s2c)) {
> +        if (float32_is_signaling_nan(s2r, fpst)) {
> +            t32 = s2r;
> +        } else if (float32_is_signaling_nan(s2c, fpst)) {
> +            t32 = s2c;
> +        } else if (float32_is_signaling_nan(s2r, fpst)) {
> +            t32 = s2r;
> +        } else if (float32_is_signaling_nan(s2c, fpst)) {
> +            t32 = s2c;
> +        } else if (float32_is_any_nan(s2r)) {
> +            t32 = s2r;
> +        } else if (float32_is_any_nan(s2c)) {
> +            t32 = s2c;
> +        } else if (float32_is_any_nan(s2r)) {
> +            t32 = s2r;
> +        } else {
> +            t32 = s2c;
> +        }

Looks like a cut-and-paste error -- we check s2r and s2c
twice and never look at s1r and s1c.

-- PMM
