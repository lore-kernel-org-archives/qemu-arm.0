Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5352933njc;
        Fri, 22 Nov 2024 04:37:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6b+PBgdyfd2xNdI1Zo3ujnusFVVyK39bvQtKwq/ofF3nQfh54qsEwFvvnKt0tp8go/LROg+FDcey3bg==@linaro.org
X-Google-Smtp-Source: AGHT+IFrsdDyeMjyYtzk5H28C5JoDouyOije13YneIW+m+t9Hlq/ODxhRKF8kKrgu0QrDvqGPf8e
X-Received: by 2002:a05:6358:949f:b0:1ba:4c2a:7675 with SMTP id e5c5f4694b2df-1ca7954ef5dmr238185855d.0.1732279048885;
        Fri, 22 Nov 2024 04:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732279048; cv=none;
        d=google.com; s=arc-20240605;
        b=HZ9Oq+506e0klejkp6fuDuZ9E5U6bs4fbD+iqO7vpfdx+oN3vjwEzLCCrNF44vNPsM
         ODkGpYZfROcGj44ONOF/10dsx9UtwxL4yHHx1V+UD/J1ep4wh5uXipa11OYRU8lFAZ0X
         K3ragEAVlDrU7X98pZG6pYRLpexx73LaRTgS69l0xvFnZfowHTmeFHLbPDwNbIszMYBI
         yL8eASbEPoHw1qwDX9T9l7vU1+XBLoSiN71Ln+iJR6aeOIXZorEg+gbyAMJJpBMHK1dX
         uxoVk6Y9mDwfCcCk5MO54YR/KrwMrGthikZPt2alEv2YaeqsONrmabS4bFzGrfgIFzN3
         dCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=CyQKgN06PGUD+AXir6DHOe7QB+SHUhoCcRgC8Zwcdyc=;
        fh=HLDj+aexicyZahEPtL4/EkEhwZphqrTtEWrJxboQLM4=;
        b=A3S/bFFEPv1fCNxcUZTtt7maiBc3feKX6EA/tdxCbn2EvYfgVgAQm8B5C3aQB0xtQS
         S8Z28OkWYE66p93XCqNGDE779WGyM4ck8TajmYfaW3yanBHMHTQqyQk6Xl06rZLQjQNm
         V+ITz05zkL4H268v8GnDnr/CsZgWYHkbY6szdboASmZQ7qIfJmwNtlIEFJDgomJmolgC
         5P6Sx8KI825ndaZNbKXZ3Yzjalc5azUF2fkwZILaIYTwIMKQUPb+XJhvjL6pue4LEgA6
         CSwMgU8hRSvWWUzSw7k3PjpFXQ8HD13yAgx5nbzP9YiGyAWIJsyj9cYgsRsm9W5I+pEF
         +CJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HQ3FraRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85b11691e6dsi530234241.136.2024.11.22.04.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 04:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HQ3FraRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tESuY-0007s2-Jt; Fri, 22 Nov 2024 07:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tESuT-0007rU-UU
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 07:37:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tESuS-0005Jl-GK
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 07:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732279035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CyQKgN06PGUD+AXir6DHOe7QB+SHUhoCcRgC8Zwcdyc=;
 b=HQ3FraRTOmK7MXH0FHSCbWyCH9GZLPdlaTJMkj0uEEhDwsd++H9cbp6JIgvAQ8kYJP0sq0
 Fw3bHow/uVQk21Z8Z0QCT50Cm1ff91O/yiErIN/NRYk+8YKtGAIdneJlqTzG8EVqh14YAj
 yKuhvYVb+TiKtZjuyZc5YgsTv1FGHwA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-iInUuy0DOO-Yb6a_U5jR5A-1; Fri, 22 Nov 2024 07:37:14 -0500
