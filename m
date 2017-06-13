Received: by 10.25.0.23 with SMTP id 23csp141061lfa;
        Mon, 12 Jun 2017 21:24:13 -0700 (PDT)
X-Received: by 10.55.97.148 with SMTP id v142mr8974644qkb.107.1497327853307;
        Mon, 12 Jun 2017 21:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497327853; cv=none;
        d=google.com; s=arc-20160816;
        b=tdJv7cB4ONQIwLIG1quncgXnSPXVPJeUlZhx/N02KPzOVetBdpOnx4cosNJAwI7oQE
         glkslNX6wscW7GDRZuVXR9boADUthF4+NucKaAJBmnvT2GMNch8XyWaAn/jNeX0yPL77
         1PjVxzU3Fyzc5sQmifY/ekTVwwsZguVeesxl7jvJU7OwBVbowzUkQzSszYPM2bdCXdt5
         OVZcg6cuEymOr2tYT6l9UrTJif+J/foWzwDTnniObilJ18uoF+a8tNmEVq+YZzw10Xf+
         foWhZ/2QJSW6E0WSRdsWd+kz5+QBQCNoLmOxacSHUmCUz+U3csieRe1LPQAjhlik7wtw
         bjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=GUMbrLwJs8CHwXu+YeTOqdLVnWWwfuu09osShusshks=;
        b=oTaoR3lStJUC5F0H4A76y4GMW1Qmp1QBu4BrBgx8oQ2Ov16eMx4+Kggr+yf53zZPHF
         Zvk9QHMcia9bEirfTNYtTcTUnDXTPt5b0Y/xlWHRlSg8cFRs3LqzzlOeWKY6/R3a1c/n
         v4pgHDofZCaLaOzT3s2cl/zRGP3M+gCypr+Zo9G4X3Fp57dNvC5UAw/aPw6GwEAopJvO
         5je1OrcUgU0qFFM42g6P8KrtVdtqutsX6SJ8xqnonXAhGBT4mwnUOJobGv+jUqHwMJyL
         rIa80ID/BoMhAdvEeczdxWuoiOPCpPi5MirZB2BauqF6z7YEvMJVtFUqDOYSrwjAS+xA
         DmFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o190si10497985qkc.114.2017.06.12.21.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Jun 2017 21:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKdNC-0002qJ-NV
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 00:24:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dKdN7-0002qC-PU
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 00:24:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dKdN4-0003Q4-Ke
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 00:24:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1dKdN4-0003Ob-FC; Tue, 13 Jun 2017 00:24:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 241501555C;
	Tue, 13 Jun 2017 04:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 241501555C
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=peterx@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 241501555C
Received: from pxdev.xzpeter.org (ovpn-12-50.pek2.redhat.com [10.72.12.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A04137E5B6;
	Tue, 13 Jun 2017 04:23:52 +0000 (UTC)
Date: Tue, 13 Jun 2017 12:23:49 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170613042349.GC11751@pxdev.xzpeter.org>
References: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
	<1497023553-18411-2-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1497023553-18411-2-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 13 Jun 2017 04:24:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 1/4] kvm-all: Pass an error object to
 kvm_device_access
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	quintela@redhat.com, qemu-devel@nongnu.org,
	Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, zhaoshenglong@huawei.com,
	dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: laAjUC84tyvA

On Fri, Jun 09, 2017 at 05:52:30PM +0200, Eric Auger wrote:
> In some circumstances, we don't want to abort if the
> kvm_device_access fails. This will be the case during ITS
> migration, in case the ITS table save/restore fails because
> the guest did not program the vITS correctly. So let's pass an
> error object to the function and return the ioctl value. New
> callers will be able to make a decision upon this returned
> value.
> 
> Existing callers pass &error_abort which will cause the
> function to abort on failure.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu
