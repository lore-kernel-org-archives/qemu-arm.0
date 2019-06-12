Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5123480wrg;
        Tue, 11 Jun 2019 21:39:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySmgS4/34T1mG/pI3PUsRaghNtr+P8PjCB1/rSgpmIGxBWQ7yaBTJP5jFwfYMKjw+/2m0J
X-Received: by 2002:a05:620a:12a2:: with SMTP id x2mr37023570qki.133.1560314349717;
        Tue, 11 Jun 2019 21:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560314349; cv=none;
        d=google.com; s=arc-20160816;
        b=O6lhR9zkkZe/cyptUamALI+9BMz2uY/DcWWK6ckrLIlsVgGuethBjiGgrfUtvIdUtZ
         w1sDa5FaRXjP/Vr9gbTQb0Flvz7sasy8zTXdZiVtgVjWSknO4H8RJZ0xM1ZOPizDAE7Z
         kPfWau/L6Xu0e7lDCPMQSVpdoVy2iTufTHBUMZNzPOehgt9A1/ytb7h3q5Y+QwKfNJPX
         g7ClHIPX7wDIrCrkxgKuQvy591cD9JUD62Wx8iBSc23MiVU0C05iIw56vZ6HHUIYFhd4
         g09MIyUwwo2xR14ng0dujNcrBy7MaUc8qQmEBcFPRXrFbGq+eFls2xUUCSuBOk2sniim
         mK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=+pPvvUFIDgPSj25DDv4Qsc/Rdxk/V/FgpIaG0BE2ovA=;
        b=pUao4HI7MRRD6YgrUqjL9isLYE06WgpHMvZ5eJjzdXeRaeCphyo3N2qwZtZSRBVe7q
         YB0m39kaBb5I5rbvfCj9JtT2eo4McvZGb0Yh7M9fqu6q/pY3AMBXuve5IYoINegUtRdY
         dMb5KMB0VK3jU6HiDb2T/trtwCHhT7XCsh7imQPU6RMosbF06yn+6xR6uvr+MQkBPdih
         Vifqryfq6DPxbvKtD1OkK10s/8LwNl7EYYvp4OBcCS5uW5VSBhVQZCvKET4JTTw1q+iJ
         WOn8sSidxnCJt0w4tRpC/ehbFTWYCRoqctQTzbTznsXr4a57p8tDq1VJXkdhLxXZqH6/
         a9eA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y128si9293295qke.91.2019.06.11.21.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 21:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hav2T-0003r0-7M
	for alex.bennee@linaro.org; Wed, 12 Jun 2019 00:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hav29-0003qm-5F
 for qemu-arm@nongnu.org; Wed, 12 Jun 2019 00:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hav28-0005Q9-9y
 for qemu-arm@nongnu.org; Wed, 12 Jun 2019 00:38:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hav28-0005PY-3a; Wed, 12 Jun 2019 00:38:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFF3D3091740;
 Wed, 12 Jun 2019 04:38:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 365A060BF1;
 Wed, 12 Jun 2019 04:38:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B2FCD1138648; Wed, 12 Jun 2019 06:38:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eddie James <eajames@linux.ibm.com>
References: <1560286476-23494-1-git-send-email-eajames@linux.ibm.com>
Date: Wed, 12 Jun 2019 06:38:25 +0200
In-Reply-To: <1560286476-23494-1-git-send-email-eajames@linux.ibm.com> (Eddie
 James's message of "Tue, 11 Jun 2019 15:54:36 -0500")
Message-ID: <87tvcvv2ny.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 12 Jun 2019 04:38:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw: misc: Add Aspeed XDMA
 device
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: smq6wUWEAets

Nitpicking your subject: "hw/misc:" like the directory, please.  You
could even use the file, like "hw/misc/aspeed_xdma: New device".
