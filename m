Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2291766lfa;
        Tue, 13 Oct 2020 13:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2gVRBaClwTLcTJqNLLgXXijtxSLNgr6+p25jeDgIOMNgKxP3ZhCMAGR9sinwgnobaD3zB
X-Received: by 2002:a25:b849:: with SMTP id b9mr2399783ybm.464.1602620673473;
        Tue, 13 Oct 2020 13:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602620673; cv=none;
        d=google.com; s=arc-20160816;
        b=w/tWj67WNZwjdnSGFrpVH/3cXhtw8GubZm4d2rCBJL9Ru9JPFc47NwqwDS7iIG/kOj
         7CM8jiVTDSdfPIjNSpgbuHIk4Kji3vsq+vm5XhdJykAHN//sfGkqi6pX0JadDcQMpb/e
         merpCTiykScgZLqrNmaYbxwH47GUF4+LQr3mUgqrEj+uyczjoZ33r/FQ4VJ0PLny3Es2
         AhZVNTezd6rBR18fj4NFlhZD5Le8tXvZwaMpj+uge2i7kHbPyUmUqv9CKCuuKf/k0YxC
         H8v3HSA/6atCj6nYNSSVkjWbKyAjynTkm50U4zsHoftN+JKk6f5dIp4bze2vpuqxgVim
         r2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3g6Kv3zk7x+qQX/qQjQviLQSOnyHJG3LV9xUoNF9TAc=;
        b=YSuN8oOzX1lrfpfaL+mT8gtNT8I/c/nicthAFFRBoWdcOag8ubKgoR38dWG/PUiHCG
         xXTFj+39Jjq8s88sEuf8Ws3U7mFU1PdToucnWygoOZJrhcPlnDSP2QLYUqhqy/opBjrN
         OcjAjeklzevt8VAnpekpQ3L00enfq6+NxC5kZHKc2gED2qcZZmLE+nlx591sJKbvcdhk
         3gbs8l+fYKDnbrip/gySHbhwOX3p/tksPNWMBGxey+jZKykasBOOmza9hLsET3KE25VV
         ci+BGdjZXfFe8eThjlZCsH+RIBKasHbj+8taM4BOQk6uLKtPsdsY+XC9ASX9QpVbsJcP
         GzWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RP2TB5JE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d191si928299ybf.243.2020.10.13.13.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 13:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RP2TB5JE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSQqW-00036W-Ta
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 16:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSQqP-00035A-D9
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 16:24:25 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSQqN-0007bm-Rt
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 16:24:25 -0400
Received: by mail-ed1-x542.google.com with SMTP id cq12so843598edb.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 13:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3g6Kv3zk7x+qQX/qQjQviLQSOnyHJG3LV9xUoNF9TAc=;
 b=RP2TB5JEZ/jPKcb5xpg2chlbiC0Lj+cuxdJDtokpex8jJw9xIC4nMcd7DheBoFmiXC
 +5aagdREGCjId0llv3JELlKXE8dvbSfwYQw6TkYfF/URM4C+/6mri2ZG17zEecGarfpa
 9H8aqjXStYmgISu/q1WieMdlDUB7jTXpdzqHNTiQLGEM2fTJg95EPOG9ev7pOlcyHmM0
 jFSkO2pwX39C2sPg389l7zeowdbVaUVS9up8ephTiNm6JrxQg316J1Td/CS43iGwtz1g
 X88lcaUGBHHnZCn/K2+oYydxYoo6/9bfFWpHDwHCePpiQX6dyQbP5RBF1DuEbsZ5NRiw
 TUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3g6Kv3zk7x+qQX/qQjQviLQSOnyHJG3LV9xUoNF9TAc=;
 b=koHPw2H+UHQfGZZe2zbBJvU1snRQTszBPx/RFvxH2tuoIU5w2VIFJrjrRLKw55i30s
 zO79pzBMwCkIFUEDuQ9sN2M9WzSsiSTNSogN0rhVQJ9UHNnH/K7t/F672kbNQhZrF8s6
 Gd8JOH3XrYSZtsp1+i/Q5cEq1H0bcqniaAii/63mB5gUsYIVwiVlhaut3CeCHtQho+O0
 qostEceDBpm/b+VAnxXC+Lvwyzi8rtzlA+1kjf2wUkCiMRXeOXze1zCT9fAP7JtpLISa
 vB9pycNSSrFVzJStdqCH78PbsZm99Hd0N7XubWMFl+VWiGJCk3IQqk4axOlHOtu11/Vr
 Zj6w==
X-Gm-Message-State: AOAM533pwe5ybGMVyc/PM/FFtFvKaVB42h26Gd7i4+VVz3xe1rzAtQRt
 GZ0483PhrTUphs7OgjE3y+NNpu8zDgKlMeDHSrOhzw==
X-Received: by 2002:aa7:c302:: with SMTP id l2mr1500044edq.204.1602620662248; 
 Tue, 13 Oct 2020 13:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-8-peter.maydell@linaro.org>
 <CAFEAcA_MN4pzkWV65+2VtUgMdayf6pa-RCLXiomCsntF+38hNQ@mail.gmail.com>
 <9a06ae91-68e1-47a7-c6aa-19c1e2c47dda@linaro.org>
 <CAFEAcA_EHAsJTDV3JjriUC4rNj829LWCp9PNWScz+7uWFxxCGA@mail.gmail.com>
 <ceb80cfb-44ff-cca7-aae7-e4a4dbfabf0d@linaro.org>
In-Reply-To: <ceb80cfb-44ff-cca7-aae7-e4a4dbfabf0d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2020 21:24:11 +0100
Message-ID: <CAFEAcA9NxZ1WCH+wAy7QpVSsYE1AQ829Lh4DhCy8+KzoofTJuA@mail.gmail.com>
Subject: Re: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: YtyTF7oOeoju

On Tue, 13 Oct 2020 at 18:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Well, the only further comment is that, in the followup, only WLS gains the IT
> block check.  While I understand that's required to avoid an abort in QEMU for
> this case, all three of the insns have that case as CONSTRAINED UNPREDICTABLE.
>  It might be worthwhile checking for IT in all of them, just to continue our
> normal "unpredictable raises sigill, when easy" choice.

Maybe, but there are a lot of instructions that are
unpredictable-in-an-IT-block (CPSID, CRC32B, HVC...)
and our general approach seems to have been "don't check unless
it would cause an actual problem". The only place I can find
where we do check for this case is in trans_B_cond_thumb(),
which we do for the same reason as here.

thanks
-- PMM
