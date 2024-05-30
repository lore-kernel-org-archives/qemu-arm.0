Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp193393ejk;
        Thu, 30 May 2024 05:33:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWK9h35tDWtQPAgbMpQNazhzNYEEzLpM4Bux+1tu15llwlds1tBNDhkfm5OR93OzvE+x5o3x8sCbDZX7Ma5FNolzlQzqz1P
X-Google-Smtp-Source: AGHT+IEEsDs9qx2nywB5sak2w8oozEbHj3A21RtVNojMLF3z8K6Ufkr/CPEqDqw0ZlQBNvkwVYPt
X-Received: by 2002:a05:620a:4713:b0:794:b35e:e85a with SMTP id af79cd13be357-794e9e154dbmr264823985a.48.1717072396994;
        Thu, 30 May 2024 05:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717072396; cv=none;
        d=google.com; s=arc-20160816;
        b=RXAOHslCXdK7qDVoSu06HfBzLus7IDV1BGJr+8590ScRPyA3Xuw+kZ3pA4qOp/KRnm
         Q3s170S/ZUgEt/nAQhXw9cgzXVtCKqfWXOTZSBMFgLXt6cnY/QP1Ef98fDYgn7YfmrL4
         bH3cSwRLN30LWsyLKZqqpjzUfaYLopm3q0KNzOz+slE0KN/0xGEpOjzNA1tc03tZGhOF
         QTZtQNs/tpcO/hfHUsERtw/hrNDvGzQFHCcdTzg/1rgqaUivwiCkJv+ahCkNfoYtYGLe
         AkwMwgxxG2ebY7fLIvNy85q/zKkMqJQ5suZczQRJQ4gM/Wyjce9gIX7I8um7baNjPjpu
         jdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=68YfPb/qlTPEVjtIVILBn2rrVyHz+ITENgnTaqVbEhE=;
        fh=eqbtGWiatgQd0MgdAWG0UczX4TB6nF9rFGTwZjnmjmc=;
        b=eYxIaz7neGjB1TNiedyFBI8K3khLXAM/ldy6JWupTzD5wJHt5328HV3NMg+4j1TDNU
         EhxBzD4Zp+oUIGwktUG3uzE1/a5tbgJVk8csGiq4tOkmRkeFMOLXO37HXXggrTy8JZ/i
         5/Qk+SRivAsGGR06BV4Qveg+CybiPuCS9Vf6emHqPbOu56EnuFW9xadOg5nwOWwnmQYO
         0s0ES/xQP0+SSO5uhkjRIc9UllBtn6vpdGlQM6Cbsf9V/VZ8GRZyENigxFrdnjdaj5g9
         DqQmTNIkKqUPaHgyKWBiL9uxPgJ12u8CJPImZlb3Vmj22elkUt1QaXSmfeGiU/JuJgM/
         ASdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KRr5cq/Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd3c112si13819085a.410.2024.05.30.05.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 05:33:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KRr5cq/Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCexn-0007fI-5G; Thu, 30 May 2024 08:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCexb-0007Zk-GG
 for qemu-arm@nongnu.org; Thu, 30 May 2024 08:32:49 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCexY-0007nC-7g
 for qemu-arm@nongnu.org; Thu, 30 May 2024 08:32:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5788eaf5320so1007958a12.0
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717072362; x=1717677162; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=68YfPb/qlTPEVjtIVILBn2rrVyHz+ITENgnTaqVbEhE=;
 b=KRr5cq/QZIRWuwyM4aKadkqrJ2P+2OF54gpScxlNCsoynG/cfqXDnbl9WfuU/YzXz3
 efhSSXOufRzteX+yWSxEh4dmxT+FIj4KpF5rqfLgaLp6NAZBuRfH/uAZpJmGQ7djRoPl
 MSVOv4SNOC+QcJTloSaevDUddsh4ynxzbzu63gzLPSusda4e3Z4Sdy/2xdNdm6UXxiRT
 SUBoaCJag5cW+ZTeOGuoacbNlZ4hvTryVsHnu5AKoBn9qwBrkQWjadQ0w5obgNIQZHo8
 QDEDQtLWNBE/3aN5rVARjSRY1vNKlic4Q7ut0fur/Uh5NZ0zFDmDvYannREUurWBRMHD
 uQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717072362; x=1717677162;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=68YfPb/qlTPEVjtIVILBn2rrVyHz+ITENgnTaqVbEhE=;
 b=SgWO8qBUDsKh3btY6ksegcjnvbq2N/33uptom/Ww3rzPHr3TnDH76pFOhIkrYIcPQS
 Sxr4J2YBl8pt7zhDSPfGCWooFz2gcqmKA4LeMpjZJPXgmjzwPoxV5aLMDsTMGiwUsDa4
 WDgnfcgc0843yWQaKSzZph4QJiPiCqSAubzExxjFTSamVlZlKiHWrgFkPXZAXbi+6UqU
 +r0DlGWNfIpuWbaMDp6crOZsBqzx1zF9L8Eu6G/fCVjN6ga36DZpdx4AJWMzbLGV1ia6
 /+qmIEYbqBgxywMU18tE7lq/2aPClLDFEIngeQ3pFQ9aTAHTN3yK3ilYUP9Np6EnODlc
 10sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIdgCRnrHKdkj5+O6n6syRAn7SBkA7YPR0/1I8hDzL4DBKqvdLWnzl5nti9K6a7cBc09oAeyQ4OPk9LW1gJ0lybS8Y
X-Gm-Message-State: AOJu0YygEnvt4tIusCpEBeOW6N+0bABvla/tUF1frn3AoJol2P+ZBb3K
 4duFce6XAj0z4fQ7U9sH7lEtHIM+CS4DWE2jeI5VRAUq5BjBTIQTlZs25RYxvbyQ6Bf9/W/I9/h
 yrAkFFge09ilvEk0JGu32qH3gH8om4OF/kV1jcw==
X-Received: by 2002:a50:a414:0:b0:57a:2cf9:f614 with SMTP id
 4fb4d7f45d1cf-57a2cf9f703mr190907a12.32.1717072361702; Thu, 30 May 2024
 05:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240519094106.2142896-1-rayhan.faizel@gmail.com>
 <20240519094106.2142896-4-rayhan.faizel@gmail.com>
In-Reply-To: <20240519094106.2142896-4-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 13:32:30 +0100
Message-ID: <CAFEAcA8q=AHi=L2zDwZgYbemB1vaKHQpmW43aOWSEu=2JHOV8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/misc: Implement mailbox properties for customer
 OTP and device specific private keys
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wg4DrILkDx/K

On Sun, 19 May 2024 at 10:42, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> Four mailbox properties are implemented as follows:
> 1. Customer OTP: GET_CUSTOMER_OTP and SET_CUSTOMER_OTP
> 2. Device-specific private key: GET_PRIVATE_KEY and
> SET_PRIVATE_KEY.
>
> The customer OTP is located in the rows 36-43. The device-specific private key
> is located in the rows 56-63.
>
> The customer OTP can be locked with the magic numbers 0xffffffff 0xaffe0000
> when running the SET_CUSTOMER_OTP mailbox command. Bit 6 of row 32 indicates
> this lock, which is undocumented. The lock also applies to the device-specific
> private key.
>
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
