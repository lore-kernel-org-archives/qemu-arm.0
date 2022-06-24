Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp623595lft;
        Fri, 24 Jun 2022 14:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWU5qSI4qneD9oFH6hyx0Ddn9nvE8fg3CaGGQ7v/3BKckOBZyXOzHs9WJ2ZG3oYXtxWjBv
X-Received: by 2002:a05:6214:f2c:b0:470:41c9:9100 with SMTP id iw12-20020a0562140f2c00b0047041c99100mr1025379qvb.112.1656106931343;
        Fri, 24 Jun 2022 14:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656106931; cv=none;
        d=google.com; s=arc-20160816;
        b=X9U2qN0Zgy5UF1EAnA3H176TfDLSJB/jQsGx4D0JpxiUotV767aBTsBsAgZN7r9kZ7
         6PST3RLrLDT1CuZ9cLxulvPkc6wRvHnREp8zQ+Q3NukXyWH6kCA7UtZDK1BmNEWbMF2b
         V/pkC+c79YExOXxOTVLgHpp1GvwSEAK6d5jSSTJRcAcz+WB0I7mmIQa28AmaXnumkmMf
         Tvzzu5Eh1GVMmi1F45flYLC+iIW9r/cmeZB55/ubxoKcPgVh9ZipzB5huzabk9MXlexG
         cMBLbSriCNtBrrpVY3Bpf6HA4q3SF46BUsY/Ue5b/kB6w6nA/eWeGsF3k5VVlOwKUndb
         K0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vTdpvC51yempUAHC2edj1BajcdeqB+w+icd8GhZQLfk=;
        b=DD51KTcIxwxrFbYYGxU/5kHvQeGDU3wEFt+ZsrE8u494vI5FX+nFjVzLKhFWTf/aSa
         2xTo78UTOslxlE1v9tu4MknTTFMQvlbIbi4rEx48KivZA2f//fvRCGNi9t8ATZT52Qih
         e3AFy5wFor3wqm0EQQ8dVtaSHfl8guvLpuXKkgOoLLu5/rpJP7YFjoYQQ+igr6QCZNdo
         wY4X0bCpCdwxjYPMggxjonZSXpcIaOzjLDie4YhXdxvoHtfyMOYxcgjzqmmrlcmqx0/9
         Zx2XmVDs7+bNXyHB+5ds0R0fBtmE1HSSOFbz8PZ9SK6dJK7rKUDvIIc0cryCnO6z6U+Q
         BY1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VPlBH/+R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac85e0d000000b00304fee76741si2410761qtx.630.2022.06.24.14.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 14:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VPlBH/+R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4r46-0005AG-PO
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 17:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4r1Y-0001OZ-N4
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 17:39:33 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4r1X-0006D6-4x
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 17:39:32 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3137316bb69so36507647b3.10
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 14:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vTdpvC51yempUAHC2edj1BajcdeqB+w+icd8GhZQLfk=;
 b=VPlBH/+RlULFaX+NYjCGxHc2skcJx6fWcx5cUa8cqNSTdWEU390B0k5qMq2pqOFIY6
 Ll3xKD4GLKDKPIw226Yv8Fw7hJviYT5K5kRorbvB0vtiQkPJ4QhUmu72Zl7zqs7doSoW
 P5mKWdHodlqJtJSCjOGEULuZAtXhs55F2Ii8COrOIdRTUwM2mInQjiaJah5PmGcz0Pl+
 zBCCm55jc9HHB4RlAjcNB20qYgY/Q5uohyFkTZr1y+o4T32jGAm4oeMzavmazCFtRq41
 ADXT5zu+sBO5JUD52jtbaS6naF+EV30Vjjcbmjvn/JVEdTbsifzQ+fBjRoVSwJR/8gIE
 ngDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTdpvC51yempUAHC2edj1BajcdeqB+w+icd8GhZQLfk=;
 b=2yVMejQhqK3/pP9ihUPyy1JRvQ220KL8QWzAQF0iSIgOOn9ova4hOi7W0JMGkwaB5s
 cQZBuqyepySGhJAEeB1TFSbnLBjsgxaBb1JsbGJ608e001WxHbFSzeTDMP/S4rP/VhRj
 1d7A7KBZ4jMyRJk1E1gy/c0cTZeHGXaMZIYogOJSSn6nA5bUqRMZhw5Nad3c0l2R97an
 nP9gy5U6kAbMwzKro6yJKuJcyTOhiMnVub7czc/ilGub6fP4z0VdYAuLVUUF40ZtLSTy
 wDQmXuqbxY6zGY0/xVDv5396RyXI3lHY+a6/tceQp/1OOszNVlCLPeI6kDfNLxpV4phF
 X6yw==
X-Gm-Message-State: AJIora/iPEhht8CclSQXk9FEZTenrGi8h0vFGjMe147gn2ThvDVVEi8I
 ueDvMMUxUy/ubdNLLeqo532bUKqxDT4QF2ZKrqNVmg==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr1161071ywd.64.1656106768278; Fri, 24
 Jun 2022 14:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-23-richard.henderson@linaro.org>
 <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
 <eecb93a9-0f5a-2a40-eef5-3a5fe0a2079b@linaro.org>
In-Reply-To: <eecb93a9-0f5a-2a40-eef5-3a5fe0a2079b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 22:38:50 +0100
Message-ID: <CAFEAcA8pVo_ua62r4SvUC242afcJvD-1EHSV28OY8GpWtpjq0A@mail.gmail.com>
Subject: Re: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming
 SVE is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: EG0zB/okOCBN

On Fri, 24 Jun 2022 at 21:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/24/22 08:30, Peter Maydell wrote:
> > So the thing that worries me about structuring this this way
> > is that the SME supplement appendix includes this caution:
> >
> > # The instruction encoding tables in this section [...] will
> > # require correction if subsequent versions of the A64 ISA
> > # add new instructions which overlap with these encodings.
> >
> > My guess (based on how the H.a Arm ARM has incorporated
> > SME) is that these tables aren't going to be included
> > in the Arm ARM and updated going forward. Instead the
> > behaviour will be documented based on whether (existing
> > and new) instructions call CheckNonStreamingSVEEnabled()
> > or CheckSVEEnabled() in their pseudocode.
>
> I agree that this would be cleaner and more correct long-term.
>
> > So I'm a bit uncertain about how awkward it's going to be
> > in future to maintain this transliteration of the SME
> > supplement tables into decodetree: we might find that
> > we have to look at new instructions and kind of
> > reverse-engineer back out any required changes to the
> > tables here, rather than simply "write the trans_ function
> > for the new insn, looking at the pseudocode to see which
> > _access_check() function it should be calling"...
>
> I thought about this, and if it were simply a matter of annotating the trans_* functions
> within translate-sve.c, I would have done it.  But I would need to adjust A64 AdvSIMD as
> well, which is still done with the by-hand decoder.
>
> Can we use this solution in the short term, and fix up advsimd while coverting it to
> decodetree?  I'm more and more convinced we'll want this sooner than later.

Yeah, I guess so. Is it possible to do the SVE stuff the right
long-term way and have the short-term fix only for the A64 AdvSIMD,
or do we need to do both the same way ?

-- PMM
