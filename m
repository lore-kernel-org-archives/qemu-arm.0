Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1792945lfm;
        Thu, 18 Jun 2020 09:16:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRV3Yw0SjWeJ+j8Jummh1sJ6h+LGs3UxvusIkS0tLvYbz4NphRe5Ldtrf0RdYCqGpv+FIj
X-Received: by 2002:a25:2582:: with SMTP id l124mr7900728ybl.59.1592497015416;
        Thu, 18 Jun 2020 09:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592497015; cv=none;
        d=google.com; s=arc-20160816;
        b=qFMmT7mf9gGXrGJSv3UTu92bH0ILvEcE/EJCBrr117eXF5FKkv8Dx0pHt8OCKiuw+U
         Miz3+Y5XgJCe6zo30WxPsypFGims0KFJmpTKXTKTv+rh4ybt0Pq8KktpMsXwQUNuGQ27
         asZsBR6uZYIfZXsJ6RlWfHU8PX52zDKl+d9gq3p9Lw77/dlFN7m7TkW5sjJUI1xX3N3W
         JVJ1ApwBDl6AM15Uxh3/B/FX+apBVxGvnDTrLULSwJbaXS3l1eIt6E03v/zZCOYTSWJ/
         fdx7/7PbTBkod99VQr1ebOQoZ69bbetZubmPw9XwPJF1dQ7EOQ8I18gdfcqQL0TZLfC+
         p/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7u5drJT0mavJGQbNOJVAerHycRJJAKN9jThBgI5L4Y=;
        b=hc2YZV34hC/fNM7q2+sni2aUk+6dy8prun0j1GDrBauZedNsXX5lpo7uEPwaEpbS33
         YhgGRMZFVEt1wcjHuWM8EZMKt3M7VFM6toVSUlV3+9V68jKpAu883DZFoGh6Lcprci2E
         +6Y3qDefzWO0w6nE72pUEnco3+3M8BbvyWZIrBy2RbjjOAOWdu0rWEM0+GEQ1idHqszc
         IC1lZjCfWiQBI1zTkjYE0LwpDJiZDkruQXGeedJM8GxN5Ms/yqPg0/E2IC0JS1EejXsw
         V1YjHeeilrRHuOTtkeSNDKG+VbuY9z5AMI9D393/UmCzmt5GyZWiNX8jrYvMdgrT0VQV
         EVhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SS+UD4V0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q66si3010479ybg.144.2020.06.18.09.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:16:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SS+UD4V0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxDi-0002yi-RD
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxDa-0002w3-Nk
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:16:46 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxDX-00082C-B3
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:16:46 -0400
Received: by mail-ot1-x343.google.com with SMTP id g7so4937395oti.13
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 09:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y7u5drJT0mavJGQbNOJVAerHycRJJAKN9jThBgI5L4Y=;
 b=SS+UD4V0AucHg1TPPK829NYQF6kZmIG3TGIm3UIjuozdJL3Tc3T1IcUHn1sOiy6f6g
 lzZQbYh3fKiCbNCDQRa22+n01eQPcJ6BH92UybrJFZGdg2Fg0QQuu0pastubdXsRUEBf
 VPMLYx2A3R+piYqtSxk03yywPShm7fgsMfbeCGvmkQG/Ycy/CJz2R2IBc9LN9wVwpBJs
 ThC6v/y3LpZoiLeknWhVDCLPRN87LMtVVzdGuZbzoGscWAWqhizemSl/wZUhXQFyWzDV
 2y9YEPZBx88JGEmr3nSaMtCNVnJoFsUDixGrRa1QfwWbWLDtTML113WTLzzu4u9HXwxT
 kGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7u5drJT0mavJGQbNOJVAerHycRJJAKN9jThBgI5L4Y=;
 b=OQ7e0JTaBIyrbu4RtnJ4rCFWEnOiPXFqMVUZH8SkTKUmorUOIrAY+GebreFz5mZchq
 kbmlFSVeXpzqTHIhrRV1vKQ0cQarPsNPIgpVlMvA1Zk54PgVcK+4KMLWd9ygdc6Kw5oe
 N0MLIwETN3a9bWDwWXs12WUZBKedipp3FRYreTeLxztSI2UEgS+sCCV3MZ17Pyp4mwxC
 89llPezLDXi7yAgmGIaTw3UHJ+aLkYAR0hpFiOuzQh9McGJW1KtmKfFTVkyi6lgrioig
 /INSr60ZTMTN/iJxkIYg7qa5LwwndIOLaK8aO+5kA4hPmc0kRkccF69AhymEHDOYYbdK
 lkuA==
X-Gm-Message-State: AOAM531MYUbavbswfrERL6BjKOOmK9F/Grx47FDfOWGWyMP4IPkRErVM
 aLHDBzgR1HkLoLSS0Q9K9NqD+yyqGIR5adIPjnDypw==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr4288713ote.135.1592497002126; 
 Thu, 18 Jun 2020 09:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-11-richard.henderson@linaro.org>
 <CAFEAcA-QZ_D1tQMv785xsxWwcEKmM76dK4Mvgx=y7eyb_mUqEg@mail.gmail.com>
 <3b1b50b8-061e-8422-2df0-e8df6f856941@linaro.org>
In-Reply-To: <3b1b50b8-061e-8422-2df0-e8df6f856941@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:16:31 +0100
Message-ID: <CAFEAcA_LFC8isWLjUZCXOjDnPcfO+-bS1jRJTEwqMP9CwKS-Tw@mail.gmail.com>
Subject: Re: [PATCH v7 10/42] target/arm: Implement the ADDG, SUBG instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OHlfa2s3maX/

On Thu, 18 Jun 2020 at 17:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/18/20 6:17 AM, Peter Maydell wrote:
> >> +        imm = (imm >> 6) << LOG2_TAG_GRANULE;
> ...
> >> +            TCGv_i32 tag_offset = tcg_const_i32(imm & 15);
> ...
> > Given that we don't really share any of the codegen with the
> > existing disas_add_sub_imm() insns, and the insn format isn't
> > the same (uimm6/op3/uimm4 rather than an imm12), I'm tempted
> > to suggest we should structure this the same way the Arm ARM
> > decode tables do, where "Add/subtract (immediate, with tags)"
> > is a separate subtable from "Add/subtract (immediate)": so
> > instead of disas_data_proc_imm() sending both case
> > 0x22 and 0x23 to disas_add_sub_imm(), it would send 0x23
> > to a new disas_add_sub_tag().
>
> I'll do that, because...
>
> > But this patch is functionally correct...
>
> ... I've just noticed that it isn't correct.

Heh. I do think it will look nicer this way round.
Don't forget to tidy up disas_add_sub_imm(): its 'shift'
field will then be 1 bit, not 2.

thanks
-- PMM
