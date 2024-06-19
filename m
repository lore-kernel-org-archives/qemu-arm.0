Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp849950dlb;
        Wed, 19 Jun 2024 02:44:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWup3gWebk0Oj6xH6LE2ww0bVOO5Ca6Odut1JZ9d0+lXbpCwlaqzyyKJ0j65Qyt9GB1zRx0xi3OGr12mTSEPQ1D/NKw6jHp
X-Google-Smtp-Source: AGHT+IH8I0URc0DfoeKQot486JjNVgmLO9MjYxGcMOfWA8qFF8M+BV0HYbKtycipDbb4Tb4p/7FU
X-Received: by 2002:a05:620a:4445:b0:795:5711:a212 with SMTP id af79cd13be357-79bb34abf17mr361645885a.23.1718790266855;
        Wed, 19 Jun 2024 02:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718790266; cv=none;
        d=google.com; s=arc-20160816;
        b=IZOI5P1aJWkTUvBs1xsn8n3TrVU+SRB/RpEBLHEcg45+Tt/lY5pQ73UG8qwuN6D+by
         41QxIIchvGwChFj3grKYNJv3aa0EWEjPEbXm/REI4sOARYpVnRdihQ1g3vvbnDmzRNOh
         oo2kL8e5gobmzW6UfM/3+58rw84jQd9C62OQ9TRpk2xVsjQ5YOK8OqgiY8++1QS4lsS5
         HwWM/s/7CroUUmDrxJ9a3W0nzxcmHtlUitLqBZ34hS/Nj0YrBVmqZiegdeL0zE40eXhf
         ci4+Q3RaEA6568Jv1Wzfn69L1B8DArT9YjoFM1QAqYaW0jqDTnNd0aaXnya9a5RdfZ67
         m2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=M6vw6i1zs4S6dXIulGSdWCYSlKQMxZo7phN6ifKBiWw=;
        fh=Pd0m8ksV1yHcCi5U+Fo/d5XUmZa/aJWJ6m6XtA2AMUQ=;
        b=Qf1j0gmlclyL+AngcyraxUbH2R2etMtupRIxbq/2SuhKQZToCwSaqjOVkfQgviF1Uk
         WH3gimFRPGNJAGdjRZ3IZi6tJBg2eWmvSj3jltPsZKZi8pgNQuPyDoHRTh3sN5oAB5cC
         7uYSp4j9frBhr5nTNJWmm9toI9f2ElHtz1poVI2sImjgOIATMu2puzn5B5GcE+an/5Ik
         nC1Dauxiwfs9d4oadD1liPr5BKzyceQCCEcr2/QzWAMhdlNrInZSuNxLYfRmgMYvQFAC
         3Iyb2Oiz+QHcG2q77FFdXGoQkeQJTJ2W0mT/8vZrV/fVaKIhmQbMfmv02fQ7VMKPjHNy
         WH3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GQU6yrgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe553f8si1397521785a.565.2024.06.19.02.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 02:44:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GQU6yrgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJrrO-0005ZC-VK; Wed, 19 Jun 2024 05:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrrO-0005Y8-2x
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 05:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrrL-0008I6-EM
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 05:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718790246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6vw6i1zs4S6dXIulGSdWCYSlKQMxZo7phN6ifKBiWw=;
 b=GQU6yrghaxGtgVwrA6AK23insLL61J/glQY8c0qGANXyYgIq89A94eUtycabwuL1T5BDD/
 xsU2GAokZWTNFmfs04WiyJ3F7eRHK10ElFqfaumYwLuSgJJw4i7EnO12oTNILhI6zAi7Dy
 zDbon7x7hYe4zEauH25oJNfKE6PQY2M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-BIAkUX2SNS-azrhg7emlVQ-1; Wed, 19 Jun 2024 05:44:04 -0400
