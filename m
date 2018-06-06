Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp960124wrq;
        Wed, 6 Jun 2018 08:24:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLsme3uYVapCk3uZCV4RqjREBCg5zB7qXwztJDTMANOEvI6SOWtDyB3mlqIMYKeuJs5Ejzl
X-Received: by 2002:a37:81c6:: with SMTP id c189-v6mr2807616qkd.314.1528298677479;
        Wed, 06 Jun 2018 08:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528298677; cv=none;
        d=google.com; s=arc-20160816;
        b=kaefTgWWYI6tkCpvXH5occzalIcUwjxP5f0O8w+0F0rC+2QdomR0TBimnMBm/o/+wR
         9yh1vluAdWk3fSIGRYOEgNyuirSmvZhJzYDnwsMFxhF8wDyTecETsaCH+T5XdUVvtr+A
         qPPelb6WVvmoHqHPhP0C0XqV34dI3GjxOXRm2HmcIBG9fgEWmScC0te3h1PYDpTt+SGZ
         529kRcwEhCBjlsdLfBtocT81cu9BFDKa0APaute2Xe0ET1ucXxa6faIz4mTyvQpxWdKj
         yFcdW5gH+JdSKXt5q3zf+CA8zgGqgLE2Ms2UsAqlCvQgxde15/QhOrUT/R+Re0wfrwiD
         k5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Km7/EToSyn+5OUeJ/zcjNNR0AlH8h1r1sMEozf0w/PM=;
        b=BM1oThyWsW3kPiRVEifDGZnHd7HCeRYYm81YXgxMHGdJtLa6tmF+sWSfn5q5LKsGWJ
         TaEGXJipu29rK//URuw0PujhQ5bzTrQIV3ehn2yFFMKvHNY1g3gx5oTwP3JzQcwomQ8u
         zejYgoAj4qhIY4dt76GNBH2ytERNsRaQn8Bov8fStlVDHJACwUl7zaXxfZ5mh55IMkv+
         xHfZvir6BZHFprjBEgZTo0xeg7KDCnSKC4J7b1b/MhoilXcL5OnA8R1XZMhfX8fYe3gX
         ecDshqqAbMflNkfXxoKNUL8wEsE2IaOkI/4YMu6gNmFwWyf6Qv0vlwErSxPJbSTslD2b
         lqbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fU5TOZzw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3-v6si410540qkb.326.2018.06.06.08.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 08:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fU5TOZzw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQaIe-0006Ou-S6
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 11:24:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFy-0004Yb-Kg
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 11:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFx-0003bs-2g
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 11:21:50 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:45748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFw-0003bm-U2; Wed, 06 Jun 2018 11:21:48 -0400
Received: by mail-qt0-x22f.google.com with SMTP id i18-v6so6722393qtp.12;
	Wed, 06 Jun 2018 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Km7/EToSyn+5OUeJ/zcjNNR0AlH8h1r1sMEozf0w/PM=;
	b=fU5TOZzwLMtTvcj6FbegvWOSKcaytn8uwRlkHHH+gVyKoiLMsEsPaTU/EmTHDm4MRd
	cTWP+v2N9XraQE1Uj2Ct3UgWXWGEfcUC0nLwhOnxbH0Lagnjr4+T3r6asIo/detYSS6s
	d8HjqwIjhkpIlDClBzbK4QZQLxvoF3Pv6/1KNnXjcJYQtbH8oQQXlquwMaNMaVa5iTfR
	xIqDpKlmuVyJkttbK+7AP6zebCbGUMn5n7AtVddJeRQJzexCFK1s7TipD2ilc0XbHjml
	1ppA5JAJ7fbNGWEYVAA6DL1KTyVyq9et51gNFeY4IZ4DvzikmH7ECGV+boNt1yeZ2KiE
	SlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Km7/EToSyn+5OUeJ/zcjNNR0AlH8h1r1sMEozf0w/PM=;
	b=OvJH8H03c0XQDWnuKzCzWNDiI+FilEhpaihIornFTj7PNwUH+NsXOd3e3RlNtO1ycM
	v06vmkMGMu8K32utxMKSjs4B1SyONBXdjxFlJj5ftrsH3aCAiLuoz5H/gYmhrgWsBfft
	7CosHK5Jeu4QbE58eyTcg0xkKnVX8Hpevvl81R7mnQ7+y1P2+Z8cHMo2IUcklkE9/dru
	pFvMHMlwcywFD0J3BteNqlaaemB53j9dn5/q7Nk3MFzT+Dx+ImWdInETMU2dolklEekA
	uuin+RFhfrWIctrxFs7Hm2b+w5rKcoKV47h5VEabSec4lcuwJs/rHGjSnjemGlSnIzbS
	P8YQ==
X-Gm-Message-State: APt69E0lhS/iB3q9ubUHeVbBlCJDfpuddv9C8bOcAp2S3B4Xq9fNucCu
	Fr6KJHvTvjnbsMEhjGkaoBc=
X-Received: by 2002:ac8:19fa:: with SMTP id
	s55-v6mr3082050qtk.95.1528298508440; 
	Wed, 06 Jun 2018 08:21:48 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Wed,  6 Jun 2018 12:21:20 -0300
Message-Id: <20180606152128.449-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-devel] [PATCH 03/11] xilinx-dp: Add trailing '\n' to
 qemu_log() call
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i440tcnP5ZKF

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/xlnx_dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 6715b9cc2b..c32ab083f8 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1074,7 +1074,9 @@ static void xlnx_dp_avbufm_write(void *opaque, hwaddr offset, uint64_t value,
     case AV_BUF_STC_SNAPSHOT1:
     case AV_BUF_HCOUNT_VCOUNT_INT0:
     case AV_BUF_HCOUNT_VCOUNT_INT1:
-        qemu_log_mask(LOG_UNIMP, "avbufm: unimplmented");
+        qemu_log_mask(LOG_UNIMP, "avbufm: unimplemented register 0x%04"
+                                 PRIx64 "\n",
+                      offset << 2);
         break;
     default:
         s->avbufm_registers[offset] = value;
-- 
2.17.1

