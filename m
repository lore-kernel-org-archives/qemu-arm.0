Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2293591ejm;
        Tue, 2 May 2023 09:12:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Cah/EzeeB8iXON2YXSbrG5Rhtl9DeOo5g+L7UJdB2OtrPtvcxQrVx4hNJ7N/iZorykDwi
X-Received: by 2002:a05:6214:2b09:b0:616:696e:4c6a with SMTP id jx9-20020a0562142b0900b00616696e4c6amr5767298qvb.41.1683043954480;
        Tue, 02 May 2023 09:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683043954; cv=none;
        d=google.com; s=arc-20160816;
        b=oenx5mQ22HhiVovogQfqbdvaFlrP5Jpsys+bdF1pTqzAWO9A0GDvNJw8+hTWXS4vjM
         NzmKopoB0xmKQx5KhLL9OeTTLF1JXJd4KxRfoMoyelgoZMeeP84VIUkhrcl2kS1abBKk
         z26M2V7KDkV9/b2gamt1z/BkI64BfIAELSsz7XzYekpz6ls+7xXMLJReet+0CTWcwaAI
         TBKtygRd02M4/Co6j0X9Hmx6l2ORa3r0ZMtHyFLHrpzr2JgU6q3YELHCAOZUEGWQo2TW
         lmZ4GKsDZqSWjBtl8iL+KaSIWvgIvIb97as1mF21J87CJ7F1f5f1HxXNoKOyoZitvEeL
         /3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LprwXtVwFSGcGun4/bwMCVjX1R9MCpd/Hpmv+3jmq18=;
        b=VvG6E4s1Kp5Ih5xLAW7knlM1d1GUcrhhYqf/fTqIeZ9v1PNgeXD8YUJ6GdJ9mmJ7WG
         nAwxbUgbVSSH3xJoWfR8/PddUhI1Bt3Eo0ZcXtpnRhdvL9D2X7ReKNFXsJ8Nh6szXLHr
         H1utdpREj+iR/drEYVt+vQ18USIcWA2J3CU1P6GsPrQ4zJqWfRenADU0vdAFA0hAGUaK
         LP5QVDew2vL50lO5sO+v+EEcpS7sEHM4O5TKREPUh3DeawZ6rX0cbcIDhEq/8J27gRLF
         NBBwruuejaO+hC5xDjRNWUPWik4se1tmurjz/IUqvJbdiX5FO6fbPX/Ug6fOvRrOHUSg
         FFWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FVw/amib";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv6-20020ad45ce6000000b005ea91383205si477637qvb.603.2023.05.02.09.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 09:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FVw/amib";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptsbl-0004mP-Ez; Tue, 02 May 2023 12:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptsbg-0004kv-An
 for qemu-arm@nongnu.org; Tue, 02 May 2023 12:12:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptsbb-0002Ay-Ej
 for qemu-arm@nongnu.org; Tue, 02 May 2023 12:12:00 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-95316faa3a8so805315466b.2
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043909; x=1685635909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LprwXtVwFSGcGun4/bwMCVjX1R9MCpd/Hpmv+3jmq18=;
 b=FVw/amibW0/saDpimMef0Q7d35/PTHrtm/UrrDV6K4bnaSXMiJxAWuDCr0/X+ZJo0B
 ufrGebO6GmKP2iueAnJb/yEYdhSoRw7r0GPxa8fXBD0dz6tNxnql3H0666wrp1K/PRWl
 tnaaPhR66fYstYhoTzn/BHeTgIwAHAHYXmukF6wDABB5WcaneQQ00EPWh/BbVS/j8WJ4
 8/F5ncrgZizp40t2bgzbL9qIE0dxG3DTHQdsErm58ls9ahPPQi/zfxQMNDOi9nce7Gs/
 uT1z6Fsxbd7KAbmbnd4kmKVJOhJtqArwdKvJTU8EZcNsD7hqt3boe4ZCBXT0jl2n3zcC
 O9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043909; x=1685635909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LprwXtVwFSGcGun4/bwMCVjX1R9MCpd/Hpmv+3jmq18=;
 b=W97FJbw+Hdl8OokaVnussJHBIgg93WzodjvE0muxbvmzDl6XAgNdWbewRvKbgDd6eN
 e2pYIp2LRa5YZuHKbA4Xf549DwD4LjpIVRBVlfKO299i85shlQxwXgEkkbA5KHJzSv5h
 YtC6DAHLV8HmAd3dCSRcM8Ec3S+0iBm/LMf58H4XMM7XfOX6dBMUbSEnwk9O+aZXrZEe
 nDfGv/9hJ7tZ3Uft0QdGpYhxpwGw0F/IhreV4a7mFDSh3QXS2VM5lPSpuURqJChSivQK
 UUgTyMlYjChLDl1TRMPloHGeaC1L6L+pVzYAnoX0xKFOEbt0PV3SFrXUeM8McrseFXsP
 mv6w==
X-Gm-Message-State: AC+VfDzlsmND90HkyGejFsOdOlM1tIeKPYg8EnBj9WtPe4tbp3lVSu1c
 f2hvW+2n+GlRO/C8LFcV8VtRij6pW9NqslDFFeITEA==
X-Received: by 2002:a17:906:dacd:b0:94f:1c90:cb70 with SMTP id
 xi13-20020a170906dacd00b0094f1c90cb70mr385681ejb.66.1683043909377; Tue, 02
 May 2023 09:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 17:11:38 +0100
Message-ID: <CAFEAcA-R5uNg19c7VfvJ5bzZWLhkcUUwmucHwe8ZeJYMQ-vCeg@mail.gmail.com>
Subject: Re: [PATCH v3 00/57] tcg: Improve atomicity support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, git@xen0n.name, 
 jiaxun.yang@flygoat.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: aK96+w9KB6TK

On Tue, 25 Apr 2023 at 20:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> v1: https://lore.kernel.org/qemu-devel/20221118094754.242910-1-richard.henderson@linaro.org/
> v2: https://lore.kernel.org/qemu-devel/20230216025739.1211680-1-richard.henderson@linaro.org/
>
> Based-on: 20230424054105.1579315-1-richard.henderson@linaro.org
> ("[PATCH v3 00/57] tcg: Simplify calls to load/store helpers")
>
> The main objective here is to support Arm FEAT_LSE2, which says that any
> single memory access that does not cross a 16-byte boundary is atomic.
> This is the MO_ATOM_WITHIN16 control.
>
> While I'm touching all of this, a secondary objective is to handle the
> atomicity of the IBM machines.  Both Power and s390x treat misaligned
> accesses as atomic on the lsb of the pointer.  For instance, an 8-byte
> access at ptr % 8 == 4 will appear as two atomic 4-byte accesses, and
> ptr % 4 == 2 will appear as four 3-byte accesses.

I hope you mean "four 2-byte accesses", although I'm never
quite sure how odd s390x can get :-)

-- PMM
