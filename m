Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp821600njb;
        Tue, 18 Feb 2025 08:54:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5QCs2tFNVsPq/ZMJ01RFOfFR5lmbdQttbEgvujTd4OCoOKJVVdoLiPhQHaeo2iDXH/LEU20WD8uhrGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH9t8+B3DnMwYRhS+ElbI6OKkWNWZ5KsG52Eoy+by1kMcJKW7HgDbpaN25+xIvHedkw8gmX
X-Received: by 2002:a05:622a:1f8d:b0:472:3ae:eab4 with SMTP id d75a77b69052e-47203aeeda6mr33735241cf.20.1739897647886;
        Tue, 18 Feb 2025 08:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739897647; cv=none;
        d=google.com; s=arc-20240605;
        b=NcW06kqUR0fZPlPvUP10qqds520cK927UpKgp+P0pF+jtVLLbW8SlzHUjAM5YL1AXJ
         3RzmSRuLRSZP6uHXptqBOzCmZS4SckZp2FWmvutvTjg8Xd3V2bKGiDfEcR0tU/BkxhPR
         AYSpd1ArlUw7DAvE6L9zQNA+lf79TZDaWUNqZtR7bTPAkVZY/MTRtSk6HQC3J0Qlz9ow
         n7vxKYFv0RONCFi55TMXZ27Ak44WWWPdU/SRbPS0eOWQ/Hd0ZsoRzhZ5F70HY6xMVmP7
         aBfFnhdXpep/BggzLKkDJgZMFhrYSa4PHYu4dHdAYFWY6UBiRwbRqYNJSMZsU7AXvGJQ
         mJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Acb0jfafFBvGRn8ztsO8g3jMuK72zhcxVEVRGIlU1Vs=;
        fh=y6XjFwIsJfHxaG7FFAX2qX1hdWe5Tk5xi3/D6UOTy4o=;
        b=LufFJq0eNGvBB/tsz+lBSVMNO/2v7L3LdZbmeHwQNWKKmFyvn4pjIg3eUwhIl2DGpS
         gdyULQ4FCc0j+dzOr8CGDKG7cTCAVhZM9IZmc7dOMBY1u/ZqjX0ag6kqKcOWf4TH3DCk
         6m6JeJxsnUz1+JO2AVcZtE8hcc+ER46w4W+xj7pACpUZibOiclH969SNasoENg9OZn/1
         yt8ik2TiKnObRmLlstOVPZexbfKLqOGTWWjdHAz9Q1TcNtgQMQrXWd7cL245J541jZLJ
         ub7iet9o4j+3wIDVhSHVpTT9xwsxtjR6drrZA7LoNVM5PUK7AWZQu6rTFQB68BW5HdlT
         XGkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVF55ymI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f3eab768si35966381cf.212.2025.02.18.08.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 08:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVF55ymI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tkQrB-0005Xd-TN; Tue, 18 Feb 2025 11:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tkQrA-0005XD-LO; Tue, 18 Feb 2025 11:54:00 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tkQr8-0003yH-Li; Tue, 18 Feb 2025 11:54:00 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e0373c7f55so5971840a12.0; 
 Tue, 18 Feb 2025 08:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897637; x=1740502437; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Acb0jfafFBvGRn8ztsO8g3jMuK72zhcxVEVRGIlU1Vs=;
 b=IVF55ymIzvQJxXpRgsFvYbGqhRR+MAT8SO8VEfwLJJMjFrHmvhWif74kpP63ogQA/9
 /L4JBPPT5jHDTJGhafs8PdvreOXohjYBMlj1i5Jzs4T/SWq1M37chkSQAc1qTyJZktxJ
 3+HrH8w+ydvgsSoB+fLgSbszgPi+p/gUi4scSlh9c1oQu9hy6Qsc0sS+QWgiESENW0V8
 Mk4f2G+egCf4D2ol4MNm9BrtgAS9fgAGXx95JdGO/RJBCBgJjvHtLG/irDgpCEfue/Gi
 m2Iqwqr801ZMpNnqcFFEOdgdg2pY3Dx/YUXFL9dTykUJzLUWGc+KviSjfUHci3gY2pq5
 GK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897637; x=1740502437;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Acb0jfafFBvGRn8ztsO8g3jMuK72zhcxVEVRGIlU1Vs=;
 b=XWgzzHQ6zuhtFoc7bl23O5e5UVc9FuGFCh6EYs+bDpJzYFw5zoRbNbzkBLntrJ5iVy
 bIcyILHzTRGZviRoBHlkDXCFVspV7HPuQQb8pmKNgIILCHMQar/tVtdydvcBL/WF8AN3
 FR65+zGvr+PVj7Gzw/J12hxhl2H+E5dajsRW8uQWJgKZBkHEKCfq3mSfcqfHzTP0MOyn
 VJmnhpsxNcOuicxGFhod3zNr5Rpf3pzU0d1qZH3UhAWk8QAHSc5KBwm3Har/RsGFX5Xm
 CVgbAD3HY7F59zI2Rqh2oD4rJliYS/0PClU/SamuJkP/MdUFkW/uoxhGipnZ7eOJm/0B
 Vx+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfPtSc/npXa2Ttmq6Cwk0p+uADQkKyQyr1w7jV0ze4UlSDKfiU8VTvrWdjxZ0/3IVps0yA8koacg==@nongnu.org
