Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751BACCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 04:15:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBmiy-0000XT-Si; Thu, 23 Oct 2025 00:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vBmix-0000XD-RO
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 00:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vBmiv-00074i-DO
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 00:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761192887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AQhcu0ef2vYWog2vQWDJYDcfHvPz4PP9U5M+NKzdXI=;
 b=MKtzPIB1PttCVyMimlyTyek9RHQMJtcjasN8cp4hJLGyKNoxjNMDa4r+ID3KBQtRCD27Hv
 HX3N2bLzSvXfuw9dA97Fz+khYyCv00fufHSW4OvRtvZ3YcGd4jnnp35wRAzd8Cl8icMX3C
 VljOseE91yv++vrqzCMPc1pm/phDjXY=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-27GMIsKBO7qZdWUvIfQ5JA-1; Thu, 23 Oct 2025 00:14:45 -0400
X-MC-Unique: 27GMIsKBO7qZdWUvIfQ5JA-1
X-Mimecast-MFC-AGG-ID: 27GMIsKBO7qZdWUvIfQ5JA_1761192885
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b6cd0ee184aso116594a12.0
 for <qemu-arm@nongnu.org>; Wed, 22 Oct 2025 21:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761192885; x=1761797685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1AQhcu0ef2vYWog2vQWDJYDcfHvPz4PP9U5M+NKzdXI=;
 b=TF3XL1NQfh2vfqCdPHK9QKXoJE5l7Vcj1CMb6gwyLE5o95jpMVg2UWkyfJDDRlXE4F
 AGK+L09o53PRTPEjRFww3QmYS7VHUdYDTuefEhLloQ7pc5VLFv9k7O1e5OwsqxydlI6x
 +d8ziVu9nes1fHLcmrSIk7uv55wSDOO8ca0kO3gJM+YtwzVS2nTIWPwg5a1AZdQjJW+X
 au3DS+gA4GDvKgnfRBqDg4ac7qhOYTuzTHAEG7zM/oWXtRF9gv7rKrv9MMiu2flP7NRc
 MVES/pHlBDkYfwjYY69F1v7GaJC0GrKrhQehGVHm3CJeJ/RKaAhTlXSOfIJD/oqEDEqr
 BNGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/vceLpMpabbbYSc6UB0h5R/DEzpvadqEMjSWUemeTlnZUldw+O4/EHDkrZxNyLfCMzaAbKBEAhg==@nongnu.org
X-Gm-Message-State: AOJu0YwHkElMiYK6Vaui7sHJiIXpHDtA209ZeE30sbROOHMKai/zocXF
 TZMjd3FL3PmUbRXaKGvSSvEfkAdKzaIXXqmD44NKiTNo12YQUAZrUARCnb4DqW/GaA6qWUjep0+
 P9v11k/8egIAyEBiiOY6CUskRvJ/X64p/NYJ9W/vO1Pea+QP0y2RoXA==
X-Gm-Gg: ASbGnctp+xvm6kObS2u/gT/F/4q4JJWK8MeLgJ32nLoXxfQaYWHmwnurSaJ0rO5Q/tH
 4jA+3X2Ug4/oT3XLbEFclCvbJQFJUjkq1nPlb1Np7+Q+bfHo92+tcHOSm2L8zKVdYLZhGkmPs/8
 ARgAKxyb8zQqtyFF70lf5Q0mf7Djye7ZYuPrqSyX2t+mOnJ2PWgjK6WkAeEYLp9kDe0fTcWRT64
 OxrKZj5dp7Fv9vZgRYF4sWgyvD/mYQmkGKLsiWoflpRQMvH64xJNENT8FnxBdqw+LwyVdg3H//L
 pgiA6OPsRACtqYU/71BN9JaoDGUfTj0oXHQdjW223PLBz5fJi8cVqfUIjDBfgk4oj3uVQXv/OaK
 k0YL+ica2Ukpsr4N0HPHAXUCVXIl07LVyvr/ZiTM=
X-Received: by 2002:a17:902:f548:b0:276:76e1:2e84 with SMTP id
 d9443c01a7336-290c9c8941dmr289040795ad.3.1761192884717; 
 Wed, 22 Oct 2025 21:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSHb0xcJz/0pnPdAbzl+219vr6lFdN3kuvZqVMtqnNWelLGg/Ux5uQcBG8nT/Eo4UfcvJ6/g==
X-Received: by 2002:a17:902:f548:b0:276:76e1:2e84 with SMTP id
 d9443c01a7336-290c9c8941dmr289040325ad.3.1761192884277; 
 Wed, 22 Oct 2025 21:14:44 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946de0fdc1sm8343475ad.48.2025.10.22.21.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 21:14:43 -0700 (PDT)
