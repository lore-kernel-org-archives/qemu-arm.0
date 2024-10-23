Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp259621njb;
        Wed, 23 Oct 2024 01:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0n8u0DXf0cBRjdVmC5sY7gw+RKpV5OJbY6u1UW0E1h4z7tTKDBZ6B9HN0AAFwXjSBmLlY2eyEGYmwWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF71LixFKB559sX+MtnhGGxOrDaJcafwGEW6mK0Xt3GVZQcObiV8Tq1xEEsw1HtqGldcrkx
X-Received: by 2002:a05:622a:394:b0:460:996b:2896 with SMTP id d75a77b69052e-461147140e9mr21537161cf.45.1729672602594;
        Wed, 23 Oct 2024 01:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729672602; cv=none;
        d=google.com; s=arc-20240605;
        b=VSaPFOYVa4iEBZ2qTrFhyM33KhsGftzzk7QGS64SrzaYe2AzjC2FEQoUtrSyTmRX5V
         OmMXZ1L/n7DexL3WUJ+rGKYKxdxI6/+wYxvG1VjgrU5PIeGK/d4PlyC6Fz5jPXNH23SF
         14ia79X1Iplf+FCZCcgL0hzTcu2DmJTW0zzsc8zTvlb6wVBlmgqsRH9pkkYB1/jEk9Qc
         20XCeAFmTwVTD7O1P0jNitaRkgiOO3tcBV6PmKRfimeTTGevo6Qsg4Mus5ovPCNUExUP
         xzce6CTxtWJqdqmXqxcZPzzHQNY40lyhlsCQPx8PMNw2iJQ+XrKZZrZIdF9AaHxVP+Hz
         UTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5sixUmv3PGx+pYKXdN/nhCdqAcaHSIuduixwvpL8fRM=;
        fh=FOEmvu7qu4LIJ8F3F4wZeuj3vpKfW3xCo5wUFBXhEtk=;
        b=Y9rOrKZhz75x2EIMxCpMrAKi3SOVEgdQyakXY95WATTFY6t8b6PB0YIK9oC1OurPx6
         mhe6VsU7btJg87kNJZ7NOOh7JVmKTzpyMgLFNADp2O4bTIoQJAUfYAAa2DutPxMZ5zDa
         /0/O3EVxwIA1AXeazrtRokPrdig5GdQ0jpGNdRshE4S+e1gC2yMs12x0T3UbQ61Es5pW
         DxdCnKM04vpw7QLa6/Qyd+MPBgLmDvfY7MvYqV/HIIGCfFfoBHGhlUOIg2hyI36B6Tbe
         PpzoTACgTJp9rMo1ZhwxUK+XdGeYa5AorE+/q7KVh8n8D8F+v06KhMMFeyhVSmds0R/i
         JcPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="d/QPikps";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3ce8127si91820851cf.321.2024.10.23.01.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 01:36:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="d/QPikps";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3Wqy-0006pB-S6; Wed, 23 Oct 2024 04:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1t3Wqt-0006on-MX
 for qemu-arm@nongnu.org; Wed, 23 Oct 2024 04:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1t3Wqs-0005ux-02
 for qemu-arm@nongnu.org; Wed, 23 Oct 2024 04:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729672581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5sixUmv3PGx+pYKXdN/nhCdqAcaHSIuduixwvpL8fRM=;
 b=d/QPikpsWp+X2JswL62urYFqQb076Nf5wMfagCFFB0V0ksycm//d9++RvySSZzho8n27Ov
 SkdubMjF1fNYJjhvhlK/qENLUsVWjN9Ymaarjoj+z4daqkmg+9xXIUOcKcnYhBtYay4kR2
 /rgT1MOAQw4PksLbix8zANPT3iiPhoU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-aHIW1WMsNAu2KP88sjfAUw-1; Wed, 23 Oct 2024 04:36:18 -0400
