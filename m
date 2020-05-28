Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp276006lfc;
        Thu, 28 May 2020 00:19:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcqfkbz6nJm+CBk+/zdPyLy9MaaFsClngth8NFFUxAKosi4NkFz3e2cBhJtz+Eonq+KRow
X-Received: by 2002:a25:3c85:: with SMTP id j127mr3002731yba.144.1590650390134;
        Thu, 28 May 2020 00:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590650390; cv=none;
        d=google.com; s=arc-20160816;
        b=fbon3ar+xx8gQ8QhhKGfBvjSUhSS8/6eweTh8PoLOcXJqFQaW3QDaqqmgw3186fujz
         EpA8m5fxvXCxkg3Vt8gnhFc7HRqLmYoOxEVsf5W1LgJZMVjdSIIc1Lt8XBLknupbUaKA
         vZYsH899xbqQOg5UixiDNEUqJfbzEGQgKkuo2Ys6CIste85NY/OLSyKZWmgX6315Jkgp
         Fi90afxCEYHxbkI6hHZezUeVmwsBSV5V2FTpuJ5GT2VoITdEIRawRRKBgWb/jRBT6p5B
         6AJIY/8m29ou0eWBtt5IHzzFLUkZgE51JCQ+wxfaybidZKgvjBItk5zZBb9trRxNoypb
         xLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=S//X3F/j4kOePqI3T1+0TAj8XOqFwNecc3wofJHGD6Q=;
        b=RcTSCMJl9i10KPDjDB+fPH1F8FBpYfYxZ1BeFTAPaA2iiZxO3xxbdCGPmSXOsTax12
         uZwtez23z7pkcPg5CloVycrbgH0ZmReICyyi4io1C2Z+b2iy1uDXps5pi5v0A0YX5Uq2
         dyx2bWxZcmR5Vd1HRzViJukOmD/8AEGv36UswDHdDwFU8jUMLxMwL/2YeZtKyscKkOmh
         SGhMYz11BaVgiZrP4V0m8bY0c+zIn8JUeOiisJaPQgLgMlAz2JfUjjEr8wbGl3h//Kjj
         tX9DqwbJ5z9nsm9LKynNoBslxcGG0dacbcoTDgluMngx8xRmkE3TsUapxX9GYObKsP9K
         M+9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=daG7EtHr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si4470423ybq.189.2020.05.28.00.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 00:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=daG7EtHr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeCpR-00065Z-HA
	for alex.bennee@linaro.org; Thu, 28 May 2020 03:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeCpK-00063T-DD
 for qemu-arm@nongnu.org; Thu, 28 May 2020 03:19:42 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25822
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeCpJ-0006Nd-TI
 for qemu-arm@nongnu.org; Thu, 28 May 2020 03:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590650380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S//X3F/j4kOePqI3T1+0TAj8XOqFwNecc3wofJHGD6Q=;
 b=daG7EtHrmd2yaf0WWRDGz6SduTw+DjTh5nv+PC4h+qavnHqX3RXrhdQNRvxaqdfTmBrzG7
 2eh5Ehx2j5JNj/25huFucTsnyIVr9uRqswauPBmbx1DUrrSOelDLh4Gu7W8Kzg2aSXbiVN
 y5dVpU/lXNp4QENmPHBgxoSCE0IpKuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-PtG5o7BpMuKiayhIQWustQ-1; Thu, 28 May 2020 03:19:37 -0400
X-MC-Unique: PtG5o7BpMuKiayhIQWustQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA6C080183C;
 Thu, 28 May 2020 07:19:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F408260C84;
 Thu, 28 May 2020 07:19:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2786816E2C; Thu, 28 May 2020 09:19:28 +0200 (CEST)
Date: Thu, 28 May 2020 09:19:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
Message-ID: <20200528071928.czcp3q22bra3r6lt@sirius.home.kraxel.org>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
 <20200521112921.641f12bb@redhat.com>
 <20200525114508.hhvyzjiqja6knz6l@sirius.home.kraxel.org>
 <20200525183615.5f8e67d3@redhat.com>
 <20200526044839.bncj6iltugnzgfmy@sirius.home.kraxel.org>
 <20200527142545.32e91049@redhat.com>
 <58ced517-1ad4-c895-afe6-fec690791f4f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <58ced517-1ad4-c895-afe6-fec690791f4f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:10:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DimVT783VCpT

  Hi,

> But why use 2G split instead of 3G?  There's only very little MMIO and
> no PCI hole (including no huge MMCONFIG BAR) on microvm.

Yes, we can go for 3G, we are indeed not short on address space ;)

take care,
  Gerd

