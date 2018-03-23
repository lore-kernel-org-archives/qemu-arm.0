Received: by 10.28.71.155 with SMTP id m27csp285858wmi;
        Fri, 23 Mar 2018 03:24:26 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuZMC/6EOXAvYR6GPAf3Hm4f6JudTfoTjG+QAhyJQTnapdKES86DyxCuxPgKAfK3GWaVmMM
X-Received: by 10.237.54.161 with SMTP id f30mr41283803qtb.128.1521800666556;
        Fri, 23 Mar 2018 03:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521800666; cv=none;
        d=google.com; s=arc-20160816;
        b=Rfxe/zw6GSVP5zve9kjjBymchMAtEwx/X9HbJy/qZ8tMmEIcAwdCvZ+jwfH9yohd2d
         qOg3JQ6Ygyt53y60Y62OzlW6QQHZzhYaRen69bilRJ6LuvseSICIUmZ3FlDqg1fvbjSK
         roDi2xCScyOGP4pQKEKP5QJJvxDvapX+A6bj4dLYi2wwJhesgaShTqoT/mq6mbP90IqD
         loKg07WuQtISfqhFrA9u2QG9YhvZasb9E4FNLg85vyDiEorIurPZy8klYE1ZkxVkblbH
         mVq55FSZrzauNw3cl+P3ndDvOTo8cJ52xO4ID/zCBVVoS7S7GJxzcyU7HHU1oWAaBtDg
         upUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :from:to:arc-authentication-results;
        bh=TQXEpGvMPBloU5CxwO080qorM93SLXqo2yrVT12evuA=;
        b=hQk1OsW03djNAVjTlICyIjWP6RoYdETl9zJq0OSmqa+R/IdDBUNliQrP5KXJppSP3n
         ZoJsJslI+XC/Dh2BwTSHcbVSuCyXfIJsQBmd3xx64byQJ2JUMkzig5PdQQ2sNmzLiMzo
         CmyiSs+jHOLYCWmjgKUQFSb6jR7q2q3AMeqv3EWxiRs85BQ9sB2H1QsukQUdEVgnepR/
         BQe5XAsDPL9hjin0T5ujIQfkOdQiymx1SA9VhScVvWrQ22Boe7naQJSTOVrpCZOhBI5L
         gy8VcnGsAOPs+Q1KCvgS0vV44+YWVCcZCAirDn8uy3mXbxCxd66kCFmfy4O8O55nX5ei
         unmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5si3942345qtd.223.2018.03.23.03.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 03:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezJs2-0007PK-39
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 06:24:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ezJrm-0007M2-11
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ezJrl-0002If-5P
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:24:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34386 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ezJrl-0002IS-0G; Fri, 23 Mar 2018 06:24:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5174406E8A4;
	Fri, 23 Mar 2018 10:24:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6D682023231;
	Fri, 23 Mar 2018 10:24:06 +0000 (UTC)
To: qemu list <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>, 
	Eric Blake <eblake@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
Date: Fri, 23 Mar 2018 11:24:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 23 Mar 2018 10:24:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 23 Mar 2018 10:24:07 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] Regression on KVM qemu-system-aarch64 since "monitor:
 enable IO thread for (qmp & !mux) typed"
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KMMF39JtLZ9e

Hi,

I observe a regression on KVM accelerated qemu-system-aarch64:

Unexpected error in kvm_device_access() at
/home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
failed: Group 6 attr 0x000000000000c664: Device or resource busy
2018-03-23 10:00:00.085+0000: shutting down, reason=crashed

I did a bisect and it looks the commit that introduces the regression is

"
commit 3fd2457d18edf5736f713dfe1ada9c87a9badab1
Author: Peter Xu <peterx@redhat.com>
Date:   Fri Mar 9 17:00:03 2018 +0800

    monitor: enable IO thread for (qmp & !mux) typed

    Start to use dedicate IO thread for QMP monitors that are not using
    MUXed chardev.

    Reviewed-by: Fam Zheng <famz@redhat.com>
    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
    Signed-off-by: Peter Xu <peterx@redhat.com>
    Message-Id: <20180309090006.10018-21-peterx@redhat.com>
    Signed-off-by: Eric Blake <eblake@redhat.com>
"

If reverted on top of v2.12.0-rc0, the guest boots fine again. The link
is not obvious though.

Thanks

Eric
