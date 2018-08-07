Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4281983wru;
        Tue, 7 Aug 2018 07:40:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeARf9WpKJdbljaXg6jlTxTiY1L1ks9eaf2urvCACcCgQ2EARN/l2/A0yd/UyYf6kUdKcPT
X-Received: by 2002:ac8:5413:: with SMTP id b19-v6mr6509634qtq.253.1533652842416;
        Tue, 07 Aug 2018 07:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533652842; cv=none;
        d=google.com; s=arc-20160816;
        b=bRrclm0/jZnaa44DrgHG5KahswaR8jafzgInUxmW+6LmaA4Zhp++mrhHVeR5Jyd3sy
         pvHj+W9xi0nqpQafv7A/wlYVsY3rmaXvaCPlRHJxgluQtwdi+y8E1bhmPfA0oUuh6KBy
         H2uchS33f32sPfUcPrxegNSgkfsjd0bAxBXW34fVhGSUYioUsM14bzW/hrJsT1jKVaDw
         q9AFGXSF2UK48vD7wgmKa93aBEWQHAbySVz/KjQDC1cWxC7KNp52gFZ4UejGnjOfh4iD
         QLi5yLZa4lUOYP2Vx0GjpCnekdPvmGHxutbZjf70DnSNqX0iWULWQUWq6AxBd8vdVKuo
         Oc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from:arc-authentication-results;
        bh=3eJ/BkaRs7RriS+nskyAW7qi+uIdFbaCJJUfVbeetfU=;
        b=plZqVswkJXoBFnvxV7C/6mFRVDqSLU5/ToWp7sxVgBuBjiT9OeHKfBV4GlnixBmx0m
         FmEURvxqIvl71pDlcfgYprV/8M3t1ffE9Zj363Fw5zrqwQQ7MwxN0ISr+6uVF/JLEXIP
         AauLsZRz/4vf9nidXDCXvGMB4Bf59U9atmEJtnHRhgjONTB2e/MUSGfSlYefTXAU/nJz
         VRxyej/K/MkVb5DxX4img7vilsadoIVsBR7pOdk0Ie96tj0hm6lJ/5hBdzViG02cSMZW
         7ns6rFGDocEhteBm5hmTjDPLXMZgY1RWVZiQVyvQmLDHuh12EkZ8s1DFFUfbmTbNIUM3
         0nbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e75-v6si1564862qkh.359.2018.08.07.07.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn3A9-00007H-Rn
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:40:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn39u-0008TI-0X
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn39q-00079q-Nt
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:40:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58674 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1fn39q-00078H-Cs; Tue, 07 Aug 2018 10:40:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91D2F40216E4;
	Tue,  7 Aug 2018 14:40:21 +0000 (UTC)
Received: from localhost (ovpn-116-36.ams2.redhat.com [10.36.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 236552156897;
	Tue,  7 Aug 2018 14:40:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20180806123445.1459-4-peter.maydell@linaro.org> (Peter Maydell's
	message of "Mon, 6 Aug 2018 13:34:43 +0100")
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<20180806123445.1459-4-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 07 Aug 2018 16:40:17 +0200
Message-ID: <87600m2qb2.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 07 Aug 2018 14:40:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 07 Aug 2018 14:40:21 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'quintela@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-3.0 v2 3/5] target/arm: Add dummy needed
 functions to M profile vmstate subsections
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: patches@linaro.org, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fth2OJDvt56M

Peter Maydell <peter.maydell@linaro.org> wrote:
> Currently the migration code incorrectly treats a subsection with
> no .needed function pointer as if it was the subsection list
> terminator -- it is ignored and so is everything after it.
> Work around this by giving various M profile vmstate structs
> a 'needed' function that always returns true.
> We reuse m_needed() for this, since it's always true here.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


> ---
> Not strictly a regression as it only affects M profile CPUs
> with the security extensions, and migration of those was
> broken anyway in 2.12 due to a different bug.
> ---
>  target/arm/machine.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 2e28d086bdf..ff4ec22bf75 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -184,6 +184,7 @@ static const VMStateDescription vmstate_m_faultmask_primask = {
>      .name = "cpu/m/faultmask-primask",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .needed = m_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(env.v7m.faultmask[M_REG_NS], ARMCPU),
>          VMSTATE_UINT32(env.v7m.primask[M_REG_NS], ARMCPU),
> @@ -230,6 +231,7 @@ static const VMStateDescription vmstate_m_scr = {
>      .name = "cpu/m/scr",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .needed = m_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(env.v7m.scr[M_REG_NS], ARMCPU),
>          VMSTATE_END_OF_LIST()
> @@ -240,6 +242,7 @@ static const VMStateDescription vmstate_m_other_sp = {
>      .name = "cpu/m/other-sp",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .needed = m_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(env.v7m.other_sp, ARMCPU),
>          VMSTATE_END_OF_LIST()

But having 3 subsections with the same needed function ... we could have
a single subsection.

Later, Juan.
