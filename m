Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp143219wrm;
        Fri, 4 Oct 2019 01:21:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJn0wWtmU8kBT9IO/A2qPXMSM6UKcr/h0IDmN6UjGZy+73ndquMUaRmAmLI4QYl4tH6VpE
X-Received: by 2002:a17:906:ecf6:: with SMTP id qt22mr11318867ejb.212.1570177262049;
        Fri, 04 Oct 2019 01:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570177262; cv=none;
        d=google.com; s=arc-20160816;
        b=Hs8PNcNzwIAdkY+DzIub5NlJXyEYHmMpIEHDBKe6S5Qfeow7SA5/C1FWR42UHj8c3w
         L6EHCeiUsOqv/cekK9OyokZgSy4zWzgJMfxgdSZGXLbcQYe7xUbDPL2XMoalqr1RDIeS
         Fg4pQ2RUCN8xvDTyI6wHn8tfv7vklHQlN/Paq06Yp1lnI9D3TripL4UuZJ+UYQ4tdez3
         J3o1JsSnkmRf3Ku8jEt2aTMRoLkkSZ8QBJMoMOnFk1jtpU+vfP+N197oqXpgOI0rDN+E
         sz8VKe5iDGhc7/VWI22VlOauH/2JaiDeqBwb/cw2SFTOlnAgN6I0D0OjS08Ed7ufe+bG
         rwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=01VOd8fd+d8v9ja533lR5IepkxlsZyymYJQ668MYIjw=;
        b=n6xEQlRFIOyor/2r9dTydUYSC7VCMAzX8WjQvh/CbqhJPw6fhIRX8vmD8nSeByFLcG
         WMR6MTVQir7omRoa/gTlX7N262o3WUTM33RdNQsPbgDdvOLSJO2zomsH8yIlbz5worJB
         Zmv+hFzZspegH7e7B+8VDxx5DAua/0AWlMMRW9GGGv/AeZGKPCMtcY/uVRGBE7DASLZ6
         iWhWDe5BXaDc3I7mN67uo/kcyFPpjREf/JvrMzB+bkASDsXS+wILnIwmw2l2vdaaTyht
         0Gq5G6DVkjJonnnDwZEnQFEz/HK6Ot6P0bDNvdIi9qYWbqO39DLRFvqlFXY5z7zyltnM
         MNFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v19si2480845eja.352.2019.10.04.01.21.01;
        Fri, 04 Oct 2019 01:21:02 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730484AbfJDIVA (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 4 Oct 2019 04:21:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48538 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730121AbfJDIVA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 4 Oct 2019 04:21:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C62E77FDC9;
        Fri,  4 Oct 2019 08:20:59 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E787E5D772;
        Fri,  4 Oct 2019 08:20:53 +0000 (UTC)
Date:   Fri, 4 Oct 2019 10:20:51 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <jonathan.cameron@huawei.com>,
        <xuwei5@huawei.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <linuxarm@huawei.com>, wanghaibin.wang@huawei.com
Subject: Re: [Qemu-devel] [PATCH v18 2/6] docs: APEI GHES generation and
 CPER record description
Message-ID: <20191004102051.4e45cbd2@redhat.com>
In-Reply-To: <20190906083152.25716-3-zhengxiang9@huawei.com>
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
        <20190906083152.25716-3-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 04 Oct 2019 08:21:00 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 3pSz1/VOFTZz

On Fri, 6 Sep 2019 16:31:48 +0800
Xiang Zheng <zhengxiang9@huawei.com> wrote:

> From: Dongjiu Geng <gengdongjiu@huawei.com>
> 
[...]
> +
> +(9) When QEMU gets SIGBUS from the kernel, QEMU formats the CPER right into
> +    guest memory, and then injects whatever interrupt (or assert whatever GPIO
s/whatever .../platform specific/

and add concrete impl info like:
  "in case of arm/virt machine it's ..."

> +    line) as a notification which is necessary for notifying the guest.
[...]
