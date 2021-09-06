Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3932126lfb;
        Mon, 6 Sep 2021 09:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAQJy5tUoRGUH1wJaNoBsAozCG36BVIUcW6+Lv+qXGmuTy7fsZGcXpoIchbnPkB69oJ/48
X-Received: by 2002:adf:ff84:: with SMTP id j4mr12634341wrr.88.1630944959459;
        Mon, 06 Sep 2021 09:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630944959; cv=none;
        d=google.com; s=arc-20160816;
        b=vDrmX88Wck3yVEVdhsqfns0bpZuRo10AaCGSYjjxougLHFATMtEyQU6jkk4mxPbMMT
         fdAiJ41x1MEWYn5mm4GFaBs64+NrMJsuxP6km6+Vek7wnXfr96optRa+nWVczmznQIB+
         Qj8pFlZSrctKAWQLxuHLpiFg4AZIfqESJ913sHjyzRrcBiJqE7umDPUZsmVCdZKYhNRy
         cVU8GGoMdhtUkYRamfBwDyjlNAuL2GZVihAlqVDsacvlcc5mS/JRIvCU0P6A+2HTYzt2
         DoYd2mxe2s0/sZkWUcQSYI2Ic6DbAJ6xVYE6Z0iNJKQW/HWIAsqWGo86D7ESiaTarr1/
         PX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=9o//+xgbWBZU75mGw9CeHU5EKtySdAmjKiKyx/wwURE=;
        b=v5pBRBR7U9TxEkFqsuHuelrEx3RQXArUfD2qd+K10wp40nhBeKM4IBZiZeQv0MtfUq
         st6RUIDLHND+6jrRpdkyKa7lbfi9mJWwuHQ+Qax9XtwYIN6W7vcqeQu5MxJ/AafwE2Dn
         GxHmPAxze4cSYio3RLozOCXTLP/41JP9mcFfq2jN53iTqNJs1caRpiwC5XEj48YJTdsP
         xeVRRgJNVja5aatwX7u8sSbWqde/ke6Lf84tHSVLNuyIInc7lpenX3dUR8t7jHSmzVX+
         zuYR42+qdZ4W93EZPWYp/h0c3iWFV6rYzqGWeiRf9pZOUbpPA2u8yfjfh5BUDMpb5p4A
         iQuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SKeMKMvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si9060410wry.247.2021.09.06.09.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 09:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SKeMKMvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNHHq-0001Qf-Df
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 12:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mNHHU-0001QK-Ok
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 12:15:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mNHHQ-0004bn-4v
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 12:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630944930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9o//+xgbWBZU75mGw9CeHU5EKtySdAmjKiKyx/wwURE=;
 b=SKeMKMvA1x6PALt0HYzLPhO6lRP7gwNZ1wJiIXHVrv6b6QWWujLzMIKokz9gvr75ea16rY
 9VTnUCdcb3SC/KWwg+CVX2D9pG1FA52KnGgThA3mB60cuLe0gZzDETd0zTGDj9SYLWbfOg
 F3FcRoSush7H4N6VDfUW4vNDVdStH5s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-cx_p3TghMneeIMb5DdrHKA-1; Mon, 06 Sep 2021 12:15:27 -0400
X-MC-Unique: cx_p3TghMneeIMb5DdrHKA-1
Received: by mail-ej1-f72.google.com with SMTP id
 ak17-20020a170906889100b005c5d1e5e707so2486879ejc.16
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 09:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9o//+xgbWBZU75mGw9CeHU5EKtySdAmjKiKyx/wwURE=;
 b=gZpSPmF4qymEEfLNaiO091sMHd4hwAqX8FGm9TR8xFhcvxyIN/zx1vkMwFbaxdtjqB
 8+wuGbUy8vYvFM9mOOwgnKA9DQBs+Qmp9Fc7ocj61DidaqR5ftpXmcZ9HWyejz7vBqFq
 uxfW2bn+YH9TfnC5y1jU8FgUyKvcaXQMg+CK0+C50jzXRHoAXWCR2G45ucPV9oNMJp94
 WUeL6iKUvMVb3hsd/7Lt2hUpfz2nx9hI0x/KPXYzvSNJ8cE5M8QAW64aau4OkQUX2gkO
 HJnrE7CTkykSrzr0uoj4e1f+/oreRFcpX0T1I+kjuPG21OHCeLlGUjD8AGLU4KIWC0CS
 vxjQ==
