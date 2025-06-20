Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp809784njc;
        Fri, 20 Jun 2025 04:11:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXugIFqNJno7xpR+8RUV1TeBlvrDrkvjjRlXqMBvBcrr+F8Dl9vWkDZiJtQRFOa8+OqXM/+keXoSPRmxA==@linaro.org
X-Google-Smtp-Source: AGHT+IGfqWPX7OnIaWrdsaPFW4toMnRxe7KXKwWWjLowDDZUovMGochIJ4pSa6H+HzDhmWLZOl/K
X-Received: by 2002:ac8:5a06:0:b0:4a7:6586:8e4 with SMTP id d75a77b69052e-4a77a29314dmr31322991cf.36.1750417898483;
        Fri, 20 Jun 2025 04:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750417898; cv=none;
        d=google.com; s=arc-20240605;
        b=JqAcQE+XO6zvpLD4Tils4qeNKLu76Xu6NWC1/RLXD76pF2ja9zt24661pP13O8qkgc
         O/d20PIUsw13selBg3copGnHa7Sjnh082vJgvgBDHeiHL0SC5Fl35Upka6seckPQql4d
         5TbN4DMXMFvagMvUgo2vfe3VkHdAOq0gs5nZMVjz6Q195WsFZZYIdnSRJNu4bvNPUZAL
         P02z60XZeWM0YwxXYWH7XPyaLMtPMoh/K+ZaNCc8I66pT7OMKpYlVFH3K6MTRAgVPJxj
         JSV+VVvZ03rBOsnVNdVkxM7wUGIelqRbF/NhF5SljTHeU5ATnVwJMjHtXIHrHaMEKIVl
         p4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=IIQfgc0Qf4BikpcAmB9hT/f87Ts1KJhpaM1f5a4GqnU=;
        fh=6joRo2pDxFhWbiOuvKLA8RNXGuOUj87QmyQHxFX5710=;
        b=UYEmaksMhmn1I38VI1Qf1QG1BBdSd8ek3z0k8Cr0Wv0bjczhotNnr5TvQhT/W5OnCd
         fxhkG3Wb64JA9wDTBKkCLpVgfGkKRhGoiCdayWldW9jWBDyaw8d17H3Jti8fhbEh9wzK
         mKNn18nNx63hcW5VPc+WtUAZuull2De+QAXKkXeDvPEEs+25F2JAERcCBWG/zsbJnF9Y
         VcpWRLYVp2mSfpW73XTkxURbts03DxQwcZVmMA3OV0LXbvv30sgM2wDdpascOuN5bF5Y
         tTqDX8mjd/n7CKykdpAQhXR3ZTSXFQ+8Y1ODhR+7A3Ain13b1b3KWUVH89VfXBF78yJs
         ioDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CHcxLK+M;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0e6bdesi15327601cf.589.2025.06.20.04.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:11:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CHcxLK+M;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750417898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIQfgc0Qf4BikpcAmB9hT/f87Ts1KJhpaM1f5a4GqnU=;
	b=CHcxLK+MrVuExkNhZ+wS/yuv1DQ6mKdjIVNuiyyWMASCpJSTRRfmKC7jlzxuNLfbyYuoUX
	NMnXQ25NLfEL0la5yoWLVtCbXjSQ1QU1TtnuySK1qMkx/aXgrrknKR1jdeE2BBuJFEX5mj
	MwG9zvnLJ++7VwrHK2dJWQS2C83eEQE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-pWse8TCqO-iB7ZcarVanyg-1; Fri, 20 Jun 2025 07:11:36 -0400
X-MC-Unique: pWse8TCqO-iB7ZcarVanyg-1
X-Mimecast-MFC-AGG-ID: pWse8TCqO-iB7ZcarVanyg_1750417896
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so10679185e9.3
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 04:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417896; x=1751022696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIQfgc0Qf4BikpcAmB9hT/f87Ts1KJhpaM1f5a4GqnU=;
        b=oqPOrnYWoSlQkPJ2Ljm0XEs/FzMYuznp73vN7c1uhLaeZN9KRha/+PZEOhS/lX5OES
         1o0ouac/tSi/5X3CjMjF3pJ11JKzLM1h3v4pudWGsuRAC74OrVOrcjdQzIgKeWZ+7qlV
         d+ABbySJpNjMvV0WDHg2IF9KYm9RhqgbmJ7Fs+u1WC50sCWQtfHPIsp+HCX1OWaeiHOI
         UoYbO1gu/CxX3hxLByoRIGOQ6Xnhi2Df6k9LCdpbM8lm5ngRuOnmoihll4E/KtFPtnAf
         0C7hjv2KTRFyq6eANwU3mxIZF4zqGIri6SHhLup9L+9aLBxkJulGEiVWfjQtKDT94WKm
         jccQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9J+vu+aYHYc48urfbbPKyfZOEfdyyVlahYRDLCJdHHZW8VX8Kn8pVPlkoNLxcDRaqFSxNjCQEzj/WXw==@linaro.org
X-Gm-Message-State: AOJu0YxIYb7nyYC4C0+TCImlgcHGtD3k8Vn5VSplq8cERK2TXYoPC9Fg
	oxqTCLq/PxuC4KiCNNlJ+A1ChpNCFgnqqPy1y5Rsuc2o9AOcQm1cJRhAzKdEpBzl82GJfFe7XFR
	MsM4yAdj2iGJ4WbOjAtauN3BXc2KsCWGHWjXBZFXUM2TO2gNbaR9uFET26g==
X-Gm-Gg: ASbGncupxBJBCOhEKmbfdbYbsWPIx5tVcObMWUJ1DeMdT3l/VlbQk96XrFpYDtIQnS5
	925JnT1WCw3MdT0SZQLNIElYt0raTUsGGPUHFCWe0MPOfw4eMJ/leQvhxv3kSdDKXrpNSRJCTgj
	kk5a5heQaW1ZM93cLhQMa7mY20aETl/75pmxi8r0InMnpAmUXMhFessOQySaIWXv38IjIe4Iv9k
	ixX3hHXzUHa28J/4oFIDfDd5K7PlPBH8xuwmfrk3f5ovKBlZi4/uLkQWDbX/bvGsCaO4ec/RNrM
	F2dzMOpiMb7f
X-Received: by 2002:a05:600c:4443:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-453659ec19emr22278595e9.18.1750417895660;
        Fri, 20 Jun 2025 04:11:35 -0700 (PDT)
X-Received: by 2002:a05:600c:4443:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-453659ec19emr22278165e9.18.1750417895213;
        Fri, 20 Jun 2025 04:11:35 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm22246935e9.2.2025.06.20.04.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:11:34 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:11:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 05/29] tests/qtest/bios-tables-test: Prepare for
 changes in the DSDT table
Message-ID: <20250620131133.55afcb5b@fedora>
In-Reply-To: <20250616094903.885753-6-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-6-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FR_PJscxN6dnrKCtONj86SsY-xMM2cAMvkAxoUAezn4_1750417896
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: a3nza+xiZEjg

On Mon, 16 Jun 2025 11:46:34 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> This commit adds DSDT blobs to the whilelist in the prospect to
> allow changes in the GPEX _OSC method.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> v2 -> v3:
> - fox for microvm
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..75f057767e 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT",
> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> +"tests/data/acpi/aarch64/virt/DSDT.topology",
> +"tests/data/acpi/x86/microvm/DSDT.pcie",
