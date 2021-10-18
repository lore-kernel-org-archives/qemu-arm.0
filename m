Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3129579lfc;
        Mon, 18 Oct 2021 08:26:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx91PXLXMgVFAKjcp+pHC/I/YVkWDrnjgzFGRB+1jcui0lyKoPW4LFYRBIa9kVh1GAUnsPs
X-Received: by 2002:a67:c390:: with SMTP id s16mr28284596vsj.49.1634570813776;
        Mon, 18 Oct 2021 08:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634570813; cv=none;
        d=google.com; s=arc-20160816;
        b=DTs2UpcN1xLMDrkAP+36vk1C4d5EenqYTg927/B/o1jH2uypiy7oOtLWEnkhHOueX8
         5VCK9oCkinJxVP2t4HHnsDpvq9Qxs2tAAf9btYFMTnj1jW10n15ScQzfhdWIZ4Qx1A+i
         71zFg990O/6c5QyjXzeQsRCPJe9jUCIr3gpxyhf4mYXrM+cpmwBAIbjatl/LZ3VrJ+u1
         /W2QF08p2j7y4wUejp5bIEF9NOz2D4Bfqh98ZTBrvmUB+5kf4SQkIT+69VjuV5y2Evyy
         MWoNtm/x1DEJSf2XR1hoW+NUFFYOUCcH1pt6Z2ZIjzGfqAfBwBrorNGQlO/FwMv/jXZM
         w5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xIWL4gw75z/31Kco/UibJtQJEwYlQTPu1W9xvV6aXhU=;
        b=PDkwgZ9oIqvlClNhWGa6FuFOjCO8JNHzwi0UDPF2jRHqnjmyEHhYqqbvYU1cUzpaf1
         Uzbxx9NlSWB1cj7XjU7Za4j1CYTcuF4YB9BmxceR3gHY0hCvkxKEDWDOe6X3l21to1OB
         IDwyLsWefqzzttiN0t343qWWwJgb1rEshkHw42cQ3NHsGzhjxQvHIFWVHIej+/jFSXjR
         cqGiUb5owdKAQYnf14ywcjj3DvUDfzBmRTq7swqzu0vjYLYOOzAPq9BFqIgZN+x60kUY
         5H0S7cblkhIKpFb/pLa8JYN00W2ckaRuDsGN4OM0uc50lMq0mkP7M+v4HmIQZBLSu3Ns
         chcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C45s9gxd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d25si11324449vsl.445.2021.10.18.08.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 08:26:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C45s9gxd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcUXN-0000wz-3n
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 11:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcUVp-0000ve-Qt
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 11:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcUVm-0004T1-Sq
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 11:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634570713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xIWL4gw75z/31Kco/UibJtQJEwYlQTPu1W9xvV6aXhU=;
 b=C45s9gxd8NfeZPuwLFQ6nN1VMuNqktnAzrRUjCy6a4Xx1KAQL7/tETLAc0+JfIshKvFEcD
 Oh7R26mNXbyjlX4Hwoe1ET4SqZyaAkzThLjVQAk7YfmhPhQrxyCvNdsphlwh5VSJsI9XXq
 tk1Kijbi7EzFTBoSVNbF2AVsbmOPFdc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394--St2a2pXOyeVEyiqOVqVlA-1; Mon, 18 Oct 2021 11:25:11 -0400
X-MC-Unique: -St2a2pXOyeVEyiqOVqVlA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso8920930wrr.15
 for <qemu-arm@nongnu.org>; Mon, 18 Oct 2021 08:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xIWL4gw75z/31Kco/UibJtQJEwYlQTPu1W9xvV6aXhU=;
 b=NabC5+6OjHfd8WiBi9TZ7J7Yf9uPWr9dVuB1L7I2I0RLVyOvHBF43mbtE46ZGsD+0f
 SUWMba0fv4zCtCNj7R6FHArR7WANuSjhWPUEULyh0w6gOOPf/0x+O4i12X/s5+L8iQPj
 8J4sHY/mZHGishyJE/PiLINhAbew6VB3ZMHC5ehJAV1/MnKrr3M650DAq71KGE/Q7g4Z
 xGOh+Z1Fd+ukgeH0/JlW5UibKR4aBzxEt+34HBjmrEL/hoYN5ITzfn8MW9eVM1YoKmtz
 ohiE/4MhDMiWz6RVpo9Q60z3nwH1ryidCLLmVPWmcrGcwuqBoNCf7X3unXHH5xgER1kD
 udIw==
X-Gm-Message-State: AOAM531EEKETTZVPpXfrWVDnNUd4vWh8H4whhfEVfEJputuNrN3YNy8Q
 F+ykd/Buxr/Qcap6FCZDBDmFIzs1/gPoO6CcMhPRByD3mrk+ekk9qVLjHUYhr3zT9euEDm2kTAC
 lF2phg0r8SouJ
X-Received: by 2002:a1c:f008:: with SMTP id a8mr45076829wmb.140.1634570710694; 
 Mon, 18 Oct 2021 08:25:10 -0700 (PDT)
X-Received: by 2002:a1c:f008:: with SMTP id a8mr45076785wmb.140.1634570710397; 
 Mon, 18 Oct 2021 08:25:10 -0700 (PDT)
Received: from redhat.com ([2.55.19.190])
 by smtp.gmail.com with ESMTPSA id f20sm2033566wmq.38.2021.10.18.08.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:25:09 -0700 (PDT)
Date: Mon, 18 Oct 2021 11:25:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Message-ID: <20211018112402-mutt-send-email-mst@kernel.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org>
 <YWBhEQxM4wRyZWzs@myrica>
MIME-Version: 1.0
In-Reply-To: <YWBhEQxM4wRyZWzs@myrica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, imammedo@redhat.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a7hl1CU+J5Fk

On Fri, Oct 08, 2021 at 04:17:37PM +0100, Jean-Philippe Brucker wrote:
> On Tue, Oct 05, 2021 at 11:45:42AM -0400, Michael S. Tsirkin wrote:
> > Looks like this can not be applied yet because the bypass bit
> > isn't in yet. what's up with that?
> 
> The boot-bypass bit isn't a hard dependency for this series, but it will
> be needed for full support eventually. It will be delayed by spec and
> Linux header changes
> 
> In the meantime we can work around the problem by having the boot disks
> bypass the IOMMU (virtio without iommu-platform, or iommu-bypass bus).
> 
> Thanks,
> Jean

OK... how do we want to apply all this?
If my tree I either need ack from an ARM maintainers, or
post a partial patchset with just x86 bits.

-- 
MST

