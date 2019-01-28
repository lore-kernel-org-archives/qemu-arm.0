Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3156456wrt;
        Mon, 28 Jan 2019 03:17:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7Dx5a2usM6x2TI0zvNkP6OB64eiKROsTJWg8XU8NjZBSSUaZ+0NStdroUGlUxQpUGuZhoS
X-Received: by 2002:a1c:f613:: with SMTP id w19mr16654935wmc.0.1548674277620;
        Mon, 28 Jan 2019 03:17:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548674277; cv=none;
        d=google.com; s=arc-20160816;
        b=b5DOynD+7fPGZADeNtxWCqYLjoTrmwIseTzrsJyClD60h7bb97Fg29uLrPaVMZIJZF
         AHvXcdZNf9r28GsVX2ybmzmFW9NPzpmYrbN2lJ5ovTx+QraGD5qk0+lCbBZ9eqwalfWP
         yqy5fimGWWFXaSO+44X0QFy647RFxVavF5NRIzYFc3ys7X2lohcau0PTTPnXdWwh32Rd
         xtMSg+XJtLye7Wx5wG5UC7g0W5elc/pGWoGJNdBKIPPPyru9twka5lSTI4TCTnpNeOr9
         wDsUURF2bLmapOsKEy8t7laS6VWhheV1Q/t8VdYWGSMT/SHIMuHOuXbq0wW6I7Xk+Yij
         0gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6xojZOBkXcBImafLp9O0rAJ6gRtvI6s9AfJr7Z93ls=;
        b=HuDS3+n5wtLj3K0oruUC+9VtU5WfUnTvG2P7Fh237QwOlS9fxHoKxcjkwE8L2TELpc
         KQdf2I+VGCGGKfyptsWH2YFaz5hLC+inilR/u5Ns3B8+fBMUTISKt8u5B/DNUm1atdyi
         iKcboKQo8OkeEyMkZxG1xi5g60i17tDQe2/P4b9nZa7BASJPNGb/QpzbLjXh1HSIdulN
         pcjQcvzSotPziA578M5zgGWEiwP7APh74VYC5UKhrri/aUFLoTI+4ZzCgVXwMTL0JO1B
         edGqJgxkh6S5FkqE8LviK+uSy59qn1yBF2W8/HbKz5X7cIiqNrINskx6ZQS4vj0RzTF7
         2Jhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MSyZFSW7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11si78779081wrp.39.2019.01.28.03.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:17:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MSyZFSW7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4vM-0003T1-Jk
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1go4v2-0003R9-Q6
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:17:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1go4v1-0000Ht-0m
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:17:36 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45083)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1go4v0-0000Gi-RJ
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:17:34 -0500
Received: by mail-ot1-x341.google.com with SMTP id 32so14235390ota.12
	for <qemu-arm@nongnu.org>; Mon, 28 Jan 2019 03:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r6xojZOBkXcBImafLp9O0rAJ6gRtvI6s9AfJr7Z93ls=;
	b=MSyZFSW7WyjLjSeGEzhPDzw0Yr8YibJL8PBCQZdB//u/vO/+nhmLPzfCTB6VYYRP0Q
	X/XDwwJicBnT9WjEkhoPWJebaV7tA2PRx9OuUaG9lF6WNVCrr77Fh5ZNRdybHANs4VGQ
	uad1CgUMrs/o7rHHryZ/DN/oT26EC7RvTIDN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r6xojZOBkXcBImafLp9O0rAJ6gRtvI6s9AfJr7Z93ls=;
	b=C+M+sscnh1v/jbT0sL/8W5dCg+Ez8drBwxPbl6kcu+1bt7hjTrdSsFtTGxVHiPlc2p
	sWnOd96rv4LNJi8MiTeU+CeomWOk27LoXcOFTAs5mpge6qFNCd1TVAiWNneC+7cHOBE/
	MAv7KIb2k681i5k4a31RxPZDcCaofDMmEKoOjgFfephZ8GwHLpiZU2sc1aNFHB2sD2Cb
	K/5gu4T8GIx7T5L73p2Gs8fggkNpt3PGCjte2RwNwyoO/xktyqPLJviZeDm0HsNV454k
	B9NTiOZ6MXfF88eLvqa/Nbkdq1KPa9D1CfTmUO6yUrBnVU0uu8hZ26zuXsJaJWP2Z9kE
	MZWQ==
X-Gm-Message-State: AJcUukcWdaG5uB2nWSJ7yxinK5UeaUJUTMTtFMOBWOQQ+hYNE+pqEAFy
	dElwiZfdaiIr9uQlJxbSaMfe0r9ZXH2L+PXB7SELvQ==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr14913927oti.151.1548674252397;
	Mon, 28 Jan 2019 03:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20190125182626.9221-1-peter.maydell@linaro.org>
	<20190125182626.9221-6-peter.maydell@linaro.org>
	<CABoDooO-8HDMU6u_+JZHJRSvSCNp6bWewVoorX8_ekDRsyqtew@mail.gmail.com>
In-Reply-To: <CABoDooO-8HDMU6u_+JZHJRSvSCNp6bWewVoorX8_ekDRsyqtew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jan 2019 11:17:21 +0000
Message-ID: <CAFEAcA9piu-pD1Y2MkD7jiPxc=TwWZO8d9yc2tdiXeMTY=mTzw@mail.gmail.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 5/7] target/arm/translate-a64: Don't
 underdecode add/sub extended register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gdiUDZLT8wEz

On Mon, 28 Jan 2019 at 11:16, Laurent Desnogues
<laurent.desnogues@gmail.com> wrote:
>
> On Fri, Jan 25, 2019 at 7:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > In the "add/subtract (extended register)" encoding group, the "opt"
> > field in bits [23:22] must be zero. Correctly UNDEF the unallocated
> > encodings where this field is not zero.
> >
> > Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  target/arm/translate-a64.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> > index 2cade64ed25..efd2f6490b5 100644
> > --- a/target/arm/translate-a64.c
> > +++ b/target/arm/translate-a64.c
> > @@ -4204,12 +4204,13 @@ static void disas_add_sub_ext_reg(DisasContext *s, uint32_t insn)
> >      bool setflags = extract32(insn, 29, 1);
> >      bool sub_op = extract32(insn, 30, 1);
> >      bool sf = extract32(insn, 31, 1);
> > +    bool opt = extract32(insn, 22, 2);
>
> I'd prefer an int to a bool.

Oops, yes. I think I got mixed up with all the other bool
flags here, but it's a 2 bit field so definitely should be int.

thanks
-- PMM
