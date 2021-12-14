Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5118439lfk;
        Tue, 14 Dec 2021 03:00:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcgPpbHsI2mXtITvTyfSZ1hPBq2WEFk+zVG29kTYfr+Vw5oMO+H55KwlqTGntA4XhHA2p/
X-Received: by 2002:ad4:5762:: with SMTP id r2mr4483822qvx.31.1639479602333;
        Tue, 14 Dec 2021 03:00:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639479602; cv=none;
        d=google.com; s=arc-20160816;
        b=dtnqBbcVLr+XYk8kWIVHMM4R5m5WULmi2bt4qePiXrr29Dtvd8li3hvESo/upKLomq
         4Iq8JZ3vvgOtMIs/ZQrC5VPYme/BVWRxYV10PZ2U4q7LK/hLW7devQhDRw1NIVvFf2wO
         l2zg5x+vxYlJmhdfFw2Ov5k4XMBEtYdFQKlQ3DG4qz7/E84a42rlFbEieMfTdFhMl8Ob
         o81P2W9X1D9Yabwu8MHggaO5dXig/Tob8C6G0jhgYLpj/e2yKwiwAuN/cfttNQWltUSa
         e8dxitMzi1pfSPkEWRfBO1om3wKGNlfutBslU0e7AfGrENaBNDJ5LSxpnop7L5WOcZv1
         fp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:from:references:to:content-language:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/z7seeFognh42YKJ6nWFiF1ekN9CkxIREAKhaDqp+ME=;
        b=yHPaQa60TpwVEcFsk/y1rhBqc0k9VaAywc1B7cG7qhTI/NmC5spR3KzOuErTeKFGmD
         kyoY6W90WNUtNRYKuN1kblp2LbOkwJxNn+5qVGHTH+NCVJprPROmpRKi//gC1b920ckd
         mDZSp9p1O+IiFBOxZwoQmd3C5hIAqmA6Q3WaaoH6zc/PV1QHZ4Y6UD7aWQPCoPIpDf2q
         /TKDlhjKIh5yHfTPAjFtCnk8dslEvd2d2h1hoM6HUdrmKDGcPPHkb3+vIqRvseY8bDmW
         Rm7GoSaOlOzlvdTXktKY9C2D3bMlg4bIeXZKDlxPfLcCV4UJ6yhcMiidup9ukOW7INSB
         hz+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=FaPS0gUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si14722736qvr.444.2021.12.14.03.00.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Dec 2021 03:00:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=FaPS0gUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mx5XN-0001iN-NY
	for alex.bennee@linaro.org; Tue, 14 Dec 2021 06:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mx5X3-0001fy-Mj; Tue, 14 Dec 2021 05:59:41 -0500
