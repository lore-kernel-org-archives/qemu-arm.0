Received: by 10.28.71.27 with SMTP id u27csp4328917wma;
        Tue, 6 Feb 2018 14:21:46 -0800 (PST)
X-Google-Smtp-Source: AH8x227CXpqu8gF/hArAUzuWh0SSU/wPxPmsCDzm+xnqIXsqAtOYgkxu01aN+fQD6ed3Gd64HO7i
X-Received: by 10.37.229.67 with SMTP id c64mr2565863ybh.131.1517955706740;
        Tue, 06 Feb 2018 14:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517955706; cv=none;
        d=google.com; s=arc-20160816;
        b=sjEYpMgkODtQNfmwP4K0Yi65SIAr+ItMji6QyNtUE4GAhtozPwSvW9lt3QFlHamjS+
         RumGu3/pX3CCVoVXsw2cOdjycMDmGGu0bwWuOLR5pD0uFYqDpSxDsHr36cesuZ22KbLW
         fh2xurMur66h3ICq0XTYUBjKXDVeY6NbHcqINHJSkejfZAtPIl//I4ZbJkbT4Yu3TWMd
         u2r606swXE+gfE8rIMkOR2uPCrcDQbTRaw77bkycDPkmPxyEpOIy+L7SEMKdIGQDBfjY
         48T30XWxrUK8GH5+FvISHkJuZrsR3x6bfOJLdkhZsBpz/xhHZiHiINKwJtbJvSa0KD/T
         7tDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=clsykJk0WyXdSTMLkMck7qtfNdpy9MV1p4rfjzUcYd8=;
        b=sHLJJO2TGwKLVpIGGwzznIFOYENxY3/UdafMs0mvTK0a0vMgFQNZEyn/nHeKbbI2lD
         9lFOpSdeBqswVrkAXXSPGKv8KQjJwccLc6rqEKPmNu44a8paC4ofNYDzaihW5kdzOU/R
         ysinD9luMDmt5Fgj0reacZxbxpF/id66MydLj7/FOljYE7pkeDjTY2ka3H9lHz6j+/pW
         BP0d0ZSzdesf+QqMEYj4rlsTFGpH1fQG84x+Y1pJR4NXyIYaTf0effLS/wOLVecCLHRX
         I8CzL4Z4dInZ5njuHhI2AqOEegyyoNkmXiOuaZu3w5O27jMNT22Hdjtz6r6xLg2hZ2f7
         0MJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y198si6584ywg.185.2018.02.06.14.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 14:21:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejBcY-0001fk-6m
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 17:21:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBcP-0001f5-6P
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:21:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBcK-0003lC-8V
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:21:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51436)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ejBcK-0003ko-12; Tue, 06 Feb 2018 17:21:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 090CA7853D;
	Tue,  6 Feb 2018 22:21:31 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC9917AFE;
	Tue,  6 Feb 2018 22:21:30 +0000 (UTC)
Date: Tue, 6 Feb 2018 20:21:29 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180206222129.GD13301@localhost.localdomain>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-3-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516694904-64879-3-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 06 Feb 2018 22:21:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 02/25] tests: add machine
 'none' with -cpu test
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l6gwivDHxwsI

On Tue, Jan 23, 2018 at 09:08:01AM +0100, Igor Mammedov wrote:
> Check that "$QEMU -M none -cpu FOO" starts QEMU without error
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
[...]
> +struct arch2cpu {
> +    const char *arch;
> +    const char *cpu_model;
> +};
> +
> +static struct arch2cpu cpus_map[] = {
> +    /* tested targets list */
> +};

Why are we testing only a single CPU model on each target (and
requiring one entry for each architecture in this table), instead
of just running query-cpu-definitions and testing all CPU models?

-- 
Eduardo