Message-ID: <5a13811b-628f-4e47-86b9-fad1ab7df244@redhat.com>
Date: Thu, 23 Oct 2025 14:14:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V6 05/24] arm/virt,kvm: Pre-create KVM vCPUs for
 'disabled' QOM vCPUs at machine init
To: Salil Mehta <salil.mehta@opnsrc.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 salil.mehta@huawei.com, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, imammedo@redhat.com,
 armbru@redhat.com, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, Keqian Zhu <zhuqian1@huawei.com>
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-6-salil.mehta@opnsrc.net>
 <a03ed205-b61a-4bba-9f25-83663b7d8a86@redhat.com>
 <CAJ7pxeYurHLqj8GnLrfznmofMpsaw91GeZ3KMyucL0B_gn9gPg@mail.gmail.com>
 <CAJ7pxeaUfUeXwtTVheCTxej-aCTCx0n8-XyAKaFneVUjcWL_7w@mail.gmail.com>
 <beab3dd4-0c19-441c-a9f5-ecae9e791753@redhat.com>
 <CAJ7pxeYEpJGhtL1-3qFEJYTzL-s19fF-it6p5dkq=fg384wBpg@mail.gmail.com>
 <CAJ7pxeZG1w++2DNVD5L5N3sEPRLYPFSFECLqFgh3BYgKpfJtog@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAJ7pxeZG1w++2DNVD5L5N3sEPRLYPFSFECLqFgh3BYgKpfJtog@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vl9sMhzONCwKP4OO-J86AtvKVFSTYmPJlSqQw0clHJE_1761192885
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Salil,

On 10/23/25 11:29 AM, Salil Mehta wrote:

[...]

>>
>> Ah, I see. I think I understand the issue. It's complaining
>> about calling the  finalize twice. Is it possible to check as
>> I do not have a way to test it?
>>
>>
>> int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
>> {
>> switch (feature) {
>> case KVM_ARM_VCPU_SVE:
>> [...]
>> if (kvm_arm_vcpu_sve_finalized(vcpu))
>> return -EPERM;-----> this where it must be popping?
>> [...]
>> }
> 
> I've pushed the fix to avoid calling the finalizing SVE
> feature (KVM_ARM_VCPU_FINALIZE) twice on the
> same RFC-V6.2 branch.
> 
> May I kindly request you to validate the fix again and
> check SVE works on NVIDIA grace-hopper?
> 

With the latest rfc-v6.2 branch, I don't hit the issue. The vCPU can be hot added
and removed on grace-hopper host.

host$ /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                     \
       -accel kvm -machine virt,gic-version=host,nvdimm=on                         \
       -cpu host,sve=on                                                            \
       -smp maxcpus=4,cpus=2,disabledcpus=2,sockets=2,clusters=2,cores=1,threads=1 \
       -m 4096M,slots=16,maxmem=128G                                               \
       -object memory-backend-ram,id=mem0,size=2048M                               \
       -object memory-backend-ram,id=mem1,size=2048M                               \
       -numa node,nodeid=0,memdev=mem0,cpus=0-1                                    \
       -numa node,nodeid=1,memdev=mem1,cpus=2-3                                    \
       -L /home/gavin/sandbox/qemu.main/build/pc-bios                              \
       -monitor none -serial mon:stdio -nographic -gdb tcp::6666                   \
       -qmp tcp:localhost:5555,server,wait=off                                     \
       -bios /home/gavin/sandbox/qemu.main/build/pc-bios/edk2-aarch64-code.fd      \
       -kernel /home/gavin/sandbox/linux.guest/arch/arm64/boot/Image               \
       -initrd /home/gavin/sandbox/images/rootfs.cpio.xz                           \
       -append memhp_default_state=online_movable
          :
          :
guest$ cd /sys/devices/system/cpu
guest$ cat present enabled online
0-3
0-1
0-1
(qemu) device_set host-arm-cpu,socket-id=1,cluster-id=0,core-id=0,thread-id=0,admin-state=enable
guest$ echo 1 > cpu2/online
guest$ cat present enabled online
0-3
0-2
0-2
         :
         :
guest$ cd /sys/device/system/cpu
guest$ cat present enabled online
0-3
0-2
0-2
(qemu) device_set host-arm-cpu,socket-id=1,cluster-id=0,core-id=0,thread-id=0,admin-state=disable
guest$ cat present enabled online
0-3
0-1
0-1

Thanks,
Gavin


