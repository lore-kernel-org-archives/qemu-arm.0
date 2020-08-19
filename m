Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp509705lfy;
        Wed, 19 Aug 2020 07:38:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJkpUfEXCA+9sip3go4qLr7KBqqnsaSRAaPFJDSH4/CEmxTtInrx81hfd3A/V2nqwuEJD9
X-Received: by 2002:a25:7509:: with SMTP id q9mr20991487ybc.317.1597847932201;
        Wed, 19 Aug 2020 07:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597847932; cv=none;
        d=google.com; s=arc-20160816;
        b=ST5CPsYpoG+zT6yIbKjAEHNLrrI9begnQiiv/Jgh1bJumsClTKn+vf1xWIARWFiSNC
         I1P2Bo8IMDJ1BCE59NmfA+tp7lcvc9Ig3aUOlwQ7KHfHSRLFFNt6b1JGpwu/yiJxP4b5
         xcOLzr9xIw9gtvdOkurKjN6p39wp6GKH/Ya6yhLnGJh6PWJwg7yaHTpyKv1r8j3OP/At
         4DC4Iw5IG4r7iYPqsqAR0ZuYqafL4Bs2QT0/AsefI2FIzDyJ8wiVpXClb81UB/ik9/4V
         DRxl+abbAxUbXHGS1EYi2FvtD0714H0EA7pZY+xXnw4eZeSKjWhoyl9qc+4szUASWMJL
         N4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pgqRTPMCzUIHJaMPXJZPxbHjGvr0SYj45cODS1dxyKE=;
        b=MNn5SuCQ0XodDBtDwJ8Lpd6h6hGZMnaexEPZlcLknv8A9MLuLglJbonJ//MS6Q4yHO
         dptCHaw6KAqHeUC5YFn3m2B4pfIu7LJiwWmt+cFSTq+wOIZhl+2xMdxsuw3n43mfoZrI
         6o8sOgwVn7N6+mSv1UR8O51xejUfqcWkRZJV4I9X/TV8UhaZcZWxuEfPW/jhFEUja7Sz
         pTlNVBpnP6CSpSGQKlHJUzYM2CzrZqUCp763G70pnTH8/yR6t57u0q/UqtgutaldaCMt
         1o4F5DAmNmR/9UJ5s6NjHT3jAGGbJzHoqTX2crJDBwWp7Z/NidfJrM6TupnBq+qyBFY2
         zgpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QiEN8fcr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si24585570ybq.362.2020.08.19.07.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 07:38:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QiEN8fcr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8PEp-0007hn-LB
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 10:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1k8PEi-0007gS-26
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 10:38:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58227
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1k8PEe-0001wS-Ua
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 10:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597847919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgqRTPMCzUIHJaMPXJZPxbHjGvr0SYj45cODS1dxyKE=;
 b=QiEN8fcrNkhsogEkIuAWCKB/xe9EEIMBsHPmNx5Helogl871Ysghiuam0D6lAz1a1cHEDn
 EYTf1tKLatKvtEB97WKNJKGNxxPcHzxEOTk3K+UUFDUB0u5h+1fMwhs2Rh2ckuBtbLyQa1
 rY7jw+ptV33WT9tQ9Ou6fvXq6R2HHO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-kIVdEY5TPECcHMUglhQylA-1; Wed, 19 Aug 2020 10:38:38 -0400
X-MC-Unique: kIVdEY5TPECcHMUglhQylA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D9FC801AEE;
 Wed, 19 Aug 2020 14:38:35 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-57.ams2.redhat.com
 [10.36.114.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B00365C1D0;
 Wed, 19 Aug 2020 14:38:21 +0000 (UTC)
Subject: Re: [PATCH v6 2/7] hw: add 5.2 machine types and 5.1 compat options
To: Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
 <20200818143348.310613-3-stefanha@redhat.com>
 <20200818171132.551e2c72.cohuck@redhat.com>
 <20200819141259.GD366841@stefanha-x1.localdomain>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <96e4819a-1570-9b38-90eb-0c7bac2016e7@redhat.com>
Date: Wed, 19 Aug 2020 16:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200819141259.GD366841@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:00:34
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
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P4Guo6nllqEG

On 08/19/20 16:12, Stefan Hajnoczi wrote:
> On Tue, Aug 18, 2020 at 05:11:32PM +0200, Cornelia Huck wrote:
>> On Tue, 18 Aug 2020 15:33:43 +0100
>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>>> arm, i386, ppc, and s390x have versioned machine types and associated
>>> compatibility options. Introduce new ones now that QEMU 5.1 has been
>>> released.
>>>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>  include/hw/boards.h        |  3 +++
>>>  include/hw/i386/pc.h       |  3 +++
>>>  hw/arm/virt.c              |  9 ++++++++-
>>>  hw/core/machine.c          |  4 ++++
>>>  hw/i386/pc.c               |  4 ++++
>>>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>>>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>>>  hw/ppc/spapr.c             | 15 +++++++++++++--
>>>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>>>  9 files changed, 73 insertions(+), 6 deletions(-)
>>
>> https://lore.kernel.org/qemu-devel/20200728094645.272149-1-cohuck@redhat.com/
>> is already out there :)
> 
> You're too quick! :)
> 
> Next time I'll write a script and monitor qemu.git for the release tag
> so I can be first!!!!!!111

You're joking, but a template patch or some other automatism that opens
the next development tree *BY* introducing new machine types would be
nothing to frown at.

Another option would be for Peter to delay opening up the next
development tree until he could immediately merge a patch with the new
machine types (posted by whoever, near the end of the HFF or something).

Thanks
Laszlo

