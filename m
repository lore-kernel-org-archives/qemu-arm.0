Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp522875lfq;
        Wed, 7 Oct 2020 08:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6sj1/o/MMda0r1JJNLA6sZRfLr6a1yYfiBWZMf7lH9SLbNknqS+EDfuZCKIDfgxvV83QH
X-Received: by 2002:a25:2786:: with SMTP id n128mr4948884ybn.116.1602085897767;
        Wed, 07 Oct 2020 08:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602085897; cv=none;
        d=google.com; s=arc-20160816;
        b=ifNoKpIoxC2WdMSV1PXYbKzj/FWpH9eWO0IoOMb6quVKgq8qSLoAxfJXhd1ylZW14S
         aV9wQ7xypL/0idx+rLKNTkuHFu9es2EPPrselPMiZueTdHnDQFjA9fBOQmtfj+XtSfKg
         CJZeILJZnyPqCNV49742qEIzD0qPC7EVXQ45SJsxt8RqFLDZmcp4iQLCF2Jwnn1rnZr3
         84u+hHbIuiEFRxy+Ire3iRn3TKiM5mcOhR19xj3CAk0pkeHqvNFdgR7gaL+GHUs7FMT8
         O05sJeKepeCZIugv28BelCrYRW7Z1NpenucA25uDDfVbeQ2+OTj3Gd5zXIF4WkH9Q6VB
         Ltcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Ezg3xLJgiZMdbCSIM2AGJQ7reAQ/jzvu/sS4w/S9ByY=;
        b=V4JdoDXZg/5ZnBJogUA1vszJhFUAjGruaROIXN0QTJdLrGqMsP2TaCO1n8Trd3DdTJ
         0kjAFglHVBYavAirjcnwz6X7o9UDLhZPO3hIunjhSzsyEBWDR7UquFmttwcqacnsOzkI
         ldYuklXB4p/br8ZDebtaZalghcexpywtWjQS3DfBEqR+rRDbKM/dgfp446OnNRb60Xw3
         e04udkFa5kv8LWkJ7aQbXthpDMr73O57VieitQBBb9Q43x4/vj0ph/HdzNw5f75lRR6r
         zRMqvjv2Q8FDw3tpcLLutbEIQFmOSKlXNcNv8OPd7vN1fK9tTo8yAMieWoRAmGPpiIB6
         D8rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V0N5vt64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j73si2154202ybj.443.2020.10.07.08.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 08:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V0N5vt64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQBj7-00060e-5e
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 11:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQBio-0005zT-Rr
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 11:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQBii-0007e3-74
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 11:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602085870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ezg3xLJgiZMdbCSIM2AGJQ7reAQ/jzvu/sS4w/S9ByY=;
 b=V0N5vt64BpXV9Gdx4tnostjdBztCPnBGysl87lZ20a+kGgQCy9y9uFnDasR2Ki1pvKrOFG
 89WKCnDT8RK/P3UdFEVnyHk6D84IsCyOh49xb7F6eugDLKNqbudfd9z9SxMpvZDU3/hELk
 ppXuTrIv4LN0BrB2AUIdv2bRmmW0X9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-asWaldYbOuiOBexEG9K8eQ-1; Wed, 07 Oct 2020 11:51:08 -0400
X-MC-Unique: asWaldYbOuiOBexEG9K8eQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0BCD56C32;
 Wed,  7 Oct 2020 15:51:06 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76F505C1C2;
 Wed,  7 Oct 2020 15:51:06 +0000 (UTC)
Date: Wed, 7 Oct 2020 11:51:05 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Purpose of QOM properties registered at realize time?
Message-ID: <20201007155105.GX7303@habkost.net>
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
 <20201007130240.GU7303@habkost.net>
 <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
 <20201007142742.GV7303@habkost.net>
 <117cb090-d9ce-6394-42a2-2ac99fd965b9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <117cb090-d9ce-6394-42a2-2ac99fd965b9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kl0gJ98mk1g4

On Wed, Oct 07, 2020 at 04:54:31PM +0200, Paolo Bonzini wrote:
> On 07/10/20 16:27, Eduardo Habkost wrote:
> >> It is always wrapped, but (as far as I recall, because I have never
> >> worked with GPIOs) they are intentionally QOM properties and not just as
> >> an implementation detail.  It's meant to be accessible to the user if
> >> only through qom-get/qom-set.
> >
> > Being accessible for debugging would be OK.  I'm just worried
> > about dynamic QOM properties being part of a stable and supported
> > API.
> 
> Certainly accessing the properties is only for debugging.
> 
> However, I am not sure if the _existence_ of GPIOs as dynamic QOM
> properties is part of the API; that is, whether the user has to specify
> the names of these properties to create some devices.  I don't think
> that wouldn't be a problem anyway, what do you think?

Right now, I only want to know if the QOM property is part of a
supported stable external interface.  For the properties
registered at realize time, the answer seems to be "no".

Later, I might want to locate internal users of those QOM
properties too, to be able to refactor the code if necessary.

-- 
Eduardo

