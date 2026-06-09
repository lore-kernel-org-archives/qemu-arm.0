Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40ECD8C9D
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 02:09:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWltZ-0007yn-DF; Mon, 08 Jun 2026 22:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wWltX-0007yX-8E
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 22:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wWltV-000757-KH
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 22:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780970923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4v33umGdgm2QnITjy1hxJKHFbQtMz9zglZApgzaBUQ=;
 b=PlShw1D1rgDq4xYM2rOHC86X4tuKEdR/Rx9EU9IfhCWOCtELDJYgJZoREw1K+9bnin/YGr
 JCU61GlESZ50iUgrgwUROinRu4IN+cyMMR6zOBhhNO8Ni+GATxcNhSdnRic37Ds0K2KSl+
 zs6zUwRwN4hlfr206Dx/Ehtb3Gaw8+Y=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-vGcCS5oeOReAGM4X4VcyDA-1; Mon, 08 Jun 2026 22:08:42 -0400
X-MC-Unique: vGcCS5oeOReAGM4X4VcyDA-1
X-Mimecast-MFC-AGG-ID: vGcCS5oeOReAGM4X4VcyDA_1780970921
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2c0c1e112dfso69399045ad.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 19:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780970921; x=1781575721;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4v33umGdgm2QnITjy1hxJKHFbQtMz9zglZApgzaBUQ=;
 b=devVomyPt2q6fq9QHndNJnfduWfcGJJV+LtVW5Kqam9JrtQzV0tnBTeNKi0qrOs6Z4
 yYRw6tWk15T/K2hbGkORv/GWCoTHswGry5VaV14BfjHbIhKAdZgIwCvs/1qmS+81COc+
 gsqd1IlOO0dyy8RtToHCtUCQtKdrWPYKVMLhRb+tKxWOZv/UQag7NDPOyI6vPxaXgLQS
 iqy+qtvHUOlPxOGZyz8OCJUruBHu3kfMw4LwZplrPMwF2bBlVX1FCXSZ4FAWlqefAOeY
 2EEb0a3Jlnf1kzWUzQD+YLajxZDuGQrlKE9zkZVvMkQT05WAi45BaBgO6CyWacD69YnD
 Ex5w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Vm5CKnp71LgE2UpWaaD95hq7sJjQlZ94/4xEKsXk34VxWIk2TVpRQ1z7hvLtlE9BRIi7Fx1fllw==@nongnu.org
X-Gm-Message-State: AOJu0YzZ6hFyGggr+FRLMA2sYF4PFLdfWpMoJUdmrpLH6JxVxMOWnLxP
 58STKYU+SywofE08EfbkILrfWOwTQqqRrec4k2pNK9CKzMb9xmE5XRaPi/JwBiRGbRSOs0/R9b7
 WIE/Ck/pbKsjFGGiGs8rc6wO3UZfwhuOQ46vQDLrPsaFrUcbSJW6oyA==
X-Gm-Gg: Acq92OFsU9RXlFAeDTzeoBPR3L9RyqO03wRT2vHgwDr6IQJrfp16MbCd/psk9QJ7otq
 g3zMpGrInNQOiYR9eElrYEqaxkUEytOmq1x/ZBIs6wU557hv+bwyaCbEbHHqEtb9ZwfOsV8eBn/
 7qnorMzjboABa2c8OXuqBVWTLEkH7mKhNJPyWj/BNQr5O1/xeyV+VPWj/cBq1NRFjLmDeWaJ0f/
 tnNJA1MFGNIjdDDYrOF3vZyQiRcPBdvFxcsol892q1PJ2O3447lXGV9Y1saDfcuVQwsWORB7Mj/
 h02tmGYjgN+GeUsW1owvG/ejp+8svK0yDyrWda/t3zNc88SvbFEARo65e1qqc9zJE6T9CKsXbCd
 WRbYZylOxdiAZt3GrH2yPABHTP7+L5kHu/zC59Dp9gUZ1slqf83OQyGu6WDSvisfN5IQaUQC5EC
 I=
