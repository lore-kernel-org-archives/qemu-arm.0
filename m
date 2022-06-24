Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp387815lft;
        Fri, 24 Jun 2022 08:02:22 -0700 (PDT)
X-Received: by 2002:a81:1591:0:b0:317:bb1f:fb83 with SMTP id 139-20020a811591000000b00317bb1ffb83mr17698018ywv.362.1656082942064;
        Fri, 24 Jun 2022 08:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656082942; cv=none;
        d=google.com; s=arc-20160816;
        b=oQhi9uWX456xo+307NLOtME9nW9t8a4LSSzBHnyYgD/k4yFLLN6l/eHuM45b1+5tEh
         E3UcsBwbFu4XTqPYHni9VC7jaqru9qWIUQQM6PwfyH5FTTjpdwICN04HoOn0Gk3T27k/
         z9eDFOT1i1mQlAH3sXGdKSyIkOZHDz99z+6SCppZuY/LOLbSPMOpTtaAEtS816qIAaZc
         pSae1fwrOm6OA5WDY3r2ZCxa7ovOyqIHae3mQmXGJpVGlAobWbde1Qc/qQm5rfwu5JX8
         iTkQs045AOzQVa7di4XG7VqivKdWUpKAUTdyfVY4oH/zrKyIImwKwBtaCu/Mby79iyCA
         BDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EnYWT6+eru3uHPWApb4vpG/T5apsG8TSW4cZmehz1lw=;
        b=P/gHZWlVZD6OVQ8AklVfKvelZ+1NOPulvvAzIJqm/ySwz2rb0k9owZEYb865N9d/iI
         1pTWO4SRCX02rMFbYcAoBPRqxjgSMro040GS+ZxAh7iFTB4S7x66OJHSNzRtXfW/fX32
         SeI6B4xiYuAWp+cUGuGZvjFvWZ/TLgqNcJzz+YrsqOtl56AvlNSH51nfAKwvNHHnuAue
         2xbAEeo1vzJoFVEkkUBn3OiRMdZncB30Z6rLSd7EHn7LN2rNUglz7Dmx0ukLhmToQG8b
         I5QGr4lThiKOyJ8Xflmk7Wh73W8mesqwZe90/vjGFojCzIFwtJy+VDBI3X7+5i2wPQDN
         +Wow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zq7QZtDL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v18-20020a25b812000000b0066997f75f8bsor1268376ybj.4.2022.06.24.08.02.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Jun 2022 08:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zq7QZtDL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EnYWT6+eru3uHPWApb4vpG/T5apsG8TSW4cZmehz1lw=;
        b=zq7QZtDLmFXHZztoUKje/w4bFHHUIrWSc+EfGMYwAsFnl94+nuNoEQtNLEwY9Utw2w
         XXlgeWTqV4VMtIEmbW2CQR22pTCLVggk1Cv4M2swje8tO3XyslNXhF9lkSfls1aH91vE
         lUldpVSJyfvzAPqlakH7K6aa3dkNP4Y3Z5OfRaloT4Rf2Z/fAT4EuXhgzD8drzW8jIui
         dS+whmMIYPOloBJV86hpTHDS0Vj/ImCxuJGnN+5JSw7HIJ6QxhIwj6ZM2FozegAZVkoj
         1Ej1zI2qRvyaz/uh/2rMK9RGC3pgcofibN/k/HtkE8jg+mQR5hwjTDPgGLiSK1yVRAY2
         Narg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EnYWT6+eru3uHPWApb4vpG/T5apsG8TSW4cZmehz1lw=;
        b=LCyXrFXpao7J9Lft3NKo+lIOUn7YvqaZv8N6OHvvQwOJpbAXuDhsZLSexlB5NHRsPy
         fdrrr8UJyU9RUtgkyfrPVgKr0h3lLwheBp1664i+j7N+ClxBvZ7phc87/YcvjvLscXA0
         O0uGgEeNA2FJXnVhEndUY1iAeMZ8Nxs6WWC4qCrq94TG3L4DT51se/i5OfqOcS0O9ux7
         kFAj0gB9tHTN5FOYG8JrPeXeP7/UYdyj34bG3YVw+DgcxVcmbN4FsmqG/V99ykQLmKll
         mWd9esVmAhMN1AtC71NbqvuABjpAkAx2A90owcclmP7XYlAHWcYMPuZdrG1y6inDPlBa
         /OBw==
X-Gm-Message-State: AJIora+OLapdVdo+kKbmrU5uDbopqLKnn1em3+S+T/NbTxwn2SvCkuMc
	pXpvuN1OXLKNl9dDb3ZzSMdBH0Jt20bm/3yqFsnksIWi
X-Google-Smtp-Source: AGRyM1uMXPWDr04izJp2BwkDssX+25tzbf0qMTakadA3kQlppmVhNAe/FMBviiZzY01JVp7a7VLvfBEFR7iSRsB3KFE=
X-Received: by 2002:a25:d655:0:b0:66c:84b7:df40 with SMTP id
 n82-20020a25d655000000b0066c84b7df40mr19510ybg.193.1656082940786; Fri, 24 Jun
 2022 08:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-2-Jonathan.Cameron@huawei.com> <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
 <20220624133909.00005f6e@Huawei.com> <CAFEAcA8GA+ZXr2eS9bVxnhZRtda17Wx0Ud8CfcA90T6yiaecew@mail.gmail.com>
 <20220624150844.000005ec@Huawei.com> <20220624155436.000047cb@Huawei.com>
In-Reply-To: <20220624155436.000047cb@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:01:42 +0100
Message-ID: <CAFEAcA8MLTm9XwAV_JU_EPiT9wfaZed8B19-pL=HobKepJsnkg@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org, linuxarm@huawei.com, 
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 2zMf74SbFdoB

On Fri, 24 Jun 2022 at 15:54, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> Just occurred to me there is another barrier to an approach that adds
> DT bindings.
> I fairly sure hw/pci-bridge/pci_expander_bridge.c (PXB)
> only works on ACPI platforms and is the only host bridge supported
> for CXL emulation in QEMU.

Isn't it probeable like any other PCI device/bridge ?

-- PMM
