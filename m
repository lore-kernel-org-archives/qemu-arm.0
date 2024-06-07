Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1211908ejf;
        Fri, 7 Jun 2024 15:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXU7N7zxvYYM/0gFYxuvI/Pf5p1CVfY5yXUby+ree0IJHRveba8EBvZoG45t90DCr4kkNy8BiB55Hvg2+m5gDg0io6oHSi
X-Google-Smtp-Source: AGHT+IEi6q9XKpZ/ZPqL5cOFR1RBLqCYrGZhkizYQlVrYRb5vZRgzuQvgkOr/tfjweDHv+pww/2P
X-Received: by 2002:a05:620a:1356:b0:794:c917:fc1c with SMTP id af79cd13be357-7953c31b8a0mr369440285a.31.1717798214919;
        Fri, 07 Jun 2024 15:10:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717798214; cv=none;
        d=google.com; s=arc-20160816;
        b=IVhR46LhTZaLDuOPog65bU6bylakCbXwrUQgXsy+SR4a0zhTFIXibF6MZdp2TEkmMb
         aCtjp5ldqzSdcGZUvzclALpZXsswq/U8XPolgvmfK1ihVK1QDH8WjJmUspIMfAilREEK
         0uZcjlRGrR/YG8aJap/Le8ngZPY0Nx3tmTa6wrmMOKlwhnmwx7MtLzmnwKQni6Mn5obE
         cwIIveonN7Wtbe3YP5KCPUUTL81Xmk+viYHpSOqIcAyqHne0a6V8aLgop/5tpJKVprCd
         ejVJhJOqjP2WG0srTCsuOssQ26lWXeIoUh4B1x0AR8a1xpzUHLW/y/GpOllMCkjnT2x6
         q0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=M1m+3h3ZMpB2qpYFkRUj7JWzswXTd2jyCojOK8qXXe8=;
        fh=MrxSLTUrESNE4M7HLzEN3FNUYrXKPkzStTYb9+OOQp0=;
        b=rTwLiaI+SYkg23NcjxA7f47lmBWvZkwV0WeVa2o4Dz7+pmzyVcDvcKleNnMOJTlb+Y
         xpSIj6KlNURqgqvu8BWAQNPytLWH0PveU6LyToy7SBoNIKDjyTSoEycqKs2J+fcXJ2HF
         0yLRfsTVOZknh2hvjr+gtLEukRV/kR3ZBS3S8H0k04T8vx4aoztFWOSlo5rfUjoFNnG2
         RpInr9zI4n2Y/+nNaHSzb7wgyHdEz8lQ39d8igqhFFXh6v7ucEvFv5A2ldbiZs5XAO+P
         y8Dx66BqiKJoKcNo5BYVq/NhD8/GbD8bYmFITMMdst0zUZbwyci1QER2fM+21jojNOo8
         Id5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UL4/SzsC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7954e2f1afasi123850085a.480.2024.06.07.15.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 15:10:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UL4/SzsC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFaew-00048G-1j; Fri, 07 Jun 2024 10:33:38 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sFaeu-00047v-Q9
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 10:33:36 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sFaes-0002Vl-NF
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 10:33:36 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e78fe9fc2bso31824421fa.3
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2024 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717770812; x=1718375612; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M1m+3h3ZMpB2qpYFkRUj7JWzswXTd2jyCojOK8qXXe8=;
 b=UL4/SzsCVhkyZzTiLZARtLhZ88SiV/ouImTY/N+cJDI87zLfKon40V5PC9ZQn+VyWP
 3nWZZ4CWtUAKd5bK9avI+9cF/OGZdhlZc0Gmytv/yYdThX8yR+/NKzB+AQGf7eauOF90
 +LxBu+uxm1SrtWpMdda0Z1i3F/ud5wfJ4hvylXdcZ1sh7tCFbVfZc6zoA/gQ5Q04sW97
 xgqVuwvT3nOkuEQwHivNIyS71Ii2z8+bBL7xC2qjzDWukbGVjdROuncClGMqyQBHc1ca
 3mWkaVdoZGDRo3PxF8CAKPkMxK0oKuDDMm5TgUJyAoxn0l940+IrtGxCkC16kKnQJKdN
 g7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717770812; x=1718375612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M1m+3h3ZMpB2qpYFkRUj7JWzswXTd2jyCojOK8qXXe8=;
 b=Rfiy1Q8FLRkS5lBsAfYWmk7IMzMfMZN5i7udC6AtoERKFroFVo7jKY+cJp61hgMgXF
 Xyf9yCogS2ZF7ua23FxtudVyJ10OIjQ9dWojpfNCPgwcUe1ijU2oytknjQJLeVCF38dX
 XospcAkHGhSlexTeY1w2IR4oy8SzDmH96s4WJG1xitWGxyKT3OOOW1JIKhNsu5b2w3p9
 LpUNqFi2dmSEdmppvXgal8u5Bg+UDYx+M8KwCi/rU75CTDa3TaTR2LfOhQiQJjUJ73x9
 5ScEMl2GpXBMHB3pmYu1tEsvSGmcg5cWlkQSTEqGbxQVwUk357FHs4HZUWkEid52KTPp
 yExg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO3WAyMFohbE8gnATUbCPYRE7Zq1jZU1tLtgwmKITIUSY9MsaYrpbMHShJfvJoXJC1ytfPiUndANs+vLRDGAOB1O3Y
X-Gm-Message-State: AOJu0YwDFQpvn1GOckSSrtgYNgfrGxvxKAv3cNXCefuQZ5Lb9P5CkNMy
 0GYaDd7K6AS6KN9ig96m0Ad9V6R72QGXFShpHCDISD2w3Jv1IeFufF4tN32ZgS58s4L2w4IofJi
 pW+rfqQYhf5JLgP6c2THL796fjmM5cAAVweWq/w==
X-Received: by 2002:a2e:880e:0:b0:2ea:e2d2:61ff with SMTP id
 38308e7fff4ca-2eae2d26485mr10509311fa.23.1717770812457; Fri, 07 Jun 2024
 07:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240605143044.2029444-1-edgar.iglesias@gmail.com>
In-Reply-To: <20240605143044.2029444-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2024 15:33:21 +0100
Message-ID: <CAFEAcA_j0d=0y_1Nd9VZDPceHBw7CMpd4N8Vv14KUa+RvOJR6A@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] hw/intc/arm_gic: Fix deactivation of SPI lines
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, sstabellini@kernel.org, 
 julien@xen.org, bertrand.marquis@arm.com, edgar.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
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
X-TUID: 7apyAp77fQkQ

On Wed, 5 Jun 2024 at 15:43, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> Julien reported that he has seen strange behaviour when running
> Xen on QEMU using GICv2. When Xen migrates a guest's vCPU to
> another pCPU while the vCPU is handling an interrupt the guest
> is unable to properly deactivate interrupts.
>
> It sounds like something rare but in some setups it actually
> happens all the time.
>
> Looking at it a little closer, our GICv2 model treats
> deactivation of SPI lines as if they were PPI's, i.e banked per
> CPU core. The state for active interrupts should only be banked
> for PPI lines, not for SPI lines.
>
> When deactivating SPI lines, I think we need to handle the state
> as unbanked, similar to how we handle writes to GICD_ICACTIVER.
>
> This fixes the problem on my side.

Applied to target-arm.next, thanks.

(I'm surprised anybody's still using GICv2 seriously at
this point...)

-- PMM
