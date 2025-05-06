Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3227857njj;
        Tue, 6 May 2025 09:10:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMEeLkzBirJu8/i3IcT9Y1jd/G3MLojGhf/tsVOGCKihvWrBjc4RnoeE5rRguvAvsdUZY0F4SsCQJCYg==@linaro.org
X-Google-Smtp-Source: AGHT+IF0zB4XKtmK6uRHXvL4Dh0kjodQji0gYr+M1DZtHYjnOfC8q0tvGJS7EFoGZP3JgDMVfXa9
X-Received: by 2002:a05:6122:168b:b0:52a:bfb5:545c with SMTP id 71dfb90a1353d-52aed685d1amr8829293e0c.1.1746547833387;
        Tue, 06 May 2025 09:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746547833; cv=none;
        d=google.com; s=arc-20240605;
        b=QFB+4YlojWEsvyfgLSXLG+MYS9iMlU5E42rWfC1UeFl2MJkXcbfjfbxXoqdZbrzKHC
         HyXkpqEecnp5qBYuj9KF0QSB3QkOg9/EmdrPApfeu57AiZw1BwLxk5LjZR1gNCVvtbjx
         JGlnbT3NrhwBsYZJ8lObsfL2Ri3Iqnlm1RsIksEW19sYq2q5qN3WGp/PX1kPNTfrt0pC
         XIs+vFmxpRi9GUE35mtLj6JSer641/xZ/5D9FhYEW0rSey793JsyZIaKi/Y+6x9VHe4C
         HvVvwHUSGX/RTHPkmylBEGdqLWClRL2Su2/qcTNw6kWBVDu2h4u9NpGk8raO4Zk6u1kx
         2ovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QeWyitgd7XSNYCupExBBQMMmrFgKB8EXBu6+KDkNLq0=;
        fh=I7IbPS4v64xtpPjfE/5y0hj4kdVBe0CHHbG0FenW3WA=;
        b=N4Z+4M+fdADis1pHGJsRbMWMlQxscWNW6UlFHR2CcLLA+atPBvBW/I+EftVcLn7JJQ
         N0nw6xMcwLyouT5Ja7BDcI6uaNZTwW6dXBVwh2idJz1t9x1zPYpbvJ+tFrTztqcptxX9
         V0WfS2V+aCjEZW59etWPEqDmFlkS9S6UjiL0RO4QrcOKyyEMI++OORz0sK90O5GCLmDb
         zS/3QwLNQ4c7in50rfEnZZ6XnGZI1cGKhBJ55afZxDkZqEaZL07PXEJAPG+hOivZcgQq
         zYcF4BuSEkNbabOsQNY8boJ7kBeMIZw2tkwMO42t0sW/c4lWXM8VV0DRmLIAvzmTZgvs
         4I8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRf0Zr9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-52ae413b5b6si2917501e0c.144.2025.05.06.09.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 09:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRf0Zr9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCKrw-0005rT-Ba; Tue, 06 May 2025 12:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uCKrv-0005r9-13
 for qemu-arm@nongnu.org; Tue, 06 May 2025 12:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uCKrq-0007TC-TJ
 for qemu-arm@nongnu.org; Tue, 06 May 2025 12:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746547801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeWyitgd7XSNYCupExBBQMMmrFgKB8EXBu6+KDkNLq0=;
 b=WRf0Zr9Xrfog1cdKyZmTvcJxOHkciqI0tpi+Lsm7uALI7aZ5j+ncyoffkh1eqfgKpxfUtQ
 8UMJ6SiiEBxSDrzW1Isl4kz9YY2sRlw1V/Nx07HaaSLQjN3uoaQrEP9SUgAJ1T3tfdEV4R
 RTrhBNKyh28sVdd8W5h7Y9eyF/6eFAg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-Eo0vPweuOHOOypST3jXgCQ-1; Tue, 06 May 2025 12:08:41 -0400
