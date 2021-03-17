Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp733732lfg;
        Wed, 17 Mar 2021 13:11:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw97UhTUHXhnxvOSm5FHURqkdi7d86tgh/3haJ3Fnc/1QK5mEIEflLnf0N4oBAhtOCs1T5l
X-Received: by 2002:a05:6e02:12b4:: with SMTP id f20mr8880733ilr.220.1616011906686;
        Wed, 17 Mar 2021 13:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616011906; cv=none;
        d=google.com; s=arc-20160816;
        b=ZhnHPeDvuUwN/bfGorRbD3BCGkcd9LjWA98iN2wX9vfdiqTiBbSX3Qu4P9pbNKBn2p
         2wo3K3rB/yxE2otVpE5Y54wmZdz5wBi8DTCzJK+5A7DA+hxKiAGAkZIpZTKoQuVY0MU3
         AoLyYf4bydINPwJ+lKKJ1NrthKgs8X5Q8AzfQcvZtwE/J94Usth4ss53VWkO9M4X/9tq
         I/PjQG5rbbAQ2f9tiOAhK18EZUKeY+ekbN/H2mTHcEiul/3vOc50NUu0kXtZsESQ9xLY
         FCusX1kN8lXMmg9X6p8hVplnGkjgAQqdem7Fqa4558uwBMxU0j9wZA3k3H0Mn/u05Aus
         YXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=YOcW//TCt99tDP9GJx9K5taei/4iTYAAbjXqGSwCckY=;
        b=FFIV61kUpTdu6IogR+09bVdAPVHq9snhQApZscAzY9mBfN8UwaWl8puOs2wEDuDS/g
         55Rj18ysAHT4L9l7XNdyOiuvnH15XI0M/vFoNpiW4sHJ1ul1htYqq/aQ3AXyjc+B0FA5
         CJSfZwZCVlsT4cLZecL8Ha83NamHnKeXwNuQyvH6BayhANDV0bcxjafNz00XIIpIMfG5
         kji9YE6WT4FnST1uYH0KmW+KcQqtwiJjXXPArvqS95qPX0z0H4K6o2AJoz93d8AuBn+l
         Pdy0DXbKvAySMzO8xti2jreUERlvpD0s9ooQVwUZeerakGqfsKGTLu88/1w/DTPA6nse
         sYqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ShH3GE8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si75285ilt.42.2021.03.17.13.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 13:11:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ShH3GE8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMcW9-0004Qk-Up
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 16:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMcVw-0004QT-V2
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 16:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMcVs-00018S-KF
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 16:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616011887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YOcW//TCt99tDP9GJx9K5taei/4iTYAAbjXqGSwCckY=;
 b=ShH3GE8euesR9IaDTZ0TH1lmJiBuEtJl3fkYymg3xKkpcPmjxqJTLHo8BAJ6AufGOd24a1
 KUArUSWAJ8gZD+sLDTsmGtvzEnJXKL1AD6BFe8J/dQwdL0GEsmEv00beIIUZv78b6Kczd9
 JJ4X0E2q1vQekpXYAvm4LVwhWfgsUhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-JtwrSfumOiSmfVtbTTXJzw-1; Wed, 17 Mar 2021 16:11:24 -0400
X-MC-Unique: JtwrSfumOiSmfVtbTTXJzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D655802B7A;
 Wed, 17 Mar 2021 20:11:22 +0000 (UTC)
