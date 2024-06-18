Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1058652ejb;
        Tue, 18 Jun 2024 14:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhaJZ2rSrenpOMbKWScGIwqJFlFmI7ts99P0ccutAGg6yh+4NvHiDfQvJ6O8SvdpYwLZyT1rOSCCD3xwSHmV29DWKHwUNp
X-Google-Smtp-Source: AGHT+IH6HW8O65EAmqyy2nq1cGr2TOgGxt1Qp1a6H5LjG3ygWQ21aA/jKh5hqMYdoW8xwl4mXxPD
X-Received: by 2002:a05:622a:1ba3:b0:43f:ed30:bdd3 with SMTP id d75a77b69052e-444a7a841f7mr10336151cf.59.1718746513919;
        Tue, 18 Jun 2024 14:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718746513; cv=none;
        d=google.com; s=arc-20160816;
        b=aM0Wqvxsb6yph4BfYMXCWeGHjKSHRuxImH0WjSPy/lesM1Fy7ftZEW3glfpdHrflEk
         NGkZAnStymXjHxux5gb9Y6+yPse/T8bxpOMe+CIikrLe7H/wb/ctAy0QTd1DvQ+oyl8n
         lkuIzCrNaWxSx9b6hs8GKowq0+EQYEIKUmbWMHRRtqICFZ2n1maH8v+gN02rVFiV+zYT
         Skk6eFUiP/4wjJOkP1VAiUozc3PCtTvyw76l0xvnupFq9dEzr09djQH0bjAaC5pXA5w0
         dBqisioK1A1K1x1bDWaEo5FFCxErD4dV+6vi3LlmSdU+ih2MG4oJdXIMEu7ke7op1Z2/
         mmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=tE+y97XjeYUfKcRWRfZSEd+rIxwx/BjPMRUmQb3/emk=;
        fh=Kxvqu0QJ26Bt1Y8oa7+7mB/Q5yBL2Z8gc2VRf45Tt+Y=;
        b=BhDgSUuDjaUTYAfnsXWofoqbz6lmkF9CX8qYYWQZFtPaN6L5nKBQz9gwv6zvv5jGrz
         zC4z30r+RtCYfMJ4V5rDu1v3y+gR6uBDOx6yaXdKt6gA0dUgV/GMth1v9/cP4Wm7Vh2Y
         V0XOd/Vvxs9IKkkI2aH3zV+Ei9+ErbbMbKKTavf7K44woZC7tWWr0AHrzq1rk62HzJtK
         B64baS7w1LF95TFWhBedPoShQ6PJB+f7z+mzvPogDN2OXxF8rMxht6QrlOaC4bHlRhQb
         B3r+3BreEA2n/aYx0psOVp6kOYPZ2Jn336VXoPi91Nvr6yvrbllTzPlk8fQjGCuMug6Y
         dcuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bSTNt83s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f30f8f37si123865181cf.684.2024.06.18.14.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 14:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bSTNt83s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJgTY-0001cY-8W; Tue, 18 Jun 2024 17:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJgTX-0001cM-CF
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 17:34:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJgTV-0005T2-IZ
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 17:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718746484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tE+y97XjeYUfKcRWRfZSEd+rIxwx/BjPMRUmQb3/emk=;
 b=bSTNt83sD4WrtWNVwqNH6Cg0y3GtHrhH8bWCwnhmDbmq9zPDCWX1A2wcaOAW+XVs8P2mA9
 fwS6/Ljqizz+Ur1lS3WqVolQGQRr3OWUMVZ0D4j8l5xpsGjcV2kCF162lNqrENfQ6cy1Mg
 GUlCROR0hmTeBw5wwnzf95mEOlkGyyQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-B1xOK8ViMfyTvf4Lomutuw-1; Tue, 18 Jun 2024 17:34:42 -0400
