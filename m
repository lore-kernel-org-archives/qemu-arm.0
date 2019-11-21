Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3659970lfc;
        Thu, 21 Nov 2019 07:34:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTDeOX/kNs18RMfGFTnxa0ftPaTVOuI9UqWzNWnAfI9xRypfaxVKe0Xy8bI0Ev5aKd+D+d
X-Received: by 2002:a7b:c347:: with SMTP id l7mr10881594wmj.48.1574350477759;
        Thu, 21 Nov 2019 07:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574350477; cv=none;
        d=google.com; s=arc-20160816;
        b=X9X7sk1LhQ7TazusfeS2BJpWIZCJtdpDxR2W2GX1NgzYYq1aC7y1lUXc0xWpJl0FrC
         1laihtU2Ga3u4Zc2zutwMriaELRmemImWEy7qP4rwp5GNJ6/lFHjzudbeFrxTLLbHJtY
         0uqVWHlcSMMiscDyiz24MAzBJbCFVJN/uf88wgGjVG6Nckq4+4fDDeyWsbQcd3KLiY5e
         xjspnpDslkgHNJbC3T+Hzej7LUK7AJAf0mSPyJs62h6UP+lZiKj+bPm+44u+Sj/1kRfQ
         tJzvKBCQq44MFSH3057syx5k6m/e+lmuQGhGkpmlfBlsNfXmONkbyYeA6ANfFoGZsTai
         NCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qJj8k3J2wILV578XxWxTSJaRX2KZaMUm/y8Zc925SYg=;
        b=WFZdLCeb+Kr8ECbieKQXwvNy9tVgYH/5/OVJswI+WtV21K8jSPBrz8SCfekdO5fy2q
         J/oMbDeDjODA5UDorqcX+QImU++xo5qaeNjifjVSg/LKr8kZv3qcXfwWxSSP6aYNmXxB
         Pbxacu5w/XitnfnQyIc4meK/zI71MnzcvucW9pKaKkNcPVFbPw+79ZtI75WeP3qfnsRt
         doMy9PhCcrj1DmuCmO8NUpTv1b/L5ln+MIBv/h+AdVXqsxAA2lKb7bEuL/Qh9jsp+Nx5
         Cy+9OrHPNGyjeF+ylJVZ7TxdU8FCsw83wT4zpMTPgEzBZQjMwYaPUEK/VAl9oUI8tCmc
         KBBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QzE59B0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc20si2431651edb.201.2019.11.21.07.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 07:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QzE59B0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXoTY-0004El-Uo
	for alex.bennee@linaro.org; Thu, 21 Nov 2019 10:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXoRu-0003gG-8l
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 10:32:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXoRs-0005oj-Ho
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 10:32:49 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXoRs-0005o9-BP
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 10:32:48 -0500
Received: by mail-ot1-x344.google.com with SMTP id b16so3265413otk.9
 for <qemu-arm@nongnu.org>; Thu, 21 Nov 2019 07:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qJj8k3J2wILV578XxWxTSJaRX2KZaMUm/y8Zc925SYg=;
 b=QzE59B0prj7zPeb0tfxqRf5USI3LTtT9vinu7e4xkzeZogMj0gx8Olqm5pSXW6tRTT
 5iOzb/F2sdDYPJyyfcI+r/LAO33Tqoj3WEv1LJQRmAxfwR8KH9aPaX35X34akhVgUI8O
 6ZvP8KdAcsTK7AxXoNezEtWGrOU/PuJT6AL9r40HrLFTvahu45tJyCeffM2v0lTrzfle
 YplXE3/rWtsiJetqMAzw/995XshVDcCJV/O9SU/4ZP6h9DJVBEJWeXtg8HePFOglz8Oq
 fLOgOHbpNw8+j6ck8Pb9j/NHXy5pZZsO8fymMwpw4KnTLrmR2Y63/LvWcNK1U3bJcZC9
 TdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJj8k3J2wILV578XxWxTSJaRX2KZaMUm/y8Zc925SYg=;
 b=KCZn70sJMexE/fuZskyOW0VmyFXOCce6MyPisAN2dV7HRJAiazRpODPi0b3hLddlmX
 j/F5dOcF4TZ+Kf06WznXGq3Z19Qcct4IMnKNDXjW6gL8QbVn8+3eWeDWPq5rmkKwI8bD
 B3RTbNNW3L/zpv5TUeXmRpbI5updNN+MRrSEmzLY2iYWcbUBlELil4/9yP7kCOe4sXwD
 qnumG1VDpElqubiXWrno2CvJWbiv8Yn0aULBgV27I/+BljbTr+f/s7kMPaxPyyvyib8M
 mqflaq+QY69FCyaPtA+vhktbRyN7xyjC0mSrAn+EwdOESq3+RPBSriOIt2bRHJaOW83N
 CN3w==
X-Gm-Message-State: APjAAAXKztn0722ix8sR7xWo8mMb2B06omuax7f+2puP+hs/22Aorvyq
 eHetY0fdeLy11jGnkILVRkksdIbrai0ucj1W8IFPIQ==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr7271627otg.232.1574350367411; 
 Thu, 21 Nov 2019 07:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20191115154734.26449-1-edgar.iglesias@gmail.com>
 <20191115154734.26449-2-edgar.iglesias@gmail.com>
 <20191121152803.GB31462@toto>
In-Reply-To: <20191121152803.GB31462@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Nov 2019 15:32:36 +0000
Message-ID: <CAFEAcA9DxhXLzyaT9EYSfasAQh5yPsfLyMmTwX6twESJ1gfOig@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/arm: versal: Add the CRP as unimplemented
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LlvZfYL2VZsW

On Thu, 21 Nov 2019 at 15:28, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
>
> Hi Peter,
>
> Can we consider this patch for 4.2?

Sure, it looks pretty safe. I've applied it to my queue
for rc3.

thanks
-- PMM
