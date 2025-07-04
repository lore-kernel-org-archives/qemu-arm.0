Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1290718dyc;
        Fri, 4 Jul 2025 08:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcnP5ri6mCNko3ENBc031yoBeuqjlHKzByrSs7MkHdWbzmcWhUbBrtjet81ZT2A02Cxt5TG+bfczf3qA==@linaro.org
X-Google-Smtp-Source: AGHT+IGacCXxeomGA5SepPPOGnBRlVITRTH+q11LzEmZUsvr0AnWIFalvU5ht5C+tS4K8SQCZKJk
X-Received: by 2002:a05:6122:8718:b0:534:8213:af78 with SMTP id 71dfb90a1353d-5348213d3e1mr1474198e0c.8.1751642888076;
        Fri, 04 Jul 2025 08:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751642888; cv=none;
        d=google.com; s=arc-20240605;
        b=Aye0BNONAn+i9wb1fvBKyneJJMo5TgtU1nl/2rLjokslQdsKNs+gC1FMxjNwxF/afK
         oN4Scx7F1nV4Tu/DcBhu1xoOt0hE25e8ypNHXDJm11vDtrn9QMfqRyvgu7gfz3Bzw9Iq
         B4KyquAvym2KWCh4y5LRQWeHTXILduPxddWHArGrl1tHNak0zyUkJ7oCUWRsPpYhF2i1
         S26S60YIi7mB2DaHI2I6FB/IxzwypWZ8ZcmNGwk2qHYhPTOklfS1PkaWOa1TynYVKcQz
         VuGmoyOo5Yju5O+pSFqu6iZmHNMTqrcfAey/n4TgvB9Xhx0XqaTBY0bWX3oH9YDWW2KH
         3xeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wnKi6BGNPRAYdbfQ5l2XWsHT9CI8r3fC1Nw+qXLLGMk=;
        fh=6kw1FPqo9/hG14Ai14dIQZM2JpKOGuVYvFIS9RSxcgE=;
        b=gBV+hRr5an5xlo0g9RliDb9Jhnk3cQNcYVnpgUlT/9uc8Mglt9AICBJzt8eOHHLOPy
         AjmUww/z6Puqh0T5hOndPQ/zW24ZICqwriVnmmuNhqKKqVEBgHiR9HKQDXUZa+w6aZa5
         ESswRFRsdIyPcfvm0qXOj2FzwATI6ME8qqukzwJrkv3JB19RVEAisPbk8aK1UPS/cRZV
         NpV8SV0EgOg4SMSynpsMhGZ/3Ni7clGbrfHFMEvJwG/hzg5rF92d6WktIZeSqynaYZHD
         gwQAb+9NcFJgDoli4f2S4XHw+bKm4NTeJ/prqS3nqVDIQVxaKeteZQ0ojhsaFt4B3A7a
         j9NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+vZNAkG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5347913d5d7si724121e0c.214.2025.07.04.08.28.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 08:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+vZNAkG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXiKV-0008W9-1w; Fri, 04 Jul 2025 11:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXiKT-0008Va-EE
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:27:57 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXiKR-0002P7-I9
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:27:57 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e740a09eae0so1009739276.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751642874; x=1752247674; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wnKi6BGNPRAYdbfQ5l2XWsHT9CI8r3fC1Nw+qXLLGMk=;
 b=J+vZNAkGVSIbozW/8CqE8GeCbGVhji/bpXd8mebPN33I04SYsxQpOie2AnxGrAJQ83
 8NIivY3+5uusse0cS4qgv3u+p+B+R1co/fIwyCNMsRKdygDZEnwMOJOz0IYIgksdvxzW
 PpPIziUDL0fmH60g/pAHXU0+W107co5UQbzUksdqnSoDTivG3SsHxP+9uEtDkwSfcqb8
 wbNnbCPxkQBeC5I+8xYsdk2qaqKl0poho4ZA6aV0w06u3wXC1vVQ6Em7Il9YEQw2edxS
 r//HJjHAohKZTPSrLVhrnhndGNtgc1GTNIROKX4Xw9v5Quh/nWV3I+B7Plb7qPjbVGz2
 KMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751642874; x=1752247674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wnKi6BGNPRAYdbfQ5l2XWsHT9CI8r3fC1Nw+qXLLGMk=;
 b=tUtd3w9veiPT1ayvMfWro6T4vQZQ5zCB1d1q2Nm39gnIlUU+Q+F47CPoxUsSTyNrDY
 jK/zpfbWY/1byI57Y+cJRCF+ihysXKn9hyNtFM/4B7YltYbIqvMVgxlCIT1pEjQYYSWj
 cDURTlxHDT6+Yy5CD5jof/SjCp3O+fcAYthQOdnbxxTCCuocdBwrlLAMAncqsFgyp+2C
 XZscf6UmCqdr5yvWNafUpj+ROxOlvmSvd5ghuLsuc286kMPE8Z9ADZfjiF4wc7cB5LDq
 a6G8QT0JvJ3qE2/gG5r97/HIwXpWVeOoJIOn3fbVM7gkvyZlvsaaKJUiRkhRGGDTc9HV
 vAOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU07GSQTvFc9s7UjnNZL/fQLVtY0jfuh1GXFXaRwxJEam+MUCrc4ScqKeLrjv5YB4NXTWZ/ydnlEg==@nongnu.org
