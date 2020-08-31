Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3486331lfc;
        Mon, 31 Aug 2020 00:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3fqn3Z3jlqMF1a8V9KRYTRL3g9cIomVnP2RcHv1poUekEQRldFF6mJ1gCT0AGTBuWMEhv
X-Received: by 2002:a25:3b53:: with SMTP id i80mr560011yba.465.1598860554246;
        Mon, 31 Aug 2020 00:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598860554; cv=none;
        d=google.com; s=arc-20160816;
        b=y/c5lML/VXh9QZTWJUiARZtJyNEdsB/bAKw1sdI/BQis23HX23f4+gDHXRDj0QPFo0
         fVvPzDWVu/I6PZP96zodNX0rgzrVtYs2JUMTfwfbS6d1W+Y4e3ud3FK/bW4GkH15body
         P9cW/JQk3XmuDr8hei2c0vwrHEhurX3h4b+fnN7hivAIvyIa3N6ZyjZpvTpPmFtZW4qz
         PQ9WDSfoB4wNt1Qr3fXIENQx1sJs2SqtbNpKRlSHCL4qBpFVN49pQbdfdBIbBT0clhrT
         hhaGjfM7y8V/HrQB4P10hyzMokH6NG53EGXYXpYKT1qVnTjMb8cqDcPVV2UZYUwHCT7u
         gmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=/7b2LyFHhtm4vWXXZDTl9wBLfLDjWZif/08S3Aao3XQ=;
        b=Np2+STdMCv97eudtkPHmQ35urm6Aw3YeHcHjJ0RXpFX9H2rfwYu4jxslV741xSn28f
         Yo8oPkkv07AZQp5Axk6Sw7bQDWUKiTljPPsNnxU6t7P10/qiaCybUoguRtaft7J7xhtC
         6TP2xrWvEIiNE90TSWdXu/g+2pe7q+gQYCs/MBy5YalMjmG/s5XEnERVLNIa7MzOKqM8
         rJaa8oL+WS0GUT+FHF21VVYL/Q1sEsm7WMZ9L/S/I/0JE7Gklxs51UGa8yqAAWmAR8uD
         d27FTVEM6Y9rMZP2W3ieVHM0K/n6I8ts5MoM9lEPJCmMmTL+WAfWOunhV+1nLjkz0w58
         oY2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UNT+0pKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si7238077ybo.350.2020.08.31.00.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 00:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UNT+0pKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCefR-0005tt-Lu
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 03:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kCefG-0005s0-Cj
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 03:55:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52199
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kCefE-00023F-LK
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 03:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598860538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7b2LyFHhtm4vWXXZDTl9wBLfLDjWZif/08S3Aao3XQ=;
 b=UNT+0pKFDiPi2LozaDLGn3gkMq3WgqVBgQXU36C7b2srhF0Qd8//MIWRlTld+knsKRJYt5
 SlicoexIyU1xUQLi4la0mLzWEmoRfjS4zoiT5YU/tJ0inLTT1ol3STy6eQrH4d2LFnP3uZ
 /XOqcz1VtkM5GZN57bjEe63x4zy6re8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-8w0UvtRNNhiW2Kl3J2Rr8A-1; Mon, 31 Aug 2020 03:55:36 -0400
X-MC-Unique: 8w0UvtRNNhiW2Kl3J2Rr8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D6A6801AC3;
 Mon, 31 Aug 2020 07:55:35 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AF1E5C225;
 Mon, 31 Aug 2020 07:55:24 +0000 (UTC)
Date: Mon, 31 Aug 2020 09:55:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 13/20] x86: constify x86_machine_is_*_enabled
Message-ID: <20200831095523.44526dca@redhat.com>
In-Reply-To: <20200826105254.28496-14-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
 <20200826105254.28496-14-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 02:13:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HtTXulN9JNQ7

On Wed, 26 Aug 2020 12:52:47 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/x86.h | 4 ++--
>  hw/i386/x86.c         | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index b79f24e28545..a350ea3609f5 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -110,8 +110,8 @@ void x86_load_linux(X86MachineState *x86ms,
>                      bool pvh_enabled,
>                      bool linuxboot_dma_enabled);
>  
> -bool x86_machine_is_smm_enabled(X86MachineState *x86ms);
> -bool x86_machine_is_acpi_enabled(X86MachineState *x86ms);
> +bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
> +bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
>  
>  /* Global System Interrupts */
>  
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index cf384b974318..31a82885d735 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -845,7 +845,7 @@ void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
>                                  bios);
>  }
>  
> -bool x86_machine_is_smm_enabled(X86MachineState *x86ms)
> +bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
>  {
>      bool smm_available = false;
>  
> @@ -887,7 +887,7 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
>      visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
>  }
>  
> -bool x86_machine_is_acpi_enabled(X86MachineState *x86ms)
> +bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
>  {
>      if (x86ms->acpi == ON_OFF_AUTO_OFF) {
>          return false;

