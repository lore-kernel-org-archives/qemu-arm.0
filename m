Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp137002lfg;
        Thu, 18 Mar 2021 01:11:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTUoKIFoxq9zV+9gfxLjkupJyvI5wKhhVl3PXhpBOZP6YtMjmupXsqSLcRz0lXHZgicgAy
X-Received: by 2002:a25:21c6:: with SMTP id h189mr10022982ybh.308.1616055100206;
        Thu, 18 Mar 2021 01:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616055100; cv=none;
        d=google.com; s=arc-20160816;
        b=efwSbgklKC1DA2V6zn+4ddsZHP07NWeanJTxh4SoWeCZaMRSKYPccpKOx+XuYi/4ls
         oA68JL76fyH+AkNGqLldNU3u9kN2jB4Du0BF7dFHSzNTgR4U6ZjNRpaerwFNVfq38zp4
         9yZwz8ibZuGC883Nhg0sUQ+3kY9o1jvsAA8bf9rAe7jZzOaG0lCgAY1CJThXC644AUeT
         xvRpSfUms0p4NIYkcXKV0PTqtCqClP+A1WeM/eYN77dfJrxEqFdBeZQ5gIlxREwYhNFD
         YiFqRHZcprOIXs0GO2wAQ7e2mVwXqrUOcbR1m885qlAiP3HIxlsBfq5tZtYlizcfVCIY
         68wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NbkmUpCHt0hSsNWVi6Gqkg6gp4W267zZZI7A/On0Lnk=;
        b=0xfD3iJY4zqIycdOZ/Nec2Pv7DVFlAi+eZGr2WCfCXKJGxr4NZh1mWWmS9nY/8CERm
         3IZuKPj+xot+Laslen6hywJDWepG29WwgUsr7O0y49rkogXfEQwNO9ZRWTBcgcY2u/DV
         ZQsaRUFq5GHpO2CXkDIW4N35hIOw9mLrvIO0FGjxUeB2zWUxKAU3BLA2XMscqus2ijXR
         w2UHt1s4AR+KeAMnFd08i4ZDJKE7KMd8n/cOGjG793kudTOLeIVjEIvHmay1UGPM2siv
         /VOui8XXhkT/D08IykJZ6FV/i6cxTv+KkkbGzzaMfnsxmn2KXOZPTgSdxsSlfvaJ7Cnc
         /peA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dLQYyV0W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10si1825323ybr.458.2021.03.18.01.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 01:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dLQYyV0W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMnkp-0005fX-Io
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 04:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lMnkZ-0005bG-PM
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 04:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lMnkX-0007wU-Lz
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 04:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616055081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NbkmUpCHt0hSsNWVi6Gqkg6gp4W267zZZI7A/On0Lnk=;
 b=dLQYyV0Wq2ONl9C1uWuFdzDaFYj14filOQtobuvnWPMwzS6jIljC/nasQGwzHvUZkFnLHr
 PINcwTBIJ2x+dfeFvYPisW7/rwuUD9YigR23S4Nxq0wEZBpVgl8xSjJ4HBP8ZqqrhcynGy
 dEpsnxfblbWrxF3hfozgv1EIXStp49M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-fPQsulVwP56kRzDEezHTzQ-1; Thu, 18 Mar 2021 04:09:57 -0400
X-MC-Unique: fPQsulVwP56kRzDEezHTzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E8028030D1;
 Thu, 18 Mar 2021 08:09:56 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.196.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1CF503EF;
 Thu, 18 Mar 2021 08:09:41 +0000 (UTC)
Date: Thu, 18 Mar 2021 09:09:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Disable pl011 clock migration if needed
Message-ID: <20210318080938.cmo4r5vkluvmdeiv@kamzik.brq.redhat.com>
References: <20210318023801.18287-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318023801.18287-1-gshan@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, luc@lmichel.fr, ehabkost@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hhW7HhAUlVqn

On Thu, Mar 18, 2021 at 10:38:01AM +0800, Gavin Shan wrote:
> A clock is added by commit aac63e0e6ea3 ("hw/char/pl011: add a clock
> input") since v5.2.0 which corresponds to virt-5.2 machine type. It
> causes backwards migration failure from upstream to downstream (v5.1.0)
> when the machine type is specified with virt-5.1.
> 
> This fixes the issue by following instructions from section "Connecting
> subsections to properties" in docs/devel/migration.rst. With this applied,
> the PL011 clock is migrated based on the machine type.
> 
>    virt-5.2 or newer:  migration
>    virt-5.1 or older:  non-migration
> 
> Cc: qemu-stable@nongnu.org # v5.2.0+
> Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/char/pl011.c         | 9 +++++++++
>  hw/core/machine.c       | 1 +
>  include/hw/char/pl011.h | 1 +
>  3 files changed, 11 insertions(+)

Reviewed-by: Andrew Jones <drjones@redhat.com>

And I agree with applying to 5.2 stable.

Thanks,
drew

