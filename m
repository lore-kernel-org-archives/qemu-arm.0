Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED079C5CFDB
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 15:07:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvFxl-0002XT-A3; Sat, 15 Aug 2026 11:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvFxj-0002Wi-EL
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 11:06:19 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvFxh-000375-T7
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 11:06:19 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-836c8bdac50so27799397b3.0
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 08:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786806376; cv=none;
 d=google.com; s=arc-20260327;
 b=Wkd2EuCCmb+3JZ3sS+FsmBkf607SvUnOwKyJXduVqSbVsY3L8d0nQqHDUWaqO7w0GT
 gkr9gfprtaqBve24FGGaQeqE7WkxywBkd9EEdxaCmYH3BWxnS/zbfS5le5rjsAphE6l+
 ks6BdZICMsCpUYUVAOX45eSKQTb+/gNlRnlEUW3mitYb43YkCcHmDFNX6a62XdWxo390
 +0tp1wGK2vIFcl1Lu2KwZOzIUFhpvVfJyZ/YiMi4SjmoI34SAwiAJtAzJXFAU16SpVCB
 NjFypNIQgafL4sJ7gl126NbM4Yj0BcUCtq2nyIHhYlLnevL9fneZUND0huvfgb6M30i5
 tOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=br73CETfcW8D96ViD7v/9LzJ7uXqDbxvWBVvAVgEVKU=;
 fh=SYhLJTCpcP7wclOGEvHcVe5afRI/rRII1YkDa6EChSE=;
 b=FMQ/4YYcYBU8/CUtgeVgSkL3NQ8czeaHnd3DLartRgoLlNDKyA/8fm0C5NmsTV4RQF
 OJaLPH9B7dJbqzwQfsEMfm7mj3LrcWAw031m7LXzYAnUJ6jLtxN2vhVAmokiwvw8p7Rj
 ZXXkQlD66j5uwYr8JA4Ud3qhy5hDfR3m7DKCQxVTDFBohjbur+ikYj88GV2fb62ByCKt
 DKLqSzZ+V4n6plxKKFmO+uFjfsduJgVdD4Viu9t3zIfU5Dgx5uhT44eL6GikIFf8k4nP
 /YKjcfI0ZQcIPGXHcJtxcA3MMj3v/LlwO983usWc67aV1blM1DpaNqq5FgmQXg60MBzT
 W3Ag==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786806376; x=1787411176; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=br73CETfcW8D96ViD7v/9LzJ7uXqDbxvWBVvAVgEVKU=;
 b=RDj4if5x5L7ZGBlA381AArPMakxvZdpyVbTvpkwS+hnviRRicmi9WBoVWHmiPBhdI8
 LqpErxJ2FipiDNHpOmcex5cWqyxVfjF5ipukyVTZExHoCw5/HNiPA/yySBO3nqkh7PlY
 3CJ2r0MmrlFALpNgs78Tgb3t/mm2NaFF6UyHrWS2E2a7lZiOudk3Tu8makPQR5LJJE2j
 +SpeIul4xEV2M3JelqG8G09zzHAT0PF7PImP+G/3OdzqkiNm9OfaeN13pr0Ahb/dqiEv
 EXpyqS0onO6eW0nWslmicQigmIO5JOIhlgwzPg7NhQMIUg935pfOv+SHnDzfScJiPIAS
 Q4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786806376; x=1787411176;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=br73CETfcW8D96ViD7v/9LzJ7uXqDbxvWBVvAVgEVKU=;
 b=iUutyi1Jb+ChAWOE1ZTaqpXeIALDDL3GgHfh6z8ql/vSzopsUlTJ4QjXmLMD2eWIMq
 4cVddDhZ0MOU65oOnTsT1rxxabANEgsN7KRCT2G6eEW9sfRhGHVF3oBDNS8Z9IB7lqFS
 kANQb+sojHPQ7b11PNUyxTr/TjsNWzJn9WgAw2CvkKTbvJEOtfsCJhBOl6Xq69VL9dm1
 RFAPGWAajBb4aHOGNk/TcjKvRKGbLbHzpvB7TD/qlBZpp6GsR71i9DrHGiKFBnl6x+O6
 xay4Re8h2JdVFrV+ScRjY5O/vjwSai7Y5mMs4wr6gOGfuKzkcwc+BHMB2LZPDicDrdjU
 HRdA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqVK7bmWK5J9YcQIq6y5o7rn+/P9IMBA2sWSSLwB7gFeiY42Q5JbGTlS1q9EmMO9YMwebsxKJIxzw==@nongnu.org
