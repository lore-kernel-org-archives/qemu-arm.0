Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp885444njb;
        Fri, 6 Dec 2024 06:30:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPaeqpkWbiPQADxXLvG5nXptETwSn47rgjPlw4c5vzwH4O62hXpA61U56LUgoYQRVrn4asOtuG8CbuBw==@linaro.org
X-Google-Smtp-Source: AGHT+IF36MOn3T7ikYBU8NV+N8HMTMoD547tXim7gdGfaQ9M63hYpxLRqB91oUqwIYVD/ME40IDT
X-Received: by 2002:a05:6102:5127:b0:4af:5eb5:8445 with SMTP id ada2fe7eead31-4afcaa80499mr3692101137.12.1733495424532;
        Fri, 06 Dec 2024 06:30:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733495424; cv=none;
        d=google.com; s=arc-20240605;
        b=l0e6KX3PvYV089kUVZISih43EVjn3q9aeM3xyS629feboj+KJj10GE4C6cGv2GppA8
         5KbVemiyrg0yPnJzpngKVKvRNEHTvZjfaToC4rOpWSIfWbwNyI8BS1meSa4DVAxfvSII
         AuW0MihL5ITplvgGuIGVonnjUxtDB/nLg5NxVlT9WKP9GwUL9pfFBSlY1Ou4U7WLJGQr
         PgX8nA3ZKK/qrgb2hYn/PtX2JldSsMKRn5XYeLeijLNyQE7oP68gg0S1qqEaF6UvmuJr
         4rndFhi8PASUgBjL+4UYkDTr/28qj28ta2THxO0lG1LQmR4xfe3pWzHoTXq4BkgAVtSO
         HuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bIr3DoSMnABEI3WhF1EWSUyvCdFK2mTBRKvDmxNFFac=;
        fh=HzSPxXPouRgWBXzhe/NUJziPQrq66jT3APZ/QEIDQwM=;
        b=ju7s4eZH97kdOXdYEN9oq5ToXI+70InBZ54TSNBaSJuquDLH5mb9ugMBnE84mu8FM/
         Pzel7M2DzNefS8OiiXE22mTtl0M2VkVBJ5RZJays/IAQ9/hMj3kS3lzPPwrMOpxhWxCi
         CdV9CO3NHSjXrstT+gdU3SOiiLmtCkb9yHSZNrrLkmtKcl20jGdi//1RmCDxHpPSSHqU
         Mt6hArGqVa/61thuBI1E9csnbguTxEO7tySMwSPHAm0isjQNr1FjTmFJz7pUcx1PB1vQ
         rQsxoWElOlkuR2ycVbnW8/s6y2hMVqQuYcomJKrsBtVqodjt3hd7bnnDqeEm2K/zZFo4
         kf6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YXJLdx3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afd3f39313si198034137.482.2024.12.06.06.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 06:30:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YXJLdx3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZLV-0005rQ-4S; Fri, 06 Dec 2024 09:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZLT-0005nF-Hj
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:30:15 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZLR-0003Rv-U1
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:30:15 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d2726c0d45so2757446a12.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733495412; x=1734100212; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bIr3DoSMnABEI3WhF1EWSUyvCdFK2mTBRKvDmxNFFac=;
 b=YXJLdx3X82mQtvMvm8kJev/FdjGI7quv3N/1X0yOvTarXP43zIEs9hxNQYiCp6Jlc5
 owPw8/gmi1ULjIr88/r56ebirvs2IKTWgoCNS9YGGV7SkdHGMN7eXHW3jOVVI5seqoBf
 S9k863QwE8aWlLAbJ3V0zz91s6auj6SvKawCTxENWaptHQBM+dc849JXcaWFX3nwQJX6
 YMbwt+4UQqojzJ7imTgDStEzmz4bE/5CKs46FM9pUacyJJTbs9Edm9ibwg0PcBLApGr8
 JMCTBi16lkpUeTCMZ+CdrvD9Ni5yCv3Zt8IwkNwO6k+ZeCTEwSRVxYhh837wWdzftsAj
 vTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733495412; x=1734100212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bIr3DoSMnABEI3WhF1EWSUyvCdFK2mTBRKvDmxNFFac=;
 b=s1T0gB7DlQG6T+XNtdgcM1nM1MbtUSZ6PNm4x1rYfqDMLnf7XNBtBl1YgSP5zuHT6X
 E7Wa86BGJp2wjfKbppDGJDFKw5hSg/rUpfvMIx+9+SKgkJjacN7PyWtK32GGvPW7Z0f2
 yRC4emUHAXqx+onpfQwSRPJgrFDLb3rcajFVdIzpG/8k0ov6ATf4RdvpSj0iYhLXa6i2
 Dy2MvEqHXC/8AlCsyWPVcANxML4CgOoQGl9Cfh+8wy2AJCj/Qwdcv5XvF/X3w9R6KgeA
 /5S7BQDiQKtvmJ9XFouroBsR9qfjN629zMbXJb3k9GJO2ldjtorwPS9fUFNw1Ad58OH2
 fqxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWbg7JYPW9RfOML3SGwB6TjET3am9T2DgiQsNklnfkb12ML8KcFr01cNy8A0/ObxLesFB2qxaLzA==@nongnu.org
X-Gm-Message-State: AOJu0YyG4kn4vtg/Bzbsoiu0mm4XwHsZxoziB6IELHR5KRb1+dtnAvAU
 /1MKAguxZFPqG/xjRloeEpnm1in4K98FeladkejJYZFi1r7FPpX2QYxRoMjz0HRXfwXKw8w32lR
 YerUlnlGJ80MzUpoJ8wirvm2zPK6yCoaU33/z8Q==
X-Gm-Gg: ASbGnctNZv16sKqRN9z1SSZK6E4ObwIDjPHW9yMhK6RQ6tNSDHRRIEwasTDpzJsmme7
 KUmFGcQVEqEtT0hfgzkcd65nPzYt1VeZL
X-Received: by 2002:a05:6402:26cc:b0:5d2:723c:a559 with SMTP id
 4fb4d7f45d1cf-5d3be6d7416mr2727716a12.10.1733495412216; Fri, 06 Dec 2024
 06:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-36-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 14:30:00 +0000
Message-ID: <CAFEAcA8tuzW-+UwXQaznRw0rNa=nNVwK8rKWu0YWgdKnJcvtRA@mail.gmail.com>
Subject: Re: [PATCH 35/67] target/arm: Convert ABS, NEG to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RCY7d0fFXMpo

On Sun, 1 Dec 2024 at 15:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
