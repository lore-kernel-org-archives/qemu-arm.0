Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1191489dyc;
        Fri, 4 Jul 2025 05:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2H61R9DTm9AbaxAkt3t5F93LqIdU1rjBUbNbIoGfERGB06bz1zPo0JQthh242Cw4iyoo7/IlO9Z8I0w==@linaro.org
X-Google-Smtp-Source: AGHT+IElMJa0jV1KW24bXjeTd4akRIVplJv8RtvzO+LF2nPJsXA19hrNtJ1TN4kfemwaKW6J1Nfq
X-Received: by 2002:a05:620a:d84:b0:7d4:295c:884c with SMTP id af79cd13be357-7d5ddaa7f06mr332615485a.7.1751633982725;
        Fri, 04 Jul 2025 05:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751633982; cv=none;
        d=google.com; s=arc-20240605;
        b=O6LNkSbL8u2z+ZmKPFFm4b19+2ctnzbNWr+OTOQzymZN617mkjZP3gCEHiyzi4mqnY
         /huCpbZQ4Gp8yPyzXRMsdPRErqSOoBh312uwxz90HieYJJ2bss5lJMsKDZL8XfPRPwpa
         FwscVyLqrg9tJ6Xl7bagiL/6Df2cqbNN47aD68J77tzuAH1G1EzwCHyJAn2+iXutTKER
         fxNMdnUuEtSqn7H5W7ZqlwdQMDNBh0UIAkFPwOpxYkE/Ir5FPyOfITLV0H3sPPtNpe5k
         SVipdsH6H/xVizloAVlgrCIcUzLyhv27tiehpl6DHvbcuf93j2XgwNFfMpfvpPvLrhrc
         wcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ep8RwMJ0M9i5BPjIgEJpfQPQz9oWccG3B4OGUcUZy5A=;
        fh=faPZC5w0Ir01ovgsAAvKZ5sEGx0/RGzlhY7dEdNQB8Y=;
        b=BvVAwtbMBFIYjY7pcFlNqFXwfzd87V9ODLZX/YYrpdi7Mcf8/q3ooLuN8phR+nYS2z
         NWK0WAaJQymvJcS57a9ju5nageTfBFylH7pxSUvWiIJdh6KU/FfoZEMjepad6EB674He
         +am4kLsjfw7yCZwDeqcZF2DK3rM4YwTY0mQF3AebVZChRw7+qm/bNeGBKG2xPMSfxJWI
         gn5gDbaPqvzNUrUxWXq6BdYBGcNuJ3XatUYJ8/gE9nQuz/Vt7xNx5hsoAWQrs0QPBqW7
         LYsfz/qsl1pvHueWJ5hxkG6HbjJaVjwis1f6Xax7XIdnhjwmkNJKe90/aOpRXSBA6IEv
         bQeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjJLyuBF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9949f466fsi20656871cf.20.2025.07.04.05.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 05:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjJLyuBF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXg0f-0001eH-Sp; Fri, 04 Jul 2025 08:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXg0b-0001cK-N2
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 08:59:17 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXg0Z-0007tx-7C
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 08:59:17 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e818a572828so595123276.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751633953; x=1752238753; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ep8RwMJ0M9i5BPjIgEJpfQPQz9oWccG3B4OGUcUZy5A=;
 b=NjJLyuBFXmUJTj9CG9xsXIOdtdBFxGBN9JjFrGZjZyT4ak0BIAg+ruzmpU7Vzyv+kF
 VDrKmTXDBRpUShZl6YMTKFRFF3B+oMfjA3gxDKzSbotRE4m79PiMcbAvZtObDHsxlRDb
 XrM7B7pCSWQtq+qifSqRB4dL1c5x5F9ZN/FkiBMgljsM3LQwD694V4I45Bz8lpirCKgX
 VTzrMSMjDPogFmUVmGLwW6Hkbq7AYmUNnEEk4lyD/sCr/zNbYefdjAc55L3yY+T1P4HH
 hwd7a6UOsOcwWAQLMulLs/szd1ZKiWeQNwdSjFlL8k4eyFzaOGnqenDJqv7nIZ8hwbbT
 rHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751633953; x=1752238753;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ep8RwMJ0M9i5BPjIgEJpfQPQz9oWccG3B4OGUcUZy5A=;
 b=S0DciVYXaoe+LeBo4r1wcS5xQiu4Oi+RjdwhjAu2HCdoR5zLZWYTbSGpVNI92ol08J
 IY9HJp+nHALMZi5zaTAkBpzqUc+VbnsmkLTFN5KdcnIPe4l/qnWRSdbaWe/Jn5Ni+EEn
 EB3nTrq6o3T14bKhaDRjlU1F+/xDJNswCcQ8VbOorYeK6DC9Vu0AOuU6Qgx6NmWlQ7sR
 +9TW3AZsudS1YVBb6ARhMHc7+MG/mEhiug6vauQbxprbE4EfoNV6WLo2EkyY5KITfkxc
 9u4DS28ehPzNO0bHh/RQbGRzzStSBoYduEA4Y1IfyVkrms4Dhb08CtdnuGoGhIJ0CN5P
 jdiw==
