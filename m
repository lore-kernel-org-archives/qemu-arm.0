Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3CCF30295
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 02:51:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1y2X-00025A-Oh; Sun, 15 Mar 2026 22:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1y2V-00024q-UK
 for qemu-arm@nongnu.org; Sun, 15 Mar 2026 22:50:43 -0400
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1y2U-0000UR-7I
 for qemu-arm@nongnu.org; Sun, 15 Mar 2026 22:50:43 -0400
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-2bea8220c38so100371eec.1
 for <qemu-arm@nongnu.org>; Sun, 15 Mar 2026 19:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773629440; x=1774234240; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bFV8pUWgtx+69aaPDmrdLgnX5kLnd23GngIxOmLhPpQ=;
 b=nLnnDHZCM09HIGeiuf8i+zJ3TcpkLlyRkEJ3ZvJ+g6lCmfzIADKcWDfwYAnuCWjPLP
 xgOPcIVflaS3zZl0SxuseXvj8cYY2w4em+VuOW95YRDcBpdjUw18Hru1q8LJ7dTkujJu
 lvdNj/iQHYD/u7pgJCQp1jLC/iGVOd5vgMuxjICn0SXxcj0KYtrmwAEZF92nBHajUKBK
 3yzrQa30IBcbVa90Ed8uouE+W8zjsFczBuzgLBOA8a6GaS4b4iG1Zx4hJzoqQOqIjtrQ
 +qGHy5Hpx9hrqKoWT9DxM9/S2oVBrGfElwaYUgK1cNlYLF3YLIQHbd9QiK7zynwbtvQs
 CcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773629440; x=1774234240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bFV8pUWgtx+69aaPDmrdLgnX5kLnd23GngIxOmLhPpQ=;
 b=XMNhr8yKa/eqEwTw4gMRCEB5zV+AfHn2bAWYPPpQtqAHT/3SO6p/NCE2xNX7/0lNS9
 ghcGX2JhyGXhnSpfUp4jqrb2X/q5CZaT2yUfCV7ReyW35L4AtLkn00khX2te3+OEqNI1
 bijOUkiJ+atg7WasSZVUL4cvVhVquChrYAHn5RIMfmR2Nvx3u9L3Q+3lii1wRihs5yWy
 rOKB8KnXnFh0echgjCrCt0LNCvUjT+/o7eCQLOQBcAqfuzYWHfDbwZNIWQBYGcHxWzME
 OENFgF6DHosfOgDg+/jXBL0biDjXWeQf/819BniJ1CaopIZxxlRw9nMJRYmlntSdxBgW
 fP+Q==
X-Gm-Message-State: AOJu0YxDcOpeeLlTHGbPVvxgzfkvncS8P9vgGMlbyRG7Es/nyWpcjp9e
 g5VWbC1Pcs36GQJbKzcYQ5cnDmcBT6wzFKaslrhgK+qZNbiL4yX50m7Z
X-Gm-Gg: ATEYQzyUs0v9XhvcuxhoWw0J8Wpqb50k/ZMNW+s1nXftPPWBFUmWTJcTFaStxZQMaNx
 /Wa7pOt0YXoNGCtR94w3PT8VP225QhZMPef3hFR64UWlA+4l/sGWBcvFW1ZH3fmStunhX8lX8hD
 A7mGbG215bY3tIIZKmDhHwQRZi3SCjDwWyKALBQ4aos4hjMimJkztSHmBGiY9D9laR5ih02MrgZ
 q6kRG93ZhbvPcC3DhOUHREwEAPh/cUPWZryUAYsqziHijOa0bry2SQOt9bGpkExcz3KAWmRxNhM
 HpEnL6vtqhOHwRMglmzH0tJfpbMkS3QjKvpbNvQoU8MzVsW+h+UpiMbgecXZhQzm9piubAB+0Wm
 6mfIVRUQ8Itfnb28Jx3/wz8gYRszKpK/uP4qOcZ3qQVWxCOg/3EPVVsv8tVqqIri2MYXPufZ16V
 /36KzmGtxjMA0cydR/TPitJB5Mk1fbkHtD/J5l+7w=
X-Received: by 2002:a05:7300:a984:b0:2c0:cc90:a71 with SMTP id
 5a478bee46e88-2c0cc901e39mr54521eec.8.1773629440409; 
 Sun, 15 Mar 2026 19:50:40 -0700 (PDT)
Received: from 192.168.7.2 ([189.6.247.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab3a12e2sm13138973eec.2.2026.03.15.19.50.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 15 Mar 2026 19:50:39 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 0/6] target/arm: ISV=0 data abort emulation library
Date: Sun, 15 Mar 2026 23:50:28 -0300
Message-ID: <20260316025034.85611-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260315034123.41921-1-lucaaamaral@gmail.com>
References: <20260315034123.41921-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add a shared emulation library for AArch64 load/store instructions that
cause ISV=0 data aborts under hardware virtualization, and wire it into
HVF (macOS) and WHPX (Windows).

When the Instruction Syndrome Valid bit is clear, the hypervisor cannot
determine the faulting instruction's target register or access size from
the syndrome alone.  This previously hit an assert(isv) and killed the
VM.  The library fetches and decodes the faulting instruction using a
decodetree-generated decoder, then emulates it directly against the vCPU
register file and memory.

The library uses its own a64-ldst.decode rather than sharing
target/arm/tcg/a64.decode — TCG's trans_* functions emit IR into a
translation block, while this library's execute directly.  Decode
patterns are kept consistent with TCG's where possible.

Changes since v3:
  - Inject synchronous external abort (matching kvm_inject_arm_sea()
    syndrome) on unhandled instruction or memory error, instead of
    silently advancing PC or returning an error.
  - Fix WHPX advance_pc bug: error paths no longer advance PC.
  - Add page-crossing guard in mem_read/mem_write to prevent partial
    side effects from cpu_memory_rw_debug().

Changes since v2:
  - Split monolithic patch into 6 incremental patches: framework, then
    one patch per coherent instruction group (Peter)
  - Removed per-backend callback ops; library uses CPUArchState directly
    with cpu_memory_rw_debug() for memory access (Mohamed)
  - Removed mock unit tests (Mohamed; kvm-unit-tests is the right
    vehicle for decoder validation)
  - Added architectural justification for separate decode file

Lucas Amaral (6):
  target/arm/emulate: add ISV=0 emulation library with load/store
    immediate
  target/arm/emulate: add load/store register offset
  target/arm/emulate: add load/store pair
  target/arm/emulate: add load/store exclusive
  target/arm/emulate: add atomic, compare-and-swap, and PAC load
  target/arm/hvf,whpx: wire ISV=0 emulation for data aborts

 target/arm/emulate/a64-ldst.decode | 293 +++++++++++
 target/arm/emulate/arm_emulate.c   | 758 +++++++++++++++++++++++++++++
 target/arm/emulate/arm_emulate.h   |  30 ++
 target/arm/emulate/meson.build     |   6 +
 target/arm/hvf/hvf.c               |  46 +-
 target/arm/meson.build             |   1 +
 target/arm/whpx/whpx-all.c         |  61 ++-
 7 files changed, 1191 insertions(+), 4 deletions(-)
 create mode 100644 target/arm/emulate/a64-ldst.decode
 create mode 100644 target/arm/emulate/arm_emulate.c
 create mode 100644 target/arm/emulate/arm_emulate.h
 create mode 100644 target/arm/emulate/meson.build

-- 
2.52.0


