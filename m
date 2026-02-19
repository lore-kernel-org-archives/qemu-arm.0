Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2AAE9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 13:48:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt4Nn-0005eq-0C; Thu, 19 Feb 2026 08:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1vt4Ni-0005eZ-AV
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 08:47:50 -0500
Received: from out-172.mta1.migadu.com ([95.215.58.172])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1vt4Ng-0002h7-9o
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 08:47:50 -0500
Message-ID: <655bfc1f-e705-49d1-885e-6376ea630ded@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1771508855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehzZlhAAdrKVQSJOKkA9mS6NdojqUwNlA0tm2ZHOCoU=;
 b=lzN6NqbAPN631+1aUp3/w3nYNW99B4BbXoQFKywW4yevn3kqkr/SS1hr/v7XvvWgz9G2+S
 9DOHSHdA7cRk8dq1/7L0EqEw7RfboKliUyWKN8ER6XXBw+XVXIEJD/mncjzI6u86pzElq9
 vi5DAaVYVUqM6ocVL64WcU/rDMCt/Vo=
Date: Thu, 19 Feb 2026 21:47:12 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v10 01/14] Revert "target/arm/hvf: Sync CNTV_CTL_EL0 &
 CNTV_CVAL_EL0"
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Cameron Esfahani <dirty@apple.com>
References: <20260215112543.4817-1-mohamed@unpredictable.fr>
 <20260215112543.4817-2-mohamed@unpredictable.fr>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260215112543.4817-2-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.172; envelope-from=zenghui.yu@linux.dev;
 helo=out-172.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/15/26 7:25 PM, Mohamed Mediouni wrote:
> This reverts commit bfbea371ef2cabc47effac5a286e2644d727a8d6.
> 
> This commit breaks VM save/restore:
> 
> Assertion failed: (b), function hvf_arch_get_registers, file hvf.c, line 667.
> zsh: abort      ./qemu-system-aarch64 -m 8192 -M virt,accel=hvf -cdrom  -device virtio-gpu
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 25 -------------------------
>  1 file changed, 25 deletions(-)

Tested-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks,
Zenghui

