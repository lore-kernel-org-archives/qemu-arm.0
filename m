Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4783077njc;
        Tue, 27 May 2025 05:38:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1PaFtGzxXGT/I4xm64fTsu7JhZ/gO2BLm5TMPgCeK4SZfBemPW3w8CqDbTX90yxbkepAoSiPjw9mMGg==@linaro.org
X-Google-Smtp-Source: AGHT+IEkxrBcifA3+ITOgqumELd6Op7lPcToUdupiRRSsogmHpRGTI8kzx85o0eHWkPqdoXgOwaB
X-Received: by 2002:a05:6214:20e5:b0:6f8:b73e:8ea5 with SMTP id 6a1803df08f44-6fa9d274139mr185337956d6.26.1748349503442;
        Tue, 27 May 2025 05:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748349503; cv=none;
        d=google.com; s=arc-20240605;
        b=ORHvPl6qinCLdZWS+2eNzPKqQNv4i8Robgfy4WvN+8Sm995/Q4e5Xld8h5ncOpeW4I
         hPVSZ2UPldciuWANvjMTx4pw5MGkjFlva8l3DxVvBmHZM3O/XNunLuuZKb7E8QeYuDPT
         x6Ze6mBQ/9G1o7lLGbNNHOgRbH3UrXs3LHbf5cMZRH7B2Giw/IFTdS+BNrznvomkIdHB
         UAwsdLIOWN/BtvbZJPzZb2x5c6CAimuAEuIuJ3fCfjwsPnKvekaMyE8gKKmBpv4stVCL
         skNICyWTsNfglQerapPNnX8b7V9nZjbqtMoxbsmW1vER/DHvP7qGWeQ6Z5+QTAlx2bNC
         4Efw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=PxoM0yT0VlCIDnWX2gHU09f9MEXNnWsHeLWqfkJVxZM=;
        fh=8sDZplUERAmPvLXwvOc/JQ6fxJ/aFy4DBrLQhilEL+k=;
        b=aOmYAqJvuxjQivIrIGXs62cXAc99cff5LpFtKdYIziTXNdIt7BR0bcCiIRE7lZzYJL
         1ZtIGgBawkKI1NAyargMiqMaUy/1NhRotduY13PMuStZOM1o51mU+6oKDcNwr29kgLXZ
         o6901u2EPowB37BSaZbqjxsxGIQghpYi4wmGJc3K5kroXdgQF3xYH2EDV+nvoVf8tN7V
         YzpA/C0xM+BJKZhRGVXeSB8vBvIiNJ/JEuERALWCe+huHqse9G1gU5BT7diWMF0KBmh8
         9cjSTVlXeCOqY6EdGePXoge1AkO/yPjmIV+JB1Cnz1FyoMWaya+bE3JFuMwj7ByV/Ggp
         M77g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dw6knXsF;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faaa08ceaasi49339786d6.329.2025.05.27.05.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dw6knXsF;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748349503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxoM0yT0VlCIDnWX2gHU09f9MEXNnWsHeLWqfkJVxZM=;
	b=dw6knXsFExSghBcE9HGuzV7pUElk0UZYoX+SpqZmWJ14/yEUTM15OJUe/vFg9UIhoBTgnb
	jrBXkUoSG1+Xmn8ecCXInjwXXTebIrN27igzzXFb2eWsQsf853KLSoJ4aVOSSde3aDaMbC
	G4pX1mRSd0L36DdQ1tLg9/J4NLuJSzs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-rIY_xb7RNP69TZqWBXB_WQ-1; Tue, 27 May 2025 08:38:19 -0400
X-MC-Unique: rIY_xb7RNP69TZqWBXB_WQ-1
X-Mimecast-MFC-AGG-ID: rIY_xb7RNP69TZqWBXB_WQ_1748349499
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-44059976a1fso16297495e9.1
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 05:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748349499; x=1748954299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxoM0yT0VlCIDnWX2gHU09f9MEXNnWsHeLWqfkJVxZM=;
        b=VOUoyPI0j6OVYxjL/+pBwWsaA8SSbzzgOWQ1+SmOobMicqhXhuNshuSD3OU/RQ+Amr
         WSECqPylSlXgJX3HGhf27UoObIAkNBOHgl5N8MnABPy1ZU4C09thIQI5L2lVxG8NazFK
         qNRWBrs0ZDIQwcUInlrvFQDH7gRYSdH2Jr7m+kJxUBH+L1kri4mWRd4HRJbCvOfWMQR/
         fNIq7NOpKC8JcNFPeF/jAG4nyAAD6kyFZx2rCuH2K2YayQa/s60V18iproDzH//+/Wx+
         qeBsqRDg5/2dyBe0dyncGqKOJCU66iY8Bwn51K9w5KYXY5jSLNTVTfHC7DRzdzmNR2dO
         +iXA==
X-Forwarded-Encrypted: i=1; AJvYcCVKfUQlcvNmX2MWBbP9m5kpob71BFHhaGuOdWpno2Nbn/YumsTgr9rUtnN9lDN38llnRFLmzHK9q4LkXA==@linaro.org
X-Gm-Message-State: AOJu0YyS1hRcuMjUkW7jrb0twDdx6fB9v29TCEY6uQB9huest7XP0S7v
	YRuMnxRFgAGK7gkVOQD4ZgM5O0BQq5qtpGzOiVho4jnPGye1SglhNef6Xkax+ISRrLIiDGM6LUG
	JHCEtIPWzTdh6usQhwCAFcKNu93PxiFO00xGghzZylI4qqoQClrHamyvVtw==
X-Gm-Gg: ASbGnctIE6KG2l0Uyh7axdSVD+9940yKTWpeCqHRWiJCKja3n1fB/twe5FgDMjeWCEo
	xMu5nAhfUuAhWIB+gXeRMEznYWndO8pxZ8e6I7RjEJV27BzBvoM2k/gMXOEwD3OUmnC5+LRpVSD
	SUFujDLatM2HTU2FjrQ7Aeg55y1nbLTrtXfRQ2QRMMtBSxgaI8m665TPHLpH8J6eXzYMJfzhGJR
	VSGdpJhVEjTTMvT6X/FCAnP+T/2o/rvvybbQ09LoOYK9Rm79rwEHWQghOk7ZxfyDtRNA/BldkXX
	42o/I6EtOHHNzwinlrhBPa710cX+kvlq
X-Received: by 2002:a05:600c:828c:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-44c91dd1676mr137771125e9.16.1748349498669;
        Tue, 27 May 2025 05:38:18 -0700 (PDT)
X-Received: by 2002:a05:600c:828c:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-44c91dd1676mr137770735e9.16.1748349498288;
        Tue, 27 May 2025 05:38:18 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e660f779sm63407f8f.41.2025.05.27.05.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:38:17 -0700 (PDT)
Date: Tue, 27 May 2025 14:38:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 08/25] tests/qtest/bios-tables-test: Prepare for
 changes in the DSDT table
Message-ID: <20250527143816.39c0dfab@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-9-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-9-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OpncZog8cSKzihLuSSftcr5UUOel0hTY61q9xxZtbwk_1748349499
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: W9Q2HGVtCEsb

On Tue, 27 May 2025 09:40:10 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> This commit adds DSDT blobs to the whilelist in the prospect to
> allow changes in the GPEX _OSC method.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..abe00ad4ee 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,6 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT",
> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> +"tests/data/acpi/aarch64/virt/DSDT.topology",
