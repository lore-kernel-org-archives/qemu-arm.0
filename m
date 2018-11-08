Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3141863wrw;
        Thu, 8 Nov 2018 01:07:00 -0800 (PST)
X-Google-Smtp-Source: AJdET5cdGc1qFnvzhDWg4gM5gAZuOQtLrDnHoSfnj9mRmnSaSqlFndjdzTM5OijCjD1G6LImRa+4
X-Received: by 2002:a0c:8286:: with SMTP id i6mr3581810qva.65.1541668020492;
        Thu, 08 Nov 2018 01:07:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541668020; cv=none;
        d=google.com; s=arc-20160816;
        b=we2IeWAR3NBhSSAzx1xyvWgJSR5J3DbhmPLbw3y8w7zYCTsVC1Rc2O8XVY55VidQwh
         7WHpPEYvLmYvIriVNWIe1RnKVsOcXi3r1T1zuwdkzK/ZJ+vJ2fh11aIc2r7bdV+8UTSm
         bUa66Gm8M+Uggr2rQFkpLxCF5lYU8s9+1eHLhtT8smcgU4KhFgAtFhoiszxmGMorgm8Y
         xSEBQVvB5nJREg7Q4I2Mm6NY4cEi3Izdug0djOQtNN8uzhxSojmfrJk9q0nLebVKwcei
         K1zp4UpxOZPvqoET1S271YLOTvjZ4m+3waU6maS0V8wT/m8lAcZotqkmCrve2MTRXvUJ
         fwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=kXapxHFs7sY/B/muJ/u6Tq57U2lhpX2ML7QF2ziLwQ8=;
        b=DiVwhhk2yRLw3j6SlmYNH0KMHZD6K+7/zTP+d0sp3bC5ikGVpCs7ZVqYmMXUIX29Si
         PW2XR14ONdDxqxtsY/zkLw+9KF59AcNeWq+V+6SFzLH7uzkCfMZgw96wqjjVOnGLjNgi
         N8u4/UJxyBlTJaEhsMtBVOrNcgcScZS9ddC8XHqiJNGGi1gMMLnZp3AERivaewy5e3MR
         qVBy+Hqhk9FSP6wLCf1tCB2LHJX7UG1U7d5wDqsBt5TvnM4gQr9RoYXuaR/3uZpLTJRS
         2ONWnktxxxwZgM55z7QWQmRGVVRJK4dT25tH3GEV5uPuRFequPv4Km4XjlKexoutJuBl
         EU0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l189-v6si373666qkd.32.2018.11.08.01.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 01:07:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKgHB-0003Jm-MQ
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 04:06:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gKgGx-0003JT-DH
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:06:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gKgGm-0000FJ-7O
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:06:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gKgGi-00008l-Ti; Thu, 08 Nov 2018 04:06:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 571F2312E9DE;
	Thu,  8 Nov 2018 09:06:23 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4664E5D75F;
	Thu,  8 Nov 2018 09:06:19 +0000 (UTC)
Date: Thu, 8 Nov 2018 10:06:16 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181108090616.txip6wi3sfwcigvs@kamzik.brq.redhat.com>
References: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
	<1540663650-106694-4-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1540663650-106694-4-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 08 Nov 2018 09:06:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V5 3/5] hw/misc/pvpanic: Add the
 MMIO interface
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cAPfd1dkyVhR

Hi Peng,

On Sun, Oct 28, 2018 at 02:07:28AM +0800, Peng Hao wrote:

[missing commit message]

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/misc/pvpanic.c         | 81 +++++++++++++++++++++++++++++++++++++--=
--------
>  include/hw/misc/pvpanic.h |  1 +
>  2 files changed, 65 insertions(+), 17 deletions(-)

This patch should also include an update to docs/specs/pvpanic.txt

Thanks,
drew
