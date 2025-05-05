Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2478856njj;
        Mon, 5 May 2025 07:23:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbyoC0a8gGfQIOGp7mmcJMI2Giog2mSMOOazTFER9UVb9jqneUjtPtspkOeThKHl5UO0FT/95blO+WwA==@linaro.org
X-Google-Smtp-Source: AGHT+IE+SKMwv+EfZztCIO2IJ8uyJrqn7EEMEj80/htMU20Gj6lBmfGWI9QuCMO/oWe3r4+eP2tI
X-Received: by 2002:a05:6102:91a:b0:4cb:6019:8e7e with SMTP id ada2fe7eead31-4db14912f8amr4017033137.17.1746455036217;
        Mon, 05 May 2025 07:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746455036; cv=none;
        d=google.com; s=arc-20240605;
        b=cp00hx156z0V+1ddhExILayOdSbPuAzsbyMHRS6+u0lTRwn5BAAW0FIaY5wuJygRl3
         Y0wXDfgx+lfrFPWk/+FPv9rokBpxV6gGI5J/5StIYn0rGHTVlzOXPc7A6VdS+KLStUW3
         7fF9MABNu39xnnuTa6tBoRQGdVgfo5qOuEnLsYdBP/tM2KrqRcxN5OT0kvryk09cytke
         94miOVHAKz6CsXOQYvUz/OpY6FaHHcR5XefEMnREhwrSXp1rIsSdZEVKvTlSz0Cs1BOA
         k+MuHyqN7DvoXQMFDQm/lDHkX+IYNvNk38/EEjmadpNt9r/seQVRn5xtfbuIwQQ85ivk
         psXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=t7FIKYtpccbSRCedkbnxyRLCCa2wzwESof1aPjQpbSw=;
        fh=Pa40134xlF7U61h5Wt9GWL+sQ21+congfMKbg9TeTF0=;
        b=McEsVFz8UC0MNh86ByXrBjTpwRnqYfalBl9hd8jp69EqxPQJzFbi05jXFDrMs06ci6
         m+vfJykrwR+x5d8i4LYLDo91MllONkBneRmphUcJbybE5+Zz/YVQvrAFfnzwBzqVM0WY
         1WYKFf8M0jUN+qagZnaa/gL7sb7JG/pZek+qRzblNolPdoKZMYse9+BX4JIC8bIUegNY
         vGxXFUvldJmOhHarpNpP3xpgAmXPgvno+SYXSecEO/zRvuvcr8WSdufB4vQ4YEcrCckt
         fQANh+TP7uyt3MZfnNAf3z1hPGro4+NK4n4UEXqSnyAIEP7Qkc2lsomA88VOG18xyE23
         WniA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zcnl5bdv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4daf25c0ad1si1720068137.507.2025.05.05.07.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 07:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zcnl5bdv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBwjR-0002n7-2i; Mon, 05 May 2025 10:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBwjL-0002mF-VF
 for qemu-arm@nongnu.org; Mon, 05 May 2025 10:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBwjE-0001Hg-SV
 for qemu-arm@nongnu.org; Mon, 05 May 2025 10:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746455011;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7FIKYtpccbSRCedkbnxyRLCCa2wzwESof1aPjQpbSw=;
 b=Zcnl5bdvpq7a4Bk641yuEVGEEWlS/LnUdqgHDSIgrPAfiBsk/2acdQu1+6nAiX16hw9Tnl
 Bw7k9xapt8YxR8NVj7zclBtVcF21qoWkPovyCpH5JHo4BmvxbH+8IiGNdhRMHed8ey1vGs
 Wm7jXEJ1mZPoRLpWs9Sxk6tjOM9ZQ+M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-8Ho5pPbwOQmX29QZRHguvg-1; Mon, 05 May 2025 10:23:29 -0400
X-MC-Unique: 8Ho5pPbwOQmX29QZRHguvg-1
X-Mimecast-MFC-AGG-ID: 8Ho5pPbwOQmX29QZRHguvg_1746455009
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-440a4e2bad7so21468145e9.0
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 07:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746455008; x=1747059808;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t7FIKYtpccbSRCedkbnxyRLCCa2wzwESof1aPjQpbSw=;
 b=sEMgVvO1tm585HxONRkmP5qlTx+4AVjmKgN17oyuzb3ACMfjXXK0Is6siC6oMGBVc2
 H1I2W6At/NXtYlNV5G2ItCiqSpxBtOTPwDXtYciKipq8yMEIBi8/uuCZ/zIfOU1PTCVe
 4e1/KWHC6CV9GkxOhhBo2++BcXU1Ip/xfCUE7luLi626MZheCskLBlI6rAa+03zXAalQ
 oqd6u4HQ6cgRgcMukqqwMWjht9iRxoQNZ/E+TOi/L42VeiTTV71zMZX7wxXo8Y7FO+yR
 7w2T20iwI889mX3nvOyKOIfolYSj4s7OQv7oSSFKhVwW8uLPT9gXBwpY3sWsmV6ih9Ly
 XEnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXypZixZnmEA6V/Xe1ZDzLBHHzlaHfAw2heWUT9HALa8A2pkd2CqErz1GmBGioz4aocvYRG88DKtA==@nongnu.org