X-MC-Unique: iInUuy0DOO-Yb6a_U5jR5A-1
X-Mimecast-MFC-AGG-ID: iInUuy0DOO-Yb6a_U5jR5A
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4314a22ed8bso14495915e9.1
 for <qemu-arm@nongnu.org>; Fri, 22 Nov 2024 04:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732279033; x=1732883833;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CyQKgN06PGUD+AXir6DHOe7QB+SHUhoCcRgC8Zwcdyc=;
 b=uKNRSBEE13PvAZhNqM9gX7tVVzq359WE1M4EcVvUFfdPRaTY6qhM9vsIJNN9uECUVr
 RvvURcxq0X1DU7MjCggrSy+DQ9D+Unkgi8b6VWQ0W4rsRzwKUT+Qjm/UrFnjekAlz/f6
 dDFlOTlYuCXswTTyKw4bjnA9z92s6qugOfK0IwdHZd+wQAxpRDQNRpn/rdsYCIUDIhkv
 RZ3BhCx00RXk2epLTbe3bzCsaMUdsjUk/YLZcB92BXdzWME38zNyvLA9EwKBXKuwJBSs
 pnjxb2QnzeqVoc1tZjsEb9C74QjWpBWX7GMgpEz7vFUcJRSLeK1m2eFZrLf3PgydvymQ
 fgOA==
X-Gm-Message-State: AOJu0YxxpdXI6vyw2DTQHsFcMye5yA2I9jcJh2nWZrwqcPGCU8QbQXbB
 7O/ZXWOmS50kG5JXOW4rI1cjg8N0K+Of/uzNh16DLyE3h7VQ+3w9H5QCMwir6o/Ecgm1wQu+Ru0
 PoTJGFRGVyWBI8B3O0iTbbbtDRIbgwiQyutLDVET4aRDhsyeB2Q==
X-Gm-Gg: ASbGncs2B+FS82pnN5t6zYMhP2rBSDXqRqnNYSA/R4TikqhYhh/xDm9dGljxK4oWDjv
 ZZdXi8cdRRxPZoY7LRzOb2ceqJuQZkUzLkP1DvUnML2jTz+FbMowpxBlfKR+WHTli4H4EP8gUor
 y2CRyDW6jq1F9QgW/yCDPbimskluVLC3oalkDYbYSfcNEFmEdJy7kspmbrZtv43kDix/Pq/Chdm
 yhs7l12O8qarTUP3+Y1tT24nNA4jHOWPvYkN22NUkwa8pc3rNYbtd/ecIHEgqeS2ten7YUiSUE=
X-Received: by 2002:a05:600c:3593:b0:431:55af:a22f with SMTP id
 5b1f17b1804b1-433ce425069mr24304735e9.13.1732279033478; 
 Fri, 22 Nov 2024 04:37:13 -0800 (PST)
X-Received: by 2002:a05:600c:3593:b0:431:55af:a22f with SMTP id
 5b1f17b1804b1-433ce425069mr24304515e9.13.1732279033080; 
 Fri, 22 Nov 2024 04:37:13 -0800 (PST)
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde0db3csm26076995e9.10.2024.11.22.04.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 04:37:12 -0800 (PST)
Message-ID: <f18c00d1-1ae3-4f14-9e6e-5fa1fb09b1d5@redhat.com>
Date: Fri, 22 Nov 2024 13:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/scsi: Cleanup around
 scsi_bus_legacy_handle_cmdline()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Helge Deller <deller@gmx.de>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241122111939.11936-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241122111939.11936-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YpBI1p_WZAQ5ausmfEi_DnSYqJf8MaCVsLWzx0KRSzQ_1732279033
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: 3LW87A2N7Rpo

On 22/11/2024 12.19, Philippe Mathieu-Daudé wrote:
> When a device model requires legacy command line handling,
> call scsi_bus_legacy_handle_cmdline() in its realize handler
> instead of having each user call it.
> 
> This applies to:
>   - spapr_vscsi
>   - lsi53c810 / lsi53c895a
>   - sysbus_esp
> 
> Note, scsi_bus_legacy_handle_cmdline() prototype could be
> made private to hw/scsi/ to restrict its use to scsi device
> implementations.

Not sure whether this is the right way to go ... shouldn't the handling of 
the legacy command line be rather part of the machine than being part of the 
SCSI controller device? Imagine for example a machine that has multiple, 
different SCSI controllers - I think you'd rather want to let the machine 
decide where the legacy devices should be grabbed from than having the SCSI 
controller devices fight for them...?

  Thomas