Received: from mout.gmx.net ([212.227.15.15]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mx5Wz-0006Nk-9N; Tue, 14 Dec 2021 05:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639479560;
 bh=smJHWvygk0id6MvmjwCB/eL3oP+0G+fWcwQ3N+ju92c=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=FaPS0gUPgkHpTpEaWyOtsLoVcGsoHMHys4e/nQvoFEPR61mZb/CWt2U+B6E85MW28
 9OdBIw1lAqA6lBDhUOqECgFcnuDr2phpvHUshAdCSXPyOc6I/wsvoKeinpSuIQ2DxA
 eqY7jidCn5OCQQdGx6SKR7KzprbFLdTUuqZLozLU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M5fMe-1mr0zK04CY-007CUj; Tue, 14
 Dec 2021 11:59:20 +0100
Message-ID: <8693375e-6f29-16f4-4fa4-2fd79a00ebd0@gmx.com>
Date: Tue, 14 Dec 2021 18:59:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Marc Zyngier <maz@kernel.org>
References: <70a2f7d6-5ac1-72df-4a88-b1a662d07070@gmx.com>
 <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
 <1dc0403b-c61b-b04b-e7fd-f2d66276ba7b@gmx.com>
 <CAFEAcA-URrpy3w3AtDb8zVfq8fWxvQ8_jtSqEkaeb=3KE99oAQ@mail.gmail.com>
 <87lf0ojvq2.wl-maz@kernel.org> <aa407ba2-e9c4-882e-a085-91e7dd724f78@gmx.com>
 <87fsqvjzs5.wl-maz@kernel.org> <YbhzuKQLByleh3T8@redhat.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: Libvirt on little.BIG ARM systems unable to start guest if no
 cpuset is provided
In-Reply-To: <YbhzuKQLByleh3T8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uLSswNaD0Oo3jSZHyL+WRNC6iCOp1OCoolavsGFDEtaOeqks4eX
 GLsitnQA7lrJ1R31L7bL6ihUZtZWe33i61CQle57b+gEiarSrnTMwn2k4n8ALjGuTO4hSSJ
 OTSNqsyeT4t2EVMvkVQTTkGLdKMVQVMAu/dUMyPusIT9pLOIBlf2Yi/MgSCmXitAesbgMel
 PHRhWAytSi2h/lIBc9urQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HVf/pnrV3zA=:NQuvWxEFEZsc9YSwascewO
 GG6G3wMaIdBhug0JJpIWpfLSckslcQl4TXXxnieiFVibF8gH9D2wHZ/WJopAAstVzi5MTyPPH
 lmXQ9R3sRuslHuCkaCVd1l+uf+TmVGLJHOMnUdLftcjy6oX9lX9eN2H6qcGhyqcjDkBaz5kXq
 uAiLCrZgJrxQVy7qOB/vz0Ef4r8FoUyatUE5Fska6LmY7uSjwieoqxT0mNqIwr2ohVwoqtqxR
 S+XMVaVyrpY7Xx6EREfdga/bMgypObsmP6pjygzFVpskBelM9Rmk0ujBbqwc/P2J+He+mRB84
 UKSJnvdRIDtDSQPX7c3iMFSOILtQyN/jU7iw670WJu/u7MX5+cfpuGJyRSIwFLH+rzRjA5w8t
 Vtbb39e08uCVzVqksbFh+cKT2rhGMGgC4JcRo32Zbl6oVdz3pgyd+zXhqojOoi+6IVsncqrjr
 LM7RVzD4CPiljDqC2UJdHwmbISxgjCbiJBOlaESalve7XLUKkeVHKHZfgH1cQxgpn1w1X/CDc
 1GB5n39P6DWX7TWo4S34E8h1/06/BOJu8KqHSehKMV6dzSMr0sOffdg5teI3/p+PScc9hnwt/
 PiphmlVPOuNCCO2aO/L0BoHNEM6OA/Lin0bYiu4Tc42gQn9g0BEoyvuBwtKfWFuGwXPWCU6+h
 tMcZ0EFHsImUYaXWb4BdDU1j7SgjtmhVbDwirv+vBqziJlGRsxFUesGJXN3NocpgK0LPY0lO6
 ji5v600iEyMSjL6a6mGfUAxrfKvM3tv0FhNAWXjf4wsMRxOZz6dNWrDI4pFv4qcTbiEAlomKI
 kHY5LqBhllGZyxkXnR23uxygamsiAOlHesL1MDXbnenX1LLpT25l8NrSgF+SsYlcFX1OhixH+
 +2PuM4Xw85bWmx22KDU/OOF32kFWP70YclA2zPiyAGzk65GxuMusWRgmIhrMcvwS/5v5NVjE1
 GgTXusvYBGa7sTfq0UsZLiEAo8VMj2RvK2RxnLTOR3NyhGGVEKmZtI0zJqJkIBVeA50Px/YhH
 i5t20bMfU6pIVU18ZftszgN32YJ22luanVI4fzjh2fHzkY+vnLoX9PjmWzBM9rmSJjKSmrVAd
 dbpzOD06GhZLhA=
Received-SPF: pass client-ip=212.227.15.15;
 envelope-from=quwenruo.btrfs@gmx.com; helo=mout.gmx.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: SmYximWIwUVK



On 2021/12/14 18:36, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Dec 14, 2021 at 09:34:18AM +0000, Marc Zyngier wrote:
>> On Tue, 14 Dec 2021 00:41:01 +0000,
>> Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>>>
>>>
>>>
>>> On 2021/12/14 00:49, Marc Zyngier wrote:
>>>> On Mon, 13 Dec 2021 16:06:14 +0000,
>>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>>
>>>>> KVM on big.little setups is a kernel-level question really; I've
>>>>> cc'd the kvmarm list.
>>>>
>>>> Thanks Peter for throwing us under the big-little bus! ;-)
>>>>
>>>>>
>>>>> On Mon, 13 Dec 2021 at 15:02, Qu Wenruo <quwenruo.btrfs@gmx.com> wro=
te:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2021/12/13 21:17, Michal Pr=C3=ADvozn=C3=ADk wrote:
>>>>>>> On 12/11/21 02:58, Qu Wenruo wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Recently I got my libvirt setup on both RK3399 (RockPro64) and RP=
I CM4,
>>>>>>>> with upstream kernels.
>>>>>>>>
>>>>>>>> For RPI CM4 its mostly smooth sail, but on RK3399 due to its litt=
le.BIG
>>>>>>>> setup (core 0-3 are 4x A55 cores, and core 4-5 are 2x A72 cores),=
 it
>>>>>>>> brings quite some troubles for VMs.
>>>>>>>>
>>>>>>>> In short, without proper cpuset to bind the VM to either all A72 =
cores
>>>>>>>> or all A55 cores, the VM will mostly fail to boot.
>>>>
>>>> s/A55/A53/. There were thankfully no A72+A55 ever produced (just the
>>>> though of it makes me sick).
>>>>
>>>>>>>>
>>>>>>>> Currently the working xml is:
>>>>>>>>
>>>>>>>>      <vcpu placement=3D'static' cpuset=3D'4-5'>2</vcpu>
>>>>>>>>      <cpu mode=3D'host-passthrough' check=3D'none'/>
>>>>>>>>
>>>>>>>> But even with vcpupin, pinning each vcpu to each physical core, V=
M will
>>>>>>>> mostly fail to start up due to vcpu initialization failed with -E=
INVAL.
>>>>
>>>> Disclaimer: I know nothing about libvirt (and no, I don't want to
>>>> know! ;-).
>>>>
>>>> However, for things to be reliable, you need to taskset the whole QEM=
U
>>>> process to the CPU type you intend to use.
>>>
>>> Yep, that's what I'm doing.
>>
>> Are you sure? The xml directive above seem to only apply to the vcpus,
>> and no other QEMU thread.
>
> For historical reasons this XML element is a bit misleadingly named.
>
> With the config
>
>     <vcpu placement=3D'static' cpuset=3D'4-5'>2</vcpu>
>
> the 'cpuset' applies to the QEMU process as a whole - its vCPUs,
> I/O threads and any other emulator threads.
>
> There is a separate config for setting per-VCPU binding which was
> illustrated elsewhere in this thread.

Which also means, I can put the io threads to A53 cores freeing up the
A72 cores more.

And is there any plan to deprecate the old "cpuset" key of vcpu element,
and recommend to use "vcpupin" element?

Thanks,
Qu

>
> Regards,
> Daniel
