Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9370670wrv;
        Wed, 24 Jul 2019 06:50:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfnbUIOaXG2WxdAnF+zDDHDzNL8inQ2N5dufsADboS+uzjRRbGn8DJZ7fUY4AvxoOsjs1f
X-Received: by 2002:a05:6214:2b0:: with SMTP id m16mr4085330qvv.23.1563976229910;
        Wed, 24 Jul 2019 06:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563976229; cv=none;
        d=google.com; s=arc-20160816;
        b=lM2fixoQWWRQW7jtBNliTw/XROSUygm7uVWmgTf3YTDA0DvMePgkRJUCiK3O3Qkav2
         kS6pqQMzooBHkhM3OggfCUWBx5u/B4zkxm1UwsMwUksksLJCeoehhLz8zTCQ5Jt6bJ6P
         pL1Og/eUP+K8Uzvbeowg0h1N9umgljDrBT1nvrrL666SjKGWX58L/Nt+SJfaCIV7uIJd
         gu7nqLJnDvNhLKnYMzfjB6TnoRwzu8M8dHMxxm1UutVi9FN/iRtk8UkfXQ9lediZ7VNg
         NvPRffxaOQuqPRtX/W7PNbG0NSnpZvjGv6PA5amkgmLsQrN7GHfrrLJ0iRxRp0Logj7W
         6PMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=/Z8SQLV1HQuiPojhdFk2sAjpoKEVN3jQILD0Tx5Mjqk=;
        b=l85sYy/yoPHDVKqNXHhFUY7hmZaNZ7Z7EOYF/j90LqFGKBx/zaKw1JLPzb/EPEgJIy
         JG+29GuDN3g+E91kgJOyCx+7cr8Qmri3+XpwgPR22cE1YaMMcL0YWoby/2TiBSxVdTlv
         cM9Tpj+LKKPMzPbFxdkQJD/oRljwlq+eiHNmSIdE95ote/s8hTTgJZVV37QKvZ1ysKTQ
         JjGEEKigVtJbSftY7ne36/J5evWeE6+HH4sJgzYJwr+9J0Z+K6fLquNyl3anS6d8vwkK
         8DthLvvEO3duhGz+9XCmNyn1cnx7bGOfftoYwkWx6f7oEt8E0BBx8+UECad0tj4sY3Ac
         R1gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si33050520qve.84.2019.07.24.06.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2019 06:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqHf3-0001Lf-GC
	for alex.bennee@linaro.org; Wed, 24 Jul 2019 09:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hqHf0-0001LV-V6
 for qemu-arm@nongnu.org; Wed, 24 Jul 2019 09:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hqHew-0004Zh-Tj
 for qemu-arm@nongnu.org; Wed, 24 Jul 2019 09:50:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38390)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1hqHew-0004Yk-ER; Wed, 24 Jul 2019 09:50:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 987AA81DEB;
 Wed, 24 Jul 2019 13:50:20 +0000 (UTC)
Received: from localhost (ovpn-116-19.gru2.redhat.com [10.97.116.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91B7B5D9DE;
 Wed, 24 Jul 2019 13:50:19 +0000 (UTC)
Date: Wed, 24 Jul 2019 10:50:17 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190724135017.GK11469@habkost.net>
References: <20190724103524.20916-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724103524.20916-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 24 Jul 2019 13:50:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2] hw: add compat machines for 4.2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uspEEuytNhCp

On Wed, Jul 24, 2019 at 12:35:24PM +0200, Cornelia Huck wrote:
> Add 4.2 machine types for arm/i440fx/q35/s390x/spapr.
> 
> For i440fx and q35, unversioned cpu models are still translated
> to -v1, as 0788a56bd1ae ("i386: Make unversioned CPU models be
> aliases") states this should only transition to the latest cpu
> model version in 4.3 (or later).
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I plan to queue it for 4.2, but I think it's OK to queue this in
parallel through other trees if necessary (so patches that depend
on the new machine types can be queued too).

-- 
Eduardo
