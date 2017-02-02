Received: by 10.25.77.65 with SMTP id a62csp89179lfb;
        Thu, 2 Feb 2017 03:31:22 -0800 (PST)
X-Received: by 10.31.209.135 with SMTP id i129mr3738370vkg.35.1486035082410;
        Thu, 02 Feb 2017 03:31:22 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com. [2607:f8b0:400c:c05::229])
        by mx.google.com with ESMTPS id x3si5202926vkb.228.2017.02.02.03.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2017 03:31:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) client-ip=2607:f8b0:400c:c05::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x229.google.com with SMTP id r136so8550531vke.1
        for <alex.bennee@linaro.org>; Thu, 02 Feb 2017 03:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gsEhF633aruy2p61oRaOfmrToW7aol4bEFgaOokGFsY=;
        b=e3XzRh4HyUvdkhFlL8mQ+gxbGvHOksNIJnB6BXCikEIChbUc4y1cQ+CHhxag5iL0oj
         HNdyWVwRfVyrT84wyvL23Jh0ktsjL/5q1jmxcR/nViaCEqnU9zmrEt0dglt2tM+5gryp
         LwpBaLO67QbRI10bW8FrLEuoxMgezUftKIQ/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gsEhF633aruy2p61oRaOfmrToW7aol4bEFgaOokGFsY=;
        b=jXR1G/EUKV0pE4Z7kIap32WLqVpnG5LcQtYv4HrbZMDfUF9m+Y8wxgI+SbTBIM9+I4
         PbvmqWcqfwUP0fd0nHjl3ZybZRz8Q0teHlQSFyydxCk7vq9mAZ+q/9nf2pxlMQU/B4mC
         xlB5iaHrHOiEmtfjZctoYgi+djcR98fiVgkxde95WYn8OqZYlkdPS6oHRCD9LlnGH+ek
         WkUEyaSDx3aXnALqj4BzJV9QhGQw+UNbR/t3sJ759qR2leSrt4v8Dr87/ekUodOUitPK
         fcEg9wInPBR/Pbe2WG7hQ+kx/+yskFjD422avrRtYakURyzUr6BnVXKCKMxIIQ2pWVJu
         E8FQ==
X-Gm-Message-State: AIkVDXLdzaHOgMKY6ghemy4t+zv4ivFmHR6xbSCCOcqZAOhp9XmnwTSOdDtQDHZmckwfPki8H2YxjSxhEIyyYWgW4wo=
X-Received: by 10.31.75.67 with SMTP id y64mr3015960vka.51.1486035081919; Thu,
 02 Feb 2017 03:31:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Thu, 2 Feb 2017 03:31:01 -0800 (PST)
In-Reply-To: <87bmuk4zyb.fsf@linaro.org>
References: <CAFEAcA9j47hSCHyYh5TzNh5P-V3_ddcmA=XMcini+d8PnqruZA@mail.gmail.com>
 <87bmuk4zyb.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2017 11:31:01 +0000
Message-ID: <CAFEAcA_vxpT+rErpPBmyst+g71KassD-N2755yyY8TvW6S2Y=g@mail.gmail.com>
Subject: Re: [PATCH v8 23/25] target-arm: introduce ARM_CP_EXIT_PC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Claudio Fontana <claudio.fontana@huawei.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QK0x035CNtyF

On 2 February 2017 at 11:03, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> Does single-stepping (of the emulated architectural
>> debug step, and gdbstub singlestep) work across one of
>> these instructions?
>
> I'll have to test but I don't see why not. The instruction is fully
> executed we just ensure we have exited the run loop to process the flush
> before we get to the next instruction/

The reason I ask is that the single-stepping code path involves
doing some work at the tail end of the translate:

    if (unlikely(cs->singlestep_enabled || dc->ss_active)
        && dc->is_jmp !=3D DISAS_EXC) {
        /* do some stuff */
    }

The other things that jump out of the normal code flow are:
 * exceptions (where we don't want to do finished-the-step
   work anyway as the insn hasn't executed)
 * SWI (hopefully we single step SWI right but maybe not)
 * YIELD, WFE (which are special cased so that they do the
   actual work only at the end of the gen_intermediate_code
   function and only if not single-stepping, so they're
   no-ops on singlestep)

You've introduced a new item to this list which isn't
handled by the singlestep code.

>> This is probably a question answered in the rest of the series,
>> but why do we need the helper to be able to longjump out to the
>> top level? Can't we just have the helper do its work and then
>> end the TB with tcg_gen_exit_tb(0) so we return to the top level
>> loop in the normal way?
>
> Well I guess this is a philosophical question. The cputlb API is
> offering the guarantee that when an *_all_cpus_synced() flush is done
> everything will be complete with respect to all vCPUS. This is reliant
> on the source vCPU executing an exclusive safe work which ensures all
> other vCPUs have halted and therefor will have run their safe work
> before returning to execution.
>
> If ARM wanted to it could call the *_all_cpus() variant, schedule its
> own exclusive safe work (a null function - as cputlb will have scheduled
> the flush) and exit the TB in the usual way. In fact this is the
> mechanism ARM could use if it wanted to defer the sync point to a later
> DMB instruction.
>
> I haven't implemented it yet as the flush stuff only comes up high in
> the perf runs with my aggressive TLB flush microbenchmarks.
>
> However I'm wary of having a _synched() variant which will only work
> correctly if the guest also does a bunch of other steps.

Well, with the implementation as it is you need to do a bunch
of extra steps to handle all the corner cases (condexec,
single stepping) that would be handled for you if you exited
the TB in the normal way rather than longjumping out of it...
IME longjumping out should be reserved for "we don't want to
continue executing whatever other generated code we have after
this" situations. Here we know definitely what we're going to
want to do, so it would be better to generate code that
arranged to leave the TB in the usual way.

>>>      default:
>>>          break;
>>>      }
>>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>>> index 444a24c2b6..7bd18cd25d 100644
>>> --- a/target/arm/translate.c
>>> +++ b/target/arm/translate.c
>>> @@ -7508,6 +7508,10 @@ static int disas_coproc_insn(DisasContext *s, ui=
nt32_t insn)
>>>              gen_set_pc_im(s, s->pc);
>>>              s->is_jmp =3D DISAS_WFI;
>>>              return 0;
>>> +        case ARM_CP_EXIT_PC:
>>> +            /* The helper may exit the cpu_loop so ensure PC is correc=
t */
>>> +            gen_set_pc_im(s, s->pc);
>>> +            break;
>>
>> Do we also need to gen_set_condexec() ?
>
> Do we? This isn't an exception so we don't need to resolve the condition
> flags as long as there is enough information preserved so the next TB
> can resolve if it needs to.

Your longjump is effectively skipping the normal "end of the TB" code,
which is what usually does the set_condexec for you. At the end of a
TB the expectation is that everything's been sync'd back to the CPU
state structure.

thanks
-- PMM