X-MC-Unique: Eo0vPweuOHOOypST3jXgCQ-1
X-Mimecast-MFC-AGG-ID: Eo0vPweuOHOOypST3jXgCQ_1746547720
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d5ca7c86aso34545215e9.0
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 09:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746547720; x=1747152520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QeWyitgd7XSNYCupExBBQMMmrFgKB8EXBu6+KDkNLq0=;
 b=ZODhaUDqmu7qLF2qe+VH/R0zseRQB1v/yeyRQgWitBrJKE8BObxE9IiJne3JNKHKHf
 7czO5PFeg23JZP+OgMS5/gAO6iisf7JKEUMM9HkqJT0xOfpcso990FuNAeQbDDJoZ6KK
 ZmNqtGrt69edh6ybzrKeoVqQFcJsCOGX53bKuQZgrajyPMESSVGvwjOe3E04E9RtPWB0
 oKFgvvRYFcZirMNrFQjh/KmqIjF57XIalgI7mdNyxhGOJoULt8qfBJhhDo4oM4Z+wVqB
 rZXA8XcT7Syv2f0Rj+/a7mGNr3kXlnsAVbW4TNZ5ZXkR51COBD7gZvOHPO08vweNHsM9
 NPXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqOjF+jdOrWlI+VWmhwmitX9EMz9CVbQWtXEYC8N6KvwOHMwILeYfvM9/9yqRY1BUz0J0tF11/Ag==@nongnu.org
X-Gm-Message-State: AOJu0YzYLSDAjxInG1WECzNjJRqNfE/VkbJD7OexTu0rFwtr0a3Fjseh
 Jir0jp/BDXyzsLYF4tXz752rX5FLrb7EGnfIWkcdmqCBCJPwW31zdUjtxilkN6aptKtb2J7vb2Z
 nNDcti30SN5j4X5AnG4B0YKvgqNo/3Wh/Q62Ebdi87mpwKnlULA==
X-Gm-Gg: ASbGncsJQclj/PPP/9CCmvkffAvOoijrLAFLoJWM8gJQTJaunVh4hT5fy90iV6cGhbD
 wwFnzxmEGvLmejx/XOO3vZxxUDCFrpJMGkpPIXyq2CeLAvw6pyjGE9RQJkdtiIh2OKoIklPHFOK
 kDymQNpDNaM8AwKr2Cva0bCoTEe0Mp6JUWvgNEjPPyXzrOR+UHpi426Y8GEsqnotKNIusTiK2gn
 zO8pzl7GvWaltdqtFQ8RYCsB1vl/AD6rY3odgEe6+1geW+35Jaas8r9RLKmcstfc5VAlF/X32Gm
 s8pZzWlJ4L+vRXd+ULH7cxt5kpn007dYxVUMIlktJ5uL7w426v7YHg==
X-Received: by 2002:a05:600c:a409:b0:43d:7413:cb3e with SMTP id
 5b1f17b1804b1-441c0a2353amr116317115e9.1.1746547720188; 
 Tue, 06 May 2025 09:08:40 -0700 (PDT)
X-Received: by 2002:a05:600c:a409:b0:43d:7413:cb3e with SMTP id
 5b1f17b1804b1-441c0a2353amr116316625e9.1.1746547719767; 
 Tue, 06 May 2025 09:08:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d11a44d3sm21718405e9.0.2025.05.06.09.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 09:08:38 -0700 (PDT)
Message-ID: <ffa5d6a4-768a-499f-910b-4e81a4f70328@redhat.com>
Date: Tue, 6 May 2025 18:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/24] APCI PCI Hotplug support on ARM
To: eric.auger@redhat.com, Gustavo Romero <gustavo.romero@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <6a52f974-3e13-49ba-bfeb-e30e683e4ce5@linaro.org>
 <5e24182d-a8bc-41fa-9741-6caecaa0c12e@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <5e24182d-a8bc-41fa-9741-6caecaa0c12e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: isaNKymR2TqgXFDCRajbolXyxsP40ctrqzK1p65lzxk_1746547720
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3LqI4v0KwR2u



