Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1509564lfj;
        Tue, 3 May 2022 08:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6F+bQja3+yFcOSJO91ocrTyUCsXrxRYqziXQvYOVZ6x8gKQo3FJw7DfuMPjoER5ybahN1
X-Received: by 2002:a05:6214:300d:b0:459:2bb:6d14 with SMTP id ke13-20020a056214300d00b0045902bb6d14mr14252194qvb.71.1651593554918;
        Tue, 03 May 2022 08:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651593554; cv=none;
        d=google.com; s=arc-20160816;
        b=cF7LY9Q+bmIh1X+h8Z8N60WL2KyEMibW98nBNszMhJA5sSAHyBhfALQqA+kH44Qtct
         faD043hyBF17RAkya+philVDr0eIoM/q5R3tWZojg2vKieA0ul9GuhTwy97Q63SRqH8S
         fklldRPaqMDu0jEmYhsM9Pw+LYSGJvyk9WVDiQ1Zx1D32JVXSY6eCuRtKJdkSrmxIXz/
         aQM6QvIjDSZarUEY2Jf7+M7Idp9OfGbT2dPXbBvrbFj/A0QniQrCVkZDNefQRu4H+gDt
         U8C9mVTpYabEpVqpT7J6WihaGrw/Zk16B2h6Y06psqhAIPQE6rw/Iqj0OMQc6kmEgd9s
         wLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KcfiQdYL4XxzfN7gtYC228PiU1901pDjfPtSapNq1Wk=;
        b=YA2kVbGMT/+KAL+lL74iLiCcnOH4Zd1FV2X0vZL4p0bkkHy06m0TGYumZJ8lJB+CS4
         1wFpm+40UOBOHHwcuqXsbOdjDB7mQwoZwS0NLznCV09VnV5N2+5UvqglwSf3+bSsrvQA
         3bykavCge3gnKPXBxPXEf9BRgEIqOaW+/8EffukXfAeBJWBfSIQfuth2TqRlOUfBFQFZ
         qs54ouiO23ICKTEY1L0EpOxAUxpcyHtNTzRiXUbelk/JjKBMO7VwEO7Mx3NbDzoLVXOf
         VJglgIoxPLcAPSAhyqSgdg39foOZAkY2fnSex/eJvHUpHZAKQOO7gV7OEY2tBwLKQZJG
         CDlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J3JGK/8Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv1-20020ad44881000000b00440e46a7d84si6667355qvb.546.2022.05.03.08.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 08:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J3JGK/8Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nluvi-0002uL-E7
	for alex.bennee@linaro.org; Tue, 03 May 2022 11:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluv2-0002u6-RJ
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:58:32 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:43692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluv0-0001iB-7u
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:58:31 -0400
Received: by mail-yb1-xb36.google.com with SMTP id g28so31804103ybj.10
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KcfiQdYL4XxzfN7gtYC228PiU1901pDjfPtSapNq1Wk=;
 b=J3JGK/8QXGlQnPefIWSD3GRiSiu60cf5pWy99AswnNkKeB3RM+Kho2+6O4LOAYgxCj
 oBWCOmIEEjxXTrikpmx7qSGflR6tn2AN4pegJZAgIlcmZjlPBTXul2a1Axc9y2AYHSS/
 oOmfdMmitlaeW0DIXYBZXILve/A0YB7S3ZhOBb/sNk4JdLOr+CcVVZnJZSydrMoZZ139
 Ujt7Fy/3J0Bt/PoPS+4fPk4eGo3j+bXdRf8+qwE6loW7df1VnA9/Dyc2voOcBf+aM6KT
 0Ivhg5BOG2ls4TTJvGRLoBHVTsAZSTpxWtcxrK3FSbXxJuKRJnM0UvA4Q/utrgoeRKeP
 2i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KcfiQdYL4XxzfN7gtYC228PiU1901pDjfPtSapNq1Wk=;
 b=o6u0lizEmHWQ3eLU4bfvyI6SPc23MrrD5MuFAXdoMFoYF/wnpZmxbyys6zBATdyZIu
 ZqmMzgCIEvtN9oHEFZ/fUm7fN7kUPdgCtA819XXJ2AF34hghqPqHEYwDICWKZTGfE+z+
 HlXTUtzu40SPsorGL7lhnzXjomjNdPh72bWhgFpPT33PR7+eJqyx1w+UrcugxbQC5RWz
 loXn3ji/JxODuCg2ATbuOcH/biusFRxmj8GPZ3xlG52InWhRchpnPu0XimJN2eFjW3WK
 lzYCU4NETdiBCWgv7VN/TbRb9Y4l3JHOHyHSqgUauASMvXuzvzscDXUsyyJ/aewrNtWg
 g8MA==
X-Gm-Message-State: AOAM5306gch4SYnD1DHooYZ3qLW/8/JcwZkobnYJ6yfi47+sUWxRP0MF
 EuseIMulBl5Cq8kKm7G40BEyCB6r1uy9v2TSq9KQ5w==
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr14703481ybu.39.1651593507974; Tue, 03
 May 2022 08:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-6-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 16:58:16 +0100
Message-ID: <CAFEAcA-WbCdH2xB6rLfWZ5LA_YpkwRur0rwZASQq1pRQBWOtOQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/45] target/arm: Reorg ARMCPRegInfo type field bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: NVEL2B+A4+IP

On Sun, 1 May 2022 at 07:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of defining ARM_CP_FLAG_MASK to remove flags,
> define ARM_CP_SPECIAL_MASK to isolate special cases.
> Sort the specials to the low bits. Use an enum.
>
> Split the large comment block so as to document each
> value separately.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
