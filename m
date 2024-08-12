Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp752400njh;
        Mon, 12 Aug 2024 05:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtGbaWUDGbbKEdRlRaBQyc8r30wHqFjs5bdAHqcO4FQYRqpxz2jXv5u0Xyf4xzQLTSpBS7S/Gtfa9Rvqa0ScVuNY7QleL4
X-Google-Smtp-Source: AGHT+IGB8yrg45CJXDvehVifDF2CQnRliEgfb/b1GOeTonx2JHnrGJK1Dy8DdUo3HJdzSQP6KGps
X-Received: by 2002:a05:622a:4010:b0:44e:3784:7d77 with SMTP id d75a77b69052e-4534988f931mr2020191cf.4.1723465190285;
        Mon, 12 Aug 2024 05:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723465190; cv=none;
        d=google.com; s=arc-20160816;
        b=NIbs4PpeHVCTzWQP2G3q0nvngPxm8oZ7MJUErlKJnn5vFxPjG3wPuULxxNTZPM4o78
         PpMNMdg0rVcQAvCa4PJr/+nO2sfFM3gz/rJ/YaTpvMLW//9tC9nGGCJehdJYzhNnXnXA
         9k92xyuOJ0kcIetLYfQrjnW9tEN6P0/bkts5y7E3YXHBwOF4qOHuasMggaAaw9D92P79
         tN2PKbN21X25oONdw6suf//85CAf3BO0LauiZ3BDM5ta0Y/MMkUeRzNwaM9e8FgSyOl8
         1KjK0QHiARWf01wSSH4915dkH3H9lmGFrNYZoWKKg79obj7v1MXVG6HuDIDBYGtIj0uU
         GsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=O+qGtt7DecWsaYa078rnNColEwnmTfR+FwPF62fWUwI=;
        fh=GbsopogC8sL8eTXuWXrtnsDGOjLF/49bUGF3mQtqWGo=;
        b=Cy0HKs+q88+uGca2YzrAZ+1xyL6khb6SAfcfjcmyOpJr1fGhvI4s0RHZbBzQwLRUEu
         u7kO+4f5NgTE7ClDxqBjH5IWa4ojaYvaoKEoxXpm9cS9Pw9KW+/hBJJuJZX8ONG7BySR
         gNROZpu4WXumghv5rJnUkLbSW3c2gr9Kp0qmzUCah+JFz0zca5UU9CaFuM/Zs+1uMrF9
         /uDmlAgQAIewg3MPoJqYxSnZxPlY/u05rQ1lP3OUJPas5Akw2mColmJ3fodVaCnirRtY
         UxRn+8WFdUSU4zErV5vgBzeugLxbfMZrNj8BCppUr6wE2YlflaJ22O9fC0VTAJXpuKj3
         4Ulg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="S75/7K3s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c289014si56466421cf.439.2024.08.12.05.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2024 05:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="S75/7K3s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdU1T-0001HU-7F; Mon, 12 Aug 2024 08:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sdU0c-0000pX-OC
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 08:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sdU0Z-0005Ct-RD
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 08:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723465122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+qGtt7DecWsaYa078rnNColEwnmTfR+FwPF62fWUwI=;
 b=S75/7K3sN4ZRc1NY/MlvbgkQb2lezMDEgRDDcr+Rh322YrYD8DSqBfToOLE353Kv4keofc
 2SqaWqjG7CN0GnEO2xGrIvG3tKHFry832693pkvT7UtgVQyT9yVlS7s2yKP+Tm7/q0++NM
 9wKLyVW3gKh7Jo1G/vb/3Kfd7y9rBDw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-BoLCObYcNLqD_jqjExyl8Q-1; Mon, 12 Aug 2024 08:18:40 -0400
