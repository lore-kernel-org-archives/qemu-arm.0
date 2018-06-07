Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2407382wrq;
        Thu, 7 Jun 2018 11:10:13 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLZMx8MD3ZmyuFnwlH49M3JAc/Ylfe9WIcYMJ0s9rFTeamYjWEZAK2NPsaijaC/3BnYirQ2
X-Received: by 2002:ac8:43c7:: with SMTP id w7-v6mr2828543qtn.371.1528395013819;
        Thu, 07 Jun 2018 11:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528395013; cv=none;
        d=google.com; s=arc-20160816;
        b=QDh05KcVEduZ7CP8azBVM9GtJyMflTsOeA7wGt8nKo0ZNFVImen4SsdQ+Wa056oS4i
         swXzOG17QS355fyTxcn/lu+55MAP5HiSaiYxK/V4ZTf9zyHmkZiTPNdTAJZpDasMIXw8
         +L49txziDdCNQ1jALfjH2mcyZqy9Ng5SNXs4K5/xzh5nmzrNGWMq37cQsO0inwE5G+Wv
         XBgVSXPBJE/RFPzB+OqMxBwxDlot7dN+YiuyJhtfZm7JG8xRLfNrOS+6XqVgzhllLQEM
         d/D0n3p7cLMaIGtcmUb1NMDJPGdCSPqq7ighjBzixQNHF3mbj8D5iCcF5BzkXvhL5vV8
         tb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jac/D2I0BeGJ5N/WGcM7hCJ30SgLrQ/6pcubjDWhWFw=;
        b=Y3a/KRL57nN+w/OPGpSoqBLy3RnsCzdA+kJvRrhylBbJt9WddUEEmlMePJ65uuXMPF
         K9ZT8DQs+asNl+rue2ov/BPr5pjiBqBB/MLZKuNEgSjjVsLrXHiqe7mhMe9RMJk2x1Rb
         saUefypcjRaf/YNxpaToB/NEsIZzFMh/CVIFxZJhHr+c+eimMKm21ROM3m6N5/6UZT8A
         qQAl+S6MtsQ/zDjXAn4yaIRay4KgMjeBRlNGhIMa7Lwrhodivtv63ZlUj42u1vE9jzwl
         suEeZb7Fif153QSWrfu6o42b2kFvW/3f3JyYE5wWXh1VilTzvrOpKgeK3D6FHmmRLGai
         Bnsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bHnXy4XQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123-v6si2139179qkc.105.2018.06.07.11.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bHnXy4XQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzMT-0004Ip-9i
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:10:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJX-0002DJ-Fs
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 14:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJU-0004W9-8s
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 14:07:11 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJU-0004Vs-4W; Thu, 07 Jun 2018 14:07:08 -0400
Received: by mail-qt0-x243.google.com with SMTP id s9-v6so10799337qtg.2;
	Thu, 07 Jun 2018 11:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jac/D2I0BeGJ5N/WGcM7hCJ30SgLrQ/6pcubjDWhWFw=;
	b=bHnXy4XQKFtpADUOkL7Q01IVLizwHQPoOQSXoWRLigQh9i0pqFzjXTi+A8wFFHklNc
	jU+0iKMP2c6K7IisyldG5EH5IhE5o1wWDk9JBBBlWMwK4PrKn1nN+tBO9aizolum7RMv
	gbQQK7Pb/itMN6wQd2A3cNv78USrRPjqqLPhj2VR30lJ2S+HTpoHx8OO/SXASOayrt8n
	b0kUVh9vTvjoU61X0PpNVz8qImfNT/1KsQFMMlhaB2hXqOJKSerx9TCK6fm7zRuwiVS7
	6dzQCwDL4rEl43mxgzu2/nAJicbuak1G48c9W7EjVjvsJhyFIdxAX7RW/lxOjtPxruTo
	q7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jac/D2I0BeGJ5N/WGcM7hCJ30SgLrQ/6pcubjDWhWFw=;
	b=b1SwuNyY1IGQcg6WVHD/ztC3UGU6N2AmOBaG5z1Lo11ia9Gwgai7veVCBmrUPmrc+q
	qAhi9Vod1LzbOAI/2tk0UvbbnrtiX5VeMVmfsTRn+bj+Mc/XpSM/KuxOwijUPLahFd/+
	eh34mPd2jUmG4kj4Qz06wk03bYAK+xBNhW7FrFaucYOhbOyILyFeOIecn5OPSEF1wvKh
	LeRx4Set2EUBOepsJJiyuO5u7PNTm74jXgFV1YJYr3n6AAag5vvuFLbyMBj+r2D0ifOt
	pepCVEK5vsSTsNUJVS1nfYGoLAQ3gG+nJOeRLTQLQQ65b2ZjSiGMZE1iKsZ7fEpojOaS
	PFzQ==
X-Gm-Message-State: APt69E0MZ8bsWh4gQo/fVxBeunENgoCQccBIMIRAKMBwfA/xezQBRnbl
	zQcYYhymYNcaTCnOihZs+RC/F9/+
X-Received: by 2002:a0c:b116:: with SMTP id
	q22-v6mr2702808qvc.19.1528394827733; 
	Thu, 07 Jun 2018 11:07:07 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s15-v6sm26838414qtc.81.2018.06.07.11.07.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:07:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  7 Jun 2018 15:06:40 -0300
Message-Id: <20180607180641.874-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v2 6/7] sdcard: Disable CMD19/CMD23 for Spec v2
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mAvgb1KsnS+N

These commands got introduced by Spec v3
(see 0c3fb03f7ec and 4481bbc79d2).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4e49a3827a..540bccb8d1 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1179,6 +1179,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
+        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            break;
+        }
         if (sd->state == sd_transfer_state) {
             sd->state = sd_sendingdata_state;
             sd->data_offset = 0;
@@ -1187,6 +1190,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 23:    /* CMD23: SET_BLOCK_COUNT */
+        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            break;
+        }
         switch (sd->state) {
         case sd_transfer_state:
             sd->multi_blk_cnt = req.arg;
-- 
2.17.1

