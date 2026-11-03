Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5286606A32E
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Nov 2026 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3DmwH9Z
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOFWh-0001Ao-Ko; Tue, 03 Nov 2026 09:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itai.handler@gmail.com>)
 id 1xOEzZ-0000JH-NN
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 08:56:03 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itai.handler@gmail.com>)
 id 1xOEzY-0000Gf-2I
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 08:56:01 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a73fdd2966so6552505e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793714156; x=1794318956; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jVzrA0I28EFUmafK+SNoR6vOsxPY7pt1uaWtFzrz8Is=;
 b=u3DmwH9ZMxt+4E7r+lqTZVGj+ejtOrXglKy/9h6qYDnrBOkK1JR3/4ANMGjmDyRQsy
 N1XM27qS1nwS6ckd6GCl3Fo3zLc4zJ7Ht3BseOOrsZOB/+GDYypG9Tp1iVv9tysdhyB4
 Rkk+gNrFSm8uk1HN0taEVaWP4FpoFqoggppLd/U4uQhna7caDLTqAT7wnTynjp0e+HiM
 LJ/PWYc0wDL64SJXJPeAxAxzBJSu82NASpbFYVX1Guk5cUx4pv+9YQ5IBZbyZn2U7vnc
 K0McBrC3Xj0bcBxJ9ANZAhYS2tVMK73Rt0Qw+Z/2HuciE367YklaY7xTgibxpwwnqX0q
 aC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793714156; x=1794318956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jVzrA0I28EFUmafK+SNoR6vOsxPY7pt1uaWtFzrz8Is=;
 b=Xv01Dl02cgc6F03i0NlMu+wU3hTzRbvShESr8pyo/Y4XS3ac5XcTrlmGQ/ndy6QD/U
 z4SA0NURcgHe5yUf2iU0m6p92pcENU1gTdQrCn1T87LFatQyZ2B9/Ms907XGLZAMBVRa
 TWi2bzOd4vXY8Rwzkn9PCAMQ/zgJjxcImvlvOWbV0thFRqmgJC3hkJ+atkVxQwyCq15O
 hnTqedtdb+7rPJZZkXlMopUePBDQS6FmPdmT/aEjXYGDHyy56IAB5CaTQbD4UkBd+jWn
 oMeWvTlqhnqj8bqZHE/ct80q+BrJ30I0D9Y3NkOceFy6R/QSsMS/ta4Ve8Xh/7DXoIfs
 BdkA==
X-Forwarded-Encrypted: i=1;
 AKwUvByM5k/LBBCMMQfuMM+x3/H+xUNMaHZh5XUokSgjHgoJNvc8pWLbUQ6DR6JYCbGPenId4bNjjVj3DQ==@nongnu.org
X-Gm-Message-State: APuU4Z+xVZ01zgNgDV3FHMS5acBTWCjFe5X8ku19A12bOl1j7kM+WdAW
 GwgO+wVzNrV4xQ2U36SY9F8pOiXCiJjJVYoFDMWfaGGDey7YoxZjq72G
X-Gm-Gg: AYBFou2mTe96koTEy43EtbXSALBSP7WlwSv4R8YGKHsCGG9dQ54LpzjWuv5albhIzrR
 UK0sO6tmqOGRJsSz8qNw0Il14PAdzuh+lBUhVTCI2G2SxU3JHoGCGfP4oUHjzbSLtVqwQ4geVpa
 S830K8Em2Sf2IXBwcobwnR8Vv6yYeOWoEhYrV7iQfApZhRoaXsRkYYgo5KElitEQkLVh83dzCVq
 sVVS8vs3aOr+xv2NvhJicqMxW5ISwKXKDbem/osqwO8PgZuSqunluv1+4om5lF14pZKLLuz5l0+
 t1+wW0wqjV3S9rYKPtFptTuqBT5trPkdK1yDFML1rTO/XW303FCuj+X80QB8M1AoeslD4qQn/4O
 kDhkItUHUp5OjzHiSdRwNJk5yw8Iaq+fVVnArddRbqkQYYxNRchxCurkDs+mn1PjVk56sm+wYU6
 p4lLifXhYyZN+FS3wHEQewzJzsjBTc+X9Fac1GbQAgZPSr39Vqj3AT+TLHLLiOrnkEHvswZ4kWM
 D/Xk51ru+QC2ebO52YbKb8fX5HTjcaoTNwUHBQ24rWAzNcV+ovwVSLpm9qyhcmJ4KnbmXR8VU1h
 j4B1DzYitXcIxOs3uoIiFWrYolOqQgc9CZ+nojdLDtQXHQ==
X-Received: by 2002:a05:600c:34c5:b0:4a0:13d8:cd0c with SMTP id
 5b1f17b1804b1-4ac16acdfe0mr295145525e9.2.1793714156154; 
 Tue, 03 Nov 2026 05:55:56 -0800 (PST)
Received: from localhost.localdomain ([193.169.70.108])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abe7700c3bsm304815535e9.0.2026.11.03.05.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 05:55:55 -0800 (PST)
From: Itai Handler <itai.handler@gmail.com>
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, peter.maydell@linaro.org,
 francisco.iglesias@amd.com, edgar.iglesias@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>, berrange@redhat.com,
 eugene@nuvacore.ai, Ruslan_Ruslichenko@epam.com,
 takahiro.nakata.wr@renesas.com, philmd@oss.qualcomm.com
Subject: Re: [PATCH v2 11/20] hw/core: Implement Remote Port Memory Master bus
 transactions
Date: Tue,  3 Nov 2026 15:55:37 +0200
Message-Id: <20261103135503.71748-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915160044.345788-12-ruslichenko.r@gmail.com>
References: <20260915160044.345788-1-ruslichenko.r@gmail.com>
 <20260915160044.345788-12-ruslichenko.r@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=itai.handler@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 03 Nov 2026 09:30:12 -0500
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

On 9/15/26 18:00, Ruslan Ruslichenko wrote:
[...]
> +    rp_write(rp, (void *) &pay, len);
> +
> +    if (!rp_timeout) {
> +        rsp_slot = rp_dev_wait_resp(rp, in.dev, in.id);

Thank you for this series.  I have been testing v2 by booting a guest
from flash behind a QSPI controller modelled as a Remote Port peer.
Every guest access to the memory master waits here for a round trip to
the peer, about 16 us, and U-Boot and Linux drain the controller's
FIFO one 32-bit word at a time, so a 15 MiB kernel image takes 64 s to
load.

In my tests, a small read FIFO in the memory master, which the peer
fills, makes such reads 13x faster (the kernel image loads in 4.9 s).
The peer may send a posted write before its response to a read, and
the guest's next reads of that range are then served from the FIFO
without a round trip.

Would you consider including something like this in v3?  I have a
working patch on top of v2 (about 140 lines) that I would be glad to
send you or post as an RFC, whichever you prefer, and I am happy to
test v3.

Thanks,
Itai

