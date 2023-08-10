Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp786401ejc;
        Thu, 10 Aug 2023 09:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuVuFYKuxRGKVnEFwygH7Ei07RlbXUDzZbZg2CSX1cnAY2zhw3Kmdb+0Ban21WkBAzaoUG
X-Received: by 2002:a05:620a:3711:b0:76c:be58:d77e with SMTP id de17-20020a05620a371100b0076cbe58d77emr3315788qkb.60.1691684067262;
        Thu, 10 Aug 2023 09:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691684067; cv=none;
        d=google.com; s=arc-20160816;
        b=rH+dbjooNCO0s9UCgoyWzaqsGoqH4mOr7OnsLdZojAV2qaCaBZViMn+uyFSOKT5o54
         cDqs4nTXYdpm+zaQrJmsltvyQpimnr6iJ1iJCXP67NwCjFGmvxl/eogWpCK0E2X1PRXr
         THu9KJEpcU5R8ETpelLeRYiSLmEWIPvS5V/BuRugoCsJwlBTi1rTga+hd7skUW6UnKJX
         +MLKemkpiLszN+OBRw5KEF0X80TRv/msDkVQfZXmcxshyVsUhMEb4OoGN/z17rge+1ng
         Zrt6CWsSaAlm1bfZR7gmTNivd6d2bEuejZ37CKCC5q9mdVjAwA1OpOF4XWl14AwBwODv
         TqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Qcwjnntdq+oCHbw85MH3Rd8X3dAD2VZvQP7llfyzOGY=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=hPgFbrhHcUI0AQ6Kj2FOuHOCKBuh2pn3GnEDb6AhuDJPCj3EaOs0ktaIZJNpXoxsaY
         +FEO8AIdPHCM9sTKk8VOd45XVyqsok4ExeJ5eMcZ0+LMqyeiV/t96kggn8CX7bRVZpgL
         YWerFqKBHh0VxUvRqNx+B7+6JLLRGlcRT2svFzXSmf50JgWg0P+VIilg1yWCJB1A8evd
         5526GU4pqERQXJqEra3Vp4Ghu77llkqvugXLpJ3NT8WV/zWWLbKnEgvOq85e3VJWkSRx
         2GARHNKCp9bj/CvAPTx7xLsPiGfS897wXAQJvmdevzlnYCGg/nDpmkDQJ2UR+qQm2dAR
         cn3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ywfI3COd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a05620a0d8900b0076c98e79ecesi1094587qkl.583.2023.08.10.09.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ywfI3COd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qU8IY-0001Lk-HO; Thu, 10 Aug 2023 12:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8IX-0001Hn-Al
 for qemu-devel@nongnu.org; Thu, 10 Aug 2023 12:14:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8IV-0002mL-VT
 for qemu-devel@nongnu.org; Thu, 10 Aug 2023 12:14:05 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5236a9788a7so1419193a12.0
 for <qemu-devel@nongnu.org>; Thu, 10 Aug 2023 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691684042; x=1692288842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qcwjnntdq+oCHbw85MH3Rd8X3dAD2VZvQP7llfyzOGY=;
 b=ywfI3COdx5ZmqO76CtTXeuza33jC7LwNYI0M3VRwcMIWpuPF/wI5lEGh67TZmmvow+
 TrY2nhdaBCfyWR/6jx7yb6uvqN41RVBBx8vMEM+9oUOuKa2oAfo5AWp38Q59puY24jpq
 bfDVqL4CWg7wlcPx2iN9PXmMUbF4V+2l8efcmCS0AfX2NObreKzkhCHhqZVD+iiTxgDy
 B6O9S8ASOfXDCipgcUcCjt6xZXotQ++PHuA/VkjBv05lK3zS8B0Efy9Fbr7a6NNLBO08
 h4YBFYpk39fhMmRzQn/kzrv4I+a2Ht1ompymZo5efK3GKr7fTdhXdJ+qCvit7l8HxpXR
 N38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684042; x=1692288842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qcwjnntdq+oCHbw85MH3Rd8X3dAD2VZvQP7llfyzOGY=;
 b=U8xnJYfrmkjy3f5gJIMYte/tNhjL7hi9I8JAamIbs9pzEvt5liaMMFmJfRK2lm9xoE
 R5hOL7YpoKDXq/pVILHhFHcYUNIOlZnF1nLt8aGpMgpJtbt3fbUlo+ixVScZAHEtCiwY
 3XxIamBGxaSN4u0VO2fq9fvSr4Jk1joiOXNInFg9Z5ATM12lUPOOmLeEPZc1qWwfQgF9
 GVkVuhkAXjRNRNgNVOBlB26EBDQndRFqqIxmmxDxuYqAGL+w8PTaGu1QxOYc23x2VVUJ
 Uogwxbn6L+CRk8H8Yve04k06RzaSAuDZ4AB84474Vzg7zHDbjaCEvOvjv0chtagw0GEg
 enNw==
X-Gm-Message-State: AOJu0YyNKxyi9dazkgdrnGaK55yMvychKmjU9uvxj2bBpcaZtpWqBOGf
 hEjox8ivV/eN1F4bvxewAUQ4Gj5lwtMBbqnZDo4MUw==
X-Received: by 2002:a05:6402:12ce:b0:523:35ce:bf50 with SMTP id
 k14-20020a05640212ce00b0052335cebf50mr2594758edx.23.1691684042523; Thu, 10
 Aug 2023 09:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-3-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:13:51 +0100
Message-ID: <CAFEAcA-r6hZykFQo_5KFp-kfUy+Ytsrd5TufuG7JH0TYhgcbYg@mail.gmail.com>
Subject: Re: [PATCH 02/24] tcg: Use tcg_gen_negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BsW9D57W7KCS

On Tue, 8 Aug 2023 at 04:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
