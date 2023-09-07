Received: by 2002:a05:7022:12b:b0:6b:57c3:147a with SMTP id 43csp198609dlk;
        Thu, 7 Sep 2023 02:11:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtWn5V7v7l+NmoTNXDaz9XqEO7Ze73BwFTbw+ZGlURQqe7E6BKRTYgj68nJpa3HNCGt3kk
X-Received: by 2002:a05:620a:3904:b0:76d:a749:3df6 with SMTP id qr4-20020a05620a390400b0076da7493df6mr21667905qkn.52.1694077884590;
        Thu, 07 Sep 2023 02:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694077884; cv=none;
        d=google.com; s=arc-20160816;
        b=nwdBcJEEAC3GGMbRguXgS/ftB7RuhFU6p9Uy676qVyFyAZBkcI2aXc30ZMHWOwH4dA
         yVDKGzen3+sICGu/wjd+lROjq1mfWIXrYcFsC5rl66koiqfvQslbXawCu5FbP2TLJew8
         yQG9yjS1VlN8cDWtaoMkCyvopYIGAwgdJNxlX6jxaoQgF+hlxZN8WEeetymIc/hSmuRO
         LTPiubxA/bDMO/fj9NR8rQY5VGEj14QcyzogITnPspvu2NOohLoVf+D7vq5815LGgYe5
         jVazsP6wjgR9ksRPtc4S8DH7241VFBpwIJGhoaOv3npRG7i8Wa8T51sV4LiI16tpHkYc
         lXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eeMgvZVuwwc5tBYGgCkZlXtjtK159QxCYcggUkkSACY=;
        fh=6+LkpbXl4Ni3qBDtwjlv+mXl/+rf/xV3EDn5hl90Akg=;
        b=E5eopkGYgJ1v2M9wopxH2OYp6JWjOHbcqSY+HZ9fnCY0yIeYnI45pNXdglKZQtNYun
         QtZm+fyK7xzg7yKu1mYTnmNrhaG7/g4NZym8yUrSOQZ0SzmNM4OMG+UUWP4AB2WRWnX+
         u3hFsSf03kz38cxtQf9N4ptmMjd0OT6oIlGJqj0QHAygu5oFKA2C6L66URp0s2sKj7rd
         biyVBQeuMGYtV3LgRPzYlU8xCFWe8dSen1kXqxtBl3t4aXrV9uCIsxS1tHwkuwJeJ235
         mHZU0pr4gpqZa6/JKcuAKnvxS8pNlNwhLI5tbwLzVJMF23CQPNP8iZUqD9CDPZU59ewX
         B9rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PAqWEwOv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020a05620a280700b0076ccd3dc9f2si11446412qkp.741.2023.09.07.02.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 02:11:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PAqWEwOv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeB2m-0008Qs-Rj; Thu, 07 Sep 2023 05:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qeB2f-0008Pw-3n
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 05:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qeB2b-0003Jd-MD
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 05:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694077868;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeMgvZVuwwc5tBYGgCkZlXtjtK159QxCYcggUkkSACY=;
 b=PAqWEwOvmkpOzQYCCfYWSrYyQz+yoj1iR8SrXwQ9yPmveJBipebZhrjFf5JGAr5GpmGKTM
 HvUGoF/QEzvqVI6npRigUpl8VGbjM7brrFVt7w+Tbi0EHWShlsRTTm27wKF3O8A+gWz/3A
 C6+CEDyoJmj6eYiGipRaeYlig3yNl0M=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-F0S5PpQbMZad_Ijz9oCVYw-1; Thu, 07 Sep 2023 05:11:06 -0400
X-MC-Unique: F0S5PpQbMZad_Ijz9oCVYw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-64a0166deb5so9382626d6.3
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 02:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694077865; x=1694682665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eeMgvZVuwwc5tBYGgCkZlXtjtK159QxCYcggUkkSACY=;
 b=arWCaN2hazMhXncS97XaUcqPTfoavKFbth2p78j78+0kYA0FGg1aAARCfoh3NeYzwC
 uJ+MOx9vs8OhjlfXqM1qPgevaE5/Rei4ldTcb7Lmk/fEX9n7cCDv3bozzf0TkCx3uJBw
 8v9InwJZSF2aeVCtuhPYtQPCIlXbNpjFGKnw229yw4V7ifEZKWYkydCvm8LoEAt0SOfv
 Ts13EBZt045mNDtLjQOmAoaBfOVHwuNLjBY0arR2P5VE+cDIfhtxhU8p8gOelQSFJw2q
 5V3BTTN9h+J1k+MDHTdDkJ1iD0fJuIGAdqQT1UasTD5OIllJ6PCIvLfPMBsldrPyKzMI
 ZC/w==
X-Gm-Message-State: AOJu0Yzb18Sd3AOM6zAOrfmInxrUwjHvIXj8Jrm2fKl7wHOFynkhp43N
 ICtkX3URTM7cHFn6eODushHMuhES58LZJlGs4Am59a0tI063s8aelIVTqsPMjTvpS5Xz3Bfw0iw
 KdrPggX68CbKsXHeMTrzi
