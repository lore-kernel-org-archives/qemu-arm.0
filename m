Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1338520lfc;
        Tue, 3 Dec 2019 02:59:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtYHbDXky2a6YQpbkuvQSYW761t9Cg0raaYlsEsfKhNsc5xWvlErdptbTmUvJRVAuxsqdd
X-Received: by 2002:aed:22b7:: with SMTP id p52mr4283086qtc.289.1575370782021;
        Tue, 03 Dec 2019 02:59:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575370782; cv=none;
        d=google.com; s=arc-20160816;
        b=yj4zpqCWSFaJV0a0MhPOUIrg6vr7RewIZrbiX/loVmEw5sTB4qd8WhL8dQexIid9UR
         NuVOSESFyWV0q2IksCJy37XleXCgIbLDax/uOxZ20HkXHJa4igg5hU3tkzj55yWzU2vU
         n2XsWmENs593HWu2UzXp5GhmQ2iIXH28RM1X5hq2LH0VfJ2O0VZm0vKXonbagVqTl+P9
         2kbMR1taP3zY0vUNrQjyCgTrzySzCCinpgLHkb4XFx4jQYQKLFnLOm5MMf3sgKAIVC8X
         Qiuw7nPCrqDF7gVjaOWDSEIf6+eraFSDywhfPCVyNhXKcKY01/GYhYvy1evXNuQ07u25
         ohbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=tmE6T+90ulAzLVV6uJG128gLj4NrWI8Np4kYPYZNYMA=;
        b=Ow4QGhvVP7obUl4F7Uvb/nG6AUfIrtUkuYhjG2P+S7d8DH6W0w2kLjuILLZznuvjne
         kwUcHLESLgRhQ+0IikfVo3eL1pTyG6ni87oaIY6wIs2XHu//kXrq8xxdFWW2ESPN8br9
         6/aca6441WBseFVtz//Cz6d9LzyP1iuTEFwL5loD+ztA2SfFCeIEqgoCxQv7o9YwNuRp
         vf4X5KgvlhTNzcZAx6I5CZ9S7LixxiPbc/Us8/F4+6svrNDMreHtc/zExhW+4RwBsbf7
         Gj4qpZyy3IKVR9J5oyxzcLa7cDesARDrkUEQFq3R9AnCZlqpLLZHuQRAA51tVfTY7BDB
         QNng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hxByg4bK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si1607970qti.315.2019.12.03.02.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 02:59:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hxByg4bK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic5u7-0004gB-Fb
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 05:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ic5sP-0004Mn-VR
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 05:57:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ic5sH-00053V-Tr
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 05:57:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24055
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ic5sH-0004pr-P7
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 05:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575370662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmE6T+90ulAzLVV6uJG128gLj4NrWI8Np4kYPYZNYMA=;
 b=hxByg4bKhuPhdWuVaLUZDaPQ8oZXliYYlbGYKeB8s/uQjgFHDlEPosmUtKV1MJ5IHHYce4
 B+T0AzSJPagtHPmYT5jCTcvtD3qL9tjek9re9MPTagJOR+AxsqC1KQXbrlGuzuUtDw3XU9
 WKs67F1HVx7QTsUMMKi19QdKUtlBQEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-3WbV_gq6OYiqkqvsa42EWw-1; Tue, 03 Dec 2019 05:57:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CBB9801E76;
 Tue,  3 Dec 2019 10:57:39 +0000 (UTC)
Received: from gondolin (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FAE8600C8;
 Tue,  3 Dec 2019 10:57:34 +0000 (UTC)
Date: Tue, 3 Dec 2019 11:57:31 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v5 02/13] hw/core/qdev: add trace events to help with
 resettable transition
Message-ID: <20191203115731.5c5f55f1.cohuck@redhat.com>
In-Reply-To: <20191018150630.31099-3-damien.hedde@greensocs.com>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-3-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 3WbV_gq6OYiqkqvsa42EWw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 qemu-s390x@nongnu.org, mark.burton@greensocs.com, qemu-devel@nongnu.org,
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZEhpf3ndrLde

On Fri, 18 Oct 2019 17:06:19 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

> Adds trace events to reset procedure and when updating the parent
> bus of a device.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/qdev.c       | 27 ++++++++++++++++++++++++---
>  hw/core/trace-events |  9 +++++++++
>  2 files changed, 33 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

