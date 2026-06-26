Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C74C43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:30:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6dU-00021Z-MH; Fri, 26 Jun 2026 09:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6dS-0001zb-WC
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:30:23 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6dQ-00056R-TC
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:30:22 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-662dc3879acso1042947d50.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 06:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782480619; cv=none;
 d=google.com; s=arc-20260327;
 b=S6g7AIKnhAWSRKEjPmCzoSZrVM22qtr7A+J/WfZ9404VNLcAdwxwd+f2zB6A005+nU
 HviQ4ZwZyTO6YWdgelM2OIK9Hz7rbKnd8oL/fP/8mbE4CXKw7JJEHIphhQGJZecpuyFt
 vaJ4nq8ohL4FcT68KWSsCEWEF9J17X5ShEBd1DI3MdlOlstGyYFVYpn1p2goDLHHolsp
 brZxHuB/CIj0PeNND89GhZWSGJLe8+lrcJeH0duIUHREnNMaPmaDku4VrGYGal8tF4hG
 P1DgqXzXWqQEXO4Q34S7wJx9sYitL/tdTX6qw+1KNCfKdJEwoKeDU5g5+e5zouAWqdid
 MIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=iQPU1fcB0barELB2ABXUvww6NvvhuhNrEJiOJIcI1wE=;
 fh=/vlSKgGe6PJS+IZNyUhP0kBBQEB5G//j8sQEeTtF2KA=;
 b=b0QOhGdVKBnPVRx3lzWDZz5atRojZiCX0YZ5nB4ylJ8AVtY6B1XjhW9X55bbKZofbx
 noR4VXsZetkp344RIkYCfG3HDKQ3dmeAn+JJLff4AnnhUSIg3zOhdIwIC1F3fn3NaNkv
 4yCiRO0HbopKRhY3eHrugqOvHZQ9Nv3H7B0GxSKG8lQUhXwAsLU5QnsEyPH+4HQT3Xxy
 9+OWuHfTiHVwVFvguHZfV/YZgPKhe+1aTVW/4kqd5aCiCcmeNHZKaJhfUn4wV+8s+DBU
 jZTKV+prq660NTCw1ISWUYcj36jj7iBm/erE0YSjHs+01I05pMr/zLzW49eYEzRTkvqL
 OJGQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782480619; x=1783085419; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iQPU1fcB0barELB2ABXUvww6NvvhuhNrEJiOJIcI1wE=;
 b=yGW5jAM5/4aWmgARJifSLx/Gywwnnq1Fb1P5p7SV0kiFL2vIRSVqDPS4Mx0FXVKBd3
 BttZLY3JwI2CYvTaPRZuuunWWZxq3x/Vij0DvIEO5k6eylXOJpAj2R/dAXJ4FUg1XgVj
 Cq07d4482EDXrvlf6vhZdw9vp+714N6Ses6hxra0vNEAjhDNV5NlGhtYQCmRzd4/wAs7
 v7pwWhwzcGPbNOuyEmhVzOPn9yrXWIwtXLmsCO/qXo4HqrXYWuxjxZjfSf7BcmligiWV
 wu/nYO/RUE4ieLb2zx+FsfmFfK5X9cVRZ9TducMQ+vknDFGGlr9EsARwOBiqH3up47BG
 TZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782480619; x=1783085419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQPU1fcB0barELB2ABXUvww6NvvhuhNrEJiOJIcI1wE=;
 b=B8fdpcii7lAhH3i7vsnhNYQPj6DXVRH6sS7KSTgYEk6jXmsYNFKj3gFUTWUGo9HhHD
 o2m//yBMP69cJipUUkEQWyCcUlS1sJmr/+wMRXZgBbs+bMBawM9mSpwvM9yFRCEVZD6i
 Cua+UlufyXYh6DvayMQvr0Z+wFRE+FmVrJ5jofvGbiA2fRr26Oxqj5fqzvR8kYDcZNNe
 wXKJG1OvJdc4fCEblIV1C07lc23B3HcVy+XXuIHjRMowwDsDcQErmQENrn/lOl85a0O8
 atpwFIeGHAWQtE+eqbuL5ebNvnhYezCrCfeYdodme/f2saXWL/+LeQFGEUXbxWrC3F8l
 2UsA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rom3RmJPdKQaTEfBrkW2DSWx43FJ71P6Xq1jYLJ0LHiZxZyNrJOQEv3K3b55A4xiymg+LVpeYCgVA==@nongnu.org
X-Gm-Message-State: AOJu0YzyTb4kJvJT9vq0UE4/vOqFW9X0pn95wG5MWZHpiI3kSfpjXxyW
 nNUJkHKisbltHrR5nb5DdPprTfyO+lJYHWVJajWPcrKZmaT8SGVpii/aPDjUcFP6ysrHxJ7bp37
 e7bpJkKsZAbcBEFx7Svf5bBCZN/NcWpruurz5vdgKXw==
X-Gm-Gg: AfdE7cmiPmA4cpM4zKy4RuwRdbavV48bB1j6TRJpTe6t3GzK20vpoLhz+qJJ7uCB2qM
 7JFMjGH3+6AefbtdnzAV3OhX7qlvV/DSKTS2bPgZN1gMDwz1Z2z1A+xnCMcsr4+CKwA96VAWsyT
 5GHC5ywrqraEoF6UtFgdqgxtIZpdRpY92jY+6NRkz8bEIf0qiYfY3mKOS9LwbfNQwGDLRqL+Se5
 UCoGAwTD05C8cZpXdIsk4tNCNpO69caIq4vn3YrpjsyaOLoiYVRq3lTcNpc43BKtLvla7nBz1SI
 TRIg1jFaEHJy6Rw5eqjXe3quDXmiq7+plduS+z8gCKJuvEwRkEgA1L85
X-Received: by 2002:a05:690e:4809:b0:662:f405:5d41 with SMTP id
 956f58d0204a3-66487f9a1eemr3806277d50.33.1782480618881; Fri, 26 Jun 2026
 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-12-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 14:30:06 +0100
X-Gm-Features: AVVi8Cc25qPp3O8IVQFJq62LoALCyZE8cRR1kDz1-E0BPfnS37kMZ7eiDXQlJ6c
Message-ID: <CAFEAcA9Zv-kWJ1RKGBekg73it_q1Q0PEfuj8ho6WgwPUXmzUDg@mail.gmail.com>
Subject: Re: [PATCH 11/15] target/arm: Implement SUMOP4[AS]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 25 Jun 2026 at 23:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

