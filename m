Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp750487njg;
        Wed, 26 Feb 2025 00:11:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAvsBSAJvtzujfopKxvk9edMNa+l6qkrWPV+jkd/Fgu068sYu8RVcNgYZfu16kFzKNttiYwX8iBTqgIA==@linaro.org
X-Google-Smtp-Source: AGHT+IHqQ9IxIXstvgy3tEXZnjV6JLXfBYkP+fs4kby8+oVizrgQnhHIRf2+fgE9AAjEMMtkhSUh
X-Received: by 2002:a05:6214:1c44:b0:6e6:5aa2:4e4a with SMTP id 6a1803df08f44-6e87abacf46mr86202566d6.28.1740557503425;
        Wed, 26 Feb 2025 00:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740557503; cv=none;
        d=google.com; s=arc-20240605;
        b=P4b7FEXrqHO+l7YNP5bsbvQmIRzu4+uz4vumkLrRPg4gMGUNxjZ1B+5WpU8VqCpMMV
         IXLfHva1x0m3METvThFFVitQR5b4jckd1tHdxqkP+cgBAqViwU3ggv+QBVQ3oOuZVdiJ
         7xgfbWujcgYT28eXlGaSD4RlmJOPmRWpQOYWG06KpZYKTgavI/f0L9n4lb/vRi9pzD35
         33usUhT22sZNXT2Mi3WRsAhiinV/3RAxd6Zm7IUBiGl+QES/RsOtvOjB7S4wEhI+f5W+
         qZtnzDmSoVoTx5atPQpYHVGOEtj/E7tfTcaTohKPGMVWwhANqYTdPDz91DSDCMiNd4i+
         43uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=dw56ExMDIKPAuVXb5dh0JrFupWmQmeLfOPIJIRcT57U=;
        fh=tTOhPNvF14n352IBRMPjWNyzoB+1QYfaT7hBkEJmA2c=;
        b=W3++MurYgVik6WagWzXe4wGs4qXA0u7PnYFW3wWMQp6psxVIMgkPEiE/H0TWHT6ODD
         J4+kHoNW5rpyiyyPAtsfbDQVW9x4ROS3IOQmuXAz1u6mx8XDAdUqP9kQWwupjLg4VeGd
         7LR5/UwcDVe0n/EXXQuKs77h9SMz7Sishp30PVyPnaZo/v8Bv9rKZAPsHYn4n7kGZSxs
         3IKwauuT62Z86dztEcZQYpeHRppQb0BRa7eZ3qTIS+69AoLcCAE0GPvmnBOOlcBmE/wr
         VzAZU5YD+lFGQvJB969WLUTLA4X1NObrjRS4tcT5E8x4k++6aZbxfkRoO7/+w1OaIuWw
         CEFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P/+Q8ImD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b1213f5si31617996d6.463.2025.02.26.00.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 00:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P/+Q8ImD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnCVf-0005VW-02; Wed, 26 Feb 2025 03:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tnCVb-0005UG-3c; Wed, 26 Feb 2025 03:11:11 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tnCVY-00014K-Ci; Wed, 26 Feb 2025 03:11:10 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so1119890a12.1; 
 Wed, 26 Feb 2025 00:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740557465; x=1741162265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dw56ExMDIKPAuVXb5dh0JrFupWmQmeLfOPIJIRcT57U=;
 b=P/+Q8ImD2FgFvIFkQ3aEwVRcjz8OqOTAowQqacYP8zACYXPHR4d3H4D+CUDFwMWdz8
 Cm5AMWhYI2Sw3gfUFvD7WCYJLj2DInGWTHUdD7OF4DoNhD58TGVZJ9Fmlyud9TLL0whn
 qsEspBiapOlrRF9jB+jFYrlOi0IKWQ0Yxt2PosJvDIPiaMNY47WNuw129a92O5KMaqNQ
 AQetoKeaYeyPwgIYQ/NdRSCovziIsMrmIQ6UyWgalucuNC0gk6xVDsEJciajELc+q/i6
 Rab+XFjyoo50u+PnLsAhvCBr49Q6I9FApND2bdDMi1/bTUNfoWFZOp8Kz8dP9rBhchtu
 +d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740557465; x=1741162265;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dw56ExMDIKPAuVXb5dh0JrFupWmQmeLfOPIJIRcT57U=;
 b=YNby7+D5Pv6gE+UBxwmiPMg3/X3oNgMICK7x+yr++WDDiRcBwqg/NdL3Z9hEvX6+6A
 YqidzWN3fiP/h+xJSCYQWx0KDAx8FqfyvYv1vs/vNk793Tqy3F7P5F/sFxas+s72uyhk
 U4Tg2abNJbhBD8R40vlV6Z8RMxFvjt5NyDMs9aMd9HrJfXOWS+G6DaxgmO0cHWt5nfW6
 LFchMY7axw7IBSrXmhG2Etodpp9/62QOMrpkMjM+MKqoGVes5fOh5Df054e+kcHnbxMW
 LUGV7g3bWhSq5zqxv/cI6cc64YbhrWREWXOckCJ+dOQBzOHLndIiNo9U3207kwv9ALSG
 uejQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPIAb3/TN7BKf9AdrqqFK+q+sylS+otGTdODHkwzpiSvArlBZPDZQ7yrICCdp3dyD5aqeWMo6wSQ==@nongnu.org
X-Gm-Message-State: AOJu0YyG+3S2I/hfvU5/kNhx4ePqgo0xQCTzKfh+8/waH5ivVuzZIo0E
 TOFUiayZUN/Ja5jjFxKNTQ7hK0M2ZWEB8rqFurYn89zS+fPNfEO7ELY1dA==
X-Gm-Gg: ASbGncs64sn+uLdn8SiyU0MZkSfnBWluFq4LNcpqNBRUQqnwDiM3OLWlXS1s3lgA8np
 sKhZAlXapJbrVodtn98W4a/seR71d5RwmG9003lOvCJYy6yQABlLQz1JIBGlxvNQo/bXSQV9x0q
 KR4OgzTqbeyLa4BAWzkOh9B/fK66D21aWopGqzoWuJIYP+F1RRBE/yiOCDkNWeur4BXqklBimq+
 Q5+shffIdgTZN9xcwOlyXYs6Dg/5l+Sg+LeAeBorqw3n7QY74h66R4FvK0m0W9iMbRF9pO2WPbu
 cTcbDHrA9nwxonpfAyV44GmQpllRBvxxN6Fn5+GydBe041iVjdHtHYMaNN3zVG9mR6fXO9/jerT
 OlQ==
X-Received: by 2002:a17:907:a2cd:b0:abb:b154:c064 with SMTP id
 a640c23a62f3a-abbeded95e3mr2583751066b.18.1740557463751; 
 Wed, 26 Feb 2025 00:11:03 -0800 (PST)
Received: from [127.0.0.1] (dslb-002-207-251-119.002.207.pools.vodafone-ip.de.
 [2.207.251.119]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1da453dsm283334266b.85.2025.02.26.00.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 00:11:03 -0800 (PST)
Date: Wed, 26 Feb 2025 06:55:01 +0000
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
Message-ID: <4FAB75C2-8140-48E6-AD54-77884C3004EF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ueBiHTxWYNhV



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

I haven't checked, but this is probably caused by the multiplications (=2E=
=2E=2E * KiB) which the old compiler might not perform at compile time=2E T=
hanks for looking into it without another iteration of the series!

Best regards,
Bernhard

>
>-- PMM
