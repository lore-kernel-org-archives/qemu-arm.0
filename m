Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1930603ejm;
        Mon, 17 Apr 2023 09:28:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aSm1iBVEkqA3NAEWdP5CAT/HkV8hjflOOG0P9p5W/jFxvT5vcOo63DLicjeycL1Zo4k0om
X-Received: by 2002:a05:6214:2a8f:b0:5ef:7e33:c6c9 with SMTP id jr15-20020a0562142a8f00b005ef7e33c6c9mr5721648qvb.38.1681748922607;
        Mon, 17 Apr 2023 09:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681748922; cv=none;
        d=google.com; s=arc-20160816;
        b=KyDLv6KDWKjIU2unLgtn/I2bb/ugdjBKfCwR5FNOM/El2Rs0HmFksOaJqhW1/R6Ypv
         KOGmUfxlPtzCird42fqgIWDmXwppnUsmQVxR2HvOSiygDDCXGp+7DGpa5S4riHilGJJL
         WhCkCgBPul4cHtpPIhNaXNWiXrgp9AJ0LFaxh9ffUb3NqiuIPUmakSviI69WAPXqBENq
         90dm9RhKSfgVkpwT1DEBHL+UhxjsN1XM/q6mrpMFB5XapqqFspDzBmWvbFFH+xaifAEk
         nMZgfcrUQmJ616F90ieVRb00aTbO6FakxdZVMADG8QGmInbmCCpbmdpdGVxouUrloKbD
         v/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=y0RIb23JMQ6tHM3NE+s0bwduqk+0ej4GXjtI69J4WFU=;
        b=phtLeLrsqjbeFoUKqB7wcxgMsJeOf50aGrs1P1MYKgU415N3yXm+5Z3J22B5qzuDNL
         nrpOcTi+xvxes7eX/qjD/r02yYBYWlLFShciWhRrSa6t1lmALVDoO3R13nHIrq8Y/OI4
         e81J7KMMQ6BJX0xMIWksr/ezj1iuCOW/tjYwxz2BjwVWw/olT/0XKv5L5LwrfP5GvUks
         mgkALZuDqeD73ZfMkZZdfguDmx8Qvl2rq9rtgQybkoYSKyhA7Xf933kh5Bqh+gTfftGT
         HLRM71+pGSHHWlig1FFzmo9yXANVwaWgmZDjtoo7KCD+ADKCdAdFwr0ReyxKItpHWn0k
         H+rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mosJFT17;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a056214076100b005ef676dbf85si2427055qvz.420.2023.04.17.09.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Apr 2023 09:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mosJFT17;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1poRiS-0006wa-QZ; Mon, 17 Apr 2023 12:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1poRiR-0006vp-CD; Mon, 17 Apr 2023 12:28:31 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1poRiN-0007Jo-O7; Mon, 17 Apr 2023 12:28:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB25A61B4B;
 Mon, 17 Apr 2023 16:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F639C433D2;
 Mon, 17 Apr 2023 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681748901;
 bh=Zf7OyxqI7q7xYu/Majbant+5+e+VKTO7v2AYbKgsnsM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=mosJFT17FFaJiBLxD0sMxWR9hFPM0HrUY9wt44O8xgJBFsgHDyxGEaVStzQQ6xN1e
 TuZXwqnL0X2keDPvocToJIbkDikf8Jet7UPkVXHxuXx6OtE5bRzCIEQh9oq6Xhnwxh
 PwKU+z7yHw/OQIi6Omcsj6w1jvMNZhq8xkjqgcnfPq8zVRpBasdy8Dbu1xe8+Rz9Gl
 EXv7/wwhA4vtoUaD0RPAq9KIJFo2KooTzjsaq0+CRzlwSVPYKAwJFhQFQMxNeiWEdf
 xKq1s7zMXGF0itdR8psW0ZKEskKGU3xfdNtkP+VkJzlrWjz5B1+xYs6D6rlRKljrwy
 WJYIHqb3uEtYw==
Date: Tue, 18 Apr 2023 00:17:25 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Remove CBAR from A55/A76 and add A78
Message-ID: <ZD1xFUMtaJzKJvjT@xhacker>
References: <20230415082827.2054-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230415082827.2054-1-jszhang@kernel.org>
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
X-TUID: VQa6w34KWFm1

On Sat, Apr 15, 2023 at 04:28:25PM +0800, Jisheng Zhang wrote:
> patch1 removes CBAR from A55 and A76
> patch2 adds A78 CPU

As in another email, for various reaons I want to recall these two patches.

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
