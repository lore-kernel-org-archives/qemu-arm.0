Received: by 10.25.0.198 with SMTP id 189csp1390911lfa;
        Mon, 8 May 2017 07:33:19 -0700 (PDT)
X-Received: by 10.233.235.72 with SMTP id b69mr25362617qkg.206.1494253999293;
        Mon, 08 May 2017 07:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494253999; cv=none;
        d=google.com; s=arc-20160816;
        b=cRNxZjNrKfvYBXsGMtGpUQ0EqySJok/XxaXrvnk3Ibcm16/lYoZ/qoaCd4yxfmvmM4
         FeMBSMzcmgSL5F5GqDIxxcueipdGBjnlfrk64XR0Y82R/vMr/wzL1mY5DPMgu9vLU6aV
         shmFSSEB7ZnE9OJEqE12UJqCeV+hHQK5abq48fDARslVY36NcuFOm445T/GTcYEMXn3b
         icYX9lDkegy/iFArEdpP4s5gDHgYJ0rCuxXvNBgPtrzaMTa3nFkGt0GST3SQ79jfimwg
         eknqd+oXgK4tWq4qYTw9ES6iFPPNMhUvi9fboEYcJMcAJ3r0JlMBWGMecGgnzKmtlyX5
         80tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=mhyjgqBvRVsV9nb5WeJ3oyv09FrkSwbPH2KJF6Tc9xg=;
        b=AA9MjE0uXDooomt2UVIkb2chDZIHh1iRi8XFS760gu0xTbI1hTZCpSxYAYUZBM8KQp
         LakiSuTxuRhmExbqaM2gW+Ou9d2aGPPxVeslDw73SDuiUFu28nl9u4vchqpStukJ8qZF
         hgIYL7to7mWRqJiferv4pnKsdzU+yyH7vwaMXPRTEdRZapKIqEP/mIqTXwY1iiKfDzXL
         OHCuCG6V5/m+vlh4C5jGBMdy7BNLvT2Q+nLI+U3wVNyoECagwBefSQHJ/wRWdF4LG7OI
         ldcf/h7V6UkS8jF/IPNN5SiyxTotlROQquxKgpD5J8MHf3UM5i9Q2GlYuHiMoXEX+P4g
         AMOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n21si739647qka.193.2017.05.08.07.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 May 2017 07:33:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7jiw-0007fo-NZ
	for alex.bennee@linaro.org; Mon, 08 May 2017 10:33:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d7jhH-0006VH-Nf
	for qemu-devel@nongnu.org; Mon, 08 May 2017 10:31:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d7jhG-0000wE-Tr
	for qemu-devel@nongnu.org; Mon, 08 May 2017 10:31:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d7jhF-0000sD-1w; Mon, 08 May 2017 10:31:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBAF97F4C8;
	Mon,  8 May 2017 14:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DBAF97F4C8
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DBAF97F4C8
Received: from localhost (ovpn-116-2.gru2.redhat.com [10.97.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 582CD94C5C;
	Mon,  8 May 2017 14:31:30 +0000 (UTC)
Date: Mon, 8 May 2017 11:31:28 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170508143128.GS3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-21-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-21-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 08 May 2017 14:31:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 20/24] machine: call machine init from
 wrapper
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lbPrwk0YHauO

On Wed, May 03, 2017 at 02:57:14PM +0200, Igor Mammedov wrote:
> add machine_run_board_init() wrapper that calls machine
> init for now but in follow up patches it will be used
> to run generic machine code that should run before
> machine init.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I like the name "board init". It becomes clear that it's
something different from instance_init.

Maybe we could rename MachineClass::init to
MachineClass::board_init in the future.

-- 
Eduardo
