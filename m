Received: by 10.28.71.155 with SMTP id m27csp173367wmi;
        Mon, 26 Mar 2018 20:11:08 -0700 (PDT)
X-Google-Smtp-Source: AG47ELszt2JY8f+3iMyZ7eO2vLz2g+UV2Lwn19FqiQwuTiFoA9fk3YZnfKKlFlMA5W50drtXoGCy
X-Received: by 10.129.55.135 with SMTP id e129mr13781339ywa.306.1522120268807;
        Mon, 26 Mar 2018 20:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522120268; cv=none;
        d=google.com; s=arc-20160816;
        b=ErBxKMWR91OABcQeL9dUN7QQzMDwKCHllzysp03m+0Fg580BfBJY9Hr5ekLmxOSQR8
         dD7q14oJ8HmKDZbmmZnwqXtup6ec7R9/WaYwqjxd2CI4F9EVBETFp+JzfoXNMGyb5o2Q
         gEz+4edIl7tRL//JCRnaLtVNgBn6/B5N0kEG2Lrcr+Kg0J9Amwqit4LHwoXTaRQM/7Rw
         eiKy9Y2rD6paMyg7R6rv7VcTWt0sCPuBHFylxdvIa+Rq8DR5u0bApsQUjk+VRO10nb47
         vJs0g+mOYjTt4QztRkVFt3hEqYtV+Nht6rBjcC0dtYn9O8d41fZ9nhmj8D2/iTIMsldX
         swWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=T5i4IzVbXEYbm2qGY7o4wCClkT6YaYLTBr/6WDqQivs=;
        b=Z9mAVpdbi8EgWUrP6n9Y+pMQ032KPng5bQHegCg44fKwl+POnzzXfX3gYh5VM7vSar
         GxLnjvF1pVTyqf2sU2cwOdoQMJ8DQIR3b83ydmJz/G/rP9qWeZosr0/MytcaW3fHqPFE
         uTLy1x4olsZVdgrzmn4ReajjRDAtcJ8crVGCahlpvb8iaBbcYqaF284FXREK+DM9GtQx
         eATLENoUg3Ue7zX+qhRbWKjWr4cfiSwWpX1uDsZ42bk0blank67fS0y0hLdm8pjwKl5W
         v2AB+jmRYNT4rUwRhLmVNvrv9STwpKT7ycWnXW4UkwBuO7RsiRuCPt+l8uYM8UfI7+jT
         RcwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i76si317716qkh.374.2018.03.26.20.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Mar 2018 20:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0f0s-00012e-8q
	for alex.bennee@linaro.org; Mon, 26 Mar 2018 23:11:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1f0f0g-00012P-Tu
	for qemu-arm@nongnu.org; Mon, 26 Mar 2018 23:10:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1f0f0d-00078G-Oh
	for qemu-arm@nongnu.org; Mon, 26 Mar 2018 23:10:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38806 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1f0f0d-00077m-Jv; Mon, 26 Mar 2018 23:10:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E83CC401DE71;
	Tue, 27 Mar 2018 03:10:45 +0000 (UTC)
Received: from localhost (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 808DB219AAC2;
	Tue, 27 Mar 2018 03:10:40 +0000 (UTC)
Date: Tue, 27 Mar 2018 11:10:37 +0800
From: Fam Zheng <famz@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20180327031037.GI31422@lemon.usersys.redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
	<20180323143202.28879-5-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180323143202.28879-5-lvivier@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Mar 2018 03:10:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Mar 2018 03:10:46 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'famz@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 4/5] qdict: remove useless cast
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nj8Iyyuh53rs

On Fri, 03/23 15:32, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/qobject.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

This time for the right revision of the patch:

Acked-by: Fam Zheng <famz@redhat.com>