X-Gm-Message-State: AOJu0YxCfkg6s1cmulbQl/FIjq5zUZuAPIeSeUKioHJJp2Z+wzfw2fk7
 kaPEQrbbhMbp/6E0r2LcF/Kyww5x7ZwvuQorAzzKYV5r9MncaeDw+uiFXnSMznd0LriTvBwv2Uj
 7CYZ+C2KvaeyFVEXBue5UtyEqliZdX8IrFm/1NabgwDemmg/xFw==
X-Gm-Gg: ASbGncsg0fMowEDMe02ZiMcXMtHCcB/6LEpo8v3P1AYdPMw81WnY73MQlwe0FqJRzTd
 bM8STyFamBGAqUj56tWwJNYT2NOwUlKUk9wZWWKrnjNrEgJKwnvUuJjM33G0LMk6Aj7aTmFymxX
 mq3lHNq1CfkMhB9S7bVqVKgT2Qov6XDnNbHeNcSjKOcZ1eAokfGCyIHYY/0+PRH9pePN2L32juP
 jZ3SCVrKGKSpml8X8Af56SjS6Qn8D5Eyo8b7eerQ/DH8c1XsawSUsRCU7nAsSkTleNgj2nzuH3E
 sAToRZ0yYnR1DotDwgBbcdsCiVjO4HlsC4g72AjdklAVIck2Q06bHhlFTiw=
X-Received: by 2002:a05:600c:698c:b0:439:8878:5029 with SMTP id
 5b1f17b1804b1-441bb8483d2mr109900285e9.2.1746455008570; 
 Mon, 05 May 2025 07:23:28 -0700 (PDT)
X-Received: by 2002:a05:600c:698c:b0:439:8878:5029 with SMTP id
 5b1f17b1804b1-441bb8483d2mr109899955e9.2.1746455008003; 
 Mon, 05 May 2025 07:23:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b391c42bsm173604885e9.39.2025.05.05.07.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 07:23:27 -0700 (PDT)
Message-ID: <af4eb265-f1f8-42cc-bd4b-b4dcfc6e06c2@redhat.com>
Date: Mon, 5 May 2025 16:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/24] APCI PCI Hotplug support on ARM
To: Gustavo Romero <gustavo.romero@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <6a52f974-3e13-49ba-bfeb-e30e683e4ce5@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6a52f974-3e13-49ba-bfeb-e30e683e4ce5@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rajANAxUqF6_E0CyE8plAKj_m8eZ7swOH_dUNHLy7Yw_1746455009
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Xt8Ssf+AktfK

Hi Gustavo,

