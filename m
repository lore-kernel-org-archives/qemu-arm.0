Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1656796njc;
        Sun, 15 Jun 2025 22:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLHioHlvNzcPTpuAI05kV7H1LQPo8FMGYo4pl/yPMV82uQGQXs6thvsoRUpb+M837k+A5goyexbrTqVw==@linaro.org
X-Google-Smtp-Source: AGHT+IF3XbZI6MpZl971vqJQVcK4edGKiMeAWN5UG8q5dIGUCl+GJ7G+ybccCNV4Nl5PuQ72BlvQ
X-Received: by 2002:a05:6214:5014:b0:6fa:fddf:7343 with SMTP id 6a1803df08f44-6fb477784fbmr125079636d6.23.1750053203097;
        Sun, 15 Jun 2025 22:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750053203; cv=none;
        d=google.com; s=arc-20240605;
        b=hbJuqFdrZFV31gnd59bnPG4tOjh2qJRWot1909sEBMv62bEFCDrxr/+ImPOAZEZ+Xp
         jrPhfPs2kayuqK1n25Ryo7MDqJ6K58dnHijuKmwgtBE7Q3MTYSV2nBjoQxG4JVnZ+WA9
         9DIZpBqB6x5fqJNNOUIfRlMzcO/OaW678dHDvU3TtFsGFtrQOx/a3YrECUa8dfiGDrYo
         +JgOM2MsEX1k0qhoswJXeLwAuAqkhsvJeSoFcSw0q1jLJS6vdQ6ehoMaYhFfwNJJZNKZ
         VhiSrZOFTZAOsXs/6oByjfj7dRh5U0y2+lIYw3rvTu+WE/GRqjNbTAo04UhhFJe4C+yS
         7pUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UOfaEfhJ/48hisRsb95ucnEsFMeLGglLJnApf87mZaY=;
        fh=ETSlHPkD28Q0/yCHSvIuK9dS4YAkL/CGdlSntGp0qKs=;
        b=eOLKP1NH74JqfKa5/oCljkrBbQJuazZa38DsWnyZB9taX0TwZOB6hpvxH5R1QcTqe/
         DZNHtmCDDi15jlRxI96ghm1jzS+8lDgWHbwXcWj7TMeYF/t6oOQMcX2Y9e4zXQx9gZlo
         p3WbKBklxAK/chKLvHmFuFv21+Ibj0c86W97q5P1Nm6G/Ekxl1NSEnnNljDMFfagRMOy
         3bm2jwQRZIynunBzicKZ/q72efPjz2/LMW0K6OGWPP3tGlJzLCCPAxZMMee2dddX25b4
         NoKtKIj2CTRotYWvuzRKCzAsDQ9LZdaf2mzChYYolu7HYFf3aj01iz4gbHW3Bgn8RRUw
         TgCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f5nTJGee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb4fe7bad4si39694056d6.439.2025.06.15.22.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jun 2025 22:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f5nTJGee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR2m5-0003yS-0w; Mon, 16 Jun 2025 01:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uR2m0-0003y0-GG
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 01:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uR2ly-00005A-RA
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 01:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750053166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOfaEfhJ/48hisRsb95ucnEsFMeLGglLJnApf87mZaY=;
 b=f5nTJGeeejnhsOHgOJyj3Gq5c3uQmSr27/BWNJ1JkVACwE1/JdKpxpzKAP8kRwqsJQMSS5
 EqaKcyKvu7/S5FA7a0oxfwz2BHzZMqtW7IxGRJRdqvTbq51ijqmEXGRu3KS+cI8+yVmaab
 jOB4pUHTOx3G/AjR0HzxzcwXNxfAu5s=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501--DAnAFRqOwyHJV6xYXFK3w-1; Mon, 16 Jun 2025 01:52:42 -0400
X-MC-Unique: -DAnAFRqOwyHJV6xYXFK3w-1
X-Mimecast-MFC-AGG-ID: -DAnAFRqOwyHJV6xYXFK3w_1750053161
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234fedd3e51so37175715ad.1
 for <qemu-arm@nongnu.org>; Sun, 15 Jun 2025 22:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750053161; x=1750657961;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UOfaEfhJ/48hisRsb95ucnEsFMeLGglLJnApf87mZaY=;
 b=gRyim8dAy0/PEmYfAo44dI+DybRnnNcOfvAwQZslqIH7ntJXv+k6ZVctUc15ABvr6A
 ZnpJb/3NYZdxPby8v87u6EhSngkemwZM5via/B//h7fLeEV9rs/HS1VF+sIuiKtSjlKM
 rovlRkZr4P31YdTCR3pAaKOPSpqLMEKVaZiQksDiCT9W2VUWkHmENyXT3kfFlktfvLBA
 2cNLz7OLg+cOV8sttzjEzBsUnZVdsu5R+suTbASQ+/3L3fOJLSTim3YX4PWc5bqx6i7G
 E5g3o1KXRPf+wVwncHzSHDRf2MTWT4j7Mwvp/ewdIHjqOWdUqd8qehGN1lZ/TNq1oQLm
 xWog==
