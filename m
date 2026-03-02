Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AF0E9B365
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 12:20:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx2FJ-00052Z-1n; Mon, 02 Mar 2026 07:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1vx2FE-00050e-6h
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 07:19:28 -0500
Received: from out-172.mta0.migadu.com ([91.218.175.172])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1vx2FA-0003Cq-VK
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 07:19:27 -0500
Message-ID: <b3db6e04-79a9-4235-96ab-a8767754e854@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1772453957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iISHJ5DAeyrn/zoHgIs7HMxlQpqV7SQpUnX9RQkSrZs=;
 b=en8DRRaRcvTIuHIQnPOgVfAhrkcM4XivWOGjrbKKoafvw5H/LmsnMqGMUkOgjREk1LhjpH
 UVZcKx3GK9WhVEhk4UJty0rE6KnhlKUxSqu/0yN4KzhxMr4dQhUtt8jOj1I76G/SdoZQzV
 jHgvgyFyXkoQWFuMyBCriJTxC+ZN93Q=
Date: Mon, 2 Mar 2026 20:18:55 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/2] target/arm/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
To: Lucas Kornicki <lucas.kornicki@nutanix.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
References: <20260118215945.46693-1-philmd@linaro.org>
 <20260118215945.46693-3-philmd@linaro.org>
 <84b3b9fc-d448-4da3-b76f-de72c4e775fd@nutanix.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <84b3b9fc-d448-4da3-b76f-de72c4e775fd@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.172; envelope-from=zenghui.yu@linux.dev;
 helo=out-172.mta0.migadu.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.012,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=1.188, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi,

On 2/23/26 9:47 PM, Lucas Kornicki wrote:
> Hi. I've found this patch to break EDK2 UEFI on MacOS 15.7
> With it applied, the vm is usually stuck on display not initialized, but
> sometimes it will init and hang on the tianocore logo.
> I've narrowed it down to
> 
> b = hvf_sysreg_write_cp(cpu, "VTimer", SYSREG_CNTV_CVAL_EL0, val);
> 
> in hvf_arch_get_registers.

It was fixed by a revert. See commit 28b0ed32b32c in master.

> 
> On a related note, I've noticed that when using accel=hvf on aarch64,
> the cpu usage is maxing out all assigned cores even if the guest is
> idle. It looks like it's constantly getting woken up from WFI. Could
> this patch be part of the solution?

This is another issue which I had also reported in [*]. It looks to me
that commit b5f8f7727177 has made the WFI handling "an immediate
re-entering in guest" which results in the high CPU utilization.

Before someone familiar with the code acknowledges it, I just reverted
b5f8f7727177 locally for power saving. ;-)

[*]
https://lore.kernel.org/qemu-devel/92a63a78-2ab8-481a-8b78-3a86fa130fe8@linux.dev

Thanks,
Zenghui