On 5/6/25 5:58 PM, Eric Auger wrote:
> Hi Gustavo,
> 
> On 5/5/25 3:26 PM, Gustavo Romero wrote:
>> Hi Eric,
>>
>> On 4/28/25 07:25, Eric Auger wrote:
>>> This series enables APCI PCI hotplug/hotunplug on ARM
>>> and makes it default for 10.1 machine type. This aligns with
>>> x86 q35 machine. Expected benefits should be similar to
>>> those listed in [1].
>>>
>>> The infrastructure used in x86 is heavily reused and a
>>> huge part of the series consists in moving code from
>>> hw/i386/acpi-build.c to a generic place and slightly
>>> adapting it to make it usable on ARM. The DSDT table is
>>> augmented to support ACPI PCI hotplug elements.
>>>
>>> On ARM we use use a GED event to notify the OS about
>>> hotplug events.
>>>
>>> I have not noticed any tests/qtest/bios-tables-test failures
>>> neither on x86 nor ARM. x86 DSDT table has not changed.
>>> ARM DSDT table definitively has but there are no tests
>>> impacted. ARM misses hotplug tests that do exist on x86. This
>>> most probably should be considered in the future.
>>>
>>> Best Regards
>>>
>>> Eric
>>>
>>> This series can be found at:
>>> https://github.com/eauger/qemu/tree/arm-acpi-pcihp-rfc
>>>
>>> [1] [PATCH v6 0/6] Use ACPI PCI hot-plug for Q35
>>> https://lore.kernel.org/all/20210713004205.775386-1-jusual@redhat.com/
>>
>> I've just started to review your series and went to a quick smoke test
>> by hotplugging a net adapter and got the following kernel internal error:
>>
>> (qemu) device_add virtio-net-pci,bus=pcie.1,addr=0,id=na
>> (qemu) [   64.165411] pci 0000:01:00.0: [1af4:1041] type 00 class
>> 0x020000
>> [   64.165895] pci 0000:01:00.0: reg 0x14: [mem 0x00000000-0x00000fff]
>> [   64.166259] pci 0000:01:00.0: reg 0x20: [mem 0x00000000-0x00003fff
>> 64bit pref]
>> [   64.166658] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0003ffff
>> pref]
>> [   64.167153] pci 0000:01:00.0: enabling Extended Tags
>> [   64.179972] Internal error: synchronous external abort:
>> 0000000096000050 [#1] SMP
>> [   64.180719] Modules linked in: aes_ce_blk aes_ce_cipher polyval_ce
>> polyval_generic ghash_ce gf128mul sha2_ce binfmt_misc sha256_arm64
>> sha1_ce nls_ascii nls_cp437 vfat fat evdev cfg80211 rfkill loop fuse
>> efi_pstore drm dm_mod dax configfs efivarfs qemu_fw_cfg ip_tables
>> x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic virtio_scsi
>> virtio_net scsi_mod net_failover failover virtio_blk scsi_common
>> crct10dif_ce crct10dif_common virtio_pci virtio_pci_legacy_dev
>> virtio_pci_modern_dev virtio_mmio
>> [   64.183656] CPU: 0 PID: 23 Comm: kworker/u2:1 Not tainted
>> 6.1.0-30-arm64 #1  Debian 6.1.124-1
>> [   64.184071] Hardware name: QEMU QEMU Virtual Machine, BIOS
>> edk2-stable202408-prebuilt.qemu.org 08/13/2024
>> [   64.184759] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
>> [   64.185320] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
>> BTYPE=--)
>> [   64.185737] pc : acpi_ex_system_memory_space_handler+0x290/0x300
>> [   64.186175] lr : acpi_ev_address_space_dispatch+0x124/0x334
>> [   64.186490] sp : ffff80000a6bb3b0
>> [   64.186663] x29: ffff80000a6bb3b0 x28: ffff0003fcbb08b8 x27:
>> 0000000000000000
>> [   64.187126] x26: ffff0003fcbb0288 x25: ffff80000a6bb568 x24:
>> 0000000000000001
>> [   64.187499] x23: ffff80000a6bb568 x22: 0000000000000004 x21:
>> ffff0000c206cb00
>> [   64.187885] x20: 00000000090c0014 x19: 0000000000000020 x18:
>> 0000000000000000
>> [   64.188265] x17: 0000000000000000 x16: 0000000000000000 x15:
>> 0000000000000000
>> [   64.188640] x14: 0000000000000000 x13: 4d43c3194dea1791 x12:
>> 4d7a3553e5c937d0
>> [   64.189003] x11: 0000000000000001 x10: 0000000000000000 x9 :
>> ffff800008735b34
>> [   64.189383] x8 : 0000000000000001 x7 : ffff80000873c850 x6 :
>> 00000000000000f8
>> [   64.189778] x5 : ffff0000c206cb00 x4 : 0000000000000000 x3 :
>> 00000000090c0018
>> [   64.190163] x2 : ffff80000a9af014 x1 : 00000000090c0018 x0 :
>> 0000000000000001
>> [   64.190734] Call trace:
>> [   64.191086]  acpi_ex_system_memory_space_handler+0x290/0x300
>> [   64.191696]  acpi_ev_address_space_dispatch+0x124/0x334
>> [   64.192042]  acpi_ex_access_region+0xe4/0x2e0
>> [   64.192287]  acpi_ex_field_datum_io+0x88/0x200
>> [   64.192509]  acpi_ex_write_with_update_rule+0xd4/0x120
>> [   64.192793]  acpi_ex_insert_into_field+0x210/0x2b0
>> [   64.193048]  acpi_ex_write_data_to_field+0xa0/0x190
>> [   64.193298]  acpi_ex_store_object_to_node+0x150/0x240
>> [   64.193527]  acpi_ex_store+0x144/0x300
>> [   64.193726]  acpi_ex_opcode_1A_1T_1R+0x218/0x580
>> [   64.193971]  acpi_ds_exec_end_op+0x24c/0x4b0
>> [   64.194227]  acpi_ps_parse_loop+0x100/0x6a0
>> [   64.194477]  acpi_ps_parse_aml+0x94/0x3b0
>> [   64.194674]  acpi_ps_execute_method+0x128/0x25c
>> [   64.194922]  acpi_ns_evaluate+0x1f0/0x2d0
>> [   64.195148]  acpi_evaluate_object+0x138/0x2d0
>> [   64.195380]  acpi_evaluate_dsm+0xb8/0x134
>> [   64.195613]  acpi_check_dsm+0x34/0xdc
>> [   64.195822]  smbios_attr_is_visible+0x5c/0xb0
>> [   64.196089]  internal_create_group+0xd0/0x3d0
>> [   64.196335]  internal_create_groups+0x58/0xe0
>> [   64.196584]  sysfs_create_groups+0x20/0x30
>> [   64.196813]  device_add_groups+0x18/0x2c
>> [   64.197039]  bus_add_device+0x48/0x160
>> [   64.197260]  device_add+0x3a4/0x85c
>> [   64.197463]  pci_device_add+0x308/0x660
>> [   64.197680]  pci_scan_single_device+0xe4/0x114
>> [   64.197941]  pci_scan_slot+0x70/0x1fc
>> [   64.198155]  acpiphp_rescan_slot+0x90/0xa4
>> [   64.198366]  acpiphp_hotplug_notify+0x2a8/0x300
>> [   64.198584]  acpi_device_hotplug+0x138/0x4c0
>> [   64.198819]  acpi_hotplug_work_fn+0x2c/0x4c
>> [   64.199045]  process_one_work+0x1f4/0x460
>> [   64.199277]  worker_thread+0x188/0x4e0
>> [   64.199492]  kthread+0xe0/0xe4
>> [   64.199671]  ret_from_fork+0x10/0x20
>> [   64.200114] Code: f90002e0 52800000 17ffff97 f94002e0 (b9000040)
>> [   64.200820] ---[ end trace 0000000000000000 ]---
>>
>> (qemu)
>>
>> This is a Debian Bookworm stock kernel 6.1. I built QEMU from your GH
>> branch.
>>
>> The machine was started with:
>>
>> ./qemu-system-aarch64 -m 16G -nographic -machine
>> type=virt,gic-version=max -cpu cortex-a57 -initrd
>> /mnt/initrd.img-6.1.0-30-arm64 -kernel /mnt/vmlinuz-6.1.0-30-arm64
>> -append "root=/dev/vda1 console=ttyAMA0,115200 acpi=force" -device
>> virtio-scsi-pci -device virtio-blk-pci,drive=root -drive
>> if=none,id=root,file=/mnt/debian-12-nocloud-arm64.qcow2 -device
>> pcie-root-port,id=pcie.1,chassis=1,slot=1 -bios
>> ./pc-bios/edk2-aarch64-code.fd
>>
>> ./pc-bios/edk2-aarch64-code.fd is the one found under ./build dir, so
>> nothing special.
> 
> I have just tested debian-12-nocloud-arm64.qcow2 which features
> 6.1.0-34-arm64 + edk2-aarch64-code.fd and I am able to
> hotplug/hot-unplug the virtio-net-pci device. Can you retry without
> 
> -initrd /mnt/initrd.img-6.1.0-30-arm64 -kernel
> /mnt/vmlinuz-6.1.0-30-arm64 -append "root=/dev/vda1
> console=ttyAMA0,115200 acpi=force" ?

