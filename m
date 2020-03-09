Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1053022lfc;
        Mon, 9 Mar 2020 04:53:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvO+J57rUOM1R14TgxwOU3SSyaETccLxQ5cF/uaiRqi6LCQkKZJ/EddRvglJL7zx/kW7FfI
X-Received: by 2002:a9d:6a06:: with SMTP id g6mr11796801otn.305.1583754790379;
        Mon, 09 Mar 2020 04:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583754790; cv=none;
        d=google.com; s=arc-20160816;
        b=MCzS/PJS5Z+c/pvusYCel1PQN5F4w3YuMDvEWTP6WvlH6yLRzv0g+c0XbFwrhMNi+6
         rc3x/qR9YVRvynOBZlMPkJUgsQt+bE/I3vnr0tfYBUgyqM5CV3mi8MlM9Ovhiw4ONS5x
         KWRFw60zrIKVWG/QZyhHiNa2u51ApAgElLsg5/2fgM0wbiwRl7KsX8JGXit/DI3D0Qkm
         GOnnL+mlWUoPJ41l2IKY8/zP1A+mC57RvSIFCJNcspZXkwi9fZ51Zp7P8h0eWGcArMsl
         x/bTV14xu7+SA7DBA9eCVuOZjpVgUX+kZzDtfKrXT8eptxIrnIqhSHRRt+qLYDczhuGN
         sxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=KBLLFAeCjCkZQxE+M1dfsu6NPU5v8sNcOYuqxDc862s=;
        b=0693v9daz35xpj39yChXklIaNFlsTEkI64//vdYwGosQL9U6rElVb7iq2/JXXAQsGV
         06kblvGfggk+ebe6JQ3ejY33nsjwmHwkgysLJxQXZ12WOPJbLM/Yrj1JZg4aTRNzAj1s
         ZSWpAko29BfAhcZRSPPY5AUagGkrh+grZfOIhmKO3TI21ftWxrgqOC4woLD+YOaV1F32
         Dw87h7lhNzGlUrEKXeIy4obTLnrpHzOdM8BmrbZ2F+WHlXTxpIWy0J7s6U1wUrS9EXZs
         eO9frm6zJOf8pYn/vdKIfKnc1lb69ZONj2m1+Ru1Hr/O3jS5Id7q8V5WOe9bsDbAh6rb
         CGTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eYl96P4Z;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c2si6894548ots.130.2020.03.09.04.53.09;
        Mon, 09 Mar 2020 04:53:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eYl96P4Z;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgCILxJ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 9 Mar 2020 07:53:09 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46319 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725796AbgCILxJ (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 9 Mar 2020 07:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583754788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KBLLFAeCjCkZQxE+M1dfsu6NPU5v8sNcOYuqxDc862s=;
        b=eYl96P4Zuy5RbKGX7vPU1G4gc9TkRS3jr8AKcaSTDVB6rW3t3GumTk8f30PYRogyaTWj8l
        08NKR3ynpL2rNm5aa0IUb5wSDL1UpzHOJCSbDrQwzzzXobGChg1+igBLJKKAOTUVBh/HUV
        2TczM5ULTvlZrg4dHyRbX8erjiM6K+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-0VGg1kgrM-SYTigNxxjiNg-1; Mon, 09 Mar 2020 07:53:06 -0400
X-MC-Unique: 0VGg1kgrM-SYTigNxxjiNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 815AD1401;
        Mon,  9 Mar 2020 11:53:04 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C2F1F1001B30;
        Mon,  9 Mar 2020 11:52:59 +0000 (UTC)
Date:   Mon, 9 Mar 2020 12:52:56 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Auger Eric <eric.auger@redhat.com>
Cc:     peter.maydell@linaro.org, thuth@redhat.com, kvm@vger.kernel.org,
        maz@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        andre.przywara@arm.com, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, kvmarm@lists.cs.columbia.edu,
        eric.auger.pro@gmail.com
Subject: Re: [kvm-unit-tests PATCH v4 07/13] arm/arm64: ITS:
 its_enable_defaults
Message-ID: <20200309115256.beb3uwc2lyukavey@kamzik.brq.redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309102420.24498-8-eric.auger@redhat.com>
 <20200309113914.pg5522tvwazgrfec@kamzik.brq.redhat.com>
 <73691fc7-45f3-6274-019f-aa5b0d2a0c1b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73691fc7-45f3-6274-019f-aa5b0d2a0c1b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 5onaHAXpfCOn

On Mon, Mar 09, 2020 at 12:45:34PM +0100, Auger Eric wrote:
> >> -	for_each_present_cpu(cpu) {
> >> +	for (cpu = 0; cpu < nr_cpus; cpu++) {
> > 
> > You don't mention this change in the changelog.
> Hey, you can see the changelog is pretty long already & accurate. But
> you're right I missed that one and listing those changes too would have
> avoided me to put those changes in that patch.
> 
>  What's wrong with
> > using for_each_present_cpu() here?
> As you encouraged me to move the alloc into the it, I tried to do so but
> then discovered this was feasible for such kind of issue. At init time,
> CPUs have nott booted yet.

They may not have booted, but for_each_present_cpu() should still work
because the present mask is initialized at setup() time before the unit
test even starts.

Thanks,
drew
