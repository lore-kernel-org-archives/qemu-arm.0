Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1292427lfo;
        Fri, 29 Jan 2021 08:58:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzlP0mzoTF/LjMjpNNClGKY1fnYrq3X7byyYSbYSmEeXSGygDBz/O3Xjk4myGIGyMWH27A
X-Received: by 2002:a25:af42:: with SMTP id c2mr7071713ybj.516.1611939501930;
        Fri, 29 Jan 2021 08:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611939501; cv=none;
        d=google.com; s=arc-20160816;
        b=Z1FrgCxrFaS2kUhK2JFNFINAA6vaNJ+oWqeRQu+w1/QTv1upmJeUeCmwlQN3I6p8Yb
         kIO66MFrlc56F+0ZB42aRcHPkX/xtSpJhxF9UCoEiS+3ENotYa9c49LMhsPShTGfQ3/F
         W+clIxMUbreFthN5ccwFHmemjxPLNirziNceDnhpwomxXlsvUAtH4+ToeDlE6ut5xrwe
         rJosjpmS+kFmSem8jZhYJhgmPYcdZOFDFc4YSut/spONM0P04gioH7oga3VHryJ05uff
         IFSEmD5S/myfgXfKUDMBnTBUYLEBlbbe0c9KQhK0VCBPzIFCsQ1Tr0egoYtuhKSryPKl
         4zvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=EPVxtxHxIUq9zEdlN142XeBBUBWg/58YUqpF6UM0V5Y=;
        b=DU70GTbHf/pi9b8TA2n9iISgIc6MA4f/tpPAxNct7X6NUQinHHPvf64SRRp82/85YB
         /80m4cHiSATM+ND9CROPEkAWVc4XvhyL5UT8B1ZqGgyP3n3A95WKIYznooeBJ3KGOu/I
         u9FiTTneZ2m5BvLyJbX3xn1KgUwtYi3zWzKTabN1WaOLDHOHFYJw74aw+11sSc7j7fTv
         pKnUC80vnZAMduyFcD7JhFJJkUr7axE7nBJ8wEHIi6dz08UABP0jQjewY6iiwS6VSh7Y
         SuOObnxFRa6eOlzTfjSG8H2f355kASXkstdLW7O7HbVnhrUtAsPtS84DHFxbj7zAILf5
         LD+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=azCgDM2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24si10646455ybd.456.2021.01.29.08.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 08:58:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=azCgDM2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5X6D-0006OO-8y
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 11:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l5Ww4-0007PD-P6
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 11:47:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l5Ww0-0005qk-Vt
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 11:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611938867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPVxtxHxIUq9zEdlN142XeBBUBWg/58YUqpF6UM0V5Y=;
 b=azCgDM2KPdQiD1KdPIE3AJG8yOnGvcB2wzlO08mW9k/K42ZPmCwfEW+cg+pQtQe3zshl3f
 Cqa//RBLizsUFs6nAjP1ZFQkoiJmtaZrs6jCKM/bnrZnYRi6BrnfMJ4xG9m5zF23pVV22L
 5xvsZXU7jUa+xyUrZldBLYKwEU+3Xes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-uvyfzPXDOL6tZkkSs8luFQ-1; Fri, 29 Jan 2021 11:47:45 -0500
X-MC-Unique: uvyfzPXDOL6tZkkSs8luFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 609D08030A7;
 Fri, 29 Jan 2021 16:47:43 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C8035C1B4;
 Fri, 29 Jan 2021 16:47:36 +0000 (UTC)
Date: Fri, 29 Jan 2021 09:47:36 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
Message-ID: <20210129094736.230023cc@omen.home.shazbot.org>
In-Reply-To: <d6825e67-3533-ab81-abdb-16c2ab71cfe7@redhat.com>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
 <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
 <20210128200223.GJ2951@work-vm>
 <d6825e67-3533-ab81-abdb-16c2ab71cfe7@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 jiangkunkun@huawei.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FoYFpTO7cBvQ

On Fri, 29 Jan 2021 08:49:53 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 28/01/21 21:02, Dr. David Alan Gilbert wrote:
> > * Paolo Bonzini (pbonzini@redhat.com) wrote:  
> >> On 11/01/21 08:34, Keqian Zhu wrote:  
> >>> +static void vfio_listener_log_start(MemoryListener *listener,
> >>> +                                    MemoryRegionSection *section,
> >>> +                                    int old, int new)
> >>> +{
> >>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> >>> +
> >>> +    vfio_set_dirty_page_tracking(container, true);
> >>> +}  
> >>
> >> This would enable dirty page tracking also just for having a framebuffer
> >> (DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also be
> >> more heavyweight than expected.  
> > 
> > Wouldn't that only happen on emulated video devices?  
> 
> Yes, but still it's not impossible to have both an emulated VGA and an 
> assigned GPU or vGPU.

In fact, that's often the recommended configuration, particularly for
vGPU where we don't have a vBIOS.  Thanks,

Alex

