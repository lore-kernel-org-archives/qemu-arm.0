Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp5809640lfc;
        Wed, 27 Nov 2019 00:12:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqzE1z98ta0jHbJAyE02ng9pWpfT+NUv29lvCWZlV8WSnwwqLMVySgA0aNm8sC853fDcx0ef
X-Received: by 2002:a17:906:7e04:: with SMTP id e4mr28939712ejr.113.1574842372850;
        Wed, 27 Nov 2019 00:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574842372; cv=none;
        d=google.com; s=arc-20160816;
        b=CwTrqsgpj6CiCLapG56Ymej9vism968J1nxNPAZS6en7M0MAFUYAe0Ma6GdVQL1dWx
         MEiR6nJ7vZ5d9Z1Heh7KIzbciQXw7gs7BViZhdBay6lD7z4CSLOa/s3HHERPvrcqUfMO
         lmHvZJ1JEnlwYQGczGV5WEb2ZG3OCSv2SyKbOzA9zjHCV5+OGAUV+OFIreMmu/4H8J3R
         BzJav7OlDVoLFYoma4TRVb//LlmFkIzv0SZGAj9U0LuO3OYU8ocw/FyR3Pn6SqX56IgB
         9Cuj3BKen4X76XolaX1TyN68GwX11349zgreio06b5g9ZQD50pv3QJlnPbCQReM/S3xf
         wcYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4GO5cDJE1Bxb5yiz/pxJvWOQ/f85zWGdpqW4AA0SXEI=;
        b=zghfF+nLq+aqT7/vZhzfYBhFl3bVOVIXz87hx/yJ96TloiKGoiyyOzXLlAUQfYc1Y3
         3LqUQNC9Z/5A8jeuwKYmaKZlhPKMp1Zr5UV3t+0dkCf5tSED2CowQlGpScPjJ6ia+m3n
         f85Iv1j79W6JCFn2H7d5FT5IvhgHhe9OS3a1Rz2T7t+xsohK3vn1W580NLcr63BoyaVj
         GXH1IkR7FuyFPOnYdv/CvwLGUvkBp52LGCXqWin55xItrTkwbteiTflhp4eOYEAbTmbP
         ezudDVZFqwyV9F3HSNPR8nLs2trsK40wVJWCH7ll6JZbyM34iL4JER1LjNxGIkcGxzgS
         Vcaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YY5cs0wg;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x11si2863348edr.335.2019.11.27.00.12.52;
        Wed, 27 Nov 2019 00:12:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YY5cs0wg;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfK0IMu (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 27 Nov 2019 03:12:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43876 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726125AbfK0IMu (ORCPT
        <rfc822;kvm@vger.kernel.org>); Wed, 27 Nov 2019 03:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574842368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4GO5cDJE1Bxb5yiz/pxJvWOQ/f85zWGdpqW4AA0SXEI=;
        b=YY5cs0wgAXXuK8L2ppnnZr2pQz4c9LQXd5Zs+F/6Od+ktK9x0JfjeJB2zG0WLNe1nYdI63
        MXfo6A/JgXfr9CF854f63oXJWzLoc9Gw8USwxqMj29tAJM7bL6wv0C6vs/DBCqjKL6x78e
        T6ev21xqZVvJO8JfWzUQwk7XPJJGKt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-_0e5tcQZNBa4qCcYFu_HSA-1; Wed, 27 Nov 2019 03:12:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 325C1800D54;
        Wed, 27 Nov 2019 08:12:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F1E5119C69;
        Wed, 27 Nov 2019 08:12:38 +0000 (UTC)
Date:   Wed, 27 Nov 2019 09:12:37 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <jonathan.cameron@huawei.com>,
        <xuwei5@huawei.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <linuxarm@huawei.com>, <wanghaibin.wang@huawei.com>
Subject: Re: [RESEND PATCH v21 2/6] docs: APEI GHES generation and CPER
 record description
Message-ID: <20191127091237.7bd64bbf@redhat.com>
In-Reply-To: <05d2ba81-501f-bd7e-8da4-73e413169688@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
        <20191111014048.21296-3-zhengxiang9@huawei.com>
        <20191115104458.200a6231@redhat.com>
        <05d2ba81-501f-bd7e-8da4-73e413169688@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: _0e5tcQZNBa4qCcYFu_HSA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: eVu+0oDxyqa6

On Wed, 27 Nov 2019 09:37:57 +0800
Xiang Zheng <zhengxiang9@huawei.com> wrote:

> Hi Igor,
> 
> Thanks for your review!
> Since the series of patches are going to be merged, we will address your comments by follow up patches.

Yes, I know it's quite frustrating to respin series multiple times,
but on the other hand it's more frustrating later on when reader
tries to figure out mess caused by a bunch of fixups in commit
history.

With amount of issues spotted during review, which also requires
rewriting some patches. I don't see big vXX as a valid reason
to merge without other compelling reason, especially at
the beginning of merge window.
(it might be fine right before soft-freeze if issues are minor
but is not the case here)

If I were you, I'd just respin v22 with comments addressed.
(from my side I can promise to review it shortly after that,
while I still remember how it works)

[...]
