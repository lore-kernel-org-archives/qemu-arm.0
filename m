Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EAEC531C9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 16:10:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnITU-0007eg-Uh; Fri, 24 Jul 2026 12:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wnITA-0007XE-1v
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 12:09:53 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wnIT8-0007lh-N5
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 12:09:51 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-4560d6f82edso289671fac.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 09:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784909389; x=1785514189; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OprY1AZR7pEP7mUfERpFrHmAnUlh+1+Ut0hJzuaj/tE=;
 b=UxevhewfUf4YggYwDsUbQ1hoifXdsvGn+LA70fHGp9U2MPz1dvaNwM8qcF0aBc4jJq
 QeRU2c4TkEQZNSf4o/nRc84j2zqQrjqZJQo0zUqG8FLzqkG4vEvh2u0ZSPgv9CUuoVz/
 eSCx4lCs2/cD8HeBqGfcHXW6Ca8LRaFkNlQ4JwVNybitO0KUi1EzZZ0V8pxGgF5iogP0
 OEOdZdFwEoTVlRw18JUdFAYw1IEubYHqK9Rh8PuMP3+pBIrM/HqT4X0jTKBNv+VlcNxR
 bokUIW6VuzZEfXq4BsZs1nSgzrlCjhS0WOc93FlyVekGuw4quZxmA+4vEslhdfJH179y
 dw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784909389; x=1785514189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OprY1AZR7pEP7mUfERpFrHmAnUlh+1+Ut0hJzuaj/tE=;
 b=gS7nQbYf/UiE5ngXIIoNytrWKzEkGOU6iR6PiuAzqm7d+6pT3/G+DK+9nH4N5nqtyw
 6q6ccyRcl604dItVGtV8uAjOr7KiF47kgxh1UtRctGNhXxrUviAsTRM8/YgXL7mZPedY
 QKRyNJfgL0Vc9uVbPU+A5C2K17zQSBFChSUEvqUQ8MFv/vOfTI8EhkV0xIzqvbPpo4Ir
 o8TEuvzFGC421Lz5lQl7Ivlpwi0v7bDU+rTU4xxK6vN/Ik9+i097iMKTD+87Q3xipLIN
 EeOVKBBVS5DfowZOL4YHkJNrVU7rpy8EpMa6133CYUoklvgzf7BMZs3P00DX5RLFWs7p
 yVMA==
X-Gm-Message-State: AOJu0YwtSa0aJ3y0jVljsWFDrnSQ0S4z+bWnceJvAlilLx8wwGHZtnKP
 ySP1g6hHCLN2mJ2wzPN+4xr3u0WEhGevPk97Yq7vmbgKLuJaM2Zyarm786wq6OEB
X-Gm-Gg: AR+sD13yH5Txf+ROk6/fQoTIUYpG0bvkqZiKOEfG2WhZy52wlHTZJXidMGJqLzWPlCx
 VGRVHsrDWQn+6BLagIA9Zf+9OJdqjFGFOFfT0szchOnZ0dya5117IdmUVRw5LC6vLGpJ+B9H9yo
 EkzmWoWi6vujJfrqbnVnP+jE7NpibCjU+DCtotDl9exfMY6l4lIl4qZHf2/e5ZThDRuP4wnMBB4
 3GFc38s59n+PcIHjVWzJVLC71IZU5iCATHWo6MIpqpePUup12nt2h0VEa/VcvnTDJrGK75l45LV
 JU2f4IBs+hKsn0I0+Ez8LVE0pNs0CUezyZ+XKuW2b//AIHzXLvVVlPVAvk6o+t/U9h0rybcvWkn
 lhfTpnJTAfCq76v3E14OzsIwcxDjg1mE2vVAt5qx+ah78b9J1jMpK2NXBbmR2z16vrOs/6eB/T+
 qnQ4xIXdRxo8mxoq2NDUui8UArkKDWmM1DvA==
X-Received: by 2002:a05:6871:299:b0:448:604c:bc63 with SMTP id
 586e51a60fabf-457a0cca1famr5405611fac.18.1784909389439; 
 Fri, 24 Jul 2026 09:09:49 -0700 (PDT)
Received: from HPE-2MQ6131DV6.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-457ab7405a9sm4542753fac.18.2026.07.24.09.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 09:09:48 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH 2/2] hw/misc/mps2-scc.c: fix scc_partno field width
Date: Fri, 24 Jul 2026 11:09:43 -0500
Message-ID: <20260724160943.52509-3-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724160943.52509-1-simonxhy0404@gmail.com>
References: <20260724160943.52509-1-simonxhy0404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Increase the extract32 length from 8 to 12. The Primary part number is
defined as bits[15:4] by the "SSE-310 with M85 and U55 FPGA"
documentation. For example for the mps3-an547, 0x547 is 12 bits but we
only return 8 bits right now.

Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
---
 hw/misc/mps2-scc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 1ecb2879e3..554b504c72 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -57,7 +57,7 @@ REG32(ID, 0xFFC)
 static int scc_partno(MPS2SCC *s)
 {
     /* Return the partno field of the SCC_ID (0x524, 0x511, etc) */
-    return extract32(s->id, 4, 8);
+    return extract32(s->id, 4, 12);
 }
 
 /* Is CFG_REG2 present? */
-- 
2.53.0


