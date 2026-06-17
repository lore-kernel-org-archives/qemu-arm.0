Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15BECD98E2
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Jun 2026 07:01:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZkGq-0000Bk-P7; Wed, 17 Jun 2026 03:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZkGk-0000Ao-R5
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 03:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZkGj-0003pV-3I
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 03:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781679659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3BICBUClixQXMJTgMkF5LaWaXjK8I3G91qlMnzL/7c=;
 b=eJxEpLMXXjyImSJnH0nn7e56IkwYoB600EUMny35Q/b8g/hzcc1FPK2DkEnojFBvKoQ9Yf
 oAe4EkB2bDNyeDkRVMDrSpb8KDuXqiyDm1sMnbrX6WXcbM+Bbzk7vmrWnZhnUKSaDRyQ4u
 TXkuBrOFcAHIkF/rXYA8rUhOuzN/kcU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-LCSkfYN0MyqFVx_9u7JFog-1; Wed, 17 Jun 2026 03:00:58 -0400
X-MC-Unique: LCSkfYN0MyqFVx_9u7JFog-1
X-Mimecast-MFC-AGG-ID: LCSkfYN0MyqFVx_9u7JFog_1781679657
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2c6afd85980so9175825ad.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 00:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781679657; x=1782284457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z3BICBUClixQXMJTgMkF5LaWaXjK8I3G91qlMnzL/7c=;
 b=dtl383uUZ146lybRad0xptxI3kc9IvRNgXYjU2KGYv+JVCjQDk47K3j2MsXpZTuM96
 uHILaF6lLkIt3q7YH30njKpjmWfunrMwmouqO5ETmv9MAdZvWsfoTqRt/nYCiia7lCG7
 NSfw7dOFbwgMSGVxETVbEl6NahvwaMjvhRLUBSAwj4o9VhxZ6sAvKQ3KD0rN9vK8zGCV
 5nLSewXcjipC7JWTmI3SZavAk81y7h1dogLiBawkJ6U44+9qQlGpUUQEtgYayIB6SxlI
 jjtQhvNBQIhhgSiuUwYXLn0qhgkLc+scB0UD5swFn0qTaHcxPUuDbetOCf/w/riotU2L
 jyWA==
X-Gm-Message-State: AOJu0YxjfbqP0mzX9PziAn/5hJbxrajt/0RYCvvYPTKXhSOrU1OfJ9x9
 yq6vnsI6+chavN3buMSJWyzBgGkE2GIYquLVB0L7YJnxYXZzC2Hc2ExAhp3HLu2psv4h90lR3dr
 CCBI7zfkU3mI40LqszgADkIsT6J5UNNy4KJ9U70yQk9AiHcekLdCHPw==
X-Gm-Gg: AfdE7clRJAwlNf79/ltatfQIiydhM/IokeD+u+WOowA6M5d7jHhTykevtSEGYWnxpZm
 PQ8v4+gW899uluEnLVrZFAoYAgX6jExGCyeX/IBONV5fDdjAVcZon1fETz3dNnaunPW+6ld4YRX
 sYXLxhVWypZJk8bEtenSZtxjLKIsy2yfzeDOkYqRzlqNcGuWPdkTtEpPOIxo0/IC93F37Psah0x
 jtA1CkbcGkQupAXyFwIaGapbzxm+9pk899IJgtpzfiDDWnxqmhfkEsA9HgUvtrIkA0m1MdTbu+Q
 pkmGFYP4aAm1EbSbSrYO+9GeLT4UiyolWit3ebwKRSJVkKcrezyoJz96V+ZlYURtiN04CY/xK26
 qx7jmfgo5Pnzc+3ZwcUp9Zz0Eoc0k7qvzfR/xWo6amuq841ip2eVPtA==
X-Received: by 2002:a17:902:cf0e:b0:2c2:cf20:213 with SMTP id
 d9443c01a7336-2c6bc248243mr23314645ad.29.1781679657007; 
 Wed, 17 Jun 2026 00:00:57 -0700 (PDT)
X-Received: by 2002:a17:902:cf0e:b0:2c2:cf20:213 with SMTP id
 d9443c01a7336-2c6bc248243mr23314115ad.29.1781679656475; 
 Wed, 17 Jun 2026 00:00:56 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e5590sm171623735ad.14.2026.06.17.00.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 00:00:54 -0700 (PDT)
Message-ID: <ee0280dc-0c21-44df-a1cb-94c580140491@redhat.com>
Date: Wed, 17 Jun 2026 17:00:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] system/memory: Make ram device region directly
 accessible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org, peter.maydell@linaro.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com
