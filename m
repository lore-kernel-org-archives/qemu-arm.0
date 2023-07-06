Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4412865ejy;
        Thu, 6 Jul 2023 09:33:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF31pheZG+6ZjPrrj/l76yxk/4guyaZZvKRVieEAG875gDTGhh4vpJ6RwRUamtUjGJqrAXz
X-Received: by 2002:ac8:7d12:0:b0:400:a9a4:851f with SMTP id g18-20020ac87d12000000b00400a9a4851fmr2494099qtb.32.1688661180043;
        Thu, 06 Jul 2023 09:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688661180; cv=none;
        d=google.com; s=arc-20160816;
        b=FKXg7USDq8EE7ErJTd6ulpWExvcgnTd7QGZcgtc9LSxUoxjMnT9/fnBXAHZwji2gru
         w6mDvO0kMaXfJRf1MGjvzdqx46amimxXtc5nrEaCW7LzLqLrdhetD3ewwoG2ojSGRpni
         VHyVsU/TKJn63RaLblXz2hfvSzw6ZCoUKklNE83DFzCvhX1uKRaSxPZr6p4HUJAryK5k
         Yr4fneLlzYRstM81fplVwA/krTH/OiPRO5EFy2oXzmLK5TuWkxNiu7uyVi6Fu+pvxzuW
         +wkNnxi2FqD5sYZxuTY2nayE30oE8i8uTnZ5vhPfIdOcgCXB1wVd3I5DL/PB5EvL84BJ
         2IAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=dGyW/Ym2sXYBPz8Md4Rus5bGu29R5JiDX+vooz3Fgfs=;
        fh=zNWoq5Fr2UiqKxK7+F/DLPPkiKyPBMyakPopLtwtRHE=;
        b=Zwaph+vcI1jKQI9qjwnm7gFEAmgsKwxn8SxKNfJkyWKSGr8gXs4Rb7ejlTg1gT/3yi
         wgK20f2qFZHzY4viu837dUayoNmnITCy5v3VON5wqeFiGovQJXc0tFEVgo23rWsbYjjV
         RY966PMu6dg6R79TkDpH6F0ZEumpTz0xVa9j4orFuL2C1sE9AS6Rh+X1oxDTZANjWJQ+
         xFMqqx85Xoj36lt9ea03Znx0yoQ8Y3zJkUfKDVisq/okC4txnCxA6uLmIJK1drzY1VWq
         Dd0sT6Q2YH+vrdOw+PCbOlG7kDc4CjMVJ4TBKH/NTNaVczfdF1qQT57VOrkkZpas2X1D
         fz4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gj95+8aQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020ac85f91000000b004036f711b5dsi1130236qta.178.2023.07.06.09.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 09:33:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gj95+8aQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qHRuT-0002w1-86; Thu, 06 Jul 2023 12:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1qHRuR-0002q6-Uk
 for qemu-devel@nongnu.org; Thu, 06 Jul 2023 12:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1qHRuQ-0007ma-8b
 for qemu-devel@nongnu.org; Thu, 06 Jul 2023 12:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688661164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGyW/Ym2sXYBPz8Md4Rus5bGu29R5JiDX+vooz3Fgfs=;
 b=Gj95+8aQd8OqwoEaXopNwtwD06zqVuIuSMDVXsG65HghNEB5GBvipLY1iqQoayQF591qkL
 QLAGtV1BZzwvxxlDLxm+XLhkbyb4BBxxFIvfhOjq4Wk1QAqPlXAZcSHBEK8vHs/QzjneFP
 S+mRYv6AOKGCpfiHJgaCwve0x2l2MQU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-TygBeLG6MUaZXnhuLUevtw-1; Thu, 06 Jul 2023 12:32:42 -0400
X-MC-Unique: TygBeLG6MUaZXnhuLUevtw-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-345f9c1176eso3742445ab.2
 for <qemu-devel@nongnu.org>; Thu, 06 Jul 2023 09:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688661162; x=1691253162;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGyW/Ym2sXYBPz8Md4Rus5bGu29R5JiDX+vooz3Fgfs=;
 b=NI51gDPUvzucjy5HTxefrKRygGudHY4MJ+awze4gMatfkV5sK9Z47rLkd0L3dnfyPU
 Az8B1P8N9MCm8k6MFQld9s7DauxAlCtTd4pPen1xeAxUImHlrv7MQSBpCGJ2p0hhJu5T
 c3rHJzoEeqaQ2ZfddZ5MJbq8UWpPoG7enkzkJQNuCNyXQ1xMh75d5oOQIIt/mxbclWL9
 JkI0EQ6q0P2Se2vLDYHalgfn0rAPq3dofLyPISZUhzXYg5wKq0M3Gv4nWQcqlzp92epF
 f7T76qI8K2HgdTIWu5fHJd1JlsgqnPekwPrswXEgft8iLWs2W402ymQOoOnTFNnMUcYq
 PAfQ==
