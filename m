Received: by 10.25.44.15 with SMTP id s15csp359862lfs;
        Fri, 7 Jul 2017 10:33:21 -0700 (PDT)
X-Received: by 10.28.88.8 with SMTP id m8mr3068104wmb.128.1499448801489;
        Fri, 07 Jul 2017 10:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499448801; cv=none;
        d=google.com; s=arc-20160816;
        b=U+pIF4MYreqlRFTjj5MqXzy31LV8G7lWvbcX2thsaUWK1Dfh1Okl2b7J8IDJmC7t/o
         ke0D2ru5YbDbjSNvMY4hZzYmSToFeEP4Oll1PM01TD/0+neWLNWIHOdRJ82jRpWS1FaK
         SC1tOkBXCm1c2TX1Nds1n3iWmPH2yoIvGCqgcEhHTtz1W7zMeP+SZRafpgq84yknsE8Q
         boM133UQuHjtqTpciq63R2quuY0BAK+Zz8/eCR4tNgb7+TfZ8EKnSY1pwXYBu2wAvLfF
         j/z+253X3boGgc7cxCa9Nq9f7xHEsPryoOe0YEVzq146J94RSMph2Xkn3v34RrMOtciN
         BZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=4VBRQw8kE8ysO2036sj6NKYu29OrirXOc34W3PtGOoY=;
        b=kSb5Siarm1UPBYUlGPIBHap2oIQ12Z2sl8EHsN1xiE/lEGLmBJLZ7BXyrhGRZCixGQ
         RJJPLkcDZpfkW/OmHSA18xIVfsEyW4jsyBo6eLw0ca0bq+uEfa826yLe+vhK1sZijkOT
         pGBnjVKAcK/V80YHhfBpaQDsgic9LeKjCXaBOABOyyZfDTfBWhGRYcEg87BaLko7nt/A
         +yzWeDPuWSrEPcyAapms1jEdL9uMjbuIH57qxJ8aNrzxsu3Gj/JR76qJwP/F9qlHJkhu
         jpWiTrsZ1NRNpD+ORpCRPR++QPaUmminbzep4sNA0Bv8NKg02eW8fGzZYyZb9LyzOXV5
         uONQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=MqvTpZfw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x233.google.com (mail-wr0-x233.google.com. [2a00:1450:400c:c0c::233])
        by mx.google.com with ESMTPS id y70si18253wmh.28.2017.07.07.10.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) client-ip=2a00:1450:400c:c0c::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=MqvTpZfw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x233.google.com with SMTP id c11so56057140wrc.3
        for <alex.bennee@linaro.org>; Fri, 07 Jul 2017 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=4VBRQw8kE8ysO2036sj6NKYu29OrirXOc34W3PtGOoY=;
        b=MqvTpZfwrjUMB+2/R/xPA7LVhC8yMvwfXfv0KlhnIlUSCUJIQkikewV88LPv34s5MQ
         jaY9Oi/0nzH4ET4L3vXH5lLjDIxXvxgr0QnuOSGCp2w8NgQ7DdVG8kS33WpHA1oXylXe
         pYDlmjRIakfRqrWAsdR+xG3S+HBdFz/0vpXRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=4VBRQw8kE8ysO2036sj6NKYu29OrirXOc34W3PtGOoY=;
        b=p47c1JooD5HI4wVAAtBpd2i8TR9cAYPCffIibqxnS4RxfIRihl9jD8+7Q8XePxeRi8
         2py++SJh/sOwJhdb8Rhw+/YJ9dt2YIZ7M5I48nktEmORd4ks5KoX4HoprLGT1L3ol33Y
         0W/QFRikkPcxPfSKjmdpN9Rx5mMeHQ6qxNQD+JUcKJSbTirDxQMcH0Led52LC/ArrF19
         G8aLPTOXQ7F9osU3TXS6ZtFhiEU6mrwxjPxm574TeuqdqKG/jn34AqEZ2cDXK74uhlai
         +RxeqQCTXdiVU10zkLVHEHjyAxYELQAKtpuGLTUv5vyMKtxPEuwvy0aMKL/qcFzI8Uhs
         qGmg==
X-Gm-Message-State: AIVw110i7D6beBKZjiPLAAk0JXpKczSxIQeQNyXfwKwUbLZe9TuFQt94
	Ypu7SLzG2euiuCSuN2TWrWacIms2Lb/HoXQ=
X-Received: by 10.223.172.67 with SMTP id v61mr1504817wrc.112.1499448801220;
 Fri, 07 Jul 2017 10:33:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 7 Jul 2017 10:33:00 -0700 (PDT)
In-Reply-To: <3745ae02-3fb0-1503-9c99-98dce369f697@twiddle.net>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865776960.17063.4875279139522061160.stgit@frigg.lan> <2bfdb883-f19b-7fcf-c28b-7ce39115937e@twiddle.net>
 <87podcebyi.fsf@frigg.lan> <3745ae02-3fb0-1503-9c99-98dce369f697@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jul 2017 18:33:00 +0100
Message-ID: <CAFEAcA_tKBtOOc8XCHYRGFT7qN3FmDD7awfvZrZA+2kbQNp82Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 23/29] target/arm: [tcg] Port to translate_insn
To: Richard Henderson <rth@twiddle.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	"Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: VLUp+2dtCHcm

On 7 July 2017 at 16:26, Richard Henderson <rth@twiddle.net> wrote:
> That is the purpose of DISAS_EXC too.  We've called a noreturn helper to
> raise an exception and all following code is unreached.  If there *was* any
> code being emitted afterward, that is arguably a bug.

One exception to that is a conditionally executed
exception generating exception -- there will in that
case be a following label for the condfail case to branch
to and the code for the condfail path.

The distinction in the case that this code fragment is touching
is that the cases handled in current master via 'goto
done_generating' and in Lluis' patch as
DISAS_SKIP are the "this insn is going to generate an
exception without even thinking about conditional
exception" (ie breakpoints, singlestep); DISAS_EXC
is for "the instruction itself generates an exception,
so don't bother with emitting too much unreachable
code to update the PC etc, but we still need to handle
the usual end-of-insn condfail path".

We do a few things in the DISAS_EXC codepath
(like calling gen_set_condexec()) which strictly speaking
are pointless but which it didn't seem worth trying to
avoid just to avoid generating a few extra bytes in the
generated code in a not-terribly-likely case.

thanks
-- PMM
