Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1739882lff;
        Fri, 18 Jun 2021 09:55:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwocoGPaNCxJukhrfr6l9EGwrCShDjEOkXyDDOtNykXgibbUBsIJpQ/tRe+N0wVLQapCavL
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr13945329wrw.310.1624035337448;
        Fri, 18 Jun 2021 09:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624035337; cv=none;
        d=google.com; s=arc-20160816;
        b=FlCWCwMlM1E2PRunm3a8EG+0UUy+bTu4CHQVylSpu4zOlQ9eJXaDAjkfA4n8hNX9kB
         cFx/MCtLob7U07/EuQ0GL9RL1MedHm/K5PFfteTdK0xdr9ow8OfAri+MQ9d9VSOTDtLh
         dWPqqTXp0muesZe9FrOp6b5ey0vHDoGB+bNkHE1mACVgPoPs5JIaoc+ble00M8MJcbGA
         YI6fHxn41FsVge4h4MBJbD85eBIJLDUU9sudl9SPRu4krc0NBd6ta3oshp2Gsfk/aybA
         a35GHHcpoeioUkkWNtBrWrX9rC0JVZgLIMKRbTuma2a60K+urd5aiWjffGslIMzZHCRx
         6mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lw7IeOdWe+kKsmBcgwpRgjAY48lKE3ebyYwBJeSi5fo=;
        b=FuL4gM5/OK4hb8JXdmxRcjV3uABFR3cLM3cIhZWqWxeq3+1vDK0hWrokfoQMjSTltT
         eTiuC0b0rBFqnTkOeNLJeH0IVFo5/jQkhjA7D7Rd4Nz1WKKjEujYn6QJHYx/Tbm24b3D
         4WF0ZnziBZ3idm52+wvmznVtrsHxKKus35vf5x23d+yeJywi/6M+QZPBX3tpSggjQi/8
         rBnzZOQFeeZbF8eHeM0+CoisFHfLE9C7IHmbCUixLHlBY6pEhsZd68cI1DI91Fz55G96
         bqGnKl/I+VU8pl9XG3zvlpJ0xSh6jF/aTS9dqdorQfEFiGVnM12kZ4RwJtPss8KCvG1Q
         /8OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lxqi3WJe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si12962129wrj.549.2021.06.18.09.55.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 09:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lxqi3WJe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luHmK-0002li-HI
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 12:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luHmA-0002kp-Q2
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 12:55:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luHm7-0005Pd-KV
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 12:55:26 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s6so9479426edu.10
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lw7IeOdWe+kKsmBcgwpRgjAY48lKE3ebyYwBJeSi5fo=;
 b=Lxqi3WJelgjYaNcvjK2iogGotqWDtslko/uE9tDSVNAhG9Y+x6E9yQPTxOc2DK9R+H
 6oKgsG90iE80oe1EEss4pAw/Ecbe9/3pIjWN+nrZnBqxBTpT8+AcBWqKgqREA+EAU2rr
 mz3mMt92sf075RJyRkso0MJhDgXG5G4ZM7yeQ3W0kHBWgvmeM5qtb2OK1Bi3w2OPluos
 2dJrVqPPmUtwArlAmy07DBJHbLXGTMdMN1N86jjTFlDr+CjlozMZeun8So1spn0KscHH
 /esjpUusxemZkbDrc/BSeWNBMehkg7BtCNT46FUwS7Rnk/b5eQ8a9GLGv+h9kUwDCGGc
 ti6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lw7IeOdWe+kKsmBcgwpRgjAY48lKE3ebyYwBJeSi5fo=;
 b=Wspv8bCzTnlpSmb3+vryjKK1+sKJ3FRJWbsaqfxIBemBRLSlem2Ooz8DnK3OHgbYsk
 tSWvXHcjAgXmYkZkdrCtPDFwnkOW0Ste4EVOFlP+8koiLhfFH5sZ6Tou8hWFWZANuCQi
 EpCwhUo1zUuClkINKC99gldYT9pScaDLCJsWUb/NjkeTh3EaCwjbyXlRGD15PD0zP6RD
 lmYWnd7P/7XYsYjEQ7Hf4zV2+d1oR7A7MBJtKS6/ZIzqfXmlU8EIrIfgJ+KhkEPPpeOM
 RzuwMnP7/autopghP8C8+cxjtFuIUqHw1PHbGov2YzQiKYa8M6No9StaTBl7FA7+AYTk
 29kw==
X-Gm-Message-State: AOAM531CseCq/NIeBtHOb07W5rkHnhrvfDu8Sqjw4YPTJNJ5ehjvlAOn
 A9tC5MOPDowwm7DljelSZnqwxMZMHsAHBuDxB2qUUQ==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr6282077edt.100.1624035321326; 
 Fri, 18 Jun 2021 09:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-5-peter.maydell@linaro.org>
 <73b67dcb-6d84-03d8-cc37-f8b8b3f94905@linaro.org>
In-Reply-To: <73b67dcb-6d84-03d8-cc37-f8b8b3f94905@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jun 2021 17:54:46 +0100
Message-ID: <CAFEAcA_qQ7SmbRifq5U-YQL9fF956MxXE1fouKkzRniLCSuefg@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm: Handle writeback in VLDR/VSTR sysreg with
 no memory access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: txoMuSbkVEs4

On Fri, 18 Jun 2021 at 17:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/18/21 7:10 AM, Peter Maydell wrote:
> > @@ -633,9 +665,11 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
> >           gen_helper_v8m_stackcheck(cpu_env, addr);
> >       }
> >
> > -    gen_aa32_st_i32(s, value, addr, get_mem_index(s),
> > -                    MO_UL | MO_ALIGN | s->be_data);
> > -    tcg_temp_free_i32(value);
> > +    if (do_access) {
> > +        gen_aa32_st_i32(s, value, addr, get_mem_index(s),
> > +                        MO_UL | MO_ALIGN | s->be_data);
> > +        tcg_temp_free_i32(value);
> > +    }
>
> So, this bit looked funny at first glance -- are we missing the free of value?  But of
> course value == NULL when !do_access.  Which made me wonder if it wouldn't be better to
> just use value == NULL and not add the extra argument?

That was how I thought I'd do it initially, but of course you
can't do that for the fp_memory_to_sysreg callbacks, and I
preferred to be consistent across the two.

-- PMM
