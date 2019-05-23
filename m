Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1719772wrg;
        Thu, 23 May 2019 06:21:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBF9rohe1wlYRZR7OnHnqp4zPwqw0mGTZ7w5uBHijeqv8jOB1JMNA2/rlWtJ0d05ucnZj/
X-Received: by 2002:a17:906:b85a:: with SMTP id ga26mr69988168ejb.20.1558617692583;
        Thu, 23 May 2019 06:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558617692; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8JC1pyeVTOqzsPGCJCgMwXk/iPVKIfTJHoFR10w5Dk1PoNsXqeHZ4YXAVhteq3men
         KxcSUgcPIw5MMVDmFJONlFWmQNV2TPj4r/v2xyb7/Y6FfZqhzHWPnas9Begrb2fktnGF
         fssD3KWQK58zIO2bl6CTlYJJxB1T0bmfBkdhlbtWzyaDhisA3v3g1oHE8UE12yz3Lk8t
         Ui/GhlvQEYFNovD+7QtJ+ZCL/stW7wgDDnPAgDxHRytWXC6wAKswm/xRXe+0CqANVDPQ
         DZmy8H5O8PQfaMBZGxGl+b3thiK/i6p8hNm2uYdBnIi43buQThzlaL879vNvBR/mvCfP
         A9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SRdaUVaPAIongb3FeH0Daw2vmeYzyFXzmMqxX+jMjDY=;
        b=HpP7cPux9fZ6nl7aq6Y38U0ijqbUqI6jx8opYuyPuQquX9spOAF6q00R65YG6ait7+
         6LCWm+X/ZaOLSh8+HwMH7ex5QLNwuCeHlM4IXsRXC3FpRp++/I+J3PltaatGzb/uJ0pU
         NVHZynSX18GO8uhdzXGHGRwinnIc/zgu1kmYRMg24IwGEU+eiHBt5QNGdWgMg3VnzkHz
         Mir6My6bC29ZnsxeZPkJj+UQj2NFwpMmeKRAZng986Wd21svCAG27nc2/pfNAGz5Mx6i
         FixKCgs1llNTNpl03ewz/RRWTUcqeNmDHYwyg60+uxamON1V8QSblgrHS6aetc8JO+Ez
         q0cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e7x2SuGV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si809512eju.280.2019.05.23.06.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e7x2SuGV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnf1-0008FJ-HU
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:21:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnNl-0001Po-PF
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnNg-0007Ou-Db
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:03:41 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTnNg-0007NU-2x
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:03:36 -0400
Received: by mail-oi1-x244.google.com with SMTP id u64so4293505oib.1
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SRdaUVaPAIongb3FeH0Daw2vmeYzyFXzmMqxX+jMjDY=;
	b=e7x2SuGVNTzIYl5PeWJSBoUQRPWD5pAIRG0ZxdRRp3QonI3xpgTCUrjKpbtA8HoPnU
	9XGkV8LzwPEN/rUwpGpUXXEpn+jhyTjiB3wPf/4hSRxNDTdolH9EWqvAWW2buE52605h
	zN7sGTAHinq/JpaYlnzJ4fiv7bTvKbhIRmSGugFKlFePiFl7McvD3DnT9S2jtbmg9faU
	pCdwOccDVm4UWgN+/KE8OcX958oAcvboPD0TPox2hJYYdms0EzlX1Pttnc4cjkMNvQiW
	8SgzaF5PGUiI8FQUSCA5o6J06ZilOUDDwy+UB2js1lglXId66muE6wVDX23gzd/4LTko
	ZYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SRdaUVaPAIongb3FeH0Daw2vmeYzyFXzmMqxX+jMjDY=;
	b=NnW75KBN58yUzdX11LhTbhW9Lt6JW3TXMYzrixVlsjm/HF9IWIEVz61RF+eGCGeRfl
	BK2QuKF9FcUalOoryltEg/htwqgd2z3hpy3nz6lwr1sgUprwymaTTOi/x3dIWjmn6tbD
	JVEH2RMbrDo/LbaZ9fDobWltYsXnZ9gDR83i7nt6oQUMOUahklRxKPB8g+RH3niCuj8w
	Yc5TgUgNZDgHwcNJctV/pAPp7Y7ez+h4ss/1dawrMnNVbfBJle676l2Y0BTmRu2RB2Vs
	QpqXMsNxAGcElukc56b32ZjI7P//m4Zoc4UoTG80VysY93IXLyz1B2ohDw2j82sK3D+v
	hmtQ==
X-Gm-Message-State: APjAAAUQp4+MfEr5AREpBaUUsGlq5/zGAR6odIk+TPKY8TchSPMTB+Cp
	GDIBe5gnFIh6UtlFvxORMo9mQkxa5F2VLvW1Dg/D4g==
X-Received: by 2002:aca:5785:: with SMTP id l127mr2509225oib.48.1558616613920; 
	Thu, 23 May 2019 06:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190518191934.21887-1-richard.henderson@linaro.org>
	<20190518191934.21887-2-richard.henderson@linaro.org>
	<CAFEAcA8rbLn53iP8SBKpDju-5n=u8ieWW6=RF8t37nF0UspNkQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8rbLn53iP8SBKpDju-5n=u8ieWW6=RF8t37nF0UspNkQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 14:03:22 +0100
Message-ID: <CAFEAcA_MnfJokoggLb5WmhaCZuPb8y7E8L5P+KO=nNaGyKUKAA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH 1/2] target/arm: Vectorize USHL and SSHL
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
X-TUID: 8G4R8pCi+x+F

On Thu, 23 May 2019 at 13:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 18 May 2019 at 20:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > These instructions shift left or right depending on the sign
> > of the input, and 7 bits are significant to the shift.  This
> > requires several masks and selects in addition to the actual
> > shifts to form the complete answer.
> >
> > That said, the operation is still a small improvement even for
> > two 64-bit elements -- 13 vector operations instead of 2 * 7
> > integer operations.
> >
> > +void gen_ushl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
> > +{
> > +    TCGv_i32 lval = tcg_temp_new_i32();
> > +    TCGv_i32 rval = tcg_temp_new_i32();
> > +    TCGv_i32 lsh = tcg_temp_new_i32();
> > +    TCGv_i32 rsh = tcg_temp_new_i32();
> > +    TCGv_i32 zero = tcg_const_i32(0);
> > +    TCGv_i32 max = tcg_const_i32(32);
> > +
> > +    /*
> > +     * Perform possibly out of range shifts, trusting that the operation
> > +     * does not trap.  Discard unused results after the fact.
> > +     */
>
> This comment reads to me like we're relying on a guarantee
> that TCG doesn't make, but in fact the readme says it does:
> out-of-range shifts are "unspecified behavior" which may give
> bogus results but won't crash. Perhaps phrasing the comment
> as "relying on the TCG guarantee that these are only
> 'unspecified behavior' and not 'undefined behavior' and so
> won't crash" would be clearer ?

I had a look through the rest of the patch, but there is
too much code here and I don't have enough context to
figure out how all the various new gvec helpers are
called and what jobs they are doing compared to the
actual instruction operation. Maybe I'll have another try later.

Why can we get rid of the 8-bit, 32-bit and 64-bit old shift
helpers, but not 16-bit ?

thanks
-- PMM
