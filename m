Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp378237ejq;
        Fri, 5 May 2023 05:27:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5f1kJU2sU6oTet/oEjY/7mauLuN3q49KtCqDl0M0ZHysqXlIU2bEcYY0HgxyZ4ovZyOiN1
X-Received: by 2002:ac8:7dc7:0:b0:3ef:3cdf:c29d with SMTP id c7-20020ac87dc7000000b003ef3cdfc29dmr1857531qte.52.1683289650633;
        Fri, 05 May 2023 05:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289650; cv=none;
        d=google.com; s=arc-20160816;
        b=osZuP5Zo6mxX9sPfpWCtcNg0Y9nympn9alDYMi2VvL1CicDXjuoqMcTC5lqNQMLWle
         IpzwKobB8/EckATRUBsGmSzPAAwnHl3OmvJkgnxHg/A7wKP3xylTvUE37fBp+2AsDydi
         XsKQ/uwUt3by05IomvwmK36k0Arvc1x3Tt5Uzk51Fh2+lSji+1Wm0kzMw+LvJfzg2IIz
         KUAIZ2p8xuGaXYVAvTjbkg9G5V3sU7Isy2JH6qFe3D9DJh2KoUGxt2vpJ8vt+0cblYEr
         wahgiV1j86uiRmOwK+DMzI/wv0uSYwp8Fn4MP8a79Ly+o3kR21pjek2iBDKE2ORz68iN
         L/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IU0MO3r4uwnLNpenuOEWtLhN3N9yQXXBloyD9mOU9jk=;
        b=FPAWJ/AaeXRNT214ktqQcPxijzZhGtpRqT4ONCMjoLM1RqzMw+2tRemlU1Q9K8bTSs
         gmyA4B1rXislTCSaOaLEt+gIrwxXPxwPcNy8GOeC7A39CPjbwW6+DTU4uCTggEickKWh
         dXK/pA6PzITowRga3tAhZd8XyLqQyaiGj9YJY4uZSoX+/+HyopTVgFFDs4B2jDLNo3Ck
         bVA/kUd8o8mkdNOytqdM4tzWbAh8T0nhOkzEOcmTPZkoYO/2gmC0Pmpz3g7lLQ7rsm/9
         KDSfsvoZ2Xb1w0Wx5zPSUdeOuH6g7vEWL6Bn9ggh47LRo6tCB9CPzIgCcsSXIuCL801D
         j/hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uR2KMBaP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q26-20020a05620a039a00b0074c658aadfdsi606432qkm.112.2023.05.05.05.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uR2KMBaP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuWz-0007AY-26; Fri, 05 May 2023 08:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuWx-0007A2-4e
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:27:23 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuWl-0002m4-AE
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:27:22 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-965c3f9af2aso213272666b.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289629; x=1685881629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IU0MO3r4uwnLNpenuOEWtLhN3N9yQXXBloyD9mOU9jk=;
 b=uR2KMBaPV8825gRuNGzmhYFr13Xb5HtXkNX3RkeWXQs7Pr0bqaSVrCxL9LO0N7lpDq
 Su7hD9vDLeIyeh0KWqrhEnlN0bovDtOPnVubJOrdoYCeHXu/hIk/WwJfRucDXJWa4RLb
 H/3W/molE/wR5ZnRWaXWAgSOANZGThvIpGhuqE5AwokDn0jFizcaliRS7lLIjAZCSSvi
 pn7aYyk+Y8T35EoCFVKHi/rwylizaT9vxPfc+N2Wrlf3cNrDmw8UoBlvnxKyOMU0HVQJ
 WkWIzdoaASgzNon8X532iUquDaqvU4wWZ+MLYDp8XoRM8cnELTeT/c8XVU3ldQycS3gE
 kjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289630; x=1685881630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IU0MO3r4uwnLNpenuOEWtLhN3N9yQXXBloyD9mOU9jk=;
 b=jFmrEYSjUzrA40ij7bfB9fjLj4NlDVYX8o8dPp/2YKQ7bm2DQFAY50QTt5tKvBIm52
 4besPu2C8WrU37qOmdb2scUuakhahUUn6eVoo2SzmPXW47Ln+IlBrqWRuKTyFGzWTVY9
 vvqPnPpRJtGs7BRI3AxxISnngTqVe8pGkooIiHozUEcRpBAJaG78WU/OV8rzXFMKgzEl
 TB/3SKY4Jvhus+hp/uDfYJ+ehFeAtGJTrrGqRMC6NOvdor8LtfSsKvegYmyA8MzpsnyP
 PcehEIgXjCynq8LvjhKpLVIGdQXSFpL2Bg191ERbxhwLJCGkppA6D19AbKsQGru6FvP+
 9/TA==
X-Gm-Message-State: AC+VfDy8yMe+CyCkdoXuygaJaUqi2BBjrPthZyqufDIFc7DYDNXukUMg
 nxYtEnX35f/MVXD5XZIlsxHg7XEPIzhpLXM5sg6mkg==
X-Received: by 2002:a17:907:724e:b0:953:9b27:8f00 with SMTP id
 ds14-20020a170907724e00b009539b278f00mr1117237ejc.74.1683289629667; Fri, 05
 May 2023 05:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-35-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:26:58 +0100
Message-ID: <CAFEAcA8bQUdLfS9HNzFwHXPFTc5TNKZOi9KfpQMdFym+xKzD7A@mail.gmail.com>
Subject: Re: [PATCH v4 34/57] tcg/sparc64: Use standard slow path for softmmu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: c6Z9WkrfYvn9

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop the target-specific trampolines for the standard slow path.
> This lets us use tcg_out_helper_{ld,st}_args, and handles the new
> atomicity bits within MemOp.
>
> At the same time, use the full load/store helpers for user-only mode.
> Drop inline unaligned access support for user-only mode, as it does
> not handle atomicity.
>
> Use TCG_REG_T[1-3] in the tlb lookup, instead of TCG_REG_O[0-2].
> This allows the constraints to be simplified.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target-con-set.h |   2 -
>  tcg/sparc64/tcg-target-con-str.h |   1 -
>  tcg/sparc64/tcg-target.h         |   1 +
>  tcg/sparc64/tcg-target.c.inc     | 610 +++++++++----------------------
>  4 files changed, 182 insertions(+), 432 deletions(-)

This is a pretty big patch, and git diff hasn't done it any
favours either. Perhaps I'll have more stamina for it in v5,
or maybe somebody else will look at it...

-- PMM
