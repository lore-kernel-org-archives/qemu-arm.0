Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp446303ejb;
        Thu, 19 Oct 2023 04:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/rQrwFSA/J8Un3+NJbOHrjiFM6CJg7oJmz889wgHabwiuL1mIPsLTE40JdN9C2pTZBK+d
X-Received: by 2002:a05:6214:248d:b0:66d:4018:da9c with SMTP id gi13-20020a056214248d00b0066d4018da9cmr2198901qvb.9.1697715418756;
        Thu, 19 Oct 2023 04:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697715418; cv=none;
        d=google.com; s=arc-20160816;
        b=voqPNRqPEdcAo1fBiYsbmodoI1iv8EvoTmEww7CwiKfo1TuHi5nEC2R940KzLVYv4t
         0iJW1nuUsfyIo5HCBusDFaj/6ttHgDbZ2IAETKoTus59AB+Wy1ffJBgFQ3FYqJYpsGcG
         rRsGjVe1nSODTYDNyO27uhnt7Cajpc9m8mw6XvHX/jiX3BHgcMXN6cBEIA3/cCyUalSc
         egyQCOoBYTm7RmT6H4b1XvPCi2rbMx3SsdQeLJyo3kYspukY55VemMhCfMciBlJt4YeP
         VGYNxNtdgRviyh4rlqmr3Jze9lKn2LXOeS8UzIJXieTGSSfaTRLSFyKuyGLuSWEf9DEU
         SnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=QsiiIgVEUL3UGVOMVNFEQRH2cM2Q62VYmh37DytOtz0=;
        fh=scZWDXowUYFdQSwcZp9w/lUN4nNoJhM0FVXd0GLDzWg=;
        b=YI9rVJhxR6A458xMIAi7uWjls+TerX0JYyTviRkGYqoOaT0hdSofz9RQtBY1x44+lL
         EXxuhComUz4/JE5Li74hszC5jqGX6NClwCmLAaLYI1GAindxczcaOM/bfVa5r7aQZ1tv
         59Iebtdjj+9C7cBDwVLD4xwDsXRHpAoQYLY6M364ZXScW3KFP3Eehw3u7GNcjNVYvduy
         77UrIWr7OEzUHcLhs4OLG6LOpqkxKZTaUz3SCVJC5YKyMv+3VjI0+1K7KiI0tvNLmaC4
         2cz2ETtsVSSWgdzo1vL1kELsv1W4YyINjhPHbLfqDlevfu2eOUI7cgTTxV8+RToXTh6Q
         /BUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xdzxzk8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020a056214071000b0066d1b4ce85bsi1380819qvz.532.2023.10.19.04.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 04:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xdzxzk8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtR4m-0002wT-QO; Thu, 19 Oct 2023 07:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qtR4l-0002vb-8S
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 07:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qtR4j-00073f-Nj
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 07:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697714425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QsiiIgVEUL3UGVOMVNFEQRH2cM2Q62VYmh37DytOtz0=;
 b=Xdzxzk8cz5pbCdzuNFsycbdq9VhPqnFKCnlqemy5pO/eVQ8hS4mtYPZONLkLqKB5ZhtYWZ
 ZMoat9/AIf9+pPLBLh4U6p71tmb8Pj23tAOcOzm6TZxcBStPOkOtzHNDujjo3vZNP6ht2Z
 I4N7HyweQWyATQLU9jWdppCHI09+970=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-FnbdUGZgMduN9WBOYNkYow-1; Thu, 19 Oct 2023 07:20:19 -0400
X-MC-Unique: FnbdUGZgMduN9WBOYNkYow-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-408374a3d6bso13521815e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 04:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697714418; x=1698319218;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QsiiIgVEUL3UGVOMVNFEQRH2cM2Q62VYmh37DytOtz0=;
 b=qmF6QKbDOF9EnFueOzF9qmxfAJz8gMi94AUsCH3IM3QzzhQg88b3xCv/xu30mTRCcb
 YVUGvsYOEhM4UuZ69mqJOD3aS36VnqHr6FeFjg84oClsOBEmMGmARqqrQ3BkivQjWgAW
 xrHVjI6bqywAU74J+zMut1IJWL1dwK6iCx98pgltjoL8t6Q6h6LF/TM08UWYG4XpJ6KJ
 Ak0CyOhq8tQks1D9JlCQ7JRyw6BHYL0XriVBpH1gcEsPeR1HALkmln+qts/Am0iCfsMI
 odHt1Xb3iVLtJbzkue1K2nUaT5BdV4OK2YN0ojiskP28/kgQib/ppX8vLfVln6V6UEA5
 9t7A==
X-Gm-Message-State: AOJu0YwPCra6sU9QgVxHTn2Idn9Nd3IwJrCrXRazE+ZbOWPmNUZUJswq
 P73Zm+3ZKH+VSQBbbHJ6Y39uBzq5TM6jS0Y1FBwOfcocYwKLyAh5Cf8Dtr/caYCj8jZZGrUY+eg
 2zSnt5te2/b8m
X-Received: by 2002:adf:cf0f:0:b0:32d:96a7:954c with SMTP id
 o15-20020adfcf0f000000b0032d96a7954cmr1339439wrj.45.1697714417892; 
 Thu, 19 Oct 2023 04:20:17 -0700 (PDT)
X-Received: by 2002:adf:cf0f:0:b0:32d:96a7:954c with SMTP id
 o15-20020adfcf0f000000b0032d96a7954cmr1339424wrj.45.1697714417596; 
 Thu, 19 Oct 2023 04:20:17 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f2:2037:f34:d61b:7da0:a7be])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a5d4f91000000b0032d72f48555sm4240119wru.36.2023.10.19.04.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 04:20:17 -0700 (PDT)
Date: Thu, 19 Oct 2023 07:20:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org, zhenzhong.duan@intel.com,
 yi.l.liu@intel.com
Subject: Re: [PATCH v3 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
Message-ID: <20231019072002-mutt-send-email-mst@kernel.org>
References: <20231011175516.541374-1-eric.auger@redhat.com>
 <20231018093723-mutt-send-email-mst@kernel.org>
 <9ddc3f2e-8be7-4e03-bf9f-3ac930650a52@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9ddc3f2e-8be7-4e03-bf9f-3ac930650a52@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TicfLOB/ExDX

On Thu, Oct 19, 2023 at 01:07:41PM +0200, Cédric Le Goater wrote:
> On 10/18/23 15:37, Michael S. Tsirkin wrote:
> > On Wed, Oct 11, 2023 at 07:52:16PM +0200, Eric Auger wrote:
> > > This applies on top of vfio-next:
> > > https://github.com/legoater/qemu/, vfio-next branch
> > 
> > virtio things make sense
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > let me know how you want to merge all this.
> 
> Michael,
> 
> I will grab the series if that's OK.

fine by me

> Thanks,
> 
> C.

