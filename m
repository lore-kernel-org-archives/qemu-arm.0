Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1993577ejf;
        Mon, 26 Feb 2024 03:32:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrIfW7rZyS285Z83WU3cy5IwX0SeWPKVFZ13KBYyCiApTTMkluW2uFRcLSWBEWag6nkvbmw88f/ctpUBpHP2BTPmxsZAxu
X-Google-Smtp-Source: AGHT+IHjB7EQinTkBAGKNbMGRfd33KBZ81+DBAXTtKQrJwQGsgpHGMQeAozHcLPMym2B1hv1Sxai
X-Received: by 2002:a05:6808:318c:b0:3c1:a376:cdee with SMTP id cd12-20020a056808318c00b003c1a376cdeemr2545173oib.0.1708947164538;
        Mon, 26 Feb 2024 03:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708947164; cv=none;
        d=google.com; s=arc-20160816;
        b=rzPXaAsWHafgPzrW1MdKMdPxdky6rLEaP6GkRWtGH8uofpxeGpzbBpsRAWpAObh+UQ
         hW/CcX2M3f2k9YOFHyk92RzxjOBCAh77KPiPQW031f2Bv4UYQ9tp5R7VEsgjRykuZhRR
         UXbOezi2j1/gzODrrHLhDkBrG79uNdYwgWLQHK1v0WrFEbNhx6swOrsiNFXI3OEn3RJb
         SpRoA5pOHZ5S6hejycxzHebamDl0sT4w1v1FATJ12k+aXVMzKM4fRQdwHknrbLQxrLwq
         Rrkxe/hyvKRLV8OH+aOj66v95z01WS0H2iDZOMD1UYLQALEy+9zHnh7nk3ef38eUg1Il
         A5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=m0nMnDapFvvatrHhVmCWyHBrI/DiblXmep0imBoSKP0=;
        fh=pqC9tScbI+YWSmN6CVUVB4d/8FACYIun3pFhf2PTBlU=;
        b=NTd9AJMtW9gzHN4tPOVvd5oJf+r7+KX5gsWC5+WjVMo9CfFn5gkPfr2uFwTw/bS/yJ
         kQu/jX+yylbhK/XlJqMqSal+p1xLxl+SGTSjbqMs0hjsXz1a6rmxNxtfRXZdJ94jO1RA
         rdkG639ro/iBVLc/4ujBGN1AlpDEU0O5dt1qCro+Ytsj/BJKJ6zYl0ko1ipxACopqEt3
         0To56PyAD9D/uQ3/E/6mrkr2F1vsnoOneTgHXIMX5/q3RZCJKaaUylS/ilk6QhbiEZP2
         lgwpsKAmDvxszSLhnA5OgmOXshXw2S68jy3DHxUnUnLn56ssIKZhD1WEYVQvRb5yc1ga
         G22w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FGvAC2Xw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a0562140ca300b0068f4f727799si4889399qvs.590.2024.02.26.03.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 03:32:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FGvAC2Xw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reZDl-0000IL-5T; Mon, 26 Feb 2024 06:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1reZDk-0000I1-5C
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 06:32:32 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1reZDi-0003nx-MY
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 06:32:31 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5658082d2c4so3652311a12.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 03:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708947149; x=1709551949; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m0nMnDapFvvatrHhVmCWyHBrI/DiblXmep0imBoSKP0=;
 b=FGvAC2XwnRO/nPcxPv8XyWqPTJvkTBdrCIKFPmhPL0Bk1qHekd1L8KPZaDcSaINyu9
 OOFGKZc4x+sE2112MMqkKiruYwscF4N3bEAOV1dJfbJoILolgOELLuesDtRCVvNrqC/b
 fumkhDTqT1sgWnJTrs1WcxHo2NJ3SOZmTJH9XZ/cY9njpNLu5/GZkqLPfhbdDoxQqNZX
 wKc2x6dW0bOXnKRiBU2aVXiCoBvDW6k3oT2TnP1Sq8DwSUvPjqGwrhQ1ScmwQRzFzaQy
 usJ0HlVmTpATAUVEi5MRwAB1aOodTmTDrK9KMmU8tOoqVAoQpVWi3CMrdLvWcL5yvMvI
 Wv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708947149; x=1709551949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0nMnDapFvvatrHhVmCWyHBrI/DiblXmep0imBoSKP0=;
 b=d7AAhPCrZrkg8BBWni8dpRUEWMlKTIy3thXH7LtaIbmBQAkhOAYbqZdS3lMLkuhd2G
 bkPkRGEeuNrEIUhZ5cBZAiaXlBbJLqSG36pPFf3JoaFFkPk8SyAPAT4e4RNoZSEKaYEe
 zkcSYEVEGWSFsjk5la1L/NhXWry4TfkBnzjvrDLxES57fH39UxehxC7Q5MH7cJ7RE4md
 c4f7tA04HoIRB+MFrAAYon8LfFC1kwfsxwfD0+ErZiDndBzMpudexdxpx8vesqM+vdrZ
 eAVC50u5218MHqI/27Aw4cRlONrtZujcS33h65VrsTCRd8l/ClVw74vopYEwEDfLKJhZ
 KCng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo+r06OwEkV44t+w3De4Cr4Ng8DAEZzik5uyqIrPbNySUSU0JGl4UNMaRrSnElcMIkhzOChPuxt5zo7Wy5ocwn8jfc
