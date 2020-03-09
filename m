Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1059698lfc;
        Mon, 9 Mar 2020 05:00:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv+spuf/m8URU2HW5+MroS7HrVjtY1gSjMIZepyXpoD8T4o/MDdqmY1VWvdEAgIT7fP4AGq
X-Received: by 2002:a9d:404b:: with SMTP id o11mr12059268oti.368.1583755254174;
        Mon, 09 Mar 2020 05:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583755254; cv=none;
        d=google.com; s=arc-20160816;
        b=OQ0pQMEQZsVtM8mI+b+81vRFNaFxsJAZON6g9QLIC8xQxao0o1gWbLr5tpydgLZ6u/
         j6yr+BF6HM2JhFMJciG9QLxvk1XkUC976hhH+pLRG/AYE+czukLXV7MJdi2vvPFDHaKD
         06KB+TnLhbdK4iynFu2SdthM5C25N/K+3TFyBc7Pb4cdQJuy3EAqsb84nWkbmxaiWbC8
         HgVGb5IWTLqDTZySUpAmik++7HFvgZCT8tQ6f2XW+FdIt05vLNM17u98I9WfMbedlM+h
         ud41mRYNCSnDOnP0aRetbdEqMGvE3TDXkredSmyHQuuFDyrpuFadhTlOJBBq2UVNqQke
         UVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Ae/HcGopL4IKgJ0MjwGidc1zloipall9ZQoSMymFcxU=;
        b=QZx6ZaVqLEJyRO4q9IJh5rxOLeQzwXjo3LKavcy5LNG/LTyCd6BBSX5p4TnjiIiTxs
         MaGUFbHfikiz4xyixSIuYR7eDZz7BNZxJoNQuNiXH9EVSnQ262BSGSC1MxjdN91KShiZ
         NOSG7rO8CIVSZYmwQNoPzwCDFW6WnrXQ3/ZPw0BBrMmyWfyyaNvHGkjCzgjyAiEmz8cA
         nZyj7FiWxT/4Y0e15sGfWiGgyzWB9/0wbE2aZrsgF98kypI52F6Hls5PNzOunoJlx98W
         yr8qURAWm6TSbA5WvT7NRueB7u5RzOPNj81zWEblu6GuLwOW8Pn5C8iV2aSGlrKm+PV8
         pjVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XoE6r0Jl;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w7si5649885otm.256.2020.03.09.05.00.53;
        Mon, 09 Mar 2020 05:00:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XoE6r0Jl;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgCIMAx (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 9 Mar 2020 08:00:53 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50246 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725942AbgCIMAw (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 9 Mar 2020 08:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583755251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ae/HcGopL4IKgJ0MjwGidc1zloipall9ZQoSMymFcxU=;
        b=XoE6r0JlpXYDExlSbQKev35V4BhH6B8iQTDdtfom/HSXE/i2Kpltd0OyMnUfFl1hsqtZpl
        2W++KUUkW3dV8R5JsHTtIO4Vd5Suj3aPNKO+hwNG1Pd1WG/isq829PgOuCOMppoQjzeIAy
        J0XYotihptwS7scT+bUr0pQDLh8AaSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-eg0LmcZMMIa2ACg13u3Rfw-1; Mon, 09 Mar 2020 08:00:49 -0400
X-MC-Unique: eg0LmcZMMIa2ACg13u3Rfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A62F0107BAFA;
        Mon,  9 Mar 2020 12:00:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F83A9353C;
        Mon,  9 Mar 2020 12:00:14 +0000 (UTC)
Date:   Mon, 9 Mar 2020 13:00:12 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        peter.maydell@linaro.org, andre.przywara@arm.com, thuth@redhat.com,
        yuzenghui@huawei.com, alexandru.elisei@arm.com
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add ITS tests
Message-ID: <20200309120012.xkgmlbvd5trm6ewk@kamzik.brq.redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309115741.6stx5tpkb6s6ejzh@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309115741.6stx5tpkb6s6ejzh@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: GGhe7VL+Qf43

On Mon, Mar 09, 2020 at 12:57:51PM +0100, Andrew Jones wrote:
> This looks pretty good to me. It just needs some resquashing cleanups.
> Does Andre plan to review? I've only been reviewing with respect to
> the framework, not ITS. If no other reviews are expected, then I'll
> queue the next version.

Oops, sorry Zenghui, I forgot to ask if you'll be reviewing again as
well.

Thanks,
drew
