Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp50971ejk;
        Tue, 28 May 2024 09:05:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeV4F/dbSBbnb5q7Qj7e/a5ttH9ynqDr8SnYbRZIcp1gm9m9Mm6myE3HiFb3jA7bgPEXggLX/255deFySTMNXMtdYFLne9
X-Google-Smtp-Source: AGHT+IEU/bzkVzitUie6niWxhYIG0h/GlV0MLwC+1ayi936iWuCuyuGD5yVrqnI+kpSE2MX0SIK6
X-Received: by 2002:a81:83c9:0:b0:61a:d4b6:6108 with SMTP id 00721157ae682-62a08ddbe94mr122718657b3.30.1716912344400;
        Tue, 28 May 2024 09:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912344; cv=none;
        d=google.com; s=arc-20160816;
        b=nbRaY4dhgcQjkSF1HkuRRO829bZEo5CWt/FdZWxJbuHLzNGOMoBavjChsJf65TsaFc
         tNHtZj/zjHv/VDYBIJZOJDis1YCzP7jsdlroaSPGi3+RPfV3fhwLQhU4MCjizOkGV4wk
         WMFYkffFXI0hfkzNFbMiwxfEpr7Q6bG2fbSX6y1nCDtToCS/5yjuBOVA7qWAm9L0j+p6
         5phzvc3/IUTKNBv9wsg8xClVs3aflZceYvCfKCdB9/xvfxYclAbvmDi8O/jRIgeNITTF
         r3m5B5mw+ijpfA4gOTeg36YmUjbfC7OU57gSOdcmO7qorqOG5OPOIUynGi95VrSol8Sn
         95wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GG9FsqxUtLzktGbkFGaST3fWJoNoXL111OT+VEK4qRc=;
        fh=rK9P8nLH2LO0WcOS/1iGhkJrwGnGLAXTIwMMtUzil9k=;
        b=K35HLah0HLHFTcXNSmdZk/qL3vjslfWZFIqv0ACHbx+n4molW+BW4X9gH2QfG40Vve
         8Ksq5Rbyb6AvRYdMadCZObZV22vFrzcsTeQbI5xiEOURyrGZ3FySbhQOGctNgcvogsHT
         gTfMxFhLaPYyvaSb7sCZ9hRIMfVqZT8eRslZRSS5wcsVVTeO8KX70SX14E0KSBMR6N0d
         l+j3a6kb1HyrOAFvlmr2VMv65Bv3U6hRE06fiPWbyk7fmkNYad8GpQjIXSCjxoJ3t6LC
         VbGQPeh2MmZj+w1TmYiX67/biDRorDzEWN+iZsdV2yri6oh5atABLqzcbIAAPOZbaMx1
         AuGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y+jJWvek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-62a0a3d47a8si43422277b3.73.2024.05.28.09.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y+jJWvek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzKX-0003mf-VJ; Tue, 28 May 2024 12:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzKU-0003fn-UX
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:05:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzKS-0008Dh-VM
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:05:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5785d466c82so1252300a12.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912335; x=1717517135; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GG9FsqxUtLzktGbkFGaST3fWJoNoXL111OT+VEK4qRc=;
 b=y+jJWveky6hg+BdgJO+0Ul6Si/Ql2msXJgtfCjDT2cHbakiRa51OrIjppn+dBDJUWk
 OLmMYYY0MTo34xFeXOoGX46qGeTaGNX0v0tHgBgWj59Nu2lPt2NIQNoICMZeJNLWo1D9
 td8aRJEPUZaC+SrPNWvRxHUhZRxFY7dHkMibMEd+b+OZ1Qsd1i6VX+RJv+jArkN6LydB
 Cg2pBEPDp0DAn8ALet2lgqxe9LA1sZ+DMMoGeNRXWq7qihSJpIYqMOwfqUDhsFONxEca
 r/oNF1yKBgzzZ6n/f7vQIrl0rm38Ytt3/FOwN5p4vsA9Nzdbuqk5K0BkdCGOzfKeDfpm
 ypUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912335; x=1717517135;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GG9FsqxUtLzktGbkFGaST3fWJoNoXL111OT+VEK4qRc=;
 b=CLRvzPaWEuNIO9QYXci0VuIJwg7oF4kKr6Mn2VXwuuBF9X0TFA4UgfkgWKoqv0jYjR
 6KnRIGlzsiaJy//9wKsUgsnGSE1LiLYcm4kAP1KOD96WtJSE9wY49fUUwhu17T8kbeIA
 1gUJTeJlgzaj9CMD0rQqhGbq/Bnwb743FcXP/DbB0vVgc8b2la5FG1jvTNIja4xkQhax
 umNWn0K/ZTT156nuUDLozVh7A5qHJXhsZA2xCzhaA74s4extJfF1XKK6PCZU7VYoV04e
 6LS0bodAtuVlqVwa0TbOWhQqf0wSSX4n0gyAD9J5c9FBCNsnpcGK5Uz8x+A0imNEe0cl
 HniA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6D9eJmSBI55OoP5BF1ryB3BD/dwvlENn1AmSqoW6dgeWzBNSi7EuUh1MKUg7Oy9K8bVU+t9JE1/z2hfiYM80gUOd2
X-Gm-Message-State: AOJu0Yxowx9XWdZMXmPymmME00Nk/pHsD/rcQFR4Pgtizw1d49O1YqYm
 yXt7dtRRHZcHlmvH69pALwYoRnFTp73Dgmvmn3cN389r/Evg16qM/NhjoSQ4WQBr9yYXZwAVOyL
 5yi8lcGXq2khigjblOqGFCUjpXAkhOGj5gBgyatenqCc9PN14
X-Received: by 2002:a50:9b45:0:b0:572:4fc3:3a28 with SMTP id
 4fb4d7f45d1cf-5785196a218mr8267315a12.23.1716912335430; Tue, 28 May 2024
 09:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-62-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-62-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:05:24 +0100
Message-ID: <CAFEAcA8zprPQDtBATn5HzVjujsSCQrra7sQvfiYSNN6yUjeDCw@mail.gmail.com>
Subject: Re: [PATCH v2 61/67] target/arm: Convert SABA, SABD, UABA,
 UABD to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: raA/1Z+NhR7c

On Sat, 25 May 2024 at 00:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  4 ++++
>  target/arm/tcg/translate-a64.c | 22 ++++++----------------
>  2 files changed, 10 insertions(+), 16 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
