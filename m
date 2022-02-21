Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2959260lfq;
        Mon, 21 Feb 2022 11:22:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL1uKmblJtf+XxFL/B6RB0E1Cp21eS6f2e2Jvk3e4vOCeuDoueVPeBwiWqHtAY+vvoQQCC
X-Received: by 2002:ae9:e891:0:b0:47b:a53f:5f00 with SMTP id a139-20020ae9e891000000b0047ba53f5f00mr12590485qkg.693.1645471364635;
        Mon, 21 Feb 2022 11:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645471364; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6zZNdhLD90alMuQu8H/jfg71NYUH2lYGMcQfT1Duc/s+hWeU7ebftV0jrAvDIIV4p
         COIC6VJpv1iPLtVbOGNLpD9m1UwQieZl6S3WrjnuKH3KNzeHwSVyXhbl+Y6NEMiz9PjQ
         9Obb+T/kVvC61YhRMnb2BxVs6veIhzYS3kkkAhf2kocyEXk+KH4tKadqTog3jVNIcG20
         aurRtLbU9w4Q0MrUPqrX/xYGG6tD5m/sOppXOOJEjLAou+Li+N6bP9drKH1fUuG0l01B
         H7RbVpkG/OGjyGavUF6rQ8eti1VHDn4/izA+Q88LhpOd9MoJl0WxAmcrOF4QU3VkB95S
         ejQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8LxaYHsGrP1n2gu8fs/oq2UgPzeDfx1gMnABjk6F6VA=;
        b=cKzVDOQW+WepK8Brl4IDuLs3Pv6/W+oQdxaY+EZtUliUgu0dYDzYhlSAt9x/RL2B1+
         JPzKlycm2wq6Yi1VYBIykLhsVhm5mZWzTeyLPaIrE2MV90nIC4/HWKZ3jRMfnCxZKsRd
         2VatJ4AbaWI2CsAEwOdR3V3NBhWJWRj+ASxRe2V1TTPTaKb21LCbLtfbuoN7jR34eQYs
         cJrBlDpRxGgIo5qJ3RIhKEGK8/ycZgcQRdAqkmRRpE2BNyJIuf+pYjBOtvQzOpfmY8//
         IfXlpn3N7WlbFOusdevwKOa52MPuk2ENeDXqGsAoG/tJzkSrBgYbKBAXc9e8XXC/R444
         QzQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHj45sD9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si4806274qtx.665.2022.02.21.11.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 11:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHj45sD9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMEGi-0007pi-4Y
	for alex.bennee@linaro.org; Mon, 21 Feb 2022 14:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFn-0007hs-Ta
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:21:47 -0500
Received: from [2a00:1450:4864:20::434] (port=46914
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFi-0002dV-D8
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:21:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id j22so2706407wrb.13
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LxaYHsGrP1n2gu8fs/oq2UgPzeDfx1gMnABjk6F6VA=;
 b=pHj45sD9BdDX+F8PmIuOVjwWItzcDJ8z1k0UjUrQlfyau25fDmU5KaXu59FsJ+ISK2
 V8LX1NG3ceuyFmW0DGHsWjkIHmZ/F8YiXuAAWPdzwTBR31szOXiJQxE/aDnl+bbEYhLS
 NL5QXtzcDtwPgiqiXUttaHzm9cH0GtwQVf7ebS3rCuSu93gnuXHdM0cntQXa3WRaIrh2
 D8C9xsriTZaeWdYibV0/toSeOxDRFTePg1XD0STPWfINxIXXu8y+6RsM47rGuKRNe4v6
 R+3bGwK6qUcFD/QUD+UAEzTr9g7R+YHeCdNX/fvHfd/XQwzikWAsVCU/Mw8XqyAYirhf
 1+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LxaYHsGrP1n2gu8fs/oq2UgPzeDfx1gMnABjk6F6VA=;
 b=KBvIUH7WPJgYENeWPKo10+krqw0H2OBtJsGa7O9qM1c/Y0SI95kMhHJbTXJkJVK03P
 ZMEepPC5ngo4N2gAkMu0SfmBIF42AnApLOkTSYo0PkaSvdtIg+apAKxbz2oEeuSvNyjV
 s5pa6wGjd7CQJ3aBTVWdtqrjSpa6qSr6u8F6BYbKG9zJst+PgwhRTflw6cnFlKk5O4cp
 keyN6v7E35n9toDF457c//krunOLybKnTA/7XahcZjlmvp7D7ksYOFT1J2+3yCAlXcx4
 t8hpMdQAf1BX775pG+EwdxjgbV46IAECpvBJjxPgkUq8+EKrA43ShMbnm+Eq+qcXvanC
 wLig==
X-Gm-Message-State: AOAM53310DrIT4kxDkz9pJm12wNpN4L2pB9l+15oC3HliLesMPAjluUu
 05XkFJ5oQaf9AArLa72dl3hZc48PWzWSNw==
X-Received: by 2002:a5d:6d8c:0:b0:1ea:7d52:c05c with SMTP id
 l12-20020a5d6d8c000000b001ea7d52c05cmr1510354wrs.663.1645471287507; 
 Mon, 21 Feb 2022 11:21:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j6sm38958226wrt.70.2022.02.21.11.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:21:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] qapi: Document some missing details of RTC_CHANGE event
Date: Mon, 21 Feb 2022 19:21:22 +0000
Message-Id: <20220221192123.749970-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tHH2O4JLyHp5

The RTC_CHANGE event's documentation is missing some details:
 * the offset argument is in units of seconds
 * it isn't guaranteed that the RTC will implement the event

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: add the "RTC might not implement this" note
---
 qapi/misc.json | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 7a70eaa3ffc..0ab235e41f7 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -533,10 +533,12 @@
 #
 # Emitted when the guest changes the RTC time.
 #
-# @offset: offset between base RTC clock (as specified by -rtc base), and
-#          new RTC clock value
+# @offset: offset in seconds between base RTC clock (as specified
+#          by -rtc base), and new RTC clock value
 #
 # Note: This event is rate-limited.
+#       It is not guaranteed that the RTC in the system implements
+#       this event, or even that the system has an RTC at all.
 #
 # Since: 0.13
 #
-- 
2.25.1

