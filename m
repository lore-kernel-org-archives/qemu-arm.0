Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BD8CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 10:39:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNpxE-0007NN-6j; Fri, 15 May 2026 06:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNpxC-0007N7-U2
 for qemu-arm@nongnu.org; Fri, 15 May 2026 06:39:39 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNpxB-0005PW-HG
 for qemu-arm@nongnu.org; Fri, 15 May 2026 06:39:38 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6563f83ae9fso12012395d50.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 03:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778841576; cv=none;
 d=google.com; s=arc-20240605;
 b=C/RWsUd2uFXq2wPIqx4aBdmHFp9yiYQzRGboHNjr68DDK8Nn9tVQ91ExJHRE8wdAtM
 0QwjI8n/QkiY5PescO1iVmY1r18PeBsZndembmmq2hxS7b2NOnE6B4ait4//njTjIWWC
 0Ux+3UVbKuND6ueJ54NJgWZzYfwF2RSHPWEHdepBj8SG4Q80zoihfepO3kvHZ0G1vxTl
 j00c0n0ZAseNMhDMgeao4DrNPPFoYR4VlWXqZQ6Z9vAzxAy2eKcB/rc75OBsUoPebXlW
 Zw1XZ0Ps0B/FlOE+ClUHhSLzPt1T5BBdrqzgqIVH74I3n2ueRx/gW483fUWPMlQMF5+a
 DxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8V9MsRPAtrfGNpaBIrVqmbcRuCD4OEpbMZ0Gmq5IewI=;
 fh=Jm75B/aOqy7x3dGC80KWekSapce/9CwfAnQ5wz0vFUQ=;
 b=PiSrFYGuDAXsdDPMUHsIY5mQPdoCGs0HrlZ4x7UogBAHb1FxJ84eOFaoLw4DRv4tyG
 EdLjEf0H6jjMI5mt73YRIzelx18tDdPRvYnlM+/rHPWlSRMaSzVz0sIxwTjsUKG2by5j
 6FIMcOkcdkZLDYhCrQAFCyfjgM8x7Pxe1XPzbG7/OU+DLWbtUc8U30pug1MBMQDMSk/X
 X2EnQsdjv7yKf/pEdJXC+GwTB6uMLi5/4d0S/fQaWI7F3+pbZyla3CB4xJqm9Wehulm2
 VUCLsW6Lk/VUSMYiZTAVMBy+V1eu0WcVv6aItfwFU30IVahZ/10PwH1JA4fnTRkmgEMo
 Yccw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778841576; x=1779446376; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8V9MsRPAtrfGNpaBIrVqmbcRuCD4OEpbMZ0Gmq5IewI=;
 b=JspHA/jEZ0ALoB5rwNy5tsi97U0KNNwXpHUFXEti5JCVLpOs6uGQ9bWyJw0VrQ/CrG
 My4+BEA4KaYBNlV6pxMJixPTIoM/tZsTINRekt/kOrNBvHQ+/0kJsevP2H0yXumS60u9
 /ifnpGgj15iGKihr3sTBm18DlWowhz2dvGsI62yGtWiumED2IrZUCzlIaDftL+C4PG3b
 U5w6j1Gd3t/A8Btlf/90BJJo8WT1v8T6XoPyPkqCZ7mAR/xjdhmSrASgLA0hE2nDc96N
 b3gcQoVyHCfeNnD12C6q1xrsR6mJi1KxnkfOXXCmFxptCqYBSPR5bNcisJGDQTXm9aDa
 k1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778841576; x=1779446376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8V9MsRPAtrfGNpaBIrVqmbcRuCD4OEpbMZ0Gmq5IewI=;
 b=pGvPU6a53adsh3XHZ3UA2am9G0ffzLILnE8YJ7d35blFVTJI9zYyltfBmNnrlP3KIO
 BJxtxBuLJ7OvvSHpYqo+w4kkiY1UmeelV9rIihyUp5Wnk37Jkt2GaSX/JOEHyud8AhCh
 8JTtuWgawgBEe7ai92CHc747Ja4B6K4v8dsWQehiTcks6OFtUWkjysuy2aecv3cXKDy4
 oXM4fwsxgCBZ6NzEgfThH+dczfuGJ29SMnuGS9Lqn4skU17w8y6L0QUJJK8O2hsc5fLV
 rlRKsAqD68TVjfGXmHv2DlhBCCCAkfx1mznRlvrlw/CHjrE6A/JvT6eF/KpWJEuHndZq
 aeHw==
X-Forwarded-Encrypted: i=1;
 AFNElJ92S9K86ddALHMDsTJLdKhMnOUY5lMQJuH5Ghv7uyFcbnIaVdNPaLJLIDo3KdjZFQtPi4s4aUfIRA==@nongnu.org
X-Gm-Message-State: AOJu0YwNL0eKDMNssLocqCq1jQ1tzHTQXWMHEtkda97U5EB/MDyPRQF+
 9XEKhHMFD/HXj6qP5wrrxGy4mDbQq5qc/mjRhIiRWqob1zhjR6g33fwRqejVBgWcQkJNDw9WC/Z
 n1WxL1QTq/o/BeKvwjzl9C6DxCQV2siwGtSFimJCrxw==
X-Gm-Gg: Acq92OGl1Ennl4LSGgW1/if3QYOelFBKWitbncwVaxH099uPrgZ+VxburJG0pcOJMg4
 gHsK85CATFOAoZ3TWYddLvSHNpcBN02qQmjfPUNePraDrHODlp8zJLLp/dDYAUKTdugTuvXKROY
 RR8dS/Es8fjaN8AM1xu7ZgQsIEy56ndtkTAxlzYIIzn2Bo4Ph4vJRpIZibyWTZGPHTad2nCYzeE
 9slcLhAmQVp3zU/F/gtCMUUcu+pjdjpYpv5EGOGwwbjbtjavXuPjdMnICd1wdJV3SuCOqVxNvZM
 Hdp79NFyud6qEtVfqSps+gSebrepevmbTJdpNbyb9dV5TCa486+aBa7PMeHxoXec8xo=
X-Received: by 2002:a53:d047:0:20b0:65d:7e2c:cbe0 with SMTP id
 956f58d0204a3-65e228e63c6mr2588404d50.55.1778841576196; Fri, 15 May 2026
 03:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <E8468087-647B-45B5-AF4E-85DD15A6D35C@unpredictable.fr>
 <20260513022109.14107-1-scottjgo@gmail.com>
In-Reply-To: <20260513022109.14107-1-scottjgo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 11:39:24 +0100
X-Gm-Features: AVHnY4IX_hjQfNJWNgwLl3fNZZjt4IBEdXLie5Ju8_mLEpWeWNg_39Y7NlmnxeY
Message-ID: <CAFEAcA__VLg89_c3ZJMfN4BJs4sJ4KGFKnNVOW9AppoARRiMtw@mail.gmail.com>
Subject: Re: [PATCH v11.1+ v4] target/arm/hvf: Fix WFI halting to stop idle
 vCPU spinning
To: "Scott J. Goldman" <scottjgo@gmail.com>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Roman Bolshakov <rbolshakov@ddn.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 13 May 2026 at 03:21, Scott J. Goldman <scottjgo@gmail.com> wrote:
>
> Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
> changed hvf_wfi() from blocking the vCPU thread with pselect() to
> returning EXCP_HLT, intending QEMU's main event loop to handle the
> idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
> always returns false and the vCPU thread spins at 100% CPU per core
> while the guest is idle.

I've applied this to target-arm.next for 11.1; thanks.

-- PMM

