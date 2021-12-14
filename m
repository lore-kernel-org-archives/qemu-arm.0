Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5012326lfk;
        Tue, 14 Dec 2021 00:23:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0kIyaAJN5CnkXM3FKNQQ1A9UaVLl1QAdeFNGPN3Dk69udLKI+tyqwII2y3wvgAun7Yl6B
X-Received: by 2002:a25:2e49:: with SMTP id b9mr4454774ybn.414.1639470193841;
        Tue, 14 Dec 2021 00:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639470193; cv=none;
        d=google.com; s=arc-20160816;
        b=vMG35uwk6vHRS42x8kInTkF7MjcAsS8pCvqhyFRzRT1ERXJClkpL7U3yD8wqi081Eo
         +Os1Zuw6NvUQvj0rTBSjU2BwOLHzZ6xDvfagOBZP3Vzr6x2Wr6ks2ZFArkHJV2hHfQm8
         gbSUP1MDz6Oh7SNINPcdAEHntCTXGeywfirPmO8no4uPgYZtDRwx2ySCt1mo1I2Qc2OQ
         vToZlUa0MVaO/BXjNnzMLDZw4O5NfRUik+MRLA271MMkrz146aO6ATyNa0wTFRk5qrFV
         z6ZFeZYdbMYE8ouB4gi+vKXqERCO3YmlDwR6nfvAdfr4X2jYy2FidCtCKECGTTZFcZF3
         MAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=QyORSJBrasxdRmflN3ygIR3SfdYerg2RhsKLSFecMJM=;
        b=JuPlEZH7WNyH198cCtR5p+vAlecsdpOCMDsyob8+/7ZfN1Ffi/U6kMU+VbhGEyurjS
         +AQO5yEFYBYvuqB8RcrCaHsYCsxLsTPdipSiGuxf9hz9tiCqFpQJkC+8YWQEGB88kqjm
         ctaLXZ1N9jtA6nE/hcS66C6+vBmn2irMZ9hznmzVSk6HHblcRdwfZxnFOBerLFDhOxne
         PG/jR3d22pcJcx+0YUmD99u4D0MXZYnptEemg2uQbO7rmNjjFKaqcYQNrE4W6umD0KIv
         Ffa8e98W6igtiOVpem+hA4dam1TZArj0/x9TzlU3IjR1wYoZFq1j/q7WinFiosvhnsAc
         xYPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Qxxhv+1y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k193si18222917ybk.450.2021.12.14.00.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Dec 2021 00:23:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Qxxhv+1y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Received: from localhost ([::1]:52490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mx35d-0003Cu-5x
	for alex.bennee@linaro.org; Tue, 14 Dec 2021 03:23:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mx2zd-00046L-E7; Tue, 14 Dec 2021 03:17:01 -0500
Received: from mout.gmx.net ([212.227.15.18]:43457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mx2zb-00020m-0g; Tue, 14 Dec 2021 03:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639469812;
 bh=PJPnq36oi3KVB68BG1DJDJd75GxB+lso/SROvT1dtlc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Qxxhv+1ybBa8g1A6uoIYzEoSr44mueyQayDjoK+nipIjm6L8/ESMoxLlHV8Ghu5IN
 w96QG+g06pzj0qSu3kCh0hcRJhYbq801i/uJKAtgAUF8TEEdIKrsndqaSNXFJ5PJzb
 AUJYqbSW6kDThclYfrGYS/v1iqC13HK9OE4nQfu0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1My32L-1mapuH3znb-00zZxp; Tue, 14
 Dec 2021 09:16:52 +0100
Message-ID: <2281a255-fef3-c872-963e-2c5274d0d815@gmx.com>
Date: Tue, 14 Dec 2021 16:16:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Libvirt on little.BIG ARM systems unable to start guest if no
 cpuset is provided
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Peter Maydell <peter.maydell@linaro.org>
References: <70a2f7d6-5ac1-72df-4a88-b1a662d07070@gmx.com>
 <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
 <1dc0403b-c61b-b04b-e7fd-f2d66276ba7b@gmx.com>
 <CAFEAcA-URrpy3w3AtDb8zVfq8fWxvQ8_jtSqEkaeb=3KE99oAQ@mail.gmail.com>
 <87lf0ojvq2.wl-maz@kernel.org> <aa407ba2-e9c4-882e-a085-91e7dd724f78@gmx.com>
 <29409a18-5156-6b3a-6a44-eecd83a20a78@redhat.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
In-Reply-To: <29409a18-5156-6b3a-6a44-eecd83a20a78@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eFTfrvI7Z+XdGY7CO3Elva0VtFsBBntjBNyjhsQGbxnC4jfpH3l
 l6OR/JZGfjPgQhQZjsEo44+OydGIWZ9EIQFHXd+W07YzE58KiNUVsgIOQfVGLLL4oZahXun
 t6JrMJHnT25kVWtf58GTK2wZnZQm0P4FE74pAu5NI9Z7L7di+k1Wzk2Pe27HvAnFXsfV4QN
 vCtdI+pXaFErXa8jkzSxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BEWE20Pr8iw=:2nVdIt+XmljzaTJtvENL3A
 qu0zpx6DLIvTB+r/tmj2ZdsHq5zDXajz94ngqQqSkxBeXtlzuWaB+mlw7FcmIqJ4v4rDboYjd
 U/npcd/JbmuuJ4WI073qSIvljPWWbX9LhAWlS0gm/rXJS7ri/wws0gDZLxHMFRzS6NsOMXnGm
 YBGoV9yhLhaMfcoG2gCbrfm3W6DzRb/6+awPjam+E1ubFwVkC+eWeSllKCkdh78WtdYDQmEZE
 0tkwdTHKZiDtdUVsgi+N15xwaDK02MTijKhqNk0+tlLu+MLd7CJSy8Ta5PvuBiE/6gPh/WRHC
 JjiFCLGxjRSnui+CFUZJiEgaGRwfGzCXIk0QjHeeke4z6DJr8Sym5DNiWm7fzBOT7qadfBd+M
 65P9PLsCsTARxFdOohz7I97psKep1Cl/N9sukpYHL2P7up79myftV0G4AnjfL14a4RjP9b6iO
 sgd9v9DrvnWCSNQN9Oh7A/em8bsyyO5o9O6ljghJfx6B1m9HrN71uTbc+/OTwkuWWEq5DggsZ
 mmf4/7aEO5PTu+uHCI5Q5N9S9PedqJ3E4iyFAAfMcrLbA4P9R5q7ozAuKk74+Q5M7Dv+hDBzY
 i1Dw4gj/Tm55g9xOqlz1AubIDa3DfIvLPuTRxw9fbbHZ+c0a0VTwNPrnFWryvsMsuDNMg5DHS
 A+RNL6YE7p0wgLhOo0k+y5Z+Odf5CyqtbHKtWsJAjOErX3+GlxpUtMQqdVr18HtESoDN3rPT6
 InZ2Nn/isIq38nYrd13cbu4S4VusPPUIiGXl6+kipQlIjmsa2if1K9Aaijc/PRIo69w4+kdTo
 NVzr5eok/UfpKzcSUe460MRIBnqDvVt083jklY5JMIBok9A7zC9ir8/c0dE1BjuzjjPIRrR++
 iJCC2dEOXApl3+oEAv/tup5wtkaO7pluJ7M3diHqV+M21nyfoW+PTsL22n3sgqt2hOw8xV242
 W6u5Numk1jCKvPL8OybWcnKjonE6iqVyldwJxTX2EPb8sgnLwJVkbk+YUt0A1clZvgqrxtSTu
 41hI0h/MVhIQL8v71sUrW5e24U23cl0SGc7iyzPgP4HphrF1tftIHw8zUik50KxPGZGPU8TjC
 vjkoxGs9Crcxnk=
Received-SPF: pass client-ip=212.227.15.18;
 envelope-from=quwenruo.btrfs@gmx.com; helo=mout.gmx.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: libvirt-users@redhat.com, qemu-arm@nongnu.org,
 kvmarm <kvmarm@lists.cs.columbia.edu>, qemu-discuss@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vql4GjtjsCSn



On 2021/12/14 15:53, Michal Pr=C3=ADvozn=C3=ADk wrote:
> On 12/14/21 01:41, Qu Wenruo wrote:
>>
>>
>> On 2021/12/14 00:49, Marc Zyngier wrote:
>>> On Mon, 13 Dec 2021 16:06:14 +0000,
>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>
>>>> KVM on big.little setups is a kernel-level question really; I've
>>>> cc'd the kvmarm list.
>>>
>>> Thanks Peter for throwing us under the big-little bus! ;-)
>>>
>>>>
>>>> On Mon, 13 Dec 2021 at 15:02, Qu Wenruo <quwenruo.btrfs@gmx.com> wrot=
e:
>>>>>
>>>>>
>>>>>
>>>>> On 2021/12/13 21:17, Michal Pr=C3=ADvozn=C3=ADk wrote:
>>>>>> On 12/11/21 02:58, Qu Wenruo wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Recently I got my libvirt setup on both RK3399 (RockPro64) and RPI
>>>>>>> CM4,
>>>>>>> with upstream kernels.
>>>>>>>
>>>>>>> For RPI CM4 its mostly smooth sail, but on RK3399 due to its
>>>>>>> little.BIG
>>>>>>> setup (core 0-3 are 4x A55 cores, and core 4-5 are 2x A72 cores), =
it
>>>>>>> brings quite some troubles for VMs.
>>>>>>>
>>>>>>> In short, without proper cpuset to bind the VM to either all A72
>>>>>>> cores
>>>>>>> or all A55 cores, the VM will mostly fail to boot.
>>>
>>> s/A55/A53/. There were thankfully no A72+A55 ever produced (just the
>>> though of it makes me sick).
>>>
>>>>>>>
>>>>>>> Currently the working xml is:
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0 <vcpu placement=3D'static' cpuset=3D'4-5'>2</v=
cpu>
>>>>>>>  =C2=A0=C2=A0=C2=A0 <cpu mode=3D'host-passthrough' check=3D'none'/=
>
>>>>>>>
>>>>>>> But even with vcpupin, pinning each vcpu to each physical core, VM
>>>>>>> will
>>>>>>> mostly fail to start up due to vcpu initialization failed with
>>>>>>> -EINVAL.
>>>
>>> Disclaimer: I know nothing about libvirt (and no, I don't want to
>>> know! ;-).
>>>
>>> However, for things to be reliable, you need to taskset the whole QEMU
>>> process to the CPU type you intend to use.
>>
>> Yep, that's what I'm doing.
>>
>>> That's because, AFAICT,
>>> QEMU will snapshot the system registers outside of the vcpu threads,
>>> and attempt to use the result to configure the actual vcpu threads. If
>>> they happen to run on different CPU types, the sysregs will differ in
>>> incompatible ways and an error will be returned. This may or may not
>>> be a bug, I don't know (I see it as a feature).
>>
>> Then this brings another question.
>>
>> If we can pin each vCPU to each physical core (both little and big),
>> then as long as the registers are per-vCPU based, it should be able to
>> pass both big and little cores to the VM.
>>
>> Yeah, I totally understand this screw up the scheduling, but that's at
>> least what (some insane) users want (just like me).
>>
>>>
>>> If you are annoyed with this behaviour, you can always use a different
>>> VMM that won't care about such difference (crosvm or kvmtool, to name
>>> a few).
>>
>> Sounds pretty interesting, a new world but without libvirt...
>>
>>> However, the guest will be able to observe the migration from
>>> one cpu type to another. This may or may not affect your guest's
>>> behaviour.
>>
>> Not sure if it's possible to pin each vCPU thread to each core, but let
>> me try.
>>
>
> Sure it is, for instance:
>
> <cputune>
>      <vcpupin vcpu=3D"0" cpuset=3D"1-4,^2"/>
>      <vcpupin vcpu=3D"1" cpuset=3D"0,1"/>
>      <vcpupin vcpu=3D"2" cpuset=3D"2,3"/>
>      <vcpupin vcpu=3D"3" cpuset=3D"0,4"/>
>      <emulatorpin cpuset=3D"1-3"/>
>      <iothreadpin iothread=3D"1" cpuset=3D"5,6"/>
>      <iothreadpin iothread=3D"2" cpuset=3D"7,8"/>
> </cputune>

That's what I have already tried before.
I pinned vcpu 0-6 to physical core 0-6, and still no reliable boot up.

And that's why I'm asking here.

Thanks,
Qu

>
> pins vCPU#0 onto host CPUs 1-4, excluding 2; vCPU#1 onto host CPUs 0-1
> and so on. You can also pin emulator (QEMU) and its iothreads. It's
> documented here:
>
> https://libvirt.org/formatdomain.html#cpu-tuning
>
> Michal
>
