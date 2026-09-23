Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C92BC9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 21:10:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9UED-0004Dz-10; Wed, 23 Sep 2026 17:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1x9UDs-000480-TB
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 17:09:50 -0400
Received: from mail-ua2-x0e.google.com ([2a00:1450:4864:39::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1x9UDq-0008QH-Ra
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 17:09:48 -0400
Received: by mail-ua2-x0e.google.com with SMTP id
 a1e0cc1a2514c-980b6159d30so419182241.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790197785; x=1790802585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0HK/pzye7cm5UNEMVr3LbdqBrxj/0smXUGHcXB1oZ6w=;
 b=IQ5sS9fIbeno4UXAw+O9XzRRexgg1DurA/UtRCHM3/Hif0Crhv3jIQGZlEyCMDHhKO
 KJq+3KNgDuVVWeNqiv91qORtqjrqQeuPowXqfejSONsWfIuZ5DxN7+bHv+5QwVufNxeQ
 oSNnjSRyogW/1u9X54JQTFkhPP2iMNy9OD5YmGwJcKwqWINHXZ/Zy2Di/Wb2pZ8zWA77
 VQc9uJ4yGF78jxaLDprtnGLi4sXRnfbcgLYSsBk/nWv84GEhuoB7LZZqqkGyPBV33HsU
 qRJ71A5wBK9yynT0FshnoZRqH+tEdJ8s+QZ58UaXVokDmijAajYGkpG39XAnegv7aufB
 A4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790197785; x=1790802585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0HK/pzye7cm5UNEMVr3LbdqBrxj/0smXUGHcXB1oZ6w=;
 b=WS77oLX1Ja5yhRVVlkdywmX6xIe6CtqILjZOKu6FOX0vZsGUzSSA6tZ1CXShCYrQMe
 Uyq9aCctajdDc+EE0lrJpQ6K5VS6kieAopWDYAW/zUxiaveNbnUAtRQAZoGTzpXRlFOk
 YkJVEzey9sXcv3gMmwePfyxvlZBIA52tjxJ3JobGXHdMmfweTtwrR1tNsp3gBuzOngc3
 JBN7dlK9RLNa8MXi1n1/NQ79TDwqmXkofvDyGWqGUu7dfKKODU6+F2oayu1OzI83SD/X
 JkGL9GT/pIzQJ1dvAMtK2EJMCUcamRoBiKraiC+ka5FCBwASsN+Q5IarJC77JcV47Ft4
 p0DQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5iQqggLSbwnv5xZM+aRz9XMlRjqk3jru1j4mh+kYmHkyUXY0Khk0PQ8ZUw+3s2sLK0TwF011RNg==@nongnu.org
X-Gm-Message-State: AFuF++kU6/nQ+NQLH0CGXR96NfkqeR6AU1TB9PNpiz/89e3WQwAazoCd
 nO7mjJuGLIQhLC1BPc3BCRx0TIHezkOLCeaMWs8HECIgF6uHKRlw/bcI
X-Gm-Gg: AYBFou1IFHbrQqkNXdDD3MRLyJf+IvuNawPAsSn6l7ep/JfyZSlQLoE+lccees//z1S
 mcgWUWbd4icq3VroiMr4w9ZV23YH1UvJBzHsM56zvEe3xmneVRyDa0TVJ9UI4qOqdWFXY01imk9
 zu4H/KFqdn5Gt3DldVdzJcOm7lY7eaAcezjqJMiCWDaagnq8DO+RPZNPucaDyWtGFlizMNl+5kv
 x3djfBztumQ4zoY2kl/1JkE9Nc3UNbxAA6caeAEHs+n3X/Ctw4TPDZKvH610hxmuyZJ7JrhFRgr
 TOcQZMjZWCXEsORUX27nJuYWxYhDs9PbfvcK6b06nxfazVWEB/gJlmxmPdDoXkPkcC9pVqQ2D5D
 I8IrzQl6XK3p6uZhPZbryvcww7IEJRk5fB7oOmEPB5ErDWjJCmz6TSgu2n0oEHBc8/+jJi8Q5xW
 qxDIymLl/9Aq/YOvorWpIDnygm+z6bHqZkpEZTR2ELxPMmotIhJkGifOpsMGKsIgWuTA1ev3huP
 FO5Zr+PYJBYhmG20XtLLfIX8TdJG5sErxaDx3Q=
X-Received: by 2002:a05:6102:358d:b0:7a1:f7d2:e830 with SMTP id
 ada2fe7eead31-7af1bf7e167mr429808137.16.1790197785116; 
 Wed, 23 Sep 2026 14:09:45 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:8d8d:5fed:813e:d8db])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c9f04c05b3sm4859413e0c.6.2026.09.23.14.09.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 14:09:44 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>
Subject: Re: [PATCH v2 00/19] hw/arm/raspi4b: working PCIe and GENET (real
 networking)
Date: Wed, 23 Sep 2026 17:09:43 -0400
Message-ID: <20260923210943.52812-1-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:39::e;
 envelope-from=marcelomanzo@gmail.com; helo=mail-ua2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Peter, Philippe, Jason,

Gentle ping on this series -- it's been about six weeks since v2 with
no review yet. As a reminder, this folds the two follow-up bugfixes
(PCI enumeration, GENET per-ring DMA status) directly into the
patches that introduce the affected code, per Peter's review of the
earlier standalone series.

Still green as of today: checkpatch clean, builds standalone from a
clean worktree, and the full functional test suite passes.

No rush if it's just queue depth -- just didn't want it to fall off
the radar. Happy to rebase if anything's gone stale in the meantime.

thanks,
Marcelo

