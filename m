Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A366606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TNBh4QpH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOXZn-0005gQ-A8; Wed, 04 Nov 2026 04:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghoffman@redhat.com>)
 id 1xOXZl-0005fi-E2
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 04:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghoffman@redhat.com>)
 id 1xOXZk-0002Tp-0t
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 04:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793785593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+M3wR5644aZjy+KM75dXIRE7Lxz5bE8viHSrfP93CU=;
 b=TNBh4QpHuhlGkOLXD993MAz3UvTTndKqB+/lU2uaI3WDlsP7soQOVYKYc8hIxpVbod2GEW
 i9wg6HsPRTw4q0N1PDE9VGPnTYJSU8QIFtrkxnoQzMH/EqNS9YV/GWm4RxiTDQIbPRYkAd
 cIxGDze77ofeqMQ0L/85D4k/IdNfDI0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-wAhDEdTkMRemDarNRhk5GA-1; Wed,
 04 Nov 2026 04:46:30 -0500
X-MC-Unique: wAhDEdTkMRemDarNRhk5GA-1
X-Mimecast-MFC-AGG-ID: wAhDEdTkMRemDarNRhk5GA_1793785588
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 490F619560B9; Wed,  4 Nov 2026 09:46:28 +0000 (UTC)
Received: from nucbdw.ghoffman.csb.home.kraxel.org
 (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 42198195608C; Wed,  4 Nov 2026 09:46:27 +0000 (UTC)
Received: by nucbdw.ghoffman.csb.home.kraxel.org (Postfix, from userid 11758)
 id DEA954077C40; Wed, 04 Nov 2026 10:46:24 +0100 (CET)
Date: Wed, 4 Nov 2026 10:46:24 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tushar Dave <tdave@nvidia.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
 mst@redhat.com, marcel@redhat.com, devel@edk2.groups.io,
 alwilliamson@nvidia.com, 
 jgg@nvidia.com, skolothumtho@nvidia.com, ardb@kernel.org
Subject: Re: [PATCH v2 0/5] hw/pci, hw/arm/virt: fixed PCI BAR placement
Message-ID: <aur-0asyHUsSflMa@nucbdw.ghoffman.csb.home.kraxel.org>
References: <20261102181241.3077981-1-tdave@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102181241.3077981-1-tdave@nvidia.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: Lp-RBv1jqy_hLnIwruJKjUDdGG06l_zT9an9OLszhgo_1793785588
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ghoffman@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:12:36PM -0600, Tushar Dave wrote:
> This patch series introduces a mechanism to specify Guest Physical Addresses
> (GPAs) for PCI BARs, allowing explicit placement of guest MMIO BAR addresses
> to match host physical addresses for assigned devices.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


