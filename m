Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DDACCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 12:53:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBBs2-0004Ni-JX; Tue, 21 Oct 2025 08:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBBrk-0004Jb-MJ
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 08:53:28 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBBrf-0007zk-SI
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 08:53:28 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-633c1b740c5so5367215d50.3
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761051201; x=1761656001; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuSNCsRv/59+EAgZl2384UmefgwetvdfFm3jSW4yRDA=;
 b=cDUNqoYAPqoLG8I+dRAbrP7pJQxRrKFa6ZT9jtxHsHKMEHWAdv2whjqq4VQZHJP6w8
 /v+WDHv15VLw/aEyAJESUMqhY57lMQPOoTHScfdinwinmLKnUfrI2eWaZd2QuR2LUZHV
 DPRhYC/ld+vD7TICk21Yoz+aRUL6tbhpXbKXyVMk6R6k+eBRJSX1xOjA1lQ6Sj3SfXMq
 DKytaZ7q4dTMpAPvKrra59T2rAM/zMcZcRp1P343tk7UGgw1QI1lK2+Jq32VQqDq0BKx
 MMubYgPC0mHUKDoQIo/yh2mjjjlIQ3kA2vReIlKOFpyGk9bBVodEVvtI0gwqamx2rUk0
 39ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761051201; x=1761656001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IuSNCsRv/59+EAgZl2384UmefgwetvdfFm3jSW4yRDA=;
 b=WKWFaRpk5M9hVgie9/3OiFR1nlGVb0aHOpeSKFjgrycmda8MSUefA+3ElUFA+0ohIY
 fVMfwg7O/l4StdiJLHyjf85Uu98VbICRwVdTQjK4+zMNBObu9XRJyN968g34Fqob1YPg
 Svu/CAa9EZoYiKuYr8NYIMmyeNrazrX94tVXNWVfrZd1RV5foO32u1uSJZd44MA77wwt
 Y1F/gAdeQJQfB0bMyjbTafjjXiOyQMuF6DCocFbYmvfnF7XUVmWv/ZNejZVQkU0qutRs
 8DWQf9r5A/r2EzjrOfRbGE1tD6VFiS8DEliSasiqECT1XWLF/dtCzmknSXdEmKZqCI6P
 4tfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSDLG+rRNPqtsPIdW/2/GWcKquJJQNIvV3TA3b/iP55JwDz/H7ZAybS3ZQvmgApTUlJLGWYA2xrQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGZ3BNXVPLCoZA99DOzaD4Df6zHj1vTn7ksWKmWRlybXyNxR2p
 11lZx2gfD8nf3VWe4L25WfEgFIAuxm8gH4uH68FPPJoLFeYVDmXq+vhvkk/62srmko1/q4TIBPq
 APF0RWLuFkEhJUfg/R45N/IjSfwf+OU9trhhI4KZEjw==
X-Gm-Gg: ASbGncvPe8cvQee9d5JHJAcjS6gzi8qUGcDa80ooELu1k78Q0eAeCl3m1hv1Wf+H5E+
 /1Fy4E0Pufb38wtmbQEDjXJECsJZCXDBzW3akm2OKyhhDirhPW/BaXSKp5LeOsMuWQHfs45DKM3
 gW5MfW4RLsXwJVG9gDaoYeSCnYHLH23O9xreF0iCdIBLsAeNWfFXZXYf67/gzKk4HDz1YJXrbKN
 R1upegPa8hy9TyNEwrZVXbBBW8GuyWYPgJzhTyv3+s943bZxmcMrSwEgOK+MzRoVAw+FgfErV0G
 y/T2RII=
X-Google-Smtp-Source: AGHT+IFpbT82ve3LXltYZEPsfJS+RyLmbXt+5DVAMiKWeQCDlh+pMWALlMmxIYO912MM0kwsJVP4r1RcRcCjaeA4YeU=
X-Received: by 2002:a53:acd9:0:10b0:63d:7ac:b991 with SMTP id
 956f58d0204a3-63e16179374mr11700457d50.5.1761051201041; Tue, 21 Oct 2025
 05:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251021122533.721467-1-marcandre.lureau@redhat.com>
In-Reply-To: <20251021122533.721467-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Oct 2025 13:53:09 +0100
X-Gm-Features: AS18NWCp0ty09wq1HmsCT7-iy0cpel_3YH3JRfs8VpJn1hbNoYoCwcqrR0HZzqM
Message-ID: <CAFEAcA-jPE_onLYLMxgcAOB7dWRXOLJrWcGPnR0NUdjYytPDVA@mail.gmail.com>
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Alberto Garcia <berto@igalia.com>, 
 Thomas Huth <huth@tuxfamily.org>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, 
 Yoshinori Sato <yoshinori.sato@nifty.com>, Magnus Damm <magnus.damm@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L. Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Corey Minyard <minyard@acm.org>, 
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 Vijai Kumar K <vijai@behindbytes.com>, Samuel Tardieu <sam@rfc1149.net>, 
 Gustavo Romero <gustavo.romero@linaro.org>,
 Raphael Norwitz <raphael@enfabrica.net>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer:vhost-user-scmi" <mzamazal@redhat.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Zhang Chen <zhangckid@gmail.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Jason Wang <jasowang@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>, 
 "open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtiofs" <virtio-fs@lists.linux.dev>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
> The actual backend is "Chardev", CharBackend is the frontend side of it,
> let's rename it for readability.

I always thought the "frontend" was the device the guest
saw (the 16650 UART or whatever). invocation.html has bits
talking about "virtio hvc console frontend device" which
seem like they also use that terminology.

If we want to clean up the naming it might be helpful to have
a comment somewhere documenting the different components and
what names we give them and how they fit together (or even
better, something in docs/devel/...)

thanks
-- PMM

