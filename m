Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD86D116F3
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Dec 2025 14:38:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQ52a-0007XJ-5U; Mon, 01 Dec 2025 09:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vQ52W-0007TT-UN
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 09:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vQ52U-0002j4-G2
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 09:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764599885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7v+lweDAC/ONxi5Ke+G7XPhiCVaYiQxzBE48FlTPxk=;
 b=jH84UHl+4LHL7Kd+Js3wvtclQKAP8f77VESC1THWrZmfvkxuiXnBd6Qfgh9uYBf7LTuLOQ
 0ftMUFSz4gkeAEXMWJe2gC5iMoZMb/+/wqS1HXLbHno0OE1UTA0j0eJAkW7cf121iUOIKV
 9yRP80zBbS2yaEeBOAwKUxxh48YbgmU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-_8f13p2tPpu5i2ZCFrs52g-1; Mon, 01 Dec 2025 09:38:01 -0500
X-MC-Unique: _8f13p2tPpu5i2ZCFrs52g-1
X-Mimecast-MFC-AGG-ID: _8f13p2tPpu5i2ZCFrs52g_1764599881
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-299d221b749so77347085ad.3
 for <qemu-arm@nongnu.org>; Mon, 01 Dec 2025 06:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764599880; x=1765204680;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q7v+lweDAC/ONxi5Ke+G7XPhiCVaYiQxzBE48FlTPxk=;
 b=A+zExrl/CrvkGVMQFUp8OXcIJgZS8eqJ4mscDcvc/z4+SLujYp9M9MuPCsmOX/1QAN
 uU0jn2XExVbIqRyAB8gKaZgwoKTqqe/l7+YktrpvJA+HRoxzW9QIARFULE/TtkQ+Rz9k
 bU+9nS0rndDpfAezlcri19mDwx5+Z9d80Qa2im6yk9YpdMdo0WJJzE2etKJFCThoZvrj
 N6FgRNni3NkhZ9FpMOI4llH+exrVcLSwwsHMHskKVJyPo8qbB3uaE8bzm4vdfHl2dXJ0
 LY2xbFD8pH11mlZUzybcWgLyKdTZJPpiFw+p3pbyN3O3nr3XxT00Y8BW6tdmleLoRkBc
 8rbw==
X-Gm-Message-State: AOJu0YyivLaNIJDg5PGXpG+2KxW8HfMMyPqZH98SnJyp9XQpF85//voB
 6XVXp/Umcgvmc6z8AUO62XkgKRMXEhHUY8fYM/b22vweTkg+e0EARcNgtSVzLNL8tZBCDY2BCvO
 t6NjkpRTvspmkznh6hN2CiSrtYQI4Ku8Qcf0J17CYLsZ4NI8krf3TbQ==
X-Gm-Gg: ASbGnctZEHcRwTpKer2nU4PUrmF6KBlvZjbwKWskkXjwflYl9Ewj43X+Jeau46PYR6k
 LmuGtk6l7lCYb5KQ4MTmDMbhl/JI9atqOCQEQ56lgBIZaGJ/MpbTilcWrtJx/Dv2CnhUcumhsHN
 WXcQvMaC7KjAqS32IlquA9CN7Lz/IMfkUD6SWXGFuuefy0o+tS6ZjfOiQDO5zEoUOgeITeJBXlL
 JLw7y1g8KHmnVhDGYd4yiGgQ7fz5Gelbv8cxqgth0x9eQrB7Exqk+2/nMhuRmLYosczQWxmT5KO
 7yqKS5FZC8CmjvPHseAnlvcu+SRBXMiT3B4dqR8d+igEX54vBW18PD+bmpanNQIUKTsPbanLSUG
 cZmQR78SocqzPphRMhyvY/ljJ68v6PsHgj0Ei7NBmu64TZsyv4g==