X-Received: by 2002:a0c:df13:0:b0:639:91ad:64d6 with SMTP id
 g19-20020a0cdf13000000b0063991ad64d6mr20094920qvl.61.1694077865610; 
 Thu, 07 Sep 2023 02:11:05 -0700 (PDT)
X-Received: by 2002:a0c:df13:0:b0:639:91ad:64d6 with SMTP id
 g19-20020a0cdf13000000b0063991ad64d6mr20094910qvl.61.1694077865347; 
 Thu, 07 Sep 2023 02:11:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a0cf50a000000b0064906cfe430sm6261494qvm.135.2023.09.07.02.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 02:11:04 -0700 (PDT)
Message-ID: <2916216f-39a0-1a27-ad4e-6c664bf4a04e@redhat.com>
Date: Thu, 7 Sep 2023 11:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Wu, Fei" <fei2.wu@intel.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrei Warkentin <andrei.warkentin@intel.com>, qemu-arm
 <qemu-arm@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <20230803-3855259bbabb934c247c5607@orel>
 <d654810c-4f4f-7491-7711-c6076f42dcae@intel.com>
 <efc85591-fd5e-c6e7-ab3d-220d5ca57aa5@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <efc85591-fd5e-c6e7-ab3d-220d5ca57aa5@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WEq11szSK9OR

Hi,

On 9/7/23 09:16, Philippe Mathieu-Daudé wrote:
> Widening Cc to ARM/VFIO.
>
> On 4/8/23 11:15, Wu, Fei wrote:
>> On 8/3/2023 11:07 PM, Andrew Jones wrote:
>>> On Mon, Jul 31, 2023 at 09:53:17AM +0800, Fei Wu wrote:
>>>> riscv virt platform's memory started at 0x80000000 and
>>>> straddled the 4GiB boundary. Curiously enough, this choice
>>>> of a memory layout will prevent from launching a VM with
>>>> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
>>>> to identity mapping requirements for the MSI doorbell on x86,
>>>> and these (APIC/IOAPIC) live right below 4GiB.
>>>>
>>>> So just split the RAM range into two portions:
>>>> - 1 GiB range from 0x80000000 to 0xc0000000.
>>>> - The remainder at 0x100000000
>>>>
>>>> ...leaving a hole between the ranges.
>>>
>>> Can you elaborate on the use case? Maybe provide details of the host
>>> system and the QEMU command line? I'm wondering why we didn't have
>>> any problems with the arm virt machine type. Has nobody tried this
>>> use case with that? Is the use case something valid for riscv, but
>>> not arm?
>>>
>> Firstly we have to enable pcie passthru on host, find the device groups,
>> e.g. the vga card, and add their pci ids to host kernel cmdline:
>>     vfio-pci.ids=10de:0f02,10de:0e08
>>
>> then start vm through qemu as follows:
>> $Q -machine virt -m 4G -smp 4 -nographic \
>>    -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf \
>>    -kernel ./vmlinuz -initrd initrd.img -append "root=/dev/vda1 rw" \
>>    -drive
>> file=ubuntu-22.04.1-preinstalled-server-riscv64+unmatched.img,if=virtio,format=raw
>>
>> \
>>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1 \
>>    -netdev user,id=vnet,hostfwd=:127.0.0.1:2223-:22 -device
>> virtio-net-pci,netdev=vnet
>>
>> Without this patch, qemu exits immediately instead of boots up.
>>
>> Just tried pcie passthru on arm, it cannot handle 4G memory either.
>> $Q -m 4G -smp 4 -cpu max -M virt -nographic \
>>    -pflash /usr/share/AAVMF/AAVMF_CODE.fd -pflash flash1.img \
>>    -drive if=none,file=ubuntu-22.04-server-cloudimg-arm64.img,id=hd0 \
>>    -device virtio-blk-device,drive=hd0 \
>>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1
>>
>> qemu-system-aarch64: -device vfio-pci,host=01:00.0: VFIO_MAP_DMA failed:
>> Invalid argument
>> qemu-system-aarch64: -device vfio-pci,host=01:00.0: vfio 0000:01:00.0:
>> failed to setup container for group 11: memory listener initialization
>> failed: Region mach-virt.ram: vfio_dma_map(0x55de3c2a97f0, 0x40000000,
>> 0x100000000, 0x7f8fcbe00000) = -22 (Invalid argument)

The collision between the x86 host MSI reserved region [0xfee00000,
0xfeefffff] and the ARM guest RAM starting at 1GB has also always
existed. But now this collision is properly detected instead of being
silenced. People have not really complained about this so far. Since the
existing guest RAM layout couldn't be changed, I am afraid we couldn't
do much.

Eric
>>
>> Thanks,
>> Fei.
>>
>>> Thanks,
>>> drew
>>
>>
>

