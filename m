Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp145599ejb;
        Mon, 9 Oct 2023 17:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKJtJw/NN2T9Co8iWnMZHgZ228AtAcax0DWJ3MflNdTrS07XeyBHU1M008jgXihbrvcAi0
X-Received: by 2002:a05:620a:410c:b0:768:1e00:76c4 with SMTP id j12-20020a05620a410c00b007681e0076c4mr19136511qko.51.1696897735360;
        Mon, 09 Oct 2023 17:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696897735; cv=none;
        d=google.com; s=arc-20160816;
        b=UYMw5vdEJH3UjQl+ERq8BpielRTlaq/uuIPyH3s4eTksU9DRjZQ0rU6JL1KtxsucSs
         Iy6wuAw3wOgec6tUXrLQkL/edvXcVqOXvtRo2KHjwvRbxjkC/e8e87hElNNS6sBV88RA
         0YBBWByJFNmv1cFYDRXqFE0uPARkus39XCRevUAYddi1+8avWgxDsRZDJWy+7G1hIsNe
         0DzWwbHdD24jio4OsGpE60FgpF8Tn9X4rlJWqTTeEvja93gq4elFWYLdEbQg14s42a1D
         4hTr1IFq1vALwWXXecQIfFGXRTMHxyaxKc8SimOyV0Zizhd/m+9mk0tWIa2Lyq6Gny2J
         B7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=NRmEs6EsYop0EY/MZilDvZwL7iAZkUbffuSLo/WQdnE=;
        fh=62S/PbJcfHrzKhEgwLBpHV2yT598oLAwQTquFgkWYyY=;
        b=MKulNEg+8G2gymP3ARhEyXGjoQJNl/BrPQWQwzAG5AIzhNfjmRyn8yWCJCR3/DxFsQ
         Z/t97lnAkJgZRwn3nDiMvID2BJyBcjRE7vaBgEH6oH7rimKgLQrf1AWxvH28L45sDTHQ
         lnLfJOM3sG2+JFq0nnJUi09Ux6uu/kMIgXE1KdgqlFNrNN+4MCZXCQjFsNQGdmqnwTdT
         MyABjV3jd7EPQA9hQehWIvYqw6YcNmvr9vFwP8kDqePANQiRsMGmE45piAFpVGAsaSq1
         ckKR3vgyNA1siDdWPwcHP66qSlTZksjdo6g8DYTTkr5+iLN+usK/Jkntmgwii7oLfNvq
         5ttQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="IuXW/+NE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr6-20020a05620a390600b00773e7fd9fabsi7167778qkn.376.2023.10.09.17.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 17:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="IuXW/+NE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq0c3-0003I2-2C; Mon, 09 Oct 2023 20:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1qq0c1-0003Hh-Uv; Mon, 09 Oct 2023 20:28:37 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1qq0c0-0005tA-GV; Mon, 09 Oct 2023 20:28:37 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A7756145C;
 Tue, 10 Oct 2023 00:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B15C433C7;
 Tue, 10 Oct 2023 00:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696897714;
 bh=jULPOYDxIz+j06ryVjq55Ht43Okhtr8qXI1tfmQO2lg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=IuXW/+NEZfbxPy21LfPsmK8kag4SCdRJmgZKknA1Vw7JfDh4AlLo1nwCE1Hv5roG6
 2w1mRjerjOoIU65z1DBCSZqVvmmkxxzUvakm98Fw+0kTzXRE0JkmllnWc9gtGO6CN8
 c6xdTJvCeSZbFcO8HLYHgnEbTpCiBmZL35pn2/RqTnluX6e8hov1D+bn2sX5NzPMv8
 I+SkWBxEU3TECK/xxI3qaItRbXqJ883KS7fsbW3UIWO7etTbcXmiO0YPBwoNm5f3SG
 XO4A+u6srUhT0bYdxt+cq8usXtDtgLLqTh9qatBtzM1PF7JP8Rtio36ifT74YvXbbR
 ZKP7fRdhAvbOQ==
Date: Mon, 9 Oct 2023 17:28:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [QEMU][PATCH v1 7/7] hw: arm: Add grant mapping.
In-Reply-To: <20231005181629.4046-8-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2310091728240.3431292@ubuntu-linux-20-04-desktop>
References: <20231005181629.4046-1-vikram.garhwal@amd.com>
 <20231005181629.4046-8-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J+pkVN7p6llT

On Thu, 5 Oct 2023, Vikram Garhwal wrote:
> Enable grant ram mapping support for Xenpvh machine on ARM.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index f83b983ec5..553c289720 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -125,6 +125,9 @@ static void xen_init_ram(MachineState *machine)
>          DPRINTF("Initialized region xen.ram.hi: base 0x%llx size 0x%lx\n",
>                  GUEST_RAM1_BASE, ram_size[1]);
>      }
> +
> +    DPRINTF("init grant ram mapping for XEN\n");
> +    ram_grants = *xen_init_grant_ram();
>  }
>  
>  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> -- 
> 2.17.1
> 
