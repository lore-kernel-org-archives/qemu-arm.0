Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp738746lfb;
        Thu, 26 Aug 2021 08:58:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeltH658JoX0fAHaAz9TFDPm2a+VBRor87uy4AJX3x2iNWyPrNlW6UVpLd2p62HXMQ7brz
X-Received: by 2002:a67:e156:: with SMTP id o22mr3290262vsl.2.1629993508151;
        Thu, 26 Aug 2021 08:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629993508; cv=none;
        d=google.com; s=arc-20160816;
        b=Dchrc/oKkU3rAcWxnD7wDXg5PjWWPmbdqrj0ZydQATGHnMs8PqIjTr68XHRbJNDSEz
         CRyfR/sJKUHIOgkonvd9H2276+kIIsj6g1B4Lc3XEuBO9YWGpIv041Ea5761F3G1Bd+V
         mizp283Sgn85IrpId8x1AH9m31P/zwa5kToq5kdACT8V7SYec82tNAP4nZDt/COI/Df4
         dNMyTdmZTeFEX51//3dvBqlkWfhQGp1q1bDjVksmCJuRHnvUmnmZ7ew/U4sKykl1Z4hK
         /EXh5sIk9Hy9rdaq+//ZP/cuZn7om9W/zOCVKBYQBZyML72HVnnSeucj6GP48LzdL2QP
         mKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x8HLouG6vR8xJruVN3+GitwzwG5c5IrzFg27WCrcaks=;
        b=OBeFSdLXHamlfJ9tD+GT6n/AsO9N/7rfZyf4wyXQDytwY3MQ1c2UTJ5aWkJarLcqGy
         LaX0lf2H+sLPVwRFYTYUtkEtQeVNwAf3NqhWU8s1s3sd8nwjoTrKdA1Te2Mc7xIby87T
         T568ttcLSy3ACZAJ4s7Tsp/0/e2F1zsTXPmX9dcIDp2ycI9dh1kK2MGn1a2acA50vUMc
         fJEIIlIROTJWkyDcuKsPeTUGouVWOeJgAlxS8fUrJv1HQ31lZiaLl6ubMgqVNkFzT/Ax
         Zv+jwF73D7V0l3pf9S+uy4o8wfUvOK7kpbRaNZEDeCYpjwv72Apg90Ai5ktPhKpdB5WQ
         Z0Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s9jXA79t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n186si785203vkg.30.2021.08.26.08.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 08:58:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s9jXA79t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJHlr-0002nX-Fr
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 11:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHli-0002lN-2t
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 11:58:18 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHlg-0005NW-Al
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 11:58:17 -0400
Received: by mail-ed1-x533.google.com with SMTP id j13so38849edv.13
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8HLouG6vR8xJruVN3+GitwzwG5c5IrzFg27WCrcaks=;
 b=s9jXA79tE/h7SnHYq3irW1BbKkjboyINlPyd+EVzxwJnZfrMGGrPKsSN0O0OLz/Dx4
 3pPh8nYmhsy8zllPFjqEonWx2dLEKmZQl+860XDe4p1V7SWCx9z8Z/Zfj1gf+JfYvoqN
 mV5/PwYD25yTqr5mp2cehfCpCGSNWUBATNV5wgXcikMDdTZpjap8Yr+yAu09W7s+arhs
 1pOjqQ540+bYuRZXT7JMTgDWI5SsVFyWo7KKlWBJ3YIYDjEXz4rlQ9US2JBfidwKmow+
 BPiiebTJHAchwLssFsyVd5InzjOF+k25LS3wNwvV7hkNofq6amjeHdiRlrRE3Sc++btP
 G0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8HLouG6vR8xJruVN3+GitwzwG5c5IrzFg27WCrcaks=;
 b=Ud3k9xTXeonIWLxmgvLxg5wAjeqTQF1fUgjl0551EeAt9Ap6dnY+WrLkAgWn5xDtKh
 fmWFPIp0FuyfADuvnszdQRQxYaJADE9AgwQs2f3KHiJ8n2UeyFjzDMYebfk6qOB3TW7O
 R1DyWPiSPBR6FfbyR/y2p/ggx1Oyuh++tgO91mG1vh8Z804wAiRUdp5s5bmIWpMDFnfV
 2F/voWnQlI30eG3/ILd06XIEO5X1m04sduB8ffznAaW3T2UVis7MsfgrbgBNW7Scp1u6
 ZiiO/XI++5ajGaM4ku9qx16S6oIqMRO3w2alFQ0pk9y+2fTpUipXuQRJJT9FR+ROdBUK
 nbyA==
X-Gm-Message-State: AOAM5306HwHroJghd1GgOa4f4cAzQItxYnv6dVcjscm7Zy4I9XMQZJHS
 QHeVgf7qkHYynb5um+Ci1vM3bf4EcVvfzO+CwmXTDg==
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4879930edw.44.1629993494794;
 Thu, 26 Aug 2021 08:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
 <CAFEAcA_g59GdK+X366xkWj+znz8B_TTufBMvgvND9TS+dnjEdA@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142FAC4C@SHASXM03.verisilicon.com>
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FAC4C@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 16:57:27 +0100
Message-ID: <CAFEAcA8imTqu1YGfWaOw2-9GUZh_X3rRoUbbFNJXfX4c7H-uaQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xVcxx05DAxUd

On Tue, 24 Aug 2021 at 09:22, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
> Sorry for interrupt you.
> Could you help to check why my series patch cannot be listed by https://patchew.org/?
> I split the patch into 4 commits with 1 coverletter and send them out with v4 tag.
> I can see all 5 emails in https://www.mail-archive.com/qemu-devel@nongnu.org/
> But https://patchew.org/QEMU/49C79B700B5D8F45B8EF0861B4EF3B3B01142FABD6@SHASXM03.verisilicon.com/#
> show " Only 0 patches received! ".
> It is great helpful If you can help to check and tell me what mistake I made.
> Thanks very much!

I guess you figured out the problem already, because v5 has them all:
https://patchew.org/QEMU/1629878922-173270-1-git-send-email-chunming_li1234@163.com/
But the problem was that for v4 the patch emails were not sent as
threaded emails following up to the cover letter (that is, they were
missing appropriate References: headers).

-- PMM