X-MC-Unique: aHIW1WMsNAu2KP88sjfAUw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37d3e8dccc9so3672995f8f.1
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2024 01:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729672577; x=1730277377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5sixUmv3PGx+pYKXdN/nhCdqAcaHSIuduixwvpL8fRM=;
 b=ujneHqMyciq4jqY0lEdeWq7ZyNaWuFY4rX4IfWJ8XnMRp+3mdq5/g/8nLToDn4CXTA
 fYLyU9DjPwMKfHImF1c68Rr8IkBG7Gv5j1o0PvccW/a28U3cJuxPtkw2rWYZrlgGZ0mH
 iuL0IhmIzdmGEN42xwrVUb5MKNFXpoXiOZyvv2w+JC9K6jEQWsQHabEmETVuKEflorDF
 b/Q+i9dsQ9whH9g/Wi3CLUtmyg9FecIXFCZ7XxLKfcelXx2tJp/Q9Pgvw6/EUomorJSL
 hPDy9Kaj0DYzssqISGRYqkyp9PVeTjePuxDc7xGgdoJHsAvpSGeXM6yTItORf0gLM6T3
 /luw==
X-Gm-Message-State: AOJu0YxOdhE2F64OEZaNg0jgsYKHPWCr/g/HUn8DEeXWiHyIHUTNjpvH
 01hnndhfFSlBt9ZXfvD56n4vuD0xGhN9xepSrtFjmPclNyp/HB3ZuhosiCpf3AfmdLDyknEtUph
 i6/EvX0fIZBJzV1Hqp28JlFmnVxAdZ5+WMjdwgDrB3LTDA/ElnQ==
X-Received: by 2002:adf:fa51:0:b0:37c:cc96:d1ce with SMTP id
 ffacd0b85a97d-37efcf1f8a1mr1115334f8f.24.1729672576845; 
 Wed, 23 Oct 2024 01:36:16 -0700 (PDT)
X-Received: by 2002:adf:fa51:0:b0:37c:cc96:d1ce with SMTP id
 ffacd0b85a97d-37efcf1f8a1mr1115321f8f.24.1729672576419; 
 Wed, 23 Oct 2024 01:36:16 -0700 (PDT)
Received: from redhat.com ([2.52.26.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a48564sm8392575f8f.29.2024.10.23.01.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 01:36:15 -0700 (PDT)
Date: Wed, 23 Oct 2024 04:36:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v5 0/3] Upgrade ACPI SPCR table to support SPCR table
 revision 4 format
Message-ID: <20241023043544-mutt-send-email-mst@kernel.org>
References: <20240829015920.95778-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240829015920.95778-1-jeeheng.sia@starfivetech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.519,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jHRqWpbSBPkC

On Wed, Aug 28, 2024 at 06:59:17PM -0700, Sia Jee Heng wrote:
> Update the SPCR table to accommodate the SPCR Table revision 4 [1].
> The SPCR table has been modified to adhere to the revision 4 format [2].

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Pls take through the arm tree.


> Meanwhile, the virt SPCR golden reference file for RISC-V have been updated to
> accommodate the SPCR Table revision 4.
> 
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931
> 
> Changes in v5:
> - Reverted the SPCR table revision history for the ARM architecture.
> - Corrected the output of the SPCR Table diff.
> 
> Changes in v4:
> - Remove the SPCR table revision 4 update for the ARM architecture.
> 
> Changes in v3:
> - Rebased on the latest QEMU.
> - Added Acked-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Changes in v2:
> - Utilizes a three-patch approach to modify the ACPI pre-built binary
>   files required by the Bios-Table-Test.
> - Rebases and incorporates changes to support both ARM and RISC-V ACPI
>   pre-built binary files.
> 
> Sia Jee Heng (3):
>   qtest: allow SPCR acpi table changes
>   hw/acpi: Upgrade ACPI SPCR table to support SPCR table revision 4
>     format
>   tests/qtest/bios-tables-test: Update virt SPCR golden reference for
>     RISC-V
> 
>  hw/acpi/aml-build.c               |  20 ++++++++++++++++----
>  hw/arm/virt-acpi-build.c          |   8 ++++++--
>  hw/riscv/virt-acpi-build.c        |  12 +++++++++---
>  include/hw/acpi/acpi-defs.h       |   7 +++++--
>  include/hw/acpi/aml-build.h       |   2 +-
>  tests/data/acpi/riscv64/virt/SPCR | Bin 80 -> 90 bytes
>  6 files changed, 37 insertions(+), 12 deletions(-)
> 
> 
> base-commit: cec99171931ea79215c79661d33423ac84e63b6e
> -- 
> 2.34.1

