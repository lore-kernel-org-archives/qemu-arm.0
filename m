Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1084548ejb;
        Thu, 7 Mar 2024 03:46:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUn9cJKWn4K/2KvqAookd6/YPItUBe9egm2CDyot5B79oUWZLHnqQ5+S+91nm3GYtVgHQi1mUo1OtqM9TWNjwYNkXeytuH1
X-Received: by 2002:a05:6512:3e26:b0:513:8368:7aac with SMTP id i38-20020a0565123e2600b0051383687aacmr893570lfv.26.1709811977127;
        Thu, 07 Mar 2024 03:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709811977; cv=none;
        d=google.com; s=arc-20160816;
        b=kCVrf1W6Z1mGYOnw9zpxGDAZouj/4tG6oEgiC9bsp73ourq9NaCTP2kOxGecRzgni+
         UP6S/Eq6ZXVTDiQcuG6tOtx8Igk8FsUFyi3qUpd6i48PQBXFyZrLQAOPqRPJg+WXZdMh
         PQopn9LemSaLk6ciT+7NtKm0lVVG7gm8LIYJme0PfAcXAk2Eg8PMrBy7oMJ5YeUNjshk
         p2XUZ0S4DrR5zj65ecniu99gAaeo0U/aAHJh4PJTW5eFQysLSLHNQjtIzNK4YW9OqS6x
         lp+MjKF/N2uf4OMQ1yJV85HPROICNswJJAa5vkS60sszQcDt5hMvgFluhj8MWO0zFBA0
         4xoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=3FEKikgmbE/r5zzOA+k0Nr1gqI/iXTequF89jFi37Kw=;
        fh=XZwinlRVGl/ziDEw4+Z2nGT/+l8/6mJRpGc1x4dohLU=;
        b=G2xCUzmiQUp8sAyrrLmquEwp1eIkFgYGvN8LoDaCE+FzfqahzfbbedC+QI9IM3wJ5O
         rZ9Lt384rrVINBXER8PGwPa6GMZUOJnBlIBxPbdeO/DeFnVIHugs26e63z+3ngJoqawV
         4A+fSTm7H3/tLBPWfAvy88dIeIr8BdaTe1Z5VxMgPWDhf75pkr8elfVei5hSwHCHdCG9
         XOHiu/jkmIpu0ZfMajzwE8NB7JhYqIttxh73F7oJI1dhj8Fng7vkJtXDC/P3fn1O1BX4
         3GAVzCRPGC98fZObhtz5/740St5TUIb40gbT0bfIJ5E+QFC4k2+mlADCVYt04MDPlyyX
         Fbaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ml4LoqrR;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y3-20020a196403000000b005134da42cbfsor1973580lfb.30.2024.03.07.03.46.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Mar 2024 03:46:17 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ml4LoqrR;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709811977; x=1710416777; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3FEKikgmbE/r5zzOA+k0Nr1gqI/iXTequF89jFi37Kw=;
        b=Ml4LoqrR8EAsCzONOK0Y6w73h1RExmPRqgdoSTybfkIgBLYJt1PrUJ+3NFhY4sqCvp
         cUYo3JaVuB5vi1n31cDmmoYLs3eTbAibrtx6KPWZhzWEmbSfarkES6FRX4i2aYSUEYc4
         8PMtw1z+QbnuSSSGYTcpb6ylDEeDDgoKiWOmclIsjA3iTlUj+6338gW2lsuEo/YgDRfV
         wMi83EjFo3FQAUIv4T7/tZ86qXGLiytwa6th0KIG5qAupZy0ldE3Pd3ow27yeMIcflZc
         vuVIoHzJSyuldTGPCC/TvdD7qjMrAIyndjnaFBtZl4Fq0I/FAuLl2obtLYOjZkb2D3Tc
         QOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709811977; x=1710416777;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FEKikgmbE/r5zzOA+k0Nr1gqI/iXTequF89jFi37Kw=;
        b=XWPCx8S/efRb+qvvQB91qg2X2tPXwQkbF4+DkHN2yan+1EQiqgCx32uUzDCaepubhZ
         20SpO7yxTwyquaLkmE1A4kE8S5MZZSjYKEym7kem7VSVWQpxOTkSKzX2FjaGcrtm1jLD
         psq5QR+EtEorjNBguH+Qd2/CDR5cZb7c0Y3m05CkJvniMFwUZgG6/oVM0LsZ7f4I5xUo
         /QDmO+J8Pqqe5S/HU7uKCzjn3UPBJWE4s642DryqPpJScPhF7fV6UR2SY9LepmMkeJL1
         gBvaHZ2LpHx26KWmWNv8FxwfPEiaqM3yckJuWtZI9V/Stxh8ZJPDwY1ePpKgb7jtJbuh
         XyDA==
X-Forwarded-Encrypted: i=1; AJvYcCW4SlOdH7aRfmyFRGh/MHUCNks9agtqNkcONwNlfzEOrm6ZkEvA07PFKNhR/jzYSShrkuS6E0IGwreN2eQiVRFHw2UQqAl8
X-Gm-Message-State: AOJu0YzhKXWaATm9Uf9TnoEXGjxOFflPUzMIjf7aeL6dzY8xcUEh8JCY
	6FnLtUyAFbzTJBMqdSoLHvrzFKaHRK4wBxJ96ZxSg15bSNwAC8kQlg0zfjqJUt5rpzNG4uj0OHP
	bqMAkbA==
X-Google-Smtp-Source: AGHT+IFH3wkwuGOA+F/yj5AIdWusXZJacoA67XWG5i8L99raCDY6RqXWR5e9a7fc4f3xfADZKnZc2w==
X-Received: by 2002:ac2:5223:0:b0:513:4777:f8c9 with SMTP id i3-20020ac25223000000b005134777f8c9mr1204156lfl.6.1709811976634;
        Thu, 07 Mar 2024 03:46:16 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b00413101235b0sm1951412wms.2.2024.03.07.03.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:46:16 -0800 (PST)
Date: Thu, 07 Mar 2024 13:43:50 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 1/9] hw/xen/hvm: Inline TARGET_PAGE_ALIGN() macro
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-2-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-2-philmd@linaro.org>
Message-ID: <9z7d2.v9odatywozfr@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: Nk6GN6lHpwN4

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Use TARGET_PAGE_SIZE to calculate TARGET_PAGE_ALIGN.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index f1c30d1384..8aa6a1ec3b 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -678,7 +678,7 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>     trace_xen_client_set_memory(start_addr, size, log_dirty);
> 
>     start_addr &= TARGET_PAGE_MASK;
>-    size = TARGET_PAGE_ALIGN(size);
>+    size = ROUND_UP(size, TARGET_PAGE_SIZE);
> 
>     if (add) {
>         if (!memory_region_is_rom(section->mr)) {
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