Received: from work-vm (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8417360C13;
 Wed, 17 Mar 2021 20:11:20 +0000 (UTC)
Date: Wed, 17 Mar 2021 20:11:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [RFC PATCH v2 4/5] Add migration support for KVM guest with MTE
Message-ID: <YFJiZSW0OjdQdOXZ@work-vm>
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, quintela@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hwjj0JQQjUAl

* Haibo Xu (haibo.xu@linaro.org) wrote:
> To make it easier to keep the page tags sync with
> the page data, tags for one page are appended to
> the data during ram save iteration.
> 
> This patch only add the pre-copy migration support.
> Post-copy and compress as well as zero page saving
> are not supported yet.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>

My guess is that this doesn't work with a lot of other options; e.g.
postcopy and probably compression and a bunch of other things.
Postcopy I can see you'll need some interesting kernel changes for -
you'd need to be able to atomically place a  page with it's tag data.

You probably need to add stuff to migrate_caps_check  to disable
features that you don't support.

> ---
>  include/hw/arm/virt.h    |  2 +
>  include/migration/misc.h |  1 +
>  migration/ram.c          | 86 +++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 921416f918..8b28cde8bf 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -166,6 +166,8 @@ struct VirtMachineState {
>      PCIBus *bus;
>      char *oem_id;
>      char *oem_table_id;
> +    /* migrate memory tags */
> +    NotifierWithReturn precopy_notifier;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> diff --git a/include/migration/misc.h b/include/migration/misc.h
> index bccc1b6b44..005133f471 100644
> --- a/include/migration/misc.h
> +++ b/include/migration/misc.h
> @@ -38,6 +38,7 @@ void precopy_add_notifier(NotifierWithReturn *n);
>  void precopy_remove_notifier(NotifierWithReturn *n);
>  int precopy_notify(PrecopyNotifyReason reason, Error **errp);
>  void precopy_enable_free_page_optimization(void);
> +void precopy_enable_metadata_migration(void);
>  
>  void ram_mig_init(void);
>  void qemu_guest_free_page_hint(void *addr, size_t len);
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da0ac..e67b798c3b 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -53,10 +53,12 @@
>  #include "block.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/cpu-throttle.h"
> +#include "sysemu/kvm.h"
>  #include "savevm.h"
>  #include "qemu/iov.h"
>  #include "multifd.h"
>  #include "sysemu/runstate.h"
> +#include "kvm_arm.h"
>  
>  #if defined(__linux__)
>  #include "qemu/userfaultfd.h"
> @@ -80,6 +82,9 @@
>  #define RAM_SAVE_FLAG_XBZRLE   0x40
>  /* 0x80 is reserved in migration.h start with 0x100 next */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> +#define RAM_SAVE_FLAG_MTE              0x200

I think that's using the last free bit in the flags field, which is a
bit painful.

> +#define MTE_GRANULE_SIZE   (16)
>  
>  static inline bool is_zero_range(uint8_t *p, uint64_t size)
>  {
> @@ -317,6 +322,8 @@ struct RAMState {
>      bool ram_bulk_stage;
>      /* The free page optimization is enabled */
>      bool fpo_enabled;
> +    /* The RAM meta data(e.t memory tag) is enabled */
> +    bool metadata_enabled;
>      /* How many times we have dirty too many pages */
>      int dirty_rate_high_cnt;
>      /* these variables are used for bitmap sync */
> @@ -394,6 +401,15 @@ void precopy_enable_free_page_optimization(void)
>      ram_state->fpo_enabled = true;
>  }
>  
> +void precopy_enable_metadata_migration(void)
> +{
> +    if (!ram_state) {
> +        return;
> +    }
> +
> +    ram_state->metadata_enabled = true;
> +}
> +
>  uint64_t ram_bytes_remaining(void)
>  {
>      return ram_state ? (ram_state->migration_dirty_pages * TARGET_PAGE_SIZE) :
> @@ -1134,6 +1150,61 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>      return true;
>  }
>  
> +static int save_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> +{
> +    uint8_t *tag_buf = NULL;
> +    uint64_t ipa;
> +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;

This function needs to be mostly somewhere aarch specific; or somehow
made more generic.
We shouldn't have RAM_SAVE_FLAG_MTE as well - we should be something
like RAM_SAVE_FLAG_ARCH_METADATA and that way other architectures with
something else glued onto pages can do something similar.
Try and keep migration/ architecture independent.

> +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> +        /* Buffer for the page tags(one byte per tag) */
> +        tag_buf = g_try_malloc0(size);

It feels like you want to allocate tag_buf in setup and free it at the
end rather than doing this in every page.

> +        if (!tag_buf) {
> +            error_report("%s: Error allocating MTE tag_buf", __func__);
> +            return 0;
> +        }
> +
> +        if (kvm_arm_mte_get_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
> +            error_report("%s: Can't get MTE tags from guest", __func__);

For any error like this you probably want to say the addresses to make
it easier to debug when it fails.

> +            g_free(tag_buf);
> +            return 0;
> +        }
> +
> +        qemu_put_buffer(f, tag_buf, size);
> +
> +        g_free(tag_buf);
> +
> +        return size;
> +    }
> +
> +    return 0;
> +}
> +
> +static void load_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> +{
> +    uint8_t *tag_buf = NULL;
> +    uint64_t ipa;
> +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
> +
> +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> +        /* Buffer for the page tags(one byte per tag) */
> +        tag_buf = g_try_malloc0(size);
> +        if (!tag_buf) {
> +            error_report("%s: Error allocating MTE tag_buf", __func__);
> +            return;
> +        }
> +
> +        qemu_get_buffer(f, tag_buf, size);
> +        if (kvm_arm_mte_set_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {

what protections are there here to stop you setting the mte on something
useful, like part of the host kernel or qemu?

> +            error_report("%s: Can't set MTE tags to guest", __func__);
> +        }
> +
> +        g_free(tag_buf);
> +    }
> +
> +    return;
> +}
> +
>  /*
>   * directly send the page to the stream
>   *
> @@ -1148,6 +1219,10 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>  static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>                              uint8_t *buf, bool async)
>  {
> +    if (rs->metadata_enabled) {
> +        offset |= RAM_SAVE_FLAG_MTE;
> +    }
> +
>      ram_counters.transferred += save_page_header(rs, rs->f, block,
>                                                   offset | RAM_SAVE_FLAG_PAGE);
>      if (async) {
> @@ -1159,6 +1234,11 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>      }
>      ram_counters.transferred += TARGET_PAGE_SIZE;
>      ram_counters.normal++;
> +
> +    if (rs->metadata_enabled) {
> +        ram_counters.transferred += save_normal_page_mte_tags(rs->f, buf);
> +    }
> +
>      return 1;
>  }
>  
> @@ -2189,6 +2269,7 @@ static void ram_state_reset(RAMState *rs)
>      rs->last_version = ram_list.version;
>      rs->ram_bulk_stage = true;
>      rs->fpo_enabled = false;
> +    rs->metadata_enabled = false;
>  }
>  
>  #define MAX_WAIT 50 /* ms, half buffered_file limit */
> @@ -3779,7 +3860,7 @@ static int ram_load_precopy(QEMUFile *f)
>              trace_ram_load_loop(block->idstr, (uint64_t)addr, flags, host);
>          }
>  
> -        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
> +        switch (flags & ~(RAM_SAVE_FLAG_CONTINUE | RAM_SAVE_FLAG_MTE)) {
>          case RAM_SAVE_FLAG_MEM_SIZE:
>              /* Synchronize RAM block list */
>              total_ram_bytes = addr;
> @@ -3849,6 +3930,9 @@ static int ram_load_precopy(QEMUFile *f)
>  
>          case RAM_SAVE_FLAG_PAGE:
>              qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
> +            if (flags & RAM_SAVE_FLAG_MTE) {
> +                load_normal_page_mte_tags(f, host);
> +            }
>              break;
>  
>          case RAM_SAVE_FLAG_COMPRESS_PAGE:
> -- 
> 2.17.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

