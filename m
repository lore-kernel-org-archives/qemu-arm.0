Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp481231ejb;
        Tue, 28 May 2024 06:14:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBLOuUjzAR8iPZ+DB6dOL48JkiUVgp5kWBWw9pZyyqMrGtKajwVmsVToMtqxzBR8aY0ETBCjl2e/3R+HOaFLJSQ4MkKmAg
X-Google-Smtp-Source: AGHT+IGV+d/9DBiJY7O7IauQJJGGlBK3cPN9+V/9tJlWNE9bhD3huOymH6xKpn6WAObFcgTfDfRg
X-Received: by 2002:a05:6871:58a6:b0:22b:5bc1:66f5 with SMTP id 586e51a60fabf-24ca11c973dmr13273225fac.16.1716902052579;
        Tue, 28 May 2024 06:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716902052; cv=none;
        d=google.com; s=arc-20160816;
        b=DAQRUBv6cPTFwXD4rk2P6R9n2e4pUyEX2jsOuLzJzQOfvAzQmevJ9UGo1NJL53ZXao
         QT6vRVSxakGxNdVvFIMl+c/pRaZ6xjCQeXXrWNaRxH6s0PoM9I6A10JVUG8AcV56s1ky
         /IKbMfaVnQWk2NswEqWwiLWGv+51H7WlAVzzP9zWJysepAo/CjTZjIec/pAauOWyFOPU
         LWPCfe7Tyn8/iZzTDlzgtCqkjngtLnOmCyY6/Mwy0s5wr6m+2NpGB9FrYlkTPa3hTzvf
         /A4+1Df8cMvNKlGTGnNizwSCZZIxqMOx1DeVOJyH5go/2WCUguQx6P7SylE45q7zSsO0
         0CUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qAfY2pNB/sTeMjVLMwj6jXQx4mSb0Wv6WFJKt/AI0K8=;
        fh=IUeIHnWWQ1SrXhSwh1IkAzxPwj6ABPCqOiM8KHHiWgk=;
        b=aOS8mcfUqvWXUJXBBFUEebwBlUxp2L4x97XLmSHS0zrUx/WaTH896bFb93FXmKuWc9
         D8cPiWHaR/7GCdeBNNFUwrx5FHK7d0nFxUUkD3nn293EDJaOGv14K3viF6Bw2toaSd5o
         nxwF7P1fL6ukbfyuPGjTIUZDG7xD/wewwZOHS9X4wsm6/ZsXCF5hDHeJCk0aZ4779C0O
         hfUZnUYNi1L6VjoijUS2Jp1RYpTpp4CihrO1L9+jl0I5cwqauKYo+dbEX8DYjL8rAT1Q
         I6FpmpkeZLq9LBTNcW+5mF1AvdwIncoCzKEKZJgvDftr5zN1dAAVQ9pBWN9ZZUg/fV5E
         yLLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/UmEM7N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c5a0fsi107784091cf.583.2024.05.28.06.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 06:14:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/UmEM7N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBweC-0007p8-3y; Tue, 28 May 2024 09:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBweA-0007ob-7w
 for qemu-arm@nongnu.org; Tue, 28 May 2024 09:13:46 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBwe8-0005jm-7Q
 for qemu-arm@nongnu.org; Tue, 28 May 2024 09:13:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57863e2846aso807582a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716902022; x=1717506822; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qAfY2pNB/sTeMjVLMwj6jXQx4mSb0Wv6WFJKt/AI0K8=;
 b=L/UmEM7NM22RKS0vVWT0rrdWGXF8kxcvrTUSmHVMWDJ11EjrFtDn15GoJTdt5xifNP
 8jYLO3/8zRMPm1AKkmkhmGzPWJSSUNaLatQQ295NIM0tRiKo6IWyw/LHgL2X3njMgVCC
 C4oT2eI0orWuDmom47DseABbIAwWJrrCYFxwlHT0GL4TdcdoiEZ/yizNhqQtIDj6n17C
 MK1MdRJy0z5EZD4OJVQm22n3datDn1q9KNgJsMtFpef1HX8h1V+Nd7LLMZ94OcdNAgRy
 TW9SJ/OyHVexGFu28dBNWU5rrWDFy+UsZqtCzfaj8bGwVsEnyPK7Tj690iQ4s6lF5DvL
 DayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716902022; x=1717506822;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qAfY2pNB/sTeMjVLMwj6jXQx4mSb0Wv6WFJKt/AI0K8=;
 b=KiRBXciAMG5dodkHDMysWt/eAQIF9MpM9dVE3ucCOalX4za/QfIQHo340f3YGac+tD
 sfXuCJHKde5kqvTrdThOPwZ7eDA1mCxr5D7oNU9cHAoV1q71fuG1/JJPHSNwaN4Q3DsB
 vkK4F56f1rOWXolKJVtlNFyqtH4UeH8yk/sLc1LxACbVObRp8APl0MEGUyiQVcXtDqH7
 1XazIFroer6iHL1y+YxanWpJO5ibfvBeiFusfzbsmDucpNBovNAg4HOCTO68mbRf7vHh
 NYC+gccdnzWQszj6hbUXc3fqejPCEFEgQK/sQHbX2n/xphxUh80egIOWFZyduvpyL8n3
 /teg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjrJggv3+/4xL2WxZjbTfDYiDGBdxcQDtgg0l2928eCRNjdAZQai6Pj04ZtysdPE6S4d4tbS0Ls4dM8MnwwSg0jB/F
X-Gm-Message-State: AOJu0YxsVq/LS3evRQ565kOd0psvW1j0DYwZCVi+l5BZdOiRDEFzEkWp
 f6rPtQ8f8NpOWWXtkd6IAewoeHSePPNPwsXLl8ohDiK15PY9kbuTqxnObJnR1/3KI5oPlL15cTL
 4HzY2PlfkbbptJ2gbRnsRucINyTXW8DuMDfNZ9g==
X-Received: by 2002:a50:ccda:0:b0:578:56f1:e2f5 with SMTP id
 4fb4d7f45d1cf-57856f1e42fmr8512696a12.13.1716902022200; Tue, 28 May 2024
 06:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-3-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 14:13:30 +0100
Message-ID: <CAFEAcA_LC6MZ3eLY9RF3pzAzNvPvED8orebbdQsUJ0We7v5hsg@mail.gmail.com>
Subject: Re: [PATCH v2 02/67] target/arm: Use PLD, PLDW, PLI not NOP for t32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: KWlp0/qHOxiG

On Sat, 25 May 2024 at 00:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fixes a bug in that neither PLI nor PLDW are present in ARMv6T2,
> but are introduced with ARMv7 and ARMv7MP respectively.
> For clarity, do not use NOP for PLD.
>
> Note that there is no PLDW (literal) -- bit 5 of the first word
> is not decoded, and is PLD (literal).  Confirmed on neoverse-n1
> host which does *not* trap on the (0) bit in the decode.

Handling of "(0)" and "(1)" bits in decode is CONSTRAINED UNPREDICTABLE
(see Arm ARM DDI0487K.a F1.7.2): implementations might:
 * UNDEF
 * NOP
 * ignore the bit and execute the insn
 * set any destination registers to UNKNOWN values

Usually (but not always) in QEMU we opt to UNDEF. If I'm
reading the decode lines correctly here in this case we're
opting to ignore the bit because we have both:

+    PLD          1111 1000 -001 1111 1111 ------------        # (literal)
+    PLD          1111 1000 -011 1111 1111 ------------        # (literal)

And this isn't a change in this commit because the NOP lines
we used to have also meant we ignored the bit.

With a tweaked commit message
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
