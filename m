Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5092173lfk;
        Tue, 14 Dec 2021 02:22:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3w3ro7+mvBejCkedltHR9ez2A4A6guN2SpTwI50LyR48ja2lVDEs97/wj+MGImx1ZzHwO
X-Received: by 2002:a05:6902:1247:: with SMTP id t7mr5328252ybu.668.1639477333776;
        Tue, 14 Dec 2021 02:22:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639477333; cv=none;
        d=google.com; s=arc-20160816;
        b=qHrxd0XYU5+2atC1MQZHVOoZPDW5SmFXzevIVBKzfYa7QpSU8Cxafp03QD0k5CqrmF
         tGkn4+oiHAk/+bLue0exkx4FI3B139DUzjfT+QuI9LIqpfN2zTAGRmbJCyF0TMvlxOPc
         g+5ZKBEFX5kU4A/lrz2OlknRtob2tD8L0xQ+Tk6rRIDgQssshuo5X5hHX5Ue7O+xjHTB
         nKfdO90SHyXe3bDAgLjjhxT5It/n5G18vM0TP9OJb+l/2GSvUAqhuzcx6weDy5xSNx9e
         or2c/34wgs1EKJjsNxHef2NFeTpR/pTCLJZQQnWjJOkiuYVaA8t00GYNInE5tHxZaJr3
         3Drw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:from:references:to:content-language:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=isEE5BL43hkwdJln1GtiwiFld7Zg1slUTBE7FK7pdTo=;
        b=d2eAItiiTw854TaumTMp+zv5CDxnkVza/o/fohtFBkhRoZ3mFjEXCv237ZG/1xi9Mh
         P1Bp2/Es66HuTwne6KQTP/23Eu70hKjQ9NJ98e+8fhrFCNX6kNZgUEWWMpKNFrzPbrBf
         Uze4SNBm24HbGthF+7TPN6s27p0+WUdD/ELIu7aidhkQF9QJsUP4f75tPZqN1QHSuf/e
         qEWdPDVTTlK+4bmAPXvU3G8dwn/dmPd53pQS1cy+nIvAE47bYfA7ZszXSOZly+rkmPfL
         rXYF8X/6L/N5m9Q7eb+O2WBai+0wCEZBNiUPt41vP6TpY5x5lU2MPddgcAJf+PkX2KMx
         Pcwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmx.net header.s=badeba3b8450 header.b=Ujik4Awk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si20459840ybb.827.2021.12.14.02.22.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Dec 2021 02:22:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmx.net header.s=badeba3b8450 header.b=Ujik4Awk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Received: from localhost ([::1]:41232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mx4wn-0008CW-5L
	for alex.bennee@linaro.org; Tue, 14 Dec 2021 05:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mx4wY-0008As-Ie; Tue, 14 Dec 2021 05:21:58 -0500
Received: from mout.gmx.net ([212.227.17.22]:54487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mx4wU-0001xd-LF; Tue, 14 Dec 2021 05:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639477306;
 bh=NYq4bmHCGhprM7/N+mmAj3wKqXzhjkD/CUMmv8ySpns=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=Ujik4AwkUYn3QU0RhdSSKwAKcAByO4f0x1DS5uvk66wgvmyNRO5nr2Rotk1uSK0ZN
 6UPx1LsllG9j8CiwTCKpROLYkL6/FcpI3IRYj8cJW87EtMX/HfK+fhrF0yaiurYP8F
 bnc4SsnbLROgii/Qv/6Ih4CB7aWsnTTEa9HSJYmU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MHXBp-1mk6Uy39Xd-00DbTM; Tue, 14
 Dec 2021 11:21:46 +0100
Message-ID: <242ff064-ba82-a045-a407-eaf9dbe5bb40@gmx.com>
Date: Tue, 14 Dec 2021 18:21:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
References: <70a2f7d6-5ac1-72df-4a88-b1a662d07070@gmx.com>
 <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
 <1dc0403b-c61b-b04b-e7fd-f2d66276ba7b@gmx.com>
 <CAFEAcA-URrpy3w3AtDb8zVfq8fWxvQ8_jtSqEkaeb=3KE99oAQ@mail.gmail.com>
 <87lf0ojvq2.wl-maz@kernel.org> <aa407ba2-e9c4-882e-a085-91e7dd724f78@gmx.com>
 <29409a18-5156-6b3a-6a44-eecd83a20a78@redhat.com>
 <2281a255-fef3-c872-963e-2c5274d0d815@gmx.com> <87ee6fjyyh.wl-maz@kernel.org>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: Libvirt on little.BIG ARM systems unable to start guest if no
 cpuset is provided
In-Reply-To: <87ee6fjyyh.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JqYwaNg7wHc9rXIm8WHDHGj83HDfltjIsn2laP/F/rZFMIuIvGC
 hNLefZlzysaHxFmfzLIIVLcXnSqj5MpBJrw9O49XhxkIgUTHWhGQ8tXHVFm5bxXVBKR6Ot0
 BcwUm2eC2hS85qyyOzNXHL4Q1UTBlhHpAfJSBKOIFTIm4gI2qgeOLBkwGyQ/vQPgrMNJTf4
 YS2aFPHSxfsHSMRXE2IeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:etQc8zhf+I0=:48T23MizxsjVL9QKwn+Cdv
 +Q/GBU8+vcql+OCZSlM6qjs/RLRbMKsYRW3L4fRB+gBpTIYCfiEffvsJHBb01Y3YzQfmiH29X
 F3AKwoZ/YZKC2ZmHN7V7ONfrQY3FfzNAm2pjrkWd30YUW2p2IKPSnehc4lfqxKP5JfD+zsdSv
 wrIShvcIaCIMaVifqjIICSt6M/Jhk96YWsBUFywXIOj0S9L0fZd9P+rh19HTziteV+bNsp/pw
 oRI2yK0toJ1aaTLXS6DQSu9IN5iYoL33cquipLFFPZr8WiMbzUQfog4QUerWCexJn9hd5ZqGV
 8SqUW8FuvemvOqqE0a3/b00gzp7kZZ2iGMeogb7wSfQzsA14zf++x4+Ru25Ek9UUcGsCLciAH
 yCE7yX4H4aVkm588+ZUycduF3FKrF8m5XSQIJmGh7bSKFWfCEO4FEe0bv0ez5hoH0LG7RDoZP
 ZO0hXCwkiFxXUkElYFX2jXYuTxicVuftxcfH5e4q6AZnEtvkmPHXgl9Xv1RZV46Ksla43nE9V
 mhWT29vePVpmDmjb4TRBk+DczWOTfHmki0PsvPAYfYiwyC0uxupkUnLwjvk6dPhzqMp/016gV
 VY7Wre/ElHGX9mbI1IL6EpSHya4XkJljr3fQiEZfun+rZQATCE7/v6ahvAdJGGVRpHDI2/n5N
 uKNQZ0TbKioH82qPZxpEb62/jPXX1Gt+3H7m8ydUak4cFG1fdPO8zvR91FFsJNsSAx409bxOH
 Gt8b89L9eWfIhbGp4qjzDhsqrog26571uX15995haKFjJUWvhWFvu6LxrjDV+A/L/k/kgYjPs
 pXRL/Tw8ulpv7iCZ4QZw94G4Q5C04gWeZX6rHuNi01ylquJ7OaMEbPIG1s7EmLxzrZ+WXOJh/
 KFGid8MUxeyblYmuXfX+MU6dZZg9AKIvGuDQa8BEfVJVhObn+w3+fi5xAhly1U1mChAKNKWFX
 E4VvrLgyL3gGEQF2jzqHq3u/wkj51844ulGJOkI40ETGPCyKIPQTB/7W1jjqax7IRfWtM0y+g
 kDgD4OmMpWXEJjJMZ+SAWsT5yUN5NC0tqoTcuvuFEb4l596r5KyyJFZELo3lG2n3TXjIa9aBr
 QApuVQBL0EL5a8=
Received-SPF: pass client-ip=212.227.17.22;
 envelope-from=quwenruo.btrfs@gmx.com; helo=mout.gmx.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.962,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-discuss@nongnu.org, libvirt-users@redhat.com, qemu-arm@nongnu.org,
 kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0NGBFFaYnzVs



On 2021/12/14 17:52, Marc Zyngier wrote:
> On Tue, 14 Dec 2021 08:16:40 +0000,
> Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>>
>>
>>
>> On 2021/12/14 15:53, Michal Pr=C3=ADvozn=C3=ADk wrote:
>>> On 12/14/21 01:41, Qu Wenruo wrote:
>>>>
>>>>
>>>> On 2021/12/14 00:49, Marc Zyngier wrote:
>>>>> On Mon, 13 Dec 2021 16:06:14 +0000,
>>>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>>>
>>>>>> KVM on big.little setups is a kernel-level question really; I've
>>>>>> cc'd the kvmarm list.
>>>>>
>>>>> Thanks Peter for throwing us under the big-little bus! ;-)
>>>>>
>>>>>>
>>>>>> On Mon, 13 Dec 2021 at 15:02, Qu Wenruo <quwenruo.btrfs@gmx.com> wr=
ote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 2021/12/13 21:17, Michal Pr=C3=ADvozn=C3=ADk wrote:
>>>>>>>> On 12/11/21 02:58, Qu Wenruo wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> Recently I got my libvirt setup on both RK3399 (RockPro64) and R=
PI
>>>>>>>>> CM4,
>>>>>>>>> with upstream kernels.
>>>>>>>>>
>>>>>>>>> For RPI CM4 its mostly smooth sail, but on RK3399 due to its
>>>>>>>>> little.BIG
>>>>>>>>> setup (core 0-3 are 4x A55 cores, and core 4-5 are 2x A72 cores)=
, it
>>>>>>>>> brings quite some troubles for VMs.
>>>>>>>>>
>>>>>>>>> In short, without proper cpuset to bind the VM to either all A72
>>>>>>>>> cores
>>>>>>>>> or all A55 cores, the VM will mostly fail to boot.
>>>>>
>>>>> s/A55/A53/. There were thankfully no A72+A55 ever produced (just the
>>>>> though of it makes me sick).
>>>>>
>>>>>>>>>
>>>>>>>>> Currently the working xml is:
>>>>>>>>>
>>>>>>>>>   =C2=A0=C2=A0=C2=A0 <vcpu placement=3D'static' cpuset=3D'4-5'>2=
</vcpu>
>>>>>>>>>   =C2=A0=C2=A0=C2=A0 <cpu mode=3D'host-passthrough' check=3D'non=
e'/>
>>>>>>>>>
>>>>>>>>> But even with vcpupin, pinning each vcpu to each physical core, =
VM
>>>>>>>>> will
>>>>>>>>> mostly fail to start up due to vcpu initialization failed with
>>>>>>>>> -EINVAL.
>>>>>
>>>>> Disclaimer: I know nothing about libvirt (and no, I don't want to
>>>>> know! ;-).
>>>>>
>>>>> However, for things to be reliable, you need to taskset the whole QE=
MU
>>>>> process to the CPU type you intend to use.
>>>>
>>>> Yep, that's what I'm doing.
>>>>
>>>>> That's because, AFAICT,
>>>>> QEMU will snapshot the system registers outside of the vcpu threads,
>>>>> and attempt to use the result to configure the actual vcpu threads. =
If
>>>>> they happen to run on different CPU types, the sysregs will differ i=
n
>>>>> incompatible ways and an error will be returned. This may or may not
>>>>> be a bug, I don't know (I see it as a feature).
>>>>
>>>> Then this brings another question.
>>>>
>>>> If we can pin each vCPU to each physical core (both little and big),
>>>> then as long as the registers are per-vCPU based, it should be able t=
o
>>>> pass both big and little cores to the VM.
>>>>
>>>> Yeah, I totally understand this screw up the scheduling, but that's a=
t
>>>> least what (some insane) users want (just like me).
>>>>
>>>>>
>>>>> If you are annoyed with this behaviour, you can always use a differe=
nt
>>>>> VMM that won't care about such difference (crosvm or kvmtool, to nam=
e
>>>>> a few).
>>>>
>>>> Sounds pretty interesting, a new world but without libvirt...
>>>>
>>>>> However, the guest will be able to observe the migration from
>>>>> one cpu type to another. This may or may not affect your guest's
>>>>> behaviour.
>>>>
>>>> Not sure if it's possible to pin each vCPU thread to each core, but l=
et
>>>> me try.
>>>>
>>>
>>> Sure it is, for instance:
>>>
>>> <cputune>
>>>       <vcpupin vcpu=3D"0" cpuset=3D"1-4,^2"/>
>>>       <vcpupin vcpu=3D"1" cpuset=3D"0,1"/>
>>>       <vcpupin vcpu=3D"2" cpuset=3D"2,3"/>
>>>       <vcpupin vcpu=3D"3" cpuset=3D"0,4"/>
>>>       <emulatorpin cpuset=3D"1-3"/>
>>>       <iothreadpin iothread=3D"1" cpuset=3D"5,6"/>
>>>       <iothreadpin iothread=3D"2" cpuset=3D"7,8"/>
>>> </cputune>
>>
>> That's what I have already tried before.
>> I pinned vcpu 0-6 to physical core 0-6, and still no reliable boot up.
>>
>> And that's why I'm asking here.
>
> You are still missing the point of how QEMU works:
>
> - QEMU creates a dummy VM with a single vcpu. This can happen on *any*
>    CPU.

This is the main point that I missed.

Thanks very much for point this out.

> - It snapshots the sysregs for this vcpu, and keep them for later
> - It then destroy this VM
> - QEMU then creates the full VM, with all the vcpus
> - Each vcpu gets initialised with the state saved earlier. If any vcpu
>    is initialised on a physical CPU of a different type from the one
>    that has been used for the dummy VM, you lose, as we cannot restore
>    some of the registers such as MIDR_EL1 (and other registers that KVM
>    considers as invariant).
>
> To fix this, you need to change QEMU's notion of a template VM, or
> change KVM's notion of invariant registers. The former is quite hard,
> and the later breaks a ton of things for guests, such as errata
> workarounds.

> The best workaround is to taskset the QEMU process (and I really mean
> the process, not individual threads) to an homogeneous set of CPUs and
> be done with it.

Yeah, that's why the cpuset way is working, as it seems also limiting
the initial "temporary" VM creating to specified CPUs.

Just curious, is there some defined common VM related registers that can
be restore on all cores? (At least for A53 + A72 case).

If completely no, then virtualization is really not even targeted for
BIG.little designs I guess.

Thanks,
Qu

>
> 	M.
>
