Received: by 10.223.150.237 with SMTP id u100csp3411759wrb;
        Tue, 14 Nov 2017 01:56:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYt4M8GNSRzwH8r9wxkmOfLC1xT0j0Pg7fYlXySRsptkouxtpVDcPnOYPBLUWku+6cn29Ca
X-Received: by 10.129.45.137 with SMTP id t131mr7443417ywt.11.1510653416428;
        Tue, 14 Nov 2017 01:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510653416; cv=none;
        d=google.com; s=arc-20160816;
        b=AWr05j7F86bFCrvk2fls2kEe+2WI7ykQSBTRjZLT4p5aWgY61tM807HJUt+0J6gV7G
         3hjrN17aOq7ZwLOs5y3Ea1jy3xqww8PLIN3UnVaXTIL7HhFENps3Oh6XgDINZSG0JvSq
         beRYoaPgC5TGUj0cNAFE7Cpqlwl+552uwZhy49+QPCmgJl0Otk+LgfUYAE+OTI6cARuM
         /0gMAOzFZW+pt8TJoOmkc6e5/oWhz5u0s9wApzLCcfOTjSDC0CEpbhPxMCTCBa5UUFqv
         glnze5qiiY69169lV2tixNIapR+W5q2zOA2KiLR3bkyitaGigMnl7/tHIb3Yk/mENrDY
         Q9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=iCm3JTRTsRYd1UHX15peAB+gFPfNQwdAwTf4wxPmdnY=;
        b=N9pEGNHVeE1+IO45lyFVxbWZWaqwVMo02i7KbbBpxDj8aEARWYZELPUGGKvR8ePIH5
         m463x244Ei1j1tyTfhFjkbao0Wr2uVuBhyxuk/I6JhcpqpJ2cBNats1e3kOWqV9FUCLc
         WS7/3HP+wSJ/WzzB3pLVixZMQUKPIV7wB6XAFmDnaym55zm1H9JnG0knDPC9zmt78FZQ
         XG1VSHZsTrU7b1zpln81N5hfNRAVpnwWc1JCsU2WDjmgtrH8bNausuSzyOcy07/0kd+b
         OFbQqdcQUvKlfmOcVBDA9TU3dlxyP8HE5XZTfu8u0WvcvjHbs9OIKZRxp85U5gbuLKJi
         TwdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si3811196ybp.711.2017.11.14.01.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Nov 2017 01:56:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEXxf-00033D-SM
	for alex.bennee@linaro.org; Tue, 14 Nov 2017 04:56:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eEXxT-0002lg-EG
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 04:56:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eEXxP-0006Fi-E0
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 04:56:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1eEXxP-0006Ed-8E; Tue, 14 Nov 2017 04:56:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1ADF776543;
	Tue, 14 Nov 2017 09:56:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC0FB2C311;
	Tue, 14 Nov 2017 09:56:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 01F18A1F4; Tue, 14 Nov 2017 10:56:31 +0100 (CET)
Date: Tue, 14 Nov 2017 10:56:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171114095630.2v4lzfxlmpom33mi@sirius.home.kraxel.org>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<67465b2020def3680dfd15d6473d3316c3fc8be0.1510612380.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67465b2020def3680dfd15d6473d3316c3fc8be0.1510612380.git.alistair.francis@xilinx.com>
User-Agent: NeoMutt/20171027
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 14 Nov 2017 09:56:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 02/29] Replace all occurances of
 __FUNCTION__ with __func__
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
	armbru@redhat.com, Yongbok Kim <yongbok.kim@imgtec.com>,
	qemu-arm@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>, alistair23@gmail.com,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9TihUVdMrBB2

On Mon, Nov 13, 2017 at 02:34:42PM -0800, Alistair Francis wrote:
> Replace all occurs of __FUNCTION__ except for the check in checkpatch
> with the non GCC specific __func__.
> 
> One line in hcd-musb.c was manually tweaked to pass checkpatch.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Fam Zheng <famz@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
