Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp320040wru;
        Fri, 3 Aug 2018 10:32:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdgmL0jrOySaeX3Ml5WgJOEB04BU36JFiK+hVNipD7JBRu2SPLbf1qOD3uKixmfVLi4g93o
X-Received: by 2002:a0c:8c47:: with SMTP id o7-v6mr4309949qvb.68.1533317524139;
        Fri, 03 Aug 2018 10:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533317524; cv=none;
        d=google.com; s=arc-20160816;
        b=sEQGHqS+IJd8qkbasySLwihDQ+XPToFV8pHjEz7xWVqoQ92HqPpEb2Bg5QyFsnCRoq
         bSAzplR699zxrVf112w1RVf66zARXCjk3PBcga65rO0oCBdG7QO4n+t/oloLCNuBtTBt
         4cgDfQk4QRL3A1MeViC0T7vOF6yqZ6OncWd4rpS1jIBZmwdQKivVf4yrqd5GkpW9k9Zl
         gvXmqpo4CdtuvPGFuoIZjW0OYClkEP8ctFBxMPRkrJo9SE3KDEfznKZR+6IjzbLlnW6N
         NkJZNaOFcuS8nsDaFlP0fYyjcYYEW8OUqCoBWqBPXhVBSsqVl9jX9hIFIoemxHodli+B
         fp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=FgqW0bom0cnehzqMX0vdNxG+oxBd0oaR4ZkWMvr3D+8=;
        b=FLS6L8ue7/BVooWS+MMcQdCDPzbAmkYJAnJLIE6utjZ3FoVVvJSHV/h7pF35HCvnz4
         aEvYX3Nsy6BiY5Xv8WkI0zBxfbK+uBHcgBUct9iD9DmXZJz5eDvgE+cG6hNV+c+Ut6nz
         nu36X/69rY4AUMeY8qZ/PSg7/gM+OtQ5aCLDMoM4uTucjUhMCKT5izH5fT4/4GuIGeRL
         GKI1OG9X7xzBH6Hmkyb+QRcXSmUQRpEfFEt46RwiwNZMu5vnRo0skYmOoSgbekxSIx8/
         W2YyTuvJ0EuRiYyO0HuCrmBB5Cfer1yatDkN9pleCR3A602fKabxVu7DInzQxBVEpXaR
         cCog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 70-v6si1623821qke.242.2018.08.03.10.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 10:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fldvn-0004g1-Hk
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 13:32:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fldv4-0004da-3M
	for qemu-devel@nongnu.org; Fri, 03 Aug 2018 13:31:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fldv3-0006z3-CI
	for qemu-devel@nongnu.org; Fri, 03 Aug 2018 13:31:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37784 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1flduy-0006xR-9T; Fri, 03 Aug 2018 13:31:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D39B68182D0C;
	Fri,  3 Aug 2018 17:31:11 +0000 (UTC)
Received: from work-vm (ovpn-117-171.ams2.redhat.com [10.36.117.171])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C5F10B7C93;
	Fri,  3 Aug 2018 17:31:10 +0000 (UTC)
Date: Fri, 3 Aug 2018 18:31:08 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180803173108.GG2802@work-vm>
References: <20180803163646.31068-1-peter.maydell@linaro.org>
	<20180803163646.31068-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180803163646.31068-4-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 03 Aug 2018 17:31:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 03 Aug 2018 17:31:11 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH 3/3] target/arm: Add dummy needed functions
 to M profile vmstate subsections
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hyBXiDEJOuTM

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Currently the migration code incorrectly treats a subsection with
> no .needed function pointer as if it was the subsection list
> terminator -- it is ignored and so is everything after it.
> Work around this by giving various M profile vmstate structs
> a 'needed' function that always returns true.
> We reuse m_needed() for this, since it's always true here.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

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
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
