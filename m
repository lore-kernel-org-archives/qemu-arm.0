Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E6606A31F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 11:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nongnu.org header.i=@nongnu.org header.a=rsa-sha256 header.s=lists1p-gnu-org header.b=TV+yKg7J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rev.ng header.i=@rev.ng header.a=rsa-sha256 header.s=dkim header.b=eZrosO1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nongnu.org;
	 s=lists1p-gnu-org; h=From:In-Reply-To:MIME-Version:References:Subject:To:
	Date; bh=dieMY0Ag6+BYFnX3LHnKxW0hy4MJ2im2uF7lxaGI15s=; b=TV+yKg7Ji85FhMID0BGf
	l9r4hvK6ZCaBRGMj5U6HVBEolBr1WgGfdXUKUim+2H4eqPI+EltitPtWDz4pgyjL8e6Vzi/GHc0mK
	s3ksXjSJQWNsIUAXKGlpkcVAZJHkyWWqR+L/CZ3qJ2vSGUhWKDC0G9cvS59+UGfu6gdQHdmJer9HG
	Sh8qshyXLGxREY67V6yT8NHXnP8vEIrmrkW7uOuOnXMdhuEIhcV3dnS0pGUG69cexV7gdrsJFBIKl
	OA/FlBzoTf9BTuBbwPzlb4JwrNGsDKa+YObj4YHeimyiSguKfz0sYtLfL/kP5/R10Iqlyj8voVxBO
	exbtlSr6m+hoKw==;
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWu43-0006CU-N4; Fri, 27 Nov 2026 06:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWu41-000671-5a; Fri, 27 Nov 2026 06:24:25 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWu3z-0007si-Ou; Fri, 27 Nov 2026 06:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=dieMY0Ag6+BYFnX3LHnKxW0hy4MJ2im2uF7lxaGI15s=; b=eZrosO1f6uvIvLZ
 xaJsAAmMBtRSjuP7kZgnyT7EAgd1Ewss5fAGaP/GTZ0YdVJ6rC4YmbLIUNPDjUi45ekSD4bw0QBjY
 wrNZDH2GRP7HHjAauCOtXbqhZKKvYbLJoz6GgQjBakkIaTQKAtdijauN11e+OmoRCrfIfCgdq7VEt
 Yo=;
Date: Fri, 27 Nov 2026 12:30:47 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: Re: [PATCH 21/24] target/sparc: Use 64-bit TB flags
Message-ID: <awlptdm2pO1Vqrvi@hive.localdomain>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
 <20261126233604.67722-22-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126233604.67722-22-philmd@oss.qualcomm.com>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/26, Philippe Mathieu-Daudé wrote:
> TranslationBlock::flags and TCGTBCPUState::flags are now
> 64-bit, use matching types for the values derived from them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/sparc/cpu.h | 4 ++--
>  target/sparc/cpu.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>

