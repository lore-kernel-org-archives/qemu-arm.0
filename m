Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f15sm9092610wmg.30.2021.11.05.09.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 09:16:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CF11F1FF96;
	Fri,  5 Nov 2021 16:15:56 +0000 (GMT)
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
 <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
 <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
 <1b2ee804-6360-c77f-45f2-8fe39e39f9d9@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Luis Machado <luis.machado@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Claudio Fontana
 <cfontana@suse.de>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
Date: Fri, 05 Nov 2021 16:15:39 +0000
In-reply-to: <1b2ee804-6360-c77f-45f2-8fe39e39f9d9@linaro.org>
Message-ID: <87v916h937.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vP1kcWdZkxTQ


Luis Machado <luis.machado@linaro.org> writes:

> On 11/4/21 6:03 PM, Luis Machado wrote:
>> On 10/4/21 3:44 PM, Luis Machado wrote:
>>> Hi,
>>>
>>> On 9/21/21 10:55 AM, Peter Maydell wrote:
>>>> On Tue, 19 Jan 2021 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> wrote:
>>>>>
>>>>>
>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>
>>>>>> On 1/19/21 3:50 PM, Alex Benn=C3=A9e wrote:
>>>>>>>
>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>> qemu-system-aarch64: -gdb
>>>>>>>> unix:path=3D/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server:
>>>>>>>> info: QEMU waiting for connection on:
>>>>>>>> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,serv=
er
>>>>>>>> warning: while parsing target description (at line 47): Vector
>>>>>>>> "svevhf" references undefined type "ieee_half"
>>>>>>>> warning: Could not load XML target description; ignoring
>>>>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>>>>
>>>>>>>> Seems to indicate it is "ieee_half" -related?
>>>>
>>>>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>>>>> and there is no probing possible during the gdbstub connection. I gue=
ss
>>>>> I can either go back to stubbing it out (which would break gdb's SVE
>>>>> understanding) or up our minimum GDB version check for running tests.
>>>>> That would mean less people test GDB (or at least until the distros
>>>>> catch up) but considering it was zero people not too long ago maybe
>>>>> that's acceptable?
>>>>
>>>> I just ran into this trying to connect qemu-aarch64 to the
>>>> Ubuntu gdb-multiarch. I don't care about SVE at all in this
>>>> case, but the 'max' CPU includes SVE by default, so we report
>>>> it to gdb even if the guest program being run doesn't use SVE at all.
>>>> This effectively means that usecases that used to work no longer do :-(
>>>>
>>>> Luis: do we really have to report to gdb all the possible
>>>> data types that might be in SVE vector registers? Won't
>>>> gdb autogenerate pseudoregisters the way it does with
>>>> Neon d0..d31 ?
>>>>
>>>> thanks
>>>> -- PMM
>>>>
>>>
>>> I'll check what can be done here.
>> Apologies. I got sidetracked with a few other things. I'm getting
>> back to this one.
>> I'm guessing the less painful solution would be for QEMU to report a
>> more compact XML description for SVE, supported by the oldest GDB we
>> would like to validate things on, and leave it to GDB (newer
>> releases) to add whatever pseudo-registers it deems appropriate.
>
> Is it only the ieee_half type that is causing issues here? Or are
> there other types?

That was the only one I noticed - which makes sense as it's a fairly new
type.


--=20
Alex Benn=C3=A9e
