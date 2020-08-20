Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1412044lfy;
        Thu, 20 Aug 2020 07:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA4rfdMJsiq0bt+G6nMdxY/Dd89QY0vtBGI47Ikp0rcIsvKE0PeSLb0fS8qD/TmUhTA8YP
X-Received: by 2002:a25:dcc4:: with SMTP id y187mr5500141ybe.121.1597934459299;
        Thu, 20 Aug 2020 07:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597934459; cv=none;
        d=google.com; s=arc-20160816;
        b=sEuhTDuWqn6tyqKi2Gf7eIKoSL935xcvd86jUTMijs8x+q3QXo0WqiFZfxa9EEXcej
         Zmp09vnAhYaRIUp2j0C0qpmUDvh8Mz50CiqFa/Y6bJvkh82Nbk4ToZLBHWJYwKStayJq
         KE0l+Du+F/BIeH3Ih1N/TP0bQOe//NCx5a2LPcCOzcR/O1daUrb2Xo4fjqfB30xR3ivf
         c9DjUBI93JGJdIraB6i2BnrgEsCHSkpqVLBS0kD0WJjIt33aLuD2SHWIiXEWkoJNT0iW
         oxUXnnTaFUi1W7S+RSOCLf3dXK493bD2Rfrf0JzdObt/WZBgfcJWPk1WZadzKH+VvbZ8
         8u7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=ubmh6JJeG9ZHNklT5zqcj/VSz0pM2xSLjwj2JQNHoMY=;
        b=km3vdx/PvNwvvRZBmnsbDQk289Mnwk6JFseJSsFP25oNL3GGYN+fcYu1qFihKicNa2
         FNAEFdL5NcfCJHwyXSIYHCuRQ2L6XBlwwrFuC/LB1ixvBMNafuhf6IRt2Y2PI36VnPMN
         53A+WAvKl+ODrGIOz85q+ByARes0SRUptUHOH5tiv3zsw1CcZB2L+smkaJutI4BGM2n9
         DpdtNwG+WkXSYJaufPq9VG0jGniKTCmH7IgedLSBCoIZHNhpCSykbyjyc+ItmkOEP0ZQ
         7xMqzSA0e9UUtMu3VsmpS5CTBmZR9H/viFRHOHxrf0jxJF5caH/zqACrJEtkQ9O0Tm1E
         xDBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="QZ3rUj/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si2547115ybj.389.2020.08.20.07.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 07:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="QZ3rUj/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8lkQ-0003tA-Lb
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 10:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k8lkJ-0003sv-J9
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 10:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k8lkH-0002Xf-FI
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 10:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597934448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubmh6JJeG9ZHNklT5zqcj/VSz0pM2xSLjwj2JQNHoMY=;
 b=QZ3rUj/4QTSXntZzl1A93+as59UV85WIPpSdNXo4d3Rixa3RBOFnOCX3Nw1t/RSkKhwMx/
 sMpfwk6WjxRrqUDCag+pWjgjZxy3z8EoTI8pVchmmW8lbiHkBDXTQXTcP5FF7bZ+Q13bYk
 uhr9unr6L9R3BrQ+l5IOy8bpkWQIEcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-zOafsm9YPS67rawurpGWQw-1; Thu, 20 Aug 2020 10:40:46 -0400
X-MC-Unique: zOafsm9YPS67rawurpGWQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E74A193F572;
 Thu, 20 Aug 2020 14:40:44 +0000 (UTC)
Received: from gondolin (ovpn-112-251.ams2.redhat.com [10.36.112.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB45E60C87;
 Thu, 20 Aug 2020 14:40:34 +0000 (UTC)
Date: Thu, 20 Aug 2020 16:40:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 3/3] hw: add compat machines for 5.2
Message-ID: <20200820164032.5a443e3a.cohuck@redhat.com>
In-Reply-To: <20200820163508.5c2fce23@redhat.com>
References: <20200819152258.703874-1-ehabkost@redhat.com>
 <20200819152258.703874-4-ehabkost@redhat.com>
 <20200820163508.5c2fce23@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 09:00:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K6H2HkAvfatr

On Thu, 20 Aug 2020 16:35:08 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed, 19 Aug 2020 11:22:58 -0400
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > 
> > Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
> > 
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> > Acked-by: David Gibson <david@gibson.dropbear.id.au>
> > Acked-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > Message-Id: <20200819144016.281156-1-cohuck@redhat.com>
                 ^^^^^^^^^^^^^^

> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>  
> 
> Is this the latest version of the patch?
> It doesn't apply cleanly on top of the current master.

Again? I re-spun it yesterday against then-current master.

