Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp4102519qvb;
        Mon, 11 Jan 2021 07:30:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8qAuobKRU9DD7dPPzdQfy4LRgPKtvCJzSFRjjdgpvJNCiBRmtaQBmUnIQ4bDGoW7/Cled
X-Received: by 2002:aa7:d154:: with SMTP id r20mr15128679edo.258.1610379009183;
        Mon, 11 Jan 2021 07:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610379009; cv=none;
        d=google.com; s=arc-20160816;
        b=GnQBav8o7c/Jws75IF2gd/klFEGG1aYfLgWOtSfkJkfeyFM9GzcP3IxQtaq5QWh7xz
         /4IPAeDhkluaPr+BzDbTSguw135Mm6x83hzZaVkCV4FY0XcdKnmyA9awkdycgFc0iHBJ
         Gy5qVI1Ur+zuvoqCOevNXr1uRzj/o1TIpko2bHAQ2zXxkpSl1DBMK6l1Wrtzenw6cPgc
         Bvp88tbp0FkJNyJoItITM8AGrc8D9PgGqqb+9su+9U/dhMLK0fpP3m6gYulJYdsowFT3
         NIO4puTST0XpX9glukRl6Ql0R2bcH5/1K7lEtgOv+kTMapDjOO16E+1V1aPN8RNDBawO
         TMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=XOm5IjlxtCHB3DoTOT5779aRChsKjuwcEa6MV131Tao=;
        b=umecMItMGRZ0v/2rkXLrh6Re5LNnYmA/Oi9lef2Nk3djaZO8LQirVyRgWdVCxDHdYX
         9cyg6GRIA8xDOZvcmfvR0jHdHeHfC4OkOEmffLo4zFgvPF/Z3JFK9m270n5PXVajW+/M
         /kIuWVW8vCgu597M0i54bTbZ54Mn4Yyp+zV4GEtjc5oKDnohHpCUPmwA1CFbyKLlusqc
         njOF+5yyUHH9en9M8VMqlhI6ihkYTw7BlhPcpLQaMAvxXJPl4OZYp6xp20sJZJ0vYFi2
         LWXNpRp26+rI78DZueV06WCB7w9kRG74n3k+1n8muRqXus/IwwpHY/3sWQvTfZ8fA/X+
         1acQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B0qekAx5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y24si49860edl.364.2021.01.11.07.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:30:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B0qekAx5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610379008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOm5IjlxtCHB3DoTOT5779aRChsKjuwcEa6MV131Tao=;
	b=B0qekAx59i7WdvVo4i5hP5HQAHQuyYgttN5yYzfNQ6lrpgdcPLIEKImmGR6BesVKaDX5RX
	CKUsYwiw0u4u+zJdt7ToGsTZCpp4zBwns93VKbFCrODH3z5r8oahbO7jkk6rn740J0b8Ux
	Sq6IOrBsrafYEuC4sllJc0xX9kSiBgE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-KzSh0-ptMqWe2qwEUSl2aw-1; Mon, 11 Jan 2021 10:30:04 -0500
X-MC-Unique: KzSh0-ptMqWe2qwEUSl2aw-1
Received: by mail-ed1-f70.google.com with SMTP id cm4so8392126edb.0
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2021 07:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XOm5IjlxtCHB3DoTOT5779aRChsKjuwcEa6MV131Tao=;
        b=MyvRzWQss4eNUDzO4IE12LxkvuipPyPpEaEGxbpDnrZ5gCdiYvxB7Ev403UPcsNmVp
         lTKVk41WYEkRnW5YPFCJUQLAOH3AcUcQBXfd1x8pAr57WBWzclzEMRYI0l1PS3s7bsDd
         PCMO5KYQlw+f/re3W8Kv6ViTezlU/AEZ999Ll8BXHaEW1QM7V90XGmy+Kz/PqlnqvhRA
         dOR3Uu90TRNeRQI+C/dJ11pMhYW7VZ1EFqZGAShs5NvBhDb5c83lQIjUBfEUuzJq0Ax4
         p4Oe9eHMXJYnadICbhGVbanEufq9nz51hoXUWxGmhQSyqDWij8WiQNDMGXhMbmYjFpKZ
         vA6A==
X-Gm-Message-State: AOAM533XL3HziCvPRh1TQrUi3a7k180xLX3Jpwhrqg8r9iLFO8nHxPiQ
	yq8z2B8MT0iGuoFVO55q/zTQ2pt7DH9H8L4mM9BWxMOwCqrHv+uoVYgWmOZbsb/zI9lSS7h9cxO
	LcNp2hquD9K14t0ap
X-Received: by 2002:a05:6402:17:: with SMTP id d23mr14583607edu.341.1610379003373;
        Mon, 11 Jan 2021 07:30:03 -0800 (PST)
X-Received: by 2002:a05:6402:17:: with SMTP id d23mr14583595edu.341.1610379003243;
        Mon, 11 Jan 2021 07:30:03 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net. [88.21.205.129])
        by smtp.gmail.com with ESMTPSA id x17sm85147edq.77.2021.01.11.07.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:30:02 -0800 (PST)
Subject: Re: [PATCH v1 12/20] semihosting: Move ARM semihosting code to shared
 directories
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Keith Packard <keithp@keithp.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <15248375-2760-8e5c-4468-b952b247ed2d@redhat.com>
Date: Mon, 11 Jan 2021 16:30:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9j+Jk7owClhV

On 1/8/21 11:42 PM, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> This commit renames two files which provide ARM semihosting support so
> that they can be shared by other architectures:
> 
>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
> 
> The build system was modified use a new config variable,
> CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
> softmmu and linux-user default configs. The contents of the source
> files has not been changed in this patch.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210107170717.2098982-2-keithp@keithp.com>
> ---
>  default-configs/devices/arm-softmmu.mak               | 1 +
>  default-configs/targets/aarch64-linux-user.mak        | 1 +
>  default-configs/targets/aarch64_be-linux-user.mak     | 1 +
>  default-configs/targets/arm-linux-user.mak            | 1 +
>  default-configs/targets/armeb-linux-user.mak          | 1 +
>  target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
>  linux-user/{arm => }/semihost.c                       | 0
>  hw/semihosting/Kconfig                                | 3 +++
>  hw/semihosting/meson.build                            | 3 +++
>  linux-user/arm/meson.build                            | 3 ---
>  linux-user/meson.build                                | 1 +
>  target/arm/meson.build                                | 2 --
>  12 files changed, 12 insertions(+), 5 deletions(-)
>  rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
>  rename linux-user/{arm => }/semihost.c (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
