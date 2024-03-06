Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp399129ejb;
        Wed, 6 Mar 2024 02:01:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9pgoXOZv/MjsSzRGnbb9GNQDqu6NuaSP02V5/RZKsty5QCI8tHkkUeG3F9jyqFQrLZMy/JqnMRTj/pPKqwWe9vc1tj8sD
X-Google-Smtp-Source: AGHT+IGq90obMyF9+R1TwPxKD+O81bFS7P6P8WmIKGvbhuyzvxPKgpq1BOCrtZn0EjlEhh3bCk0N
X-Received: by 2002:ac8:5c10:0:b0:42e:f860:d4e6 with SMTP id i16-20020ac85c10000000b0042ef860d4e6mr4430406qti.34.1709719300952;
        Wed, 06 Mar 2024 02:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709719300; cv=none;
        d=google.com; s=arc-20160816;
        b=J1xJpmF6X9IhJPEG2X7mfisE3fS0meA96O4G4vOfWsFq6pQypH6uk/uoRK7zTdjpU9
         sIMC8LNWJh3erqjBIT3e4I82uTXT6GN6BC0D0cYaPmrZsUKsm8sZQpB8DOSfPcUF7A4P
         PJkDqILhhn8XmgzhH9HUl04lwT3WvWMeiROYgsuLJIclUup1mLsMWHaG9+fdLRUPGb24
         Y1mUQrv32NrjNRzrZFMF0sArxcs0SbCS/bZEM9BHyP5G9MktLAcCHiI70PgGoAGTVDQY
         8C2b0PFplVm8sgH3on1SFCzVPJlqeWOtFCRlikWNTunTm0aFDuMZ3HlfUqTrNZOy485E
         g8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=oTp8e0WZUBvMyqT1cOn79edMLQPrjwMomvyCPj6o8mk=;
        fh=EZirZUOPNdD7X3oQuHa2j3IkfNpjNeetQBcFtk6MinY=;
        b=b1yxA21ncpWjc9tnygu0QbMhFAReSPSU4QiI13c3JnpeMvbdzpEDqMIrrgKYsW1Htr
         NTZNAwxqEnlz5gzIw1NAiqqPt5kYBDkVDzVE7pUxydns1RAHYvLyIyTFtUX50VDRW5v8
         mfguIAmvF3jV0u0lIPUeUXx9eF+yJozUydp8BW021dJARg45Dn80bU/OYpu8zTHwgEzC
         c1OtwTZHRBxKbCZUMWuVw+hW6PU0/V5TcQ/O8ZnLEvp9/cGcCtawwpBDshEf5kBdfBEV
         ODucyeI/4LThtWWQeo/K9biOFI3NOscaGRfCI2x1p+BFihSsXSuvI/+k9Rc9mhFef8gH
         3vaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ILeTWl3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020ae9e407000000b007882d5d8c29si5453608qkc.221.2024.03.06.02.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 02:01:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ILeTWl3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rho5Z-0005Lr-6h; Wed, 06 Mar 2024 05:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rho5W-0005Kz-EW
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 05:01:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rho5F-0004rY-UV
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 05:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709719268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTp8e0WZUBvMyqT1cOn79edMLQPrjwMomvyCPj6o8mk=;
 b=ILeTWl3Y/TZ96j5tj3mn9OzLoVvGdWXE4tN0R8r+TmJ3qhp2o3iGZKpIRUeI93f9/R3VOr
 Wb1a74bOOqB74Etz7XV8KL3q/UNZgBw5jOIDhvOUJAOJa3f0wedCBNo0JPog/7TY2djwIv
 A01qQ1Di9zaFs0GPUd1lzy3+lphNJ40=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-cY8Sp0eGM_OPBQ-nMBzlog-1; Wed, 06 Mar 2024 05:01:06 -0500
