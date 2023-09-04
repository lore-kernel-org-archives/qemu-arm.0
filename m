Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1454325ejb;
        Mon, 4 Sep 2023 09:32:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRlLl5s7Ts7wyVTj1Yl4e864wsKf0wUuPlIP/BsBufIRV93iuxSclY3EKMGlNLgnDtSXoF
X-Received: by 2002:a05:6214:1710:b0:64f:92dc:3de3 with SMTP id db16-20020a056214171000b0064f92dc3de3mr10813511qvb.6.1693845125768;
        Mon, 04 Sep 2023 09:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693845125; cv=none;
        d=google.com; s=arc-20160816;
        b=AQUTH6mfAcwRveijJd+KERpxQozsre1RWbRsoKSQoR8gvYNNXkUJ/Unl+5IHhdgNHD
         o7p+/UqqzCtiDEF1Slfsv0cpNq2h0n48XGMM5gzzP9FkUzdYxM8cuKHpT4YLuamER5U6
         N6zF8coql1TK0gHgIQ9ckBHK73CXWkGOGc5b4xhp0mrdpBYgns51VnK+QYmOV29+oDyJ
         MLWm49yo12h5TM77ZSI9vYZbxmnpYqp83dWXvri4WXV/0P0/1aeK39Riww1YB8xk8DyX
         asTtb99haMe10+sjjf6WhEdTUrfUcitSWK4PokLYP6VCFFyBJ+FLnNdejmsutXlKgZjp
         C7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=CevAXTmAKTerVFrbSIIMh/W4drWPIee55Lt84hT39Ps=;
        fh=b5nq+owfHo/YKmvHl4HEg8x7p0CKvsVBNVwxK9IGP4U=;
        b=CwVd6L4lDsX/xMNv+gNT/Uwjl9D8pNgG3FT843hgIWZjaAoLicP7LgL3xUbQlIjsO2
         u9Bg1TvahH+If/iNShFfq43p4t8PJxyKBcxv3VAiGyHTR1wiW55ixuR21udryNyQYVzH
         /nDsjW2o3fHC/ImqHd2M02PO3RTt54W+cLWnofJquUzM7mg76TlS2l4tWsxHw88FOYSX
         6jnPdoJSC/V6bmKiCqDrRAUN8E66Uo19Uf1yJ+qqO+G+2uYlYdxMtsZfzPbjYzGuw1w9
         kAwhJTmz3/2VJS/lFupou7BnBcWzrnWpWcLYz5hPb3444VgDafWIZLuCZnc7UbZ9/8Vx
         ER4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gUu0HsCh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020a0cab55000000b0063d39088a16si6838963qvb.567.2023.09.04.09.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gUu0HsCh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCUH-0007va-IK; Mon, 04 Sep 2023 12:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qdCUF-0007uR-Pz
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:31:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qdCUC-0003AE-QY
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693845095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CevAXTmAKTerVFrbSIIMh/W4drWPIee55Lt84hT39Ps=;
 b=gUu0HsChOnaqceOrwW4ulfaVP50iljIP817kz2nCY3TkQIp/yZd5LBLI+Coy8NoMI88Lx3
 cdWgtMVirk89wDCLJQUYLVakPjap1E9vIfTcjFNKthj7+ZahROp0kyB5xRRNHUqZVmbMb2
 zvok0gQI9N2a7S5K6yhZSWV2Wcm0Vhc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-OVQp4jEWMW-FNtP72SyKXw-1; Mon, 04 Sep 2023 12:31:34 -0400
X-MC-Unique: OVQp4jEWMW-FNtP72SyKXw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91D1D10264F5;
 Mon,  4 Sep 2023 16:31:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EDC0493110;
 Mon,  4 Sep 2023 16:31:32 +0000 (UTC)
Date: Mon, 4 Sep 2023 17:31:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v2 22/22] softmmu/physmem: Clean up local variable
 shadowing
Message-ID: <ZPYGYgs88/zgOHLc@redhat.com>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-23-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230904161235.84651-23-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SVSx8Bf0MGMH

On Mon, Sep 04, 2023 at 06:12:34PM +0200, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>   softmmu/physmem.c: In function ‘cpu_physical_memory_snapshot_and_clear_dirty’:
>   softmmu/physmem.c:916:27: warning: declaration of ‘offset’ shadows a parameter [-Wshadow=compatible-local]
>     916 |             unsigned long offset = page % DIRTY_MEMORY_BLOCK_SIZE;
>         |                           ^~~~~~
>   softmmu/physmem.c:892:31: note: shadowed declaration is here
>     892 |     (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client)
>         |                        ~~~~~~~^~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> RFC: Please double-check how 'offset' is used few lines later.

I don't see an issue - those lines are in an outer scope, so won't
be accessing the 'offset' you've changed, they'll be the parameter
instead. If you want to sanity check though, presumably the asm
dissassembly for this method should be the same before/after this
change

> ---
>  softmmu/physmem.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 18277ddd67..db5b628a60 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -913,16 +913,16 @@ DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
>  
>          while (page < end) {
>              unsigned long idx = page / DIRTY_MEMORY_BLOCK_SIZE;
> -            unsigned long offset = page % DIRTY_MEMORY_BLOCK_SIZE;
> +            unsigned long ofs = page % DIRTY_MEMORY_BLOCK_SIZE;
>              unsigned long num = MIN(end - page,
> -                                    DIRTY_MEMORY_BLOCK_SIZE - offset);
> +                                    DIRTY_MEMORY_BLOCK_SIZE - ofs);
>  
> -            assert(QEMU_IS_ALIGNED(offset, (1 << BITS_PER_LEVEL)));
> +            assert(QEMU_IS_ALIGNED(ofs, (1 << BITS_PER_LEVEL)));
>              assert(QEMU_IS_ALIGNED(num,    (1 << BITS_PER_LEVEL)));
> -            offset >>= BITS_PER_LEVEL;
> +            ofs >>= BITS_PER_LEVEL;
>  
>              bitmap_copy_and_clear_atomic(snap->dirty + dest,
> -                                         blocks->blocks[idx] + offset,
> +                                         blocks->blocks[idx] + ofs,
>                                           num);
>              page += num;
>              dest += num >> BITS_PER_LEVEL;
> -- 
> 2.41.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

