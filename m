Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72268CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:26:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWzH6-00073o-4o; Tue, 09 Jun 2026 12:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzGw-0006xI-0E
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:25:50 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzGu-0005he-Fq
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:25:49 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-bdb3fd39045so827073266b.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022346; cv=none;
 d=google.com; s=arc-20240605;
 b=LKR9a0YBIqLjcDuStZyMj+T4Ve1Gq+OevsnkL6us2DBcEB5rMBhcQ++w5nTlP4O2xx
 pPgMXt660Zue9PuKzU2LIWQ7sXaxnseNCjeP6AEo0nJa7zzfqkIr1lQ8drQhd+IzGXi/
 7QJaP24HflTNeRbrqcCg3zAQRqOjT7kVXdNpzP7ZsN/q2CMMEr9mdxylm4+Wy3NYPqEy
 j5mxHeGiOVDL8tv4boUdz+QD8CQ4WULXHL/2QjN1ONDlF72SvkaCWLtOtFW0KRUemOCg
 VFa0H2sCTfxUAV/7k6EEom36w5/MxVVWlnjAw1+UVdw2k9dlBVAkG2EkVxNILMjzRIV/
 C7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=iZ6B5/5KFMGcml+yrVI24NNUjdE1+KahKb88orQukBM=;
 fh=V9izTsEU2SCdNHbL0JnsAl5ORI/KCRUCRHfWaRFifcI=;
 b=dNN1Kd8d62S5o/CIQs8VNWjI1VAlq4JmXPu708oJHvBp+UchIx2PUTGWZwotHMFOs9
 6GmBJ04vMizuJEOgK7nC/20KuFpqXWwx12XyqkkY32oOVW0FjfYciuzlGhG2HhfOf1Z/
 ad5xQBDMJgEsq3H9Tpgh05QphzY+6vV7RZpgydz44dpsZ81k0mre/WAH3Y2f8edxxhNo
 SEzq+/SwPYkyleY+t9jE82NH/aZLX4tmAC3Lp3yc+ae0MbDKEA2yZ50t5B8FjATruLKO
 mmdAc6lAo/zrT/B/jSaCJBWgUQxPnD5Oq92SOHN4lVpgfdwH4UeDh4i++Autb1IdCwKV
 oquQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781022346; x=1781627146; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iZ6B5/5KFMGcml+yrVI24NNUjdE1+KahKb88orQukBM=;
 b=GtTNMhEAJyzLG8iv6LLwZN0KaMIDGlqNOQnuYAmPZhQdJGQf16t0jaXLJvzIN3rjhk
 vqAMiK2iFSifTk/bVDawkwTKEho1aEMIED1NiPNmssL/6ak3Oe8jRsvZtk45Yq0PPQGW
 pQmlQ9Rw1T15t6skoko61NAEAFuRYGViMYg+w0FkKmkazPvNL3VRE63zU+ON2MIUyfF1
 ChNiPFxHdnocPa7z8NzLCpEnyI4AIVF/vLFAfxvVfFHcRqKPwep7Q/8beuT3qF6MD7hM
 27quQzZI3jNm+TNw5PwRmRggfRhMpl91d7yQ6lbekDetSZXNl4aNxMgtk5fuiYw2tVt9
 5qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022346; x=1781627146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZ6B5/5KFMGcml+yrVI24NNUjdE1+KahKb88orQukBM=;
 b=haJGGz5HuXDwQRwg+VJ2no6fc9Xkom5sPOOQ5vRp/qW4b9cfOfKNUcSkRS2ZoSMKJ3
 MWLDN2sMmI4h/Z0e3StT3gOhvhOwxI3AbJNhYyAtUA+rbFiE0cTV2hTiSzr4cZZs0/V9
 PA0XWn4HVsgk5aWRJY3sinh+HFko9yWYaGZBk3DOp/myaTifHxk/3a/wCmXRTbdpRxH2
 HfXBLtvJvwZMXgJdR/6Bv0N9vH+IyLqueUKP1UafaeImVQamUmAYjhMr49cH+YoBTTFx
 pve6Q9idpH/RnbY/YgQvqR49s/v1Zd+A33py3ZYzfTwn+V6VazwfxqPqzeCYPRw+D6Ny
 lb0A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Gve0mF0FT8jdurz4Ti7K55gB+8tx15CvjEu3HMPvvtkTABDNIi8svuOT4T2dWjdhWQuMgXGh4FA==@nongnu.org
X-Gm-Message-State: AOJu0Yzes8jHi2VBmdhecbxILxbEbNLHQXqXuH/+C87AsPOeDRmXExR+
 6PaWwbEMnLZn1ACKP1sP5PRqwZM5ujrm1yDwRucBtLUQ+17dVO3ZsOQoh+Srr1qNe5qCzaJQoxJ
 rrZitYdXRzs2CwXwCUnKAzUqmw8U1tyQ56eQxl7IsZA==
X-Gm-Gg: Acq92OGwZHfr+r0ZieLbC+kNM2vdmhv6oL+g/K/SjauW6hLsxfv9y4CYLLANXKdmtZZ
 oKZDxQ4wovV0pP3MLgDw8Llb40jE3F1K5X8UK6KIHKRIQPLAH8j/wGFtXi4Y28DUd1NlzBATbvM
 3EfY9GEa4HplpRY9rjOXzy+fgrdRLnjPM15V6Ky8mjHdhlYR+c+6IuwnN73NkIOFcYDud90ySo+
 dXaYhraCNQ1yzicY2822BVOHz5gSNAnBF/hXPIhonx51IReCL4AxoRQzIQ3XmUxoZ1cMRalYkVv
 Vp8ickOsElzOAK/GUA64s0zZsPISacLtZlLRRNt43i8xKOddAfjuP3E/QA2/ZaOKbxfGqznLuCc
 c3Q==
X-Received: by 2002:a17:906:c10c:b0:be2:36d7:573b with SMTP id
 a640c23a62f3a-bf370473fa6mr1106911366b.12.1781022346389; Tue, 09 Jun 2026
 09:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:25:32 +0100
X-Gm-Features: AVVi8CdAQ7Fk6JHulkR9J9lseVEDqLuhdCvE_gpH0jljW8wuseJULhxdZPPzn2Y
Message-ID: <CAFEAcA-4KZg4oPL2Dv-TWmkwV0won1+iBD_B6aLNphyZj=-1VQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/45] target/arm: Implement FEAT_FP8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v9:
>   - Include 3 arm patches from the fp internals patch set.
>   - Generalize TRANS_FEAT_STREAMING_SME2 to TRANS_FEAT_STREAMING_IF,
>     pulled from an in-progress FEAT_SVE2p2 tree.
>
> Changes for v8:
>   - 23 patches upstream
>   - Rebase adjustments
>   - Rewrite arm_init_fp_status per feedback
>
> r~

I think I've reviewed all of this now (either unconditionally or
"with this fix" r-bys); if you can get a respin out by Thursday
I should be able to get it into a pullreq this week I think.

thanks
-- PMM

