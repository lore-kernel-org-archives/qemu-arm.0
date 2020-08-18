Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3923890lfy;
        Tue, 18 Aug 2020 08:24:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3Z0Il9R90qYIqiJgz86Ctdj7sgImnRhoz3Jq6nd981z8xtEckM47rpifQEB+etbDMX9z6
X-Received: by 2002:a25:cf97:: with SMTP id f145mr29623311ybg.202.1597764266754;
        Tue, 18 Aug 2020 08:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597764266; cv=none;
        d=google.com; s=arc-20160816;
        b=hJ8M3rjg06aRNeNMVUZx4o84sQ2oXGgcEanR8H193cnSEGUsy/drlcoHbdoCpd95IC
         dSL9XBJNHyQr6P3f+BapWRhb9I4yG5Qjz/0xRtjRLgZlGSo69H4NsFt4iyxZ3pQcy0qy
         7pZAAZIq/TzjwXzXZcSvNXfDxOxYl9t73odMG8ciWG/YGvI352uM7EvMg5saqyYC7Cbf
         KucLWF3TtbeuyluyCcHSDz8cn2TUB5mLzO7eY1ZzNMZBGSXohI2lVoWIBsrHHMeKLUds
         Ja7+GEWdr/fsWx67RYBcHAWPVBNgPJkDocXCoTSMHB3OpSWIfLbiS1TZieB/AkJC4pQ/
         TGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=wFNRE5ym6NszrXjW7noTZdGM/WMaZvCcZu9Hy/byeKg=;
        b=rCaD0TZtZjxgpa75UMPH+Bp14dntmmEoNdurTwMishNc3LaXWhhERRz8UAhA6NgNTD
         CK5LHQ4Dulzx9y/mu59l9QZoEOcnhH6p+0LSvQoz6MzBbvkN1JAm8iXTKGVNNjeaOmMV
         yFHFZ3KUf5YlbeJ9YhNwfuvb1gTUJv2Z8ORV5+qMe/2Hhq8PEqS/9t0xwfrktj0u5AfJ
         QCxgtxVzkf0u1oiaJOLh8cjFkddkMcNSzhcW6cdeXpJYCVBNAtFfGk1BR9c+qRt6Z+pQ
         jgTR8D5LDvAYHwqISgvkzvds3WhTipAftXGAZmkgLlhwCPo1TiIpo5j3OJ0t7NXqz/qf
         VzBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SJnBvQR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si21957335ybf.433.2020.08.18.08.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 08:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SJnBvQR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k83TN-0005HV-WE
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 11:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k83ME-0000W6-ON
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 11:17:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47261
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k83MC-0008NO-6g
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 11:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597763819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFNRE5ym6NszrXjW7noTZdGM/WMaZvCcZu9Hy/byeKg=;
 b=SJnBvQR09voS24vKPJ8ur4gVaWRmxYMex4rahafY1z1iUh+ni8PfhR1SnobrnkT47wVSVO
 UYqvdlV27zM+vbkQv5ezPABNQ0LBPVJqsQagYG+OKkERx6jwnZx83DYL853FxWlHkgshpg
 ihGsLH/hmycFvN38KW6kP3SS/nYHoig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-dqao98qQMhOEx19ZK6XKhQ-1; Tue, 18 Aug 2020 11:16:55 -0400
X-MC-Unique: dqao98qQMhOEx19ZK6XKhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36DBA1DDFD;
 Tue, 18 Aug 2020 15:16:53 +0000 (UTC)
Received: from gondolin (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41EC939A75;
 Tue, 18 Aug 2020 15:16:40 +0000 (UTC)
Date: Tue, 18 Aug 2020 17:16:37 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 5/7] virtio-scsi-pci: default num_queues to -smp N
Message-ID: <20200818171637.08d6efee.cohuck@redhat.com>
In-Reply-To: <20200818143348.310613-6-stefanha@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
 <20200818143348.310613-6-stefanha@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 08:01:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6S9/1/qxBplB

On Tue, 18 Aug 2020 15:33:46 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Automatically size the number of virtio-scsi-pci, vhost-scsi-pci, and
> vhost-user-scsi-pci request virtqueues to match the number of vCPUs.
> Other transports continue to default to 1 request virtqueue.
> 
> A 1:1 virtqueue:vCPU mapping ensures that completion interrupts are
> handled on the same vCPU that submitted the request.  No IPI is
> necessary to complete an I/O request and performance is improved.  The
> maximum number of MSI-X vectors and virtqueues limit are respected.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/virtio/virtio-scsi.h |  2 ++
>  hw/core/machine.c               |  3 +++
>  hw/scsi/vhost-scsi.c            |  3 ++-
>  hw/scsi/vhost-user-scsi.c       |  3 ++-
>  hw/scsi/virtio-scsi.c           |  6 +++++-
>  hw/virtio/vhost-scsi-pci.c      | 10 +++++++---
>  hw/virtio/vhost-user-scsi-pci.c | 10 +++++++---
>  hw/virtio/virtio-scsi-pci.c     | 10 +++++++---
>  8 files changed, 35 insertions(+), 12 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

