Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3ACC55165
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 00:14:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpath-0000oW-If; Thu, 30 Jul 2026 20:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wpatf-0000o9-Vq
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wpate-0002qM-6m
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785456881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJJbPYCO1KgBGuvg+Sp+bCrDLZrTUzSVFbz8NihyqqA=;
 b=XfLQvfzemiToVgBk/5fBQafngswqZI/aEKnFZvCZ/BJQiM9277kC6lteGVxgM3+L904B8g
 Sb8OyPhqYi0s/+7qxdVM9KJ+JO8dmubzzCOWTVB52SFrsD52PMTBcCOdfQob0WlOaM2ccv
 KW4MuaPoqt0JtoC/ux0HOFuKIoFnYHU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-1V6bpCihNRa8mghMC96KJA-1; Thu, 30 Jul 2026 20:14:37 -0400
X-MC-Unique: 1V6bpCihNRa8mghMC96KJA-1
X-Mimecast-MFC-AGG-ID: 1V6bpCihNRa8mghMC96KJA_1785456877
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-84870e7f498so442507b3a.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 17:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785456877; x=1786061677;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kJJbPYCO1KgBGuvg+Sp+bCrDLZrTUzSVFbz8NihyqqA=;
 b=OSBcJUqsLnQvWaQtF5sW/3YqIgJGJvfKPtGNW38VxBqjgFHAWlnNmH40Otli/Ie69k
 HMtOUOnBalkQB3bAPjXpCSb82YJzciGv/cs5iEUx/wLgwf3X3WOoGk9PsnxDJtay4D83
 9Ynz533dtbwEtquB/QGynAlFLEJ2vN4y5scvfnJVJrJDD0/hwOpSkUDxGP7DuroXSvOH
 FHvC3ekUv8ACJP+x+q1UVAVZMtx9WPm5hPBHi8IbLmm5DlyeGMiFjWcD4YmlNsmMTb+p
 GbYfGzIIrloOTIzlQWHmb7ZFlHGcN4AXv3Lhao4eoXvREEWieneM981PJ5Bc0egsUSSx
 Zwfg==
X-Gm-Message-State: AOJu0YyVVjHaNO34wdytecvW6H4YlwWGvdz9mgbVTCdQVE9oOHM0dBOi
 OkDEiMHhjCJlxNgfTKweYFmqMpgbVLyQzkbcEbeUNfkpgSaB2BWhF4EZtmjklhayAWtKFdNO9zn
 YItxb59ssqkIYBclgyOEe97mzvCyE5r+vgbhiThUTQoVce9n+YM44qg==
X-Gm-Gg: AR+sD13UVcbaTpJsogQ/oQ1Pg/L++7lu10urM5mFkRuwyrm94Jg/cTNC9jPNaTdaWiD
 ivrAw6JoKkBoXi0AOb57qwaCRczYgZNMR7MBwmHBjXiVhWK6j7ZgXHgPwG6HKX+IbMyHKKXnpx+
 Medg0jqIv3jlI/9hrMMFGKrANZo9AV/gLhrW+pWa8n/4UdZJmeUa2wuCqt7q2kAKb544LUwdss3
 i1X2G9MALh1My5bhosrGj1OE+J0uPRjqyQnPwK7p52T9epyLuFlGS0Y5vcD/DW9yAlWPGGc52Vk
 O0u0Gxa/R06pTpGWRldZkGg/xSP49eKSfvZ3RUZIM2gGN6zw5ipMmXTTNV+lzMPC4pZDItubIFc
 nHvmJ7aOmNhJRzc/Z6L5DsL/wQL8W8c2DjcJ12i7WUXQ=
X-Received: by 2002:a05:6a20:db90:b0:3c3:ca18:b4a4 with SMTP id
 adf61e73a8af0-3c9008abe14mr4318242637.43.1785456876794; 
 Thu, 30 Jul 2026 17:14:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:db90:b0:3c3:ca18:b4a4 with SMTP id
 adf61e73a8af0-3c9008abe14mr4318224637.43.1785456876370; 
 Thu, 30 Jul 2026 17:14:36 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31504baa01dsm27389614eec.12.2026.07.30.17.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 17:14:35 -0700 (PDT)
Message-ID: <be2ac432-f166-4fc3-abf4-10824560f3e6@redhat.com>
Date: Fri, 31 Jul 2026 10:14:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 philmd@oss.qualcomm.com, richard.henderson@linaro.org, alex@shazbot.org,
 berrange@redhat.com, philmd@mailo.com, david@kernel.org,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
References: <20260728031731.286666-1-gshan@redhat.com>
 <20260728031731.286666-3-gshan@redhat.com>
 <20260729182316-mutt-send-email-mst@kernel.org>
 <CAFEAcA8nxsXNPuqOoc4DGnHbCKQ-pBJib4JhXnYkzMg79GMfAA@mail.gmail.com>
 <20260730062155-mutt-send-email-mst@kernel.org>
 <CAFEAcA_xWqomb6jPf_9RmAfaf77uHajMkQk4biOcK3xR+Rgunw@mail.gmail.com>
 <3da739fb-cc3e-42ed-ae7c-46afa38151ab@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <3da739fb-cc3e-42ed-ae7c-46afa38151ab@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wshsRf1sS76cqylZJXSXlAfXiexOZzeVNILUtQ5TMDA_1785456877
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 7/30/26 8:50 PM, Cédric Le Goater wrote:
> On 7/30/26 12:34, Peter Maydell wrote:
>> On Thu, 30 Jul 2026 at 11:27, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Thu, Jul 30, 2026 at 10:24:32AM +0100, Peter Maydell wrote:
>>>> The idea is rather just to ignore the unaligned-access-to-not-RAM
>>>> case as "only a theoretical issue" and default it to memmove().
>>>> If anybody reports an actual problem we can think about it then :-)
>>
>>> Well given the only reported case of virtio DMA into vfio memory we have is
>>> GH100 and that one is mapped MT_NORMAL, I'm fine with that.
>>
>>> I feel extending vfio to report the mapping type to userspace might
>>> not be a bad idea down the road, though. "Directly accessible"
>>> is a very rough approximation to the rich variety of mappings
>>> available across architectures.
>>
>> Yes, this sounds like a good longer term idea. If userspace doesn't
>> have a way to know what the mapping behind something it's mmap()ed
>> is then it can't know what operations it can and can't safely do.
>>
> Gavin, didn't you have the idea of using a VFIO region caps for that ?
> 
> This is similar to what we did on POWER9 with :
> 
>     VFIO_REGION_INFO_CAP_NVLINK2_SSATGT
> 
> which exported GPU RAM to the userspace too.
> 

The idea was initially proposed by Michael in the comments for (RFCv1)
patch of inheriting the max dma bounce buffer size from the parent [1].

[1] https://lore.kernel.org/qemu-arm/20260610121026-mutt-send-email-mst@kernel.org/

We can't simply call to glibc::memmove() even it's known that the MemoryRegion
is mapped through MT_NORMAL due to issue that one-byte stores have been translated
to triple one-byte stores by glibc::memmove() in glibc-2.24+ for aarch64 [2].

[2] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn

Besides, I guess we have similar issue on those MemoryRegion created by
memory_region_init_ram_from_{fd, file}. At present, those regions are assumed
to be regular RAM (backed by MT_NORMAL). The assumption isn't always correct.

Thanks,
Gavin


