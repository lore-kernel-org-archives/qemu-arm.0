Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6645102lfg;
        Thu, 4 Mar 2021 14:47:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFs3ztzP7evWRDQxWxKfvptxbg+U2EeiH2MwHQrxtjEzVLnmPrJGG1VP7mcKCa1jJPMG6D
X-Received: by 2002:a05:6e02:802:: with SMTP id u2mr5677139ilm.298.1614898056374;
        Thu, 04 Mar 2021 14:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614898056; cv=none;
        d=google.com; s=arc-20160816;
        b=s7owSYXXHdg8BKOYhkBFx+4a+Xzxn6ZMrATeInq7NgueYHLbfdcZMf/6PXERJNcqbN
         GzAJhA40BMyQ0rFSn28Oq4FORa13Z/zltMTP5586NIdgK8C1CLd6OL+sqQ6RDE6lci26
         c/ewHSrYyvE9nxtbJyPUvHdAcRpqr3fAR2zEcX20kxt7crGz7AjCIuCyevJ19/3BrRsx
         s+1w423PijjtCYDtTEb9H+rMqjxOnDwvC0fuCLtf55Aslsm6WEq4xVTl5x6+H1Ap7czG
         bSVTo34ROoEXQko6g+BFNuElE6YIYzyjd1Ahvn+F1pV6zpHmQX6tmZbHprpdnRAeDS1h
         SOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hf00AHbHIMiNm64Y8lGK3pPtMES+J1oh7Yn7Ca/ioxA=;
        b=JLr0yGVLNUbojm7F9PlI2FrSxxmKvXmkyiFMxIS/zY+Mdh4Y/ZG1Km2ct8pNQfxUdn
         lRi8KBXEctWMozAi8vMqCW3uD6Dyk+9Hwcx/8ssw4XdiHhWWLIpQvcsJUAZTQCKigaQP
         NkoiXouzQgkX+5MgtdWYye6zDFVhL+pqEbl7aZic7Z1kQTuMJ5q4boRntIGxcRnUF0bU
         WJcJCUPKkeOBmIPGT4JfUbfM0rm1MzqBv1NFoKLmUI7hTci7uhk9W85eRbXz/8WhCMNT
         aXZzuAkgwrBNR5em3fIJNTh1FH4wBKCjpkrEtKmXF0m08jDXubUkwUUz5wAZ7iHziSBv
         lShQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YrmWf0MS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si536479iop.79.2021.03.04.14.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 14:47:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YrmWf0MS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHwkp-0004w4-Mj
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 17:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHwTi-0007fC-Eu; Thu, 04 Mar 2021 17:29:54 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:39026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHwTg-00057W-TF; Thu, 04 Mar 2021 17:29:54 -0500
Received: by mail-il1-x12d.google.com with SMTP id d5so173011iln.6;
 Thu, 04 Mar 2021 14:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hf00AHbHIMiNm64Y8lGK3pPtMES+J1oh7Yn7Ca/ioxA=;
 b=YrmWf0MS22tSe+BM7zdzsAa+mftFKYsTFEhv3to2Uinqh93TiBQZYHXKv1on3REajc
 xwEY4A5UghxgUfoYrXxvZCGIAycXNRbHJxDDgS2+QrDTjBfyEAt/1jr2YxyvzUbAc5xa
 FdSM9Mfo7WhXL6RT/bVWD2G4V5FocNZ65BWiKjYt9nmpwybZki0hhIX5OgUUVabKt+4j
 vh6CvAFgaPq5eTUpDjHqkZXhHJaiBzz+hECMb0jRU6lpFUHVUhoPJJsBbB+/4ZoNaptZ
 HAE9VqIFMWim+1hOokDtfBfEtpHrVPw+JOVpKyMP7A3DVB0FVrrB5t9mqvyzXzNvGYKO
 Fp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hf00AHbHIMiNm64Y8lGK3pPtMES+J1oh7Yn7Ca/ioxA=;
 b=SGZR5dMMff+OTXds9+bp+8Or74Q6oLwHfCSQ8KE4C3vzOqoyQLDXa3vBC2jWYD0uiu
 ZdXQTEeiZQsPqZvsnWVKh6YYHEEfu0tqcfBmZI/U0Ztym5hVCFp6S0NmLSKgjn67lOTb
 YnUdEvtywndC+NysrkWT3BQ4MoNecP/sclsyevDKBXScg03mnHzNC/n4pRMQ4lthqjHX
 FG1xo8bLIz8TnXqN9PjfE4y+0pt0aApI0uzcFUFLS6A+3KoTVar1NPi9QssMkfOuZWj+
 RLu1CnQUs/UwsEEeh+MuuwtfxZUxwVrHT6IN3T125Hw8V7j/178z2PrWo3z5buWpEmSY
 Y2uQ==
X-Gm-Message-State: AOAM530rsQXECMf5sQzTzfvRDyWFwxZYsqViNug7Us+FcbAB+yYSGOWU
 ANMXmdutJyTtoj41ck4t06GdT+qHQ9ZFV6Wnv3s=
X-Received: by 2002:a05:6e02:218f:: with SMTP id
 j15mr5854594ila.40.1614896990539; 
 Thu, 04 Mar 2021 14:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20210304140229.575481-1-armbru@redhat.com>
 <20210304140229.575481-3-armbru@redhat.com>
In-Reply-To: <20210304140229.575481-3-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Mar 2021 17:28:33 -0500
Message-ID: <CAKmqyKOTzdSB48KpOS9ovz3K+yvGa0jC5WEhZs9_MsrxGhgYPQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] memory: Drop "qemu:" prefix from QOM memory region
 type names
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EMb+HopuFVM5

On Thu, Mar 4, 2021 at 9:03 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Almost all QOM type names consist only of letters, digits, '-', '_',
> and '.'.  Just two contain ':': "qemu:memory-region" and
> "qemu:iommu-memory-region".  Neither can be plugged with -object.
> Rename them to "memory-region" and "iommu-memory-region".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/memory.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c6fb714e49..3c95d7831a 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -33,11 +33,11 @@
>  #define MAX_PHYS_ADDR_SPACE_BITS 62
>  #define MAX_PHYS_ADDR            (((hwaddr)1 << MAX_PHYS_ADDR_SPACE_BITS) - 1)
>
> -#define TYPE_MEMORY_REGION "qemu:memory-region"
> +#define TYPE_MEMORY_REGION "memory-region"
>  DECLARE_INSTANCE_CHECKER(MemoryRegion, MEMORY_REGION,
>                           TYPE_MEMORY_REGION)
>
> -#define TYPE_IOMMU_MEMORY_REGION "qemu:iommu-memory-region"
> +#define TYPE_IOMMU_MEMORY_REGION "iommu-memory-region"
>  typedef struct IOMMUMemoryRegionClass IOMMUMemoryRegionClass;
>  DECLARE_OBJ_CHECKERS(IOMMUMemoryRegion, IOMMUMemoryRegionClass,
>                       IOMMU_MEMORY_REGION, TYPE_IOMMU_MEMORY_REGION)
> --
> 2.26.2
>
>
