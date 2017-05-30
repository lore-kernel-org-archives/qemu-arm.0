Received: by 10.25.0.6 with SMTP id 6csp4184lfa;
        Tue, 30 May 2017 12:50:20 -0700 (PDT)
X-Received: by 10.200.34.132 with SMTP id f4mr25102829qta.183.1496173820631;
        Tue, 30 May 2017 12:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496173820; cv=none;
        d=google.com; s=arc-20160816;
        b=cAQ/FGDe+Px7sIYatjxtubE+5Ga+pfQ4afgq758t6VHG1fmCnTjFolSyWgpvBvOBKq
         s/pMZMfve0OiKWGD8spRu4ARYbcfPuSTGbr7vJS8vPnNYs91lZQVaqmaWpcVFzQJE9gm
         yM4Ni57mHh1VLFMuMWgRJNpjXLtLl9PgtQUBilUquPSjeuIFMc/lxeu8ffOVgG3L5tPQ
         BRMrSD0rKtBcTGJ/obE2CZxPJmq6sxV5m/7xXmegUNIobYVLqa1sHjtz4/RJEs2jh/5v
         tXv30E8s30gcKDaHMeW3SieSx25MVlNA6ENGGsoEviLY0RQaQodXRFSmckZiL/+I3sLm
         jScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=L8n9Dj6bgd2YBLymiAcW3L5lEid7kxWOzbRNv610qeE=;
        b=ZiSK+XyB7+1cKZm7tvD7zvMcHJSWIYsyv2pkzyB5/CfhEWFhSLB7MtCsvDDQNjw7FL
         nh+H4sSq1nXVLrUz6XoULbpJE4byo2/Ri1iC0ICc2jU+AAheXRKvguKfGBz/O/oD05wK
         75Zo04JJwZ5QG10L7TBzcPcbEXUD8Z+NlJLTbL0D74DagZk9ln3Fr+FABzLonqlEeTUA
         +a6lW0AlbC/yXpldGfQExbrg97BbZ8UnVL4YUUOur4C6AVYP97GUnqjz/uWRP9GyUnU5
         /LCnQ67zBMWF+kVX5aHQnMlZJc7wjHksxbR1U+H3jcAXMalIlhpQ4RglS2nkBsGOx7d9
         ozVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2si13986726qtc.37.2017.05.30.12.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 12:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFn9o-0003cH-5R
	for alex.bennee@linaro.org; Tue, 30 May 2017 15:50:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFn8M-0002jy-KM
	for qemu-devel@nongnu.org; Tue, 30 May 2017 15:48:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFn8L-0008VX-EZ
	for qemu-devel@nongnu.org; Tue, 30 May 2017 15:48:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47172)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dFn8I-0008UU-SW; Tue, 30 May 2017 15:48:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C450E80468;
	Tue, 30 May 2017 19:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C450E80468
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C450E80468
Received: from localhost (ovpn-116-43.gru2.redhat.com [10.97.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54FD4EFB80;
	Tue, 30 May 2017 19:48:45 +0000 (UTC)
Date: Tue, 30 May 2017 16:48:39 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170530194838.GQ32274@thinpad.lan.raisama.net>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 30 May 2017 19:48:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 0/7] numa: code consolidation and fixes
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wsYi+99ToKnT

On Tue, May 30, 2017 at 06:23:55PM +0200, Igor Mammedov wrote:
> changelog since v2:
>   (Eduardo)
>      - keep original logic in when moving numa part into helper
>         numa: consolidate cpu_preplug fixups/checks for pc/arm/spapr
>      - drop "numa: fallback to default NUMA node instead of node 0"
>      - split out monitor hunk into separate patch
>      - split out spapr_fixup_cpu_numa_dt refactoring into separate patch
>      - add extra patch to make default node-id calculation more robust
> changelog since v1:
>   (Eduardo)
>      - user error_abort in numa_cpu_pre_plug()
>      - make default_mapping boolean
>      - redo default mapping detection loop as a combo of for/if
>      - return back lost TODO comment
>      - new patch removing numa_node from generic CPUState
>   - drop silence test patch as it's already in pull req on list
>   - new patch [3/5] to fix missing _PXM/fdt nodes for implicitly mapped CPUs
>   - new patch dropping fallback to node 0
> 
> 
> git repo for testing:
>    https://github.com/imammedo/qemu.git cphp_numa_cfg_follow_up_v3_cleanups_v3
> 
> CC: qemu-arm@nongnu.org
> CC: qemu-ppc@nongnu.org
> CC: Eduardo Habkost <ehabkost@redhat.com>
> CC: David Gibson <david@gibson.dropbear.id.au>
> CC: Andrew Jones <drjones@redhat.com>
> 
> 
> Igor Mammedov (7):
>   numa: consolidate cpu_preplug fixups/checks for pc/arm/spapr
>   numa: move default mapping init to machine
>   numa: make sure that all cpus have has_node_id set if numa is enabled
>   numa: make hmp 'info numa' fetch numa nodes from qmp_query_cpus()
>     result
>   numa: move numa_node from CPUState into target specific classes
>   spapr: cleanup spapr_fixup_cpu_numa_dt() usage
>   numa: cpu: calculate/set default node-ids after all -numa CLI options
>     are parsed

Patches 1-6 queued on numa-next.  Thanks.

-- 
Eduardo
