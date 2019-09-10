Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5297504wrp;
        Tue, 10 Sep 2019 03:38:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycFJajD18tmGID0WSeZ88S+nFsyHVCxxxL0+1PmVQ1c4ZoRRJIrl9BrkFsjS0ZIBQ+6+mu
X-Received: by 2002:ac8:1768:: with SMTP id u37mr27256643qtk.89.1568111889781;
        Tue, 10 Sep 2019 03:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568111889; cv=none;
        d=google.com; s=arc-20160816;
        b=KHR6xg6gqDDoTjb+fmUw4H9YR+sxJk2dPaJFVljX2+KegWSgd4I6Nc3DJUf9wuJ/UD
         WeBSv7KxaDRKoH73SO5xWCU4O/tVeAcbtNgXBl87rPZ8PWj38nfT9ccHv10CWtKyzp+I
         Zm8YJXAC1mhTyeVT9NdtGeEJvvZb8QvT7D5bqMG78Z2yru2MNTuumHvvmvMd9sAVad0d
         PZlIhonNzBvkDGENLe4zSbDiooJBe1uP2NNbdPHREz0L0YrrpsU1qaCc75lWecg55RpT
         SKgC0ia5fB3KlsXhhn5Von/VDQ+U+Nak8mJUYbrClCvXIANjBoeRCtMR34gSO/toa6bF
         f+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=TZVJWmKprOZXRGNBD4+pTOFKP005jto7a16AExofr8M=;
        b=xrH9rwwE8wSXrLPtzOXhY0NerPv2kvkc564Ql86g//0r9dR8igrapJiepwBqQIu6yy
         8dkmqMc1e9vIKN81L2BFZPYpXW2gMemOwspptovDSnApxz/icDUn9oBV73TbRbvsJ+lW
         56xprmW5C74rr46JS/jQQo4LOgSMPTOwwSls6o1TmH84Fy2ak69ek1RlbMGQxOs/aAO/
         mW1XDTE/SxbGMLLM5WS310A575GwCqyCZBo0NI5sWbBhJl+vSc8ZUk/LD0EZ8tdRF984
         6feFkGa8SnmdwIGjeGk6yLHCHhanYPyjJQKV02h4wR2L0i7bx9YKMlQapqkOBd8rkf9k
         Bo0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89si5062478qtc.116.2019.09.10.03.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 03:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7dXE-0006sf-KV
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 06:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i7dLf-0002eg-QJ
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 06:26:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i7dLd-0003Ko-V9
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 06:26:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60644)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1i7dLd-0003KV-Q0; Tue, 10 Sep 2019 06:26:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8A1BD18C8933;
 Tue, 10 Sep 2019 10:26:08 +0000 (UTC)
Received: from work-vm (ovpn-117-238.ams2.redhat.com [10.36.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 177E66061E;
 Tue, 10 Sep 2019 10:26:03 +0000 (UTC)
Date: Tue, 10 Sep 2019 11:26:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Message-ID: <20190910102601.GA2797@work-vm>
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-4-beata.michalska@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910095610.4546-4-beata.michalska@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 10 Sep 2019 10:26:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/4] migration: ram: Switch to ram block
 writeback
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EQCYz8Ct09+I

* Beata Michalska (beata.michalska@linaro.org) wrote:
> Switch to ram block writeback for pmem migration.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  migration/ram.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index b01a37e7ca..8ea0bd63fc 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -33,7 +33,6 @@
>  #include "qemu/bitops.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/main-loop.h"
> -#include "qemu/pmem.h"
>  #include "xbzrle.h"
>  #include "ram.h"
>  #include "migration.h"
> @@ -4064,9 +4063,7 @@ static int ram_load_cleanup(void *opaque)
>      RAMBlock *rb;
>  
>      RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> -        if (ramblock_is_pmem(rb)) {
> -            pmem_persist(rb->host, rb->used_length);
> -        }
> +        qemu_ram_block_writeback(rb);

ACK for migration

Although I do worry that if you really have pmem hardware, is it better
to fail the migration if you don't have libpmem available?

Dave

>      }
>  
>      xbzrle_load_cleanup();
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
