Received: by 10.25.44.15 with SMTP id s15csp373971lfs;
        Fri, 7 Jul 2017 10:48:55 -0700 (PDT)
X-Received: by 10.55.145.6 with SMTP id t6mr34953342qkd.101.1499449735566;
        Fri, 07 Jul 2017 10:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499449735; cv=none;
        d=google.com; s=arc-20160816;
        b=OBdNRDbFrVNhW7opmoZ4iPRTmtTxbR8wgYRNBiBx6wFhLXu1nlSfTsbzc/CGgD1yBG
         YkeM/tiWV0fbKbqMz1MMuO+S+B4AH3DFvrn+xJfP4PnjM3zw5b20LRcqnJRV5HLWrVpH
         0+O9SNGleL6s+oC61imqpFq8OnabMdLGxnASPqig8UqxXoCYRFMIsTMMoGsqVhL6Ii9h
         M1UM0ZnbLXQreKRlC0Sx3L/4on1hq+K3nQ6mQCgz6lh/aHDP1TrLNW+cSLZ+TyUJnrD7
         JdELceLDSJ1YZ18uWBZb/YnqTkr3xyQqK4XKgzr5Ds6VntZAJ1bQr1njQGi+ApPn+aMW
         nq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=OG8Fwv58TEqPAeD1vmSFdpvIfHInQXthHvAdQGqmRJY=;
        b=MlWioQLTU/SWsg1wgvReMGE641EqUB7a7SLxGtrqAj66BfSEiHdFe6vvaJqfw4n+Pt
         u6BMTgi+8MyDfjchfKRVG2ZLc6o1w/ZbNzt3OZe/pE4SqhEwkkbvffNEU8BLW84NVPkM
         DpIV2Y8dOACe9gplOVf0OlFRxsxIH//r+Zdw/Sers7W6cRkmasOj9pFXndiIjtjc1zEe
         7Vk095yGuvBmWct5Rp4jxijPMUNoNWn+vhs8UmpwmFeX67bJ7JqYusLra5ibrTslIKIY
         ytu06lGUhmsp3vXt+zRBTWexbhF9I7Tw0xvZfCITSZEjf9HTrdfzdN5PP4XIR56WbUaY
         x4Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=UXW9ZVAP;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com. [2607:f8b0:400d:c0d::242])
        by mx.google.com with ESMTPS id g64si3670109qke.298.2017.07.07.10.48.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) client-ip=2607:f8b0:400d:c0d::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=UXW9ZVAP;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x242.google.com with SMTP id c20so5125103qte.0;
        Fri, 07 Jul 2017 10:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OG8Fwv58TEqPAeD1vmSFdpvIfHInQXthHvAdQGqmRJY=;
        b=UXW9ZVAPwD+uU4aAzJc8dzFUJGCIhWx4UxDtEK6AsbDQVvMT3ja6o/WMeKglOz+g1l
         +knyJTd/2HDjXQQwYiA5PE5Yd+1CFXGCe8Y41qg/QbUGD1jiIz8MAtrbuuz/V7ctCfkP
         GFpt4Z+kz80SDKCA6lbkATVezzSMuw3Zpv9ftj1ocCzom607Bh3UH+6dR8mLovL7gF4F
         4K/cSFOowd4ZnCwpcfVQ7mePGuQLOfriBZXwmsyZWhRNWXt+CQ/JVagi0RrpPZtmpGJr
         A+s8UPLgGHnS0RK6dK22r+GgLZUZMehZ/ABJrOtDPxRJ2GS95u1pz+tCUyIVi5HxeSaP
         jhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OG8Fwv58TEqPAeD1vmSFdpvIfHInQXthHvAdQGqmRJY=;
        b=g+IWkBU3icg/aY7ZuPSmSlp2eWJ8MgzIM+hN8d2tA77A3kDkdCRdmnkXQb45T2a0+G
         p/VMHd6IK1gbK6GefXP8AF4soE7a/zSHSLIVZKviv10szF2xB9cRKkKNciN3qIn5tGp4
         +P1hcYyBRmSG4Vz3C+m4xoY0wpELk+/HZMj4/lNbLDXGbpCELIG0pt7/YB/cQT/FAZ4w
         Bm5Zq4tKXeTuwQebgen8GtMwaCjMh6MIBE5o085+WXtmCCGUlfnlPLSXbSP8AKNCeYWE
         Wlc845FwElI58ikFZY6PFyd5nJDEr+ejQma3tpcX4mMnN2k937Vohj50cCENQmx3DsWj
         /l0A==
X-Gm-Message-State: AKS2vOzCKS5Xv0olZyaxMv/42H/4FrAN5ZxHzWYVStnmk+aG4o8dnSRj
	nA2Xz3TTaJeZV8wxr7U=
X-Received: by 10.200.38.244 with SMTP id 49mr58410116qtp.236.1499449734979;
        Fri, 07 Jul 2017 10:48:54 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-66-91-136-156.west.biz.rr.com. [66.91.136.156])
        by smtp.googlemail.com with ESMTPSA id l31sm3143261qtc.64.2017.07.07.10.48.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:48:54 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 23/29] target/arm: [tcg] Port to
 translate_insn
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865776960.17063.4875279139522061160.stgit@frigg.lan>
 <2bfdb883-f19b-7fcf-c28b-7ce39115937e@twiddle.net> <87podcebyi.fsf@frigg.lan>
 <3745ae02-3fb0-1503-9c99-98dce369f697@twiddle.net>
 <CAFEAcA_tKBtOOc8XCHYRGFT7qN3FmDD7awfvZrZA+2kbQNp82Q@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <cb5ab1b6-e748-c3e7-7691-beea1567b058@twiddle.net>
Date: Fri, 7 Jul 2017 07:48:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_tKBtOOc8XCHYRGFT7qN3FmDD7awfvZrZA+2kbQNp82Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: OAFKggs0dV9V

On 07/07/2017 07:33 AM, Peter Maydell wrote:
> On 7 July 2017 at 16:26, Richard Henderson <rth@twiddle.net> wrote:
>> That is the purpose of DISAS_EXC too.  We've called a noreturn helper to
>> raise an exception and all following code is unreached.  If there *was* any
>> code being emitted afterward, that is arguably a bug.
> 
> One exception to that is a conditionally executed
> exception generating exception -- there will in that
> case be a following label for the condfail case to branch
> to and the code for the condfail path.
> 
> The distinction in the case that this code fragment is touching
> is that the cases handled in current master via 'goto
> done_generating' and in Lluis' patch as
> DISAS_SKIP are the "this insn is going to generate an
> exception without even thinking about conditional
> exception" (ie breakpoints, singlestep); DISAS_EXC
> is for "the instruction itself generates an exception,
> so don't bother with emitting too much unreachable
> code to update the PC etc, but we still need to handle
> the usual end-of-insn condfail path".

Ok.

LLuis, this implies that the DISAS_NORETURN that I talked about elsewhere 
should be the thing handled generically, but that target/arm still needs a 
target-specific define for DISAS_EXC so that the conditional execution handler 
can make the distinction.

> We do a few things in the DISAS_EXC codepath
> (like calling gen_set_condexec()) which strictly speaking
> are pointless but which it didn't seem worth trying to
> avoid just to avoid generating a few extra bytes in the
> generated code in a not-terribly-likely case.

Yeah.  We'd probably be better off just adding dead-code removal to TCG. 
Something that used to be difficult but would now be trivial to do.


r~
