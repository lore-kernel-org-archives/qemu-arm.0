Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2933210ejt;
        Wed, 29 Nov 2023 13:39:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+kb+15PbNwpj5d8F2/qlMTqAuXWfX0nNjpIZ05HMUx8QRJh+fYQ+z6xVAt0p35hH3vRs6
X-Received: by 2002:a05:6808:2a66:b0:3b8:8f56:1528 with SMTP id fu6-20020a0568082a6600b003b88f561528mr4568659oib.59.1701293998007;
        Wed, 29 Nov 2023 13:39:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701293997; cv=none;
        d=google.com; s=arc-20160816;
        b=H+JGvCrsomp3fvh3ouJmsH+KP9/Z4uy3vbVWBXcOhuncG5at0q5YKb5r2LtSW9qjon
         wonpy4zQ5FvVKn5hFoGfJazJbSk7S43H7XRodV93EM2or1uSnGlZrs3JNKC66eXlUNVj
         lYK4WPtUX1224KxWYqmdvj2BI9wuyNIm9kqBCRc4x7wxxGOJxBO+qSTyVvWiDjS4LnPF
         AhhQJkLInaGv7t/5SiM2/523WEqaVaq9qaaGgqYsaM4DU5RJY4wfLhb3LIvIGkdhswNl
         9Aw82ZQHbxCxnqxds+MQr/0Lk6gypgSiJVMSNu5jLGVSEKw489ItrsEnLhxQogpomaEw
         ktaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Nt63PC4iDLxtLtXuo7zo+QT027tgWxhjuN9g2LvCg08=;
        fh=JKTnjfgLebdI6Uppdd2zUuo3nA3KHnzgaaV6K84+8TY=;
        b=DbReIVzfDw5daq0t65Jonnbrtmw4pYqiedV8Aow1nm3Tps49rmOuWdC5HW+87wXl7l
         9iYh6SFQizuNy5CEWx1Mzp1OkBRKCj7GWwgUbYFUcbr8j9rbQ2BU6J3F8iVknSHNnW/o
         Xg0l/SFZFPM3avGTV0/aA7qdpetx9vB8Sqv5trzRLC18c6BKCFcUqfPAZnnbiZjXcsYX
         5+xO8wMBqbp/J/67UaZc7j69dIkFXR9atXenTYt4SpnOo1aRFnRhykA0dkwOgt2+JzuX
         8luQmoAWN4mxrU4l+J8MFK+Gc8ahq3pKQNUzJYAddJiXK8i7rlp3B+PFRtDDQ6JTuzlA
         MvrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w28-20020a05620a0e9c00b0077d741122d1si13751211qkm.721.2023.11.29.13.39.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Nov 2023 13:39:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8SHc-0003mp-VJ; Wed, 29 Nov 2023 16:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KBMj=HK=kaod.org=clg@ozlabs.org>)
 id 1r8SHa-0003k2-Od; Wed, 29 Nov 2023 16:39:47 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KBMj=HK=kaod.org=clg@ozlabs.org>)
 id 1r8SHY-0007RF-ET; Wed, 29 Nov 2023 16:39:46 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SgXlt5f0kz4xWj;
 Thu, 30 Nov 2023 08:39:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgXln6g31z4xWg;
 Thu, 30 Nov 2023 08:39:33 +1100 (AEDT)
Message-ID: <149f7908-6d25-482b-bfa4-59235535d9e2@kaod.org>
Date: Wed, 29 Nov 2023 22:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] Introduce model for IBM's FSI
Content-Language: en-US
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20231026164741.1184058-1-ninad@linux.ibm.com>
 <417e8a68-2f35-4315-b694-892f78c811b6@kaod.org>
 <a1fbfc7b-6f5a-44c4-9af4-65dac15763b6@linux.ibm.com>
 <1f2a6342-5d14-4549-bd44-1fe51f84f18d@kaod.org>
In-Reply-To: <1f2a6342-5d14-4549-bd44-1fe51f84f18d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=KBMj=HK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f3YR9p7ACiZJ

On 11/29/23 22:29, Cédric Le Goater wrote:
> On 11/29/23 15:56, Ninad Palsule wrote:
>> Hello Cedric,
>>
>> On 11/27/23 10:31, Cédric Le Goater wrote:
>>> Hello Ninad,
>>>
>>> On 10/26/23 18:47, Ninad Palsule wrote:
>>>> Hello,
>>>>
>>>> Please review the patch-set version 7.
>>>> I have incorporated review comments from Cedric, Philippe and Thomas.
>>>
>>>
>>> I reworked v7 with the suggestions I made in patches 1-6. Please check :
>>>
>>>   https://github.com/legoater/qemu/commits/aspeed-8.2
>>>
>>> I will have more questions on the mappings because some parts are really
>>> unclear.
>>>
>> I forgot to mention in my last mail. If I build against your aspeed-8.2 branch then rainier machine is failing to boot.
>>
>> The same images are working with qemu master branch.
>>
>> fsi/qemu-system-arm -M rainier-bmc -nographic -kernel ./fitImage-linux.bin -dtb ./aspeed-bmc-ibm-rainier.dtb -initrd ./obmc-phosphor-initramfs.rootfs.cpio.xz -drive file=./obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 -append 'rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a' -net nic -net user,hostfwd=:127.0.0.1:3222-:22,hostfwd=:127.0.0.1:2234-:1234 -trace 'fsi*'
>>                          |
>>                          |
>> Starting systemd-udevd version 254^
>> [   50.630407] /dev/disk/by-partlabel/rofs-a: Can't open blockdev
>> mount: mounting /dev/disk/by-partlabel/rofs-a on /mnt/rofs failed: No such file or directory
>> /bin/sh: can't access tty; job control turned off
> 
> Hello,
> 
> Please try with  '-M rainier-bmc,boot-emmc=false' to avoid using the
> boot emmc mode which is the default for the rainier machine.
> 
> I just updated the aspeed-8.2 branch to take into account the -kernel
> option when booting the rainier.

Instead, please update your emmc file image which should contain a
boot area with u-boot.spl and uboot. See patch "hw/sd: Support boot
area in emmc image". Or use  '-M rainier-bmc,boot-emmc=false'

Thanks,

C.

