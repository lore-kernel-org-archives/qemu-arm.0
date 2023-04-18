Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2449669ejm;
        Tue, 18 Apr 2023 04:45:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350YA1Sbj/pOY3Iin81+eYi+GsPon0w3GZ2Vh8nruSomcDAH/NGibcQo8SpYO1HY8VV8/jqVM
X-Received: by 2002:a05:622a:14e:b0:3bf:e13e:438f with SMTP id v14-20020a05622a014e00b003bfe13e438fmr24532086qtw.36.1681818349373;
        Tue, 18 Apr 2023 04:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681818349; cv=none;
        d=google.com; s=arc-20160816;
        b=CIA5osZZzP1ArAOOArxV/6rUGdz47pu1oGwPXEHM/cEkI3FWpkmhhbN6SOuQcOUE+H
         YUszD+p9Z1QtbcM+BT+Lev/k9XlUl6uViSnaldfmKyVk/CeZUy+j2ojhxHEMDKAqBgjM
         EfRwjaXpDJKTGi9Cv5To60m4Cn583Z55z3zVMcGnKzPSjFJXpLeNpkHhGAOSPyYlBA6r
         XKCmRJ8T+F0AWcxB90AESzJLpnzU7C8ItwHqhAqgMinNPxSQoDp9/CB3NdoiS2zdz5IT
         zr1ldB69qa7zLAxbxN4yGgFjZ4zMU9HiYszqQDQ29VSWLqPtQvjWRg5pcoae0ZKTqK5C
         59Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=o0Wilez8/cw835muYLMtmz8ZfTD8qyciv1AzCOhh7Tc=;
        b=vmXPRnc7e3WDL0DdFNezRh4780aTXP9KVILxCbJ1UxYtO95a82Ktq4EutwvFQ1m2nm
         Mj3XgORd8TxHNPxDi34Ri620zVOpKuMHG6/Sm+mV71q8Ici1A/3tmiui1yJRQ7K7O9Th
         KcpCZzlN66Y7u75GQTbDIUZmyXeqW1ZgPFPYB1Yex/U51LFksLUnuQu0cwB0OwEZG22y
         q/8INpxezaBWjr+1ZM0z9PJPlEKUYlRncZCrGW0Lg+XXpG0SGnkjmJU2KM0KT3A8Zj8w
         BVpx2JC/wr66tEZwh90expLP6n1cR8SuA4qv1aerZq0We0xoV7ogME75M8zbXWQbAfCp
         9Q7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yZQ1bSDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a05620a2a4200b0074c54ad7f22si2082388qkp.720.2023.04.18.04.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 04:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yZQ1bSDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pojmB-0005ae-K3; Tue, 18 Apr 2023 07:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pojm9-0005Zz-Mb
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 07:45:33 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pojm4-00032c-Sn
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 07:45:30 -0400
Received: by mail-ej1-x62e.google.com with SMTP id dm2so72494813ejc.8
 for <qemu-arm@nongnu.org>; Tue, 18 Apr 2023 04:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681818327; x=1684410327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o0Wilez8/cw835muYLMtmz8ZfTD8qyciv1AzCOhh7Tc=;
 b=yZQ1bSDlREHW1Ygi2yMBhUfduLgCj5y+V9/2dhYfDP9ZsH53CUktieSyvf81RGTavR
 juAl2Z0LFn9/THaKJt4+mQyzvO7oCsMBaaw81LIyWX037qHSqPbL8IVkzZi4i/tgv2lU
 AktZdaoXgJtdGJjS728Cr/ELr9vAF/HfJqnSEaaecBiUnGxmTpCIlo50kIWKFWxlJeRe
 jBVSa+cLFw2X1A7oICIUjeV2dG0OJ5PdCdHvqb56FM7OqSwrgL81Row27VwEJDcSStZX
 Uy18A3ukS1/m8cZqvPsyXa7F33VEgZIy9dMIYHahu9YNK8Wb2a6CHDmXz79yVwJhGBpr
 v2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681818327; x=1684410327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0Wilez8/cw835muYLMtmz8ZfTD8qyciv1AzCOhh7Tc=;
 b=k97/6kaZcAFbVPoMPnbWJwtZd21rNK4TrHT4NQ0kMGE7n4sNnAXAcpeKiMTEz0/1nU
 gCB0vS3fZTt/ab79msceCYEasZLyoheJNEjudf2w57PxSxijGAKfULx57T/ZdcGiFPMn
 vtSjsJeXUVue0kxOzD7iyIdmfBC6PsG1ZB7ycxIky6tvobgVv38iTuQmqKFkF/0qNQCs
 +QwZrtNHOVfrXK6hZy8Fco5QWpiwYBQ9meHZt5qGUeH2ylLwpIHqIMDJXXzRxuTpq6L0
 +M47L24Yl+5VBxhIuvItkcMOnTgfrmnSE9jrdjGNeu045Il5XdJu9MjJo2Gr2oFxxlDC
 g/yg==
X-Gm-Message-State: AAQBX9fgsjVhh+Xgjz5acMSJUET9vW3ou/oeWZ/RkkUMTQt0Vu55AGuC
 ubwpRwnUGg3e9VFwJVhQ+50v1RW8mPx5fiecH8n9TPtLl5JqRKqV
X-Received: by 2002:a17:907:989c:b0:94e:aa09:7618 with SMTP id
 ja28-20020a170907989c00b0094eaa097618mr5317638ejc.2.1681818327004; Tue, 18
 Apr 2023 04:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-4-peter.maydell@linaro.org>
In-Reply-To: <20230414160413.549801-4-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 12:45:16 +0100
Message-ID: <CAFEAcA_oKZ1OCj6kuRdA6=XyXZDwuRKzPQXRu4Sx3zF4AxE7tw@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: handle ipa_secure vs s2walk_secure
 correctly
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: TVuuxf869uEB

On Fri, 14 Apr 2023 at 17:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In get_phys_addr_twostage() when we set up the stage 2 translation,
> we currently incorrectly set all of in_mmu_idx, in_ptw_idx and
> in_secure based on s2walk_secure.
>
> Here s2walk_secure is true if we should be doing this stage 2
> walk to physical memory. ipa_secure is true if the intermediate
> physical address we got from stage 1 is secure. The VSTCR_EL2.SW
> and VTCR_EL2.NSW bits allow the guest to configure secure EL2
> so that these two things are different, eg:
>  * a stage 2 walk for an NS IPA done to secure physical memory
>    (where the translation table base address and other parameters
>    for the walk come from the NS control registers VTTBR_EL2
>    and VTCR_EL2)
>  * a stage 2 walk for an S IPA done to non-secure physical memory
>    (where the parameters from the walk come from the S control
>    registers VSTTBR_EL2 and VSTCR_EL2)
>
> To tell get_phys_addr_lpae() to do this, we need to pass in an
> in_mmu_idx based on ipa_secure, and an in_ptw_idx based on
> s2walk_secure.  The in_secure parameter follows in_mmu_idx, as usual.

Looking again at this patchset, I think these changes are right,
but we might still be missing one -- in get_phys_addr_with_struct()
when we set up the ptw struct for the stage 1 walk, don't we need
to look at NSW there also to correctly set the ptw->in_ptw_idx ?
At the moment we do that based only on is_secure. Otherwise the
S2 page table walks we do for the S1 page table walks won't
honour NSW/SW correctly, I think. (At the moment we sort of
do something with that in S1_ptw_translate(), but it looks like
only by saying "once we've done the s2 walk coerce the result
into the right address space", so we won't actually do the s2
walk itself in the right address space.)

-- PMM
