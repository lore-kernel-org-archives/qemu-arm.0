Received: by 10.223.159.74 with SMTP id f10csp119717wrg;
        Fri, 8 Dec 2017 17:08:51 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaFSwpzf+UvFq69tMeyTjlbD7w/6omV++lAf6slL3qCL3VWgbQgZtFpk6Bb+LtlX0PHEfnn
X-Received: by 10.37.37.146 with SMTP id l140mr11338137ybl.267.1512781731215;
        Fri, 08 Dec 2017 17:08:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512781731; cv=none;
        d=google.com; s=arc-20160816;
        b=XDz9R469OB+c9vuFKI+77213WXDXfDSbVdKHBlKkWKalT7rP/MhUWifqOp5hTmxAVq
         8hcynzIUcnRRVR9bhG/hbSf1lN25syd/8F73zWiWuhaISn1co4vDIVzqHc4WZFtf1MZt
         TKkQfUe5i0KB5oltYdod2V5zP1JcGuHzKgJEQmd1QxB0VMjXCj+Itoqse708Tv9JUA8Q
         n6NalOD2FQAR+Qs0KAPBeiHOH7jD07t3nmTIGu+rO+0cm96JT9sAFFK0byEpKAOkU/7C
         3+B6Kcudxkw4J9xKHMyUpvU+DcdXD7Xy1FQl4gOYRo/JQ9reO0TLGNsx0LDxrD1HiINk
         fY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=wxa7ot2Oj8ClgD29M1TFFxXRgiYA2xAzQtyfQIB79hA=;
        b=EP6xvyqV/iGjwb5jgWKJdXHmKLHZtAAn4a8C61uoxlddH1g7CwF2ahoDMSnlELJBqZ
         p53yUHDMZNuZFMGVM4mxZiiaZPrPrbFuzP8HBb6ImSPAzevUk2iYqXw4VeFeuSq+8dpH
         HVN5X8uzpD0vCviSGOiSLIHmzN1b4tYmloONg0SqbT/b5GCkmhwKtbpvXxDZ9hNXUZXI
         TsPB7d7yZJcRGaBxOToCZmE/InIIJeOpHGKZ+UDapCH3o2Kc82/eFXaQuRpvq4veakKD
         qOuXn1pkgVNZAXXySsZE0rFkmXgVfRGinz0jcTmWNAJmbNhEXs3Fpe6FvJGN9NhYD4MU
         jJkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185si1910533ywe.307.2017.12.08.17.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 17:08:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNTdK-0004yb-M5
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 20:08:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eNTd9-0004xk-K3
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 20:08:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eNTd5-0000NG-LO
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 20:08:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eNTd5-0000LF-FY; Fri, 08 Dec 2017 20:08:35 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD374C057F91;
	Sat,  9 Dec 2017 01:08:34 +0000 (UTC)
Received: from localhost (ovpn-116-24.gru2.redhat.com [10.97.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4722017CD5;
	Sat,  9 Dec 2017 01:08:34 +0000 (UTC)
Date: Fri, 8 Dec 2017 23:08:33 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171209010833.GK3037@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512670493-18114-2-git-send-email-peter.maydell@linaro.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sat, 09 Dec 2017 01:08:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/6] hw/arm/virt: Check that the CPU realize
 method succeeded
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHs98VE/slSg

On Thu, Dec 07, 2017 at 06:14:48PM +0000, Peter Maydell wrote:
> We were passing a NULL error pointer to the object_property_set_bool()
> call that realizes the CPU object. This meant that we wouldn't detect
> failure, and would plough blindly on to crash later trying to use a
> NULL CPU object pointer. Detect errors and fail instead.
> 
> In particular, this will be necessary to detect the user error
> of using "-cpu host" without "-enable-kvm" once we make the host
> CPU type be registered unconditionally rather than only in
> kvm_arch_init().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