X-Gm-Message-State: AOAM533bDCH6KfM74k4B4Emvr7hP3fikMMVuG9B0OXqV2ePhu3/s4gKQ
 SGLwdz0oQzTfVpKsubbelcQtAsN2PVjZ+aMAnrizI7VBv3Xh7gqDJQzeNPUb0BElcBK+7HLPU66
 L9Em2ooQZlHxH
X-Received: by 2002:a50:cc4b:: with SMTP id n11mr13946803edi.132.1630944926203; 
 Mon, 06 Sep 2021 09:15:26 -0700 (PDT)
X-Received: by 2002:a50:cc4b:: with SMTP id n11mr13946777edi.132.1630944926014; 
 Mon, 06 Sep 2021 09:15:26 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id h10sm4989585edf.85.2021.09.06.09.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 09:15:25 -0700 (PDT)
Date: Mon, 6 Sep 2021 18:15:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210906161523.4kc5l3usbw6l2s6r@gator.home>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
 <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
 <CAFEAcA9n10wZY5vO1ZpwO-P3u=dV2G4J8j3xtSjzfA5YX0oouQ@mail.gmail.com>
 <342f66ab-5c03-4aa3-b398-1e02926d86f7@huawei.com>
MIME-Version: 1.0
In-Reply-To: <342f66ab-5c03-4aa3-b398-1e02926d86f7@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vi5NJXpFa2D4

On Fri, Sep 03, 2021 at 03:38:13PM +0800, wangyanan (Y) wrote:
> 
> On 2021/9/3 15:25, Peter Maydell wrote:
> > On Fri, 3 Sept 2021 at 08:05, wangyanan (Y) <wangyanan55@huawei.com> wrote:
> > > 
> > > On 2021/9/2 23:56, Peter Maydell wrote:
> > > > On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
> > > > > This new version is based on patch series [1] which introduces some
> > > > > fix and improvement for smp parsing.
> > > > > 
> > > > > Description:
> > > > > Once the view of an accurate virtual cpu topology is provided to guest,
> > > > > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > > > > e.g., the scheduling performance improvement. See Dario Faggioli's
> > > > > research and the related performance tests in [2] for reference.
> > > > > 
> > > > > This patch series introduces cpu topology support for ARM platform.
> > > > > Both cpu-map in DT and ACPI PPTT table are introduced to store the
> > > > > topology information. And we only describe the topology information
> > > > > to 6.2 and newer virt machines, considering compatibility.
> > > > > 
> > > > > patches not yet reviewed: #1 and #3.
> > > > > 
> > > > > [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
> > > > > [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
> > > > > -friend-or-foe-dario-faggioli-suse
> > > > Hi; this series doesn't apply to current head-of-git. Is it
> > > > intended to be based on some other series ?
> > > > 
> > > Yes, it was based on the -smp parsing changes in [1] which hasn't been
> > > picked yet. Given that [1] somehow affects the topology parsing results
> > > which we will describe to guest, I think it may be better that [1] can be
> > > merged first and then this series follows.
> > OK. I'll ignore this for now; please resend once that other series
> > has been accepted.
> Got it.

Also, you'll likely want to rebase on Igor's acpi refactor series[*]

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg822151.html

Thanks,
drew

> 
> Thanks,
> Yanan
> > thanks
> > -- PMM
> > 
> > .
> 

