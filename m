Received: by 10.25.44.15 with SMTP id s15csp5142837lfs;
        Tue, 11 Jul 2017 10:37:52 -0700 (PDT)
X-Received: by 10.237.60.19 with SMTP id t19mr1431539qte.206.1499794672246;
        Tue, 11 Jul 2017 10:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499794672; cv=none;
        d=google.com; s=arc-20160816;
        b=xYSQRsrZtSZeCOXmKBvEUy321zWIWyFS3C0ai3edcbbxVJkicu1q6yXhjBa7IGsf/e
         V1LXYIL3QoSIYdQtuO4y43LpVsw0DOtQuUWwckTZwB29iyRwOG8lOuexAKuYe40qlYPs
         6Eq9anJaBxQtL7yk7al03fQvHwS55JsnUNXncE6klyLFSxdjz3LGf73rqqCnqIWdGp34
         OPD3eBco2Fu9QwaYyKvfTyE2c6422KJrRfWoPgEM/oqEBWwfVeV2thNLtVrtHa3yCtxP
         2BFpgKGEA1fpEjVK0TAeUB6n1HmjKkmMj2AfiQG4CvzS7YDQU4ihD8KPcwDwOKYdc2ae
         6B9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:thread-index
         :thread-topic:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=KyVVE/6bqLizLNhSgcp5BSx8gJ8PQDlUtU463GojrA0=;
        b=yYhAMO7v05AkWxdDNR1Jvn3n021pSJFBO3edjPFnPMzr8WlDTqvpa/X8jIWkMl0gms
         UX/XtzM/RuF5gxwpmjsMz+ZGPlbiQw8UmpZAIJYdSCQ7YOceEo8vxRqQepmJPy0bnUnM
         CXF4GGeYUucZwaLTBbBDClKrZsmwb1lQvsDizWHB2HnoffIdLfjH6PG0EPaOmSuDlxfb
         Af/TT+2E1ND4Y3stkNgOmmh56oh2QLiZo19nY18oGd6u+CU+JUnSITUpOnFP924qBC5G
         DHrNK3PeESPQ1D5L8RrcT6/3lxUlXR7J9VH+OLWvq4oXPZEwKJAb0JNsBbQNXeiHxYBq
         XGDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 137si491760qkf.66.2017.07.11.10.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:37:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUz6b-00061m-F8
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:37:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dUyoT-0006EJ-Kb
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 13:19:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dUyoS-0005wQ-Gf
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 13:19:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>)
	id 1dUyoN-0005no-PO; Tue, 11 Jul 2017 13:18:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97ACE7F3E5;
	Tue, 11 Jul 2017 17:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 97ACE7F3E5
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mlureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 97ACE7F3E5
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BFD9729BF;
	Tue, 11 Jul 2017 17:18:58 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 621064A491;
	Tue, 11 Jul 2017 17:18:58 +0000 (UTC)
Date: Tue, 11 Jul 2017 13:18:58 -0400 (EDT)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <1572293529.49604420.1499793538326.JavaMail.zimbra@redhat.com>
In-Reply-To: <1499788408-10096-4-git-send-email-peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.112.26, 10.4.195.26]
Thread-Topic: target/arm: Make Cortex-M3 and M4 default to 8 PMSA regions
Thread-Index: HVKGZ+GIq5J20AJvxO9/KYiPbASlYQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 11 Jul 2017 17:18:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] target/arm: Make Cortex-M3 and M4
 default to 8 PMSA regions
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CUZVRsQIGFJb

Hi

----- Original Message -----
> The Cortex-M3 and M4 CPUs always have 8 PMSA MPU regions (this isn't
> a configurable option for the hardware).  Make the default value of
> the pmsav7-dregion property be set per-cpu, so we don't need to have
> every user of these CPUs set it manually.  (The existing default of
> 16 is correct for the other PMSAv7 core, the Cortex-R5.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

So until now that value was wrong for m3/m4 if I understand correctly.

> ---
>  target/arm/cpu.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 28a9141..96d1f84 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -543,8 +543,15 @@ static Property arm_cpu_has_pmu_property =
>  static Property arm_cpu_has_mpu_property =
>              DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>  
> +/* This is like DEFINE_PROP_UINT32 but it doesn't set the default value,
> + * because the CPU initfn will have already set cpu->pmsav7_dregion to
> + * the right value for that particular CPU type, and we don't want
> + * to override that with an incorrect constant value.
> + */
>  static Property arm_cpu_pmsav7_dregion_property =
> -            DEFINE_PROP_UINT32("pmsav7-dregion", ARMCPU, pmsav7_dregion,
> 16);
> +            DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
> +                                           pmsav7_dregion,
> +                                           qdev_prop_uint32, uint32_t);
>  
>  static void arm_cpu_post_init(Object *obj)
>  {
> @@ -1054,6 +1061,7 @@ static void cortex_m3_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V7);
>      set_feature(&cpu->env, ARM_FEATURE_M);
>      cpu->midr = 0x410fc231;
> +    cpu->pmsav7_dregion = 8;
>  }
>  
>  static void cortex_m4_initfn(Object *obj)
> @@ -1064,6 +1072,7 @@ static void cortex_m4_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_M);
>      set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
>      cpu->midr = 0x410fc240; /* r0p0 */
> +    cpu->pmsav7_dregion = 8;
>  }
>  static void arm_v7m_class_init(ObjectClass *oc, void *data)
>  {
> @@ -1112,6 +1121,7 @@ static void cortex_r5_initfn(Object *obj)
>      cpu->id_isar4 = 0x0010142;
>      cpu->id_isar5 = 0x0;
>      cpu->mp_is_up = true;
> +    cpu->pmsav7_dregion = 16;
>      define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
>  }
>  
> --
> 2.7.4
> 
> 
