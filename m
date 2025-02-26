Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp715315njg;
        Tue, 25 Feb 2025 22:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVPocr9Ivsm55m+XyFAGOLSOb7zf1TsGlWFHlJhJEmLJPQcW4kB0vPmNDOZ8s34fe0vN9Cf/y/DX4l5Fw==@linaro.org
X-Google-Smtp-Source: AGHT+IHID5t/XSdy8H9P4UPnaZOIaBjcCxDRaTMuwiaJ42qyL8rtWuubn4UyRRcI4SFd6wYB6p/4
X-Received: by 2002:a05:620a:4415:b0:7c0:c0e0:8beb with SMTP id af79cd13be357-7c0cf96e406mr2462134485a.57.1740551830617;
        Tue, 25 Feb 2025 22:37:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740551830; cv=none;
        d=google.com; s=arc-20240605;
        b=cpqGMcigYIZh3yFiAu2CiCuQSiOKyLK95FAGe9nHSN+ztKsgRyGLcfCC/1ribeBK8k
         jXqk6rQHb9fzdtE9q3SSUGhynTjel9fgPls2xp9hXjXdKbYPNlkxWuzwwkhFvTXk1nxH
         NICKz3qBhrfbZOxE4aRH+COxLAyNe49Xsf8gJQhdk+zR1bvmzcV/i8jGy/QDu/Cn1NRu
         SRApGvjWSRzHbTcdtrFi7J1oToSCEjA5yaSQ0to/VoCm90Ant+sTLIQ+zD+GoFIKgPLi
         ZfDuo6Y0mtG/Z0y4OYhEr4MKcmV7gmAoQnGPvA40PRfAiYQcTjR9dUk94QxxhTulA6E8
         ChbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=WbAMHYheryIQTkTkTFnRlYwKrr7f978RfO8s3TVpbOQ=;
        fh=8SVqtAX82uqaOjA9mF6w9jiOau6JX3MfKE49dLB2PDY=;
        b=S9gVBqSMUKk3OUtV1luitzSuepmOCPzOppAPMnjrRapWQUqShgc/iZL0BzQLcZtj2U
         8bEpRs9oTkG1xwypbGvEJ139lfszLll4MrPRVMKQap+JzOFlvON23ZQdyxAaJI/NaMT5
         WLdcslxyEivGxcUQX1x0k5a8x81I75MmimGUg8QB/D3cjcLrw9MmKGm9TMKXtBK7ZpUO
         1OM+zuiE8m1bpnDfmwWvIY6IIJA/nwuJvy6najJh3j157IIHHt+sZtcmXnRddIhG8dZ8
         9e1Wv33LJJFHy+ZzLNW+wqvwWxKxkkO+6/v0KGF8Pq72XtQwYN2EG/rZPfK0XUrIFPJS
         qF3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2JvjSs8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2da7c9si328576885a.433.2025.02.25.22.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 22:37:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2JvjSs8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tnB2U-0006v4-MW; Wed, 26 Feb 2025 01:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tnB2R-0006ue-A2; Wed, 26 Feb 2025 01:36:59 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tnB2P-0002pG-CX; Wed, 26 Feb 2025 01:36:58 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-abbda4349e9so942675666b.0; 
 Tue, 25 Feb 2025 22:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740551815; x=1741156615; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbAMHYheryIQTkTkTFnRlYwKrr7f978RfO8s3TVpbOQ=;
 b=k2JvjSs81j1eMaeaINFlg0KL83zF+IeGeJliifFAu8s7r5ZPFlKeZrEyWjttQoUbVK
 Sl9O0bsmdAAObU75ar26nLLpY2SA6Hwxbxpkb1ia0Ln64E3o56+yoOjPhjzDApOUwitn
 3sR3C4GHawmIYB7skfYu/ezwbu91S51vWSMyncazLZXcddBkqxmYqF+QBU5kgn4a/ubj
 Ps0dOPK4bmatjtO75BvnwptghcCjjSsTOAEMrz3QR05s6jjT5e8exFw+vw8PeQ6jqNEW
 ThNC9m9fZKe/o0D/4YUaCm1IYRU8Z4p9UphWqWi0g7T2mA/lZfZiT8tp5y77UqN5XbFU
 9rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740551815; x=1741156615;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbAMHYheryIQTkTkTFnRlYwKrr7f978RfO8s3TVpbOQ=;
 b=Igx6pfHU1LB4I6l29T8dIbWj9YbdkjBFyITk1AK9wm24P+QJ30Zi8xpcb9aQQMjXdL
 zpL5zKNl4n8W+r/E/35glKHzqrw3nU9oiBRblR4L5Pa7YdYGlBqXv40lPcZyNPt6OeYM
 UF9NLFvGyDPkP2HSjpaMgruQrK95v/I6b/tWrDOUv2oc0szAQHWHem8pa3zGxB//croN
 zKp/k2GRGfMWKqW23D2pKXja2PtssmPSsXZ0opl1k8vQPAoZFWISSoUsDC/XdSYoSRNA
 1xDdOGE4Kqd20QTcbfmTg7OlSMTMY6ovD2HSkhIuBvbVnFmHVJex6PdskH79XMaxABbF
 1eIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWweI009EDQphezmBNXePVcwLNd3CEAg+FxXxtuYez+PfjG5AWDCaF5D8CS0HQufpsRmQwm0vcOOw==@nongnu.org
