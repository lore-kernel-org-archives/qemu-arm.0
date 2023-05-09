Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2721802ejq;
        Tue, 9 May 2023 06:30:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/QSXMAI7X3rSDf9fVU0U6FY+pUbwwJ5zLAq9jzrdYRX5G28vOhLpQGXSlTP8LlwJTlpW+
X-Received: by 2002:a05:6214:29ea:b0:5ef:5049:f49a with SMTP id jv10-20020a05621429ea00b005ef5049f49amr20715811qvb.32.1683639008385;
        Tue, 09 May 2023 06:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683639008; cv=none;
        d=google.com; s=arc-20160816;
        b=vIPm8IIBH2bzceAIyXh8nC3k6YT8uahMb1TyEnLiQumjlYWka2grF76i9GfzZk4utI
         ZLudhuyu93Z3KcueSNRFwQchAe7T4uOruu7Tz//hrXQyhaHQfnmV3bEjrJrl00xLJ+Ab
         3rHK+ZuYwxl1yUlhv++utxGbY7r7CYKboiPg3/ks7oAtR7U+0A6Igl6Cg2Mh22hUCtU4
         RXxhZurfCTXEl8t2BgVjfeK8aOsPIclMVehA4tmbJB4QT+psfZuLOo/XxCPTYEQBPO5E
         GsxLtGQZv4N8WKDs9daJTBNB1LBdFxamlCsC+LIz94QDSgekZ5XWVE2+d16Br+/DVhjQ
         oVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=29OFH2CreJKYkMUAMtHXYKr7NjIyYCgIoTC84mE9uhE=;
        b=js6m+TscfG56eUzmZymqZ96NrNDyjiW7SoJDqY3i1M7iLievaj/MgKrxqdBFDiHElp
         8IKa7IXOX8uN8ocnyzG+ZutksuF2EDFv3Q2k4d67gjUsMtQOu7Q7BcL6fZ91/TALPbXE
         iGDgJD326bBDHQJTfQcenRqugL8KIe+bncw6q4HqL9feA972Yvabz0VcRFwX4n647c3g
         dgvu5tlr6kcg5YBusmbt62a2BQy3rxWYvRLN4r5g6TOPrZ5sYv3KDmwYxVd25XWem7dt
         7wHbTa7xvEZ887nsftGVcIrHg8g4ve+3+Nx4AKEw9eLN7YqaLDfkigyztpNyxnMO3l65
         rh7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EQ91nmJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a0562140d4900b0061b7d3611a6si886900qvr.468.2023.05.09.06.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 06:30:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EQ91nmJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwNPm-0002NK-9k; Tue, 09 May 2023 09:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pwNPl-0002Ma-5G
 for qemu-arm@nongnu.org; Tue, 09 May 2023 09:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pwNPj-00018r-OU
 for qemu-arm@nongnu.org; Tue, 09 May 2023 09:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683638998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=29OFH2CreJKYkMUAMtHXYKr7NjIyYCgIoTC84mE9uhE=;
 b=EQ91nmJOSqpjiJbQLu4DgClJQXsyB1Lq6iAolGgQq7AeVXG9oBjqxxdQAOM3mZdi72Wh4/
 dhfBDNTsl5mPc7DfBAHigxHsT+yA8pnOal8wnnH0gkfii6LZI7Kr71GDA4pSjAZEL3LceC
 y/h58t/Zn9lXwnwwOHQCQIAJnhPKNn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-FkYfTupSPw6dwh1CHMCSTg-1; Tue, 09 May 2023 09:29:56 -0400
X-MC-Unique: FkYfTupSPw6dwh1CHMCSTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 535F2885621;
 Tue,  9 May 2023 13:29:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D241CC164E7;
 Tue,  9 May 2023 13:29:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6710518000A6; Tue,  9 May 2023 15:29:52 +0200 (CEST)
Date: Tue, 9 May 2023 15:29:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>, qemu-arm@nongnu.org, 
 rad@semihalf.com, quic_llindhol@quicinc.com, 
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
Message-ID: <e4ljd7cckcoe5s3cphztjjqacswssjkap3l3dtre22rtew64kq@cbo7oi7s4wow>
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
 <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA-jZBiSL8vNzgcwUT2Lqtgf9JyyaQx7kD4j=Tc9neD_OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-jZBiSL8vNzgcwUT2Lqtgf9JyyaQx7kD4j=Tc9neD_OQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GoqoxAPd8bEI

  Hi,

> Gerd, is there a particular reason our EHCI controller only
> claims to be able to do 32-bit DMA ? Should we give it a QOM
> property so boards that only have RAM above the 4GB mark can
> use it ? (Would the x86 PC benefit from allowing >4GB DMA?)

Can be done, but it's more complex than just a property.  All
the EHCI descriptors exist in two variants, one for 32bit and
one for 64bit.  The current code base only supports the 32bit
versions.

Alternatives:
  (a) use an iommu to map 32bit to 64bit dma addresses.
  (b) use xhci instead of ehci.

I'd recommend (b) as the xhci hardware design is much more
virtualization-friendly.

take care,
  Gerd

