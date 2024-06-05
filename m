Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp3326583ejs;
        Tue, 4 Jun 2024 18:29:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4gzhN9CFFbTlYCqEcFVZfa9LwuiYgiPWNhd8bcrqrwqG9Q5GJDl7dZsHJWkQrA7m1U9SA6aue3cAKLoxlbOF7IFh6qqz4
X-Google-Smtp-Source: AGHT+IHiZYlZKNsV4z/wHbvAk2Pa8+yGdletnE00MreP4JeySj+a883B9rQCDgEoNuwsPtMGqmrC
X-Received: by 2002:a05:620a:108f:b0:795:13eb:9db6 with SMTP id af79cd13be357-79523d55c97mr101241185a.41.1717550972200;
        Tue, 04 Jun 2024 18:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717550972; cv=none;
        d=google.com; s=arc-20160816;
        b=IKTkb/pq9NarPEZkiEaK/jG6hQMPsvvgQgoLkxOhtQJyw5mIGMmie3Yt7p5ML2/Mc1
         gGm09C9GV9IxoZZ+ZEujj5QH0HW+oszwo7yjY+abYJDm+klRSUPuIJtIq0AZiwB3jyJA
         gHqGicu26uDUF5pzbIOOSKuWH5+Z6jWHokxkHvwm8Fnpcewi7ndijPlZpG3797fO8lAD
         QYyrsoW/v4OvYxXLLeNhTs674MTyGd73sGoH+6C5RpUIv4BbtNVBJ7StkHQ0E0GjFXFb
         S0yZvbe7sT0nUhRja+PdNK8apOhrc/XiPotttFMljBpay8YiYDnbAhPLu295e0+E0PBQ
         qRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jMtNE9Eow0elFpRE+T+eUuXHnyjNYdQ9KKqLT6dH5gA=;
        fh=SHCfyeV/Lp6YZIwZcyk+EOD3aM6cDss4TjP2lkiGnGc=;
        b=uBTgL7rjn8G7PgoBdqs0FLVcpei9KB324QByXtc7YGpsE9JexFYxHs6ocfExLB0l+R
         6WyQwZ+0eTZi9ys+3iGOJfEdazx5sAtUlAl5Eeb9Eue/Zw40LE39m2RPy0kUHOYm3CbK
         7CZpZTOXnTcJ8FDgvWvZak/pe0fqh1coi761HWjAnbljjl4ANhqd1itc6dHl9+fhD+kq
         8rA0A8Cz+f+qsmYa6ZoUQS6d3uXq2hGMkNgIqcvqKvHkq/d9frS/sKX4k+R0tuWJOnbG
         rStqDWiNw57PhJ+TIbcxpu7flABjcez7XD7mz7eXb94XcgbUf3FyISG7F/Ly6INcUcuk
         l+Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFCNQbeC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-795229c2ddesi111743585a.107.2024.06.04.18.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 18:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFCNQbeC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEfSY-0000Tj-Iu; Tue, 04 Jun 2024 21:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1sEfSW-0000Sf-IH
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 21:29:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1sEfSU-0004VK-1X
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 21:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717550936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMtNE9Eow0elFpRE+T+eUuXHnyjNYdQ9KKqLT6dH5gA=;
 b=JFCNQbeCY5pgV4+QIStBZEfka4Ob04rS9Frz40CaARkrwJOSTuipVWFZ+u4B6G1UvmoH5l
 lvp+3eXgk4ocXRF/UMKnfNv7aS7C2zNck9qkF9fBWlSsnXxItqCYGOIfBe3Phqowu67OYu
 3MxHdjujgQfQWvD2oR/N0guoccIjpgY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-Kfypg3HlNfKHphVcMs64rg-1; Tue, 04 Jun 2024 21:28:55 -0400
