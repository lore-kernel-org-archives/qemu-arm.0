Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp928849wrx;
        Fri, 22 Mar 2019 10:03:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1V1pAKL6tBponHxwv+hNMJE/MuoHSz7iHWj2UlPjowWUJzqjzT2tUFsmKdjQgpoJbrJMo
X-Received: by 2002:a25:401:: with SMTP id 1mr9020603ybe.502.1553274181250;
        Fri, 22 Mar 2019 10:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553274181; cv=none;
        d=google.com; s=arc-20160816;
        b=Si5UjBfCUSwbEFsW3AfSV7OMUUoF/mGysBUb6Jv3L2BSUT0p4xd3nFybmW5VRxVd/v
         EmNH6XtsQUYOpViNSx1s+HBxV2NjBWpv2ISOhH4XkPiNDPgzQIhnDSBXRf/frxfLud0W
         AGE/yqzUjfMujB7Futir8fA7VxHWv/Q2GS5BWJ5EsPu2TeddlqP/4ibEyhZj61Iqii/f
         yZ6Dud87+CRBDwdsXZlxSGiM2enLz7MaRsygw3NfEhat6jyT/0+akNaoDoqKq0gvVcva
         t+sfztQvfL5yhZLliaogwQs5oaHIAg7jqSCOGLa5+xWy5DXFK/6aS6dUO8G/GZ9ocI5Y
         MEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=QP1B4ggO/jFXnDW0E3vlv0AP/4jiPdxqVPhCvgF/zss=;
        b=tqrjaxXspk1Hf/tap87mQqyoYHINeaxhzJuAn18HBvDsYxi6J65Ri8g6OsVBEkeMpp
         c85aRNd5X2/L9ThqZXbYAVYbNUPOVAoRh5RrwYhyQp4UtwaFA3wIBG8bGY9O2NKRx/YN
         LBV4g6LkYU79ooxTjc3xAwTFCJceJNq+s2gThZGFsNGDHoe4GP0si9cX8kQTPefD9YAn
         9IgLsDGGg183vjvaJhqAyk6OdK5/aoWiKZHG9IioG/mt81fU3oVhU933o0yMlM9TXzxE
         AroIqzh76l1V8FAthdUiTVPf4moifsTK1xpkxHJ83QioiAd7kd1uDXS2G94m0GrWcvTh
         W8eA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si4813809ywd.459.2019.03.22.10.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 10:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7NZM-0000Hj-ME
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 13:03:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7NSb-0002tX-Sw
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:56:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7NKB-00036e-2Q
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:47:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1h7NK4-0002wu-Kz; Fri, 22 Mar 2019 12:47:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 761CCC057F9D;
	Fri, 22 Mar 2019 16:47:11 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6409E26365;
	Fri, 22 Mar 2019 16:47:10 +0000 (UTC)
Date: Fri, 22 Mar 2019 17:47:07 +0100
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Message-ID: <20190322164707.juezp3z3a6jiewfx@kamzik.brq.redhat.com>
References: <20190322162333.17159-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190322162333.17159-1-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 22 Mar 2019 16:47:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/3] target/arm: pmu fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, aaron@os.amperecomputing.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mei0uf2li7e0

On Fri, Mar 22, 2019 at 05:23:30PM +0100, Andrew Jones wrote:
> The first two patches fix a regression I found when running
> the arm (as opposed to arm64) pmu kvm-unit-tests test on tcg,
> 
>   $ git clone git://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
>   $ cd kvm-unit-tests
>   $ ./configure --arch=arm --cross-prefix=arm-linux-gnu-
>   $ make -j
>   $ export QEMU=/path/to/qemu-system-arm or qemu-system-aarch64
>   $ arm/run arm/pmu.flat
> 
> After checking the QEMU code I found it's also reproducible with
> the arm64 test if the PMU is removed,
> 
>   $ ./configure --arch=arm64 --cross-prefix=aarch64-linux-gnu-
>   $ make -j
>   $ export QEMU=/path/to/qemu-system-aarch64
>   $ arm/run arm/pmu.flat -cpu cortex-a57,pmu=off

Small correction here: I had to also hack the unit test to not
bail out when it didn't see a PMU advertised in the ID register.

diff --git a/arm/pmu.c b/arm/pmu.c
index 1de7d77d184f..185ff77244ed 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -291,8 +291,9 @@ int main(int argc, char *argv[])
		cpi = atol(argv[1]);
 
	if (!pmu_probe()) {
-	       printf("No PMU found, test skipped...\n");
-	       return report_summary();
+//	     printf("No PMU found, test skipped...\n");
+	       printf("No PMU found, let's crash!\n");
+//	     return report_summary();
	}
 
	report_prefix_push("pmu");

> 
> Those tests used to pass, but now QEMU was crashing. I've broken
> the fix into two patches because the second patch is a bit of
> an RFC since I don't know if it's safe to enable all
> ARM_FEATURE_PMU code for PMUv2. Maybe that feature is only for
> PMUv3? This patch also enables the pmu cpu property to work with
> those cpu types, i.e. we can now do '-cpu cortex-a15,pmu=off' to
> remove the pmu. Although it wasn't clear to me if the PMU is
> optional (permitted to be removed) on those cpu types from the
> manuals.
> 
> The last patch is just a trivial cleanup.
> 
> Andrew Jones (3):
>   target/arm: fix crash on pmu register access
>   target/arm: cortex-a7 and cortex-a15 have pmus
>   target/arm: make pmccntr_op_start/finish static
> 
>  target/arm/cpu.c    |  3 +++
>  target/arm/cpu.h    | 11 -----------
>  target/arm/helper.c |  8 ++++++--
>  3 files changed, 9 insertions(+), 13 deletions(-)
> 
> -- 
> 2.17.2
> 
