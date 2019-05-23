Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1724032wrg;
        Thu, 23 May 2019 06:25:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyD3I5JDXZ2xwMz2q7dMlKt9FpGtbxCw2IXLITSnXnASOK3xtDDEcdx/gXvAgJ6N3iMfowQ
X-Received: by 2002:a17:906:1514:: with SMTP id b20mr46114306ejd.174.1558617927815;
        Thu, 23 May 2019 06:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558617927; cv=none;
        d=google.com; s=arc-20160816;
        b=sua5qEAswK1cAGM4oCYzzxvD1FIE7BGTFIWh6qWjaBs/Qkij0tYVxcbr/dGUpT8rrK
         blboGVEp79vSDfTB3k3fozFgHaCh8h1FgX6vrD8aCylJhM8Qxie1FJNgdM/LqP7xuNhF
         Y4pN4iQd6tZHQwmZTWSheKukkuwpi6biGXOZyUZ3ba5Vaije7QtJREOGwZRvbFOa85Ge
         bAYFHpsl5fjVPGBHm+jpqvOyRKaTQQHZJAXC2glnHuZObuEdMF+jHNoe89PntN1IGMyE
         rGYrmLWjmbNzdTKQ+oMBmSV++nEG0i8rDeWvQSMyKM/0dfh5S2PPRWc8v1V5OVqX5HSe
         TNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iNi4D6yP+yLWr/A+HIxi2BRqJ+LMGJAMgF+vXMY9VHA=;
        b=LnoNkqlUSvTBSkccuJc899w5WWQtm4b3m8JgtDZeAILyqmR8sYok9OS1xpTwP3lLx9
         D4QgTZMP7A59cYwhwNtHi7KXMZrkpUl5HaxTl+2C38RxCxibyUtVvmJTIpBjmRj+8oLp
         XFMWO2DDunYXYpFyq9AvwbqwsaX6JLukr/+yjxu0VYcMHE1/qwboAonC6wZCp8PP5rVn
         FyiVAYfyh5twxAjL38/xwspWiuwZ+xbL3GzZN+87oUuU+E3JR21QynnZ5A4y2AgGVHUE
         v7UG1fMcPcBXQH9n/CPf1rFsfrp8cobwPBLIcZf8Gggz03umjALrY87pa+F802BoKqKV
         RBRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vifgh2ZN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q24si703973ejt.147.2019.05.23.06.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vifgh2ZN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnio-0003Sl-O5
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:25:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnSS-0006SC-15
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnSQ-0002jw-Nw
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:08:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTnSQ-0002ii-C9
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:08:30 -0400
Received: by mail-ot1-x342.google.com with SMTP id t24so5299225otl.12
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iNi4D6yP+yLWr/A+HIxi2BRqJ+LMGJAMgF+vXMY9VHA=;
	b=Vifgh2ZNQk4CXRkJydrqZCaMJ2lIKw8VAWPXQSP9SPi+Va9+bgHqonE66Bt9DqwAUj
	g2AVU6jTIlQrnWkI5bmZiUfBS1WUYdxlSnWnpbeUXlBYUTv1zWd/HOHQ90uDHDeab/NX
	J3UFeox467tpmWhvLfzi+HJ5OdSR1IV7rj/7Hbb181sgFNfDe6xcHKln0ZZbpFiLlbE7
	IyZf3b2gbqr+22W15xQrthBZWSB/fYd64WrZqF2ReY3Y+yFGLyKUSn6+4gBU3a4V50tC
	WmWEgaHvdfw83A5h3mlA/DgtxenSdeH3aDUFG9tvs3+hJAbGlsmK5b9FzdKKOQBqoVp5
	ZmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iNi4D6yP+yLWr/A+HIxi2BRqJ+LMGJAMgF+vXMY9VHA=;
	b=aHgkV1cQ/k52fKYx+mULXMR2RCarq4KWD3cyk4gDeO5nr2GfVYoxZo3PDeuIjQ0wrU
	mDVVrpX93G/PDwY7inZ7n8N9KnfQ3xeECkm+Elg1v/FUgNIfUKztjLBJr42DDyeebJkp
	bfRAMhueNDAYOSrcoxXfIjWksst3xLiPkMAW45AwRGnpXZaw2IPsAOFKbHJBVUMPL3oM
	FpZY1FLojyJll3pe+6b90fvy3pmAR1Sii+S2ycnHKEGb2JpjUvoHFgTdr9Jl1q0CH+iB
	gYDA+lX+E2pk5L3/J2zCWvDh+WpG7VUbNWOBD6JjVnkM0Mrp6H8xjm02QyVq+PPnDEz+
	4x3w==
X-Gm-Message-State: APjAAAXOdvpaJ+nr32pOXx/jltBbpShWnY8A1b1A4AFi3gWB2kB7a/QD
	WjCYFeueIHUKHxkrHm38kF9xMOUKiQwKjnbs2SuAQg==
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr21145703otp.91.1558616908221; 
	Thu, 23 May 2019 06:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190518191934.21887-1-richard.henderson@linaro.org>
	<20190518191934.21887-3-richard.henderson@linaro.org>
	<CAFEAcA88nA_2u1Yc-9ZPAy2w6LVk5f9Rrss0e53E11W4Xb4YpA@mail.gmail.com>
	<e177b43a-2abc-3aee-461c-2cfd9a8a0a20@linaro.org>
In-Reply-To: <e177b43a-2abc-3aee-461c-2cfd9a8a0a20@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 14:08:17 +0100
Message-ID: <CAFEAcA_1XuWqVu9gonn5_Y9x1V=UcWNHEXtwop2s0qyUbwiZpg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 2/2] target/arm: Use tcg_gen_gvec_bitsel
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: to9GppdmdeMl

On Thu, 23 May 2019 at 14:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/23/19 8:46 AM, Peter Maydell wrote:
> > On Sat, 18 May 2019 at 20:19, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> This replaces 3 target-specific implementations for BIT, BIF, and BSL.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> @@ -10916,13 +10925,13 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
> >>          return;
> >>
> >>      case 5: /* BSL bitwise select */
> >> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bsl_op);
> >> +        gen_gvec_fn4(s, is_q, rd, rd, rn, rm, tcg_gen_gvec_bitsel, 0);
> >>          return;
> >>      case 6: /* BIT, bitwise insert if true */
> >> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bit_op);
> >> +        gen_gvec_fn4(s, is_q, rd, rm, rn, rd, tcg_gen_gvec_bitsel, 0);
> >>          return;
> >>      case 7: /* BIF, bitwise insert if false */
> >> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bif_op);
> >> +        gen_gvec_fn4(s, is_q, rd, rm, rd, rn, tcg_gen_gvec_bitsel, 0);
> >>          return;
> >
> > We were previously doing different operations for these three
> > different instructions. Now we seem to always be doing the same
> > thing but with randomly reshuffled register arguments. How
> > does this work ?
>
> Because the three different instructions perform the same operation with
> reshuffled register arguments.

Ah, so they do. Next question, how do I find out what the
order of arguments in the above code means so I can compare
it against the pseudocode expression we're implementing?

thanks
-- PMM