X-Gm-Message-State: AOJu0YxDG32yWr9N0Jrwh6OxikwEbxCovLUO8vw1YEbXvoXPkvljzEIx
 hy78an8NghBzV+5OfoRAEcuSjppFgg/gOx3PxT44BgkXo87kxYPSUU8PR9/NeWuHt7JxaNNCKgV
 tqylJPKWW4GQ9liOXU5K82Sf3FFoDiTtBlVLRGhDzuw==
X-Gm-Gg: ASbGncuDeTsKAXAXXjp5zP62wP4PjKCuy+AKfkwakY0fpwO0KFZ/9LeR2/m1X+UusjU
 LHFm3a1+/2N3kEGTvbmzHTTWJKAP6Ql8CiZuFuBvxZcb3jkfOoqPwz/wzHa37+oinTEzhnzK/gN
 scMgkxbnQiHfwsqbeVdTGsE5w14wxeBFCMgq/c0tmHL/vC
X-Received: by 2002:a05:690c:b84:b0:70f:6ec6:62b2 with SMTP id
 00721157ae682-71668bc62f9mr36686157b3.8.1751642874118; Fri, 04 Jul 2025
 08:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 16:27:42 +0100
X-Gm-Features: Ac12FXyFl923Fo499NOKD0-hDSWLws1V5S6YQzJw32AWIcX70iqiLyPcMTiKx0w
Message-ID: <CAFEAcA8r7+zOj8t8hHQNorFi_M57ekC_PE0N8-pd-+e22tqVOw@mail.gmail.com>
Subject: Re: [PATCH v4 000/108] target/arm: Implement FEAT_SME2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fd/WKVMaMLvU

On Fri, 4 Jul 2025 at 15:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   - Combined with "target/arm: SME1/SVE2 fixes".
>   - Updated for IDREG changes.
>   - Introduced vectors_overlap() in sme_helper.c,
>     for use with the multi-vector operations.
>   - Various H() macro adjustments per review.
>   - Dropped the premature optimization in PMOV.
>   - Reorg WHILE patches to not break whilegt in the middle.
>   - Replace DecodeCounter.stride with lg2_stride, and thus
>     multiply/divide with shifts.
>
> Patches lacking review:
>   009-target-arm-Fix-bfdotadd_ebf-vs-nan-selection.patch
>   041-target-arm-Implemement-SME2-SDOT-UDOT-USDOT-SUDOT.patch
>   059-target-arm-Implement-SME2-SQCVT-UQCVT-SQCVTU.patch
>   061-target-arm-Implement-SME2-SUNPK-UUNPK.patch
>   064-target-arm-Implement-SME2-SQRSHR-UQRSHR-SQRSHRN.patch
>   070-target-arm-Introduce-pred_count_test.patch
>   072-target-arm-Expand-do_zero-inline.patch (new)
>   074-target-arm-Split-out-do_whileg-from-helper_sve_wh.patch
>   090-target-arm-Implement-PMOV-for-SME2p1-SVE2p1.patch

Reviewed the remainders and queued to target-arm.next, thanks.

-- PMM