X-Received: by 2002:a17:903:1209:b0:298:3e3a:ae6 with SMTP id
 d9443c01a7336-29b6c6ae64fmr409151415ad.48.1764599880500; 
 Mon, 01 Dec 2025 06:38:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlDc4+C/44Vkt4/h7bMFtt2THg+cgiTD3THaQnCU6xxAcSL8m/OAjvBVmNt6+A+ncrbhNFIQ==
X-Received: by 2002:a17:903:1209:b0:298:3e3a:ae6 with SMTP id
 d9443c01a7336-29b6c6ae64fmr409150995ad.48.1764599879946; 
 Mon, 01 Dec 2025 06:37:59 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb277ebsm125734955ad.56.2025.12.01.06.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 06:37:59 -0800 (PST)
Message-ID: <dd43197e-ff56-4adf-a413-03f63d5f5078@redhat.com>
Date: Tue, 2 Dec 2025 00:37:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] acpi/ghes: Error object handling improvement
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 armbru@redhat.com, mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251201131729.615abe68@foz.lan>
 <12b7baee-1d6d-440a-a119-971b47d7f3ad@redhat.com>
 <20251201153121.190c22ec@foz.lan>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251201153121.190c22ec@foz.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j3k5O__nsdt5ViEoEFWDO-sTVa7nbQvSK4OMjyuOoCg_1764599881
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Mauro,

On 12/2/25 12:31 AM, Mauro Carvalho Chehab wrote:
> On Tue, 2 Dec 2025 00:13:06 +1000
> Gavin Shan <gshan@redhat.com> wrote:
>> On 12/1/25 10:17 PM, Mauro Carvalho Chehab wrote:
>>> On Thu, 27 Nov 2025 10:44:30 +1000
>>> Gavin Shan <gshan@redhat.com> wrote:

[...]

>>>
>>> Btw, what setup are you using to test memory errors? It would be
>>> nice to have it documented somewhere, maybe at
>>> docs/specs/acpi_hest_ghes.rst.
>>>    
>>
>> I don't think docs/specs/acpi_hest_ghes.rst is the right place for that
>> as it's for specifications.
> 
> Perhaps not, but it would be nice to have it documented somewhere,
> either there or at QEMU wiki.
> 

QEMU wiki may be the best place for it. I never updated to QEMU wiki and
any guiding steps on how to do that?

>> I'm sharing how this is tested here to make the thread complete.
> 
> Thanks!
> 
>>
>> - Both host and guest has 4KB page size
>>
>> - Start the guest by the following command lines
>>
>>     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                  \
>>     -accel kvm -machine virt,gic-version=host,nvdimm=on,ras=on               \
>>     -cpu host -smp maxcpus=8,cpus=8,sockets=2,clusters=2,cores=2,threads=1   \
>>     -m 4096M,slots=16,maxmem=128G                                            \
>>     -object memory-backend-ram,id=mem0,size=4096M                            \
>>     -numa node,nodeid=0,cpus=0-7,memdev=mem0                                 \
>>     -L /home/gavin/sandbox/qemu.main/build/pc-bios                           \
>>     -monitor none -serial mon:stdio -nographic                               \
>>     -gdb tcp::6666 -qmp tcp:localhost:5555,server,wait=off                   \
>>     -bios /home/gavin/sandbox/qemu.main/build/pc-bios/edk2-aarch64-code.fd   \
>>     -boot c                                                                  \
>>     -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                    \
>>     -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                    \
>>     -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                    \
>>        :                                                                     \
>>     -device pcie-root-port,bus=pcie.0,chassis=16,id=pcie.16                  \
>>     -drive file=/home/gavin/sandbox/images/disk.qcow2,if=none,id=drive0      \
>>     -device virtio-blk-pci,id=virtblk0,bus=pcie.1,drive=drive0,num-queues=4  \
>>     -netdev tap,id=tap1,vhost=true,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
>>     -device virtio-net-pci,bus=pcie.8,netdev=tap1,mac=52:54:00:f1:26:b0
>>
>> - Trigger 'victim -d' in the guest
> 
> Hmm... from where I can get victim?
> 

https://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git

> Regards,
> Mauro
> 

Thanks,
Gavin


