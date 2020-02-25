Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1919262lfg;
        Tue, 25 Feb 2020 08:59:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIsz8Qdy1NqP3bYxSueL6ELSBz+e1oVVoX/XbG0B1/zOmDkiiLlcauRVvwo6BdkGKXGp/Y
X-Received: by 2002:a9d:5e8b:: with SMTP id f11mr32551710otl.110.1582649971391;
        Tue, 25 Feb 2020 08:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582649971; cv=none;
        d=google.com; s=arc-20160816;
        b=AmKMFp64mJNIbrdJ3BOyFJe/TtaPykXimG0rLGAAkToRTPR03uHNEe0kkBzNsP6f8M
         rXQL2lZcK/r0BTzIQ1tqBMLiZ3aIFs5nLPSZyvdlZ6wiVrz3JrvMWTfAUp1uC8ooMddv
         mgaLPxwPHApXN1Jhe0dxBRyQKXwlC/zoDZLRJb78eW9XTz0dAvgGLTsIQiYaevFMzFyj
         hGp6Wf1Weze9FvXM/AeZ0df5Hwoz94BvTA4a6Ze7W0fWBqyAvtteNFAFbEJMpExAWwYD
         yySG1yCRCK/nkE99YtilMrf6sNAw2mvxircFMXi3vbQWsh1ANoS9ciTyviic8RB/b0Tr
         mGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=TjwoM0/StVfrn5wh2Yyffw44qkAt+KuH9t4IFN7loIA=;
        b=kV/CTJ+OeJvsvIcFeoBSTfhh00l6N4WU8xzwB5i6MP9Y2f7xzEKrjTFo0H6X0REKX5
         26YVpKt+mrNP3cdNRpsUlFhaNj7DbxvT7T5eTmFda5Zn6rptmE8xj9NHwPVh5oXO6n8X
         NVBtuCdForrLBCSYbyLTq9ikROjJJcguczwEH/be+DID50h+3Dd6TpbwNrT21X2+8VJ4
         IE27Ko2AF6dmWXdUwgfcALue8jz+mbzWlDyI3nMJZA8JWjB8IaiHvgGwdPFSEhCAZOnR
         sdHvNQAUXqHg3xkdYOvFdfrQOwR1GA8PMAvTrC1s9D8iEcr7hERPvOPDRPMkkKEGykBF
         e9yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJLhK4Pc;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id e9si8479071otk.318.2020.02.25.08.59.31;
        Tue, 25 Feb 2020 08:59:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJLhK4Pc;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbgBYQ7a (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 25 Feb 2020 11:59:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39716 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728051AbgBYQ7a (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 25 Feb 2020 11:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582649969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TjwoM0/StVfrn5wh2Yyffw44qkAt+KuH9t4IFN7loIA=;
        b=LJLhK4Pc7nTo4TFcYmZN3bMMOEwHlccghJMOfjxbX8myvrdvBJBuYJ+kNbG2Zd5q38SE9I
        0lA0QW63xIl4EU5KjaaZ99LwVQY3BGzUfLFTnIV7ix8ba6qCT0dv0KTkdPZgv920upVC8A
        +ABq9dpEIx43qzCtui/CjUDXgzWeHSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-gdSoGWxPPvK1FVQkeAeWDQ-1; Tue, 25 Feb 2020 11:59:27 -0500
X-MC-Unique: gdSoGWxPPvK1FVQkeAeWDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A9751005F72;
        Tue, 25 Feb 2020 16:59:25 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8651590F5F;
        Tue, 25 Feb 2020 16:59:19 +0000 (UTC)
Date:   Tue, 25 Feb 2020 17:59:18 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Fam Zheng <fam@euphon.net>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        "Shameerali Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        "Richard Henderson" <rth@twiddle.net>
Subject: Re: [PATCH v24 00/10] Add ARMv8 RAS virtualization support in QEMU
Message-ID: <20200225175918.5a81506f@redhat.com>
In-Reply-To: <acd194e5-81d8-afa7-fb6d-6b7d744b5d81@huawei.com>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
        <CAFEAcA9xd8fHiigZFFM7Symh0Mkm-jQ_aGJ7ifRCrXZvFY4DqQ@mail.gmail.com>
        <acd194e5-81d8-afa7-fb6d-6b7d744b5d81@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: +V6zE7ektIQY

On Mon, 24 Feb 2020 16:37:44 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> On 2020/2/21 22:09, Peter Maydell wrote:
> > On Mon, 17 Feb 2020 at 13:10, Dongjiu Geng <gengdongjiu@huawei.com> wrote:  
> >>
> >> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA) and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed information of guest, so it is expected that guest can do the recovery.
> >> For example, if an exception happens in a guest user-space application, host does
> >> not know which application encounters errors, only guest knows it.
> >>
> >> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
> >> After user space gets the notification, it will record the CPER into guest GHES
> >> buffer and inject an exception or IRQ to guest.
> >>
> >> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
> >> treat it as a synchronous exception, and notify guest with ARMv8 SEA
> >> notification type after recording CPER into guest.  
> > 
> > Hi; I have reviewed the remaining arm bit of this series (patch 9),
> > and made some comments on patch 1. Still to be reviewed are
> > patches 4, 5, 6, 8: I'm going to assume that Michael or Igor
> > will look at those.  
> 
> Thanks very much for Peter's review.
> Michael/Igor, hope you can review patches 4, 5, 6, 8, thank you very much in advance.

done

> > 
> > thanks
> > -- PMM
> > 
> > .
> >   
> 
