Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3906136lfb;
        Mon, 16 Nov 2020 09:46:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtILTzWSKy/orovPsP9kc6Fdj1LPDGUckuWiwoTPdJGtXJgFJKrLH03h4V+0dZmoJorgST
X-Received: by 2002:ad4:56ee:: with SMTP id cr14mr16991318qvb.15.1605548804925;
        Mon, 16 Nov 2020 09:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605548804; cv=none;
        d=google.com; s=arc-20160816;
        b=0d4s5T0VuYiT29Nva7jT1wmDJWgohekYDUBzBGLa9dbJNZ0Yctyrxveq490nnvpXpZ
         8LBQbn7evcJGJSMple7tp/tMPF5XtjYeMk/WUR3MNFEZRrJdW9G56jYp7k6eVKYLq9jw
         EZHTF7OZi3ZnGL5qjj8mxVMZB93h8rWicrbKVP2xmVkGvQiwQUJqgh8IP+6AiQ33Qnkz
         u6saK6EICk2Mkp8TiM/gGrXdSEaYUIC/RT6uRI3YWitQkD6gEHhQY3Pc0uYTRgRpG4Xu
         Ng2NVb16DbtbJ5GRejcl/+eyBw3380c5mVKZpVMmCfc6v8BgJt8XFl83cql8uEe/YVwO
         LY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=AU1Bo2BXNnhkcTIJReQjPwXotveOCyv+Jtv5EgpethY=;
        b=gzUS2HO2Kxu9naqU5tqahxQki1CdCf7uazCETy9LXeeV7NJz16WUwSfCgi//x2m7b2
         uDHAFOhskEa2R4wN/iQD+SJ7d1GeAEe4LDjhIcnDUL1iCZ0OsDI2SiJ59a04MPpL9QUc
         ODuluAmnNGncWa2qifZcxYVs3e5tJul61PNSXupzH+/ZPXuJz4TmdDgKdUMSQrhGr7TR
         aifAWRwJGnaDgmcF43SZtOg6qto7nJO0YNvqrPaKbOYv2+J7Nz4L5IJBd2S6JN8lUN8C
         xRtDlZtM2cLO348BN5oH22I+NR7iNtblbrgg+KUvQBQMURvonds+25dnZ1kE83QefTE3
         NHcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=ggVwgSeW;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id k19si1680281qki.306.2020.11.16.09.46.44;
        Mon, 16 Nov 2020 09:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=ggVwgSeW;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6FFE24B88B;
	Mon, 16 Nov 2020 12:46:44 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsIWEyCHXhGB; Mon, 16 Nov 2020 12:46:43 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7D93C4BD21;
	Mon, 16 Nov 2020 12:46:43 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C33114B88B
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Nov 2020 12:46:41 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpLl+cEzrM+8 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Nov 2020 12:46:40 -0500 (EST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C96C44BD19
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Nov 2020 12:46:40 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605548800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3SZrwFy94uqqUNynXuBp4m3e29h27rqR4XdQ73aJwA=;
 b=ggVwgSeWK4NPYBVTvO86FMyXhkSMMbje9DdFd56kdm/GNzDLugXItlwvZGOIkNJbedbLzX
 Gc02nVFfTNyryVAl33S4xBu7rL2rUNP8u8+PTQC5oVpHm96t7msFGCX/ORDktXxMPK7XKx
 zwVK/UaNkypG3BgdMGMjySY3b8weAyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-Fs1SYoHcM8y6DcdAEDrZqg-1; Mon, 16 Nov 2020 12:46:36 -0500
X-MC-Unique: Fs1SYoHcM8y6DcdAEDrZqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99F5B803F44;
 Mon, 16 Nov 2020 17:46:34 +0000 (UTC)
Received: from gondolin (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 866176BF6B;
 Mon, 16 Nov 2020 17:46:32 +0000 (UTC)
Date: Mon, 16 Nov 2020 18:46:29 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] memory: Skip dirty tracking for un-migratable memory
 regions
Message-ID: <20201116184629.7455b82a.cohuck@redhat.com>
In-Reply-To: <20201116132210.1730-1-yuzenghui@huawei.com>
References: <20201116132210.1730-1-yuzenghui@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: qemu-devel@nongnu.org, kwankhede@nvidia.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: tcl84RhCGO9p

On Mon, 16 Nov 2020 21:22:10 +0800
Zenghui Yu <yuzenghui@huawei.com> wrote:

> It makes no sense to track dirty pages for those un-migratable memory
> regions (e.g., Memory BAR region of the VFIO PCI device) and doing so
> will potentially lead to some unpleasant issues during migration [1].
> 
> Skip dirty tracking for those regions by evaluating if the region is
> migratable before setting dirty_log_mask (DIRTY_MEMORY_MIGRATION).
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03757.html
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  softmmu/memory.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 71951fe4dc..aa393f1bb0 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1806,7 +1806,10 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
>  uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>  {
>      uint8_t mask = mr->dirty_log_mask;
> -    if (global_dirty_log && (mr->ram_block || memory_region_is_iommu(mr))) {
> +    RAMBlock *rb = mr->ram_block;
> +
> +    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
> +                             memory_region_is_iommu(mr))) {
>          mask |= (1 << DIRTY_MEMORY_MIGRATION);
>      }
>      return mask;

Looks reasonable.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
