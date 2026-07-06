Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673A0C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 17:34:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgnCO-0007Fq-JT; Mon, 06 Jul 2026 13:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnCF-0007Da-Hq
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:33:31 -0400
Received: from mail-wm2-x02.google.com ([2a00:1450:4864:31::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnCC-00045d-Sn
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:33:30 -0400
Received: by mail-wm2-x02.google.com with SMTP id
 5b1f17b1804b1-493b7dd83e8so2206015e9.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783359206; x=1783964006; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zevrqYQwxxyNIsO9ojLtWVYCmIAFc95qDtBjQPwzzUA=;
 b=CIcIMnrWYVlsICnZeM2U2eMXVG7viSyS/O87FBYh2clTa0uWNcoe15/RDQ7kOzyl0C
 v5PtVKx2WpK/3Is4wdR436FoIPXo3byEIiVVbA/FU391C5MkRwlu6dbl+GHDYEwr4Q/Q
 8HXm5KyRuNP+krs0RvibCi9BB1NtbYRoG+Qasuj+W/VTItpnIVZf1iRDEho8wBvnjw9L
 yFt4BvrGYHt4ZmPkGDVV8xbej5Byalhnl6QYwT93ZdO1eix3L3HNUTNezCAY8wJuVBhx
 VZosi7KZw44yUrujvk+2b+ensCFeLdyssXaeNnDG2H5lfwhEEzzTMXsWNhW8YaTnVBKA
 +D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783359206; x=1783964006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=zevrqYQwxxyNIsO9ojLtWVYCmIAFc95qDtBjQPwzzUA=;
 b=erviSkeMwwfuz1L1WswKK/O/M0moLqayOUYkce13luwB52hUO1NgHQTdJLE6h26VTv
 g1eqNgDkM+DnJKnCRx8UT5HvFSDiqsgUeBtbyslEx2qru8f/C1tltIihQXA7IM+yt0bX
 akfYC0GlQYUA18e2ZGDHsyDKNH7zWhb4r0kaN/qBoAwejp4heb2I+TglpM7Tiy/L8KCx
 8u8AB7/AuLaeSvprPSlTQKhAhmQWnYWqTlAQ0nF0Y0814Qpn+6D6Rupn7xWSO3aY8gu/
 VVUBkRvllUJ5on4bmUu/7gl0yj1CL/uC62MHpzZk/1KmgMCplybHJLbgEhoeCJgVpayK
 eBvg==
X-Gm-Message-State: AOJu0YzCQydjJTM4db9FRgx3ObE3N3FwyIBqM2CH+lVkrrOqZDQPUALO
 4wovZzU1okWmOMSOQklEJDkGCS5bcRdil7AR4vnxmJK8oG1ywIZt0k6Ji9vgh9tkJLAeD1Ws9PN
 zq1wUqmWwnRoi
X-Gm-Gg: AfdE7clXv5Xe7s85s0QgP7HeQe7i8hjuID2qs1A5b6wNr37lJ0ofIdQP44RZ+mAA50O
 hGlGCAtziI3hgEi2wr89xjau9pL2ZDn3RavYAaqZHQN80PzhoA/mT1/fk65cR9V39scSgxVbs8/
 Ji+kxRoYoqURYdMnQ8Anmcqv3lQ0p6pG5wEvoG+EXNgt5cTdNWHBvL+J90nLKe/NIf5ePNPDVZX
 uUTMd1YyTFOKQSpGSIFuAZzAZpDvn8plPQjXnAPFLaYl1N8UtJabD3KJa/DVYR52F6t/fBFS6i4
 lCgPKqJMru9/JeCK31aT8LUTutX35C/156+g5ZH4btql9VMe8Tl6lKIyMfiLTDiZcfHLNdHMjj1
 jwRNkpMdgugMqfF3L7+866oxZQBrSBKSMh3Nak9WmGJvIQsBJEbLzevKXot4jPYZdwA0FEc9SUv
 qrfrizNvrLZ/mBt3WGeP1HmVuOUSdrGRcAOXol7dUjGKoccfPXsKidsztK7nbrhDgCpRzPicbDf
 9TWrzamLKZvi8AtG5MrSQ==
X-Received: by 2002:a05:600c:821a:b0:493:c432:f48f with SMTP id
 5b1f17b1804b1-493df03d458mr17599245e9.0.1783359206093; 
 Mon, 06 Jul 2026 10:33:26 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e006b6besm467365e9.2.2026.07.06.10.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 10:33:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/display/exynos4210_find: Clamp windows to screen
Date: Mon,  6 Jul 2026 18:33:21 +0100
Message-ID: <20260706173324.804340-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::2;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm2-x02.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The exynos4210_fimd device has a setup where the guest can program
both the overall size of the LCD screen and also the corners of
"windows" that define where the guest memory should appear on that
screen. The current code assumes that the guest is sensible and
puts the corners of windows inside the overall screen. If it doesn't
then we will try to copy data to an address that is outside the
interfal framebuffer memory that we allocate to be the size of the
screen.

This patchset clamps the window coordinates to be within the screen
size. Patches 1 and 2 are simple refactorings to make the third
patch easier to read.

This fixes https://gitlab.com/qemu-project/qemu/-/work_items/3795

thanks
-- PMM

Peter Maydell (3):
  hw/display/exynos4210_fimd: Factor out finding screen width/height
  hw/display/exynos4210_fimd: Pass width to draw_line functions
  hw/display/exynos4210_fimd: Clamp windows to screen size

 hw/display/exynos4210_fimd.c | 54 ++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 15 deletions(-)

-- 
2.43.0