X-MC-Unique: Kfypg3HlNfKHphVcMs64rg-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1f6238a6c2eso14912655ad.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 18:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717550933; x=1718155733;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMtNE9Eow0elFpRE+T+eUuXHnyjNYdQ9KKqLT6dH5gA=;
 b=jLfwzYSC9/MZf74sBqmkGBm87rOP51mAHFM3cHfwkGeUERv48oydKwLkDQeLc3S/Z8
 cvokSvsdxOkZjlz7jmAqtzpioFX/pPlv5vLt4fOKoto0B5Zz8pKriEwq8H9Jb/3QJ6iR
 QDga27PWcEK/pFTez6Ibu/d/Hq6uhvwATfbkpcqvpoEXLQXQS4Nd2CH+n3WdmUmxRjTa
 kBPkke1T8ug0gj+xIdTsuCqndOGoo8ys3KHxz1HKpPIRx1DJPdIi/fdi9eoCeNEVjHKU
 BOn0BuWdRHSptSed076tn/NCiJsnGQll0gT9ll6aUboAmb54wo1OhOswGeillInZF53g
 CRnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/AGT+aAV9SmPljQz8Z8notBrY7IPDW69S0zAqtkIWxQ+Rm6R0kVOIIKcPHrz9Kzf+BJliybg+gUOTvT/0m19qCCIH
X-Gm-Message-State: AOJu0YxOOsSfQxknsZ4RkSKNae7lFisAzryajv+mrEGWShd5f4CgklHz
 X61GQqLoGMMhW74ieRP9xiwkuC+nk9tUo2vUFPwhSoZ8giCRCauezIUll0xjPkqcdcDc0LoBMuK
 DLHX/cbxXdpyy3wKnc5kJe4skFctyuvdPmTXl2CqKd4pfJ+YOuA==
X-Received: by 2002:a17:902:d482:b0:1f3:4d8f:e5f3 with SMTP id
 d9443c01a7336-1f6a5a10405mr16992375ad.15.1717550933125; 
 Tue, 04 Jun 2024 18:28:53 -0700 (PDT)
X-Received: by 2002:a17:902:d482:b0:1f3:4d8f:e5f3 with SMTP id
 d9443c01a7336-1f6a5a10405mr16992015ad.15.1717550932660; 
 Tue, 04 Jun 2024 18:28:52 -0700 (PDT)
