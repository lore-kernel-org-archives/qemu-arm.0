Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95D9606A32A
	for <qemu-arm@archiver.kernel.org>; Sun, 22 Nov 2026 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wXRSBKDX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xV245-0003Be-BI; Sun, 22 Nov 2026 02:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itai.handler@gmail.com>)
 id 1xV23g-00036A-PD
 for qemu-arm@nongnu.org; Sun, 22 Nov 2026 02:32:23 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itai.handler@gmail.com>)
 id 1xV23f-0000Vf-5e
 for qemu-arm@nongnu.org; Sun, 22 Nov 2026 02:32:20 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4a511d8a394so258730f8f.3
 for <qemu-arm@nongnu.org>; Sat, 21 Nov 2026 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795332737; x=1795937537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e64S4WnlE/+ph5XDdDBmL08MSRlgGmdTbb7tW197pZw=;
 b=wXRSBKDX2qS40Fb+9HaF8aOH/khqG+idYJn10cppAgyb/ETLtn92Kz6Wq2YWE6Ox2t
 ZRLFJZZClIGgXHcNAbYf/KKZDdwtpcNPWPHNvBPi/aaIcfJZSD6Blhu/6rcZ8HA3t5Pa
 gOu6vg3jTgocjWba43/Wz0oxSww7KglQoqD5eJk/W7dbVcBvCl+4NnKLWQ/DLKsREp+i
 tle1ZBNApEkDToXsx14DGJ9Pqqcv8GwvUUDQDR8ntRo4Q/Mh+MsutanKGNYzWTJPpoL6
 mH2g9qTHRzGQeXjbelN5qpaxDTsJCotQpgvnHK3a84R+2b50t0aKRexrcVAjUHkoyh8H
 rp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795332737; x=1795937537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e64S4WnlE/+ph5XDdDBmL08MSRlgGmdTbb7tW197pZw=;
 b=ZTvTm1xb8FUI6WwwSp1wLQuMsV2fUOtfmkRBXckL8gcHKUahM8S5k8MqMVjdMYcMXQ
 qHxgtV4E622Yby6OFxrjA8oBi5sLK8+5EbK/0Tk7IF9sBvCOI6ODZY97uFLGsOoBiQbi
 tfTqMijNyQszze7QJ6ICTRpcEpDfwgN4EOHv3bU/MjzMnxpmVbvh3zAVilRoNbxsEgKU
 NN+qKDCbED7WwkCI8rfvnYeVe99WA5KBYdP2jWrm1SQP4pZAC3ohXnKXUrXLVRLitCLk
 +zoCF5cbv743/DvDeIcLklfkGEwDdUVw2pZfrrHhsKx67TpVsWeCGpMRJzcWoRiFrIwo
 soXQ==
X-Gm-Message-State: APuU4Z8SFP0eOgONURPxNIxmmRi3O8+jmSOVBpR8+wyVF+L15TC2zVmZ
 88Ybu2zjFyYuM0g7O4NVi+kv2m/MCKBGu/Bbcrkm1yll2Hns61R3m9Fu
X-Gm-Gg: AZFdTZc9W4lj03GyeqLgDg9atDCTAUdtcnwccCjNMirisG0WF9WaStSQP67gIg4Iwi7
 A8ETbTVUDUI8GmXm3fK1nn8P1v/L8qQLMYMiEKPez0SPIY0cvtAixHn/py3qa5DD2HsRzTgiiid
 uzEVGlxdgdWdLdWiyrWuXc6vxMsp5ERM3qxPopPu7aF/zyb2/niuvPbmh7ZuYJ9T/avrnhAY9cH
 P1j/yT2bASWShfszEvSCQRTtzh+lFwaYStG3aay9FkAMz+CuSibSdU8Z6blUkvhkkRTt/pGkkpo
 RUE8msx66Nb2bwUTx64+XLcQqa8nSJ1MAEXWkVz3smZ/0Dc2hpAl7C+m+F/FDK8RiJoyQM6imGK
 VqRVylqprBu0i/RwTVhkBF7owFpBLjUmPW006LkDoVKb9tkTfV/Na9TFSRTIgepDM0hVBUIIZCK
 cvjqp2w+Z89gUmT+Nk4H4s8/FeMQvsq2uUbrVgBxN7/zGr3676DB/dPX6JGpI+XaFoAKzeLol2f
 g7RRyRq8GO/AKfwIJGE8pmdJ9S7LYrAfIaQLgVMzLkOmllaiNoWNcwhcsp5YWIIvSVTVcqg5DSO
 ImL1xokixcHKGLskGsJPm8dWVLnsdBqdaCtTpnlArRsVRKkotpU=
X-Received: by 2002:a05:600c:8284:b0:4bb:6c01:de9c with SMTP id
 5b1f17b1804b1-4bb887f55c1mr155263005e9.2.1795332736521; 
 Sat, 21 Nov 2026 23:32:16 -0800 (PST)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm188359425e9.0.2026.11.21.23.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 23:32:15 -0800 (PST)
From: Itai Handler <itai.handler@gmail.com>
To: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com,
 edgar.iglesias@gmail.com, berrange@redhat.com, eugene@nuvacore.ai,
 takahiro.nakata.wr@renesas.com
Subject: Re: [PATCH 00/20] hw/core: Remote Port Memory Master
Date: Sun, 22 Nov 2026 09:31:33 +0200
Message-Id: <20261122073133.1940537-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915160044.345788-1-ruslichenko.r@gmail.com>
References: <20260915160044.345788-1-ruslichenko.r@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=itai.handler@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ruslan,

On 9/15/26 16:00, Ruslan Ruslichenko wrote:

> This patch series introduces the Remote Port (RP) subsystem, a framework designed to connect QEMU with external simulation environments (such as SystemC models or RTL simulators).

When a guest performs a memory access larger than 8 bytes through a
MemoryRegion whole max_access_size is greater than 8 (e.g. the Remote
Port memory master with RP_MAX_ACCESS_SIZE=4096), QEMU aborts with:

  ERROR:.../include/qemu/bswap.h:487:ldn_he_p: code should not be reached

The root cause is in flatview_write_continue_step() and
flatview_read_continue_step() in system/physmem.c. These functions call
memory_access_size() to determine the access size, which returns
pow2floot(1) - for l=4096 this returns 4096.  They then call
ldn_he_p(buf, *l) / stn_he_p(buf, *l, val) with that size.

However, ldb_he_p() and stn_he_p() (defined via DO_STN_LDN_P(he) in
include/qemu/bswap.h) only handle sizes 1, 2, 4 and 9.  Any other size
hits g_assert_not_reached() and aborts.

The normal dispatch path (memory_region_dispatch_read/write) does not
hit this because it uses size_memop(op) which is always a power of 2
(1, 2, 4, or 8).  But flatview_write_continue_step() and
flatview_read_continue_step() call ldn_he_p()/stn_he_p() directly,
bypassing the dispatch path.

The fix is to limit RP_MAX_ACCESS_SIZE to 8, which is the maximum size
that ldn_he_p()/stn_he_p() can handle.  The flatview_write_continue()
and flatview_read_continue() loops will process remaining bytes in
subsequent 8-byte iterations.

The RP_MAX_ACCESS_SIZE definition is currently duplicated in two
patches in this series:
  - "hw/core: Add Remote Port Memory Master object skeleton" (06/20)
  - "hw/core: Imoplement Remote Port Memory Master bus transactions" (11/20)

I also recommend to move this duplicate definition into a common header.

Itai

