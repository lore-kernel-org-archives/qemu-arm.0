Received: by 10.25.77.65 with SMTP id a62csp565392lfb;
        Fri, 3 Feb 2017 03:34:07 -0800 (PST)
X-Received: by 10.28.35.142 with SMTP id j136mr951736wmj.11.1486121647644;
        Fri, 03 Feb 2017 03:34:07 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id 2si32187862wrr.147.2017.02.03.03.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 03:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id b65so24344250wmf.0
        for <alex.bennee@linaro.org>; Fri, 03 Feb 2017 03:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uAb6GVvTIbaGQIS4Y4i9bVYGuKO2bnjy3qWlzfB2vxY=;
        b=CKxJvmixLVewBXubLhlGYYp7X5wYhOfH6NKcLEx8aDHZB7uEN+B1PpDieYIH3/tQ7U
         WROiPbKsSDUBvUu1TPhEoOyL93S/D9E8a5GAN/X72N7oDtrbosKXvSYWyAAeglhL1+sY
         UqT4yol1fVQT1X65rRP1C4qPwWqG8Efi6sdnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uAb6GVvTIbaGQIS4Y4i9bVYGuKO2bnjy3qWlzfB2vxY=;
        b=N/eEY/yKoMbg0qMEhne3EHelrQ2v5E7sJttDsbGr19l8SRBEYNJahq/9LHcyldSMhd
         iMAiXvjLbmifL/e2oMPYvys1+cgtYTh1PF6uPwu1R5+gVq5rzdN7H3MhMzs7u9td3zF8
         Yry1QE7P4DeKiq8dzoqdd87ZjmVUjNf2ZablzRMv4ji0bsdxf/vINRje8DECCAPIOAbS
         8Uzu/l5H2wpeVkXCiINGexYLqdG3JJKijAMDpv1R50eG6ZfzsHSAKVuZZBFLYLoUqOv4
         nSv/VaWVJx61s8NCI6Y/gmDKCzfzJyQAXRpq6dj1ynsM/PuTzCkaGAF7Wwbz9S9q0QJ7
         U/SQ==
X-Gm-Message-State: AMke39l5gI5b+7FVhlqiKsk5VaBOa+ExaG/U4mBNP1xtEfP6psv2ooInadolwN8akRRzABIEECFh4ZV+wEhpj/JFIzs=
X-Received: by 10.28.11.135 with SMTP id 129mr954379wml.111.1486121647311;
 Fri, 03 Feb 2017 03:34:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 03:33:46 -0800 (PST)
In-Reply-To: <20170201150553.9381-25-alex.bennee@linaro.org>
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-25-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 11:33:46 +0000
Message-ID: <CAFEAcA-eB9mzS=j5Y1Upb2f2xw6zjtiRHTXcUY0BLDhL4WasZQ@mail.gmail.com>
Subject: Re: [PATCH v9 24/25] target-arm: ensure all cross vCPUs TLB flushes complete
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: a4SL82DLJG42

On 1 February 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Previously flushes on other vCPUs would only get serviced when they
> exited their TranslationBlocks. While this isn't overly problematic it
> violates the semantics of TLB flush from the point of view of source
> vCPU.
>
> To solve this we call the cputlb *_all_cpus_synced() functions to do
> the flushes and ask it to ensure all flushes are completed before we
> start the next instruction. As this involves exiting the cpu_loop we
> need to ensure the PC is saved before the tlb helper functions are
> called.

So, to continue the discussion from my comments on the previous round
of this patch: I definitely think that having the helper function
longjump out of the main loop is awkward and is going to cause
problems (for any target doing that, not just ARM). At the moment
we use the longjump-out approach primarily for "this instruction
didn't actually execute". That works fine because "don't actually
do anything else we generated code for" is what we want there.
Trying to longjump-out for "this instruction *did* execute but
we want to get back to the main loop" is more problematic, because
now we really do want to run the generated code that follows,
and so you end up having to duplicate the equivalent operations,
which is error-prone. ("yield" also falls into this bucket, but
we got away with that because it's practically a no-op. Really
we should fix it too, I suspect we get single-step of it wrong.)

So instead we should avoid the longjumping and have a mechanism
for making sure the code we generate after this helper is called
ends the TB in a way that takes us back out to the top level
in the right way.

The "do a TLB sync and longjump out" functions are an invitation
to target CPU implementors to write buggy code, so we should
I think not have them at all.

thanks
-- PMM
