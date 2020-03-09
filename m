Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1045245lfc;
        Mon, 9 Mar 2020 04:44:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsuimMsmGmHFbCZ5SY/TVsRZiKgcLw4/QH5DF0Xu3Csrqp95m0ehvBiO/Mkh7x8B1WXm243
X-Received: by 2002:a05:6830:15d3:: with SMTP id j19mr12526640otr.51.1583754252390;
        Mon, 09 Mar 2020 04:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583754252; cv=none;
        d=google.com; s=arc-20160816;
        b=hk1uDcivOeiP+chN0ZrihnaY+eC3l3CUbqti64/h/OI/rQB/pZve4Of9F0MoqbAwcd
         hHgFmlrc644DmtiKnZyx2XIs2kKLw/o4xMC9GZGeLnshKGP5K6NaVdh3z859C69PPBWj
         rU2FM0cMfNDVAGOLB6cVK7lTHpQY5P77zi3yPwiUAbs0k53x34CTbG63SthgxUvX56zj
         G7CqN/D+tKcXtVTvFs1X8o7GzXmo4UinzM+vcK/gBMntlQj3u3hbhzreePe5JF41Kb0D
         n99N62gQJS6vxorCTvW+tV19VgoWeDe9YAuP/YlYOVgy9vNiYQVrShOpAPpwhNGZxtk3
         PPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=78I5LVGNS/WghemDDn/hYLUYD1AftfK/zET4ULXdDjQ=;
        b=R576hbXSehL8Kb769dbmd/0MqJ2bsJ3+AItbbJAxYlqNvRHnxyNFqLKvyGCkYw4oZ+
         KNnN2riiINA08WBAv24SPMAYKD4q83ieO1rFuI5OqNWPdIwbRQe4z+HpKV+iDdWBgPtE
         rixdX/vodGA0VeHI7xdlnn5aNFt2YSjLCFY1b5olbh8sgcrl8cQ4PS0Qdwrrak+heD8G
         SJeGEfgnobz4rAoXTLBSktMoGhOV8ULaAeDfdAPTMi7NABlRJphpU3KGZ7Uu87ZEKfqJ
         4OgHxwumHWpQfI0lOq9AlvXkuDhAMH7lAoBkDtNSdMYa+VUg/E/7JSjrL9gb5m58wHhp
         /PAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EEteDGnW;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l26si3960047oil.11.2020.03.09.04.44.12;
        Mon, 09 Mar 2020 04:44:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EEteDGnW;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgCILoL (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 9 Mar 2020 07:44:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22473 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725796AbgCILoL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 9 Mar 2020 07:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583754249;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=78I5LVGNS/WghemDDn/hYLUYD1AftfK/zET4ULXdDjQ=;
        b=EEteDGnWrhdD/fDpZ1d8Ds1Sm6oe2on8tr0rTnZoJHups2oG411tcQ+AeKaj/rjJr5svTe
        c06/M4HdAV3vwcOo6rX4Qqx8SzY6aSMaoG+GHiYanUjlJ+CavNsB7MduIiouyOQ4WOHkvF
        LF/t67y24zaJWBlMSdOzU/wsC2EJGa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-145ePac0Mx-b9s86tx_zLg-1; Mon, 09 Mar 2020 07:44:07 -0400
X-MC-Unique: 145ePac0Mx-b9s86tx_zLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D5AF107B116;
        Mon,  9 Mar 2020 11:44:06 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BE2960C05;
        Mon,  9 Mar 2020 11:44:00 +0000 (UTC)
Date:   Mon, 9 Mar 2020 12:43:58 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 10/13] arm/arm64: ITS: INT functional
 tests
Message-ID: <20200309114358.aaf5dyglehby4pup@kamzik.brq.redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309102420.24498-11-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309102420.24498-11-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qEGgR/wXfEAx

On Mon, Mar 09, 2020 at 11:24:17AM +0100, Eric Auger wrote:
...
> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
> index 0096de6..956d7b8 100644
> --- a/lib/arm/asm/gic-v3-its.h
> +++ b/lib/arm/asm/gic-v3-its.h
> @@ -5,9 +5,8 @@
>   *
>   * This work is licensed under the terms of the GNU LGPL, version 2.
>   */
> -
> -#ifndef _ASMARM_GICv3_ITS
> -#define _ASMARM_GICv3_ITS
> +#ifndef _ASMARM_GIC_V3_ITS_H_
> +#define _ASMARM_GIC_V3_ITS_H_

Another fix to squash into the patch where the lines are introduced.

>  
>  /* dummy its_data struct to allow gic_get_dt_bases() call */
>  struct its_data {
> @@ -19,5 +18,9 @@ static inline void test_its_introspection(void)
>  {
>  	report_abort("not supported on 32-bit");
>  }
> +static inline void test_its_trigger(void)
> +{
> +	report_abort("not supported on 32-bit");

As mentioned before, we don't want test_* and report_* functions in the
library code.

> +}
>  
>  #endif /* _ASMARM_GICv3_ITS */

Forgot to change _ASMARM_GICv3_ITS here.

> -- 
> 2.20.1
>

Thanks,
drew
