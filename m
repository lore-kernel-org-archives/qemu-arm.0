Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1066673wrq;
        Fri, 15 Jun 2018 09:47:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKNf/IDIpMK18/rWbmZlHZdaZS8nM3sBW5bN87oi4chZVTzHl3FfDIeMrXkbA8Pos+MTksr
X-Received: by 2002:a37:654c:: with SMTP id z73-v6mr2002038qkb.289.1529081264387;
        Fri, 15 Jun 2018 09:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529081264; cv=none;
        d=google.com; s=arc-20160816;
        b=m255FEsVnjMX1TCWVArhKRz+HilOmmBjU9bKRQ0izLOAFJN/EyPrnuqbUcHGNu25nO
         dZ+TT1noF87iNPpXdKveTVwDzjUFNc1Q7rM0oMxHptga6LI64TjhHQSiWlfzq4vc0CEY
         0+T/a3G12VzOW+6XfPD6lsW9Q6dpU0nfl6Gw4055lYFY+RwXHJHaPbmLvajeBVa/oMx1
         ifsAxhOmeT7ALnKQf0sOTuGEJ64CX036xmiolJFBUYSURkCLbzcmfjL4ZX8FQayR+uv3
         UkesnijUTTr9T8ZVdt4ST+Kh+lwI7QOOILNqleHJQdrUhyOdmQMrAtkSX3C5N5FE8P4M
         TfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=RiYEtHuFQQ7IuFvWIwrv8JP/X94bwhOpx/ycGrydsHg=;
        b=oprBmUAanYJt9ZqNYGxnoakCZDzC6y4yCmQpByLBtqfqsaUBSiitFLt0qmAXp5NToI
         fgethHHtsV0ltxciqSNdohsd5LQXSTKpK0o/KFhqKfcaxatJB0JsRaN0eB2UgsxIYYK2
         l4A6Ho1hAXKZgUmBxLB9J7o9iwwSsu4p26GCJAudAe+nDnZuOeZzQ6WEyHh+EPt5ltKD
         jbU0pY/olLRqpZ4UsQXNi8AbzVJBwK1zYZ3qA6R24xt7K0BjH1Se45gqP1WXK9s2a85U
         xxtcXcIu8+YHD9qlnzPLKNcosN4ZvYRZrrAFIDAr6dtc/csd6o1i2NqP1icg50ZfHccu
         hJMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3-v6si5420147qkd.118.2018.06.15.09.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 09:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48219 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTrt1-0004dm-Pg
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 12:47:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTrM5-0001Uj-FD
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 12:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTrM4-0002C2-K0
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 12:13:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59154 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTrLy-000262-H4; Fri, 15 Jun 2018 12:13:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA01887A83;
	Fri, 15 Jun 2018 16:13:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C536723176;
	Fri, 15 Jun 2018 16:13:29 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-7-shameerali.kolothum.thodi@huawei.com>
	<bd67ed40-81d6-58dc-ccaf-efd8a40ca96f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8386F6E04@FRAEML521-MBX.china.huawei.com>
	<20180615154441.4rr5mtcnran5cf3s@kamzik.brq.redhat.com>
	<CAFEAcA-nG4Xv=PmxzW3tzs-TStziMDHMFxYi6_teSe1GhLH=hw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <333cd485-dc75-d295-16fd-98a1108e1e15@redhat.com>
Date: Fri, 15 Jun 2018 18:13:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-nG4Xv=PmxzW3tzs-TStziMDHMFxYi6_teSe1GhLH=hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 15 Jun 2018 16:13:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 15 Jun 2018 16:13:33 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [RFC v2 6/6] hw/arm: Populate non-contiguous
 memory regions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhaoshenglong <zhaoshenglong@huawei.com>, Linuxarm <linuxarm@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YC0t6yOZEUVY

Hi,

On 06/15/2018 05:54 PM, Peter Maydell wrote:
> Why should the VM ever care about where the address regions in the
> host happen to be when it comes to where it's putting its RAM
> in the VM's address layout? I feel like I'm missing something here...
> 
> thanks

The VM cannot use RAM GPA that matches assigned device reserved IOVA
regions. When you assign a device, the whole VM RAM is mapped in the
physical IOMMU and IOVA corresponds to GPA. but sometimes some IOVA
cannot be used due to the host specificities and especially iommu
peculiarities. Some IOVAs may be simply "bypassed" by the iommu, like on
x86 and also with some ARM SMMU integration. In such a case the DMA
accesses have no chance to reach the guest RAM as expected. Hope it
clarifies.

Thanks

Eric