Also tried with an upstream kernel 6.15-rc3 and it works for me:

/home/augere/UPSTREAM/acpipcihp-qemu/build/qemu-system-aarch64 -M
virt,acpi-pcihp=on,gic-version=host -cpu max -smp 8 -m
16G,maxmem=32G,slots=3 -display none --enable-kvm -serial
tcp:localhost:4444,server -device
pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1,addr=0x2.0x0 -device
pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2,addr=0x3.0x0 -device
pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3,addr=0x4.0x0 -device
pcie-root-port,bus=pcie.0,chassis=4,id=pcie.4,addr=0x5.0x0 -device
pcie-root-port,bus=pcie.0,chassis=5,id=pcie.5,addr=0x6.0x0 -netdev
tap,id=nic1,script=/home/augere/TEST/SCRIPTS/qemu-ifup,downscript=/home/augere/TEST/SCRIPTS/qemu-ifdown
-qmp unix:/home/augere/TEST/QEMU/qmp-sock,server,nowait -drive
file=/home/nfs_vm/UEFI/edk2-aarch64-code.fd,if=pflash,format=raw,unit=0,readonly=on
-drive file=/home/nfs_vm/UEFI/vars,if=pflash,format=raw,unit=1 -device
virtio-blk-pci,bus=pcie.4,drive=drv0,id=virtio-disk0,bootindex=1,werror=stop,rerror=stop
-drive
file=/home/nfs_vm/IMAGES/aarch64/debian-12-nocloud-arm64.qcow2,format=qcow2,if=none,cache=writethrough,id=drv0
-kernel /home/nfs_vm/BOOT/aarch64/vmlinuz-6.15.0-rc3-acpi-hp-guest+
-initrd /home/nfs_vm/BOOT/aarch64/initrd.img-6.15.0-rc3-acpi-hp-guest+
-append 'root=/dev/vda1 console=ttyAMA0,115200 acpi=force earlyprintk
iommu.strict=no acpi=force' -net none -d guest_errors

