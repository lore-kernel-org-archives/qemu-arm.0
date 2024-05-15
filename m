Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp759302ejl;
        Wed, 15 May 2024 09:08:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhd1OAqXjBt8PCjvbr+vQN+VlIstiDG6+RhD46kIzlO1cG2Cbl7x3lkD2Q+4EHlFxxADEKbx6yyMigHHuIaHk4dKZvSE+W
X-Google-Smtp-Source: AGHT+IE53E4KZCj4uKuATFMwhcA/fLh78QQv7jsmA6fdH7qusXyej4mm6xrZufHPgybybVKU7vOd
X-Received: by 2002:a05:6214:3387:b0:6a0:8005:2c54 with SMTP id 6a1803df08f44-6a168197361mr182701076d6.25.1715789283045;
        Wed, 15 May 2024 09:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715789283; cv=none;
        d=google.com; s=arc-20160816;
        b=RlUaw0JHMWUAx/hyg6zjru2orXJQaxs+hf/ED9w4nQIysRG1QC6C0hFH4gC9P7PRN/
         UeFtOVimCsxPuMMjSzdmQ/I1kOxbgzkXzuWmszh38p4vhFhfK07p2EtCo5gxq8brixaU
         HqnqWBTqw45bYzYzr2XmjgneoUgrdLPWDtokissK7XsMjLHrhdkvMScnpMukIjg5HUl8
         6pSNiSx9C/dmaycL8CCgVgdhnPcuFgsdTUCQgPo/fvZfmMQ0lMXNmLOd3zKXSQkdMnq1
         UYWmTp09Z9yjyvgrdRoBBmyzETq/qqp6fZAJpvm8jKeJYLURMsDidHXTRPENtpw56nPJ
         lAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=y00VFhqWJNQF+pmKiW1gnxYds4bcdl47ZbEAmoE4lHU=;
        fh=Xf8Zj93FRS9MTIfrL66Kdg8SxnjTT6qP/gkO7hmiaUA=;
        b=w6AqUUTA1QZEx6NYqqXJcRK5OheEpzAGxs1V2PDPZnIr3fdCHFBNNy9amSLqhb9Tmf
         TIz51lLmq0gwv+K03ONI1eTKOvadB5TUn4mRGW2xb3pjnRYpZbljsqljPeVjNYAue0Pn
         q4aCa/L1N5TQ0njXcFRLRy3mkqk9e1lN7yemDbatzN3OBfoojzYr3q187VMGl8nupTEh
         EKEJBpR0KULn6m91eBMpNtcHUQrdhA/Al6w5KAYDPioaoLaj4NcC+Wv7WL4OfXBA2izM
         ShylX3dzTzYfqpwwyY+EBJJvf4KUjrjwVxDY75o0kTs399BReXtfd+DCBD7eXwVwYmxX
         cWJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MWAAKTBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f29a972si143035286d6.232.2024.05.15.09.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 09:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MWAAKTBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7HAb-0005rs-Kx; Wed, 15 May 2024 12:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1s7HAY-0005rW-QM
 for qemu-arm@nongnu.org; Wed, 15 May 2024 12:07:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1s7HAT-0001J7-DT
 for qemu-arm@nongnu.org; Wed, 15 May 2024 12:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715789267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y00VFhqWJNQF+pmKiW1gnxYds4bcdl47ZbEAmoE4lHU=;
 b=MWAAKTBUbgvTtxonaYNM9DPnLD1WMPBJHzbrRz18HsM1hluiJ1a+YHDh4B4TkVTPCgsy5H
 RFY4eAJEb7wuPTB8r1l6R2KNpbXdpd+yeXLxoOdob7Vko2X3ZrgWghg08MUbF77B75gq6z
 s70bEwDep908CJORftxrIRqdr6hdT/I=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-1-GpWu1AMM2x0LiieO323A-1; Wed, 15 May 2024 12:07:46 -0400
