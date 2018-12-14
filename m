Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1678754wrt;
        Thu, 13 Dec 2018 22:09:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XYWdQvU0CEiCYZIUa1B04H0DgsLrnWZkb8KglKELuq3T5GyMqPQ/AwK185ilChHFtv0h1J
X-Received: by 2002:a0c:d0a8:: with SMTP id z37mr1637154qvg.86.1544767753702;
        Thu, 13 Dec 2018 22:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544767753; cv=none;
        d=google.com; s=arc-20160816;
        b=NQmXBlnHtsUAQYOeFvgyTSpUk3WOg2ax/AxdfIYxbpILWD0MS9pPuNAxdrC43P3eIv
         3YohBAVblmLOa6h9frr6fmMZvEa1VT+km7VP7Hy0RUsMbvlqggtcbG6qtESwgr7CUwTJ
         TvXGmHuVfc4uQVmmLvf+GeWqziJR+CvnnM/xp+odvpGFlxX+18zDPy1mOKJrp7dPob5X
         ANcIlGruIfvX27rKXjLhuWLSufS8++u4yn34dBqtDjvzWtT4JFf277IBRkJ9nqk29z7W
         VEcYKdPz+MzgzsvIp8OEayOLXL7Td0DcaLaB1GGs1BAkqvKX9aN95/pkZEjI8r8MvYnJ
         OupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=wNrMn8+DzgcZS8P5VUAUh6LVGpqENfjSHRrg2HlfKt8=;
        b=MBW3Ubro7dzzwzOhpLIFqkcrHlZrQGSJ4CLezsWBsYOPkpXhchAixpapf5akVHNePO
         se4jPcUnjXM9qCq7u1JFx8OVsvn7UTKbW95/aPBn8dCsDv3/6dlCeQOt2N/Ug4EMu6J5
         GZfMBwDEayXTz3YKskotwjeMOkTGgBIfClUvohl6A+5gF5Q47YzzsVd/5kIN3SRVd56i
         dvYxK9COLGkD4Gd8D+43LgyN14mqKZfPEg2WbP8Ly+wnVg6lIkDAOZlpxCrLVFucaCJP
         IbAkulaAqdPzwHUfov0rl0tl9xOMfvIj/iO3884sXMaj4rmuRNi6PrNAXDAxQUPCgU6x
         0ABA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d32si2363005qtd.307.2018.12.13.22.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Dec 2018 22:09:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXgev-0007RE-5V
	for alex.bennee@linaro.org; Fri, 14 Dec 2018 01:09:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gXgeg-0007NS-EW
	for qemu-arm@nongnu.org; Fri, 14 Dec 2018 01:08:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gXged-0004DX-Am
	for qemu-arm@nongnu.org; Fri, 14 Dec 2018 01:08:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gXged-0004DM-4v; Fri, 14 Dec 2018 01:08:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F6117F6A7;
	Fri, 14 Dec 2018 06:08:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DEAA26577;
	Fri, 14 Dec 2018 06:08:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C646A113860E; Fri, 14 Dec 2018 07:08:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20181213223737.11793-1-pbonzini@redhat.com>
	<20181213223737.11793-2-pbonzini@redhat.com>
Date: Fri, 14 Dec 2018 07:08:49 +0100
In-Reply-To: <20181213223737.11793-2-pbonzini@redhat.com> (Paolo Bonzini's
	message of "Thu, 13 Dec 2018 23:37:36 +0100")
Message-ID: <87bm5ofxn2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 14 Dec 2018 06:08:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] remove space-tab sequences
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
	Eduardo Habkost <ehabkost@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
	"open list:ARM target" <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j7pW4fM408I5

Paolo Bonzini <pbonzini@redhat.com> writes:

> There are not many, and they are all simple mistakes that ended up
> being committed.  Remove them.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

The cover letter states "I am not touching space-tab in the middle of
the line, many of which are in #define lines."  I think the actual
commit should, too.
