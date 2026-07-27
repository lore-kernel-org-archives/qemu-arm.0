Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A46C531FC
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 14:04:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woLvs-0007Bf-KD; Mon, 27 Jul 2026 10:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1woLvr-0007A9-4l
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 10:03:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1woLvp-0007AG-SD
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 10:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785161028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/uedi/+XUPUkKbp4YXNJFI9jLAVF08Vs22jhPQ6R5tQ=;
 b=djMjgkJR87kvnTwcUblsZKlhzjrijUMD/wL+Y2nZFDBBMbULGeZcr3s9ZRSW0fRuNfCAHw
 rWMG/mihbSwblajLOm3XrW1V7+wvf4OyLAjbK5sJW499FufDcr7JJ035zvJSKcHVH/bJ1V
 AZZyl/MzrWMmlQ0go05u6agzpbQulVA=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-M9gEefS7MrOLjiV09GVqWA-1; Mon, 27 Jul 2026 10:03:46 -0400
X-MC-Unique: M9gEefS7MrOLjiV09GVqWA-1
X-Mimecast-MFC-AGG-ID: M9gEefS7MrOLjiV09GVqWA_1785161026
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-744e806f474so826438137.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 07:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785161026; x=1785765826;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/uedi/+XUPUkKbp4YXNJFI9jLAVF08Vs22jhPQ6R5tQ=;
 b=l46kHAIfB7IeLOoMGiUehazRbOu9qXOy/h6BBwQrFp+zTnVi8dttsXorDkV2AQwNgT
 GFCGweIH98zRBd9t5gAlwC6vbV8XxBN0gwFYpIoIkDxwe7epJe6OXbwdd+8RcBPbeZlV
 fh5qGG1K/bCtIPWG8zEEYjw82wLqQ0uDStf4ZhWlUTsv2AtGx3zPdxWzHOGF4ZKVxmwk
 vdcNRdM9+YRHkCdwGqSFwrWD0bErjBFdsbL4/0H6yc1erPmH+Amf/J23TA6iIq/PuqAB
 pHAA197OMSlHHCcO4s6jucyH/lj4VfotJb8GFoqnMlyC37wpU4fkVzk7usED9xRaqf4Y
 zgUA==
X-Gm-Message-State: AOJu0YycO0CdpkMgJ4kypIgnce2DCTSaRs2GDlxhoulPrrxmH7wJW7Rt
 F3X+KqFmMcUQ8/HmDAyJaOW6dihbBoqeBuegctRxL10GJKifCAXFxo7udWwUJTUCN40yzQr4Ldt
 P2YmkcAPME+zN/D7RZgkGXew31s6rOG+9IpZYAYcu+bqxR734Dv9nXA==
X-Gm-Gg: AR+sD11qACqXEF+9XAyQC6UYyar3X1yywhHjAwIQ6Gxa3MMl1LR8IyxssHrppwQzEy+
 eCFH87AwdPf/ng6kkwc+YJxZ+8v2oVOpfA7lvSdt6mQD+kz7S1e6f1C9rIjelExWjEoJ7wMoy13
 9kvCdg8zfhsiR3PfSyqBnASNmYZ6NAHKkhflJ7342zgFCzwf3WgQmUII5FopnEF/ITcpEKoKvVL
 68r3jwrLC+h9EcXT+kI0NRTNZlVhR2nCXc7PJ04UFmKfBylV8uuK5S4MdbdkmPo3eyoJ6oFeJ2+
 f0HYIi5xHxqjtStkHCOOesJ+UgwTglVclUTrzj2t8WWOy4q63TppXOzNuovJG4KEIUJEBrHx
X-Received: by 2002:a05:6102:5248:b0:635:1bc8:3563 with SMTP id
 ada2fe7eead31-750408b97b7mr3823328137.20.1785161026197; 
 Mon, 27 Jul 2026 07:03:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5248:b0:635:1bc8:3563 with SMTP id
 ada2fe7eead31-750408b97b7mr3823259137.20.1785161025552; 
 Mon, 27 Jul 2026 07:03:45 -0700 (PDT)
Received: from x1.local ([2605:8d80:6c21:6818:c87e:c65f:8297:5636])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-750362ea1c5sm5486039137.7.2026.07.27.07.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 07:03:44 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:03:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 philmd@oss.qualcomm.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex@shazbot.org, berrange@redhat.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v4 1/3] system/memory: Use memmove() for directly
 accessible regions
Message-ID: <amdlPQtJNoJV3e_o@x1.local>
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-2-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260727032649.145381-2-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oGJK1WPpQ5Ke-ufPGaPKamPJl2QWX4__Nuf_KIJ6fMA_1785161026
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Jul 27, 2026 at 01:26:47PM +1000, Gavin Shan wrote:
> Similar to what's done in commit 4a73aee88140 ("softmmu: Use memmove in
> flatview_write_continue"), there are more sites where the overlapping
> source and destination buffer are allowed for the directly accessible
> regions. Use memmove() in those sites, listed as below.
> 
>   hw/remote/vfio-user-obj.c::vfu_object_mr_rw
>   include/system/memory.h::address_space_read
>   system/physmem.c::flatview_read_continue_step
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