X-Gm-Message-State: AOJu0Yxf7qWVatLjO0A2gilTa/VkToEaxSrqjsdAwtvtWqPMVzFNL8yk
 8k+g3RxhL0xEJ3LMiPGY8uRcjE42UsoMxRoHNCKSjE/WdJuCGEzqUkffwnjeI45mrveJ7o6pS+M
 UEf49i/GJ807+THAu2IBB79TVIaw=
X-Gm-Gg: ASbGnctV1UsGSMh4r3xR3cxhn54J9iG36P5ddZLWJ0keTzqRmJKItvH3EcTjdGIo9ZA
 imaZsumF0CvhJWuR6W4Qs5T2mtv9qw6O0IJ4sAxgtdZ36ILGwiacIcb97V43HL1M7uyu1XwP2
X-Received: by 2002:a05:6402:27d2:b0:5e0:892f:89ae with SMTP id
 4fb4d7f45d1cf-5e0894fdf59mr103476a12.4.1739897636603; Tue, 18 Feb 2025
 08:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20250218162618.46167-1-philmd@linaro.org>
 <20250218162618.46167-5-philmd@linaro.org>
In-Reply-To: <20250218162618.46167-5-philmd@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 18 Feb 2025 10:53:44 -0600
X-Gm-Features: AWEUYZn5LuwzDkSx-rCRGTZteyxVR1TO-BVtf7sL7mpzeZj8f9Gh31H3E0RzwDk
Message-ID: <CAJy5ezqZcT5gSGhy1tmXK_j439j2YRbc68sThQEWPoJ0qT6Z2Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] hw/xen/xen-pvh: Reduce included headers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, 
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
 Vikram Garhwal <vikram.garhwal@bytedance.com>, Thomas Huth <thuth@redhat.com>, 
 Jan Beulich <jbeulich@suse.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000934ffe062e6d7ceb"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: tZQjAdboMpR0

--000000000000934ffe062e6d7ceb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
wrote:

