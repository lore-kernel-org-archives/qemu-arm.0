Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1587470wrt;
        Thu, 10 Jan 2019 01:05:04 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5jrdgGnEVyzFXbvzSdpUdFDctZzxKbQ1myVALvC/iJ4jPGJttBoL/7IOFzSSFYkXNdGxdq
X-Received: by 2002:a5d:628a:: with SMTP id k10mr7986137wru.254.1547111104847;
        Thu, 10 Jan 2019 01:05:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547111104; cv=none;
        d=google.com; s=arc-20160816;
        b=B1O8Ye7mxAro0OGbXo3rRjTSsPJ3wnR/k5G6YnhD8p90LAZEy2E9aLipZPoGuBvMOD
         KJbqdnXi3UE2Zx6vUgvX4uQJMoxtEW3mMYbmNJLZx+2EcSgkPVxDbdNRfzZNRm+IpX/E
         WgwJOY44Q6r4gfwa0CUU1Rj2KB7ByKzl3TyZq5fvhooD112b7498obQQZBfySREVgabk
         qwxkRCrhODhdJWi0/GzejQyrok0OhXRvR6bElFBPJ3VsfXyWJYvOVGWDBWUfBHxNqjGq
         LMa8zaVTvx+JPpz8pA/ntvTjhCXrkCkBtBWOB3iA4TjoQ7yOuSW6PiF6u/sRIB43L+3T
         bHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=jbo3VO3SJewpMzwLY54+4KJ37W6O8LAeAAUEQLh80C4=;
        b=A6z6QZNDoEfWlH9S3rlLZxUcj0xYzR3PEo9cVQdITSeO0HIcjCYUWYkILE5SvNgnp6
         Ir6RrdwuAqb2SlaIBMiVmJFqnBm7U6dmARhRhCZfpy6K7BoQ4eRDemz1DzcH1qtabv73
         vlfocYGJy7jPuMp+B09o6vD9yAC2+/WtkaJbaFKCorG0rpW3zr4A2ikxXrzXph8Uzy3c
         SgLml24Jqiz5x2sZ1EVlJzjTgiUrzrQMS7eBi5pLHVEJ87mRma/2GI0PcaZum9s4Pd9c
         PTAb5pO4zSftS9MolnECcS0vxugPH3fpGvQ2QrWIQ5SfsYfImAGwLOgniSrXKq/+XH9y
         KJ3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si40695840wrp.174.2019.01.10.01.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 01:05:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghWGt-0001yX-Uq
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 04:05:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ghW4S-0000yj-Sq
	for qemu-devel@nongnu.org; Thu, 10 Jan 2019 03:52:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ghW4S-0000Dn-Aq
	for qemu-devel@nongnu.org; Thu, 10 Jan 2019 03:52:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1ghW4Q-0000Cr-So; Thu, 10 Jan 2019 03:52:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 266CF796E2;
	Thu, 10 Jan 2019 08:52:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-203.ams2.redhat.com
	[10.36.116.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53CC65D739;
	Thu, 10 Jan 2019 08:52:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id ED9D916E03; Thu, 10 Jan 2019 09:52:06 +0100 (CET)
Date: Thu, 10 Jan 2019 09:52:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190110085206.ain25ervr4aduqyb@sirius.home.kraxel.org>
References: <1546614146-10525-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1546614146-10525-1-git-send-email-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 10 Jan 2019 08:52:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/audio/marvell: Don't include
 unnecessary i2c.h header file
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1fCJ/DXUHBFv

On Fri, Jan 04, 2019 at 04:02:26PM +0100, Thomas Huth wrote:
> This device does not use I2C, so no need to include the header file here.

Added to audio queue.

thanks,
  Gerd

