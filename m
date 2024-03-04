Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2620461eja;
        Mon, 4 Mar 2024 06:25:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYH+I76b7Lb9ijhZ1WcDdK+0LwXFo/l7jkegftfp9mxUFdorXneWtSuAzfOVvZuWV/O2JMmU1zT3UJ2MiTXaOfbzsHGTBB
X-Google-Smtp-Source: AGHT+IFUVACNunrrVqqzkdkI/MkxIKXeSvjDyRLAeN9gJs64hBAloe/v3QtzphNS3uRQG+hGOx8e
X-Received: by 2002:a05:620a:5e49:b0:788:2f11:484b with SMTP id ya9-20020a05620a5e4900b007882f11484bmr1093391qkn.4.1709562330717;
        Mon, 04 Mar 2024 06:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709562330; cv=none;
        d=google.com; s=arc-20160816;
        b=n1C3z4ERH3Ug7QBP5/zXsipeN2v+wzgh6OIUbOOGPnOHDW1/k6P36s6ioBAuhHoGTb
         vlDw4Vq/DW04lzQ4jzny6lcOWyaIvcsUNnHXFws2L7qCmeDZ0H2vXteyiFZVEQqj0/fK
         q1h6xpQfrSPJMYDqOMh2R12imcsMrykGaKUy4m+8//DAvD9uT28U3xqZuou+IbJ5CRhu
         Lq9oMEoWaTdCr9yVZiaD6Rg6I4azMrlDZmKQcfEzgt2YHCPFsxXWxkh6XqDZuaNmE594
         tB0NyjJ8T5O/V6kbbYJAo221tkYWEGrxN/2iDhefxWC/IGb4sWYUkAcmcOcj/VKN7/H/
         YK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=USHB4AjSbn6NuZKXD7x5nU8B4nXaTrzejgD3EPdJTEs=;
        fh=Ek/gtypjHl8e3nbE8Q+RFDorDZiWqOaxDSFo4a2DkY4=;
        b=cZYTMq863Vnf3J1dHU6LqQMujH2GfxpshQ1gjyiVDjzr9PDPLvj0YuCfJ/rx2IrnBN
         mQG4fbIlTAGILyIKqoD9pZGhMSG6PdalrQLkYyHaYArbQneAoobfxJF/9Cn7hKnJq+wS
         yqoScRpO464+cDl79gn7TiOORM3PjGWbRWncQdSPOiwLeIJvwY8mK9tI9u1Suro4gJdh
         esUtPkZ1043cBho4IRl7tc30oO0hASLZqtMz2H4GJhM7xIoxZ3IZ0keMNGVt4nPjsqdA
         IHrW8fB870CkwqNbGgwt0B7tJ5OkhGyDL28BsXEGZzOxnOEG5/qTsIE83zr9rVVTOs5Q
         KdwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RkSVMPHk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pe5-20020a05620a850500b00787bb72557asi9675383qkn.194.2024.03.04.06.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 06:25:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RkSVMPHk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh9Fm-0006Q4-HR; Mon, 04 Mar 2024 09:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rh9Fl-0006Pb-8c
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 09:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rh9Fj-000254-0B
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 09:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709562314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USHB4AjSbn6NuZKXD7x5nU8B4nXaTrzejgD3EPdJTEs=;
 b=RkSVMPHkbKCuAQvQ1S9AdB09Vt6A3BkKBrHxMtcFUrfvTWLw7ININA+GU/2yscasZph+pL
 jbhYA7+uON32hMR4A8U5WjMdubINx6oUmw6vvnzHMv1g/A9V6vxP74+G1/q/hJPticoT+I
 banFUOEtG8UnI73sWlEnLa5IZT4Fyj4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-y6om_6HCPOWQc2yXBOUxPQ-1; Mon, 04 Mar 2024 09:25:10 -0500
X-MC-Unique: y6om_6HCPOWQc2yXBOUxPQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d2b9aa4e53so31982881fa.3
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 06:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709562307; x=1710167107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=USHB4AjSbn6NuZKXD7x5nU8B4nXaTrzejgD3EPdJTEs=;
 b=WKLVUIk1iKO9EEYPLKi79woXn+57QhWC3fGDoz8sFdpomCNjwngF+h1F7zCfbofTFq
 QuMa3WShwHEvC0rvb4g+Ge63R9yZnlNelHtreHXDuaB7eUQkneRGolg7MFJrWQaIwa+O
 BCYIQ1srEDzCF1UVpxKpOzCnqUtBszyjd3YJG70fq3D8FC3qwwY1dncNe6tmL/UqRYBH
 KOotksxNOnccsQpxMXqvd8r1TrUv8+MMiVffhkUpD+u8M44g4NmyNTNg5Q+BkJ+DhdZR
 e3jipSYzb9u+F4T3FlKpmp/jVeBbw/UVcqrqT/WBGUXrFOQNzPFsfSmykZk8NeLhdMcP
 WZyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrfU8i76RQw9GP5k7EFrBEm2k0j3U+esPNibBVZ9eTWQzuYmJZrTAHP5TPREn1X1MTyJvYFUOgDVYHdH6EOUQSt2IG
X-Gm-Message-State: AOJu0Yx+6o+Y3PSr6uPmqxdhlptGSOswTuL7CxVGu8dKdemvAxL8p21f
 MJGj2I9c6NCjRSTNQmzP3LcpmIP1eI1QclugveC/ri7B3q0R+iIgxvVCTc79vxibXGtl65ssJTX
 6asOvFwbqJ9U/j31CEEDdWspY3b2WZC4uhLwPtmCFtWihHVx4LQ==
X-Received: by 2002:a05:6512:48d4:b0:513:19c6:794a with SMTP id
 er20-20020a05651248d400b0051319c6794amr5434412lfb.68.1709562307337; 
 Mon, 04 Mar 2024 06:25:07 -0800 (PST)
X-Received: by 2002:a05:6512:48d4:b0:513:19c6:794a with SMTP id
 er20-20020a05651248d400b0051319c6794amr5434373lfb.68.1709562306979; 
 Mon, 04 Mar 2024 06:25:06 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b00412b431eb0csm14746868wmo.14.2024.03.04.06.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 06:25:06 -0800 (PST)
Date: Mon, 4 Mar 2024 15:25:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>, Alistair
 Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 11/19] smbios: clear smbios_tables pointer after freeing
Message-ID: <20240304152505.21ed65d7@imammedo.users.ipa.redhat.com>
In-Reply-To: <92FA6B88-CA59-498A-AEFA-9A82E3342230@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-12-imammedo@redhat.com>
 <92FA6B88-CA59-498A-AEFA-9A82E3342230@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: chnIm4SL58JW

On Mon, 4 Mar 2024 19:24:06 +0530
Ani Sinha <anisinha@redhat.com> wrote:

> > On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > that will avoid double free if smbios_get_tables() is called
> > multiple times.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Maybe we can squash this with patch 10.
Ok, I'll squash it into 10/19


> Other than that, 
> 
> Reviewed-by: Ani Sinha <anisinha@redhat.com>
> 
> > ---
> > hw/smbios/smbios.c | 2 ++
> > 1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 7c28b5f748..d9ba2072b1 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -1052,6 +1052,8 @@ void smbios_get_tables(MachineState *ms,
> >     return;
> > err_exit:
> >     g_free(smbios_tables);
> > +    smbios_tables = NULL;
> > +    return;
> > }
> > 
> > static void save_opt(const char **dest, QemuOpts *opts, const char *name)
> > -- 
> > 2.39.3
> >   
> 

