Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4216578wrv;
        Mon, 5 Aug 2019 10:08:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/lxxyHRZVsm6qeAjM0EwPxx0wdk21jFZ7I1QcnLfykmfxIfl+oxpnA5SL9vIPka5HpYLd
X-Received: by 2002:a37:9c88:: with SMTP id f130mr100862847qke.494.1565024900143;
        Mon, 05 Aug 2019 10:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565024900; cv=none;
        d=google.com; s=arc-20160816;
        b=w7F17/jF1lLqFb9HtOVkpGYOxkqsCc4Io4343Oau7YxcYkdPp9zvUhVrRO241Xyk6w
         dWpFW9gRljoO8HG3qVz5KLSwWiT2XDnLf1zwYxCnNy9EvpMaLBQgQuVrRxEt5Hbq6Tla
         KOPYxOMWYy6yscVd0p4ca5V7/hYtHe0LsDjiF2oaRD+ylNT2ujshaqWQfTOZ7H8sikb+
         yLmk56Kvo+Cb6SCId7vJXbcW21EmFy9Yjco8onQ8qM3yocQSH1RkNGmI2D0DfSMUzcxB
         M7u6jobPKkbklgWTBT+49+g9LOHaI+x97el3Ad7y3kFpsYM4YtDiNW08bGGKCRpmA184
         VixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=n4VD/TPRQDUMzNqZGhCvOlXEUFnIudw6nAu1fCasCWM=;
        b=lLyajmsqTquKNxbp1piI+uRRPTWO5CiW6zPHPoMu5GtKj49YoeWhfjOQJWElwihmL8
         c9NjmRQKxnINM/AkSvHTuuofVOzsdjTgkNQiFqqaS/Dw2L+oFhNmweAQGdqg92thAicL
         VrjgtrCNkeZF23eOOrA+40ZYzHPKWUnZqPZdzuGiVf2ApoTnye31Fs8fQgLZCWShFkx9
         Z6g1oixvjMa/DipUIEAp3OtOQZlEQy3D1FV87ScvQ6mbXdPq0VxcVmsZ6c/VR9qAQ22L
         WYp5/EWP23AtMWeK95Bmww0aKxMSAIb4JTpy63qOUZl/ntlTSzkOjIPIbbDhGOMEeYzN
         2o8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="eLcz6/P6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 35si10567100qvj.125.2019.08.05.10.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 10:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="eLcz6/P6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hugT5-0000Zm-OV
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 13:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hugSf-0008VR-Pj
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 13:07:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hugSf-0002nl-03
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 13:07:53 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:36831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hugSe-0002nB-PI; Mon, 05 Aug 2019 13:07:52 -0400
Received: by mail-lf1-x141.google.com with SMTP id j17so4571689lfp.3;
 Mon, 05 Aug 2019 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n4VD/TPRQDUMzNqZGhCvOlXEUFnIudw6nAu1fCasCWM=;
 b=eLcz6/P6/FeblnHWgJrPfhsdfS3gbLz2A7hPraNaJZN3RaEEl62haAe9c73VJGxvbo
 xf3+8GVGankcP9bNA8GaG52cVNqX/gQYcAiO77A5Jn1JqU9q6wiByON3vu7wEmAlznmP
 mkYNo08dZtRxR+XiUjjoxeTydN3/EwkECsHLCJn/mgEpKLz82f0kqFEdv//m/Ver3I6t
 5UitIrEK4KnNgRStEqMgnIlFgFgRTQfchqaCZgnlTtdzRUE9FNFlivqOUM0jnN/fLKRB
 DoR3xojqHzkYGdqPaOlHrDqYoh6PRilUQEmPUiPHUzQjsT+SPBj9Xo9LIenhSKC0yozj
 IfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n4VD/TPRQDUMzNqZGhCvOlXEUFnIudw6nAu1fCasCWM=;
 b=tUXt2rGC/kE8PqanBKWKojJ0InruSUimENTrlyEvZ+R2ZsptlqEvPUHReXPD07mHvg
 DjE43j7vXzHQu+QRKQAWvH+8pvgzg6AyjshSO8Y6Dz6pbZmcXbDZNcXS24Ie0DN/Lych
 Oj8TNHf88kWsJugnHZm2BHIfiUcIeGUxXsTLkVYcPd7pLou8lkPqFOj/7h12SrxqaTi3
 0XXpHpfg1ZIEml72/2UW07tvEUQXbsucuLoQHZFueqpZdSDhFeF20FscHNwA+6c21bnF
 /OsjcdwNUc/D08NLyNm53ATFPk+lWL9BYYOsQLf4SYVLVDxOJPEZmJ49AaIEZqxJ7kXJ
 2ALg==
X-Gm-Message-State: APjAAAUpkaxBs9BxUy7wgjbkwcA999RwWLCJHota0Fm1bu/QCVQKnLRy
 ZPbF8KYafzUBFJtZVREYPxjc+Xu1lCaJOgcsfeI=
X-Received: by 2002:ac2:563c:: with SMTP id b28mr58321278lff.93.1565024871247; 
 Mon, 05 Aug 2019 10:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-5-thuth@redhat.com>
 <b3696656-201d-9777-0b73-b6903949d61f@redhat.com>
 <533ca6da-a3ae-1c6b-a75d-f20bf97d8115@redhat.com>
In-Reply-To: <533ca6da-a3ae-1c6b-a75d-f20bf97d8115@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Aug 2019 10:04:10 -0700
Message-ID: <CAKmqyKP=sNYUr1YF19eQNwBMVtPyJBqOAHb2h0chti3ReTVXAQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-devel] [PATCH v2 4/8] hw/core: Add a config switch for
 the "register" device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0t+0qfMA2LUY

On Wed, Jul 31, 2019 at 5:33 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 31/07/19 13:44, Philippe Mathieu-Daud=C3=A9 wrote:
> > What about naming it REGISTER_ARRAY or REGISTER_BLOCK?
> >
> > The API is:
> >
> >     RegisterInfoArray *register_init_block32(...);
> >
> > Cc'ing Alistair for better name ideas :)
> >
>
> I think REGISTER is okay. :)

I think REGISTER is fine as well. If you really wanted something
longer I would go with REGISTER_API.

Alistair

>
> Paolo
>
