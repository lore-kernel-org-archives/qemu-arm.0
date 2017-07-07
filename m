Received: by 10.25.44.15 with SMTP id s15csp434346lfs;
        Fri, 7 Jul 2017 11:52:47 -0700 (PDT)
X-Received: by 10.200.32.146 with SMTP id 18mr4872156qtd.146.1499453567390;
        Fri, 07 Jul 2017 11:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499453567; cv=none;
        d=google.com; s=arc-20160816;
        b=gZ8GZ1Ks/qcFBOcnQPD6R6zHQS3tigjl+N2IrcGArHo4WZensccxqudJkQt8cPTvJe
         O3nOe9KbWyKUAedLsIMPWYfYbVnPx4kims7lOEOd4KLfGGm0g4tfLxjSzdV6vCp0sp86
         BtsYBlLTV1XzLqOP7Ry49+3YgKQP3+CbMBW1efzcIACdLyHmeTltNquHy82nWU9Bgr4N
         vgcskyFb5OJikc/m3OQqfXEkfTSybIWDhn63wvnvHRuhh9ttVzpk+wyhJswqyqngP+Np
         4AQGe6kikpXX0eNrptiARzn1uDqfybbatr5H/bn9CdI5WHiay7gl3IX7h+nrRgofudTn
         iGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=03fRBhXFsb3uOuozRWT+Et2yfppMQWy3lupIEsdiw3U=;
        b=bKf57f1Xu+O7U10vmNsB1jdSpv1TRi+nM1Czv8+WqUnGGz0uOIFfIEZ1MMv5QN8han
         3AnsdWrSfpmgSbuv6u3rhOPIj4zmWurRqf3EpEV8UuO5Jkt1aAtPU3GHUjDDBb2/C+Eq
         4etCiz787PRSndEqZpN0dxPwScR7GwgFZ5TBJhqShz3jxstEdtaKz/by5mH84r1D801V
         8M3C2P8MmQW/iCJSjdYLOJs3BPdRD33gcWCwPGg1LkIQXaxklyf7FZCiMNoIzwrS1Wtu
         LZoEgk0zCFwqB1fzSdYVnoWczojHfNR2GlRUO/uq+hNTU3TuG5deJCrG+U4c3kpGKyZH
         JuGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=cLEo/8kT;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22d as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com. [2607:f8b0:400d:c09::22d])
        by mx.google.com with ESMTPS id d197si3840265qkg.242.2017.07.07.11.52.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 11:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22d as permitted sender) client-ip=2607:f8b0:400d:c09::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=cLEo/8kT;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22d as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x22d.google.com with SMTP id 16so34802267qkg.2;
        Fri, 07 Jul 2017 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=03fRBhXFsb3uOuozRWT+Et2yfppMQWy3lupIEsdiw3U=;
        b=cLEo/8kTZ1CZfZkCnwiNoWI4JsfrZkwkHXtBg5/PKA10nFBq1LL+ZCWVlmsWPcRMBG
         46tJa539PIaCxQBsELauN0Kjs+2a7kr/0UGJiwoEiH++Y2mPMvdmCBtKTHJ8XyldkO0v
         gggfBoejAQDi95WTj5auEmH5X8tVHopj45Dx9adAmyX5A3bzKJLM4b2C0ikwGTMXfmQK
         1MUG+c2fbSxT2Zgn2a4qLjEzMlvoQZZhs2t353Fd64bbVMcZ3FAE8zkNOlQS4ss5Gbo9
         mB1h/LxDj4pqnYRvtaptbMO8bZHv/3YxY6ToJSsFBD6CRDFcqu0i/1PHlDJJP9s1kDxu
         v9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=03fRBhXFsb3uOuozRWT+Et2yfppMQWy3lupIEsdiw3U=;
        b=W+59xA6IDonJj3hpIJbRVpUy/WZP1GZ/Ese6tV8kYOowN8Z4sv2OC3uxvxDlLs5B2v
         lcysJRyJb7+cJBMLuLmxPDs0450LR5ILUHqlpBJxxDh9kDiaP7VRUwqh6mvAX2oP5uNG
         snOZJ9CJeH+J30YRCfWtt4Az6ceXe7mABfsxrwPSditLBoac3fr4hIrPrEUIjnwI9rsC
         RkOlwjv3oYChtnKrdc7YpXkviZORZm8f1vyzOMn6jBfWVyMFpIOhGt2hWdk+zkP0aFtX
         TvCPdPwPlGLVWSeuHFOdWj/0J6AynYGm2c6Xngu5Po83AkWSvwuCqunsstMOiC/QJOlS
         606A==
X-Gm-Message-State: AKS2vOzU874cUkRYltIr3tQ0QgW8Ka3X3B82TditYH5VK41RsgCxBGQY
	j6mtJn31OJsQBvm+pXw=
X-Received: by 10.233.239.135 with SMTP id d129mr69782578qkg.252.1499453566808;
        Fri, 07 Jul 2017 11:52:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-66-91-136-156.west.biz.rr.com. [66.91.136.156])
        by smtp.googlemail.com with ESMTPSA id o36sm3299092qtf.9.2017.07.07.11.52.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 11:52:46 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH] target/arm: ensure eret exits the run-loop
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Joakim Bech <joakim.bech@linaro.org>, "Emilio G . Cota" <cota@braap.org>
References: <20170707161822.29659-1-alex.bennee@linaro.org>
 <87inj49mr1.fsf@linaro.org>
 <CAFEAcA_YvS8OQVTPnvRtWyVuAKO2bccyNALOs1Oq7snTO1WwkA@mail.gmail.com>
 <a391e7e5-0be9-0863-bfb7-88d9168484f3@twiddle.net>
 <87h8yo9k2n.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <638cda88-5bd8-2a86-d720-04005fa1c1c8@twiddle.net>
Date: Fri, 7 Jul 2017 08:52:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87h8yo9k2n.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: fOhPtSj19t/L

On 07/07/2017 08:29 AM, Alex Bennée wrote:
>> Naming all of these different exit conditions is certainly
>> non-trivial.
> 
> Given the variation of usage this is something that should probably be
> done after Lluís common run loop goes in and we can beef up the
> semantics of the various exit conditions.

Definitely.

> One thing I have noticed in the ARM translator is DISAS_UPDATE does a:
> 
>      gen_a64_set_pc_im(dc->pc);
> 
> I think this is to deal with handling exceptions either side of various
> instructions. Am I right in thinking this is superfluous now as we can
> derive the PC from the translated code address?

Yes and no.

We have typically distinguished between two kinds of exceptions: those that are 
dynamic (fp state, page permissions) and those that are static (illegal opcodes).

For the dynamic, we used to pessimistically save state, but now use the 
unwinder to restore it.  The unwinding is expensive but is used infrequently 
(especially compared to the number of load/store insns executed).

For the static, we know the exception must be raised, and we know the state 
that must be saved.  By doing that, we save the expense of the unwinding.

So, for the static case you're talking about, we could get the PC (and other 
state) back, and remove the explicit stores, but we shouldn't.


r~
