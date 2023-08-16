Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp397267ejs;
        Wed, 16 Aug 2023 07:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT0RQC9izacbG3jlAWB3YTKeZAkCzyE8c31/+RZjmj4H6/wNxeZt52/FMeks4rB7a/5iA/
X-Received: by 2002:a0c:f4cb:0:b0:641:894e:90fe with SMTP id o11-20020a0cf4cb000000b00641894e90femr1895396qvm.61.1692196071830;
        Wed, 16 Aug 2023 07:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692196071; cv=none;
        d=google.com; s=arc-20160816;
        b=ArS4epIjDpk9ff2sUAcFft4AaY2yr5Fz1g8Wt2OIF67FJSbWcpJsLSU/cLg5ygH2/E
         P/N4zSz2bXeYtmOPzAEWEF5R3vaJKpKtcVKqzWcFMdmncWMLDgO2wyUMVzPTtUJwE1iU
         fuE4YEhn1sMz3um5EA/HtT7ZVXCbebqsUg1TgKuUl5eSF/1tAHcDOZjGIwTfAYPMMO2B
         qSnUiCOF5/HY7hln/YFVgpRMr3dyeNB7RbECLfJN9QEs/ExZAYYt2hmRdFx4A/xvxjTV
         1td/0qzfMaIueX1aKZwp8TiC/NOMNT0Xo+1bnm9PmcNddnPocJKnsbr0Y9cU+KcQcMep
         azRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=F7z2E+ZFTyywXfCvtaMWwFttBwfNEezUdelxUK+khHc=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=lTLSJKdmpWcMVElI1P7X5q5+Ufw3alzatC8bhm9Bfg6scolfGiYdhqRGFHOh+dT6qK
         Eec6KYySj6MI/ul0g2EoyGlqR7pQXgXTS72JV4MaivPKvdaeymOAl0k7X7XyMrFKam2U
         spV8FQSBPg1mz9ybVP1Fx5RGZMzZqf62Fo/vDS5R21AJee24Cb20mBCTSQzRt7nHVKDx
         2IzfC/AWdfh9SyanZGPBpV4gmYbBIwOq6uYQ9GoJYebx8BC4TgEz6ZtVxtsaKqxX4+FB
         V8GZRJSJM3S/TZQDgDi12zTdItP3YwNUMB9nQsxQhtYCAATeoTAGsY6CdwCzABw2oaSQ
         6EAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b7TtlpSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp11-20020a05620a458b00b00767468da8f2si9091691qkb.350.2023.08.16.07.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Aug 2023 07:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b7TtlpSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qWHSd-0003uM-FQ; Wed, 16 Aug 2023 10:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qWHSc-0003ri-37
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 10:25:22 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qWHSZ-0003jQ-O0
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 10:25:21 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68879c7f5easo864623b3a.1
 for <qemu-arm@nongnu.org>; Wed, 16 Aug 2023 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692195918; x=1692800718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F7z2E+ZFTyywXfCvtaMWwFttBwfNEezUdelxUK+khHc=;
 b=b7TtlpSo6CRe0ElvxQqvcnIofYK0y3HjOOKx07oXjrs/NbGnbHl0bhaKA48zWjmIdk
 zZWmWDqZ/xG85Q6uSdeynpCcX5of4JPsoWfkqCazbaG6jlZogXKPopNGEGdL3pm3kWQm
 9DcfadKIaxSpSVn/u3H2APS+vnNxeV22Qctepm0qs66EaE1l4IpPkcbqkZd5zVruwjWf
 GT4iyygFEZoZk2cAPyT8lBw5cXBdgPyQ90JIRSmdCj0umdKNVwy/XxqXcfEoWvCzh9Wv
 n1bdRH4vrnLjceOfefnCWx9CCFRR2MHPtguNpRcyWn1JNWPkcfXC9aR/E+IDzA3+Qj/7
 npTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692195918; x=1692800718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F7z2E+ZFTyywXfCvtaMWwFttBwfNEezUdelxUK+khHc=;
 b=iZOfVG9A6Nd2rvKq3QRerh/arY6z3jBixUizw4xrAPO5wrqCzKZFjxlHitR1TjYFK/
 bKNAoNdC3h1TuQ6zb1Fn7BoaPav8fmA9ZnCP7bFhKeK54Z3MwTFjKi+HFMEcAoZO8MOb
 zVNzcU9CSM/79norh5LZQonmjA2TvkbbfjwEegVgmjF8v8cZmg2UpfOqAcRPvhKEQ2li
 f85WvJV/qz/n6lNMBrvYAYB5tXtSEYxDjG/Xh9tn1HyZJ3WrYP+BOeunPhaRZg+h1uQc
 SjG1jEW6w69IDOzj/8X0OKfWqX6I9lqUauk+FzSZrkb23AohNxXqjNLTlZD0BWmaSRwA
 B8IQ==
