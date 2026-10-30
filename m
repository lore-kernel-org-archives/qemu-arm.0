Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C9F606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bx12buyD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMggr-0005WJ-8e; Fri, 30 Oct 2026 03:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghoffman@redhat.com>)
 id 1xMggn-0005VQ-8e
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 03:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghoffman@redhat.com>)
 id 1xMggj-0003Cu-8n
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 03:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793343965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=poF4qNnQFvay4L5JeJqPgMsg6fiaW54aOEw1S3EOqig=;
 b=bx12buyDLIuNvXBwQ5oz2JONMWEePaS+PsUrRqdzKPjtTnvkRbrUn+8XqK96eSLwzwUOVx
 BuyeZJ98qjQPWr3WeCSyEaZw8HqRbkNcs3Bef/w0bFNYi72yE4oNPis8bVhjbmHfwGzqCb
 rNzvVeKNL9BthupxAyl3hvxzsqOZVFA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-zNJKS6EsOr2NKJ9TliTq7g-1; Fri,
 30 Oct 2026 03:06:00 -0400
X-MC-Unique: zNJKS6EsOr2NKJ9TliTq7g-1
X-Mimecast-MFC-AGG-ID: zNJKS6EsOr2NKJ9TliTq7g_1793343959
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 053401955DE7; Fri, 30 Oct 2026 07:05:58 +0000 (UTC)
Received: from nucbdw.ghoffman.csb.home.kraxel.org
 (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 98D271800495; Fri, 30 Oct 2026 07:05:56 +0000 (UTC)
Received: by nucbdw.ghoffman.csb.home.kraxel.org (Postfix, from userid 11758)
 id 4BD9441B6176; Fri, 30 Oct 2026 08:05:54 +0100 (CET)
Date: Fri, 30 Oct 2026 08:05:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Junjie Cao <junjie.cao@linux.dev>
Cc: jamin_lin@aspeedtech.com, marcandre.lureau@redhat.com, clg@kaod.org, 
 peter.maydell@linaro.org, kane_chen@aspeedtech.com, troy_lee@aspeedtech.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, junjie.cao@intel.com
Subject: Re: [PATCH v7 1/8] hw/usb/bus: Let the controller ask for the
 automatic hub
Message-ID: <auRBKZMbz4DyzpZR@nucbdw.ghoffman.csb.home.kraxel.org>
References: <20261028034140.367393-1-jamin_lin@aspeedtech.com>
 <20261028034140.367393-2-jamin_lin@aspeedtech.com>
 <20261029100942.894066-1-junjie.cao@linux.dev>
 <auMtC1vX9nRw1YIn@nucbdw.ghoffman.csb.home.kraxel.org>
 <20261029144914.916641-1-junjie.cao@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029144914.916641-1-junjie.cao@linux.dev>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: YMAwLkliAINrJTSI59Fn94HjJfwlTnTJZ-vb4Liiz2Q_1793343959
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ghoffman@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  Hi,

> > So, if we need a property anyway, I guess it is better to have all
> > usb host adapters behave the same and flip auto-hub to default off
> > for new machines types.  It's easy enough to turn it back on via
> > qemu command line if needed.
> 
> Agreed. One case to account for is raspi: it has no versioned
> machine types, and dwc2 has a single root port.
> "-device usb-kbd -device usb-mouse" relies on the automatic hub
> today; with auto-hub off, the second device would fail with
> "no free ports".
> 
> I suggest enabling auto-hub in bcm2835_peripherals to preserve
> the current board behaviour while leaving the controller default
> off.

Yes, makes sense.

take care,
  Gerd