X-MC-Unique: B1xOK8ViMfyTvf4Lomutuw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-422a0f21366so45273675e9.1
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 14:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746481; x=1719351281;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tE+y97XjeYUfKcRWRfZSEd+rIxwx/BjPMRUmQb3/emk=;
 b=NuAr/FKl+po4CXiW5oluI8E39BVr2bBTp3CbzSIsR957us9+NrFvk6DUMxgMe3MpK1
 0sG+aX/D0H0MmXPo2ovohhpQw3u31kn5mYk8x1BTGhbuVkT4wtq+cCnbZvvWHWrhkylB
 X/Obq60rMLnvZgoJKYanrDHgviV5EEQscjDhbL3or6MNqhdT53V3Hq4mu3bOGeRLUXos
 oYAeRMlqdHoptevilq9VmG0CeWpRK/REJVcz/m30T3F83WnsTe0r+SwV4L/3YF4miG4U
 GrFKK2U+h3XMloyn9lsJF7Fn9MtSDPlwOIGFqU0iIea/kzl1/KI79k/Yv+Ip7l3E1KbA
 6NDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/mlR9HpZFurO8vHUHdo3LtEbvVxwU5CitgpowSCsE0Kc73Ls1hw9Bl51TNHiFbzMkUP0lSlQ3lRMQbuMlroBIB7Nm
X-Gm-Message-State: AOJu0YxxH2Drq2wEKdF+q/Y2g5EGVY7IZm/9PwlPOPc0KxM3looulqfo
 ZReZKKpPaEGq9Tw5ZHW3h0rDbTF0ebozs+IlROvahb2qJzuKnP5jrDHtRrU5F9ViuMjvMBPJSY3
 Nr0C7EYjsTX9jLMhvnnWKiCbV/k7TFa7c3t0ElQrm9SbBhncwtg==
X-Received: by 2002:a05:600c:4f41:b0:421:cbb8:ca7d with SMTP id
 5b1f17b1804b1-4247529b36cmr4740505e9.37.1718746481179; 
 Tue, 18 Jun 2024 14:34:41 -0700 (PDT)
X-Received: by 2002:a05:600c:4f41:b0:421:cbb8:ca7d with SMTP id
 5b1f17b1804b1-4247529b36cmr4740355e9.37.1718746480595; 
 Tue, 18 Jun 2024 14:34:40 -0700 (PDT)
Received: from redhat.com ([2.52.128.219]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c906sm15184489f8f.39.2024.06.18.14.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:34:39 -0700 (PDT)
Date: Tue, 18 Jun 2024 17:34:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: peter.maydell@linaro.org, wangxingang5@huawei.com,
 shannon.zhaosl@gmail.com, imammedo@redhat.com, anisinha@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3] hw/arm/virt-acpi-build: Fix id_count in
 build_iort_id_mapping
Message-ID: <20240618173233-mutt-send-email-mst@kernel.org>
References: <20240618211110.922809-1-nicolinc@nvidia.com>
 <20240618171311-mutt-send-email-mst@kernel.org>
 <ZnH53Qaqp5+Xo1jo@Asurada-Nvidia>
MIME-Version: 1.0
In-Reply-To: <ZnH53Qaqp5+Xo1jo@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: akfjEU3a4Cs9

On Tue, Jun 18, 2024 at 02:19:25PM -0700, Nicolin Chen wrote:
> On Tue, Jun 18, 2024 at 05:14:32PM -0400, Michael S. Tsirkin wrote:
> > > @@ -306,8 +314,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > >          }
> > >
> > >          /* Append the last RC -> ITS ID mapping */
> > > -        if (next_range.input_base < 0xFFFF) {
> > > -            next_range.id_count = 0xFFFF - next_range.input_base;
> > > +        if (next_range.input_base < 0x10000) {
> > > +            next_range.id_count = 0x10000 - next_range.input_base;
> > >              g_array_append_val(its_idmaps, next_range);
> > >          }
> > 
> > A change of logic here - I think the new one is right and old
> > one was wrong, actually. Right?
> 
> Sorry, I don't quite follow that question...
> 
> Doesn't a patch correct an old wrong one to a new right one?
> 
> Thanks
> Nicolin


So if base is 0xFFFF what should happen? I think previously we
skipped an entry and that is wrong. So that's another latent
bug this patch fixes then?
Worth documenting in the commit log too.

-- 
MST