X-MC-Unique: 1-GpWu1AMM2x0LiieO323A-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2b9de4a4757so260659a91.1
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 09:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715789265; x=1716394065;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y00VFhqWJNQF+pmKiW1gnxYds4bcdl47ZbEAmoE4lHU=;
 b=R/ClKfCacN0gElLbNrBPmUWnErGDLIVo0P7QSzRUOQTJzy+iMc98yfN11+6pQY5aE1
 z36lb4Bm1HuhKETq3f8JN95kj2sqTIhqAaq6SZEmDnau3mwcreVxuVY+L5OpOLCMk12s
 bdqEtCYZx6J4/mheOk93EurSdCRVRsLDRBdFLarCgjl9j5NVIHY+tbqi951Ra4NmNB1m
 zORi/wBggYhlGFrWABk043xqfhZNRquJvnTciwjizPJvWrUwZoz0yGNkgZneeha6JECm
 YY2D+KAHI1siEE7pZ8p6759VtLlSTsL0GFFNRAbbJmfBJGhcc1F8GjruX/XYzUbYbIQQ
 Jetg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6xWLDticZPKsA6VFX4EWZYNVDWJgWeWpOKJwhc/Z3vLAJDyX1iHc4+DJ0NogubD/gF0uonAKwx/o8lbnxNUeV0uo9
X-Gm-Message-State: AOJu0YzlANj7f6Mlvd//WgVeL+4Sf+SP6didIxrHrcIVgub9SVQ/EtGt
 891KI39dCAozBZHeUZAAqJL5SulCBbPhVYNRNvQub1NzMkwEXERKU/tNCSV5QIWBvdFaUdooP5+
 oERA+jp332x6gaV/ZoUJuHK9cFoNvyO3SrAIT8i+22pZA5YQoMA==
X-Received: by 2002:a17:90a:f10d:b0:2b2:916d:d89b with SMTP id
 98e67ed59e1d1-2b6cb7c7dc7mr15200416a91.0.1715789265094; 
 Wed, 15 May 2024 09:07:45 -0700 (PDT)
X-Received: by 2002:a17:90a:f10d:b0:2b2:916d:d89b with SMTP id
 98e67ed59e1d1-2b6cb7c7dc7mr15200355a91.0.1715789264389; 
 Wed, 15 May 2024 09:07:44 -0700 (PDT)
Received: from x1n ([50.204.89.32]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b67126ad51sm11931271a91.25.2024.05.15.09.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 09:07:43 -0700 (PDT)
Date: Wed, 15 May 2024 10:07:31 -0600
From: Peter Xu <peterx@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 0/5] Fix "virtio-gpu: fix scanout migration post-load"
Message-ID: <ZkTdwyxWcTTMwtAp@x1n>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
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
X-TUID: lDs+MfX8WANZ

On Wed, May 15, 2024 at 06:15:51PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> The aforementioned patch breaks virtio-gpu device migrations for versions
> pre-9.0/9.0, both forwards and backwards. Versioning of `VMS_STRUCT` is more
> complex than it may initially appear, as evidenced in the problematic commit
> dfcf74fa68c ("virtio-gpu: fix scanout migration post-load").
> 
> v2:
>  - use a manual version field test (instead of the more complex struct variant)
> 
> v3:
>  - introduce machine_check_version()
>  - drop the VMSD version, and use machine version field test

Thanks for trying this out already.

Last time I mentioned this may for the long term because I remember Dan and
Thomas were trying to work on some machine deprecation work, and maybe such
things may collapse with that work (and perhaps easier with that work
landed, too?).  Just to copy them both here so we know where we are now, as
I didn't follow that discussion.  IOW, patch 3/4 may need separate review
from outside migration..

The simpler solution is we stick with the customized field and simple fix
to the issue first, then whenever we have that new helper later we simply
use the new helper to replace the old, alongside we can drop the new field
/ property too as long as it is declared with "x-".  Might be easier to
backport too in this case.  Marc-Andre, what do you think?

Thanks,

-- 
Peter Xu

