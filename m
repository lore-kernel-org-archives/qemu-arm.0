Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1318707ejc;
        Fri, 11 Aug 2023 05:08:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMLTRyh2ovumpAiQYq9JEYVfADNWG18ZMRqgEoRGahANY7HQLAymFcdXg/PatH3VvrpSiB
X-Received: by 2002:a0c:dc08:0:b0:63d:218:c83f with SMTP id s8-20020a0cdc08000000b0063d0218c83fmr1477497qvk.36.1691755709107;
        Fri, 11 Aug 2023 05:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691755709; cv=none;
        d=google.com; s=arc-20160816;
        b=Ee+HPDGX0/XvKMoXar60iOcz5xxvnolgqKcjs9ReEVEr7yUxVpC6X/FH80S6IULq2S
         VGpRnhlecXvJW9IwQS4R20jflTIZqUtlQxALqGfYwyLFsHWxOhXouOEkgibSNbozny7Q
         I2kJdB8nA5ResvialFBbivqeEZhL8T7Q2HF4bNnnCWFXIkoPyR9IY85ShxHwJ1H/NX+W
         6puaXS5lNkF8yjDsQWQ6t1QfMp/dYtD/smY8OVI0SeUx5ERi4OpikgupQ445ycggmngp
         UQwgMaoXNnrCZ4J9TR7jIUz8CkP/ifiITw1rK/96z0ZxPkFXlqV0CKEPzdDJdvKEVsqF
         lCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ndQEBja9XdSNCO3BDSnJc/BVCJ7aH9kI+WenktxzA8o=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=uZfPTgn6VfEVnnA05AlJeWEKttfmUQc5kFKOF0x/c24S52DmDyN2CRWaKl7C+EYSwS
         6WNhn/ngjykD+7fC0o1xsHwvZtqMVeDwWfB3lIThkEWnYBTVuwi5y0js84t6oT1HK6Wo
         DO+gGBeBcxiNYej6fSccS+5RnHu1+wb6ElCXPzBmlE0GLlv17RTvEDJ3IQaOIgqMgrBE
         Ro3O/t5DVmcBPDoV0+NC6ERgSCRENPIMXoVFJTpUyHHVAxAWrzAKPijTbRSEYEnIrMTt
         6yMkDO7sxGctRkX6YHNct0jfVrTCLaBf4d+RRfjJYY+CaL2X47xweYUIAOhHwr1WaF5V
         GZrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giPLu4gu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020a0ce08a000000b0063cf3391f11si313872qvk.524.2023.08.11.05.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 05:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giPLu4gu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUQwC-0003ws-Jh; Fri, 11 Aug 2023 08:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQw4-0003vy-St
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:08:09 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQw3-0002uh-7O
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:08:08 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe0d5f719dso3137346e87.2
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691755685; x=1692360485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ndQEBja9XdSNCO3BDSnJc/BVCJ7aH9kI+WenktxzA8o=;
 b=giPLu4gu3lWYuAaVRJbmMefAG1G6H9QxIXDdgL5msg5Mhl3UVKe/yP14dxX5N7eRn+
 b9t5XsXeBJgAMP5XI6GmOaCWaQrX1pN2rCL+J7fGHsDT20krk0UOh/8uB4oEBMcOsyaC
 G78nCXTWY+AMUj1oVZ2KgmQnplmezVjs9sbMvH0gWRkYvf8PQxNOexe9QHLWg1SJg2nB
 t37rgYMt6xerxDn0fqqCGGhiW4FVkChB77AdFlFPZ8sz3n5bHlBbxUn2GSToxu2X2IJu
 bOGtIRAqLN1xoH9UFMGq+tqJ/uz6z7bk4SxcVhgpaSrHr3vkgYLFV30VjpmME2BbiSR6
 pZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755685; x=1692360485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndQEBja9XdSNCO3BDSnJc/BVCJ7aH9kI+WenktxzA8o=;
 b=UEJnYf/MPAOpI9PiXOnTvwCfVFkWdYWUMRXoOcHeYNhDv0C5tMtFPCd/+ygTG/DCSm
 hf1HdBXIUDuVE9ctECIjRw5BqUI6ItbjclKBb1pwWOoBKWgKOamEe+Y+IiZCrfAQWVCZ
 8ehXY8tf1CZnByiu43a1wGDQJ2oxtuWc1lTGJPW0Y3NhRgB8bWp0RABHd6KRdfTPejYn
 vgYZcva3c3iGfn7dZuthfZTHnVurAU8soZukb+D2DsJ6gcYFCDWVHxKl9WU9F+p9RDn4
 Y1jYclCXBjC5gFURUZCMg16REn/JFO9Ea9+jmCsvPq9IQ6+LQ9m/sSNzWyg9zBbYx0wT
 ScnA==
X-Gm-Message-State: AOJu0YwDaDCeCPXlFQgLVXFFuN5upPnyshGKtfg2Scru21dQPqCV9Eq+
 RD5UbAsOU4q6OenF1cIF8HjbXmQL5zQ60a/mBCdn5A==
X-Received: by 2002:a05:6512:1320:b0:4fd:d3aa:e425 with SMTP id
 x32-20020a056512132000b004fdd3aae425mr1381540lfu.27.1691755685028; Fri, 11
 Aug 2023 05:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-22-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:07:54 +0100
Message-ID: <CAFEAcA8kDbOkbV3227OJ8xodkFmH+nDTZrEDzXGf4Piaeo-ypg@mail.gmail.com>
Subject: Re: [PATCH 21/24] tcg/i386: Use CMP+SBB in tcg_out_setcond
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: KC0nVr87hInG

On Tue, 8 Aug 2023 at 04:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the carry bit to optimize some forms of setcond.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
