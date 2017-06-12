Received: by 10.25.0.23 with SMTP id 23csp721817lfa;
        Sun, 11 Jun 2017 23:24:11 -0700 (PDT)
X-Received: by 10.55.98.145 with SMTP id w139mr34890609qkb.106.1497248651614;
        Sun, 11 Jun 2017 23:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497248651; cv=none;
        d=google.com; s=arc-20160816;
        b=VQ0iiwlN/mqcYhUeYCkPmzsMoWAF8wDgcHVkdsV0ciuB6JkOsjXa2kT/uVc5Oixmd2
         LfsQIHz5uQ5oR7fvDTpY67yOYPke7VxC/Ekxhc62yRQKzaSjVqC29QIAWXJHnsLPvrSv
         pqMlPmkiRk5NrKM/+djXjjtEiegL4qgs0yx1fnkn8r6BIKU1H3HZh3i2wXe6Sy7nwAgQ
         o3+PzEvos2NmPwYa4hD9JpwRR/4XNK0uH1Iv+JjwR5ZBs9GHS3BP50DmMBVgbU4HVmiw
         Jfy/R4Y9RrOFcnosuD6o3L6WrT4A1ibnRuF0WQ3vD1dYnayOvaClOU3Kaw1rkEkVj3jK
         e+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=9PQaJhYCooSY6JVlgNqEyW+WJNHJSuBgFLAH+xBPXsE=;
        b=O/b1qDw+DXtcl/IzMUmdHcYYfcAJxXnyxu2nI1ELtk/Q7zjXW8sAq36jqGzxhV2YzG
         JQ/Yt7R4RS+swIwdY4SrLgPXcfVwpQhPO6/qRcixhdRUGxRaFpVhAFwM4kH8dizQJph3
         GJfdS41f6Q4WL3pDcFSSzHrm1ZmEjRA7omJItfFlZsypFEW9lTIUDUlnwZfF01dM49Oq
         hbLXrfg17pi9lP6XeHdU+4gTyxh29JeEj4kCR+E5aKM7EuE4we6EASqYBBlOKPSIYZEv
         /Sq62VFdzvXkT7Du4WaG+PI023PKf+JPwgy0wkyMNEQl41qXOn+hV0dWxW6Aa3ffloAq
         AcEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o18si7986829qkh.20.2017.06.11.23.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Jun 2017 23:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKIlk-000861-UK
	for alex.bennee@linaro.org; Mon, 12 Jun 2017 02:24:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dKIlf-00085j-0r
	for qemu-arm@nongnu.org; Mon, 12 Jun 2017 02:24:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dKIla-0003Te-3R
	for qemu-arm@nongnu.org; Mon, 12 Jun 2017 02:24:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1dKIlZ-0003TU-Ti; Mon, 12 Jun 2017 02:23:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C1D983F40;
	Mon, 12 Jun 2017 06:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1C1D983F40
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1C1D983F40
Received: from localhost (ovpn-116-65.ams2.redhat.com [10.36.116.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45E487E3BA;
	Mon, 12 Jun 2017 06:23:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1497023553-18411-2-git-send-email-eric.auger@redhat.com> (Eric
	Auger's message of "Fri, 9 Jun 2017 17:52:30 +0200")
References: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
	<1497023553-18411-2-git-send-email-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Date: Mon, 12 Jun 2017 08:23:50 +0200
Message-ID: <87r2yplo5l.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 12 Jun 2017 06:23:56 +0000 (UTC)
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, zhaoshenglong@huawei.com,
	dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ip+S8tCunX5O

Eric Auger <eric.auger@redhat.com> wrote:
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

Reviewed-by: Juan Quintela <quintela@redhat.com>
