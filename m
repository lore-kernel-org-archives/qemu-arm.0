Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp2069010ejb;
        Tue, 6 Feb 2024 13:03:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+tpHXsYMIlVPbUMGJtmqb7RfYufEIj/R/Kh1AwXYYBRfM0iUe2zF9hBVOJwqM9QNPf8e7
X-Received: by 2002:a05:620a:1a07:b0:785:71dd:1d5c with SMTP id bk7-20020a05620a1a0700b0078571dd1d5cmr4704545qkb.46.1707253419093;
        Tue, 06 Feb 2024 13:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707253419; cv=none;
        d=google.com; s=arc-20160816;
        b=G8TvmJ0jFY8isrq3PeqPOp43l1s0+GVXEHZlGoqo9jdk39q9LjEjfLP8nroI7s/xQa
         mAuTFlI03ny6KIHovgC4SOW5JrUXuGTTWDjHMJrNfRL5MCPQbltxDf4j+7BoWcCNFz2C
         iqPJenovKYNsjgHx50QNEh4YnbOMNgrGAePn2ZbrTybG6UZ0xVjWzBpyBiek797FrW9v
         oZVN2IbWScSBKHhhgL3Q5Fkeq/lPdlf70FQxfv+rxWhgXwPTHMhVP0NHB2nDiylJw3Qf
         qhfQC4c3NclPvf279wReW9BqK5CITdHhT+/cf7n8dIsTWjGN9Vx+3IVgmCNCf44qLtj/
         ax2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=H17TVfeIh+El+u02BPhbrHQl9ooyTjYnGE2925J9mUk=;
        fh=Bi+z8KbRiUYuwoYkvQsEwq2930H3mEzHzeNW9FmewqI=;
        b=wfETIdNx2bexF2pZvffwx+9eoiCl9wasYFEM0yCCHHi0janOxIqmwChH9hZPR3JR/0
         +auQazI0HvdPyaXk8U3ewKNYmWAIIBWXYqCkmADi+LPlJhJ/L/TLPK07mI4UjXy8pNEu
         uG2JkSWMBZURPCj/DXWSGcVUG+PW+zr5bcMPCXRGJsqyZvnS91o5hdqq1rUBuEYhrWiQ
         FqNFBmUVktup8VgokrTklwLn0zmxZJ6uz+eb4H5CFw8fVSKLv/s/vfLl4gLAnzL8T+D9
         vWotATbvig0k572oclIiTJwRokYuqa1Ey9TJ/w6gThxq42kYwY3l5H/wnlRWwR6amfI9
         eHoQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gx6EjHYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVbYmAZfeDpV/k41EXtNBhrZmcd26DKoZSkx6HFK8xcQHyEszyQ5p7ovVXxFfkSgHau3/ATBJHJgI1mprFxwkzHdvM2qONW
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020a37e20d000000b007832941b17csi3167268qki.173.2024.02.06.13.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 13:03:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gx6EjHYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXSbA-0004aB-Pb; Tue, 06 Feb 2024 16:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXSb4-0004ZG-3p
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 16:03:15 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXSaq-0004Qu-4o
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 16:03:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33aea66a31cso3786344f8f.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 13:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707253378; x=1707858178; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H17TVfeIh+El+u02BPhbrHQl9ooyTjYnGE2925J9mUk=;
 b=Gx6EjHYhR23YhbHlsi9uBFJawmCJfUhKtF9V1pUHChPq0ZdcC/GG/dGFzNQCYOUmz2
 JjX9I4GJqobf5P7WZuZpLkG23+gA1Tg1bW2DhRrBHmXDzY5IpzIVK8tDISmWj6LCST4v
 0/BcxPc0QpHGm25PFGSSEV5tIaFkhCMMyLfv/bRvQ23pjWtJlPQH0RLH3SI3/MzPxYv3
 Oha/HuLA+d9LNUic3joOEv7U362etTa7nyuLDaqdTVoKKIGKVa0XLmr6AdEwj3YefMKz
 23A0BQyMZBfUv7d6aqbD03Eb8fw0bsbtPO3AdhKkO+mxGXZwBgo/Mxteutn3XIHFTVIo
 vZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707253378; x=1707858178;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H17TVfeIh+El+u02BPhbrHQl9ooyTjYnGE2925J9mUk=;
 b=W4zkhjcY5Hx3c2XulYxIi0gtMSobu/zx3G/UK4pUNLgldqpfpjZmrYw9GaJwp/wl+u
 JDxSEtIf1wVxW8a/vQ4bCggNkmKLW7rG+QqmrH2YhloSnVMXGeQcCDDZqqJGMmcNx/+q
 5Nec3wiTbJJ3+SU85u35vKQCN7xF3aPiudVuTPhJFGoUYNGTeFg7CMKaSIJfRzxlRVVc
 12SIfSxxdtXZ+1dtpYtRfJzY+ag2Wxp+7CT1T4ZJW+TwwVn2HtsHudnHTo3JHnLJCtTe
 nJslBODX4tjw8IIUpIf7HwlsVYSW/MgSQQ42mTh9q+BE195VjB6YCqq1d4KskL+j362s
 4gww==
