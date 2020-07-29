Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1630001lfy;
        Wed, 29 Jul 2020 07:23:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeiDuDIywuwj7+CWM8FtDjp01qJGbRrG7GRkYDOplyXqtrWCZIyrbzaH//hvAe6VTB7YbS
X-Received: by 2002:a25:6e0b:: with SMTP id j11mr49368134ybc.455.1596032598168;
        Wed, 29 Jul 2020 07:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596032598; cv=none;
        d=google.com; s=arc-20160816;
        b=0JHHrMLhx6kLcPuJYGq89LJufk8+Uwumv5LX1gROWQFh18v1Dn2ejQ6eAKWAq28Kof
         EzF7gxzE01bMDjTlRRnYn1eYsT4wVTbwGqUnWrFeG13TM7DGKoB3jgma0gL4EFF1ugw5
         iXUWv1O7jJ7J1GXSrlAMKI+78ytIaCoccmrOP2uLUgC2rQhYTYC/JRcnh50GJoDY3myG
         RiFML0dF0qrhpKdPjeTT1gUpBZTU0ECzwK8t3X9WSZT5HUABHIUZxyoPMHzt1CkZXDUY
         N4Z71uyuv9Fn5vSqBVD5+13nvn1LTizwbfKXlZUCyfQmNItfqegTcV7k8qS4hyVp+583
         irlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=+cHoVpnYLXVulP4Nmg8+08mjcJvmU6i93ZjO7Wn03w0=;
        b=Km3SS6gEjbqgTGcFxmmdALQfXbj8sC1ARWoN+mwhyTVWW1NQ0XkMoGRJdNzpKaOs1T
         QsNkS/OX4u36THOcxpLBTLnvE9oNXKQPWYahmQoJ2gPv4kWQbuYfy+b5DI2JHjF4MAre
         lSo/Fkcp5kprTjulR+w1pKioithEBRTfLa3TchNLYOO127nVW8d80GN+TbsDqfb24coP
         TUKMeRekchMct0upPdlzruO3l1oUJpgWSelITU73ygpSkU9LFT3+PPy9UPpC+nOZ5t+/
         erUZS1Os9rMAcPKZdDBYe/U2DxPrFLLADiG7jhli6hDe2qhhTbzEw155tctIeEkOOkOD
         ihEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h2M4a+oO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y203si1968806yby.414.2020.07.29.07.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 07:23:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h2M4a+oO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0mzF-0001dR-GA
	for alex.bennee@linaro.org; Wed, 29 Jul 2020 10:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k0myv-0001TT-De
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 10:22:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52943
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k0myt-0000kX-Ui
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 10:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596032575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cHoVpnYLXVulP4Nmg8+08mjcJvmU6i93ZjO7Wn03w0=;
 b=h2M4a+oOJX8oBSnHdnSk/Tkyu+aG4u2cERfg3rg++UTArZsp/j5izIRLEuj6DSsaEJ+sgI
 xmMfghL2j4Fc+px5tbl5KiQgeLzqEZFSe8LrOoej2dJihTn5cHVrxDB1RatFxvdJpWvxZv
 MDXgCvg8BEE0eV99TGl7gStNqQ04rOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-zSiVxbh0O4Kc5NpwVIkJ_Q-1; Wed, 29 Jul 2020 10:22:51 -0400
X-MC-Unique: zSiVxbh0O4Kc5NpwVIkJ_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C02E8C3540;
 Wed, 29 Jul 2020 14:22:49 +0000 (UTC)
Received: from gondolin (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7424C5C1BD;
 Wed, 29 Jul 2020 14:22:41 +0000 (UTC)
Date: Wed, 29 Jul 2020 16:22:39 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 5.2
Message-ID: <20200729162239.0f71b7a5.cohuck@redhat.com>
In-Reply-To: <20200729101032-mutt-send-email-mst@kernel.org>
References: <20200728094645.272149-1-cohuck@redhat.com>
 <20200729101032-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 09:27:47
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0bY0QUXV7kPL

On Wed, 29 Jul 2020 10:10:56 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Jul 28, 2020 at 11:46:45AM +0200, Cornelia Huck wrote:
> > Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>  
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> 
> We merge this kind of thing after the release, right?

I guess the first person to do an arch pull request for 5.2 gets to
merge this.

(I don't have much for s390 yet, so probably someone else.)

> 
> 
> > ---
> >  hw/arm/virt.c              |  9 ++++++++-
> >  hw/core/machine.c          |  3 +++
> >  hw/i386/pc.c               |  3 +++
> >  hw/i386/pc_piix.c          | 14 +++++++++++++-
> >  hw/i386/pc_q35.c           | 13 ++++++++++++-
> >  hw/ppc/spapr.c             | 15 +++++++++++++--
> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> >  include/hw/boards.h        |  3 +++
> >  include/hw/i386/pc.h       |  3 +++
> >  9 files changed, 71 insertions(+), 6 deletions(-)