X-MC-Unique: cY8Sp0eGM_OPBQ-nMBzlog-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3c1a2f7e321so829255b6e.0
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 02:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709719266; x=1710324066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oTp8e0WZUBvMyqT1cOn79edMLQPrjwMomvyCPj6o8mk=;
 b=VCw3XUqcIabM+a8gEnBiuz94brwws828/qrIaaE6msrmsXA/K3x5HwxfKlQ/41T+LK
 2Iv/uxo5u1LZhmiDXS9jlrdx13TZSO7DfDZIE7Ix6tq8P3XSwqkLvUugkaBPd5fy5m1M
 6lshXS4HP0G110gnlVXS76TAz8JsPfq3Gbk+HeDK/5zyyIZkIefdGcKIh9d5qygl8pfU
 15Lovgepk6ee/KnPxrw5Vyl4GAIdrCOBLlT7G5eKeiHRvnsyxm38g3P45e5WP0tv83El
 AlUTLiQ+Q0Gr/gbAjU+fZpw1R7WRiWHkxOj6+BViMgge+Fs3bjqxJji3fr9VOgYBDNQT
 vBxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/dyQyYRyg7RauyfvMqUjpUHV1E45pZLqQdpfAXIHBvt+25qp38H0/x6tSzg0Goss652v735GQKh8HyK8dZTLC9JUa
X-Gm-Message-State: AOJu0YzhcN84xPriItZC/IgUaY+A3BLSL7QOHHtLp8jiHPE3cI9o/9Uu
 mOnbZ2Zjd8HF56Mlryp8bFnvc0z7NqxO7K3Obx8359Kbm77ib4Tc67YRTfqwQPfqzpEA92lqQV9
 zYNhriGiLzeEx7LMCLLZ5PhvPj9CdJ3HLDv6v+CavJ+zFafxklQ==
X-Received: by 2002:a05:6358:80a0:b0:17b:520f:8249 with SMTP id
 a32-20020a05635880a000b0017b520f8249mr4794686rwk.31.1709719266326; 
 Wed, 06 Mar 2024 02:01:06 -0800 (PST)
X-Received: by 2002:a05:6358:80a0:b0:17b:520f:8249 with SMTP id
 a32-20020a05635880a000b0017b520f8249mr4794660rwk.31.1709719266078; 
 Wed, 06 Mar 2024 02:01:06 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 qp30-20020a05620a389e00b0078820f053b0sm3850364qkn.109.2024.03.06.02.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 02:01:05 -0800 (PST)
Date: Wed, 6 Mar 2024 11:01:00 +0100
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
Subject: Re: [PATCH v2 20/20] tests: acpi: update expected SSDT.dimmpxm blob
Message-ID: <20240306110100.6b1c445d@imammedo.users.ipa.redhat.com>
In-Reply-To: <9E373F64-2290-4AF7-A23D-340FB6CE86F8@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-21-imammedo@redhat.com>
 <9E373F64-2290-4AF7-A23D-340FB6CE86F8@redhat.com>
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
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: IlnM1a9Yacit

On Wed, 6 Mar 2024 14:50:20 +0530
Ani Sinha <anisinha@redhat.com> wrote:

> > On 05-Mar-2024, at 21:27, Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > address shift is caused by switch to 32-bit SMBIOS entry point
> > which has slightly different size from 64-bit one and happens
> > to trigger a bit different memory layout.  
> 
> Why does it affect only q35 machines and not i440fx as well?

that what tests show, mem layout is a bit different between those 

> 
> > 
> > Expected diff:
> > 
> > -    Name (MEMA, 0x07FFE000)
> > +    Name (MEMA, 0x07FFF000)
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Acked-by: Ani Sinha <anisinha@redhat.com>
> 
> > ---
> > tests/qtest/bios-tables-test-allowed-diff.h |   1 -
> > tests/data/acpi/q35/SSDT.dimmpxm            | Bin 1815 -> 1815 bytes
> > 2 files changed, 1 deletion(-)
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index 81148a604f..dfb8523c8b 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1,2 +1 @@
> > /* List of comma-separated changed AML files to ignore */
> > -"tests/data/acpi/q35/SSDT.dimmpxm",
> > diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
> > index 70f133412f5e0aa128ab210245a8de7304eeb843..9ea4e0d0ceaa8a5cbd706afb6d49de853fafe654 100644
> > GIT binary patch
> > delta 23
> > ecmbQvH=U0wIM^jboSlJzam_|9E_UV*|JeaVTLvQl
> > 
> > delta 23
> > ecmbQvH=U0wIM^jboSlJzanD9BE_UVz|JeaVy9Ofw
> > 
> > -- 
> > 2.39.3
> >   
> 

