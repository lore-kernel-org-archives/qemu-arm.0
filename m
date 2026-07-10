Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA76C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 08:38:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wi6kh-0007sO-Iy; Fri, 10 Jul 2026 04:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wi6kg-0007rg-BH
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 04:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wi6ke-0001SS-IC
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 04:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783672707;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TRKJgHASPrVJzWBzSrjfn1FyvO0BZBHWJUUTLQ762o=;
 b=Yy5ZRt3Q0bZ60BVCLmivH5rTdXNA+WY0BFDMIPoy6fXbFouoQNua/Fy+HIdIfviPZTl1Be
 Iacu+EWUFko7lWvdO64zX5tO8RX3RR7ss4mLNg2U1IstVIrK4M77E2V3rGawqfBHVXcfKy
 7Ddo0pA5Xr4z50lhCZSjv1EM3xo73Zo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-PPyy05BgMwm2NATmEt3wrw-1; Fri,
 10 Jul 2026 04:38:22 -0400
X-MC-Unique: PPyy05BgMwm2NATmEt3wrw-1
X-Mimecast-MFC-AGG-ID: PPyy05BgMwm2NATmEt3wrw_1783672700
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6BCF91956070; Fri, 10 Jul 2026 08:38:20 +0000 (UTC)
Received: from redhat.com (unknown [10.44.49.135])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 369AB30001A1; Fri, 10 Jul 2026 08:38:17 +0000 (UTC)
Date: Fri, 10 Jul 2026 09:38:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, harshpb@linux.ibm.com
Subject: Re: [PATCH] docs: Update qmp scripts path
Message-ID: <alCvdtpfVGI4OB8B@redhat.com>
References: <20260710081402.93045-1-shivangu@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20260710081402.93045-1-shivangu@linux.ibm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: ah9FzE67pk23GJAcdGEigPvUYfHGvXUPefJTi5__GRU_1783672700
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Jul 10, 2026 at 01:44:02PM +0530, Shivang Upadhyay wrote:
> Qmp scripts are essentially removed from scripts directory as per commit
> b08e111b1e1 ("scripts: nudge users to use 'run' script for scripts that
> import qemu.qmp"). Scripts essentially redirect to run build/run script.
> Reflecting the same changes on docs.
> 
> Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
> ---
>  docs/devel/build-system.rst            |  2 +-
>  docs/interop/live-block-operations.rst | 10 +++++-----
>  docs/system/arm/cpu-features.rst       |  5 +++--
>  docs/system/devices/usb.rst            |  2 +-
>  4 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


