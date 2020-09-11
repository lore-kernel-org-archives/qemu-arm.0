Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp229284lfq;
        Fri, 11 Sep 2020 12:28:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7AJparAzyhRbr6czLsifit4f8S38YLWVALo3mHymb1mKMtMU6g7xwTi70D4A+cXL8MJE2
X-Received: by 2002:a25:9708:: with SMTP id d8mr4612323ybo.494.1599852535415;
        Fri, 11 Sep 2020 12:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599852535; cv=none;
        d=google.com; s=arc-20160816;
        b=e5I1p8Hh33ttJPrVUYlae87lVGElAyaQyeICihZBzTFAK0OvUF8J4mH0pj742Qm4o7
         Q5iUoWxyZznUwKbpz64DiLBuSfxnRIbzr1SoYKut3zVD68m4O2VhnkcMPBM/6dAPxUhY
         +F+gH0c67SiTHgBaN1OfCfbkyew6AevNACJ8XnK6psApjXpMSEy/Cc9Pt60v2Sq48FLQ
         QzwGrboTrAkoGkH04ViiGZ6SspDZJFsmC/RFwr6pFPFOqnTwJCFCdEMKoFrnsVrMTbGJ
         ej5RM5KCEauCPIlcXAF9TPF/v4B8GIwpMkWeJ9mEMODU39a/F/ltSN3GoBpuL8vA/+7D
         LoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fXu2G7QgSPKE+pb5N6EqcAJif3KBic99MPHFNN6m6Ko=;
        b=a2PAw1NDtpIiW8iA8gW72S9/Viq+Uw6le+FVuZVC5j1rZWigCl/WuL8zchDw9fnBQw
         PnPLesxGztlHB2STRBkEB2NKns0TNjiB/ObWNPen8EMS6qr7WOYCwscAACPe7JBvq45O
         hrm1BECqYrzLiUo/iDAalhVTFU4AhZJDE2Kmq+EKIfyLySfJVrULKo4qBBHJpW3ZIsjW
         IayAZJ+nVHNnk0HBalh2plCOJSg+H4TCB/kKdTPMkUJY1dJ/dKxB/+TkXVQ4ISSeT83Y
         Em6P1mEOUU+sTzW/z612RitDgCZvVs5Jm4+/nJ2AagAZ97TMbEr5ZcQq6m0OqRe6oQRU
         BFbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOUHvcL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si3029114ybo.60.2020.09.11.12.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 12:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOUHvcL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGoj8-0006Zn-QJ
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 15:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGoiy-0006ZX-18
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:28:44 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGoiw-0008Ms-Js
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:28:43 -0400
Received: by mail-pf1-x441.google.com with SMTP id f18so8130089pfa.10
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fXu2G7QgSPKE+pb5N6EqcAJif3KBic99MPHFNN6m6Ko=;
 b=nOUHvcL5XtQuq8zDPJUaSIQ1Orw0yaGCQDykpSvsQY7+8B4iFyk7hdoqMtu2gz9gFC
 rcAmExVPPVV1iy0ZVs0lFfynLBfpZ6Kv8sDLJRxU9BY71myPbVeUoszgWnvT/udkT6rF
 L+lVcQ6xVnrqBLSeQYBGSznpiT37B01XIOIWUnCiYZ/vaJJtfwFOglzOKbgniBduDhQk
 FjcqwRuI5ReFMolC+MjV2OFCMTq6h4E4iVjmKZkYlndPpWOmFNCwUltm21fV6oNl97/M
 YgM/XzkQADFsDJUQjLw8TehjVorZ7qXOy+PcrjQWqA8ukL3SRfYpKbPsOxJDXgWQh0XB
 KQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fXu2G7QgSPKE+pb5N6EqcAJif3KBic99MPHFNN6m6Ko=;
 b=SprK0qhRidq4Nj5+PMF/rejQjs/MdxUbB1YXqygeQ0ICOAbLIfW+MgG2dpfaJ3bLWQ
 Wmm8V0B5dX5wmk/vCmEjeb1DfBXr0kpq8D9lDuvMvmpIFBoljQHK7YnIaGTBibkgMqI7
 yMySz4HM2BdXv8u8eJQNTl6EnJID5xOcx2P8K8oVBVAjztBloMwC6zCrAitUllWudhE2
 CdZso9dZtBvQGyo4eCCv1ItsR/e4knHVNOzWpVwYAlRAtwHrF7uUJ2i+dYM0YZoYV3sT
 6inZOS3Ck7uwxg0EEXeA/FX0aflzbXDc/kmKR1LfBmVMKpCHa3M0aX95V8FfD93HB3x7
 LKUA==
X-Gm-Message-State: AOAM530iIWVlpjGDn/jJ7crBLgy0f7+YqcFvwDjefPGEBiEO547UGBpw
 vFB1EtaO7ZYRzbwHFU/oVvv+5Q==
X-Received: by 2002:a63:4d48:: with SMTP id n8mr2860546pgl.70.1599852520917;
 Fri, 11 Sep 2020 12:28:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a9sm2583594pjm.40.2020.09.11.12.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 12:28:40 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/arm: Move id_pfr0, id_pfr1 into ARMISARegisters
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200910173855.4068-1-peter.maydell@linaro.org>
 <20200910173855.4068-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a716d060-25c3-91fd-469e-0f49523ee88d@linaro.org>
Date: Fri, 11 Sep 2020 12:28:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910173855.4068-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: A78vUqeQwh6D

On 9/10/20 10:38 AM, Peter Maydell wrote:
> Move the id_pfr0 and id_pfr1 fields into the ARMISARegisters
> sub-struct. We're going to want id_pfr1 for an isar_features
> check, and moving both at the same time avoids an odd
> inconsistency.
> 
> Changes other than the ones to cpu.h and kvm64.c made
> automatically with:
>   perl -p -i -e 's/cpu->id_pfr/cpu->isar.id_pfr/' target/arm/*.c hw/intc/armv7m_nvic.c
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

