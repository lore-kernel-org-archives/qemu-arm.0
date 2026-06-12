Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18248CD98D8
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 23:35:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYBPI-0000lh-J4; Fri, 12 Jun 2026 19:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wYBPG-0000lL-A9
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 19:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wYBPE-0007VQ-Nl
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 19:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781307318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNC+ZgjL7TXzhh5eX1Rz2Ygkx6ktozTkZMaMpEWA9co=;
 b=ZYvRG6GSMyo9JdLp+qDlah3a2lToufqiImKOYhHm47cpfeoCDjGxCNRymsWljn4sXGAEjZ
 e/VoTBZtoYYEZtDgAgnHN5MjYZheTi/ntwTr3rTAg6CPYnt4YuK4/T5U6wqJVMnelk09T/
 mFnXbbqo+5u2Es6zvW8KcEET7TxH0gQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-9o6BUWOcP_69i0LrOKpNDw-1; Fri, 12 Jun 2026 19:35:17 -0400
X-MC-Unique: 9o6BUWOcP_69i0LrOKpNDw-1
X-Mimecast-MFC-AGG-ID: 9o6BUWOcP_69i0LrOKpNDw_1781307316
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2c2d0a8b5beso15898065ad.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 16:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781307316; x=1781912116;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RNC+ZgjL7TXzhh5eX1Rz2Ygkx6ktozTkZMaMpEWA9co=;
 b=IZqmIQbRgKrtPVHCDXRe7GTZiqeT43Z08CGESQSvzoJ4CMCwVQjjTZQOC8HAYq3N2v
 dsHVLvM5djAb5q1R9g8Aps71WHQWFYoherTmLtQjE9tJPlR7mwoMsBbfmLdoKOMsBXyC
 do/5bL7tgRv60gSP62m8v8pVMsOJ7RgvD8ou+hhdHlGinwl1CYjP9iGM0b79zOr9F8xF
 Gnj4qLz064vZRtbMDYgq7fY3cyrazJyZodc9qDUZRuUXnFFNGQYAa33bbW7gPOGlXs3G
 KeLU0T8Smz/jKpzZCOSuqtVgyOweZhyaIYiqujg080z9+VzhZBSxxIQObYuqDiEiNAUv
 BktQ==
X-Gm-Message-State: AOJu0YwKgIv7oE+MFe8be7Duj0adDWE+p/C8k1hETbzp6W3dPPAGrkDM
 VcNMMJdZZ68OdT0r4KV1YcfLrcOwJ7NXYF8VwN36iA8CUDcAaXoFjKP8NBoTM1CQVdXGQLWHUJd
 DG/lx3WoNxILIJASDKuVUO3MCRKkEdBnhz2+S3s0SblMWnVAg2g1pByhVM8Au/Lx3Bob9A3K50f
 0yVgOpk2fSxZnubC4am+vHcXn+QppTy/bf3Q==
X-Gm-Gg: Acq92OE9NP/V4n5QCNUvGnNvwFCPqKARjDnM6+b3/cVewbaP0lwx/IaXfbHWYheyk6C
 hgQtpohHI5Ve2Q19xiJIVH+4x3hqTrdu0meO/8J4gSFexUOY/YOgt+zjY5VsyEQEKh8/F2z0XPq
 FQ6U+UktXncQkGd+j2iTwg5/DTN/6m0uYm7fxAjba3O5IEzJzKMqgvhVs1xvUH+1H9T3EPCzKAj
 cg6kbxm5Licp1Pb++9pfRoiDL6eP5BcbgM2jG2tn2ZdSV+1VG1S+C66b0soC+yr50tFjr2pImIf
 xLHXe0I7eclNSyaweseRzU9I+xvOfzCUv9IjzIyf3e2Og5XY4FwbyVevq/Ibyvfyd3YesFCTxyd
 Nt08+dWSqM2bCNEpALSbzaNvLHhRzVB98/kIUY6bTUkv2DmjpRS+aLGlLT8tjVcYs
X-Received: by 2002:a17:903:2f89:b0:2c1:8fea:4dbf with SMTP id
 d9443c01a7336-2c4104113a0mr53580885ad.8.1781307316064; 
 Fri, 12 Jun 2026 16:35:16 -0700 (PDT)
X-Received: by 2002:a17:903:2f89:b0:2c1:8fea:4dbf with SMTP id
 d9443c01a7336-2c4104113a0mr53580415ad.8.1781307315488; 
 Fri, 12 Jun 2026 16:35:15 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4327ac631sm31167195ad.44.2026.06.12.16.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 16:35:14 -0700 (PDT)
Message-ID: <311f0568-facf-49de-83e8-7844f5c60e29@redhat.com>
Date: Sat, 13 Jun 2026 09:35:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] system/memory: Make ram device region directly
 accessible
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peterx@redhat.com, mst@redhat.com,
 peter.maydell@linaro.org, berrange@redhat.com, david@kernel.org,
 alex@shazbot.org, clg@redhat.com, pbonzini@redhat.com, philmd@mailo.com,
 phrdina@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn
References: <20260612110307.1264798-1-gshan@redhat.com>
In-Reply-To: <20260612110307.1264798-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u3U9NGpRTJFzuHYQf-ZVHbcBXIO4XVwkhjL18A82rts_1781307316
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

[Cc Liu Gang and Ding hui]

On 6/12/26 9:03 PM, Gavin Shan wrote:
> All ram device regions was turned to be indirectly accessible by commit
> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> to a hanged guest where a NVidia GH100 GPU is passed from host. The memory
> in its PCI BAR#4 can be allocated as DMA target buffer. qemu has to take
> DMA bounce buffer in address_space_map() to cover the DMA request. However,
> the bounce buffer size is 4096 bytes and we're overrunning it easily when
> the guest has significant disk activities on compiling 'cuda-samples'.
> The full log and problem description can be found from PATCH[1/2]'s commit
> log.
> 
> Try to fix the issue handled in commit 4a2e242bbb by replacing mem{cpy, move}
> with __builtin_mem{cpy, move} in the accessors to the ram device regions.
> With this, we can basically revert that commit to make ram device region
> directly accessible again and bypass the bounce buffer in address_space_map()
> where the guest hang is caused.
> 
> PATCH[1] replaces mem{cpy, move} with __builtin_mem{cpy, move}
> PATCH[2] makes ram device region directly accessible again
> 

Liu and Ding, Could you give this series a try to see if your e1000 issue gets
fixed by this?

   https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/

> Changelog
> =========
> RFCv1 -> v1:
>    * https://lists.nongnu.org/archive/html/qemu-arm/2026-06/msg00307.html
>    * Reworked solution based on suggestions from Peter Xu, Peter Maydell
>      and Michael S. Tsirkin
> 
> Gavin Shan (2):
>    system/memory: Use __builtin_mem{cpy, move} in accessors of ram device
>      region
>    system/memory: Make ram device region directly accessible
> 
>   hw/remote/vfio-user-obj.c |  4 +--
>   include/system/memory.h   | 53 +++++++++++++++++++++++++++++++--------
>   system/memory.c           | 41 +-----------------------------
>   system/physmem.c          |  8 +++---
>   system/trace-events       |  2 --
>   5 files changed, 50 insertions(+), 58 deletions(-)
> 

Thanks,
Gavin