Received: from [192.168.68.50] ([43.252.112.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f683286848sm38107865ad.235.2024.06.04.18.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 18:28:52 -0700 (PDT)
Message-ID: <e7748b25-a01b-49e9-bbeb-cd03abb91cf6@redhat.com>
Date: Wed, 5 Jun 2024 11:28:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Itaru Kitayama <itaru.kitayama@linux.dev>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
 <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
 <cbd630d7-01e8-49ba-9c8b-a6514d898ed2@redhat.com>
 <20240531150922.GA83195@myrica>
 <bd1f84bd-e23c-4f4b-bc0b-a2a1b70081f4@redhat.com>
 <20240603082402.GA25688@myrica>
 <2c81cb47-b9bc-4875-a7fb-49c3a8ab6713@redhat.com>
 <20240604111517.GB875061@myrica>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240604111517.GB875061@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: hhc7rBBdXTBQ

Hi Jean,

On 6/4/24 21:15, Jean-Philippe Brucker wrote:
> On Tue, Jun 04, 2024 at 01:02:08PM +1000, Gavin Shan wrote:
>> On 6/3/24 18:24, Jean-Philippe Brucker wrote:
>>> On Sat, Jun 01, 2024 at 08:14:46PM +1000, Gavin Shan wrote:
>>>> ---> guest edk2
>>>>
>>>> # git clone https://git.codelinaro.org/linaro/dcap/edk2.git edk2-guest
>>>> # cd edk2-guest; git checkout origin/cca/v2 -b cca/v2
>>>> # git submodule update --init --recursive;  \
>>>>     source edksetup.sh; make -j -C BaseTools; \
>>>>     export GCC5_AARCH64_PREFIX=;              \
>>>
>>> Doesn't this needs a cross-compiler, something like "aarch64-linux-gnu-" ?
>>>
>>
>> No, I was building everything using a native compiler instead of a cross compiler.
>> All packages were compiled on a NVidia's grace-hopper machine.
>>
>> [root@nvidia-grace-hopper-05 ~]# cat /etc/system-release
>> Red Hat Enterprise Linux release 9.5 Beta (Plow)
>> [root@nvidia-grace-hopper-05 ~]# uname -r
>> 6.7.0-rc2-gavin+
>> [root@nvidia-grace-hopper-05 ~]# gcc --version
>> gcc (GCC) 11.4.1 20231218 (Red Hat 11.4.1-3)
>> Copyright (C) 2021 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.  There is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>>
>> I tried the cross compiler and encountered the same build error.
>>
>> [root@nvidia-grace-hopper-05 edk2-guest]# export | grep GCC5_AARCH64_PREFIX
>> declare -x GCC5_AARCH64_PREFIX="aarch64-linux-gnu-"
>> [root@nvidia-grace-hopper-05 edk2-guest]# build -b DEBUG -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemu.dsc
>>    :
>> --add-gnu-debuglink=/home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/DEBUG/ArmPlatformPrePeiCore.debug /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/DEBUG/ArmPlatformPrePeiCore.dll
>> cp -p -f /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/DEBUG/ArmPlatformPrePeiCore.debug /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPrePeiCore.debug
>> "GenFw" -e SEC -o /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/OUTPUT/ArmPlatformPrePeiCore.efi /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/DEBUG/ArmPlatformPrePeiCore.dll
>> GenFw: ERROR 3000: Invalid
>>    WriteSections64(): /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/DEBUG/ArmPlatformPrePeiCore.dll AARCH64 small code model requires identical ELF and PE/COFF section offsets modulo 4 KB.
> 
> Ah I've seen this once but it disappeared as I tried to investigate and
> I've since changed the implementation, so I don't have many notes about
> it.
> 
> Maybe you could try to bisect from "ArmVirtPkg: ArmCcaIoMmu: Provide an
> implementation for SetAttribute", but it may give false positives if the
> error depends on some random linker placement. Could be
> "ArmVirtPkg/ArmPlatformLibQemu: Setup early UART mapping in a Realm" which
> adds a 4k page to the data section for the ealy RSI config call, though
> that has explicit 4kB alignment.
> 
> In my notes I also wrote that changing "-z common-page-size=0x20" to 4k in
> the link flags may have made the error disappear, but I doubt it's the
> right fix.
> 
> I'll try GCC 11 to see if I can reproduce.
> 

Ok. I run a git-bisect and the first problematic commit is 1153ae939c
("ArmVirtPkg/ArmPlatformLibQemu: Add a third-level page table for the UART idmap")

I'm not familiar with edk2. The error is raised by BaseTools/Source/C/GenFw/Elf64Convert.c::WriteSections64()
where the relocatable address isn't properly aligned to 4KB. So I modified the code
as below, but I have to run two consecutive builds. In the first attempt build, I
still hit the same error.

---> VirtPkg/Library/ArmPlatformLibQemu/IdMap.S

   .align    12
   .globl    idmap
   .globl    uart_pte
   .section  ".data.idmap", "aw", %progbits
   .align    12

# source edksetup.sh; export GCC5_AARCH64_PREFIX=
# make -j -C BaseTools; \                                               <<< Failed on the first attempt
   build -b DEBUG -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemu.dsc
    :
WriteSections64(): /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/DEBUG/ArmPlatformPrePeiCore.dll AARCH64 small code model requires identical ELF and PE/COFF section offsets modulo 4 KB.
make: *** [GNUmakefile:405: /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/OUTPUT/ArmPlatformPrePeiCore.efi] Error 2

# make -j -C BaseTools; \                                              <<< Succeed on the second attempt
   build -b DEBUG -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemu.dsc
    :
Generating FVMAIN FV
######
Fd File Name:QEMU_VARS (/home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/FV/QEMU_VARS.fd)
    :
- Done -
Build end time: 21:04:05, Jun.04 2024
Build total time: 00:00:06

After that, I'm unable to start the guest with the edk2 image successfully.

host# # mount | grep 9p
shr0 on /mnt/shr0 type 9p (rw,relatime,access=client,trans=virtio)
host# cat ./realm.sh
#!/bin/sh

SHR_DIR="/mnt/shr0"

qemu-system-aarch64 -accel kvm                              \
-machine virt,gic-version=3,confidential-guest-support=rme0 \
-cpu host -smp 2 -m 512M                                    \
-object 'rme-guest,id=rme0,measurement-algo=sha512'         \
-monitor none -serial mon:stdio -nographic                  \
-bios ${SHR_DIR}/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd \
-kernel ${SHR_DIR}/linux/arch/arm64/boot/Image              \
-initrd ${SHR_DIR}/buildroot/output/images/rootfs.cpio      \
-append 'console=ttyAMA0'

host# ./realm.sh
UEFI firmware (version  built at 19:56:47 on Jun  4 2024)
add-symbol-file /home/gavin/sandbox/C                              <<< I don't see more output after it

>> GenFw: ERROR 3000: Invalid
>>    :
>>
>>>>     build -b DEBUG -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemu.dsc
>>>>      :
>>>>     WriteSections64(): /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore/DEBUG/ArmPlatformPrePeiCore.dll AARCH64 small code model requires identical ELF and PE/COFF section offsets modulo 4 KB.
>>>> cp -p -f /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/OvmfPkg/VirtioFsDxe/VirtioFsDxe/DEBUG/VirtioFsDxe.dll /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/OvmfPkg/VirtioFsDxe/VirtioFsDxe/DEBUG/VirtioFsDxe.debug
>>>> cp -p -f /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe/DEBUG/PartitionDxe.debug /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/PartitionDxe.debug
>>>> "gcc" -MMD -MF /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/CryptoPkg/Library/OpensslLib/OpensslLibCrypto/OUTPUT/openssl/crypto/asn1/x_sig.obj.deps @/home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/CryptoPkg/Library/OpensslLib/OpensslLibCrypto/OUTPUT/cc_resp.txt  -c -o /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/CryptoPkg/Library/OpensslLib/OpensslLibCrypto/OUTPUT/openssl/crypto/asn1/x_sig.obj  /home/gavin/sandbox/CCA/edk2-guest/CryptoPkg/Library/OpensslLib/openssl/crypto/asn1/x_sig.c
>>>> "GenFw" -e DXE_CORE -o /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Core/Dxe/DxeMain/OUTPUT/DxeCore.efi /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Core/Dxe/DxeMain/DEBUG/DxeCore.dll
>>>> GenSec -s EFI_SECTION_USER_INTERFACE -n ArmCpuDxe -o /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/FV/Ffs/B8D9777E-D72A-451F-9BDB-BAFB52A68415ArmCpuDxe/B8D9777E-D72A-451F-9BDB-BAFB52A68415SEC3.ui
>>>> cp -p -f /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe/DEBUG/*.map /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe/OUTPUT
>>>> cp -p -f /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Universal/Disk/UdfDxe/UdfDxe/OUTPUT/UdfDxe.efi /home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Universal/Disk/UdfDxe/UdfDxe/DEBUG
>>>> GenFw: ERROR 3000: Invalid
>>>>     :
>>>> build.py...
>>>>    : error 7000: Failed to execute command
>>>> 	make tbuild [/home/gavin/sandbox/CCA/edk2-guest/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore]
>>>>
>>>>
>>>> build.py...
>>>>    : error F002: Failed to build module
>>>> 	/home/gavin/sandbox/CCA/edk2-guest/ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore.inf [AARCH64, GCC5, DEBUG]
>>>>
>>>> - Failed -
>>>> Build end time: 05:42:19, Jun.01 2024
>>>> Build total time: 00:00:31
>>>>
> 
> 
>> Ok, I can look into this deeply after I can bring up the guest successfully.
> 
> Note that the guest edk2 is optional and experimental, you can use direct
> kernel boot to get a working demo quicker.
> 

I never did this before. Could you please provide the detailed steps on this?

Thanks,
Gavin