X-MC-Unique: BoLCObYcNLqD_jqjExyl8Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-368374dc565so1829364f8f.2
 for <qemu-arm@nongnu.org>; Mon, 12 Aug 2024 05:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723465119; x=1724069919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+qGtt7DecWsaYa078rnNColEwnmTfR+FwPF62fWUwI=;
 b=aZ4CHDQbPGvcjxd1yeBmPjBPd2h5cpz4vmQ9CI1qFCTW+ShxfIhlwCFC6ANjsmMZD6
 C2A3FaeSIlEnLIkjkBdcSYjiobmJYTJsnaKtAmmry5uSUQQipO2SsLs39eW7eEjVoW2B
 fMvTywLtkNGuSdsi2W9hO1vs3ERztLFnoePjSdEeloNkLZkC7TRa4+SFOOEjPcndtYTe
 Go0btehqHu8Ij1BBltaaCI5UIkl3ftY5PVf+8zNbTJjMn8VmpypTATKUnZL7OOz/32Jh
 tzkLgZTOE0pIPIgzXeEplgUtw7fXSG1niWQtQLpI8G1EeEGyJ4TbIFb0T3JbaVTHa0xN
 OpbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUDGHIDck5PYgo05AoaciyBmF57772M9vUqPcb5Bcn1ByT3Gwlnq+DS5+7KiO5GWH1He78e56V+SQU6vLAVqmc+Ujl
X-Gm-Message-State: AOJu0YwVFkJ+B0Ltz0zK2NhnA98IBvc6gL7RqcG+JjyZ9N+cl29kKS+D
 nPCPqYAnqB3ehcvL8Yq1Wsw5vrsdf1yvqdEoA67aXZc/67nIl42RAmDutP1JQOUqCT70O2PuN3j
 tHElvsm9SPDHxaMkwAYz1uw9+gERG5FmFGpi+6Ky60ld3GtaeLA==
X-Received: by 2002:adf:e648:0:b0:367:8fc3:a25b with SMTP id
 ffacd0b85a97d-3716cd24da5mr85356f8f.42.1723465119517; 
 Mon, 12 Aug 2024 05:18:39 -0700 (PDT)
X-Received: by 2002:adf:e648:0:b0:367:8fc3:a25b with SMTP id
 ffacd0b85a97d-3716cd24da5mr85335f8f.42.1723465119006; 
 Mon, 12 Aug 2024 05:18:39 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c751b021sm101318075e9.21.2024.08.12.05.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 05:18:37 -0700 (PDT)
Date: Mon, 12 Aug 2024 14:18:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 00/10] Add ACPI CPER firmware first error injection
 on ARM emulation
Message-ID: <20240812141835.50749f0e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240808145735.70f81f76@foz.lan>
References: <cover.1723119423.git.mchehab+huawei@kernel.org>
 <20240808145735.70f81f76@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.126,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: /k71nERB2EMu

On Thu, 8 Aug 2024 14:57:35 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Thu,  8 Aug 2024 14:26:26 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > v6:
> > - PNP0C33 device creation moved to aml-build.c;
> > - acpi_ghes record functions now use ACPI notify parameter,
> >   instead of source ID;
> > - the number of source IDs is now automatically calculated;
> > - some code cleanups and function/var renames;
> > - some fixes and cleanups at the error injection script;
> > - ghes cper stub now produces an error if cper JSON is not compiled;
> > - Offset calculation logic for GHES was refactored;
> > - Updated documentation to reflect the GHES allocated size;
> > - Added a x-mpidr object for QOM usage;
> > - Added a patch making usage of x-mpidr field at ARM injection
> >   script;

stopping review at 5/10 and expecting a version with
GHES source to error status block mapping fetched from
HEST in guest RAM, instead of pre-calculated offsets
in source code  (as in this series) to avoid migration
issues and keeping compat plumbing manageable down the road.

> Forgot to mention: I dropped the PIN cleanup from this series, submitting 
> it in separate - and it is not related anymore with this changeset:
> 
> https://lore.kernel.org/qemu-devel/ef0e7f5fca6cd94eda415ecee670c3028c671b74.1723121692.git.mchehab+huawei@kernel.org/T/#u
> 
> Thanks,
> Mauro
> 

