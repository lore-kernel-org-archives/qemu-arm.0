Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11693643wrv;
        Fri, 26 Jul 2019 02:51:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCg81x5k3CYhcv1eBkekMkR678qD030YejNj7IY7FiEYAhFt33Pth9NLJ2qPS1Uf4z6kf1
X-Received: by 2002:a05:620a:68c:: with SMTP id f12mr61869889qkh.197.1564134696402;
        Fri, 26 Jul 2019 02:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564134696; cv=none;
        d=google.com; s=arc-20160816;
        b=IcgZZAyfz0wLkteAWJVHogrVS5m++psmQVHFaM6ATVPdTG0toCY+RUBxTYSVeMpqSy
         DFbMoOW8p6V0gVL7YvejuhfRlV+Z//Q3ucDaHwk0hbGyxZKM0wLJ9w8FMdBfDPeH6hUj
         RasguN7/G5FOOapNaz26yhpCkqsH9QsEp7Glt19KYHFPRVESMH6508Yng3qgYcHc87HM
         mnM+8NxXR68di8DkjWMXSoa42I1daJo3S3ocvmIEsE6uKuZ/7nSwnyM2sckXo+GtXEFQ
         4rF2BG/F+jlYedVJ/SUwD+j0ZGJYIw1osdxVZmWgfGKYRhN4pjvLjGeZCYzYacJNOBCY
         9uAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2PCiGOH2vGt3268bPGg5gjlycDePgi+EMiOCq8SixbU=;
        b=B93xN0hxsWU+AHbzSXgf35hPxzRRZTLmT/LRlnTlnATpY/ZKmFDlyFC3ohxiSjb0j2
         nPrjHdtMpJmmPZHr1LSV7rXnWnYXFwK3SeVsXh/Lk5/5XIYS2RfRrd+KNtWj2FF1s9pR
         al0HWmDfKvoETQp0uJlnwgcIE432MDcmbYTi4YMPu3zSWUSCfpxDyoaWK/TkizXDWLzA
         Jdb5Gl47Q5bS3NmBzC496sLSFZv86U+d2raaEBGYL0q92ZlTzj4Prhbh7HWfn1ATEZ95
         +aF25sl0cfKROZwWt55EIWLAn37dhQBMRaMQPPoW7TrmqRqydxwZW5x+H7taS2znp9ij
         +sSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H1gqulCT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o55si32615238qto.378.2019.07.26.02.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H1gqulCT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqwst-00066V-0E
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwsl-0005um-Gp
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:51:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwsi-0001g6-Ab
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:51:22 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34669)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqwsf-0001ER-3g
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:51:20 -0400
Received: by mail-ot1-x341.google.com with SMTP id n5so54811922otk.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PCiGOH2vGt3268bPGg5gjlycDePgi+EMiOCq8SixbU=;
 b=H1gqulCTeptLH3/sG/ZRPrpRqjytKhBmEzZnhXl+/kYCvmf0A7v01NNdAfmphjvQ+v
 i6GjiWH33h5s8KeMF+ovRlqomWsocvA0sYU1s38AsPOO7lWWY35XJO+5cJTHw8YuKbbg
 l555MlIl+4PJqKVRO2hkBNHUa58SweSZWLX2JPuFnVdLMniyaHWbcbCZGLIOOcOX4PmO
 WmoX8JtO0uVs1Ot4T7VmjheEQkoP+iuY4htm4iUhtqeB0fxb/5kvZvLvbfLYSwAty7vd
 /lNeEksd2LVMQehOCVZzJ44qHy9hoBOtkG93cp6EZ0YtLlMrAAxosEk8JIXX0CXCEVBr
 DXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PCiGOH2vGt3268bPGg5gjlycDePgi+EMiOCq8SixbU=;
 b=ThujGEmRY0rHiPe6+eqZmXpclw9T3WZltxSxj4eG4wGsSrPb2+fhIGMOKVAspPUnwH
 7sgikTvJdujQApEikB3dYq7o3K0irRnsydSaaynztO5Ps4Wg7jde5xxfSv21zrPeElRh
 0FG2hoTCkzX5E+H/NGiArV5Fw2KCTh7cOkne2AI30c+LU+A1D9dday8QGdrFF8CWNjXY
 osVvyziC2fskKzOMO24TduDJ3LHyqhFtigVgPPwuqkD7MuhZ1Ax5zfshf9czZtgnp4Ud
 DN8RPqST7/kW/cjp/Am23dh9YfBG3uekVyunHUNxichLGa6YlxGduHW9fXLKcjxU+ECn
 Hd2g==
X-Gm-Message-State: APjAAAWFklh4Lu/Trl5XN17o9LL/fRmomntTYQPcfkeQymteGjxGvx/o
 HPTKdrJe/mXofhwwAq9/uYMA41u6lYaYqWXsC82vDA==
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr21050879otk.221.1564134672931; 
 Fri, 26 Jul 2019 02:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190724143553.21557-1-damien.hedde@greensocs.com>
 <CAFEAcA_KW329Hzi-fm7RnxZsjdUDz=qmCd69YeO6ar9i+MZTJA@mail.gmail.com>
In-Reply-To: <CAFEAcA_KW329Hzi-fm7RnxZsjdUDz=qmCd69YeO6ar9i+MZTJA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 10:51:01 +0100
Message-ID: <CAFEAcA_jQEpNrNPq-6ysmY+v4ZhVgy9kwdwxC-=SNgGKFNguuw@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH for 4.1?] pl330: fix vmstate description
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
X-TUID: COBW7GC2Q3H3

On Thu, 25 Jul 2019 at 17:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 24 Jul 2019 at 15:36, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >
> > Fix the pl330 main and queue vmstate description.
> > There were missing POINTER flags causing crashes during
> > incoming migration because:
> > + PL330State chan field is a pointer to an array
> > + PL330Queue queue field is a pointer to an array
> >
> > Also bump corresponding vmsd version numbers.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >
> > I found this while working on reset with xilinx-zynq machine.
> >
> > I'm not sure what's the vmsd version policy in such cases (for
> > backward compatibility). I've simply bumped them since migration
> > was not working anyway (vmstate_load_state was erasing critical part
> > of PL330State and causing segfaults while loading following fields).
> >
> > Tested doing migration with the xilinx-zynq-a9 machine.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next for 4.1.

thanks
-- PMM
