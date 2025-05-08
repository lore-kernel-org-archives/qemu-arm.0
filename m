Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp290700njb;
        Thu, 8 May 2025 02:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdIwPlHmTXkFy6CmFpGLiWNTiAolaXJw72Rwwxwb6hXUmaoe9t46CXquyWRMOlYkApDEz7lE/RGRF93w==@linaro.org
X-Google-Smtp-Source: AGHT+IGSUK707Q3zkAI96k0uHNIdUG0Fvnv2cObLS4EV2pVQBAXd0Apd6Md7PMuBmxVyIIoa9oGB
X-Received: by 2002:a05:622a:312:b0:490:8fdf:3df with SMTP id d75a77b69052e-4922795dbf9mr91303221cf.32.1746696491887;
        Thu, 08 May 2025 02:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746696491; cv=none;
        d=google.com; s=arc-20240605;
        b=DWqOBa+/yrw6sGFlrgKoJzVVWuFFxWcwB6T+epPIAm0kGvnD4STbQGFeE68gjp1VO+
         uayHacjn4q8R87xjZCiDiBVF2zy/XGJRjEakTVOZ3Gk9IwybptA+FMJwUNHq8Pdp7eMe
         lecDgZ84lt02+PQ+5wNS8+GFCmU3c1YvMTdt2oiUUd1jClQD508zyaR7uNLoyGTUA/Nj
         mNOlScDqAZ1//cl+oJvQTtsB+3HqJKUYkyDqB+4MyKwiZ3P5HjFqpKg5tVyvf5XqiBgZ
         uojzMpy99gWIibG0gruV7IfeygQ5YhVIpdpmRWHRyJ7aqvhfVh5xa9dI+cObrSvHa3RA
         4vnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=pNnZojqF3a9NZoaujxV8u4HPCQhjeEZIMyS/7jjyNxo=;
        fh=s/AxWmsjNRQt3QmFhI8tPJQZQRcuynRECBvnCa65W9U=;
        b=iVPUaFEid1lT4mpt5t+3NHhLInycI/UHt3dJcnQeKNwSQc+dO9l1eOGXVv23T3CdR9
         gEvnh1qWPEXgukfHJaS9RD/M1QOJHU6zCq/PAyatswLzf4RmdPT1C/Dq4rhfdqsNCu8n
         vX1CYGLqzoa5Ia+5TM6Vu2IoXcY6P6XXhEvV+a+WY+elDS+XHM965PEkWpOe9/ueQ7sM
         uuxAYPALrj4l+vBreOKE2VhXvz0myKOgwFUwr9v0PhGp5jIoY37fx66i8SmC748Vk5vV
         N54lR9xlqSzHr76L44PAu3uU5S7JAWstWlYMQ18Fez9GqHXE4fOKi4Ayp9N885f3cWGn
         TUkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=YMxLCr+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49222f8aec0si39466191cf.460.2025.05.08.02.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 02:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=YMxLCr+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCxXt-00016N-AA; Thu, 08 May 2025 05:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1uCxXr-0000zJ-6H
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:27:59 -0400
Received: from p-east1-cluster1-host2-snip6-6.eps.apple.com
 ([2a01:b747:3005:205::13] helo=outbound.ci.icloud.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1uCxXm-0006ox-O1
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 bh=pNnZojqF3a9NZoaujxV8u4HPCQhjeEZIMyS/7jjyNxo=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
 b=YMxLCr+McctQOpvjM+JC2RWDifQQYJij6TrL37D6/J0Vbgagjlluq2107LslXfN08
 jcYbukkgsz8zRCMiFWTaYZf7ttz8SJPyrMDaetpXW0WQoMNifJf+He25TKXo+4wQIo
 Tkf+v25A1snu+khuzyl/JicDz8VGQCtinHQus+N4i0HwI8EzsX0nBjTln4p3S30nJJ
 ZFJFtpE8ocUt4/qyWhs+J2ypMICMBWCe64cONoaB1jj0PcH08Sx6QcCErbbJxcF3nF
 CD8Tx1t1vhpUkKFu7PcAuvBSj6MwHGPY0aC4ewZt8kTA8ruXy9njyAHMomkgKTxryI
 y8JU+Rau2ZAkA==
Received: from smtpclient.apple (unknown [17.57.156.36])
 by outbound.ci.icloud.com (Postfix) with ESMTPSA id 486861800424;
 Thu,  8 May 2025 09:27:47 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH] accel/hvf: Include missing 'hw/core/cpu.h' header
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20250507204401.45379-1-philmd@linaro.org>
Date: Thu, 8 May 2025 11:27:34 +0200
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mads Ynddal <m.ynddal@samsung.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <40DDAA59-7BB7-41DA-B390-A4072D387940@ynddal.dk>
References: <20250507204401.45379-1-philmd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-ORIG-GUID: W-XUTD8smeDODxyXYKwZCgx-Q0LUP65-
X-Proofpoint-GUID: W-XUTD8smeDODxyXYKwZCgx-Q0LUP65-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2505080085
Received-SPF: pass client-ip=2a01:b747:3005:205::13;
 envelope-from=mads@ynddal.dk; helo=outbound.ci.icloud.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sFrcIHu9276X


> Since commit d5bd8d8267e ("hvf: only update sysreg from owning
> thread") hvf-all.c accesses the run_on_cpu_data type and calls
> run_on_cpu(), both defined in the "hw/core/cpu.h" header.
> Fortunately, it is indirectly included via:
>=20
>  "system/hvf.h"
>    -> "target/arm/cpu.h"
>         -> "target/arm/cpu-qom.h"
>              -> "hw/core/cpu.h"
>=20
> "system/hvf.h" however doesn't need "target/arm/cpu.h" and we
> want to remove it there. In order to do that we first need to
> include it in the hvf-all.c file.
>=20
> Cc: Mads Ynddal <m.ynddal@samsung.com>
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> accel/hvf/hvf-all.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> index 3fc65d6b231..8c387fda24d 100644
> --- a/accel/hvf/hvf-all.c
> +++ b/accel/hvf/hvf-all.c
> @@ -12,6 +12,7 @@
> #include "qemu/error-report.h"
> #include "system/hvf.h"
> #include "system/hvf_int.h"
> +#include "hw/core/cpu.h"
>=20
> const char *hvf_return_string(hv_return_t ret)
> {

Good catch, I should have included that in the initial patch.

Reviewed-by: Mads Ynddal <mads@ynddal.dk <mailto:mads@ynddal.dk>>=
