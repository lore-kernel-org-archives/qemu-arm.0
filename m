Received: by 10.28.4.212 with SMTP id 203csp388075wme;
        Thu, 26 Apr 2018 23:07:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoaSxavIZw7nh7BAumB1fi2ZzTolxgDQJ9kJc+L4TsbmsXVcicq5k+qvnJlwaQr8eG3lWwT
X-Received: by 2002:ac8:2e8d:: with SMTP id h13-v6mr836268qta.39.1524809232135;
        Thu, 26 Apr 2018 23:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524809232; cv=none;
        d=google.com; s=arc-20160816;
        b=tFFr0uSfpRdhuT9LW36GI+oVE+PJS/Tmno3bhJvQTXtP0PROhi/m7tvna+/c4wk+Ax
         GWtWkgFJeM0d4e2OP4EDVyEmhcUbUzgyRwDlVV19LqzNJwQOqF1eG3LomF58ba9CGvXv
         JScwICYueAmy0YFbCyBy3i3fvmm+67LU/peqUEZAZlVWYry70mp1rhSv+ST0tPpTWmT+
         WEf3SjqdjgV5h3S4qMa5yoeI5OwDR7vL9ELFXD69DHE9wN2um/W9sjjQYCrufNSC7xoN
         aKeHgEuItHpbsXNEASKbedjOTJDY4S4bKoHec72vPlFDpky/floJHNg1P5pOx66Ilm4U
         op4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=U4LbjWM/piNWgRv8+M/HaInk0dVpSN7BVcQz4QJ+g/k=;
        b=irdnbPYcZb2DPAceWZawORv40P/0HR+UORhBhLojWDOMzmJSi3LRVPAL9Z97m6VC0i
         HpMZzEci2WLuxiuExURRWMZD/ar5cd8s4NbHZenXTqqUDWlkooaQyRFo0FHlyNcbRJtk
         shvqIa4/p38VATRgtuBydFXFzSClKAYBj4EJNheMA4LWb7hjKmt0TiOxy3KPChmULk+M
         5VxxMG3Sk6JtpLHZ2AOvLiaPVqe9P9z+/KNInGXLEALj86GLcAYWECOwcs4PY7unCqQJ
         ROf/XWUdhY8R5dJyg6seXIFgnFuRdMlfrxl+P0hFPALLV5OJGbEDEdj8Q4+Z4URBFLOh
         bi7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j23-v6si696536qtj.47.2018.04.26.23.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 23:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBwXH-0002ym-MG
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 02:07:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBwX7-0002yh-Mw
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:07:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBwX4-0003Vz-Hn
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:07:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38880 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBwX4-0003V1-Cv; Fri, 27 Apr 2018 02:06:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87B9A81A88D5;
	Fri, 27 Apr 2018 06:06:54 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0711EAB3F2;
	Fri, 27 Apr 2018 06:06:49 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <099d2af4-8fe3-f80c-693f-495accb26a17@redhat.com>
Date: Fri, 27 Apr 2018 08:06:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <877eou2nek.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 27 Apr 2018 06:06:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 27 Apr 2018 06:06:54 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [Qemu-devel] qom-test (was: [RFC PATCH]
 tests/device-introspect: Test devices with all machines,
 not only with "none")
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gLAh4twpVyBB

On 26.04.2018 13:54, Markus Armbruster wrote:
[...]
> Actually, a worse offender in the "waste everybody's time via redunancy"
> department could be qom-test.

Shall we change qom-test to also only test with the "none" machine in
the normal "make check" mode and only do the full test with all machines
in "make check SPEED=slow" ?

 Thomas
