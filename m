Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2027676ejy;
        Tue, 20 Sep 2022 13:49:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7953Z2tBWfR0RAVhNP/G7GdF3GUs1nnPVQVsg2Vc9UaN79Mdeigs9jgCID5H+AYdnzwdcO
X-Received: by 2002:a05:620a:25d4:b0:6bb:f596:97d0 with SMTP id y20-20020a05620a25d400b006bbf59697d0mr18033576qko.411.1663706998924;
        Tue, 20 Sep 2022 13:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663706998; cv=none;
        d=google.com; s=arc-20160816;
        b=ri+di8HUBscaRtb1yYU4rfC4ZzTkOyTFN+1n0PRcGmiYEydaLonQZh8s5+cUFAJkKQ
         Zc7ZNZvgYeqK+8TVkb3t/uynDASHkdDrA2SwU6YnWuyZa+HhozzUzAsyc+RIzoH/Mxgt
         AaB5nOFHqOCUScZbhtRx5qVEDkAavgVtGhIIja+9uHAAV1aJ37WWMGhsHwiixP8DtBD+
         Ial5n5tYAtD52tNGzRLED7qsO+MPj9TS5+KMCytHj+GiDaeSMhawsHf5YZDH0c6Axjif
         apjIdBjAgDA6X/L/IRCiRHDdrpRiMCeERytx/zyNN3KwPZ4cb6BxgNBPYrEKN1+K95hN
         Xc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5lUHutovwYwYSb4tFgPAdhsfX+qZcwHYtDiahs/qvAI=;
        b=ZX4hw9fUDCw+1ll2aUFEXVwRrmJ7fi5w26Bry5Zj9sVXsL7sddG/v4U9ivX5tG/Xti
         TRnUOw7hXYbxSStZZ5ep+fbOhOxy9jKIexvPIS7CasaltkfxxvymNI4ZnovuznGLkGTr
         iOpF/DcJ8J5QINVghmQd9enf0ZxCGX2qiCSN5urwxmyANa/WIP0f1e4cljM9WY8IERaD
         /4gra6wBwR6QEv6mmrkvSlrNty/n18nZg0DsnghEGqe077WMI3IVQRRrjx5qQ8vETUwf
         OFrZRcS3kL+KLddFEIGmQetBgIEo0aiU/x7CGvoFR5S+viOMKwK0bwnY0K0y+DmUKFw6
         kHyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t2YgrFb4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y22-20020a05620a0e1600b006bbb1bce643si397990qkm.681.2022.09.20.13.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 13:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t2YgrFb4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oakBq-0001nF-CN
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 16:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oag0K-0004Iq-3k
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:21:48 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oag0I-00008M-Li
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:21:47 -0400
Received: by mail-ed1-x52a.google.com with SMTP id x94so4576519ede.11
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5lUHutovwYwYSb4tFgPAdhsfX+qZcwHYtDiahs/qvAI=;
 b=t2YgrFb4EBlba1TVfrCQU3f8fJUs7YpW6rxQWTDndN3jL2EHKgrLuLNmkGd8z+cmrO
 TtiBtcMDTElJfNEb7fRz1jRrR/T+pkow+9daCMHfrLtJA83+4nOQbpAR9Gfxa0Oq6Jb3
 RMv15iSSdwzQznizXdVPRHTcCZ9Z/QvrBmW7rNDbnpnsi+nB60+9BqTrnP+bpFRqx+H5
 NheiICGSD6oOLenqivgMQRnUvuDaWtFX/SeRepMqQvFwF18BIUsW3OhWkd98+e9HFXlV
 YhlygcAwDoeQPZYxfZ/RcqAIihcVQ8WxW/amEHuPIZn18oQ5y5bQ+5OkdOc2PxjvAT3D
 1xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5lUHutovwYwYSb4tFgPAdhsfX+qZcwHYtDiahs/qvAI=;
 b=7hc884MfKMJCxeea18LzWnr6QQI28E02P/Ok9hBCOTTWN9YFdw5DGpCail04YuZTA5
 /hQTMBZj3l27hUEAFDY12tILMwhEUJ/gaHqHGjNk090YKU04JjeiAWrK0nV27O6bPtqL
 u333KCAkqer8P9d8vYlc26hov9SBnaEgK/MyxkK1qMFANIElt1qFaEF7uJWvZTj2HqLt
 6g/8WOpAdTjdFKslaR9n+BHJS17soAz+M+PJfDHVtR1wsHEwy78j1dAXYKDgV90KzKwK
 QnrU7BLqmfarqP7jl8cq91zheC4sXZKaT5h/9q8AdwY/eizDMFzhQ8oo8xUd2PgsXLSg
 VG1Q==
X-Gm-Message-State: ACrzQf3EhtJWniHM7MWTbezPmSKxJfGzZL+oMrL9/LFvfKGMYwlhaLug
 nH9/OlzrWJD7bbdxb9TO/lEqxgocbxpzxapEuBhF+g==
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr20879248ede.375.1663690904620; Tue, 20
 Sep 2022 09:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-37-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:21:33 +0100
Message-ID: <CAFEAcA9u1yYeDFxWUwvQUHgpEkMWqR3NhqHsuv_8J0obMjS9Rg@mail.gmail.com>
Subject: Re: [PATCH v2 36/66] target/arm: Reorg get_phys_addr_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EWuxmwVt8MzE

On Mon, 22 Aug 2022 at 16:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use a switch.  Do not apply memattr or shareability for Stage2
> translations. Make sure to apply HCR_{DC,DCT} only to Regime_EL10,
> per the pseudocode in AArch64.S1DisabledOutput.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +    check_range:

I'm not super keen on this goto label lurking in the switch
statement -- I would rather we keep the "how do we decide the
memattr and shareability" logic separate from the
"which mmu_idxes do we need to do the range check on" logic.
The simple
if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
    range check logic;
}
that we had before seems clearer to me than this use of gotos
and fall-throughs.

thanks
-- PMM
