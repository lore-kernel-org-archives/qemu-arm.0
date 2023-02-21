Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3483045ejb;
        Tue, 21 Feb 2023 09:56:32 -0800 (PST)
X-Received: by 2002:a17:90b:4c50:b0:229:2427:532f with SMTP id np16-20020a17090b4c5000b002292427532fmr5717319pjb.40.1677002191854;
        Tue, 21 Feb 2023 09:56:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677002191; cv=none;
        d=google.com; s=arc-20160816;
        b=sxgaEqSu88ufHBboOzLsflChjm+PdJGeVvL5O5I1d3Sso1Gw0ZGjoOFLwDN1zK8vQE
         ckKCro3sJGSQtDl1Yv9GTzKtWdgbHCFWaArmRAZ8zTeBvL7RGEwSGZ7LhIAi6nHLRPkO
         u0IbFVgz8MLxEkcbUsxuweuIkXsD4ZvtFR07eUYLAE791O/mtVKr3BKIoNRhsoWJMi1E
         tvHV5LgrQQe3qApCBr8FGOkhJ201iDNfyQi3CIYkqy+o8YRVc3RMpLpWf8tCutw4LSWj
         iaXt5seRG227+2R1PzxhkRdD96SiYkLkYgqgr5dKZ52KPPBfyyNekRuVKcDfFPlJp7/J
         u3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8FZF5olWX/MFoaZaOXMYywStP/0w8sgUS6+NDQeB3jM=;
        b=fSKVf8EKFNY9+O2xCyZBOc63XQUXl+l4yP7KpvuEgRSf7a451rq1sfWZsp4+hyUL0h
         E4fgvq5Y/fwoYBH9iSpF94R4qFWvYxTHRjBdU0U7J0diESWsecWcUWKUYFuZB+RviSjH
         kEvnuRlDiY/cDNVPNCbfWufZk2UB9SRXZM0Ctm/mBs8lHmX81uVn3wpcUYRsUr/72SC4
         6F0gIM3GLH6R2zcx6h+64FWKFtDlT8T7UiLPQl+g/pa4Oy9z+LS6StHzNaXtsWIj8nf/
         vjImAkCvzRIRu2qUA/cbV/QasQZ5JgWVaXh3QlE+t8r5gsCb1ouBPR1d6UV8ACmIT8MV
         6Wvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ekuy3hjj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ft12-20020a17090b0f8c00b00233be7f6807sor1684124pjb.18.2023.02.21.09.56.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Feb 2023 09:56:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ekuy3hjj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FZF5olWX/MFoaZaOXMYywStP/0w8sgUS6+NDQeB3jM=;
        b=ekuy3hjjsbHWU9qbroiqqA5sd6k4UHq3/b8rZX/1yOKIV7lSYTLmP7rzavWupkPNtP
         L7GNil/+Rb6wZcmoMc1IUN3mokFIxgARXbv6/10s7oaIO6JgV2C0BKjqVYK+LeeF4AAd
         NSyUzSrwgGdlXe+kRCnVVgmdyrJaJ29z7CNXRgkfZ055dKQ30AUKmLidgl34ufaubGke
         /mnp46LdblNtY1W40yBA/fufBYOGCKyIO0fD/TLwBi0RAHwXLVM7yuaHEoCbi98t8x/g
         R86Rg2YK0YrM1697UArSOpOUXhpHVlGC0+HKkzMkFpj9O3AhUzAP9Lj7rjLoN6DJEfd4
         726g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FZF5olWX/MFoaZaOXMYywStP/0w8sgUS6+NDQeB3jM=;
        b=hHH+YdFBHL0uR1GNTTi4gnOIjgpZjYuNeyO6NIxQ2UQpRZ/h/kwqyyHRsHy14WcniB
         xlv8swTN3mM5BoK9FyXag2Qo0T1f72s8T5JhA/XC5uZZc6viEbKtJrtquvwZe0p122MT
         oB9/k0RMDqD6GYfOp4tIG/fULvDsWJSKJHgfAB8A83zFjOjTwMrM+wzDvkjxigZRzB85
         ULAKzWCTaDlxCxCysBZcmxM1/c4l5+pzLDps5SoldTcJcEmrggXoy7SVWgh5ixasLcMZ
         YF5DOUqxiSmWkzIsiMNqCSMtBWMExhPoj6OiiqZaL1RkNeLwGSmq8a0XcBPFilhBqG43
         VeOQ==
X-Gm-Message-State: AO0yUKVpCCJQLWck+vnWkymkM5vedz5ce3p3ecCDaA6fzjewysz3A78+
	mw0Qit5LKVNbAO3j1+Po2JedpYEhaTp08CLfOCl/Cgzf
X-Google-Smtp-Source: AK7set+Jk8BhzRLsPO4FWEKM9elLm8+AmO/qa4xWr+wu4VlEfMrphwrNhVJDfI0XAlKjwHmnZxfN3rb3EQGqo3jwxrE=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1946913pjb.92.1677002191368; Tue, 21
 Feb 2023 09:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20230216142338.82982-1-philmd@linaro.org> <20230216142338.82982-3-philmd@linaro.org>
In-Reply-To: <20230216142338.82982-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:56:20 +0000
Message-ID: <CAFEAcA8v1q-OVoyZG14eDWL1_je=mzxk2U56mJ__P-eb2oAGJg@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/cpu/cluster: Only add CPU objects to CPU cluster
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Bin Meng <bin.meng@windriver.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org, 
	Alistair Francis <alistair.francis@wdc.com>, Zhao Liu <zhao1.liu@intel.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Robert Hoo <robert.hu@linux.intel.com>, 
	Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>, Zhao Liu <zhao1.liu@linux.intel.com>, 
	Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nNkfZMCkKzFI

On Thu, 16 Feb 2023 at 14:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Do not recursively add CPU and all their children objects.
> Simply iterate on the cluster direct children, which must
> be of TYPE_CPU. Otherwise raise an error.

The documentation in include/hw/cpu/cluster.h says:

 * The CPUs may be either direct children of the cluster object, or indirec=
t
 * children (e.g. children of children of the cluster object).

If we want to change that we need to update the documentation too.

I'm not sure why this doesn't hit the error on the armsse.c
use of TYPE_CLUSTER -- there the objects we have to put in
the cluster are TYPE_ARMV7M, which are not themselves
TYPE_CPU. They're a container which contains a TYPE_CPU.
This is why the docs say that it's OK to have the CPU
be an indirect child. I think one of the riscv boards
may be also using this facility, but I'm less sure there.

thanks
-- PMM
