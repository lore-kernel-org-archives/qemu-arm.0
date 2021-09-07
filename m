Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4450060lfb;
        Tue, 7 Sep 2021 00:05:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMju2yFIo9y+tXyHrj1DQbyRScvIIZ7YWAmvGGlSxEbeybqpvtqsujxI//CqgbxPF8Sv7l
X-Received: by 2002:a02:2a88:: with SMTP id w130mr14348193jaw.60.1630998334871;
        Tue, 07 Sep 2021 00:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630998334; cv=none;
        d=google.com; s=arc-20160816;
        b=FgHD07p7cnzlBGF+u4TAZdJccpEEJSCo+fFXoOo3eTCepS3kas378BmPHoLGvGnUkE
         mSo7aGms/Ovu3kyo8qKp4zUSrsGiQBeoz2/5haul03O9S+C9rDxxKSKyn6pNZOh2cHlg
         rS5OPJrdEzMtU2LdjoupKE2blTlEKX2tq/aKCeilELPkJmKG8fze/1aIYtuMA1btjkrZ
         lepTeqFmLIu52sessefdFquEavqpeFW0mkXL7HmOIxBRcLKnSTxOiHbj/HPZPoDPJ25m
         QZUwWOlHLL3AK3NMKd6PSgJXn/etGuMdxcTxv/qtjgSSCLhAeviRaYKUlCR4OoidEyEC
         Mmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=F3mhJan8ywxd9Sx7hi45fU6A3A+1Ay23w95AkNMpVN4=;
        b=HT0oaEhLBhyQ8Cc2EMQsVlUnae1W1CTWunK3cwrx6+0rfmpDF5w5nm+HF1gHhPhuSR
         uvPeKrcL8nmgwiwAaWi7mEgeaaLkxsgo1kzsCE8HfUXMNEEeisNp5jkgnnGGYrpnfeXk
         TDlYqYD6zjy9JqCswD9FH3wAv+6Lzdpe6sWXWSVwOn6itr8JStsnhauVn/1Qo89g2CxS
         Qv/Phkq3DC1yk8KcXX1r2Fo4Qr78PW8qyG1n+hIpqimML6/Euk/vpoBxA0wW2GERndJQ
         5mPAV49LF9L5ipsE7BDqxCzolxSw0XBruvsiaNAIeuRsTKOa9dYZVypKbZoX2pc4cuBw
         p8dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GjsHzbOf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si3976361ilq.174.2021.09.07.00.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GjsHzbOf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNVAk-0003bx-2U
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNV7r-0007tZ-G1
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 03:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNV7p-0004Y8-63
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 03:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630998151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3mhJan8ywxd9Sx7hi45fU6A3A+1Ay23w95AkNMpVN4=;
 b=GjsHzbOf1Y4Ors7C3TDACJwJ61LWBikF/wK1dhZFgRCJ++lAZZye7m0U8kbSdAxv6zlvYV
 kHhp/16ks6q70LpeZqDln6o9RhSXs/0841qzR9Uj6kzKb9HW5m+1dI+QJieFXhfykNigNb
 Am+ZEcopZsiUFYlZWmkSNPl3y5nSNes=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-kESwkA_tPa2uJisuBz55yQ-1; Tue, 07 Sep 2021 03:02:28 -0400
X-MC-Unique: kESwkA_tPa2uJisuBz55yQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 f23-20020a17090624d700b005d7f8be91eeso3218500ejb.13
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 00:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F3mhJan8ywxd9Sx7hi45fU6A3A+1Ay23w95AkNMpVN4=;
 b=MMyEmQT7haRYQJms4vAJYknjo7sW4w5lNU6SaETjutQ+jo9nMO5oDso1ERcSZ63d+Q
 YbsNBfNXlZhVWMvTW4Sjie06PazOcvmZB+o2tejbQWXci2N5Mv6Rme/XSpNZvFzwj+D/
 ZjffMiUBchVIz2PPb50I9oTy54aVESFcoCpAwM05z96ty0x90h2f9plfsw7bb/32szcE
 D333Yx1j3cffhk+x2bIjcGZ2lwoxXwySU/rI5y+TwLmc4Hbdm5OM7K5t54TOymbk8O0R
 nAPVywXF0yhGOx60tLBiDj3cusvgmsma1+CIBZaHk453X31jXyyrKtN2tLFur5bmofba
 z8XA==
X-Gm-Message-State: AOAM531zK96eZB1IaHKfrsbS5jteb7wG0L4RcPKL3LN8EOy8jKqtaYVx
 AWJR+IKOtT5oNY+S1PFjJNnMMlxLHcGW/O+6+8GQxnkjLPK4RBrw/cWd/RLo33vL1S8Xw+lmBgJ
 fcQyLCnXLu5ew
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr17276075edu.273.1630998147392; 
 Tue, 07 Sep 2021 00:02:27 -0700 (PDT)
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr17276058edu.273.1630998147207; 
 Tue, 07 Sep 2021 00:02:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id cf11sm5922308edb.65.2021.09.07.00.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 00:02:26 -0700 (PDT)
Date: Tue, 7 Sep 2021 09:02:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210907090225.3c8d3d96@redhat.com>
In-Reply-To: <20210906123139.93593-1-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZfU3LvVBNsdQ

On Mon,  6 Sep 2021 14:31:36 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> This series generates the ACPI DBG2 table along with machvirt.
> It applies on top of Igor's
> [PATCH v2 00/35] acpi: refactor error prone build_header() and
> packed structures usage in ACPI tables


FYI: I'm preparing to post v3 today, with so far received feedback
addressed. Change that will affect 3/3 is
 s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/


> The DBG2 specification can be found at
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.
> 
> DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
> behind is Windows requires it on all systems).
> 
> The DBG2 is used to describe a debug port, used by the kernel debugger.
> 
> This series and its dependency can be found at
> https://github.com/eauger/qemu.git
> branch: dbg2-v2-igor-v2-fix
> 
> History:
> v1 -> v2:
> - rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
>   and build_append_int_noprefix()
> 
> Eric Auger (3):
>   tests/acpi: Add void table for virt/DBG2 bios-tables-test

>   bios-tables-test: Generate reference table for virt/DBG2
>   hw/arm/virt_acpi_build: Generate DBG2 table

I'd swap 2/3 and 3/3, so it would be obvious where DBG2 comes from.

> 
>  hw/arm/virt-acpi-build.c  |  64 +++++++++++++++++++++++++++++++++++++-
>  tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/DBG2
> 

