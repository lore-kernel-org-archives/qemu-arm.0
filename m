Received: by 10.223.150.237 with SMTP id u100csp4169134wrb;
        Fri, 10 Nov 2017 12:24:09 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZOBcumxIbwPwSxA+qdPNASShEddWg4Tm8KISLpZ1OpeOSTb77Rx+ILZ/IlSGZmkxmCisO8
X-Received: by 10.13.202.148 with SMTP id m142mr1110707ywd.246.1510345449103;
        Fri, 10 Nov 2017 12:24:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510345449; cv=none;
        d=google.com; s=arc-20160816;
        b=UNtcXRbomUOKTOs2T+Xe334k3xB7892/iL+V2bnVpUGyRXMIhaLoV4SkhRuyr0dDeg
         dY5lHioESo/7vJz0fFmN7BSgTElqxoz+TklMLHindZZIyv0dyfJB+qJ3M2CHrXDaP5+u
         ELL1/uS3f16WcBO469tfRrhtkXiRgrlexAwC1UsWd99X8h9ztbRPQACAoOArk9IMQHNt
         16OY6kwPrnudBkOT/FCiQyKnGHMIQBOa+UrVIXvG1nkHPrKR7ybRp/PEgdmpZs1TP56Z
         1jxJSc5Jq+lmvgvCw5MLaPZCbfTru9d+uwVoHM6115wbBb5yRJ/23axzw/hJbjoKymHQ
         Gk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=VtBpEzYK//65qGEdKRDz1x8Wg3Mb6ixx8HWnf2QgSA0=;
        b=GwxhEJogkeguBbhhbJtQOFnfwgWdBIcwPwCt5QPKWvzJSyEKkSe/PjBMy6sbaFnj+l
         J9icZNPbe4oDYP7r/qbkLHAeZjiQ/IHo/ezImTxgBDLicvoQIxsNQqPvmIqPRQHq7Pfv
         Mb2RCo2Pwql5/56e5w2cqCZZuXIBR/lQnjlV2mW17+JXBoBZPCxs4j0+bNrZLzXRCHtb
         rdbEAIcnue09mmyYY3Mu/KdF1e1VnG9Bxp462g2xC3W9S2Nb7t079Y8pWrrd4rwEOadh
         CjBrQsPKfV7iE0WYtVCC54bQaz2K9gzI0Idq9msnLqzAo10TIl3RZqe5nG8TEzh4+mmg
         gonQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19si2333394ybj.674.2017.11.10.12.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 12:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDFqS-0006Tr-Gt
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 15:24:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eDFqG-0006TX-7H
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 15:23:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eDFqC-0001L4-9Q
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 15:23:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33092)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eDFqC-0001IQ-3N; Fri, 10 Nov 2017 15:23:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49CB25D9FE;
	Fri, 10 Nov 2017 20:23:50 +0000 (UTC)
Received: from localhost (ovpn-116-2.gru2.redhat.com [10.97.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29AF017A8F;
	Fri, 10 Nov 2017 20:23:46 +0000 (UTC)
Date: Fri, 10 Nov 2017 18:23:45 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Emilio G. Cota" <cota@braap.org>
Message-ID: <20171110202345.GU3111@localhost.localdomain>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
	<1510343626-25861-2-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510343626-25861-2-git-send-email-cota@braap.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 10 Nov 2017 20:23:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for 2.11 1/5] qom: move
 CPUClass.tcg_initialize to a global
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cbYzMceyX3yS

On Fri, Nov 10, 2017 at 02:53:42PM -0500, Emilio G. Cota wrote:
> 55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
> introduces a per-CPUClass bool that we check so that the target CPU
> is initialized for TCG only once. This works well except when
> we end up creating more than one CPUClass, in which case we end
> up incorrectly initializing TCG more than once, i.e. once for
> each CPUClass.
> 
> This can be replicated with:
>   $ aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -smp 6 \
>       -global driver=xlnx,,zynqmp,property=has_rpu,value=on
> In this case the class name of the "RPUs" is prefixed by "cortex-r5-",
> whereas the "regular" CPUs are prefixed by "cortex-a53-". This
> results in two CPUClass instances being created.
> 
> Fix it by introducing a static variable, so that only the first
> target CPU being initialized will initialize the target-dependent
> part of TCG, regardless of CPUClass instances.
> 
> Fixes: 55c3ceef61fcf06fc98ddc752b7cce788ce7680b
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
