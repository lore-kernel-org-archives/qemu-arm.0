Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1929708ejm;
        Mon, 17 Apr 2023 09:27:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350a+9oaY/Aw9B0YHwHpIhxPOZtBK+qBR6A+ia1ik/1s80XRUWCrcCIoijspp1vm8mCJ1EObe
X-Received: by 2002:ac8:5c07:0:b0:3ee:ed8c:2d64 with SMTP id i7-20020ac85c07000000b003eeed8c2d64mr7499399qti.58.1681748828594;
        Mon, 17 Apr 2023 09:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681748828; cv=none;
        d=google.com; s=arc-20160816;
        b=dPRqR1zbQqTZhqX1WEzUF6OWGhkTvzpkbkqglC876Sy5w3DkRBhwIvZ8c8qcLA4nZ8
         CUR8DQyT/Wc0yc9tvMp353e8B+cMEB3DJyH9FoBH4N3bSkdZ7EdYnex48GiefzWiueI0
         Ug3Zs0i/m+o0stcNbHE8bl5yjIs/ZZjRgUKCKHP9Ic0th2krJ8ub7oBWHYj9J9CRB7/9
         c0NvbVJR5lbNvxx1HP2J3nB27Ehe8Xm/NQkG+qHIByQ/Agb/ChkZa+Y9D/TEbiEYcjYQ
         5o8hDQxCGIbfiWQEQ9mwutsgEK5sCQU0KrSohcqUbjp0NCUOhykly/LQUzf6CrhvWAfZ
         +sBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9iDkDRvdM+Z8MX+9PjTKbHa4nvHXFDLDbV82CJku014=;
        b=mEDbzfaU3Depfx4q8lXfjO+y9P5cK0pjQGJUri08FjiX7/6KIgQeQ0BGBXRHNTPoGw
         6ul4QHsKe25bcNNtiD3NqX5BVUQJPjxTgTwakTK2a7adCcv3FhfQ9GRi6oPpkBNLg1br
         X5zVGVflYRdYHH6JY4C/jrdajR2JQNlDqGC1s2FVJy4ZOuxJMXVYRTgfYcmiW+mwrkm5
         7tz0m3wrEM7is7I+NPdZNLCv28UfJqP0RPDX03i3P3xNxn93Uvh99bEDkLV72F9MtJ9/
         citEL4e9QU/4JT62ReSVP3O0aVc2aBxQUKxArIA9u2oWzrDk/ppbvGmbmIZJcPf146HN
         PLrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nnyArK9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a05622a148900b003eb14b07a6dsi4059955qtx.125.2023.04.17.09.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Apr 2023 09:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nnyArK9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1poRgt-0005WM-Tx; Mon, 17 Apr 2023 12:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1poRgs-0005W5-08; Mon, 17 Apr 2023 12:26:54 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1poRgq-0006zX-EV; Mon, 17 Apr 2023 12:26:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A76AF61C4A;
 Mon, 17 Apr 2023 16:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45099C433D2;
 Mon, 17 Apr 2023 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681748803;
 bh=SrbrYbhHQYIUX+oyKn8usNV+FuytzjHVUs3jOde+HCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnyArK9sAzQ548ZkW5YA2RnPHZpk0bfuPFMCFBqCZXL6hd7zrtu380O/9R3D7NV6R
 Re6Owp7wX7GsTtvQN1GUCld9VjUxHSTaaWI8aR7tBCOH1T5Ix6mFl6iYtkTUZjvOYk
 6Fi1bu3TfuCNj2Is4oMresr/lAUR7rg/ox4FjUzHnzlfIlv5vc4k1+npuer6RI/See
 f1DIWe2UUuD6BiIOKKSoUU9Zv2wa3qdx0YI9siUoaIykWpe9GAV3MfRnLaJUW2ggHA
 alU5wIpFmv9MRf98gEg49yGFqpzMMAftoaGEJRE9+5zOQJejsmpLoE+C0Bc/X7n/3X
 2ExEFTyY936aw==
Date: Tue, 18 Apr 2023 00:15:45 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Remove CBAR from A55/A76 and add A78
Message-ID: <ZD1wseM2+xjgeCjb@xhacker>
References: <20230415083657.2308-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230415083657.2308-1-jszhang@kernel.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=jszhang@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: di7/b6739Hiv

On Sat, Apr 15, 2023 at 04:36:55PM +0800, Jisheng Zhang wrote:
> patch1 removes CBAR from A55 and A76
> patch2 adds A78 CPU

For various reasons, I'd like to recall these two patches.

> 
> Jisheng Zhang (2):
>   target/arm: Remove ARM_FEATURE_CBAR_RO from A55 and A76
>   target/arm: Add Cortex-A78 CPU
> 
>  docs/system/arm/virt.rst |  1 +
>  hw/arm/virt.c            |  1 +
>  target/arm/cpu64.c       | 71 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 71 insertions(+), 2 deletions(-)
> 
> -- 
> 2.40.0
> 
> 
