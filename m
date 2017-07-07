Received: by 10.25.44.15 with SMTP id s15csp255735lfs;
        Fri, 7 Jul 2017 08:46:26 -0700 (PDT)
X-Received: by 10.233.239.135 with SMTP id d129mr68754559qkg.252.1499442385945;
        Fri, 07 Jul 2017 08:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499442385; cv=none;
        d=google.com; s=arc-20160816;
        b=HjJpWlqPSBcpKpmVazyhXZAg3bKoD08CwL8doKsS8G6GOcJhrUzNSAyBIsVkUpsKRq
         UCwQujsjTKRt6vCe6qjNRbTyR+VVQcdYG9reH6jS4mTcXj9sWRAc1VsPmPjj/rGquZR/
         dibd7W5YJeRKQRbp62e6kK6U5ZfwqYPlLIWFXk8Kzd7DfRRwkoIHYMZwlSHJrzI1UyN8
         b4dVKaRH2j9oEoQte9RGA5IkPUEmPYT+QTOULqiQ2SZbDOuayK1t+T2ycQkB4kFXoJyq
         cl1bPymcP72/MB0vvfqOD80xBCMNMK0i7zEJii2dlxOqCz7Cs8SgWC971j/PbUbydWtH
         JbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=88l4FX3luMFkhBcBotq8RuB09kZdzpmtcdaXGwitPZo=;
        b=RekJnTFqO5Q2AeBXupS/gVhcgNzfT7qcMNqXuavc9fWp1F21jMV4WS/w4DBbXkMl/q
         MxGObLyHo8ADRv1VBDaTcwvvwAGjK5S3Bg4lSC5WhtXEX3dyt/ACu3edQIjYZ6dSJUQN
         YAs0NXbbP8Lnu0MgpkXUJiXHuBCTyR7toef04rwJe7bA6YiPkVqYOHhW4AjbyNzVNuP0
         GqUvhNv0XeaOxh20jWKQHB7XK6y//rKYLkb5PvKXsSquUU/krMmbAMRZRiviNiPBZOu5
         m8/iTJwwMg0ZDUJT+g9yB8WmZzVYWyBfjUxCVE5m6hz4vnlyb2qVol4O9j0brcnzNAUO
         uKAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=s9g5qXjP;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id y44si3582885qth.62.2017.07.07.08.46.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 08:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=s9g5qXjP;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id v143so4764306qkb.3;
        Fri, 07 Jul 2017 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=88l4FX3luMFkhBcBotq8RuB09kZdzpmtcdaXGwitPZo=;
        b=s9g5qXjPNok8/KLVAt+0v8qLPMNwqd24FTf3+YXnkS0fT1EaixKU1CjAfHEzAZH9dn
         2qZR5PtL95c2VG16kbcJAdVOZvl30h9IicucPxYrbGRFky2NuyN4uzX0rRcxxl4r/kdx
         lIkzb+63tvKRY81pBQ6/iFjuxnkge3tkQOG7gqQWX9xsw6pUP21WXC3MzevictOuD4wo
         yEs9CkwYIvRo0cvwLfdiDo58HLaGheW7OO1Od3x0NsSnlRV94SIxgoQYHzpTaS5xN+KI
         JsKfXffFR3F9F2aoWfn/ve0p3h5jWwbN/BsPCq6w2Bfm39N4ftNQa/MTRqvGemKQ0TQD
         IN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=88l4FX3luMFkhBcBotq8RuB09kZdzpmtcdaXGwitPZo=;
        b=ESZSk0Lc75pPFMnSlt6Lt8QPfX17QA1to2iicPB7ZOF2YevBLgilOW8KnTHV5aGjJ1
         APhMyUyt4Sa7WogTP3CUTs4bcATj+1nHwwNPj6n0XxZYT5woq35e6FIdGz3jNYACxduc
         XqwNXz/fWciuUr3oU/zYUmyytkd+PQJ5vL4wxlcM53xfq2vAQXWc46A9+6ZxAWbs8zhC
         gAV93sPYZZeY3q0yjlyiv/vycA5avp2mvUxWlUv9aMisnoOjiYsv/iGAtNUnoTY8Unnz
         Py9pNE1MWVsTuJP3gcXPrSDazjEdOCvsS0/LmYSQD1mN89AugIe54TE6tx3Vzpjebt2W
         n3cA==
X-Gm-Message-State: AKS2vOz65qTIEjII9mr7hEzVBU/VyI701izfkXBFizMfPOL8wPwx377x
	S2F43j36Yp4xWEWgxwg=
X-Received: by 10.55.123.199 with SMTP id w190mr67205329qkc.21.1499442385324;
        Fri, 07 Jul 2017 08:46:25 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-66-91-136-156.west.biz.rr.com. [66.91.136.156])
        by smtp.googlemail.com with ESMTPSA id v5sm2837685qtv.38.2017.07.07.08.46.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 08:46:24 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 24/29] target/arm: [tcg, a64] Port to
 translate_insn
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865801156.17063.15618379976159104550.stgit@frigg.lan>
 <244b5aab-8863-3139-f252-09cc02333eda@twiddle.net> <87inj4ebqn.fsf@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <c35a41d9-4c9d-3daf-2759-17a784b8711b@twiddle.net>
Date: Fri, 7 Jul 2017 05:46:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87inj4ebqn.fsf@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +bhCW5qtazUQ

On 07/07/2017 01:18 AM, Lluís Vilanova wrote:
>>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>>> index 9c870f6d07..586a01a2de 100644
>>> --- a/target/arm/translate-a64.c
>>> +++ b/target/arm/translate-a64.c
>>> @@ -11244,6 +11244,9 @@ static void aarch64_trblock_init_disas_context(DisasContextBase *dcbase,
> dc-> is_ldex = false;
> dc-> ss_same_el = (arm_debug_target_el(env) == dc->current_el);
>>> +    dc->next_page_start =
>>> +        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
> 
>> I think a better solution for a fixed-length ISA is to adjust max_insns. Perhaps
>> the init_disas_context hook should be able to modify it?
> 
> ARM has the thumb instructions, so it really isn't a fixed-length ISA.

 From the filename above we're talking about AArch64 here.
Whcih is most definitely a fixed-width ISA.


That said, even for AArch32 we know by the TB flags whether or not we're going 
to be generating arm or thumb code.  I think that these hooks will allow arm 
and thumb mode to finally be split apart cleanly, instead of the tangle that 
they are now.

I see arm's gen_intermediate_code eventually looking like

   const TranslatorOps *ops = &arm_translator_ops;
   if (ARM_TBFLAG_THUMB(tb->flags)) {
     ops = &thumb_translator_ops;
   }
#ifdef TARGET_AARCH64
   if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
     ops = &aarch64_translator_ops;
   }
#endif
   translator_loop(ops, &dc.base, cpu, tb);

There would certainly be some amount of shared code, but it would also allow 
quite a few of the existing dc->thumb checks to be eliminated.


>> And, while I'm thinking of it -- why is the init_globals hook separate? There's
>> nothing in between the two hook calls, and the more modern target front ends
>> won't need it.
> 
> You mean merging init_disas_context and init_globals? I wanted to keep
> semantically different code on separate hooks, but I can pull the init_globals
> code into init_disas_context (hoping that as targets get modernized, they won't
> initialize any global there).

I suppose you can leave the two hooks separate for now.  It doesn't hurt, and 
it's kind of a reminder of things that need cleaning up.

I do wonder if we should provide a generic empty hook, so that a target that 
does not need a particular hook need not define an empty function.  It could 
just put e.g. "translator_noop" into the structure.  Ok, maybe a better name 
than that...


r~