> Have "hw/xen/xen-pvh-common.h" include the bare minimal set
> of headers. Adapt sources to avoid errors when refactoring
> unrelated headers such:
>
>     hw/i386/xen/xen-pvh.c: In function =E2=80=98xen_pvh_machine_class_ini=
t=E2=80=99:
>     hw/i386/xen/xen-pvh.c:84:28: error: =E2=80=98TARGET_DEFAULT_CPU_TYPE=
=E2=80=99
> undeclared (first use in this function)
>        84 |     mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
>           |                            ^~~~~~~~~~~~~~~~~~~~~~~
>     hw/xen/xen-pvh-common.c: In function =E2=80=98xen_pvh_init=E2=80=99:
>     hw/xen/xen-pvh-common.c:217:43: error: =E2=80=98MiB=E2=80=99 undeclar=
ed (first use in
> this function)
>       217 |         if (s->cfg.pci_ecam.size !=3D 256 * MiB) {
>           |                                           ^~~
>     hw/xen/xen-hvm-common.c:18:6: error: no previous prototype for
> =E2=80=98xen_mr_is_memory=E2=80=99 [-Werror=3Dmissing-prototypes]
>        18 | bool xen_mr_is_memory(MemoryRegion *mr)
>           |      ^~~~~~~~~~~~~~~~
>
>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/xen/xen-pvh-common.h | 8 ++++----
>  hw/i386/xen/xen-pvh.c           | 1 +
>  hw/xen/xen-pvh-common.c         | 6 ++----
>  3 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/xen/xen-pvh-common.h
> b/include/hw/xen/xen-pvh-common.h
> index 5cdd23c2f4d..17c5a58a5a4 100644
> --- a/include/hw/xen/xen-pvh-common.h
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -9,11 +9,11 @@
>  #ifndef XEN_PVH_COMMON_H__
>  #define XEN_PVH_COMMON_H__
>
> -#include <assert.h>
> -#include "hw/sysbus.h"
> -#include "hw/hw.h"
> -#include "hw/xen/xen-hvm-common.h"
> +#include "exec/memory.h"
> +#include "qom/object.h"
> +#include "hw/boards.h"
>  #include "hw/pci-host/gpex.h"
> +#include "hw/xen/xen-hvm-common.h"
>
>  #define TYPE_XEN_PVH_MACHINE MACHINE_TYPE_NAME("xen-pvh-base")
>  OBJECT_DECLARE_TYPE(XenPVHMachineState, XenPVHMachineClass,
> diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
> index 33c10279763..f6356f2a7ed 100644
> --- a/hw/i386/xen/xen-pvh.c
> +++ b/hw/i386/xen/xen-pvh.c
> @@ -14,6 +14,7 @@
>  #include "hw/xen/arch_hvm.h"
>  #include <xen/hvm/hvm_info_table.h>
>  #include "hw/xen/xen-pvh-common.h"
> +#include "target/i386/cpu.h"
>
>  #define TYPE_XEN_PVH_X86  MACHINE_TYPE_NAME("xenpvh")
>  OBJECT_DECLARE_SIMPLE_TYPE(XenPVHx86State, XEN_PVH_X86)
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index 9c21fa858d3..19876ad7e8d 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -7,15 +7,13 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu/error-report.h"
> -#include "qapi/error.h"
> +#include "qemu/units.h"
>  #include "qapi/visitor.h"
>  #include "hw/boards.h"
>  #include "hw/irq.h"
> -#include "hw/sysbus.h"
> -#include "system/system.h"
>  #include "system/tpm.h"
>  #include "system/tpm_backend.h"
> +#include "system/runstate.h"
>  #include "hw/xen/xen-pvh-common.h"
>  #include "trace.h"
>
> --
> 2.47.1
>
>

--000000000000934ffe062e6d7ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd=
@linaro.org</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_conta=
iner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Have &quot;hw/xen/x=
en-pvh-common.h&quot; include the bare minimal set<br>
of headers. Adapt sources to avoid errors when refactoring<br>
unrelated headers such:<br>
<br>
=C2=A0 =C2=A0 hw/i386/xen/xen-pvh.c: In function =E2=80=98xen_pvh_machine_c=
lass_init=E2=80=99:<br>
=C2=A0 =C2=A0 hw/i386/xen/xen-pvh.c:84:28: error: =E2=80=98TARGET_DEFAULT_C=
PU_TYPE=E2=80=99 undeclared (first use in this function)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A084 |=C2=A0 =C2=A0 =C2=A0mc-&gt;default_cpu_type =
=3D TARGET_DEFAULT_CPU_TYPE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~=
~~~~~~~~<br>
=C2=A0 =C2=A0 hw/xen/xen-pvh-common.c: In function =E2=80=98xen_pvh_init=E2=
=80=99:<br>
=C2=A0 =C2=A0 hw/xen/xen-pvh-common.c:217:43: error: =E2=80=98MiB=E2=80=99 =
undeclared (first use in this function)<br>
=C2=A0 =C2=A0 =C2=A0 217 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;cfg.p=
ci_ecam.size !=3D 256 * MiB) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<br>
=C2=A0 =C2=A0 hw/xen/xen-hvm-common.c:18:6: error: no previous prototype fo=
r =E2=80=98xen_mr_is_memory=E2=80=99 [-Werror=3Dmissing-prototypes]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A018 | bool xen_mr_is_memory(MemoryRegion *mr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~<b=
r>
<br></blockquote><div><br></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a =
href=3D"mailto:edgar.iglesias@amd.com">edgar.iglesias@amd.com</a>&gt;</div>=
<div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/hw/xen/xen-pvh-common.h | 8 ++++----<br>
=C2=A0hw/i386/xen/xen-pvh.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<b=
r>
=C2=A0hw/xen/xen-pvh-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++----<b=
r>
=C2=A03 files changed, 7 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-commo=
n.h<br>
index 5cdd23c2f4d..17c5a58a5a4 100644<br>
--- a/include/hw/xen/xen-pvh-common.h<br>
+++ b/include/hw/xen/xen-pvh-common.h<br>
@@ -9,11 +9,11 @@<br>
=C2=A0#ifndef XEN_PVH_COMMON_H__<br>
=C2=A0#define XEN_PVH_COMMON_H__<br>
<br>
-#include &lt;assert.h&gt;<br>
-#include &quot;hw/sysbus.h&quot;<br>
-#include &quot;hw/hw.h&quot;<br>
-#include &quot;hw/xen/xen-hvm-common.h&quot;<br>
+#include &quot;exec/memory.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/gpex.h&quot;<br>
+#include &quot;hw/xen/xen-hvm-common.h&quot;<br>
<br>
=C2=A0#define TYPE_XEN_PVH_MACHINE MACHINE_TYPE_NAME(&quot;xen-pvh-base&quo=
t;)<br>
=C2=A0OBJECT_DECLARE_TYPE(XenPVHMachineState, XenPVHMachineClass,<br>
diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c<br>
index 33c10279763..f6356f2a7ed 100644<br>
--- a/hw/i386/xen/xen-pvh.c<br>
+++ b/hw/i386/xen/xen-pvh.c<br>
@@ -14,6 +14,7 @@<br>
=C2=A0#include &quot;hw/xen/arch_hvm.h&quot;<br>
=C2=A0#include &lt;xen/hvm/hvm_info_table.h&gt;<br>
=C2=A0#include &quot;hw/xen/xen-pvh-common.h&quot;<br>
+#include &quot;target/i386/cpu.h&quot;<br>
<br>
=C2=A0#define TYPE_XEN_PVH_X86=C2=A0 MACHINE_TYPE_NAME(&quot;xenpvh&quot;)<=
br>
=C2=A0OBJECT_DECLARE_SIMPLE_TYPE(XenPVHx86State, XEN_PVH_X86)<br>
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c<br>
index 9c21fa858d3..19876ad7e8d 100644<br>
--- a/hw/xen/xen-pvh-common.c<br>
+++ b/hw/xen/xen-pvh-common.c<br>
@@ -7,15 +7,13 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu/error-report.h&quot;<br>
-#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/visitor.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
-#include &quot;hw/sysbus.h&quot;<br>
-#include &quot;system/system.h&quot;<br>
=C2=A0#include &quot;system/tpm.h&quot;<br>
=C2=A0#include &quot;system/tpm_backend.h&quot;<br>
+#include &quot;system/runstate.h&quot;<br>
=C2=A0#include &quot;hw/xen/xen-pvh-common.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div></div>

--000000000000934ffe062e6d7ceb--