On 5/5/25 3:26 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 4/28/25 07:25, Eric Auger wrote:
>> This series enables APCI PCI hotplug/hotunplug on ARM
>> and makes it default for 10.1 machine type. This aligns with
>> x86 q35 machine. Expected benefits should be similar to
>> those listed in [1].
>>
>> The infrastructure used in x86 is heavily reused and a
>> huge part of the series consists in moving code from
>> hw/i386/acpi-build.c to a generic place and slightly
>> adapting it to make it usable on ARM. The DSDT table is
>> augmented to support ACPI PCI hotplug elements.
>>
>> On ARM we use use a GED event to notify the OS about
>> hotplug events.
>>
>> I have not noticed any tests/qtest/bios-tables-test failures
>> neither on x86 nor ARM. x86 DSDT table has not changed.
>> ARM DSDT table definitively has but there are no tests
>> impacted. ARM misses hotplug tests that do exist on x86. This
>> most probably should be considered in the future.
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/arm-acpi-pcihp-rfc
>>
>> [1] [PATCH v6 0/6] Use ACPI PCI hot-plug for Q35
>> https://lore.kernel.org/all/20210713004205.775386-1-jusual@redhat.com/
>
> I've just started to review your series and went to a quick smoke test
> by hotplugging a net adapter and got the following kernel internal error:
>
> (qemu) device_add virtio-net-pci,bus=pcie.1,addr=0,id=na
> (qemu) [   64.165411] pci 0000:01:00.0: [1af4:1041] type 00 class
> 0x020000
> [   64.165895] pci 0000:01:00.0: reg 0x14: [mem 0x00000000-0x00000fff]
> [   64.166259] pci 0000:01:00.0: reg 0x20: [mem 0x00000000-0x00003fff
> 64bit pref]
> [   64.166658] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0003ffff
> pref]
> [   64.167153] pci 0000:01:00.0: enabling Extended Tags
> [   64.179972] Internal error: synchronous external abort:
> 0000000096000050 [#1] SMP
> [   64.180719] Modules linked in: aes_ce_blk aes_ce_cipher polyval_ce
> polyval_generic ghash_ce gf128mul sha2_ce binfmt_misc sha256_arm64
> sha1_ce nls_ascii nls_cp437 vfat fat evdev cfg80211 rfkill loop fuse
> efi_pstore drm dm_mod dax configfs efivarfs qemu_fw_cfg ip_tables
> x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic virtio_scsi
> virtio_net scsi_mod net_failover failover virtio_blk scsi_common
> crct10dif_ce crct10dif_common virtio_pci virtio_pci_legacy_dev
> virtio_pci_modern_dev virtio_mmio
> [   64.183656] CPU: 0 PID: 23 Comm: kworker/u2:1 Not tainted
> 6.1.0-30-arm64 #1  Debian 6.1.124-1
> [   64.184071] Hardware name: QEMU QEMU Virtual Machine, BIOS
> edk2-stable202408-prebuilt.qemu.org 08/13/2024
> [   64.184759] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
> [   64.185320] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [   64.185737] pc : acpi_ex_system_memory_space_handler+0x290/0x300
> [   64.186175] lr : acpi_ev_address_space_dispatch+0x124/0x334
> [   64.186490] sp : ffff80000a6bb3b0
> [   64.186663] x29: ffff80000a6bb3b0 x28: ffff0003fcbb08b8 x27:
> 0000000000000000
> [   64.187126] x26: ffff0003fcbb0288 x25: ffff80000a6bb568 x24:
> 0000000000000001
> [   64.187499] x23: ffff80000a6bb568 x22: 0000000000000004 x21:
> ffff0000c206cb00
> [   64.187885] x20: 00000000090c0014 x19: 0000000000000020 x18:
> 0000000000000000
> [   64.188265] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000000000000000
> [   64.188640] x14: 0000000000000000 x13: 4d43c3194dea1791 x12:
> 4d7a3553e5c937d0
> [   64.189003] x11: 0000000000000001 x10: 0000000000000000 x9 :
> ffff800008735b34
> [   64.189383] x8 : 0000000000000001 x7 : ffff80000873c850 x6 :
> 00000000000000f8
> [   64.189778] x5 : ffff0000c206cb00 x4 : 0000000000000000 x3 :
> 00000000090c0018
> [   64.190163] x2 : ffff80000a9af014 x1 : 00000000090c0018 x0 :
> 0000000000000001
> [   64.190734] Call trace:
> [   64.191086]  acpi_ex_system_memory_space_handler+0x290/0x300
> [   64.191696]  acpi_ev_address_space_dispatch+0x124/0x334
> [   64.192042]  acpi_ex_access_region+0xe4/0x2e0
> [   64.192287]  acpi_ex_field_datum_io+0x88/0x200
> [   64.192509]  acpi_ex_write_with_update_rule+0xd4/0x120
> [   64.192793]  acpi_ex_insert_into_field+0x210/0x2b0
> [   64.193048]  acpi_ex_write_data_to_field+0xa0/0x190
> [   64.193298]  acpi_ex_store_object_to_node+0x150/0x240
> [   64.193527]  acpi_ex_store+0x144/0x300
> [   64.193726]  acpi_ex_opcode_1A_1T_1R+0x218/0x580
> [   64.193971]  acpi_ds_exec_end_op+0x24c/0x4b0
> [   64.194227]  acpi_ps_parse_loop+0x100/0x6a0
> [   64.194477]  acpi_ps_parse_aml+0x94/0x3b0
> [   64.194674]  acpi_ps_execute_method+0x128/0x25c
> [   64.194922]  acpi_ns_evaluate+0x1f0/0x2d0
> [   64.195148]  acpi_evaluate_object+0x138/0x2d0
> [   64.195380]  acpi_evaluate_dsm+0xb8/0x134
> [   64.195613]  acpi_check_dsm+0x34/0xdc
> [   64.195822]  smbios_attr_is_visible+0x5c/0xb0
> [   64.196089]  internal_create_group+0xd0/0x3d0
> [   64.196335]  internal_create_groups+0x58/0xe0
> [   64.196584]  sysfs_create_groups+0x20/0x30
> [   64.196813]  device_add_groups+0x18/0x2c
> [   64.197039]  bus_add_device+0x48/0x160
> [   64.197260]  device_add+0x3a4/0x85c
> [   64.197463]  pci_device_add+0x308/0x660
> [   64.197680]  pci_scan_single_device+0xe4/0x114
> [   64.197941]  pci_scan_slot+0x70/0x1fc
> [   64.198155]  acpiphp_rescan_slot+0x90/0xa4
> [   64.198366]  acpiphp_hotplug_notify+0x2a8/0x300
> [   64.198584]  acpi_device_hotplug+0x138/0x4c0
> [   64.198819]  acpi_hotplug_work_fn+0x2c/0x4c
> [   64.199045]  process_one_work+0x1f4/0x460
> [   64.199277]  worker_thread+0x188/0x4e0
> [   64.199492]  kthread+0xe0/0xe4
> [   64.199671]  ret_from_fork+0x10/0x20
> [   64.200114] Code: f90002e0 52800000 17ffff97 f94002e0 (b9000040)
> [   64.200820] ---[ end trace 0000000000000000 ]---
>
> (qemu)
>
> This is a Debian Bookworm stock kernel 6.1. I built QEMU from your GH
> branch.
>
> The machine was started with:
>
> ./qemu-system-aarch64 -m 16G -nographic -machine
> type=virt,gic-version=max -cpu cortex-a57 -initrd
> /mnt/initrd.img-6.1.0-30-arm64 -kernel /mnt/vmlinuz-6.1.0-30-arm64
> -append "root=/dev/vda1 console=ttyAMA0,115200 acpi=force" -device
> virtio-scsi-pci -device virtio-blk-pci,drive=root -drive
> if=none,id=root,file=/mnt/debian-12-nocloud-arm64.qcow2 -device
> pcie-root-port,id=pcie.1,chassis=1,slot=1 -bios
> ./pc-bios/edk2-aarch64-code.fd
>
> ./pc-bios/edk2-aarch64-code.fd is the one found under ./build dir, so
> nothing special.
>
> It seems Linux acpi crashed when ingesting the _DSM method but I could
> not
> figure out what exactly in it could cause it.

Thank you for reporting this issue.
On my end I tested with rhel guest and recent EDK2 while
hotplugging/hot-unplugging VFIO devices.
I will try to reproduce

Eric
>
>
> Cheers,
> Gustavo
>
>>
>> Eric Auger (24):
>>    hw/pci/pcie_port: Fix pcie_slot_is_hotpluggbale_bus typo
>>    hw/acpi/ged: Fix wrong identation
>>    hw/i386/acpi-build: Fix build_append_notfication_callback typo
>>    hw/i386/acpi-build: Make aml_pci_device_dsm() static
>>    hw/arm/virt: Introduce machine state acpi pcihp flags and props
>>    hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
>>    hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
>>      acpi_dsdt_add_pci_osc
>>    hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
>>    hw/pci-host/gpex-acpi: Propagate hotplug type info from virt machine
>>      downto gpex
>>    hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
>>    hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method
>>    hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
>>    hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
>>    hw/i386/acpi-build: Move build_append_notification_callback to pcihp
>>    hw/i386/acpi-build: Move remaining pcihp generic functions to pcihp
>>    hw/i386/acpi-build: Introduce and use acpi_get_pci_host
>>    hw/arm/virt-acpi-build: Add DSDT additions for PCI hotplug
>>    hw/acpi/ged: Prepare the device to react to PCI hotplug events
>>    hw/acpi/ged: Call pcihp plug callbacks in hotplug handler
>>      implementation
>>    hw/acpi/ged: Support migration of AcpiPciHpState
>>    hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
>>    hw/arm/virt: Let virt support pci hotplug/unplug GED event
>>    hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
>>    hw/arm/virt: Use ACPI PCI hotplug by default
>>
>>   hw/i386/acpi-build.h                   |   4 -
>>   include/hw/acpi/aml-build.h            |   2 +
>>   include/hw/acpi/generic_event_device.h |   5 +
>>   include/hw/acpi/pci.h                  |   4 +-
>>   include/hw/acpi/pcihp.h                |  14 +
>>   include/hw/arm/virt.h                  |   4 +
>>   include/hw/pci-host/gpex.h             |   1 +
>>   include/hw/sysbus.h                    |   1 +
>>   hw/acpi/aml-build.c                    |  50 +++
>>   hw/acpi/generic_event_device.c         |  64 +++-
>>   hw/acpi/pci.c                          |  20 ++
>>   hw/acpi/pcihp.c                        | 428 +++++++++++++++++++++-
>>   hw/arm/virt-acpi-build.c               |  26 ++
>>   hw/arm/virt.c                          | 100 +++++-
>>   hw/core/sysbus.c                       |  11 +
>>   hw/i386/acpi-build.c                   | 475 +------------------------
>>   hw/pci-host/gpex-acpi.c                |  75 +---
>>   hw/pci/pcie_port.c                     |   4 +-
>>   hw/arm/Kconfig                         |   2 +
>>   19 files changed, 748 insertions(+), 542 deletions(-)
>>
>

