Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp885960wrd;
        Wed, 19 Sep 2018 09:39:18 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbWZYUEfJNDqN1+J+0liV+wV7jZeOhF6iVPc/sUDYB4lfVmbDGN3/XFkYRtz3RnZMuhIKFZ
X-Received: by 2002:a63:b914:: with SMTP id z20-v6mr33254795pge.396.1537375157878;
        Wed, 19 Sep 2018 09:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537375157; cv=none;
        d=google.com; s=arc-20160816;
        b=YXTZ3NjfRivlshhkFNe1a+LZk6YMoxoNXBvYQESs7SWE6e5uU+8F9Qlc7AIPKBy2L9
         eakR2kZY5H3Vq2r+gZun4ArHDUXx1G9xVsq/D1/DqyyPCTVwKU+iLVOeXC7JFdjicpIp
         TpscT7T3V6hAQcV/FATwIanFmTCqZDlRt/iqnJSYb2mpRFXdP03TJxulCQcB1o1Y6bQ5
         yU6hiEx9SYjZIbVU6oktp6lOq3+yzAqcwWMzoa0tP6h1/9oJm1qaNujd3PA/OA2Lh7sW
         5+6NrRq+/+hF122npO8qOKu8h8HXa7LVF2Fla9zHG6XWQo033b1WnAWcjyswJiUkqm0p
         pcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :organization:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=4UhhdpjDOdgD0+y29KUNLx0HQxHJahl3H65UYICt2Ek=;
        b=h81UalJHYDOZM21FUKpwB3hv7GFSWimbUt9cw26C5BSsDhsk2hVMCuUVvY53edXj9D
         hkJYwNzzWnM5YOiZZImz0KT23hwskds1DHZ1aKJxchX8Yx4nWKDV7ArslfgSWGuJfWYv
         3AbE2pCCqno6mRuv4JWXKRtdvxZisRlJguXE9jJQ6mSh87Wz50rAOl8AAf589ArVksoe
         mI48uD3lgm4bGSN8C3k4i7vCkPo0YD5Ib+p0+cRo+82xMSuqlswPhhzsfV1HGI6jbmIp
         4TaInLIumTMjfSZymKgD3NNaG3X/hybY3DloRNoXGvV+kJSko4Cm4fOUGsk3z53FB1dd
         uK1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s9-v6si20113466pgk.384.2018.09.19.09.39.17;
        Wed, 19 Sep 2018 09:39:17 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbeISWR6 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Wed, 19 Sep 2018 18:17:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36950 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbeISWR6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 19 Sep 2018 18:17:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3AEDAC04C27D;
        Wed, 19 Sep 2018 16:39:15 +0000 (UTC)
Received: from gondolin (ovpn-117-44.ams2.redhat.com [10.36.117.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AB34487B6;
        Wed, 19 Sep 2018 16:39:02 +0000 (UTC)
Date:   Wed, 19 Sep 2018 18:38:59 +0200
From:   Cornelia Huck <cohuck@redhat.com>
To:     "Emilio G. Cota" <cota@braap.org>
Cc:     qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Alexander Graf <agraf@suse.de>,
        Anthony Green <green@moxielogic.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Chris Wulff <crwulff@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        David Hildenbrand <david@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>,
        James Hogan <jhogan@kernel.org>, kvm@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Marek Vasut <marex@denx.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Michael Walle <michael@walle.cc>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
        Richard Henderson <rth@twiddle.net>,
        Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 34/35] exec: push BQL down to cpu->do_interrupt
Message-ID: <20180919183859.54e6d21d.cohuck@redhat.com>
In-Reply-To: <20180917163103.6113-35-cota@braap.org>
References: <20180917163103.6113-1-cota@braap.org>
        <20180917163103.6113-35-cota@braap.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 19 Sep 2018 16:39:16 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: XqYgk9fcfn5o

On Mon, 17 Sep 2018 12:31:02 -0400
"Emilio G. Cota" <cota@braap.org> wrote:

> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> cpu->do_interrupt can now be called with BQL held (from
> cpu->cpu_exec_interrupt) or without (from cpu_handle_exception).
> 
> Only a few targets rely on global device state in cc->do_interrupt;
> add checks to those targets to acquire the BQL if not already held.
> 
> Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
> Cc: Alexander Graf <agraf@suse.de>
> Cc: Anthony Green <green@moxielogic.com>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: kvm@vger.kernel.org
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  accel/tcg/cpu-exec.c       |  2 --
>  target/arm/helper.c        | 28 ++++++++++++++++++++++++++--
>  target/ppc/excp_helper.c   |  8 +++++++-
>  target/s390x/excp_helper.c | 14 +++++++++++++-
>  target/sh4/helper.c        | 14 +++++++++++++-
>  target/xtensa/helper.c     | 16 ++++++++++++++--
>  6 files changed, 73 insertions(+), 9 deletions(-)

s390x parts:

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
