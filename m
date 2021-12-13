Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4196200lfk;
        Mon, 13 Dec 2021 07:02:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw12b1MY579M4XpMGDZTdXQjP3Iv5Vxu3GcS3zy8f7UEys1JNYbbD9v1jhRHUNiLNdpp451
X-Received: by 2002:a05:6000:1564:: with SMTP id 4mr32613785wrz.9.1639407741777;
        Mon, 13 Dec 2021 07:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639407741; cv=none;
        d=google.com; s=arc-20160816;
        b=JZg6RMnDrhi7SAmRcbUAVW2NF11vMXU34CawP+9SOw5EvyNWpyb65Fn8CXR/QT4S40
         kbBqyOwQ5hBlXpAdNpGjf8LAZpFwC5t5iTB/95pvCHdNlUZc27z5ArPfZ14wdzWNNMq5
         Oryxdnb80UMDbKsXIUQsoRiif+OsLzSR6d9ON22kmZiw3Hoo+nK0ELnVFVQoLGUbk8Qz
         c0/qa6/ni9FLjW0LeB1AiqRvZpTk/muoDJEJxFw7eM1Lpj7cL8HUHp26VaoSGPPlrj8y
         gWT426k3EakG309bVWwo455lS+1e90GiqevmRD5LhwxDxkqKGEgnwDSPYHxRcgab4qCy
         I0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:from:references:to:content-language:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xQmH1Ggpe0mCpGcbV+cdNFlEGAYSio1FsJxR+J1wL9M=;
        b=TALTpSdkyZcQxvbe/hlbggnR4135Gag2QhIsPPEwmjsSdAOBljJo2XeORniTZswS/Z
         PeOejawrb5kijjAuxIBzqoCEm+jJShQkvVm03+gDoXJgX0vuhq3mFzSDYof7SctgWJ0w
         hla9vdqQ+UjHjkrQq2RIx9xz0s23+pLcKaPubpgh+0DbnbcXgSXNZcrw5NKMmWngUuV1
         Kw/nCkQn4qDZ5oRedx6GtMsTr8WI6MWK6n8BYN0oMC7PhOTT6ZlgCgrqFqvlZrLlD8PV
         6wKGL0+8QekzJxXOJsSq1WJ2qa2WnhIF4bxsxIAzOu+hDdIFOkZGKBtXoGi9ypQRv9UR
         eMwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=XeFZmlkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si26374796wrp.220.2021.12.13.07.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 07:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=XeFZmlkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwmqK-0002Qw-VA
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 10:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mwltf-0008NT-Ko; Mon, 13 Dec 2021 09:01:45 -0500
Received: from mout.gmx.net ([212.227.15.18]:36249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mwltZ-0007Hj-EQ; Mon, 13 Dec 2021 09:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639404091;
 bh=b9h+zzkehKhZLvXN1t/pIn+WbQDPkjUssiv8PrQZZtw=;
 h=X-UI-Sender-Class:Date:To:References:From:Subject:In-Reply-To;
 b=XeFZmlkXQboXWI+298VtzcBYbUcPTmhf8QXGvgTxpCsQ4PXKDovX2WBp5YlFMjjmQ
 d4XaUqISSyH9IBbUqiWKKIxLwoOHrPQ1A6BdT96u5a09fI56aS/BUf2Gfew7d3ZQyx
 YMOILpJOdrJaq2TnknO4cCjUeLZWeKzN3ymKkBSk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N2mBa-1mXacw1INQ-0133A5; Mon, 13
 Dec 2021 15:01:30 +0100
Message-ID: <1dc0403b-c61b-b04b-e7fd-f2d66276ba7b@gmx.com>
Date: Mon, 13 Dec 2021 22:01:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 libvirt-users@redhat.com, qemu-arm@nongnu.org, qemu-discuss@nongnu.org
References: <70a2f7d6-5ac1-72df-4a88-b1a662d07070@gmx.com>
 <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: Libvirt on little.BIG ARM systems unable to start guest if no
 cpuset is provided
In-Reply-To: <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RyNCpZg5ZmZ3Mkou1PMs32Zmg7NJzY8IoDkiN3gkeLErEeYPhWA
 oA4siJY+M3S6bXSnup8PRa8X6C5k5YDxKNBJo7806OWbRH1XG2ByUSO46wTOrRyQmgdnTuv
 GPv0YjTW5CIuj8DQJhO8jzUUT+Ua+u80pQgUlgXys2HLcmuSJ+ilOyCe7gdBA0/oOefs5Fj
 pnobyrW00IO5u4wxjs8Kg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ERWXXUpeASs=:lgnZghsOWtpdcPJbiIWw4U
 3XmPi7jd6dFN37DX2RAYuXNx1q8PzlSWL5nUuHfMLKeLVUeVM+plKb/RzXjNxeV0veHDN01qO
 W09mRR8HLs7C/cmdBtsz1sEzVMBDeup80HsUVR8hDhVfMhZ1vipeLC/vsdHAipo6YC0EfmLbr
 9RHhxmk8xUQ4YI7IaB0riNCGMi9FhgEFQJAkhhzhCRP5U//eSk3teRfMS6m84sHoylV3aVHhS
 usy0TKXvu/ML3wwpUJVe8n8M5D1UBxTv+QYxaGGVNl6yEl/DP2/SvEgvgIYc+44f6Umi/Lhb9
 pwFshFzvUhwNqnpPITP13wBf5E4U0x8cbkXN4WmtJG3XDHj2JzlHap/wkLDtxCtGa4Pdkc1rP
 UA9HACxMpHw19EjPdZ8J2BngGN5ILm8OsSqBkX3OY3/46ThHZLuaa88/yPNc1C1tZmblXuUHq
 N+8EKCete3rz99hT72nzMMYKKuEaa8P0Ank1x6F6/AglM30yFAIjanMbGo8/S+mKize7KQpah
 sgL/Qga9PpCx5B9T33BiHcEj+0Ccg9E+1O9gsBlRtYf7COjz98qfAKG/Qx5fnHqzYSTNDxmwP
 5OZooxaiIF+Z8tJni+bgVTQAtI9f1EGZlcMxiTmUYTNVqPllyoRJ0YqzcA0pbe5lDQ83tPp6+
 Lofpp4UwzGSdQ2X8cs5vmeqyu4VQOlQH0kDxVD8i2ilsJlZ5tVFuRsm/pHQxDzUO4O/5r53+5
 Zk4Gs/nmUmldazt5LhRqw9DO/JnNxHrgQES01fOWZXuouJWcP2sN8YyE9QXIjd3ha92cDOB/A
 rdjR8AGptfPNIYXS0cKK78xWkQqKlOEsHQvJJKWaSvoLl0Kkqi3T6AeurDRQhfTdtbFp9yYBV
 E4GSrmC2bJM4Sfzs+qLLf0LGwMnMesO2FQIK2xfKqwpa1Sn66n6+i1+anTh3++a0F6oZ33ltW
 UZztWgSwMumspVIDyFAD2P/2/VmqBVQXcevCO2TxB3NRcWARbPqFHiHrrN+BpLUn/dV2rEuZ9
 vmpUV//Xypl3xKkLjw908EOTGJ6PN0NK2QaMb87P/n09xcsV/kYGPqTmrInB4PdsvhPhWcmnm
 8Yxvk+t/sX3M4Q=
Received-SPF: pass client-ip=212.227.15.18;
 envelope-from=quwenruo.btrfs@gmx.com; helo=mout.gmx.net
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Dec 2021 10:01:58 -0500
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +SPYBXJKFSq5



On 2021/12/13 21:17, Michal Pr=C3=ADvozn=C3=ADk wrote:
> On 12/11/21 02:58, Qu Wenruo wrote:
>> Hi,
>>
>> Recently I got my libvirt setup on both RK3399 (RockPro64) and RPI CM4,
>> with upstream kernels.
>>
>> For RPI CM4 its mostly smooth sail, but on RK3399 due to its little.BIG
>> setup (core 0-3 are 4x A55 cores, and core 4-5 are 2x A72 cores), it
>> brings quite some troubles for VMs.
>>
>> In short, without proper cpuset to bind the VM to either all A72 cores
>> or all A55 cores, the VM will mostly fail to boot.
>>
>> Currently the working xml is:
>>
>>  =C2=A0 <vcpu placement=3D'static' cpuset=3D'4-5'>2</vcpu>
>>  =C2=A0 <cpu mode=3D'host-passthrough' check=3D'none'/>
>>
>> But even with vcpupin, pinning each vcpu to each physical core, VM will
>> mostly fail to start up due to vcpu initialization failed with -EINVAL.
>>
>>
>> This brings a problem, in theory RK3399 SoC should out-perform BCM2711
>> in multi-core performance, but if a VM can only be bind to either A72 o=
r
>> A55 cores, then the performance is no longer competitive against
>> BCM2711, wasting the PCIE 2.0 x4 capacity.
>>
>> I guess with projects like Asahi Linux making progress, there will be
>> more and more such problems.
>>
>> Any clue on how to properly pass all physical CPU cores to VM for
>> little.BIG setup?
>>
>
> I have never met big.LITTLE but my understanding was that those big
> cores are compatible with little ones and the only difference is that
> the big ones are shut off if there's no demand (to save energy) leaving
> only the little ones running.

The big ones are not disabled AFAIK.

And even changing the CPU model to A53 (the little ones), it still fails
to boot, thus it looks like A72 is not really able to emulate A53 cores?

>
> Anyway, this is likely too high level forum and I'd ask QEMU developers:
>
> https://www.qemu.org/support/

That's indeed the case, adding qemu to the CC list.

And I found an existing bug report:
https://bugs.linaro.org/show_bug.cgi?id=3D1443

But I still didn't get the point why the 1:1 CPU-to-vcpu mapping still
doesn't work.

Thanks,
Qu

>
> Michal
>