X-Gm-Message-State: ABy/qLYS7sNtp8fgW2emo+qTf/hhnOONSJH8wUZ5AMZMVaJe37Hl091H
 v3ldF5ZP5F2uaOFP/8s31CrAESczWtDRBcpOp0NtPPPtF8jRvgyDKC/KAGiqdmG9X61yO9tU0oj
 ujk9RCiMHnJcmLS8=
X-Received: by 2002:a05:6e02:107:b0:346:f14:86ba with SMTP id
 t7-20020a056e02010700b003460f1486bamr2687849ilm.2.1688661161940; 
 Thu, 06 Jul 2023 09:32:41 -0700 (PDT)
X-Received: by 2002:a05:6e02:107:b0:346:f14:86ba with SMTP id
 t7-20020a056e02010700b003460f1486bamr2687838ilm.2.1688661161661; 
 Thu, 06 Jul 2023 09:32:41 -0700 (PDT)
Received: from smtpclient.apple ([27.6.216.255])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a637349000000b0055b07fcb6ddsm1495226pgn.72.2023.07.06.09.32.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jul 2023 09:32:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH] hw/arm/virt-acpi-build.c: Add missing header
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20230706150839.1180137-1-tcx4c70@gmail.com>
Date: Thu, 6 Jul 2023 22:02:35 +0530
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E61D4E9-C638-45A0-9A17-C82C387B4261@redhat.com>
References: <20230706150839.1180137-1-tcx4c70@gmail.com>
To: Peng Liang <tcx4c70@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: TXOoUpPoWMZc



> On 06-Jul-2023, at 8:38 PM, Peng Liang <tcx4c70@gmail.com> wrote:
>=20
> virt-acpi-build.c uses warn_report. However, it doesn't include
> qemu/error-report.h directly, it include qemu/error-report.h via =
trace.h
> if we enable log trace backend. But if we disable the log trace =
backend
> (e.g., --enable-trace-backends=3Dnop), then virt-acpi-build.c will not
> include qemu/error-report.h any more and it will lead to build errors.
> Include qemu/error-report.h directly in virt-acpi-build.c to avoid the
> errors.

I am able to generate the following error on latest upstream QEMU:

../hw/arm/virt-acpi-build.c: In function =E2=80=98virt_acpi_build=E2=80=99=
:
../hw/arm/virt-acpi-build.c:1045:9: error: implicit declaration of =
function =E2=80=98warn_report=E2=80=99 =
[-Werror=3Dimplicit-function-declaration]
 1045 |         warn_report("ACPI table size %u exceeds %d bytes,"
      |         ^~~~~~~~~~~
../hw/arm/virt-acpi-build.c:1045:9: error: nested extern declaration of =
=E2=80=98warn_report=E2=80=99 [-Werror=3Dnested-externs]
../hw/arm/virt-acpi-build.c:1048:9: error: implicit declaration of =
function =E2=80=98error_printf=E2=80=99 =
[-Werror=3Dimplicit-function-declaration]
 1048 |         error_printf("Try removing CPUs, NUMA nodes, memory =
slots"
      |         ^~~~~~~~~~~~
../hw/arm/virt-acpi-build.c:1048:9: error: nested extern declaration of =
=E2=80=98error_printf=E2=80=99 [-Werror=3Dnested-externs]


>=20
> Signed-off-by: Peng Liang <tcx4c70@gmail.com>
> ---
> hw/arm/virt-acpi-build.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 55f2706bc9..44cf9f3312 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -57,6 +57,7 @@
> #include "migration/vmstate.h"
> #include "hw/acpi/ghes.h"
> #include "hw/acpi/viot.h"
> +#include "qemu/error-report.h"

I would put this a little bit higher up  right after =E2=80=9Cqemu/bitmap.=
h=E2=80=9D , like :

--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -29,6 +29,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/bitmap.h"
+#include "qemu/error-report.h"
 #include "trace.h"
 #include "hw/core/cpu.h"
 #include "target/arm/cpu.h=E2=80=9D

but other than that, your change does fix the build.

Hence, modulo the above,

Reviewed-by: Ani Sinha <anisinha@redhat.com>


>=20
> #define ARM_SPI_BASE 32
>=20
> --=20
> 2.41.0
>=20