X-Received: by 2002:a05:6300:6705:b0:3b4:6af4:bd9e with SMTP id
 adf61e73a8af0-3b4cd0801efmr23481374637.43.1780970921124; 
 Mon, 08 Jun 2026 19:08:41 -0700 (PDT)
X-Received: by 2002:a05:6300:6705:b0:3b4:6af4:bd9e with SMTP id
 adf61e73a8af0-3b4cd0801efmr23481330637.43.1780970920640; 
 Mon, 08 Jun 2026 19:08:40 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df0b56c5sm16986971a12.27.2026.06.08.19.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 19:08:40 -0700 (PDT)
Message-ID: <21664978-9a01-4ff5-8213-5bd5d93750ae@redhat.com>
Date: Tue, 9 Jun 2026 12:08:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 mst@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com
References: <20260608001821.850921-1-gshan@redhat.com>
 <aiaDgG26a6TUrKuM@redhat.com>
 <07ca74b4-52a8-4187-a57c-7c3277e574d3@redhat.com>
 <aiapywnJY64G7nUK@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aiapywnJY64G7nUK@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LQxQK_2mW4ZtMiPNVfpxPgO7LpQ5tjGPK8zGYqeY_Uk_1780970921
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/8/26 9:38 PM, Daniel P. Berrangé wrote:
> On Mon, Jun 08, 2026 at 09:11:50PM +1000, Gavin Shan wrote:
>> Hi Daniel,
>>
>> On 6/8/26 6:55 PM, Daniel P. Berrangé wrote:
>>> On Mon, Jun 08, 2026 at 10:18:21AM +1000, Gavin Shan wrote:
>>>> On the guest where a NVidia's GH100 card is passed from the host, the
>>>> guest system hang can be observed on attempt to compile 'cuda-samples',
>>>> as reported by Julia.
>>>
>>> snip
>>>
>>
>> Thanks for looking into this.
> 
> NB, I didn't really look into it beyond noticing the suggestion
> that users set an "x-" property as a proposed solution to failing
> to boot, which raised a red-flag to me from a usability POV.
> 
> I don't really know anything about the underlying technical problems
> here, so can't offer specific guidance in that area.
> 

Ok, no worries, I got your points :-)

>>
>>>> By default, the max bounce buffer size is only 4096 bytes, even less
>>>> than one page when the guest page is 64KB. This tries to fix the issue
>>>> by inheriting the customized max bounce buffer size of the virtio bus's
>>>> parent through property 'x-max-bounce-buffer-size' when the customized
>>>> size is a larger one. With this applied, no guest system hang is seen
>>>> with '-device virtio-blk-pci,...,x-max-bounce-buffer-size=268435456'.
>>>
>>> "x-max-bounce-buffer-size"  is an experimental / unsupported property.
>>>
>>> We really shouldn't be expecting users to have to set this in a production
>>> deployment in order to stop a guest from hanging.  Even if we dropped the
>>> experimental marker from this property, users would still need to know to
>>> provide this magic setting, so it would still be broken out of the box.
>>>
>>> How can we  get a solution that "just works" out of the box, which is
>>> fully supported, not relying on experimental properties ?
>>>
>>
>> How do we know that "x-max-bounce-buffer-size" is an experimental or unsupported
>> property? I guess the properties whose names start with "x-" are all treated as
>> experimental and unsupported?
> 
> Yes, any QEMU property starting with 'x-' is experimental/unstable/
> unsupported and can be changed/withdrawn at any time.  Libvirt will
> not provide any way to configure 'x-' properties, as it requires a
> supported/stable solution from QEMU.
> 

Yeah. Apart from the option of adding a new property to MachineState to disable
the check on the max bounce buffer size, we also can make this existing option
"x-max-bounce-buffer-size" official and officially supported by renaming it to
"max-bounce-buffer-size". Lets see what comments Michael or Peter will have.

> With regards,
> Daniel

Thanks,
Gavin