X-Gm-Message-State: AOJu0YzIMWR45S0STuUDzZZpKBPVQpn7kxv7kf/ogFay8SwMHt6JAoke
 po5u+vT3lzmviEcWfOtosYdVERN4ZQk9rEC7nQsT6Nmv+fRTXBPljYc5SM7F82X++2u4qqAVixP
 k2lcRWXTHWYUxZRu06UwYqcx6UBBdB7CCHTWchrgNPg==
X-Gm-Gg: AR+sD11dmInydNxFxcmTnuIDPL+wTLcERVQFafwnw8h5J4gIzEoj2pWBNY2I41c3Em5
 FQ4nrzWzv7NPIIk03UnLVNU8cEasDIvRXC2Ko3QmZbIePjQrzFuPHe++lBWJxfxCE8/3VpvQ0B0
 TG/s+Ysdf5qD4SS2bImah+Livqi2WoLaFx4MESFcJqVtf7zeHciMWhtkgbAGNTFr2SkAX44a+Rk
 s5cLUWPBqwzho+L9ArZgZykO5XMGv4e0sd61C8NnMoDh8tvzOcNcQyqXmxg0fK35uUx9hL/ImjE
 3ZWc1vBJpiA2qHTN1rDcF4gfrlV4piMClK7f6BPFaXU6lBQKUREHEJml657Zhoejy2F6Z4PyIJL
 Sd1kysI17hgn33F1XmcQP2LctGc0j
X-Received: by 2002:a05:690c:4a02:b0:81d:6af3:b9b5 with SMTP id
 00721157ae682-8370dfb3b07mr57271187b3.9.1786806376065; Sat, 15 Aug 2026
 08:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260813154918.996812-1-bin.meng@processmission.com>
In-Reply-To: <20260813154918.996812-1-bin.meng@processmission.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Aug 2026 16:06:04 +0100
X-Gm-Features: AUfX_mw18sUHajhEpEjidhR_31brmxtbzYwwt4TZkZYTQh2Sj4or5Gv8FxFH4DA
Message-ID: <CAFEAcA8R5N=+wHpgOHu20FQg1W+cJVcZfBgFhTi2c9phHmXSAA@mail.gmail.com>
Subject: Re: [PATCH 00/20] hw/arm: Store the ARM boot info in the machine state
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Hao Wu <wuhaotsh@google.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Jan Kiszka <jan.kiszka@web.de>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Troy Lee <leetroy@gmail.com>, 
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Thu, 13 Aug 2026 at 16:49, Bin Meng <bin.meng@processmission.com> wrote:
>
>
> Most ARM board files declare their struct arm_boot_info as a static
> object at file scope (or, occasionally, as a function-local static
> inside the machine init function). arm_load_kernel() stashes a pointer
> to that struct in every CPU and dereferences it from do_cpu_reset() on
> each reset, so the boot info conceptually belongs to the machine for the
> lifetime of the VM, not to a static object whose ownership is left
> implicit.
>
> This is a longstanding leftover pattern: modern machines such as virt,
> raspi and xlnx-zcu102 already keep the boot info in their MachineState
> subclass. This series converts the remaining machines that still use
> a static object, moving the struct into their machine state so that its
> lifetime and ownership match how arm_load_kernel() actually uses it.

Yes, I think mostly we have this leftover because converting
machines which don't yet have a state struct to have one seemed
a bit tedious. But it'll be useful to have them for other
cleanup reasons in future I suspect; I like the cleanup.

Rather than commenting on a lot of individual patches, I'll just
list a couple of niggles here:

(1) Can we be consistent about whether we set fields individually,
like this in patch 2:

+    bpms->bootinfo.loader_start = r40->memmap[AW_R40_DEV_SDRAM];
+    bpms->bootinfo.ram_size = machine->ram_size;
+    bpms->bootinfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;

or via a struct initializer, like this in patch 3:

+    cms->bootinfo = (struct arm_boot_info) {
+        .loader_start = SA_SDCS0,
+        .ram_size = RAM_SIZE,
+        .board_id = 0x208,
+    };

I don't particularly care which you pick, I'd just like to avoid
the needless variation.

(2) Could we use DEFINE_MACHINE_EXTENDED() rather than writing
out all the QOM boilerplate by hand, for the boards which previously
used DEFINE_MACHINE_ARM? (No need to convert to macros if we were
already using hand-written boilerplate, like omap_sx1.c.)

thanks
-- PMM