X-Gm-Message-State: AOJu0YzSFkrmRzY0f5rQZh5tWBd7tOMKr7YIH6KdfInJDl2jEqBPREVm
 EJPsLiP0zNXSUwjVoIIs/aLqzVZeVzZhGzIe3mxsE/QXyWJWW76/ygXkURg8A14t6OKwQCOi6fW
 wq8GvgsCmtrGGOMVNaQszZI/DBVUbzHf7sPpBPf78hB8yiC9/O0UYE78UM0Bdog==
X-Gm-Gg: ASbGnctbKpmGPGvMYMZoO0e98yUk3dKi8ViEMJyU8kug2QO6axUsaWT4aatIm6V2UyQ
 jihzbEmx2gAPxYkeempyaiUhMCc/oFp2/xZMsbNNYYtC0yNo3tiYQStyjuhdLRtPbH233/alvNM
 8ble6a9Z+xfUY0Og81d/2qvWgoFdyohHFD80E7rL1I0tn2PhDgZpLjx9+wiaiPYDu0H9LA4xHoC
 ywZtJgKPOCnL/t8RzMC4ce88dFBfU4QzQ0kFiix4PUxz2eDho/OU5AsORHPPdzyfTeOX9AX8lKJ
 btiB80mCciy7MN6JEeoMm+efSw==
X-Received: by 2002:a17:902:e745:b0:235:27b6:a897 with SMTP id
 d9443c01a7336-2366b3c5ad3mr119165485ad.34.1750053160725; 
 Sun, 15 Jun 2025 22:52:40 -0700 (PDT)
X-Received: by 2002:a17:902:e745:b0:235:27b6:a897 with SMTP id
 d9443c01a7336-2366b3c5ad3mr119165265ad.34.1750053160305; 
 Sun, 15 Jun 2025 22:52:40 -0700 (PDT)
Received: from [10.72.116.52] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b6d56bsm8722799a91.46.2025.06.15.22.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 22:52:39 -0700 (PDT)
Message-ID: <d3674d9d-b147-4094-b2aa-27d73d237907@redhat.com>
Date: Mon, 16 Jun 2025 13:52:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ramfb: Add property to control if load the romfile
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eauger@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250609073408.2083831-1-shahuang@redhat.com>
 <20250609073408.2083831-2-shahuang@redhat.com> <aEakP3rDTyBqDXA5@redhat.com>
 <dli36wx3pe5we6xg5w7c3vyxifnfctovurucrci75kec3qk2y2@2dweacwekfcl>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <dli36wx3pe5we6xg5w7c3vyxifnfctovurucrci75kec3qk2y2@2dweacwekfcl>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ggvukzs1fEBKHVuQfA7aIwcftXI68ClBRw165vRvxNA_1750053161
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d+IlZvfSnAel

Hi Gerd, Daniel,

Sorry for the late reply.

On 6/10/25 2:47 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> $ qemu-system-aarch64  -machine virt -cpu max -device ati-vga
>> qemu-system-aarch64: -device ati-vga: failed to find romfile "vgabios-ati.bin"
>> $ qemu-system-aarch64  -machine virt -cpu max -device cirrus-vga
>> qemu-system-aarch64: -device cirrus-vga: failed to find romfile "vgabios-cirrus.bin"
>> $ qemu-system-aarch64  -machine virt -cpu max -device VGA
>> qemu-system-aarch64: -device VGA: failed to find romfile "vgabios-stdvga.bin"
>>
>> Perhaps some of these devices are non-functional for other
>> reasons ?
> 
> Anything with pci memory bars is problematic on arm (which is one of the
> reasons why ramfb exists in the first place).
> 
>> None the less if the device is built for non-x86 targets, and
>> the ROM files contain x86-only code that is to be executed by
>> SeaBIOS only, then conceptually this fix should apply to all
>> devices use a VGA BIOS ROM, not just ramfb.
> 
> Note that non-x86 drivers for some of these devices exist, we have at
> least roms/QemuMacDrivers which includes a driver for (IIRC) stdvga.
> 
> The ipxe roms are x86-only too btw.  We could make them multi-arch at
> least for EFI platforms, but given that edk2 ships a virtio-net driver
> and the recently added EFI archs (aarch64, riscv64, loongarch64) are all
> younger than virtio-net there is little reason to do so.
> 
>> If we're introducing a property to control this usage, then
>> we should fix all devices at once, so we don't need to add
>> separate properties for other devices in future.
> 
> All pci devices already have a romfile property.  So for most devices
> this is a matter of setting this property via machine compat properties.
> 
> ramfb is a bit different here because it is not a PCI device, so we
> can't control things with the existing property and need a new one.

So I guess I don't need to add property to all these devices and keep 
the current code is fine?

Thanks,
Shaoqin

> 
> take care,
>    Gerd
> 

-- 
Shaoqin