X-Gm-Message-State: AOJu0YxMFIb1vjhnSFjqnfPyumsZDNAUx5zgFBo2Gu/Tab1bgI0WMcQP
 fvI5XJxTZID+14gVz0Dh3kq9lzu2YtYMsdBxkd4jq1IDrh98pmKP
X-Gm-Gg: ASbGnctzQ8TvI12O9XzShHiq/jWIxfLqYvmsGz2YR5btYleeCTd6TRC5BW1OxEe/uL4
 bwMZKl3O+P7GPfqT9zNhQAHV6eMrFn5zJe/UY0hUBZ/rJ2w1FP0iFcYq/ovWLxB8ISMx7N4Pe4N
 HvSwlPNKXChKOv7WZhtET4N1IkphfWiIgtwnryJ8rpTqkWRi1uCVN6g/INBvtjvjXxugbi9nBif
 E3G14bRKfMC5wKCU2pUIgcniZAdIDXg3IcZpVR1OZE9V2/a6ORK52ACLrF8i9GadQcaRCwSKX29
 8TrXYTZJPFQbyhqiiLSjHGY6yqvXuFFvu7lRco6ehMv015oQREjAyNk5FQAyIafhyYOyYBAtMTi
 Dzag=
X-Received: by 2002:a17:906:6a02:b0:ab7:b9b5:60e7 with SMTP id
 a640c23a62f3a-abc0de0dfbfmr2118063066b.40.1740551814956; 
 Tue, 25 Feb 2025 22:36:54 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-188-174-225.77.188.pool.telefonica.de.
 [77.188.174.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e459c3fb75sm2271980a12.12.2025.02.25.22.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 22:36:54 -0800 (PST)
Date: Wed, 26 Feb 2025 06:36:51 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 04/18] hw/arm: Add i.MX 8M Plus EVK board
In-Reply-To: <CAFEAcA9e5FBrKLZrKRsw=wPThbwx3+gyVt9rv4_vx9OKfZ8qiQ@mail.gmail.com>
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-5-shentey@gmail.com>
 <CAFEAcA_XJfAVEe3cgHiXgcewTL3kF3SEevrnMh-Edvfk56G6sQ@mail.gmail.com>
 <CAFEAcA9e5FBrKLZrKRsw=wPThbwx3+gyVt9rv4_vx9OKfZ8qiQ@mail.gmail.com>
Message-ID: <3AC73313-B9B5-423D-9E01-189E9010556C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +Kg744mBtE5a



Am 25=2E Februar 2025 17:00:53 UTC schrieb Peter Maydell <peter=2Emaydell@=
linaro=2Eorg>:
>On Tue, 25 Feb 2025 at 15:42, Peter Maydell <peter=2Emaydell@linaro=2Eorg=
> wrote:
>> The C compiler for the OpenSUSE CI job doesn't seem to like this:
>> https://gitlab=2Ecom/pm215/qemu/-/jobs/9239416833
>>
>> =2E=2E/hw/arm/fsl-imx8mp=2Ec: In function =E2=80=98fsl_imx8mp_realize=
=E2=80=99:
>> =2E=2E/hw/arm/fsl-imx8mp=2Ec:382:15: error: initializer element is not =
constant
>>              { fsl_imx8mp_memmap[FSL_IMX8MP_UART1]=2Eaddr, FSL_IMX8MP_U=
ART1_IRQ },
>>                ^~~~~~~~~~~~~~~~~
>> =2E=2E/hw/arm/fsl-imx8mp=2Ec:382:15: note: (near initialization for
>> =E2=80=98serial_table[0]=2Eaddr=E2=80=99)
>> =2E=2E/hw/arm/fsl-imx8mp=2Ec:383:15: error: initializer element is not =
constant
>>              { fsl_imx8mp_memmap[FSL_IMX8MP_UART2]=2Eaddr, FSL_IMX8MP_U=
ART2_IRQ },
>>                ^~~~~~~~~~~~~~~~~
>>
>> This is (gcc 7=2E5=2E0 "cc (SUSE Linux) 7=2E5=2E0") apparently=2E That'=
s
>> a pretty old compiler, only just within the bounds of our
>> version requirements (which are 7=2E4 or better), so I'm guessing
>> it's just not as smart about figuring out that the
>> initializer here really is a constant value=2E
>>
>> I'll fix this up by dropping the "const" from the serial_table[]
>> etc definitions=2E
>
>More specifically, you have to drop 'static const', leaving just 'struct'=
=2E
>Minimal repro: https://godbolt=2Eorg/z/5css4hv67

I haven't checked, but this might be caused by the multiplications (=2E=2E=
=2E * KiB) which the old compiler might not perform at compile time=2E Than=
ks for looking into it without another iteration of the series!

Best regards,
Bernhard


>
>-- PMM
