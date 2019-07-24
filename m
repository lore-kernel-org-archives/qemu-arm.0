Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9536451wrv;
        Wed, 24 Jul 2019 09:29:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxwNt1ta8OLd0MIH/89VdkcC4I0enzU3myh06Ocdd8WuzVne1h3vDcKwaFzFZMOjbxQQBh
X-Received: by 2002:a17:906:6986:: with SMTP id i6mr62797262ejr.89.1563985782303;
        Wed, 24 Jul 2019 09:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563985782; cv=none;
        d=google.com; s=arc-20160816;
        b=lfja2GUgVRjA6xZgsRsU0FjGMK+IBccR4kzRoJ5BeuBO0e6PP+2WdDc7M+2jKhjAI9
         P3fc3cDxsYvtLBWSsIZpudZ9sIhmr9/FSXUeU8IFqyBY9JhDOhnGnv5CZvdzQIBKTglw
         3Sn79LaeU1OP4Ya7uDzYXxiKz3ioHsIFfSIR2A8xEgaeIdSnfhXTQsGgkRxHYRVp60V6
         O71m0x+R/22KW2hVcBSI1wLfeyhbahcVY5cIt4g+hLFzN1Y0oR7ih8kosm1q9gLOIl4l
         j3i8fVX5wUaEj92t7Qb6vwauVjjmdoKQbtIFObIpCH5ojD+XAoeyhJM8g3PyZdA+zEXt
         4Ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=bi5uuK4E3SiCQjAaND+HEnfn2kFlpninBwFMtriLa/8=;
        b=cy60ffr5whj1e8BvOZpWAhHLNy/qcQYkv4h0xLMcxSseXaNttNkYtYnIPigoUHgUU7
         Pxw6gSN5i8t7yDNrmC8rmckgJX9Jgb1wulwQkgX4y9lWQa1cUx1dgDGissytDbSiq/1X
         nIUba7qlSbnrD+CkmwpDaWCdsnHfhM9FrceN09fV0qO2lWko9pV47t70jP1alIs2hZpe
         rT2i3/FrxW01b9FvEhBcYuoa75Z3GloqAsCIRZF8Xatvvjfi8+IZsnpYF5sANQmnEL1P
         Ll8HkYFFlbkYJI6oA9IqyOf/E5L+tNApiuHjYTshHw+UmnU16AAhJUY7A4Zjn7j1p/Nr
         iWlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21si9676960eda.23.2019.07.24.09.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2019 09:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqK96-0002en-Ov
	for alex.bennee@linaro.org; Wed, 24 Jul 2019 12:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35621)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqK92-0002cl-Ad
 for qemu-arm@nongnu.org; Wed, 24 Jul 2019 12:29:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqK91-0006xM-6V
 for qemu-arm@nongnu.org; Wed, 24 Jul 2019 12:29:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqK90-0006v1-Vd
 for qemu-arm@nongnu.org; Wed, 24 Jul 2019 12:29:35 -0400
Received: by mail-wr1-f67.google.com with SMTP id x1so32687561wrr.9
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2019 09:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bi5uuK4E3SiCQjAaND+HEnfn2kFlpninBwFMtriLa/8=;
 b=DKJXP9Fu3lFEySRuqB2nXqLhprHuAwZTG7py6OxKJASVlxsNzRvXDWUeauApjpCPjh
 4hQleVVZTVC+ZzniwdXKUlCEPL+10SU4/h1BEoYJTtYQ8W9Hy507OCPpCdkdan1yZrA3
 oI9aiczp/3maEQ70Nm4R4Zz82+gnEOgzXrFCMiWdO+PkJdrA9cxRwNw7E8wYbhpsbSXh
 snDGiQ1FgZNqyYrAptVC2/dzOPe2oL7V9Tsu3A9YOmON2qWN5g22ad5ZGFscuTiPZ5MA
 IgD+b0bhKnR/OImG3TqXUBeUz+eQTKFLL9QmEaSGEDcs9LeWpV0EFEF4AIlaGfwVCG2L
 J7/w==
X-Gm-Message-State: APjAAAUakrb2jX534nvXWo8G8ZMvoMHUaWzTKdnX4vHMTera3c++g0rN
 Ic0k/CVvmOD6D0aapahCGPsB4A==
X-Received: by 2002:a5d:6949:: with SMTP id r9mr84034982wrw.73.1563985773943; 
 Wed, 24 Jul 2019 09:29:33 -0700 (PDT)
Received: from [10.201.33.105] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id v124sm49659643wmf.23.2019.07.24.09.29.32
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 09:29:33 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20190724143553.21557-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <543de194-b4e9-de7b-3dab-55fcc0976bc2@redhat.com>
Date: Wed, 24 Jul 2019 18:29:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190724143553.21557-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 4.1?] pl330: fix vmstate
 description
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qzS4q+ooCG90

On 7/24/19 4:35 PM, Damien Hedde wrote:
> Fix the pl330 main and queue vmstate description.
> There were missing POINTER flags causing crashes during
> incoming migration because:
> + PL330State chan field is a pointer to an array
> + PL330Queue queue field is a pointer to an array
> 
> Also bump corresponding vmsd version numbers.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> I found this while working on reset with xilinx-zynq machine.
> 
> I'm not sure what's the vmsd version policy in such cases (for
> backward compatibility). I've simply bumped them since migration
> was not working anyway (vmstate_load_state was erasing critical part
> of PL330State and causing segfaults while loading following fields).

I still not understand versioning and migration, so I can't say, but
then you use the correct macro, since we have:

    s->chan = g_new0(PL330Chan, s->num_chnls);

So:
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>

> 
> Tested doing migration with the xilinx-zynq-a9 machine.
> 
> ---
>  hw/dma/pl330.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index 58df965a46..a56a3e7771 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -218,11 +218,12 @@ typedef struct PL330Queue {
>  
>  static const VMStateDescription vmstate_pl330_queue = {
>      .name = "pl330_queue",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
> -        VMSTATE_STRUCT_VARRAY_UINT32(queue, PL330Queue, queue_size, 1,
> -                                 vmstate_pl330_queue_entry, PL330QueueEntry),
> +        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(queue, PL330Queue, queue_size,
> +                                             vmstate_pl330_queue_entry,
> +                                             PL330QueueEntry),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -278,12 +279,12 @@ struct PL330State {
>  
>  static const VMStateDescription vmstate_pl330 = {
>      .name = "pl330",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_STRUCT(manager, PL330State, 0, vmstate_pl330_chan, PL330Chan),
> -        VMSTATE_STRUCT_VARRAY_UINT32(chan, PL330State, num_chnls, 0,
> -                                     vmstate_pl330_chan, PL330Chan),
> +        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(chan, PL330State, num_chnls,
> +                                             vmstate_pl330_chan, PL330Chan),
>          VMSTATE_VBUFFER_UINT32(lo_seqn, PL330State, 1, NULL, num_chnls),
>          VMSTATE_VBUFFER_UINT32(hi_seqn, PL330State, 1, NULL, num_chnls),
>          VMSTATE_STRUCT(fifo, PL330State, 0, vmstate_pl330_fifo, PL330Fifo),
> 
