Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1229452lft;
        Fri, 1 Jul 2022 06:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4FwT061yqWEFE/O1qShPnDbUqDJx6V2jjtsIe+mQ8lr2kEosWHQTdBticCCqaHEWVdtNa
X-Received: by 2002:a9f:2c8f:0:b0:373:7d08:106e with SMTP id w15-20020a9f2c8f000000b003737d08106emr7858350uaj.37.1656681009863;
        Fri, 01 Jul 2022 06:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656681009; cv=none;
        d=google.com; s=arc-20160816;
        b=E5yXQ0CQCL2mBU4TazYnzVMrjAk/xrLm4i19ZyNwPLJ9ixZyGQhPKRkkOaAcXqHVL2
         VRf3kohw9zzs0ZPF3HLlK5lZRAjnoUt7fJIAcMRJRzFIUUz9DzRAb6D9n8yQA5FZfmAS
         DPAVDvdVV2T1Qu/ZgbkZpk5H/FWwb71aB3+R42oO9MZeJ7qnW/97TikT/PCwBBTAdOvU
         tVxKa6LQB5r1cxYvZfd+sjOJ8Z2ADkTn8l6uPB4EDP1DodXsI1wWAr7Ys8LpyRyQjinS
         C7P6zVLMZYEw0cs/yf79n0siTJE72XOJtD71Or0oSaIQxU8J66ZMmYvsUyRXx5JwaJ6S
         FW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PkzF54IB/3iibPcE5a4H88V+0dRJ8X/tvMNJ4w7r4zQ=;
        b=I+dl3gfvCqKARumx4XQmoj9fREO4CIA7nXWsF/xtBpJfSzFTKabQKPlmA56G41+t2B
         c9elTBnvlvQZRrCNt1msWWI3aMI1jtpUPwHd8bR3Gao14oZqTSlJ1hd/OKJ9U5/O9Odh
         nCoqo1ObjJk+dkkha7KDIRZq9Uy7TCs359/I9gPTgdX1ZgmJ5vNjoHGvP62u45lTRbH2
         5DxsL4mWPUyaoGxnOk5u5jRM6O+ZU2tFi6VUAiK60IDn4iAIh8aj29ZAYh1WDIYbeonq
         EiM/sZ6UQAcnphurz65VoXXy6CpKL+bJzWpj0DBHwyR7hxLjwdUwu3WLS49TmJk1KVIh
         YcRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LP7zzuVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5-20020a67eb85000000b003542df8a65bsi5318700vso.451.2022.07.01.06.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 06:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LP7zzuVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7GPQ-0007aQ-In
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 09:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GNL-0004O7-Pt
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 09:08:00 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GNH-0007uQ-2Z
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 09:07:59 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3176b6ed923so22797417b3.11
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PkzF54IB/3iibPcE5a4H88V+0dRJ8X/tvMNJ4w7r4zQ=;
 b=LP7zzuVP5+EKmfiwAhe+MmdOlachpkCqGdiO8GriJZNr2l9VDLyoOJO6RZRkAtgjif
 cvwO+93wGBiZelPXq4kbf7Ysz5uDDtBPmiEJzLlVnAnNmNRbx7rji+G3Hxy+dj3qfXen
 UeK8VLndK5Mxtgq5oJmv2CKEs3O9MNr2FNm8drDy75pLtDmJbUcdfMkeDMn7dTWi8BDL
 HuWFIi6XmIMu39qcCgLJYfj7uRUkXhBwx3IMrbZD72Y7vyjnrUX2TbeVTzvpaR97W0dp
 d9OjFsywJRhiNDzfokR8CQpedjD+BUjArQ9cPNK5+AT+bIPTiONuKs/JcRajTMXVe/x8
 Q4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PkzF54IB/3iibPcE5a4H88V+0dRJ8X/tvMNJ4w7r4zQ=;
 b=NzM8E4I9y/oPZTIotXqMXIOjtB5BJWZvMBdKCUU/H4UTVhH+7vx6vQgd8EyARv1KKU
 fHUy1ipbiTKXI6ZFqHAXXQxgRCZYACPIfWIUwdzkI47+AlJj7R8BlKJsVyZKdoH/EbwE
 RWrNIsNycDnw3HFHX9K4V7N9sHm5CZmLqKqaJZ80Tw57v55xb/BpFXhOg4ZwWeb5WHmC
 Al/SjVgqjaQ9ga1u0ew6jSGMpS0gentcONoRpj9GkZxouGJfRWvUdu8KYjn5bD7K4zfn
 YA8afTOvphUFyfuksKG8POwtxd/ptc41VPYHTNqQ239NkFoMrI7qRQ4H4ysamWPAap2U
 tUcA==
X-Gm-Message-State: AJIora/lgHJSM59tXLj7YIFcSjIWpfenlJJvjSOpAVKeI3PhzUwabyAv
 VFTzuqC7h+IYGukomnSHUl7M9u8JHUEWnc+pN9DO2Q==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr16881404ywd.64.1656680873840; Fri, 01
 Jul 2022 06:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-17-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 14:07:15 +0100
Message-ID: <CAFEAcA8qAf2Y7uRT_+j2QGCXpX0m+OGaNP09XFWp9OGQ-4Q7PA@mail.gmail.com>
Subject: Re: [PATCH v4 16/45] target/arm: Handle SME in sve_access_check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ZSU2gQt5QJu

On Tue, 28 Jun 2022 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The pseudocode for CheckSVEEnabled gains a check for Streaming
> SVE mode, and for SME present but SVE absent.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
