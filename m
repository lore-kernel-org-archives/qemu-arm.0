Received: by 10.223.161.27 with SMTP id o27csp761762wro;
        Tue, 24 Oct 2017 09:19:25 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Re40lrlbfUoKEsztTqY6+TvNoixtmCgGRwaf1E3uCrfkU/0AEO9j14QNVnubwU8fxmvN7z
X-Received: by 10.129.116.193 with SMTP id p184mr11288478ywc.131.1508861965600;
        Tue, 24 Oct 2017 09:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508861965; cv=none;
        d=google.com; s=arc-20160816;
        b=UCmBLYUivXoyGIZT4SFNXkdWVp0PRIImQc1d6QV9U1ZJFEvDLW5sVntn4sbBye2W/6
         rgz/G2TbNRyX/7Tj8+mG6DR86Pg+tUt8qlhn2NsYdiN1vIoGrnSSb5OrRBlDyrrAQQ2v
         uYDbKjkW5VlR3VkDPuurT49bPmh0safRAo9gZ9CZAh9sVJBkO53Ycsl0tW4xyPwPMqFu
         GY97Wq394P+DR+aYK2Gq9FATohmezO59/9FT2/1UbIpHElJIo7L+4mgw2r3K1GGIW85l
         l6bGSxSXRcIG0DmAptZ//MLka2jZ4qw0QfmyfSoaqlzDPKZo3faQzb7sO90HDFdbiE8C
         CYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=v8s2Ajchir47vpXbrjzEiuubGT0uj+2O/NbPSUzCgik=;
        b=s/29eugYH0K3gOQNPUbnjKmpeQipxpfWzNjkI3Fd7doWNLvBa4PyKHtTLPa/filIPL
         cDAqsCKfRxegsv07PDIcH7Y6cARntPkPF0/LFZTVzz8G6sJ+fCpT5x4HYmV4Ln166uW9
         j9T5zRB9aLuW0U103jqQG6RzaHWXfO2febPuCyzJa+g6enrtDqAnf0nLSc/ol+kkuTP4
         vAmK5kVr89A2YAsxelcW+7RIaK4vw0O08eoxrdFz38nXtsFiDsOyf8sV/6yx1yJHoGVO
         3AievSr+fTED5mm8K005ZQ+rIJnjFWCUM49cxupzUUD11NkBOb7W1rPq2wCcLYtQDv0e
         vmiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si96723ywl.646.2017.10.24.09.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 09:19:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e71vJ-0001pJ-3R
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 12:19:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=463712e83=anthony.perard@citrix.com>)
	id 1e71uN-0001UH-J0
	for qemu-devel@nongnu.org; Tue, 24 Oct 2017 12:18:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=463712e83=anthony.perard@citrix.com>)
	id 1e71uM-0004R6-Gk
	for qemu-devel@nongnu.org; Tue, 24 Oct 2017 12:18:27 -0400
Received: from smtp.citrix.com ([66.165.176.89]:20607)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <prvs=463712e83=anthony.perard@citrix.com>)
	id 1e71uH-0004Ob-TF; Tue, 24 Oct 2017 12:18:22 -0400
X-IronPort-AV: E=Sophos;i="5.43,428,1503360000"; d="scan'208";a="447940085"
Date: Tue, 24 Oct 2017 17:15:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171024161527.GG1885@perard.uk.xensource.com>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Subject: Re: [Qemu-devel] [PATCH v3 01/46] Replace all occurances of
 __FUNCTION__ with __func__
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, alistair23@gmail.com,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q02MshADNT+o

On Thu, Oct 19, 2017 at 09:15:41AM -0700, Alistair Francis wrote:
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

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD
