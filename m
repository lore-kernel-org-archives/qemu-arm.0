Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp813036ejc;
        Thu, 10 Aug 2023 09:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnQfqsb3550zIWNIf6CV9oTABlIrCpQMKnoF1dZU9ugEcgTT5nRgXbjn+NMTa2emX5ZbJd
X-Received: by 2002:a05:622a:52:b0:40d:4c6:bcdf with SMTP id y18-20020a05622a005200b0040d04c6bcdfmr4109067qtw.35.1691686709458;
        Thu, 10 Aug 2023 09:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691686709; cv=none;
        d=google.com; s=arc-20160816;
        b=bPkv45LNOxHjPNUqWaUfebUhp/e1hS0K/QqkNWRgPdq6oR83DmhHDFb88LoSXoQdRz
         IBJ5bRAAMRlZr5gK6Nc2dP1HpynHKtDigbZV6bGzBCqsAR4LtHaoisgkWMolZBJMstEA
         nfmlKoQ6RRLwxwr7QOV0wnOgU7xEePLiXzVoi5nwUG7k4wfNPUHM/GCKue6cz2sApZnO
         lNPhdlBsfpWNZWhJ5hQl/UiFt75+BAb5DUrofAXwKRa7vlu35OfwBuViEVu3C73Nz4w4
         g8ckmDCmCKsgtXv5qxWf5OoNq4wVcBgmD8dZDdO43b8KYRLGGM1C6iP7E4UOZt8jtN1T
         zW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=F0EpfFwz2Z7kcnGFjrsdZJ6XyL+iIeDh+uooFFhmqWw=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=CmHIdhzESTDYiatQzIKPkXkmdEzZcosp1RtezHAQ0HVD2oUuQAknuHBjVNjnKqIiCb
         pwuZhF8ZQ3Qj8uug4G/JFG8ghTIrIaUUQatXX5WukxPIqqdcSHTDTfZaK6HoZf7uZX6b
         Q/yaOlLy8cci2ltg45hGOVsS3xy00gWLwA7nBXv6F/gctBGECI0wEA6rwNllIoGn67dC
         TsyohQ9TlkS+5EA1/52rVBm27EWH3JcNNPIOXiFYszkewuOlYNb/FdcFY/zyParFpuMg
         3g2v2Youx0p2obkTVUAoqeO3q4bIw4677zAxucLHwjyCSi/V5a7ZXdYmSBzWKMF0DJgV
         0lWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=en3v9RaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020ac85cc8000000b0040537f483b6si1200081qta.655.2023.08.10.09.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=en3v9RaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8zR-0001fS-5F; Thu, 10 Aug 2023 12:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8zQ-0001eD-A3
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:58:24 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8zN-0004WX-Ll
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:58:24 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe8c3b5ca0so1702130e87.1
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691686700; x=1692291500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F0EpfFwz2Z7kcnGFjrsdZJ6XyL+iIeDh+uooFFhmqWw=;
 b=en3v9RaXVIhRG2iL56ZBL/ltnZrA86ztYFFywJE4O983aUBfa3yWlAVt6FWL2SVzop
 FnSgAwy4bkzPYE3dGYb+V3QN8zJ8p4n05KXveNilf6ZdOR9msN2K+W858gVw7tiJEWgW
 QnA0kC8MdlA6EHYmLm2ShH+hRwnK9eUEsesRx6pT3mM6jHhruD2tfwP6ZCexRDTJ7sdm
 kifDpyyDUTJ01pRKr+j0j0XWhQhUXFA4ii2znZqRDCRVz+QSoWf3bZnjSxis3S9KGEcd
 YT+fEqLg6E0B1vcd2TFpBo5h8Un6hKmMKATKjizb0VpQm5NgDRXAZV+ola3VSc8Andbw
 oMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691686700; x=1692291500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F0EpfFwz2Z7kcnGFjrsdZJ6XyL+iIeDh+uooFFhmqWw=;
 b=h61pfLJFH5dDbkuofm4wKkBjjPmPe2T6Y9pbnGbURAoxoCCMxpMSBN75xXLOCRzrkT
 3c4n0P2W/lpDPt3ZQQNIGAXkBcCiY/nXhIe07In2iOuSPfdNc4QHPtfMtxwijfwnWNxk
 zBGUR/upsK5LK62m8f2ZVKqny+VcnJytRRtSQf86qESiQsLErVVJ+aBenvE7armfAxh4
 D9yCAOqIuC/mNw8KujZAcQXIZ1khs7JtA5/JM27VleheVlBLsBw/KhRJpiXdghMeCIO5
 Xrp3jwkIEYtxwLTrQakT3Vwm+BcRlKgNMCGSCC8qGtmJ+lBhR85wRUasl3NEvJjt4/Eo
 Z7zQ==
X-Gm-Message-State: AOJu0YwdqhvFGPCUDnatQwxgzWY6Kb8tIA8S1M+zR5DVOOJnot6YXy2f
 P1J89DcT+IBI37QZ3wWLZBnGloZQ6rO4cIWrRjzyVw==
X-Received: by 2002:ac2:5936:0:b0:4fe:a2c:24b0 with SMTP id
 v22-20020ac25936000000b004fe0a2c24b0mr2149244lfi.26.1691686699766; Thu, 10
 Aug 2023 09:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-13-richard.henderson@linaro.org>
 <CAFEAcA9dqnaqGrLz804UB8zHSnbCEWwhv1nzvdt_j0CS3=mCSg@mail.gmail.com>
 <6dbafe59-f7ce-12f6-e8c7-eefc7665f598@linaro.org>
In-Reply-To: <6dbafe59-f7ce-12f6-e8c7-eefc7665f598@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:58:08 +0100
Message-ID: <CAFEAcA8j=AejoxGSO7wKQH9uM68jpL59KrgfSCQj78-sY3yxjw@mail.gmail.com>
Subject: Re: [PATCH 12/24] tcg/aarch64: Implement negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: x6AFiLHYaSh/

On Thu, 10 Aug 2023 at 17:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/10/23 09:39, Peter Maydell wrote:
> >> +    case INDEX_op_negsetcond_i32:
> >> +        a2 = (int32_t)a2;
> >> +        /* FALLTHRU */
> >
> > I see this is what we already do for setcond and movcond,
> > but how does it work when the 2nd input is a register?
> > Or is reg-reg guaranteed to always use the _i64 op?
>
> For reg-reg, a2 < 31, so the sign-extend does nothing.

OK. Do we document somewhere what a TCGArg is?

Anyway,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
