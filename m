Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3936491lfy;
        Tue, 18 Aug 2020 08:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpHN43d301jUVvYbDP2byksXy08oPM0pU3GVln1AnFJGEvBJVXtRxjl6l9b6Y6TDEMTj1M
X-Received: by 2002:a25:25cc:: with SMTP id l195mr28802840ybl.383.1597765139991;
        Tue, 18 Aug 2020 08:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597765139; cv=none;
        d=google.com; s=arc-20160816;
        b=x77J+ouYfEtS7RBu2sl7dVIyTRxb6Bk9VQ4WItujk3EyVMwzJUcDJTQkvKp1W5IqgU
         TVTAQ0u//2LB1T08qFd1XJiymKFo3DtAOeRll33sC0JiyVALPBvxw+xPRDSZL6HO9J5Q
         9ezy19T0frZRlyeIr/eaRsgLHdIiPABgjdxBWgLjDw8btuFMZNBShcjxkuIv3RlzgyAm
         8znOiImMxmOkERb0sy8dSQDdqQGJNRLCK5jthLf2V5qE//ZmR7BgXyTTUPLeZr6G2LRj
         GAaJqJKs5jEXBs9cpt3CcWAZ3pytN4Dd6FyDvRompLw3I+LLXEvB/8MhUwdwfJthgol6
         XZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=CPqyYPk/qK87geobvv3+KOg2E49u//gNn5PUFNMo42E=;
        b=MJRZK7RqPoyPkU//v1MULknNtUBe89ELjFrttFPs9M3vW2kGw6H0l7zRip2sAdg46f
         L3F5Bg4rBg6zHdFHSarp5gc24/6TdQC3oDOU5Xwt0ddyugaC12/dD6Pbx2xJrh1xeGlh
         icIKyIW99sBqB2njxfidGVemYKQELzvhnSRjvb8traTQiD8wN8zIV9OK6T23EC1uos8E
         Vixi2NWFrGfZQ9qrIkCkl9xZZH99EAfVmJHGOhsdR9C2DWV5QOQT/FHIG11T4mZqykgh
         d3/gMPNbOsCU7tuoxbBXlNY2wY8tR7D3hsqMwrljz8wQMe2XxTcSslLmEj9PUpcTtHnr
         H5bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J5eRqWVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g93si22666879ybi.26.2020.08.18.08.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 08:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J5eRqWVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k83hT-00058U-Aq
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 11:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k83HQ-000194-9j
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 11:12:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52613
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k83HO-0007rd-1N
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 11:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597763521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPqyYPk/qK87geobvv3+KOg2E49u//gNn5PUFNMo42E=;
 b=J5eRqWVmHFnnDrv3xzR5j6z/EQIv1ciMPQV4x9jamsDkzmEqczVStQ2MQ/G1yy/k0BkiYE
 AgEju57UNvU3KnGgnqUDVUN82QwCV03sX007lrVkbZPEXWW6eXgiSqY7W/aR2Gvljg2Cvz
 uz+avcvuacVF6lIGdqlSuQAMswzXwKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-2JN3_cqdP8yQ9xWIlAqPWw-1; Tue, 18 Aug 2020 11:11:57 -0400
X-MC-Unique: 2JN3_cqdP8yQ9xWIlAqPWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27CC581F020;
 Tue, 18 Aug 2020 15:11:55 +0000 (UTC)
Received: from gondolin (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCC727A3B7;
 Tue, 18 Aug 2020 15:11:34 +0000 (UTC)
Date: Tue, 18 Aug 2020 17:11:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 2/7] hw: add 5.2 machine types and 5.1 compat options
Message-ID: <20200818171132.551e2c72.cohuck@redhat.com>
In-Reply-To: <20200818143348.310613-3-stefanha@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
 <20200818143348.310613-3-stefanha@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 06:40:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 David Gibson <david@gibson.dropbear.id.au>, Max Reitz <mreitz@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6QI1IjoBTukE

On Tue, 18 Aug 2020 15:33:43 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> arm, i386, ppc, and s390x have versioned machine types and associated
> compatibility options. Introduce new ones now that QEMU 5.1 has been
> released.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  4 ++++
>  hw/i386/pc.c               |  4 ++++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  9 files changed, 73 insertions(+), 6 deletions(-)

https://lore.kernel.org/qemu-devel/20200728094645.272149-1-cohuck@redhat.com/
is already out there :)

