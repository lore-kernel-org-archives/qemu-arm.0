Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5306761njc;
        Fri, 22 Nov 2024 03:15:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb65xH1alXR3Y95aQOfzYgr18wUEBpoJsGvFmY59isnzQga6lBdHs3lJB+SNqIjV/DVJsJ
X-Received: by 2002:a05:6102:2ad0:b0:4ae:f181:d2f2 with SMTP id ada2fe7eead31-4aef181d9e3mr1306452137.18.1732274137265;
        Fri, 22 Nov 2024 03:15:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732274137; cv=none;
        d=google.com; s=arc-20240605;
        b=UMEkJjfr9fUzz4TI+1zkCOngaApfoX2CcsiDt4M9BYf9t1X2eIEFKY8dWga/yFwb8g
         eWN12YxUen7Rec7pjEZJLb4Ger7SQFxk6K5DvV7qGZP6Jbi5tgIxsB1aPaqudwswBs5g
         USniA1R6zmSnHRl/U31HZUBRppViG6idThZiNInJK/gnU0gGsIJwWdtK4d+Kd0kkxR9G
         QVM7FW1zTKLTdTrYNTgR9wcPqJ9o+7NwUQN9IE37kgCQuWgQ1q0zFjTmiQ1uE0WMou32
         6XRHmepzd0dcpSmilZdEjUn/7fL/Xf/B/hW2JASn1h2bfxLTyf3NIM78JuELcwY/6eLk
         YVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=7mSVl39VBnFPHdBLBl5pCBHanoi/sUg+nU86wXsMt6I=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=YVx7wToXg8UrCSw0wJ+U978XPxntJzf845Rx8Y1xQe/jYVK/AaujIrMyzqS3Nw9EbV
         AX/HJN1SgeLkgW4z/lhD7kdsvKMSImFiJCH4nXune2+KJ6ByKt13zFBQ10PjCNjSAhQn
         mbuPVy6Mv3lBUdqVwyu6MFeiEHp/63os0AiCBeABv4Zr9m6QGajai9rzLQwXADt1vKfA
         yQjIPr+T9HzQK4OVsoO75o1rP69r4xVsUDCwIhg9KEG81WOPHlwplrLgifmEYi7uLtsB
         iPGo2J5uvTvBUpAlkkNCTSOTCgUnWNzW1TySKthX031rdDwa6Cd7DYMUzKepI6C/b6Lg
         Qqdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PfpU3aLY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4adda5543c6si611456137.209.2024.11.22.03.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:15:37 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PfpU3aLY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732274136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7mSVl39VBnFPHdBLBl5pCBHanoi/sUg+nU86wXsMt6I=;
	b=PfpU3aLYuVgvzbK7hZYs0vXiA8WDZnz0iHntsTxPx9wb6CrbO4n+IBr1JP4soLZr+1LmRB
	NciOBnBVrriw80qFZVF1y2TDCcaOzAMnA5hg/YwucKjAisfPwvX+VRqMfxPrX9LtnV4a0X
	NlUGC8LmzxAfVBY0118hpSBssEQv79E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-AEQ144p8NXmxDEupPq1w7Q-1; Fri, 22 Nov 2024 06:15:35 -0500
X-MC-Unique: AEQ144p8NXmxDEupPq1w7Q-1
X-Mimecast-MFC-AGG-ID: AEQ144p8NXmxDEupPq1w7Q
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4314a22ed8bso13995655e9.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 03:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732274134; x=1732878934;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mSVl39VBnFPHdBLBl5pCBHanoi/sUg+nU86wXsMt6I=;
        b=p9PQnMCBUWxHBqQja1lkbC32MxKMg7avaQIe4xacD6OtbSJXnugjb7Vu9vPLAwfPN/
         WQc5BSVMPzaMbHnsoKLznll/lVV9PDKvvJSJc33cSJ8zW3ku/b16CWQN7a5Ze4HAuvg9
         6/cfT51GX3Qd5XK3QqY+jZGooE8wDSs3qu/5y8t5tlftenqBv7eS2JCPW4yYv3e50VmX
         AYZ24UvPk3DHz522TpJCMsXNJJvT4fcCtfo5iqMycwdNegWktDtW3YrTxCNlSPNiAp37
         OEbsTqioJTRGw3+A1+Cev/NJ6WD9GLvTHqHed0AOIoNCHyZxysYlnEOa2eg4zn63unpa
         X4Xg==
X-Gm-Message-State: AOJu0YwGh9crGq3OjpfGnbyB9pDyKSydYfnL4ge7ynn3ntmgtw4uuWxP
	iRo4akjRY1VsplJ0rVo8SjOvjPl+dU6HnQyKXS+tfZpV/bu5xBjV0sTpAhroYLOQkUMiAGXNEDG
	RHUGmMcQREkmghGO8dpU8QIf/gXzkajXs6kp6e4al6ZWnxsHuQFO2joMXQ42ktWJnds5ReEzcoT
	cJJklTMF6rjMbxfHKXPp+lMODgrR4PbcA/eSI/
X-Gm-Gg: ASbGnctkGf6eg8CIMyl9v1sdx/OOyWYmuu5aFHPpCQn8Ya715IRRYr0EjBQ5Zfo4eG1
	W4/+0FbdgMZ3kxAOaXM7SkBZElxGTjHg9ez0LAgj2Lhp4xOuZvdwS8DI2DFDMyORBcedFWMRkMx
	PFpt8zgcb7d+o3ecjr2YBWtSevp7JC/59Gbi0sET+CpSORy9OvujaPwys54TATJFkVlfRuW1l0t
	gNmnmtlFQ0oyq/T8LUJ64Oz7wkQL7S6yDWtgX8888rHjjaaaV5/OceoVokhFGQXQD72Ar6nK+Y=
X-Received: by 2002:a05:600c:3ca9:b0:431:40ca:ce5d with SMTP id 5b1f17b1804b1-433ce4912a3mr17420745e9.23.1732274134480;
        Fri, 22 Nov 2024 03:15:34 -0800 (PST)
X-Received: by 2002:a05:600c:3ca9:b0:431:40ca:ce5d with SMTP id 5b1f17b1804b1-433ce4912a3mr17420185e9.23.1732274134126;
        Fri, 22 Nov 2024 03:15:34 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b464310csm87396405e9.42.2024.11.22.03.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 03:15:33 -0800 (PST)
Message-ID: <cf3bec65-2454-425f-a9e0-332d6960e899@redhat.com>
Date: Fri, 22 Nov 2024 12:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/39] tests/functional: update the x86_64 tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-35-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-35-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: deaRBKO2uf6cIvLb_tOEqVgMZeWRY-2ZBB2QVwho8HM_1732274134
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8llsnJdYpb1a

On 21/11/2024 17.58, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_x86_64_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
