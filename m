Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6ECCAC5B1
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 14:28:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1mx4-0006Ju-QW; Thu, 25 Sep 2025 10:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1mx1-0006Ja-A6
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 10:28:03 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1mwu-0008RR-Ec
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 10:28:02 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-635283199a9so445271d50.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758810471; x=1759415271; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GewQR7/+Qt/2Fj0Kd/4s+T4SM+9lkrhGhGb1igAvpsc=;
 b=kL2xXMoQyoJnQuFKWzwYnhUARqWulo8NGW+fzuFIytxDDp6qnvmlVhJmvt9E1VJbum
 P4CBZFu9F/jG+LfXly0a0bruW6ouhXuuHoeQzloZL1VPrZ4DAK2k623oPg5vFBjq1f20
 CAe94XKs2W8ijnXprUUXbyAcEE/1MOLzjC90nzK0h53I/knLUG+SdUVy+wJpRXho3ro1
 5XPRmif1xdS3e/gcuTqrHuyLh6Q6s4+WIUPo1jj8Pdq1Wmw6CUNWWEQaoJGP7BJdPv6M
 Xc1O5z5xN5M/xcDAZvr3AN1Gs0SbprnkDv075ZV7HR7Spl9mggp5aOQXSfGjoZDjjRhP
 +OlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758810471; x=1759415271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GewQR7/+Qt/2Fj0Kd/4s+T4SM+9lkrhGhGb1igAvpsc=;
 b=e1h/9HO0A2ctS/zajanWaTqHJJ4soO8odWFN9S13RPnZJkiz3+2BzbYDXno8cWTa59
 tDCPlaQBz+Wl4NTEkOdGB/ulkHWz4RgvTp9FSb2XmeYn6gXa3YwJNPwq21Z+8SGtU8iA
 ZXndaiIJsxdGQLJbSblx6f7SXGvuVGnFcXu7HgsDkPhvyY3vUXft+RgEPloLCIvMDPFp
 36s46ytxglUJbPyq9GOJU+4SX93iCKB8OZwbAgIoDbwAOBxgt83c82Oahu/yOACMkqoC
 fKzN4g+NXgbuTBmlZNy71WyjhFuSBGtWdDgyVer0oR1NNKPXiYCKVYLgAWYX12VpqcfU
 29Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhckmPLQFh1jjOE1tEBjjiV2aRkXo339jw9RZ6EV/LL1yGrbqPif9WxQA4zl2OPdQqASca0fMK5w==@nongnu.org
X-Gm-Message-State: AOJu0Yz15Uf2LjGcrAM45mJj8aRj07Ve9hzYatZSOozHmxJ8ENuG14VF
 SVNvfgx9Zy1CNqnEBooNQ1/o7z2MB7AiXugapzirStiShy5fhHdb5kOud//lm56g4LJIgoy5d7w
 CVb2C+N8cJvo5Zlkh+0H7SPgriIdfI+ZGCpft3DVvyQ==
X-Gm-Gg: ASbGncsxNKuPATKQfTk4c2NmxEg1jcasnYCukaH4+neL8mfISrxLObi3XoYfMnOlBOB
 n4t96P7gwkTLie3IrMO9RlWFEP8Ob1zUj0Nc0GObd9iZR0RnKhYzMxsKPTvDFuUJLFsyt0mnwGp
 4FlWBddlXF7F9ml9JLaJO57dFJBmrKyl+XM9PU+tzr8djIMrp5Hdz/CioJOGGGH/cicQqpF4hQ1
 hrx/qMO
X-Google-Smtp-Source: AGHT+IEtDa03kTBNWN1qbKm7H0pK7B1omoYSyf/BEkRo4ogpueQS824cCrcO8iMamw5w3L9NdAynw6zMcLeh7j2kkkw=
X-Received: by 2002:a05:6902:2b0a:b0:eb0:c05f:7ca7 with SMTP id
 3f1490d57ef6-eb37fcc1204mr3390411276.47.1758810470846; Thu, 25 Sep 2025
 07:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-35-richard.henderson@linaro.org>
In-Reply-To: <20250916142238.664316-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 15:27:39 +0100
X-Gm-Features: AS18NWDaIYrRPbfP6xx-xqOqU_RFHpattoExbljP6doEicNeqznLXmhTXddF8_k
Message-ID: <CAFEAcA-PecdR1EgOTubMK3hZ3GY=Javw3Fo4eHnhhjbtXZpyYw@mail.gmail.com>
Subject: Re: [PATCH v2 34/36] target/arm: Redirect VHE FOO_EL12 to FOO_EL1
 during translation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, 16 Sept 2025 at 15:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



> +    } else if (ri->vhe_redir_to_el01 && s->current_el >= 2) {
> +        /*
> +         * This is one of the FOO_EL12 registers.

I think we could usefully say FOO_EL12/FOO_EL02 here too.

> +         * With !E2H, they all UNDEF.
> +         * With E2H, from EL2 or EL3, they redirect to FOO_EL1.
> +         */
> +        if (!s->e2h) {
> +            gen_sysreg_undef(s, isread, op0, op1, op2, crn, crm, rt);
> +            return;
> +        }
> +        key = ri->vhe_redir_to_el01;
> +        ri = redirect_cpreg(s, key, isread);
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

