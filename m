Received: by 10.28.173.206 with SMTP id w197csp5964217wme;
        Wed, 17 Jan 2018 17:50:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBovI5CB6UQ+YevX321HaQfzwM+J+6GzNPR/sbEjjT2Bi6N7v2ZNFbDd/VB/s/5uRaCN2ySu9
X-Received: by 10.37.130.8 with SMTP id q8mr6723810ybk.339.1516240254419;
        Wed, 17 Jan 2018 17:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516240254; cv=none;
        d=google.com; s=arc-20160816;
        b=e5kCzo/23K3Q2oJETLt2yAaPz8J8FL62FinPl53imASMiN+50+jKGlL0IrMmp/sYfF
         XOvznQ7qN3JsQsyAWbsfcm783j/zeWwyYNPxh1SuwmcE1g3q6eL/4RoLVudXbueOzlAZ
         RpzV7bHve/9LphW9FuAhvUETBZtJivr0hRoyhHvYHwgOJiZRnc/dmUOsH6n+VfMb4XK0
         YnuGgAAZHXIb6kOp+VyN1m7eMsgW9VOvb8f+WNYbOOF5TB+bqXOXg2BPLl3L7CfvJS4f
         3+r2KmRkJchsb3DRBuFnLIOCUE+G0zD63uRu+V58Si3zcC4mUCmq6XBRP6Af6kn8I01+
         w8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ccFtLNxhOBjtAAyvEaJKhO14BVMSfDsnDYymZ6EQRUs=;
        b=feUBhys7h+lAvXjhlTbvpbtKH/d11gTCkP97O9YZuxkrMoav5WRSeAnrhKq4Weppvw
         T7KPOrUu+Dw1K9xLjHkZTMyXB8klV069vlq0Ldaxr6sBwCvtmn3g1UbkBwLw5U7Hrzkz
         nVNWfRWHKle7/7Pqs6wVk/MywhzYFd2JCG0llFskpANIMOi2PEniisweQUnHqbn52nTX
         PGcwzeS7FOb68Gf1HDIWjLigqw8oqAOgDkgbAbLjZ/0EwzUZxulD0SCrOTiuPCR4SCIq
         cak/eT8+XYODCxST6SnxtalkPaXhojEzaNA3tYFWfGwQ6GRsIIRKKwLhmuJ7HeJYnuGs
         z83Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z139si1432777ywg.449.2018.01.17.17.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 17:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebzLx-0007gI-Tx
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 20:50:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ebzLl-0007f8-Gv
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 20:50:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ebzLh-0001DO-Kl
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 20:50:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44080)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ebzLh-0001Ct-EU; Wed, 17 Jan 2018 20:50:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D61012CE964;
	Thu, 18 Jan 2018 01:50:29 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 373CF60A9D;
	Thu, 18 Jan 2018 01:50:23 +0000 (UTC)
Date: Wed, 17 Jan 2018 23:50:21 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180118015021.GN627@localhost.localdomain>
References: <1516203816-19374-1-git-send-email-imammedo@redhat.com>
	<1516203816-19374-23-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516203816-19374-23-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Jan 2018 01:50:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 22/24] cpu: get rid of unused cpu_init()
 defines
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tuslSX5GRfMT

On Wed, Jan 17, 2018 at 04:43:34PM +0100, Igor Mammedov wrote:
> cpu_init(cpu_model) were replaced by cpu_create(cpu_type) so
> no users are left, remove it.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Wonderful.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
