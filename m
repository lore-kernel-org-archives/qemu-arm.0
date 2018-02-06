Received: by 10.28.71.27 with SMTP id u27csp4332285wma;
        Tue, 6 Feb 2018 14:26:23 -0800 (PST)
X-Google-Smtp-Source: AH8x227GKsRG1kOWgrzDjUWwTzQSUMXv0ITSnEd6WgIefvsbg99MYTZ8wh37dxSOXfIAjRxFh7AQ
X-Received: by 10.13.197.131 with SMTP id h125mr2583804ywd.151.1517955983849;
        Tue, 06 Feb 2018 14:26:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517955983; cv=none;
        d=google.com; s=arc-20160816;
        b=Nr1qZy7tySmygMYP7bl0U3Wnp1sm2Fd+d3cQxAqFkd5vKkcil2NlTSFiuZEviv+Sfw
         pvnUXVSWw6u07nQ/+TLqj44taT2GsLzMzutk3z70FgPVOPa89p8qiLsWKn3JBVj0D2H+
         CDk88VcMFlsoSPT6iMB8qYxmhWJUrWdWHmn3O7Dpe3VQ7uRiiuhFF1gHtRxzb7lM0N72
         URNfnhrIE7d9gH93/ihTOrWEuFsHQRsM1fDK9f8VQjxfYUTIqKCFH8QOk6XePmDANrf5
         MpjtV6lqL4WEK8G/nef5WI68wgEhiBR9SIeULefmJ4UkFQyelG0QtM5AU+Rslwxli3hD
         dI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=sAm0HywniApIUxt+Dj+kP8fB6w61ecOIpMsuFijzY1k=;
        b=j50ut0osoB3V+70v+FZhEge9EmKYFqcfVWfa4NrrPYqhRGB6uEO3DLKLCJYf3OcGdV
         8HSA0SN92NNm++Pzf91fUXbjWeu0d8GpAP8an4nm9uaYy2YPT8W4dkl3JNErNqmTQDfo
         y+LpULUTFOd543+Mj6Xsv8U1FI6jEQJ1AE6thV7ZqgxawSAYd2I9qVjSMVhJC6YfZK59
         TcrHvkuZYzVujvuVmzA88hppHCSB3um2wdYw2LVg/0uFHFeQ8UNJNxwBwDVN3cG/Vo9h
         ynI3th9b7zn97JrTu86IdcbEP49Qpo4cfaGx70GNO8DgKzyHU3ys3L5ypx8pi3tku6sm
         7qqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si3639ywe.704.2018.02.06.14.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 14:26:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejBh1-0005AB-9B
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 17:26:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBgr-00058q-7s
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:26:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBgo-0000YR-4F
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:26:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ejBgn-0000X5-Tn; Tue, 06 Feb 2018 17:26:10 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B87A8368E6;
	Tue,  6 Feb 2018 22:26:07 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D148B17D1E;
	Tue,  6 Feb 2018 22:26:01 +0000 (UTC)
Date: Tue, 6 Feb 2018 20:26:00 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180206222600.GF13301@localhost.localdomain>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-25-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516694904-64879-25-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 06 Feb 2018 22:26:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 24/25] cpu: get rid of unused
 cpu_init() defines
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
X-TUID: smBQ2aBIIsOY

On Tue, Jan 23, 2018 at 09:08:23AM +0100, Igor Mammedov wrote:
> cpu_init(cpu_model) were replaced by cpu_create(cpu_type) so
> no users are left, remove it.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