(QEMU) device_add driver=virtio-net-pci bus=pcie.1 netdev=nic1
mac=6a:f5:10:b1:3d:d3 id=net

Cheers

Eric




> 
> Cheers
> 
> Eric
>>
>> It seems Linux acpi crashed when ingesting the _DSM method but I could
>> not
>> figure out what exactly in it could cause it.
>>
>>
>> Cheers,
>> Gustavo
>>
>>>
>>> Eric Auger (24):
>>>    hw/pci/pcie_port: Fix pcie_slot_is_hotpluggbale_bus typo
>>>    hw/acpi/ged: Fix wrong identation
>>>    hw/i386/acpi-build: Fix build_append_notfication_callback typo
>>>    hw/i386/acpi-build: Make aml_pci_device_dsm() static
>>>    hw/arm/virt: Introduce machine state acpi pcihp flags and props
>>>    hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
>>>    hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
>>>      acpi_dsdt_add_pci_osc
>>>    hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
>>>    hw/pci-host/gpex-acpi: Propagate hotplug type info from virt machine
>>>      downto gpex
>>>    hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
>>>    hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method
>>>    hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
>>>    hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
>>>    hw/i386/acpi-build: Move build_append_notification_callback to pcihp
>>>    hw/i386/acpi-build: Move remaining pcihp generic functions to pcihp
>>>    hw/i386/acpi-build: Introduce and use acpi_get_pci_host
>>>    hw/arm/virt-acpi-build: Add DSDT additions for PCI hotplug
>>>    hw/acpi/ged: Prepare the device to react to PCI hotplug events
>>>    hw/acpi/ged: Call pcihp plug callbacks in hotplug handler
>>>      implementation
>>>    hw/acpi/ged: Support migration of AcpiPciHpState
>>>    hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
>>>    hw/arm/virt: Let virt support pci hotplug/unplug GED event
>>>    hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
>>>    hw/arm/virt: Use ACPI PCI hotplug by default
>>>
>>>   hw/i386/acpi-build.h                   |   4 -
>>>   include/hw/acpi/aml-build.h            |   2 +
>>>   include/hw/acpi/generic_event_device.h |   5 +
>>>   include/hw/acpi/pci.h                  |   4 +-
>>>   include/hw/acpi/pcihp.h                |  14 +
>>>   include/hw/arm/virt.h                  |   4 +
>>>   include/hw/pci-host/gpex.h             |   1 +
>>>   include/hw/sysbus.h                    |   1 +
>>>   hw/acpi/aml-build.c                    |  50 +++
>>>   hw/acpi/generic_event_device.c         |  64 +++-
>>>   hw/acpi/pci.c                          |  20 ++
>>>   hw/acpi/pcihp.c                        | 428 +++++++++++++++++++++-
>>>   hw/arm/virt-acpi-build.c               |  26 ++
>>>   hw/arm/virt.c                          | 100 +++++-
>>>   hw/core/sysbus.c                       |  11 +
>>>   hw/i386/acpi-build.c                   | 475 +------------------------
>>>   hw/pci-host/gpex-acpi.c                |  75 +---
>>>   hw/pci/pcie_port.c                     |   4 +-
>>>   hw/arm/Kconfig                         |   2 +
>>>   19 files changed, 748 insertions(+), 542 deletions(-)
>>>
>>
> 

