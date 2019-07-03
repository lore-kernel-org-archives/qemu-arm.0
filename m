Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp354761wru;
        Tue, 2 Jul 2019 22:42:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHnHv/6XxvrigiI9H16OZwk3JX/0/JBEROCdHiqPo367Y20IEx3VHIZO+3yLFXmvMBdFLm
X-Received: by 2002:a50:8e9d:: with SMTP id w29mr31028457edw.103.1562132573582;
        Tue, 02 Jul 2019 22:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562132573; cv=none;
        d=google.com; s=arc-20160816;
        b=GuhImmWB7Q24322D8p8masJoio1Z98QrZjiGuH52IIzDNhSIUEinJZv9v4EJUfUlU6
         ANtMdzJSSDMyjc+lVAVLNyxnpe+spMFzPKa0YOyiAYHJjsJN0XtDSZ84+EArqRw017zA
         1+CdwqZca7Yr/7UKUMFbkqjCUWoc0ybNf0V6tnH+ApHrKQJzWoMGZS6FpR2YAbf8wXqz
         vBz3yV9k+z0u8hhJ9MO7JbOwULB9CvXcBHgpoBJdkSOjVQJpDyOnxCtSAmfu/wPgi4cJ
         OA/eg8MGs29MKSms6Z2k3yyRS/2whMUfYLvhkxREdBHMEunYs47ow+31IeoxnO8pcgg7
         XfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=vrJ3byCy4dnBfFYTaO6bG5FGsx6UR4gEVAE2uyGWr1E=;
        b=oziK3Zv3sbh3W5sa5CyDNjaQvTFcB6a1R9UhD9Oa3E/bu0iN0e+KyqTEp0k1eCNxGH
         84Po8Tr1L3IlDgxxo04EZKfEkC73f6pEH+IIOkxVw//TYiKFGOWdrxK5CSkD09gM6d+h
         HDA0QNZLEUdgzHZ+dnytMamxyhtSVVP8YpHeBJwlMUaWjv7tZmNlk/lN8y567zOQL106
         F1uPCdG25Ct9w/gTZatuK1AWMXuSkIVV8OnDVlswCETLy+p9NJh8OllSrYxJJlhiNHrd
         kc0LRG9hOdkgSj1Un4lFzAqR9E7ov80d8zoLpdnxpZSsVpMnaPE7f+z8+t5Ho+C5OOqy
         197Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si896331ejm.175.2019.07.02.22.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 22:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiY2e-0007Fi-NS
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 01:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40299)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hiY1e-0006v7-DH
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 01:41:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hiY1c-00085O-Ca
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 01:41:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35872)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>)
 id 1hiY1c-0007xh-5H; Wed, 03 Jul 2019 01:41:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 54D95308339E;
 Wed,  3 Jul 2019 05:41:41 +0000 (UTC)
Received: from xz-x1 (unknown [10.66.60.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB0727BE7A;
 Wed,  3 Jul 2019 05:41:34 +0000 (UTC)
Date: Wed, 3 Jul 2019 13:41:31 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190703054131.GE10408@xz-x1>
References: <20190701093034.18873-1-eric.auger@redhat.com>
 <20190701093034.18873-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190701093034.18873-2-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 03 Jul 2019 05:41:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 1/6] memory: Remove unused
 memory_region_iommu_replay_all()
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RoeePDi7QZs5

On Mon, Jul 01, 2019 at 11:30:29AM +0200, Eric Auger wrote:
> memory_region_iommu_replay_all is not used. Remove it.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu
