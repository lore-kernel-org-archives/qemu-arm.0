Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp265916ejk;
        Thu, 30 May 2024 07:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3UIgQAbfgORqSNqJvm0CT6m8XB13NRNXWqrhhKPNXESFYoeocOsoGQWqnJqKhP9gXLB7ftNYjPZiNhUvS6lxhngFpHYjc
X-Google-Smtp-Source: AGHT+IEqezZR3ojJiCpGObxF8x/I0CsaTav0MMkpjGvdVCMOTaxW664Mpd8HDJ2J1BdIUjW1K7Jj
X-Received: by 2002:a05:620a:20d8:b0:793:19d6:7b57 with SMTP id af79cd13be357-794e9e49d54mr226055285a.65.1717079565341;
        Thu, 30 May 2024 07:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717079565; cv=none;
        d=google.com; s=arc-20160816;
        b=dfIAIZbQ360UN5UTJVbp/OTWIZti1l/7yOtecj8kJF9E3KuTTNEDZdOKedNqDuoJvV
         Kib4+9RfmRNOMZvYY5GVSPmtyFGwKB84j/eYPZzQej5yM2CC0bqi55nCwfHDuXhKhidI
         ju+Ka2ZwbfeTBsrr7p1Wedm3mOjG1kds2IehwPHE0P3pURlS1JDf0OM85q7SMM/Vvkuj
         zUqr3InzyXRSU44Q/dYhxL0uNuArVYYwjOSWvXgmamQhbubYCsNpEdU0CKQkMvrVgowi
         qP7vch/8dRsl/cAIMZ+HcbWrKChWBhaKQGkHVINLNQdIAZkgr8bLcqziZqRGd+LfQjyi
         yX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6PQk8GLJL82FyKYm9CCZMTar4iu7k3Wi/T+veQwExR8=;
        fh=nkbVqBwn1AxZ91QWBuqG8bL8Pkp0/+/pxgZ5lWDYlIo=;
        b=H897Wta16xeK0oj4lLqZILxjM2R1QRN/LHRNP3OQ97fiRyS2YnGwTeT7rtnN212yMy
         gDqKkOQ38HqCL3pMFdiKKhahR95bFa+qUz6z6emvEoqN1lN1L6qopLzBKBpStpCvNAcj
         cGwssIrwAaZv0Ey+FDEeDFI5ACSarskoHjJ3IugbLH1lhwcy6Q+lwECrKCaiy9d7M1hy
         07Wz8Ezh3UKYd0hCt9Nv7yZDharkpaO0HGBeuTcx5YmVk/G7OEPFcA+cgJKfw8iDTXc4
         aPiJRr0Dg76cRZiZx3vfiwhF0ms7QXvBr5bB4lwpSKDfm7ALsDZPiDju2acoPO1wXDB0
         F8vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lwiCeE5Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd5395bsi1505606485a.669.2024.05.30.07.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 07:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lwiCeE5Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCgpb-0005Vo-FR; Thu, 30 May 2024 10:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgpY-0005PK-To
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:32:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgpW-0006Lt-63
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:32:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-354f3f6c3b1so883090f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 07:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717079552; x=1717684352; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6PQk8GLJL82FyKYm9CCZMTar4iu7k3Wi/T+veQwExR8=;
 b=lwiCeE5QdrbmSU0bTkanLv57V5XDraytSX5jBCTZSMW2ulDP3imXDd9wVfCI+Q5LzK
 cYA5ab+2LEa/N6nDggLtS6nGWthIEHIlW4FOfqBu4JwbQ1f9rvDh7bijw1zCsjCdUvii
 +qLybtFlBEcOJhkrTJgP08NsoDz7gic/1Gc34Om4NJ3eul2eoJcRBOIj6HimXp57WIQP
 Sn1khbGdqBeszXbxceVkWkhB2jYPG3O1RooHhRwNL85xJA9xuJ/OpkJMiQ1DMKOoBpSv
 9aJeHqs7CkVVBucPxfpVr0pOzse0NUXy4EvrvqpWDPkx0gNB7Drw79PlwmYr3isFreEo
 tg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717079552; x=1717684352;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6PQk8GLJL82FyKYm9CCZMTar4iu7k3Wi/T+veQwExR8=;
 b=iDGTcnbfltz0B4/FMNhL9twRhqqqFU9br0gbz7c5xxVbfcgYGMAyY556CEjtQpunTF
 9qpPnyCrJh2g0VyPTMJu8vF2BG8F2kTnqvZxsnjw8u8ZFv0kKKNFU89+gyexT5S/F8yy
 mm5aP3aUf3gVwfChbxfkyqh9BuL1fxi/hvdiuKGMMzLx8RzknPGec0RF3QQNFpuL4g48
 Zq72nw/QuKJQTeViLBHe7T9ux7abupzDJAjE5cgVPls9dGrn7JmB9UO8GqqAkAyr16Dw
 HM0+qGZ6VoUoaYm1WL+6r14zg9GebzpY/3Wn3ZpzNyyh7HhXSk0YGtjiQw+mTEe5q/VE
 gMQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsH9mLfqpEy3qg9XnsYFUivD18ktQhDI62NRiVOX0wIrJp8Q70NeLwxgMHddrO6JfpIpfwU5gyFc2HEG1+YQvscZA0
X-Gm-Message-State: AOJu0YxKC+iZo2DWjcyxAJUtXljIJrCghFeOdxGtLwbyiln3yOcizEiZ
 5GkdPe75pT9MJmkhNDrEUGqCpZbYxrJ/NwyuVQWddlK4SlBwrJs2MHCQ5C2yVSiIrotU/EvH4xb
 EZQEj6R9jZ+b5fKHJ1zOryw1vnNB2Fed6fFPpBw==
X-Received: by 2002:adf:ff86:0:b0:35b:9ab1:ea77 with SMTP id
 ffacd0b85a97d-35dc00c99f0mr1727012f8f.53.1717079552645; Thu, 30 May 2024
 07:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240528203044.612851-1-richard.henderson@linaro.org>
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 15:32:21 +0100
Message-ID: <CAFEAcA9pGM6R89LzAfEaN9TVrbj0oWeBrO9xBRn7hSx+OpphLQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/33] target/arm: Convert a64 advsimd to decodetree
 (part 1b)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: ZEpJ70D8DYBp

On Tue, 28 May 2024 at 21:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   * Reword prefetch unpredictable patch.
>   * Validate vector length when qc is an implied operand.
>   * Adjust some legacy decode based on review.
>   * Apply r-b.
>
> Patches needing review:
>   01-target-arm-Diagnose-UNPREDICTABLE-operands-to-PLD.patch
>   03-target-arm-Assert-oprsz-in-range-when-using-vfp.q.patch
>   04-target-arm-Convert-SUQADD-and-USQADD-to-gvec.patch
>   10-target-arm-Convert-SRSHL-and-URSHL-register-to-gv.patch
>   12-target-arm-Convert-SQSHL-and-UQSHL-register-to-gv.patch
>   31-target-arm-Convert-SQDMULH-SQRDMULH-to-decodetree.patch
>   32-target-arm-Convert-FMADD-FMSUB-FNMADD-FNMSUB-to-d.patch


Applied 2-33 to target-arm.next, thanks. (Dropped the PLD
patch for the reasons we discussed in the other thread.)

-- PMM