X-MC-Unique: BIAkUX2SNS-azrhg7emlVQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4215b0b1c11so49582575e9.3
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 02:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718790243; x=1719395043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6vw6i1zs4S6dXIulGSdWCYSlKQMxZo7phN6ifKBiWw=;
 b=lBmpp8ppJp1XDFY7wEmvjqWHzyFSx8KLbG1uE5hDKlTGPijmEhrBIuAGvdvHw656pv
 BE88JiEFXjqbqyQQX9vIv06ZJ41J7/uoSSECymNgLZNzBSEbVXFFLnm1sHf29s0vJBJC
 /TFenyPxZVCz9cfvNp6c3HaDCejUcmDhILWYKLAb0xDEHMHZvs+Gn7Nu71y/1kXSI1B2
 q+Nq8XuN1Tl2V2Kgka3+gPoJMLciMIPnZ4wQ9FJSPzPHoQU8Z8UEzwvnhhz/T/DdUVlx
 jXsSz0LOFquxt6KzMggLR+zWliExC4cpsHLxydtYBlQv2lrGhJ0IIknKJhX0xbfsikvv
 7y6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVILMhAyElTSf86kAHVGNyuwyy8M9ZZtOd/KRMkvTnyqLV5Z/dK4c7pjkKIGSIxIi4w9mqOyZ6+xk30hhV+ewE6USAp
X-Gm-Message-State: AOJu0YxkDlYRVHtKFPAka69TCiKBGOULewiTjWYW0mQh8Bo6mLMYMdTj
 af7Duh14TRXtUI1p1sOMhTvJJWCjDz5iNT5JFD2e5ht04Xu40CNvRZ1ohPdUm7hW86OvYGH5ThX
 bzOj3j4SDQ4GuH9AIsF6lt/+62vre0HkHHxp+0HfxnMNpLao2Jg==
X-Received: by 2002:a5d:4535:0:b0:362:ea80:db0d with SMTP id
 ffacd0b85a97d-363170ec9f8mr1527483f8f.11.1718790243684; 
 Wed, 19 Jun 2024 02:44:03 -0700 (PDT)
X-Received: by 2002:a5d:4535:0:b0:362:ea80:db0d with SMTP id
 ffacd0b85a97d-363170ec9f8mr1527463f8f.11.1718790243248; 
 Wed, 19 Jun 2024 02:44:03 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104a26sm16684241f8f.97.2024.06.19.02.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:44:02 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:44:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Alistair Francis
 <alistair23@gmail.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1
 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>, Andrew
 Jones <ajones@ventanamicro.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v2 10/12] tests/qtest/bios-tables-test: Add empty ACPI
 data files for RISC-V
Message-ID: <20240619114401.534292f1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-11-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-11-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
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
X-TUID: 8DkVqEBjJFrT

On Fri, 24 May 2024 11:44:09 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> As per process documented (steps 1-3) in bios-tables-test.c, add empty
> AML data files for RISC-V ACPI tables and add the entries in
> bios-tables-test-allowed-diff.h.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/riscv64/APIC           | 0
>  tests/data/acpi/virt/riscv64/DSDT           | 0
>  tests/data/acpi/virt/riscv64/FACP           | 0
>  tests/data/acpi/virt/riscv64/MCFG           | 0
>  tests/data/acpi/virt/riscv64/RHCT           | 0
>  tests/data/acpi/virt/riscv64/SPCR           | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  7 files changed, 6 insertions(+)
>  create mode 100644 tests/data/acpi/virt/riscv64/APIC
>  create mode 100644 tests/data/acpi/virt/riscv64/DSDT
>  create mode 100644 tests/data/acpi/virt/riscv64/FACP
>  create mode 100644 tests/data/acpi/virt/riscv64/MCFG
>  create mode 100644 tests/data/acpi/virt/riscv64/RHCT
>  create mode 100644 tests/data/acpi/virt/riscv64/SPCR
> 
> diff --git a/tests/data/acpi/virt/riscv64/APIC b/tests/data/acpi/virt/riscv64/APIC
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/DSDT b/tests/data/acpi/virt/riscv64/DSDT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/FACP b/tests/data/acpi/virt/riscv64/FACP
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/MCFG b/tests/data/acpi/virt/riscv64/MCFG
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/RHCT b/tests/data/acpi/virt/riscv64/RHCT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/SPCR b/tests/data/acpi/virt/riscv64/SPCR
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..d8610c8d72 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/riscv64/APIC",
> +"tests/data/acpi/virt/riscv64/DSDT",
> +"tests/data/acpi/virt/riscv64/FACP",
> +"tests/data/acpi/virt/riscv64/MCFG",
> +"tests/data/acpi/virt/riscv64/RHCT",
> +"tests/data/acpi/virt/riscv64/SPCR",

