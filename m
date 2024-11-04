Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2101872njc;
        Mon, 4 Nov 2024 05:27:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfaTxlDL4ftGEc0h3LWpukERLCMv10DoMPzYPocDueISNoh8oZUz75RT4ZNUy13VAhq9kwseG1kmTHmw==@linaro.org
X-Received: by 2002:a05:6402:13c8:b0:5ce:d277:a5bf with SMTP id 4fb4d7f45d1cf-5ced277a5ebmr4655832a12.16.1730726831750;
        Mon, 04 Nov 2024 05:27:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730726831; cv=none;
        d=google.com; s=arc-20240605;
        b=XQjOFV+xBbahb1o41cgQMbQk0I9YjsGHuXNGzu6zrB2FZaDohR3vAx70z/0uEzapN5
         N8ZaB/4gLlpGQRtQ6c2GZi2PAd3C4KPALfofBRisJGPmjl4mQiSa5PJ90CX+ND997aol
         19hHKMWIIPGHrV0BqsK0E43407euskTtM7qyNoK15Fl5cDPNnYSsyIk6lnqUmVf6Sy6W
         2kStJij/7A7ONkl9kwYRwXq4jgar5bRTLJfvi5OqgSyT5fEkzyoRnnqaAXJ+PRkBp9I0
         DsOhkF2MVPDjRQIULODXruLwu0OeBTpvzQeGOZ9BBadT2ctO3yXTaXzZSTDhpqLaZ/59
         o+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AkttCzgUV3BRt8IPVgGGCOwte4MCCFD2pradZxoj/H0=;
        fh=zchmNQJi8jv1VB2ZJWoSs5SigZwoa8UukaYZ+57rBcg=;
        b=l0sVpNfMAi7PO2xP0JWhQp/1R/Vn2wVq/wcyWDuZJEO0801dIZH/xxqTG46u8DqzB4
         ty0hoMLYsTIegr7fbjxVg06OWgmOiVHIFFSiMRJ37onoPzCnuAwO0Qpg65U0JQt7jw71
         uILrzkbP0+sbbtxNErTFboF2VMK12OTWevDCNuEg1Rd/CiBK5LFHilFBy4wTIKUWCgFY
         qanCm3PfLyPisJhQn01xFhn6bMOi+L1YvqULgK7zzcW/+R5c2Fsy2BdoMkFSHu6ji17U
         +Td4nkdUY7OOTQCkBMf4z4WN8XMwphsBXxZToh2m8gloYRNXMsRlws4xqUnNA2rDaMND
         l5zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q09r0KUS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5ceac7448adsor3785048a12.2.2024.11.04.05.27.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 05:27:11 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q09r0KUS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730726831; x=1731331631; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AkttCzgUV3BRt8IPVgGGCOwte4MCCFD2pradZxoj/H0=;
        b=q09r0KUS7IlupPrXmoRCEJ4gFa9TM4RFejGnbWN/02vABPDpGczHU2ISjIZDIOwvMW
         YwLNzlJrfFty0NNBdLXzEHhB+ceBjMdiVkIwj44zGF+9f+ftKtmrNKNXdPqER+dQ1NsO
         8IUarnNAiK09LDdoqraps6TykM+t5ONfsnCjeNvNWS3vnHEFhVG5cgxNGgehHkxgRwwS
         ndj5vy8L9x+pozFaRxIV1ISVxPUkogahZByeTyJTj8KdSLr0Jr6WzX3xEHAV7L6TnaRv
         dhzuTVMRfEuExbJhCFvzJytktoF/IqnFqwXUivEkZ+VaRkEbvfQpfKsGTVrmCi5PvfCc
         dwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730726831; x=1731331631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkttCzgUV3BRt8IPVgGGCOwte4MCCFD2pradZxoj/H0=;
        b=eMFW1/qBvWVom4uZAnhHYY12FXlZdxwLzYwXxSoFA7GGqtOfhU2ZJf7hEsLB3W/wl+
         mtTBi5fkPjAH4E9G2wxCC9m3ErXnP/qdJJQM3dM9QZIW58LBGruSIf1EVSHsFehsJ/Nt
         n/fxZ3/VMAbGtoy4g0fKrr3AdcK4Mzwqjmu6pTTswEUtDndqvvy8EFDe9NJYVvvogXCZ
         kFWtwuADMGkMFCSnl1bUZr8RevSNJDiEtWDyN2fCWdNOuEvKrJaVEI8uCMeDRAXF8tMg
         saKyQdp0vLy0wRvc6T+upPx1/VZwR7+g5PCV2u8TsAt1RDXampUhT4i/fEmy/8dEqyT8
         9uqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/JrbA13zAa70fvVyCnLvwEyln1YTEXqnOdrqpDCiagG+LRLf/YwAxsdnvcCsL2pIwR+LFS0lSwv3FBQ==@linaro.org
X-Gm-Message-State: AOJu0YwsaX3e49f+aYXAzOg/G9NJSuq4K+Jd8jtvgIH81rn7HITdIJc6
	uONLu9t3NYOYNK4Xtoe+zuobQhDndwoDhnCzmXP3mb/qwzSemXBbpSzJ/aAdVAXklVIgNT9DIt+
	NZ+q8myiZEC1TTvdIgDB7mLhe2abQK+eSiStuLNzt
X-Google-Smtp-Source: AGHT+IFXAkc6iIy34i7xg898djnsHLTDuDGjZ2mN0WPUbUdzvkLwwto8V/maKZsbdiwr0farIxVEE3qUUZn+/Syf25g=
X-Received: by 2002:a05:6402:2111:b0:5ce:dfbc:7fa5 with SMTP id
 4fb4d7f45d1cf-5cedfbc8197mr937401a12.25.1730726831066; Mon, 04 Nov 2024
 05:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20241103152455.202462-1-salil.mehta@huawei.com>
In-Reply-To: <20241103152455.202462-1-salil.mehta@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 13:26:59 +0000
Message-ID: <CAFEAcA91DoU4dAHYy6OOeMjEQ+0LGZX8KM-rKsCh89UnFS4yTQ@mail.gmail.com>
Subject: Re: [PATCH] arm/virt: Extract common code to wire GICC<->vCPU IRQs
 for reuse
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
	richard.henderson@linaro.org, jonathan.cameron@huawei.com, 
	alex.bennee@linaro.org, imammedo@redhat.com, pbonzini@redhat.com, 
	gshan@redhat.com, maz@kernel.org, will@kernel.org, oliver.upton@linux.dev, 
	jean-philippe@linaro.org, lpieralisi@kernel.org, david@redhat.com, 
	philmd@linaro.org, andrew.jones@linux.dev, eric.auger@redhat.com, 
	npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk, 
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com, 
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com, 
	miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com, 
	wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com, 
	maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com, 
	zhao1.liu@intel.com, linuxarm@huawei.com, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: P+xTQlL73CHb

On Sun, 3 Nov 2024 at 15:25, Salil Mehta <salil.mehta@huawei.com> wrote:
>
> Extract common GIC and CPU interrupt wiring code to improve code
> readability and modularity, supporting reuse in future patch sets. This
> refactor is benign and introduces *no* functional changes.
>
> Note: This patch has been isolated from a larger patch set to facilitate
> early merging and reduce the complexity of the original set, as it
> operates independently. All original tags and author contributions are
> retained.

I would prefer to see refactoring patches in the context of
the series that makes them necessary. As it stands, there
doesn't really seem to be much benefit to this change.

thanks
-- PMM
