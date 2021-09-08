Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp280529lfb;
        Wed, 8 Sep 2021 02:52:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB6Yirh69AGE/uBWK8BOR0h04Se9OaFoOYeyFKkmWqgSZY09TGb2SPEYsjHD7JJ3ZaSx5R
X-Received: by 2002:a25:2e42:: with SMTP id b2mr3698383ybn.313.1631094755375;
        Wed, 08 Sep 2021 02:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631094755; cv=none;
        d=google.com; s=arc-20160816;
        b=IEk5yj2LV/464wTUwCpjijUKOzuPYd0OKxHN8jdkzASA+uegkRRB0NtWHqgMRli5hH
         MShmed/UbLgqvD33NhBfcwzLgyXqUktI5NWbk8Vx0Z/vlCQgLS0i7Tt98GnwKQNqHwru
         v2tZaKChNKv6Ukk9bYR137grNVGv0aiB6Uu9tjBtQaNulabzaNwHxmnzpxPZMkHQqf1/
         IQoOJoL3+zlVR51qOMUMm5v2/aBifoUyhJDU7WdmNBolM4FCyPobCgX0qApINF7wr6md
         VNQnYh99RXXelqx3wCWK2Lu2hc/ZUmHgl/gMRa/UIoTh+zmQ8BYV7l1eZP06dQwQo+FF
         FN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=D+FZX8CNVhNycmY+o16ytQAsJXrJRfsi/TksasaSnvk=;
        b=ljPHHIQ8pnRbsWIvGFOnv9QzkGZ7HMigKSmnTckCNg23wL3L1QCViPGkhjKE2cZG2e
         f5pER3xMloEvtzoF7hZnwjBkHqnvfi1HhK72/KygsoBWjVHa3zw+tmaMLUMWV111eure
         iSM0T/FMGMDUsTuP1gu6/nGoOJdqwt4fOu3KwkenMg8a53jsrk768jqy8uQV8RgHKAGY
         FVooOXnfr94zJtbRXe0M/hDAsD1s28CzmVfQlsEO/5wKUxpgFeYKIFASTdqtJrTpPDJA
         uY+rjExjNohUW1e3Arert+hO/lHBg/aECK5FhTBcNG5qJq80ohuLDK6H4Wu4D2eedN+o
         ehUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mHGxnyr1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m206si1589134ybb.25.2021.09.08.02.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Sep 2021 02:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mHGxnyr1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNuFu-0000Bz-O8
	for alex.bennee@linaro.org; Wed, 08 Sep 2021 05:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuDq-0006mO-TS
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:50:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuDp-0007aB-EH
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:50:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q26so2320017wrc.7
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D+FZX8CNVhNycmY+o16ytQAsJXrJRfsi/TksasaSnvk=;
 b=mHGxnyr1ud84QG/7/DRqnmISjj1Y7Yc+K2cun4i8KZe1JaM6I3WslA2ftzMW5oOp9S
 YM5f636taQB1TAkMLTc28r+yTrgL9JvxgSht5F21Eq9X8aKR+onxAwT5mdL4IfpnWJgb
 K+LMuvmR39i2N8PZdsoNoi7rdh7FVbEW7Wyhi+eBstGXUFJMpAbQmGyjpaJSmp7z7Z0m
 KVf2cyUkm8iDpLauYZsyrEXQfXf7Zuxusr6qZ4uERD5a0DuPcUkig9BkPLma077Iu+aZ
 yPx+ShON1VlUGJj8eKS3NAqWzA6JxpbJLRVMt9Q3oeH3LnX1XMUiB9mqONval+VtBDzI
 yd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D+FZX8CNVhNycmY+o16ytQAsJXrJRfsi/TksasaSnvk=;
 b=whDYG7EsTejxrrB62TX/COAe6P0ecY7QbeyXX9TbxaDNJQzTPgfHqfo5aUR0uC5iMU
 Fb1PqNurXlEthjYJTBTCbwGZFo1IBb7k7WvwO1jHPxDKwJFVxmuC15ytUwxl7PXbqu8a
 1BiweVwtcUhzw4FZ7x2vrKWrIiBHVi60ZsmOKXXLuVwPutSpRUrYFT/SNVSPYXIDF7ZH
 u0GVJDbwsPXz8YGAV5VdCHrgKE3etHWyw+A2UR5+lKbRJfxlh6Rzm2ptxgwDM5RhPoYY
 MzsohfYU2E0gPYS1+g146yBE9Bj+L8BXdyImkXxx4mMOhz08Q2+rzXIbKeTMxN9c4ZI2
 nW0g==
X-Gm-Message-State: AOAM533cHRLIPi7qC4Llyq9A97bMJ3E1sprmJaXoCpm3SEK/iI/IbIhD
 z7nzxPzprsS3oXOm3vOP3tjFxA==
X-Received: by 2002:adf:ebcd:: with SMTP id v13mr3036859wrn.400.1631094622942; 
 Wed, 08 Sep 2021 02:50:22 -0700 (PDT)
Received: from larix (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id a9sm1143063wru.27.2021.09.08.02.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:50:22 -0700 (PDT)
Date: Wed, 8 Sep 2021 10:52:32 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 6/8] pc: Add VIOT table for virtio-iommu
Message-ID: <YTiH4LcytYYGh3Hx@larix>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-7-jean-philippe@linaro.org>
 <6b142f58-fa70-2ec9-0df5-9217fa275922@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b142f58-fa70-2ec9-0df5-9217fa275922@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sOjoj3YzsgSz

On Mon, Sep 06, 2021 at 05:02:05PM +0200, Eric Auger wrote:
> Hi jean,
> 
> On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> > The ACPI Virtual I/O Translation table (VIOT) describes the relation
> > between a virtio-iommu and the endpoints it manages. When a virtio-iommu
> > device is instantiated, add a VIOT table.
> 
> As there is no used of pcms->virtio_iommu and virtio_iommu_bdf yet, maybe squash this into next patch?

Agreed

Thanks,
Jean
