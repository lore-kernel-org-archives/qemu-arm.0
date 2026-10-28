Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4DA606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WADDGl/s
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM1vG-0006C8-61; Wed, 28 Oct 2026 07:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghoffman@redhat.com>)
 id 1xM1vF-0006Bq-Fd
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 07:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghoffman@redhat.com>)
 id 1xM1vE-0003o3-1o
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 07:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793187262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ux2XPEVz3m/5A+gQ9z59VW6uobTkNcY59atDctKFLM=;
 b=WADDGl/sWUxRb2U+7nxB+Zt0ejA63djqanGAmfRNV3QLt/yLvW7luQvXrye2qaXN3HOx+S
 VvHzjuc6c3YhpexDTH5VrbZvGl34ghyOLHmDOoDprlrMGlJOIawMCdzTDEBWH+oBPEcmxT
 uwOY6CMCTOfXu9INxHi58FeY07cMaco=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-uFzqJYO6OveUirYnuyXACA-1; Wed,
 28 Oct 2026 07:34:13 -0400
X-MC-Unique: uFzqJYO6OveUirYnuyXACA-1
X-Mimecast-MFC-AGG-ID: uFzqJYO6OveUirYnuyXACA_1793187251
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 29B8818052EF; Wed, 28 Oct 2026 11:34:11 +0000 (UTC)
Received: from nucbdw.ghoffman.csb.home.kraxel.org
 (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4BCF830002CD; Wed, 28 Oct 2026 11:34:10 +0000 (UTC)
Received: by nucbdw.ghoffman.csb.home.kraxel.org (Postfix, from userid 11758)
 id 3F86240D3AE1; Wed, 28 Oct 2026 12:34:08 +0100 (CET)
Date: Wed, 28 Oct 2026 12:34:07 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: "junjie.cao@linux.dev" <junjie.cao@linux.dev>, 
 "junjie.cao@intel.com" <junjie.cao@intel.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>, 
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v6 1/8] hw/usb/bus: Let a bus opt out of automatic hub
 insertion
Message-ID: <auHbnlQQ7KZecdYE@nucbdw.ghoffman.csb.home.kraxel.org>
References: <20261019092448.278079-1-jamin_lin@aspeedtech.com>
 <20261019092448.278079-2-jamin_lin@aspeedtech.com>
 <atXr2J5oxn3BBgb-@nucbdw.ghoffman.csb.home.kraxel.org>
 <TYZPR06MB7373C4DABEAE16D546241853FC602@TYZPR06MB7373.apcprd06.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <TYZPR06MB7373C4DABEAE16D546241853FC602@TYZPR06MB7373.apcprd06.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: b8mKCoNqh2k3iOoH5_YtFxtR8TRMVnpsf7s8SrwXll8_1793187251
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ghoffman@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> > Alternative idea would be to add the config option, but only enable the
> > automatic hub logic for actual usb 1.1 controllers (ohci / uhci), where it does
> > not matter much for devices whenever they are plugged into an root port or
> > hub port.
> 
> Sorry for the late reply.
> 
> Yes, it gets in the way. usbredir carries one device per connection, so
> our bus has one port. Plugging that device in adds a hub, and the device
> ends up behind it. That is why I added the flag.
> 
> If you would rather do one of these, tell me and I will send it:
> 
>  1. Remove the automatic hub.
>  2. Keep it, but only for the USB 1.1 controllers, ohci and uhci.

I think it is better to keep the logic for now and add an config option
for it.  This way we can tweak things easily if needed.  Set the option
to "no automatic hub" for your controller and also ehci + xhci, best as
separate patch for each controller.

take care,
  Gerd