X-Gm-Message-State: AOJu0Yz7lO92DqAuaAHF7i+w6tOTYRETdLtlpxqxKhD31c88gHO+VKXC
 nwdML1BH4aZ2vBFXjNmg1D6H/5VVpr6tqTTigTmUY76pSaXgFHrDYTevIIzP6IeAr99DCMO9L0z
 DsNpSGxe/rKoJJDSJyy4EA5CU/N82ImbeYfFMqrU0Ng==
X-Gm-Gg: ASbGncsrIik7g5azvvv1PwJeNHjlGExnJbMiErcp8uOu1GnEOq5Avta45A6FRDcC497
 OrX5R6Tl5GVF/vAhuBdxXsD646PnUOtLvzc6up6c+1Gee8ZAgFzCdLaYgF9U4pPcWwEEixjtv3z
 V/XlgYBTu0H7V1dVU4xIxmOHrZT1GxNkFaJ6TlAL8Ht15b
X-Received: by 2002:a05:690c:6:b0:70f:6ebb:b29a with SMTP id
 00721157ae682-71668d04e88mr29643897b3.29.1751633953648; Fri, 04 Jul 2025
 05:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250703085604.154449-1-kosasihwilliam4@gmail.com>
In-Reply-To: <20250703085604.154449-1-kosasihwilliam4@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 13:59:01 +0100
X-Gm-Features: Ac12FXwSac9Laj_vHcH-p-uxJpINs0H5g3o7vcUg3xomduQF3ebXgfUpIq6Bmnw
Message-ID: <CAFEAcA97cvAmtRYEr3hD-BG=LNjoaZFAThYWNKa2zok1MOxgGA@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] target/arm: Fix M-profile helper loads/stores
 alignment checks
To: William Kosasih <kosasihwilliam4@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Zi9PwoB9CtCa

On Thu, 3 Jul 2025 at 09:56, William Kosasih <kosasihwilliam4@gmail.com> wrote:
>
> Historically, M-profile helper functions in m_helper.c and mve_helper.c
> used the unaligned cpu_*_data_ra() routines to perform guest memory
> accesses. This meant we had no way to enforce alignment constraints
> when executing helper-based loads/stores. With the addition of the
> cpu_*_mmu() APIs, we can now combine the current MMU state with MO_ALIGN
> flags to build a MemOpIdx that enforces alignment at the helper level.
>
> This patch series:
> - Replaces all calls to cpu_ld*_data_ra(), cpu_st*_data_ra()
>   in the M-profile helpers (m_helper.c) and the MVE helpers
>   (mve_helper.c) with their cpu_*_mmu() equivalents.
> - Leaves SME and SVE helper code untouched, as those extensions
>   support unaligned accesses by design.
>
> With this change, all M-profile and MVE helper-based loads and stores
> will now correctly honor their alignment requirements.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>

Applied to target-arm.next. Thanks for these patches!

-- PMM
