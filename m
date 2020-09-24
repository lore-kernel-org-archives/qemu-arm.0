Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp125742lfq;
        Thu, 24 Sep 2020 03:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH+IeFOxWpnisdrj3cSlrQAJg9CDLHuGzo42DeCJyAtL5Qnnth9ir32k/16Y2Y6cWT+Dz3
X-Received: by 2002:a05:6902:529:: with SMTP id y9mr5747703ybs.130.1600943073829;
        Thu, 24 Sep 2020 03:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600943073; cv=none;
        d=google.com; s=arc-20160816;
        b=C3+uWOkhU6MLqgH5TyumzphUoK+CjJm1scbv0VxwukFKIuYgnEwepdZf/MjbHjjmhQ
         jG3UHgEZbQwizC5sjURCFYMRLY6u0P8XBmHbjCm9cF0tAGgrMeN529HqzvPyl3tIJixe
         2oyInk6mULqSnYsveD6A3rhgJmGiWAiK0xSl0k1ZNlYsEtWGIO6a6e4dlEV5689D13ga
         QhIe3QXiKqpD2UmTsPDXlVyv7A3JTVpz2dn58DKDhihmopRClb0EyXC7OQ4mZ4Xb7uwG
         vTfPGOU8WD5ZyNOUNryOub8n9isf8E8auKyJKbHy1588CrEyOmsSidu1qPSbu5RI5Na5
         OAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=CD45ho2Xfed1+qpUE87PRt8WCtp/CIslAqqrAiGhw84=;
        b=ScpCktqQ5EpeHzRbOj/jnWKi2QIXqa85xMPUPvLhyYiPamBHdI6SDNGULBwjJpyoPD
         lxcgqM6fGkfjHFBIWifxiQMbTJ0hYQ+jfhhqBUS93B3GTF3LrBkFWm5/Bnk8bWE4kTTW
         oFMQRFvnuP4M+wypAAwA25eu87ppQ1EejJOkMSfRVXaBhwqWkHx5QVDdCWionk4qSGYj
         YVE9uR+omzLRC11L0T3oLob6bMTeQKlS6PkKbbEaq5LawuDTN3HCH1GmDHVj/rLjY//b
         iw7s4/x4SylZyTLgr09bBe9HhxwP6PFhx6+bItJht88uvs3/f7S1bmrFACeMUj9Y4h+x
         CUeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z6AO7We5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d130si2750332ybc.251.2020.09.24.03.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Sep 2020 03:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z6AO7We5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLOQT-0004rJ-6i
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 06:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLNyr-0005Ux-GB
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 05:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLNyo-0001lM-Rs
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 05:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600941357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CD45ho2Xfed1+qpUE87PRt8WCtp/CIslAqqrAiGhw84=;
 b=Z6AO7We5OOy7GSQou82NtqEqv2x7Cx9snmWlUsbb/qKZN5vr8oRbRZ45a92gueQDOdjdjg
 cwHVL1AEuP0LJLZwd3y7m/CoRGjTE36MI8issnzzFaq0QQvBrWSO7E8LhNP0n0dAhNAvjO
 lRzDcjz9v0t4DpSYXDZw3Ua400GDTYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-_T__Uw2DPGGn8Wp-T0wPMw-1; Thu, 24 Sep 2020 05:55:53 -0400
X-MC-Unique: _T__Uw2DPGGn8Wp-T0wPMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45E1618B9F40;
 Thu, 24 Sep 2020 09:55:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F47960C04;
 Thu, 24 Sep 2020 09:55:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80EC416E0A; Thu, 24 Sep 2020 11:55:45 +0200 (CEST)
Date: Thu, 24 Sep 2020 11:55:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 00/11] microvm: add pcie support
Message-ID: <20200924095545.splwjfu73fhirj3x@sirius.home.kraxel.org>
References: <20200924062734.22978-1-kraxel@redhat.com>
 <20200924032838-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200924032838-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N9p85ElILuwz

On Thu, Sep 24, 2020 at 03:29:02AM -0400, Michael S. Tsirkin wrote:
> On Thu, Sep 24, 2020 at 08:27:23AM +0200, Gerd Hoffmann wrote:
> > v2:
> >  - move aml generator to gpex and have arm virt + microvm share it.
> >  - add 64bit window.
> >  - add testcase.
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> which tree is this for? Yours?

I don't mind much.  I can do a microvm pull request, but given the acpi
test data changes it might be less trouble with conflicts if you take
it through the acpi tree ...

take care,
  Gerd

