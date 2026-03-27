Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F06A10AB830
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:21:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6822-0006AD-HM; Fri, 27 Mar 2026 10:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w681x-00068P-Mw
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:19:21 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w681q-0007S6-2B
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:19:21 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64e9f9226a7so2379014d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621150; cv=none;
 d=google.com; s=arc-20240605;
 b=TSXZoHfLurShuGzrq8Sp4HcIAjF+eJjzD6R5cU/a2Fr2optbOVpip4THYJ8iFTxiFO
 9C/AW3JDNRK1wCX1Mqefz1DRxQuuGRsUwnYxnYepJyJTM23hO3qTLjkfHQnN4vcpZNmI
 inoOSZq3nF1TUi9hNxyvFiXbYWHOEBuPzvqQpB0He/Qc4O8Sr0a3ALoKt2P9WiVtZwzF
 G/Msz+dMWEKPPbWY95sS9+zinSDwKUKZnKuU9Dlf2mWA+NuQ2PVDFTG3lT2b0ztguI4l
 ri9+5fQdUt1Aw2f01AutstzEwJtxBh2NBIwhOZsEW32q6n1krYgh55m4PtSvpAfnR0LM
 r7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 fh=a4BClCWGn89zL17gT7ZHQb0nTYgaZN/3ZsgdH5FCJck=;
 b=LDJ2YDA7TieIy6ZjaQktGvRrevYJ60SM3ZCN35b9Zn0MbmyslhEl0TbR/tCL/HPnvg
 pmXc9mnYXR1N/A9tsuFLGOOElwymMiqN0Gw+2yhzXtSOSHdS1w9owHWm3mi+8G6mGWir
 INniYcL+FVwjR8ENnbarhj86/vVqSGmaUXujHXJN9oU9D+l+Rnx/7ZuwPVLVqWspR/FO
 C37APQpwqtDLgH2S4qv6jCQh3xT3r6IKhXmUc7gj5oe/Y3L0YUrNB/tadw1aopUoWvLf
 RLkjs/rDgD0/e0Fa3xJGGHWN1oPG4+c162pzq3xanXozgGrdHDW+SmxtifYSguH6/DDv
 UwjA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774621150; x=1775225950; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 b=k5Rg2VuvDSiL7c1RdZDP6+bSx/fem5gKWm9LkNQ5bjjEcB67c0joJht0KxrWc1HTKB
 odU/GG0aEgB+vWXF7DXA5bBKd2HCnNBa60QXzpAMeBNmMDpSVgEKBRdIKxJRpFrMAFIG
 ozj4EMxrfVZMesoZ+9fgPCduCEx+iFaZV6ncM6TBsXsg62qz6hXBJh4utuojIrGP5FD1
 OibhRhvMATcHnVqSc2q/00GrH94J2TADvr6Z+FknmHadmr9cv8WZCILzI+R7w70uCcgr
 Nru6QESKIyL8nWp6iS+AjZVCS67USb/uRm5Jd9x4AJFLYdnXc2/yXyRMzYFOn++jSP5k
 2Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774621150; x=1775225950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 b=n0ZefqHpUh6xvQHi28zQcd+xv0l/x7eoFBYOPgs/C34IHbj9fT2PZ90905o65OFhSP
 Acs9ws43bFwrrbeaRxifLeg9A1Zq2Q1AB0OKjPu4ENZEx66OF2nro+fL/BuZiiUxxgep
 NUZoTvescfBksNj63pnpXtNX7g+jvoF33fpuZKmbUT714mEG6knYV9+IDWNEKY5MNHdm
 SH1/7i+rY0fBiOyfV5t0T1XiNySXeR/Lu//9lGsw06O/bMsKK8A92K3HUjWH5QEfjG26
 hi/aFmv9RXyZtK258a2pK8yPBC+a+vT8ZMPcgFEBRIqa41b0TRbJ/C3KFTYUR92j/bNf
 OOwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyXf8TlHBpDm/kIDH23MfUTxxAGqj0kqtw2huWKKxmFze1YTNosfeuOvqRA9tFPbaxZxjvJt+77A==@nongnu.org
X-Gm-Message-State: AOJu0Yxb1K4ZhyN+KcLp1eNKSBY7aIgmi8klpIR15DEFX4KuAlJcJsNa
 SPOoifEOYPItHXG0xcdep8fLZunM+wkPebM29/l5M2aLgUyS60pXwibP+Dw/0g9rdkrkKu2BkZZ
 Rue59TivjXB+fN247ajUriisHQ9aWBB9luTMlSP7+Fg==
X-Gm-Gg: ATEYQzxTyZJk7jpe/PuIMu7sZc0LYT1MlmSm2ZZe8sIpDcXkZOmTWWKiECLuH1s3YyI
 zb4oBHM+ujNii7qVJvTP7NfRJfKGWmwaXOK57bEVuqS8duDdfxF7SLWiz90tcEUEwTQ8uUdy4OB
 Cubs94KVzmN8tn6/FSIP+WI4guF0/xA0X+oTRsi9k5BvgWB5e3GQEy/pZarApSmgJQq2ro9YrTG
 6j92xvXFOVHeSEvU6tx4X9Vpx0jaXSJTE2L7SiJrJWClnlwLZZbX/pcXRy6pUiKOBeHsZZE0osn
 MjHGvoRkdrjJmelV2K3eX5+m+t2DZltx0jBZzdwIqzJxWaSIG/4GXu26u5UZr3qbeVU=
X-Received: by 2002:a05:690e:484d:b0:64e:a215:11de with SMTP id
 956f58d0204a3-64ff71af9ccmr2449912d50.15.1774621150217; Fri, 27 Mar 2026
 07:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-11-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-11-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:18:58 +0000
X-Gm-Features: AQROBzBHLUrurUIL4GpoENhHthPYnPAJkGXERrAC4hbNeIBZKWENmbOHRY_hW5g
Message-ID: <CAFEAcA-v4E0kYu=aebegjaO3wU_en9peLUb5SubLSE1H-EV5TQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] hw/ppc: Use glib2 instead of
 strcasecmp/strncasecmp
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Fri, 27 Mar 2026 at 13:45, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

