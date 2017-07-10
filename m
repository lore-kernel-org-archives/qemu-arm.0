Received: by 10.25.44.15 with SMTP id s15csp3967005lfs;
        Mon, 10 Jul 2017 15:07:22 -0700 (PDT)
X-Received: by 10.28.147.137 with SMTP id v131mr9175459wmd.98.1499724442871;
        Mon, 10 Jul 2017 15:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499724442; cv=none;
        d=google.com; s=arc-20160816;
        b=cZm/SS4l5D6nc4LGoxEt8Jxw+n3qg5uuHZ7uG+1NdNWWIgPnNfHTtGUebADpKKmwa/
         QiyycwElPJBPNHZOoSrwt/GGE5L8YQVogtORRMqwKdkSQX8FWwzK3xABk9cP25FtiJHx
         U5i5Iqj5uZhbH/seWO014lzrQDkrm4CSiO0wdFFMcCwt9/wJX0Z2Oc1m4M8HnLgJbfOM
         4RrZw/yuzfGuV1BUJvem+HJl07hRb8ij1pIZ1fdbaJjlvazTvvwTFalayPbvZcJVe4TQ
         tn5bFYXI9r06MexmCtoqsBFVCnJYD6RbkPdG/NV5vP0mSQ8MpheWzBZwXHX2+xn7C5Gk
         OdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=pMlH0xWWCU1NPCLbTVTMjCODj16mEfgrt8FQRU/Vwq4=;
        b=kfXivoXFkYP89E4i4yZtmpQ+V8l5yLQSBSkGPzsYQDtyT/+unZnG86ocSSoMYfD6Do
         BUhcLQxS0GLQSARtq0dBwIpvWOf1JmO1IX91QnuA0rQn67Zmi11K9Rr+F4HcTQdQxY3a
         0mmwzBxPIpEptoBxbk73rO5d/ea/G5RB2qWUq8RADuN89U+i6DiaDYMrEfWabuMvDnAN
         1mMfjFGyhdxMiOFVQA4FXQRLWyAh4WuF/x+Okw4zaPW7xwUCvfq1kCvpFCPZ3TYc16XK
         +0F/7Y13AouJgkbuxuj4pWBzVX/OBK52sSteevGiEWfJ/Czbm/IkOAzrXdcjgFX86+r1
         csiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Qlpzy58Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x231.google.com (mail-wr0-x231.google.com. [2a00:1450:400c:c0c::231])
        by mx.google.com with ESMTPS id x4si7405462wmg.27.2017.07.10.15.07.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 15:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::231 as permitted sender) client-ip=2a00:1450:400c:c0c::231;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Qlpzy58Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x231.google.com with SMTP id c11so157485658wrc.3
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2017 15:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=pMlH0xWWCU1NPCLbTVTMjCODj16mEfgrt8FQRU/Vwq4=;
        b=Qlpzy58Y1o7XoblnkJ/ZdD4rCKa+beA7eUg2xrIwYXCR3+HHVZPK/hmIL3cHGRSxgl
         8Saa24ikKxOlASi5gaNiyzig6CKoLfOZbjZRpuKCRpxo6sJDWS5PCdlgfaGlvlWG5XVk
         iMBBRczA1QDX6kV/u4KNdkFtnOKp5tiCnr4f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=pMlH0xWWCU1NPCLbTVTMjCODj16mEfgrt8FQRU/Vwq4=;
        b=mboxT05wa7Nv1srdr7jCO8hIrHUfFS6eMsFgaPtzt7McXvp74AqiwDWuH+QWUhb90i
         foAjDtDoMW9MKiotrCZjB+BcA0IdnAb+MYFtB8lJhh92fYVBKHPHcickDmGh6yCU/HV7
         88bY3vTX0AB/sF98Cg9xN8fPmKigUlmjj2by2+igB2a4x+wg7MH5u/5HxrwtWcveS9rk
         WJ6ViLPEsf2sIJab6HMF3FFC/zsxtpzxXexVf7ObZ+449WNZwcKUu/OdlsFRMhrHFjCs
         JqRgA99r3nb7Rg48Gto6ahBfPLvkNmVjRZmPbuGoUT//AgBWotxPSHwGYPUouA/bETad
         fjIA==
X-Gm-Message-State: AIVw110VFg38SCNmN3GyvhD+JkIxhT0oIurBy3XHNme8ZkrIZoh8uZa1
	ytj0QH8lcdN0CcLSOSNgKtNxIFIZyM7Ru0o=
X-Received: by 10.223.172.67 with SMTP id v61mr9140021wrc.112.1499724442483;
 Mon, 10 Jul 2017 15:07:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 10 Jul 2017 15:07:01 -0700 (PDT)
In-Reply-To: <9d34052b-57db-9a71-b8a9-e1bbe1a9fae1@twiddle.net>
References: <20170710192128.9048-1-alex.bennee@linaro.org> <20170710192128.9048-6-alex.bennee@linaro.org>
 <9d34052b-57db-9a71-b8a9-e1bbe1a9fae1@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 23:07:01 +0100
Message-ID: <CAFEAcA_wAjD387bee4dkxrRkAnDV=TQNTwYznHd=TcF0g1x+Hw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] target/arm: use DISAS_EXIT for eret handling
To: Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Emilio G. Cota" <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Etienne Carriere <etienne.carriere@linaro.org>, Joakim Bech <joakim.bech@linaro.org>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: fnfDoAuSWGac

On 10 July 2017 at 20:58, Richard Henderson <rth@twiddle.net> wrote:
> As an aside, I presume we don't have support for armv7ve?  I was expecting
> there to be an eret insn in the aa32 translator and had to dig up previous
> manuals to see when that insn was introduced.

We don't yet fully support 32-bit EL2, no. We've been adding bits
and pieces but still haven't filled it all in. Edgar might have
a patch to add ARM A32 ERET to the decoder in the xilinx tree?

thanks
-- PMM