X-Gm-Message-State: AOJu0Yy2CKPB5yfA2E53cZuHWYVPacAq0XVTUoaSKaZalzsbVI0biz7s
 2YoExh9h0n5QwoKC5PQ3Lxhz0Q/9teeZf5clrBBmQdGyyY5z9n5aadH6LpMfnAqer6EQL4v/IBW
 rmLtrOn9lfHnR7v24apdK+m163NCKMlacKdhf9w==
X-Received: by 2002:adf:ce0f:0:b0:33b:21e4:68d5 with SMTP id
 p15-20020adfce0f000000b0033b21e468d5mr2123308wrn.34.1707253378414; Tue, 06
 Feb 2024 13:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-3-peter.maydell@linaro.org>
 <668729ae-4305-4a6d-9f95-c92fea6cfcbd@linaro.org>
In-Reply-To: <668729ae-4305-4a6d-9f95-c92fea6cfcbd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 21:02:47 +0000
Message-ID: <CAFEAcA91D1n=3q9GoY1TxQOq7q6h1-88H+qka6MhNnUuRrkpRQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] target/arm: The Cortex-R52 has a read-only CBAR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qonYXLb/1kTk

On Tue, 6 Feb 2024 at 20:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/6/24 23:29, Peter Maydell wrote:
> > The Cortex-R52 implements the Configuration Base Address Register
> > (CBAR), as a read-only register.  Add ARM_FEATURE_CBAR_RO to this CPU
> > type, so that our implementation provides the register and the
> > associated qdev property.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/tcg/cpu32.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> > index 11253051156..311d654cdce 100644
> > --- a/target/arm/tcg/cpu32.c
> > +++ b/target/arm/tcg/cpu32.c
> > @@ -809,6 +809,7 @@ static void cortex_r52_initfn(Object *obj)
> >       set_feature(&cpu->env, ARM_FEATURE_PMSA);
> >       set_feature(&cpu->env, ARM_FEATURE_NEON);
> >       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> I just noticed that arm_cpu_post_init can be simplified to not check CBAR_RO, now that we
> have arm_cpu_propagate_feature_implications.

The other bit of CBAR cleanup I have is that cortex-a55, cortex-a76,
neoverse-n1, neoverse-v1, neoverse-v2 and cortex-a710 have all
cut-n-pasted the line that sets ARM_FEATURE_CBAR_RO, but none
of them actually have a CBAR according to their TRM. The only
reason I didn't throw in a patch fixing that is that I think
it would be a migration compat break and I didn't feel like
it was worth the effort to try to deal with that...

-- PMM
