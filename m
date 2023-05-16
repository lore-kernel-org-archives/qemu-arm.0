Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp321097ejq;
        Tue, 16 May 2023 03:53:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7nG9h99ejiDUT7VuHk90jmTY1mBjvCElWKhzAwz75e6ljBQ7X2cHyeITq6pRhcRdT+3HF4
X-Received: by 2002:a05:622a:1189:b0:3f5:16af:17db with SMTP id m9-20020a05622a118900b003f516af17dbmr15626780qtk.0.1684234403682;
        Tue, 16 May 2023 03:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684234403; cv=none;
        d=google.com; s=arc-20160816;
        b=o4OmC7M86F80/3UbYi3CVSX9yCabK44GH6LVWColASKzC9lLF5l6k4eqIr/x0kDQ+X
         qy+ht/Ntj+neQB/1KP2N9BWXjnXr23LeTLlHIUme6pyHhjhabL6PAL+CNPWHWr1zpst8
         i0nu1QFXy/BbsbtN4uDf6E4GWXSDMp2xAm1EOQGOSnRD8EeoJ0OAsmXTWpYgwNI8vA5Z
         +bh0Qd/qZadkQvfyzpYJA+/Pj3p7aNQur22owF7OiAwhm225rALXmdTeD15jMds/h7lA
         qL24MrLMSSWoWhwyCsw5RDhsxnG0PQMbPSou6BMNZxO5USuyR144pnTtCWMUNRso5nLN
         OzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wbPbZoPr3KszxC0sOeNCbhPntyIb5xeiZgy7iVTdAls=;
        b=wusESad/Gv6DfVyjQeLE1Wbm0hsQ8hYiJ2DEFB1ubrcXKTXEaLBRmsOLqQYt8y+0n0
         RQKEFlJ7eIbFkHBfqP30MgDJtLpVIMs8SbvwEscErZlxyCGTybfX8oPRzGi8pTPP9u6K
         QN+nLlaOzZ6JKN9iZMGIPj45In3rSPSQD5mo+JvtvbqmW933F+9uBmDNl9WxBNLPVPMd
         I9FVl3aGflXNp07ISv9ALB0AfC6BPLqTyUUf2LDHj2/qNfyunynUHzSp2CMl94t40pzw
         zq5lTmL/NVSMPMZ/lmX2xpgJysfsgvip7TtjzhAB8vNG77yeuzhK7JNzOqr7Z9HWGeu9
         hS5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ta5BFtiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020ac859d0000000b003ef5bbe2904si11438106qtf.741.2023.05.16.03.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 03:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ta5BFtiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pysIv-0006Ta-A9; Tue, 16 May 2023 06:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pysIt-0006Sr-Tk
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:53:15 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pysIr-0006y5-CQ
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:53:15 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-510a59ead3fso132787a12.2
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684234391; x=1686826391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wbPbZoPr3KszxC0sOeNCbhPntyIb5xeiZgy7iVTdAls=;
 b=ta5BFtiYrlQroTmC6s2bGn+J/TyFl2xY9WLVvwS74Vo87eDleIabp7x/bK97SH5KR8
 ZbmN83E9MvWJJX2KjSCySITTHQhx2sjnar2UMqQ6YUK9GfFh0gX7YT/u4XSzdQWplEsL
 xdLS3BWHnOB5aUk4TlhGU0hGIoKmeMY8N13wfRVsjJGrOr83mY/ho4PDAJhxiD/KRNRa
 nlzFMecG9xSDxKEcKT6y+rx5GJLNoDtprwRvLq1IhU17JOKGzBxvuRSvKGVK9RnMJ894
 ihEUjV9Uc25ykkHtUtVwuvPfADJPDRdDMB5w0puW3LWgD6x5fry+i/dRFLhzjY14fHTg
 Txng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684234391; x=1686826391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wbPbZoPr3KszxC0sOeNCbhPntyIb5xeiZgy7iVTdAls=;
 b=A7UTEE/aMMRLN8qtffU7x2If+ZwgSh/evtl0cUMkKA0wHY+QRyHK6/f4KGPMJ4MQfP
 aaezEZvt/xLdq+n24tTrL2ZeNAs9thl6o3y24TaCNTkURDuh45vO+ppl82Xc5jaeSeCR
 HH3cR4u+nJOb5xFdqZZvlEcS/PDaS+t6TudTYdCe4KLHv5YxwybgSiLNXJR7Qvuiua9l
 KQeLVIPrl8kO/aMvuz7RP2ASDqJW0Nm3BZSu2juh3bx/HYu29SP/CWXEhL75edCcRFKw
 7WBOpSWQSNHB6qBiCAYs1UHPrFvnzR2Pvmj9Jc0fs7L0C4aEEVZrgejpucTvssE9XwYh
 A9SA==
X-Gm-Message-State: AC+VfDxqyw4w6O+br3k+OWDHq16dVCpYejovGwqJphAY1hqnFhRXjo+k
 yBFkt7vGElKIG7nUsNYheQpmU4Tixd8vqnFcZE1uxQ==
X-Received: by 2002:aa7:ce0e:0:b0:50b:c584:527b with SMTP id
 d14-20020aa7ce0e000000b0050bc584527bmr31589592edv.29.1684234391446; Tue, 16
 May 2023 03:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-30-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 11:53:00 +0100
Message-ID: <CAFEAcA87zpyLO8JsHjNPFLO=P0QL-fHGOyA9zgUum=K1AkC5pA@mail.gmail.com>
Subject: Re: [PATCH v5 29/54] tcg/sparc64: Use standard slow path for softmmu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: om1GpzlmVJxf

On Mon, 15 May 2023 at 15:38, Richard Henderson
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
