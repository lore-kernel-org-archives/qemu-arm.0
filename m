Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp992286lfm;
        Fri, 10 Jul 2020 12:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7DdRzt9lvMkLHVY4HEFX4c7hyQnSuLQh6hrFoUJP/V4UGy7hggA3tNi+MPYmfJZems/UB
X-Received: by 2002:a25:5806:: with SMTP id m6mr87141175ybb.152.1594408215682;
        Fri, 10 Jul 2020 12:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594408215; cv=none;
        d=google.com; s=arc-20160816;
        b=MHSQkTcYqtGQtjpysvKySvV94v/ROlx/5OBabJjrrTnWGA20LA139wMA2F0B+sMTLj
         jKb6WkJqPlFe5MxymPXycqPyv/9MrsEjr5oZOA/A3eNB5yvTO0ZblFabQF/vfmW75HXi
         qTDDykIR86v/jAKc1/gcGlgNjc96re+yI+ftyqjR8RBoywmxmjID+OKf7+P7sBWvrbHi
         PNcTF7fEffSA+6q9lI41a2uJJUZXMiM9ohvBBdokI2JS3pDuBAyEBYLBcb6clgBMQFkc
         8ijAwtQ6kImFeJBELD6X7CTsvuxt3zmdS0AcXGKGfo3QbRU77tkNYni/cPpVECXeDBn6
         9BZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=XHLR1yB7ustT4uJz6nGHU0Q9xGFRnS/i48uJ5yK5HFQ=;
        b=LlOfr7U9aygXJjs1+IkcOb7+/+7r0z97O1CfmoFR7DLu4QaHs8J6Mtal0vy8TcUoUZ
         liWPV5tXiNA9/gMU+7G6vXoWGN5lqqRb8tqmmIyPuSUKR2PsoOxbEXB9TzWmdfXGqD3A
         GTP3J9zkohhVcU6mzIUbEFmsU6wrdSgazir5gXZv/l8Nf5mAh4FtiobGaBdSR0Ct6FS3
         KjhaOJjDf7gCB151t61nvlE74fa/eT3KRm5zb0mC4Q1zUrws2ruu7hPgHxi/8Nfm+mWA
         NjVf4l0NNxq973h9+n9peSrJ8ngltcxISMdiQ5Iu2JeANeEbL+RuhokeIoY3ydduhcIr
         uWNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pm4wmWnd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si7482269ybn.229.2020.07.10.12.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 12:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pm4wmWnd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtyPX-0000ic-1i
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 15:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtyOi-0008IO-O1
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 15:09:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58128
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtyOh-0002R2-5H
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 15:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594408162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHLR1yB7ustT4uJz6nGHU0Q9xGFRnS/i48uJ5yK5HFQ=;
 b=Pm4wmWndUuKb61XwdCo1Vuilb1W/op0RIRwl0rPgUmMj1U2r6ylNEJufYBlZ8MFly+bb77
 gJG1vPVRDmBj98fLFlg8icB8pwtLhQp7bQDJi7C+G2ilTM75458g1UGzZMUmeorLeYNeSn
 su/RjbWbqb4V6XJSMXA3SCmntHBS4hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-adKm0jWFM-2KSmKbbo4D8A-1; Fri, 10 Jul 2020 15:09:20 -0400
X-MC-Unique: adKm0jWFM-2KSmKbbo4D8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8060880183C;
 Fri, 10 Jul 2020 19:09:19 +0000 (UTC)
Received: from localhost (unknown [10.40.208.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06DE974F4B;
 Fri, 10 Jul 2020 19:09:05 +0000 (UTC)
Date: Fri, 10 Jul 2020 21:09:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 07/20] microvm: make virtio irq base runtime
 configurable
Message-ID: <20200710210904.0a57d01d@redhat.com>
In-Reply-To: <20200707125356.32450-8-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-8-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 15:08:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +RCe4ifjwi12

On Tue,  7 Jul 2020 14:53:43 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


> ---
>  include/hw/i386/microvm.h |  2 +-
>  hw/i386/microvm.c         | 11 +++++++----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> index fd34b78e0d2a..03e735723726 100644
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -27,7 +27,6 @@
>  
>  /* Platform virtio definitions */
>  #define VIRTIO_MMIO_BASE      0xfeb00000
> -#define VIRTIO_IRQ_BASE       5
>  #define VIRTIO_NUM_TRANSPORTS 8
>  #define VIRTIO_CMDLINE_MAXLEN 64
>  
> @@ -57,6 +56,7 @@ typedef struct {
>      bool auto_kernel_cmdline;
>  
>      /* Machine state */
> +    uint32_t virtio_irq_base;
>      bool kernel_cmdline_fixed;
>  } MicrovmMachineState;
>  
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 1300c396947b..ab6ee6c67b1a 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -121,10 +121,11 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>  
>      kvmclock_create();
>  
> +    mms->virtio_irq_base = 5;
>      for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
>          sysbus_create_simple("virtio-mmio",
>                               VIRTIO_MMIO_BASE + i * 512,
> -                             x86ms->gsi[VIRTIO_IRQ_BASE + i]);
> +                             x86ms->gsi[mms->virtio_irq_base + i]);
>      }
>  
>      /* Optional and legacy devices */
> @@ -227,7 +228,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>      x86ms->ioapic_as = &address_space_memory;
>  }
>  
> -static gchar *microvm_get_mmio_cmdline(gchar *name)
> +static gchar *microvm_get_mmio_cmdline(gchar *name, uint32_t virtio_irq_base)
>  {
>      gchar *cmdline;
>      gchar *separator;
> @@ -247,7 +248,7 @@ static gchar *microvm_get_mmio_cmdline(gchar *name)
>      ret = g_snprintf(cmdline, VIRTIO_CMDLINE_MAXLEN,
>                       " virtio_mmio.device=512@0x%lx:%ld",
>                       VIRTIO_MMIO_BASE + index * 512,
> -                     VIRTIO_IRQ_BASE + index);
> +                     virtio_irq_base + index);
>      if (ret < 0 || ret >= VIRTIO_CMDLINE_MAXLEN) {
>          g_free(cmdline);
>          return NULL;
> @@ -259,6 +260,7 @@ static gchar *microvm_get_mmio_cmdline(gchar *name)
>  static void microvm_fix_kernel_cmdline(MachineState *machine)
>  {
>      X86MachineState *x86ms = X86_MACHINE(machine);
> +    MicrovmMachineState *mms = MICROVM_MACHINE(machine);
>      BusState *bus;
>      BusChild *kid;
>      char *cmdline;
> @@ -282,7 +284,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
>              BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
>  
>              if (!QTAILQ_EMPTY(&mmio_bus->children)) {
> -                gchar *mmio_cmdline = microvm_get_mmio_cmdline(mmio_bus->name);
> +                gchar *mmio_cmdline = microvm_get_mmio_cmdline
> +                    (mmio_bus->name, mms->virtio_irq_base);
>                  if (mmio_cmdline) {
>                      char *newcmd = g_strjoin(NULL, cmdline, mmio_cmdline, NULL);
>                      g_free(mmio_cmdline);

