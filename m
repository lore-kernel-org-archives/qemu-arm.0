Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05187CC6B26
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 08:14:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8DC7-00032E-Bz; Thu, 02 Apr 2026 04:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>) id 1w8DC5-00030y-Jt
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 04:14:25 -0400
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>) id 1w8DC3-00032J-Eg
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 04:14:25 -0400
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 62FE280021;
 Thu, 02 Apr 2026 10:14:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1775117655; bh=j0kcd6m0x5nWmxnpL2fTIJMtwx59PdC+tDwOsNhz7w4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=b7hCt27j/Ep3L9agS8JdWQUMLInVEmsXlMKp3aK6EiatWHPI9OEL1FGBc+X+8h99M
 xO4UbYjiacWRKqT1lcYZ+qgtAnUVx1PIFE8bl6lVptYb923Rri+raXarKTyIowDfyj
 UZbBU+1IDRq0cY/QnHbByPV48bLLfStjh6qlToOOm0gTreVpkh9ZDFNva0nEgwIYm4
 txmwd4qXi5mEf8M4XdTy7/+tAGXcVuOCj/Y6q9Y4ciAKjjseDm9gIQbiAKfn2JOsGu
 K9cl9JqvJrXE3T2HZ3phLIVqTbbVTUVPbtbdQXTtJrNXdgsCUQW5WxcBLrM960oN5D
 lo5w2IwfXXUbQ==
From: Samuel Tardieu <sam@rfc1149.net>
To: zhaoguohan@kylinos.cn
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/stm32l4x5: fix stale peripheral comments
In-Reply-To: <20260402080119.200785-1-zhaoguohan@kylinos.cn>
 (zhaoguohan@kylinos.cn's message of "Thu, 2 Apr 2026 16:01:19 +0800")
References: <20260402080119.200785-1-zhaoguohan@kylinos.cn>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Thu, 02 Apr 2026 10:14:14 +0200
Message-ID: <87ika9dbjd.fsf@rfc1149.net>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1, RCVD_IN_VALIDITY_RPBL_BLOCKED=1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

zhaoguohan@kylinos.cn writes:

> stm32l4x5_soc.c still has a couple of stale comments left behind by
> copy-and-paste updates.
>
> The EXTI wakeup table labels IRQ 53 as UART4 even though it is the
> UART5 wakeup line, and the reserved APB1 gap after IWDG is still
> annotated as 0x40001800 instead of 0x40003400.
>
> Update the comments to match the current STM32L4x5 layout. No
> functional change.
>
> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
> ---
>  hw/arm/stm32l4x5_soc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Samuel Tardieu <sam@rfc1149.net>