References: <20260616052552.389021-1-gshan@redhat.com>
 <ae17b5a6-eed8-4d4c-a798-cb92ffa6c915@redhat.com>
 <20260616014419-mutt-send-email-mst@kernel.org>
 <2015405e-7839-4ab9-b5a0-712b644da3c8@redhat.com>
 <20260617013709-mutt-send-email-mst@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260617013709-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5C-BRCZEa-tbvyM3Rej8_6tKcz2lE6RPCNKWJiCAd9w_1781679657
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Michael,

On 6/17/26 3:52 PM, Michael S. Tsirkin wrote:
> On Wed, Jun 17, 2026 at 12:35:00PM +1000, Gavin Shan wrote:
>> On 6/16/26 3:44 PM, Michael S. Tsirkin wrote:
>>> On Tue, Jun 16, 2026 at 03:40:34PM +1000, Gavin Shan wrote:
>>>> On 6/16/26 3:25 PM, Gavin Shan wrote:
>>>>> All ram device regions was turned to be indirectly accessible by commit
>>>>> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
>>>>> to a hanged guest where a NVidia GH100 GPU is passed from host. The memory
>>>>> in its PCI BAR#4 can be allocated as DMA target buffer. qemu has to take
>>>>> DMA bounce buffer in address_space_map() to cover the DMA request. However,
>>>>> the bounce buffer size is 4096 bytes and we're overrunning it easily when
>>>>> the guest has significant disk activities on compiling 'cuda-samples'.
>>>>> The full log and problem description can be found from PATCH[1/2]'s commit
>>>>> log.
>>>>>
>>>>> Try to fix the issue handled in commit 4a2e242bbb by replacing memcopy()/
>>>>> memmove() with newly added helpers qemu_ram_{copy, move}() that works on
>>>>> top of __builtin_{memcpy, memmove} or unaligned access friendly memory
>>>>> movement in the accessors to the ram device regions. With this, we can
>>>>> basically revert that commit to make ram device region directly accessible
>>>>> again and bypass the bounce buffer in address_space_map() where the guest
>>>>> hang is caused.
>>>>>
>>>>> PATCH[1] uses qemu_ram_{copy, move}() in ram device region accessors
>>>>> PATCH[2] makes ram device region directly accessible again
>>>>>
>>>> Michael asked to include below context in the cover letter in v3, but I
>>>> didn't noticed that before I sent v3 series, appended with them.
>>>>
>>
>> Looking at the list of issues (questions) raised by Michael, I don't understand
>> every one
> 
> Gavin, I doubt one should make memory.c changes without understanding the issues
> it is trying to address.
> 
> What is unclear? Ask away.
> 

Yeah, absolutely. I need some time to understand all questions or suggestions
by digging the code a bit, before I'm able to come back to you, but not very
soon though :-)

> 
>> before I'm able to put more time to dig, but I feel this series has
>> too ambitious goal to cover accesses to all the directly accessible regions
>> with the newly introduced qemu_ram_{copy, move}. It causes too many behavior
>> changes and concerns, making this series impossible to land.
>>
>> I would suggest to break down the goal and step back to apply the newly introduced
>> qemu_ram_{copy, move} to the ram device regions only? It's actually something
>> proposed by Peter Xu in the earlier replies. Taking address_space_write() as an
>> example, the indirectly accessible regions are covered by memory_region_dispatch_write()
>> in (1), the ram device region is covered by qemu_ram_move() in (2), and all other
>> directly accessible regions are covered by memmove() in (3).
>>
>>    address_space_write
>>      flatview_write
>>        flatview_write_continue
>>          flatview_write_continue_step
>>            memory_access_size             // (1) indirectly accessible region
>>            memory_region_dispatch_write
>>              access_with_adjusted_size
>>                memory_region_write_accessor
>>                  mr->ops->write
>>            qemu_ram_move                  // (2) ram device region
>>            memmove                        // (3) all other directly accessible regions
>>
>> With the limitation, only the ram device regions in (2) are affected. We're
>> basically moving the accesses to the ram device region from (1) to (2). No
>> changes introduced to other types of regions. The goal is to make the ram device
>> region accessible so that the bounce buffer can be bypassed in DMA path.
> 
> Esthetics aside - ram device regions have all the same issues.
> 
> Maybe you can limit the scope of the changes,
> but I doubt you can get out understanding)
> 

Yes. Limited to the scope of VFIO and PCI BARs, it depends on how the PCI BARs
are mapped, pgprot_noncached or pgprot_writecombine. The listed problems and
concerns are existing on the ram device region exposed with pgprot_noncached.
However, everything should be just fine if the region is exposed with pgprot_writecombine.
Am I understanding this correctly?

[...]

Thanks,
Gavin


