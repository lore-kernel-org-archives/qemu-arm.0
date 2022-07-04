Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3229077lft;
        Mon, 4 Jul 2022 06:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1bd5oWXgZUWboec/bC29bi9z9oaV6z0a/lgTID6Ha0OMkFlV0hRCQqBceMjyGzwc8AiGq
X-Received: by 2002:a05:6902:842:b0:66e:3c2a:c2b5 with SMTP id d2-20020a056902084200b0066e3c2ac2b5mr7382258ybu.406.1656941326546;
        Mon, 04 Jul 2022 06:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656941326; cv=none;
        d=google.com; s=arc-20160816;
        b=i0nt49SddYKVIHWva/KzGX62inhI9+taAHGknJhqN4B1nvE+kl3jPJzxtCvtPoJUgw
         cB1pkC66ISkhQwyCg65pE2z8ltlHJGOdiqzSfxC8/zoKxfMzUSBLhbzqux3eWXqXfnYM
         yZu1Mlz5uMu8gBxIXL9NwOu9+hHhnpuTl4W/aScUbf1SL1RuLTlknQvDiGbRqcG3fmc9
         jlZ8kleMEBHP1rajk+3ZBMu/Fu/a5X+SzX0qiRCkqlpiRD4G10Y97s028/Ce5+/k38jw
         D/mlJaNJ944dYR2qWQsp4ZsU/su5g2x6M1mc8BH9EFtsgloHXxYyTxkQUJJoucvJgzFd
         OBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eZEcfw9Ltdyx0zX1bajhXauTmKas08xUOUf1g+AMWzU=;
        b=lLsu4wPKtj3ksxmxoI84ehYEiZdD0q4OjjAdskYfC2eBav8CV3reetyNmJ09lnZG2l
         QDUzM5OEu4hgebFqjVoqpT/N1kEPUeri+4tzZerEemngWxnDfTUhYthyrzRNy42tTAr9
         44d7oLOC3P3q8x1ZcMeW2YKXMA6BmB47EpdXtbfRTE8ojY1prCphRVE5GEXD2oXm/tlq
         OhEQv/S99j3+R3ccR+g7tyPNo8GtIfxm1YX7G0hOo+s+dxhRtm1XQUrKSJwMH1dHULeB
         Y9wWJ/lb1f3tLKNaqY0Uf7TklQwFjwL8uH055CRIebdEGUGKfmw3NzBPMdDd9hNtM8RH
         mHPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iKk2IAA5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l83-20020a252556000000b0066e3f27fc48si5008922ybl.505.2022.07.04.06.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iKk2IAA5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8M85-0007qy-Ve
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lpg-0000Kv-4p
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:09:45 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lpe-0000z6-Hm
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:09:43 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 64so7508459ybt.12
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZEcfw9Ltdyx0zX1bajhXauTmKas08xUOUf1g+AMWzU=;
 b=iKk2IAA5pidcrlrw5ymRSt2HFQCjdbzzKD8M1lHZgmam5ROpd20PPp7wJCaYWiY2+A
 fQgC1M6wdSr+SutrZ5DAZ5YKauu6DkkfcPxkWRkq/D2qsXy9MzTUO+pKGsWD/rEjLA+3
 DvytNR4Hc62DsKQ8dXJFIi0qWDL54HwjZ88er/vyOMp9nr/FSPM+BhrSIHFhvpE2yHWX
 xqHf1sREdC2pws6VtpEypAN9YEHjTrNvx7S1CLzEpH9P3RwutDfEHR7zf/MfY9dv6m/V
 6ixBts6liOqmVzsNiNl8eVakDQUOIZWFWnbyQ4osvxCMA6QgcJ6dubwtZUq6O1MlzCwV
 7BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZEcfw9Ltdyx0zX1bajhXauTmKas08xUOUf1g+AMWzU=;
 b=BrEbVE47d5CKG2EWjIk1H4lPMSeJ4SuVI3JcOSvu2j8rZ/4ssp9ixH0/TX3wflX/E5
 GrSkrT6ITtohUfoOmYRM8C4gSUvIXWFEcuRUceIoWGDkPWrnzG+BDfa0CYSZJD2n8A8/
 lwnQRQ37Jryz/W+R132R8UUfjlHc8uSlOoYbaQ3raUyxi3RE5ADZutDxzdfiXP46zdvN
 4QoyYVowxSdE19eiI+TwKMbJkVFjSKuEAlziIr3Usd2rAtxP1eY3KKjqrFQ4pBVztnhQ
 7WvqFpdKu32BcXBFUJTS1+b4d1ngvI9rCNRepF+QdeVt+J6OhVl8w1C1SxH5KdWGPqgt
 3mKg==
X-Gm-Message-State: AJIora8wV5OKlMvynIELSqrpLN0wfYLxcxle5ztDlISO/bjCv129rj/J
 HJ8Wlq31rL+jnHmmhJ53OSrNNhXOp05kb6rIMQaZzw==
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr4807176ybb.85.1656940180310; Mon, 04
 Jul 2022 06:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:09:29 +0100
Message-ID: <CAFEAcA-6XVL2n01pWqT10JvPJwQ_f+O5x+T6D4tG1xf+KG=pAA@mail.gmail.com>
Subject: Re: [PATCH v4 00/45] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: oS9BJDHmQPhQ

On Tue, 28 Jun 2022 at 05:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Rebase on mainline (20 patches upstreamed).
>   * Adjust sve_access_check when PSTATE.SM set.
>   * Adjust sve insns to indicate not valid while streaming.
>   * Other misc adjustments per review.
>

Hi; I've reviewed as much of v4 as I'm going to now.

thanks
-- PMM