X-Gm-Message-State: AOJu0YyBLX90iL5M7MWsPw+kGd+1ylMtu+cCM8KnA4p86P3/I82dEbb9
 lsQN3sE2JXnUySNb/h8SjVDOshYX7+2kYBy5GYlwCpBUatEwtc+BOqTfTQ/eBcpG64Ll+VRfndW
 lHZ7WhDNRdETaS2CZ61vD7RZ75iL9aAmsofr08w==
X-Received: by 2002:aa7:d958:0:b0:564:f6d5:f291 with SMTP id
 l24-20020aa7d958000000b00564f6d5f291mr4745407eds.34.1708947148878; Mon, 26
 Feb 2024 03:32:28 -0800 (PST)
MIME-Version: 1.0
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-18-ruanjinjie@huawei.com>
 <81167528-32e3-4741-84e4-3c70b788fc2c@linaro.org>
In-Reply-To: <81167528-32e3-4741-84e4-3c70b788fc2c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 11:32:17 +0000
Message-ID: <CAFEAcA9vxm0V3XNo_VVw3bVH1ucW1gWZY=rpvaOk3iv0fqOuVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 17/21] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: qtn3yIBvowyQ

On Fri, 23 Feb 2024 at 20:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/23/24 00:32, Jinjie Ruan via wrote:
> > Add the NMIAR CPU interface registers which deal with acknowledging NMI.
> >
> > When introduce NMI interrupt, there are some updates to the semantics for the
> > register ICC_IAR1_EL1 and ICC_HPPIR1_EL1. For ICC_IAR1_EL1 register, it
> > should return 1022 if the intid has super priority. And for ICC_NMIAR1_EL1
> > register, it should return 1023 if the intid do not have super priority.
> > Howerever, these are not necessary for ICC_HPPIR1_EL1 register.
> >
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

> > +static uint64_t icc_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
> > +{
> > +    GICv3CPUState *cs = icc_cs_from_env(env);
> > +    uint64_t intid;
> > +
> > +    if (icv_access(env, HCR_IMO)) {
> > +        return icv_iar_read(env, ri);
> > +    }
> > +
> > +    if (!icc_hppi_can_preempt(cs)) {
> > +        intid = INTID_SPURIOUS;
> > +    } else {
> > +        intid = icc_hppir1_value(cs, env, true, false);
>
> Here... believe that the result *should* only consider superpriority.  I guess SPURIOUS is
> the correct result when there is no pending interrupt with superpriority?  It's really
> unclear to me from the register description.

Should be 1023: the ICC_NMIAR1_EL1[] pseudocode in the GIC
architecture spec (13.1.8) does this:

    if !IsNMI(intID) then
        return ZeroExtend(INTID_SPURIOUS);

(Note that the logic is "find the highest priority
pending interrupt, and then see if it is an NMI or not",
not "find the highest priority pending NMI".)

-- PMM
