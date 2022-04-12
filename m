Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp122204lfk;
        Tue, 12 Apr 2022 02:57:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSiPHmSnEJJ2Vc8cCBcUrlhGuk6ll26HBBJ9/hYyu/OC49f241AGAp4IMUglp9BSHKyUmA
X-Received: by 2002:a05:620a:4148:b0:69c:297b:4050 with SMTP id k8-20020a05620a414800b0069c297b4050mr2483576qko.532.1649757439572;
        Tue, 12 Apr 2022 02:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649757439; cv=none;
        d=google.com; s=arc-20160816;
        b=td2PiTbDtS7noiCCTr8F09yFSUQWG9EhFLwjv1QExDIcgyaWM6LFBuNC7iOl6gegiH
         eE8qCdh5nAK8+MHDBtSe+I3PjSGcvGV7WCtVV774RClMEhOSkzs81uMGg38kmmNRzam0
         TIXxVspUaMcTjfgP+QVBPiJXj5/fGWuEu7IM0Nj8qTUav8/73F1wDomwxTpva9QsKRf6
         8KqZpRN5hS3amntrgyGUM1tZd98WkV0p6D4RgAFTmT5tup/95NEIx+2ZL/1q3z6EjIoF
         faLwn+D6BhBuf8bf144XfR6X3jInFMPnzL027DvfQLxG6c5906TxQ4LghJvTnKbbS4wz
         gOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w7clKU9sN74dQrRObTelEA/B+gN/EFRyOVTm0veQeNc=;
        b=xJ4QDozh4gYkZ+zs4LCll0gvvuP58yyfJEkDl8pT+M9iGZU5s+BHyAUrnoR9JG2pQw
         ZaSdH14B7Z6VoLU+GaNJjzL03uq6lldKJaN4VlnEKuxSJoBRlMXj5jeLt74mo1/z/7nn
         iFMvKFNFbiFOyPM1HyiKXkDQosQeGy5BmPrzmrnIwD9Vg94ZePKSc9LBhwVmv1EsAXKd
         ID7MaJG4qtxOQF8N/M7lK8iX0ZJoBiQrbL/gBVQxPBQKcfTMeCsvR5FHpNUFGoY/2m1D
         91ZVF/j1WESmiIatbuM+XR7hIBtqn/g+iwb0E/ke82Wuqe+aohrSbcBWju0ZJC7u3VqR
         o/rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OcFKyJYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv13-20020ad45ced000000b00440e46a7cb2si5821230qvb.336.2022.04.12.02.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Apr 2022 02:57:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OcFKyJYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1neDGx-0005mG-3b
	for alex.bennee@linaro.org; Tue, 12 Apr 2022 05:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neDGe-0005lC-CW
 for qemu-arm@nongnu.org; Tue, 12 Apr 2022 05:57:01 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neDGb-0001zp-W2
 for qemu-arm@nongnu.org; Tue, 12 Apr 2022 05:57:00 -0400
Received: by mail-yb1-xb31.google.com with SMTP id z33so32178178ybh.5
 for <qemu-arm@nongnu.org>; Tue, 12 Apr 2022 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7clKU9sN74dQrRObTelEA/B+gN/EFRyOVTm0veQeNc=;
 b=OcFKyJYbxR36Bwn8MMJI7lohphRRqRHquKivA4l/rLRrKeBtNX9UEopSDX3HLIM1iI
 vwrwOUcf1dIQBU/ZKIVuKvMVpIx5hQmDiqOF8Nj89brOB+PrirAbSNsCMDXJVQ3CN500
 CBAjvvYmB+1e56nkVQ0AbKLCC/bDmalSYQgDaOa622OXURS6eiYlbZ4D3bHtqks6Csp0
 FTfGnCE/udhES1ieoRMSjgVAiCmugeflDaDInENthGSAxJvV1yK/NinRUz7ihG2UdulA
 NvcsSu0YSDndq19diLSCL2QP5PDxye4T+KH0dQLf7GsyZBmQBJQYvSan3MyCZGdOzCZy
 2k7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7clKU9sN74dQrRObTelEA/B+gN/EFRyOVTm0veQeNc=;
 b=WBUKSZuSbKVaeYP9W8gLHAlIC0090Xnh516rlNXuv6swdmoWo9S/cUlDDCvA5VwNKq
 XC78Rx9iWVLwISg4Ddqrmgv6AvYDJQkp/bFUbqSC8KxIBMtrXQvyzaer1XjJJtT1KHds
 wBMpCpfYpjf/GyJPv+0aevBKyvL+l+eQbV+bXTm9c6iR47n3MxcY8FEBcsjREz6kO/f+
 4Hq1Ny5+tp9YoHLiYK2QDaVT0dfxRGzjx8kfIUx3e6mzjxkOa/tJLqoaeU/6pGS5KN71
 piErkL96CO3hc3mEr7d0f0dBFWetVI8GGjwmOaxvtu9I7xu+KMNVjqUEMIPKtjGOxdZL
 VoQQ==
X-Gm-Message-State: AOAM531SMs1uRwKIA1SR6vfO4dOq6fxnagiyf9G6DyY0uw92u3cZScFV
 El8byhklZgeVYphL+LJL2eVULeH6iLSRG2CwBICCfQ==
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id
 130-20020a250488000000b006411c71b0ffmr10717949ybe.39.1649757415812; Tue, 12
 Apr 2022 02:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-15-richard.henderson@linaro.org>
 <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
 <78faaf43-4304-ff1e-1c8a-0102725eecbf@linaro.org>
In-Reply-To: <78faaf43-4304-ff1e-1c8a-0102725eecbf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Apr 2022 10:56:44 +0100
Message-ID: <CAFEAcA9VHK_YLnZ2FAgdg87uF5Bk4op7kvL9e8DAZp27jvfjiw@mail.gmail.com>
Subject: Re: [PATCH 14/16] target/arm: Implement ESB instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rZx3d5t+6XH9

On Mon, 11 Apr 2022 at 23:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/11/22 09:18, Peter Maydell wrote:
> >> +      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
> >> +    ]
> >
> > Why don't we decode bits [11:8] here? I see it's the same
> > as YIELD/WFE/WFI, but I'm not sure why we're not decoding
> > those bits in those insns either...
>
> See page F4-7074 in H.a, where bits [11:8] of the imm12 field are described with 'xxxx'.

Hmm. That just means "decodes to the NOP/WFI/ESB/whatever
instruction-description whatever the value of those bits",
but when the specific instruction-description then marks
those bits as "(0)" or "(1)", that has the usual CONSTRAINED
UNPREDICTABLE meaning described in section F1.7.2, where
we get a free choice of UNDEF, NOP, ignore the bit, or
any-dest-regs-are-UNKNOWN. So we're within the spec to
not decode [11:8] but I think it would be more consistent
with how we try to handle those (0) and (1) bits generally
if we insist that [11:8] is all zeroes here.

For this series, I guess go along with the current way we
handle hint instructions, and maybe fix this as a separate
cleanup later.

-- PMM