X-Gm-Message-State: AOJu0Yx2Cwfk243u6UzWDDIY5XpQD72osb77kJLM0nTkxGZouKS7a+af
 +OuOiaACUEwpWcMrnOa+dDKXZqr9zC6E9KUwJnc=
X-Received: by 2002:a05:6a00:cce:b0:682:26e4:599e with SMTP id
 b14-20020a056a000cce00b0068226e4599emr2158557pfv.21.1692195917832; 
 Wed, 16 Aug 2023 07:25:17 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:a064:e3f9:a812:973b])
 by smtp.gmail.com with ESMTPSA id
 i12-20020aa78b4c000000b00678cb337353sm11156019pfd.208.2023.08.16.07.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:25:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/4] tcg/aarch64: Enable BTI within the JIT
Date: Wed, 16 Aug 2023 07:25:12 -0700
Message-Id: <20230816142516.469743-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: n5XwmumTJtCD

Patch 1 is cherry-picked from

[PATCH v3 02/14] tcg: Add tcg_out_tb_start backend hook
https://lore.kernel.org/qemu-devel/20230815195741.8325-3-richard.henderson@linaro.org/T/#u

here used for a different application.

There are not as many landing pads as I had imagined, so the
overhead here is really quite minimal.

The architecture enables the check only when the PTE for the
jump target is marked "guarded".  Linux implements this by
adding a PROT_BTI bit for mmap and mprotect.  I have isolated
this within a host_prot_read_exec() local function, which
seems clean enough.  So far, as far as I can tell, Linux it
the only OS to support BTI.


r~


Richard Henderson (4):
  tcg: Add tcg_out_tb_start backend hook
  util/cpuinfo-aarch64: Add CPUINFO_BTI
  tcg/aarch64: Emit BTI insns at jump landing pads
  tcg: Map code_gen_buffer with PROT_BTI

 host/include/aarch64/host/cpuinfo.h |  1 +
 tcg/region.c                        | 39 ++++++++++++++++------
 tcg/tcg.c                           |  3 ++
 util/cpuinfo-aarch64.c              |  4 +++
 tcg/aarch64/tcg-target.c.inc        | 52 +++++++++++++++++++++--------
 tcg/arm/tcg-target.c.inc            |  5 +++
 tcg/i386/tcg-target.c.inc           |  5 +++
 tcg/loongarch64/tcg-target.c.inc    |  5 +++
 tcg/mips/tcg-target.c.inc           |  5 +++
 tcg/ppc/tcg-target.c.inc            |  5 +++
 tcg/riscv/tcg-target.c.inc          |  5 +++
 tcg/s390x/tcg-target.c.inc          |  5 +++
 tcg/sparc64/tcg-target.c.inc        |  5 +++
 tcg/tci/tcg-target.c.inc            |  5 +++
 14 files changed, 119 insertions(+), 25 deletions(-)

-- 
2.34.1

