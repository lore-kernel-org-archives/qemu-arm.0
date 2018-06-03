Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2142363wre;
        Sat, 2 Jun 2018 17:17:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJtVkRf4MFwA0jOLy2/DK9k1El8vhRy2UmZPDf4rRPEvIIPY9n8a4pOodzATvfMzGXoceRU
X-Received: by 2002:ac8:1ca:: with SMTP id b10-v6mr15771802qtg.360.1527985061329;
        Sat, 02 Jun 2018 17:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527985061; cv=none;
        d=google.com; s=arc-20160816;
        b=J7155qoEvnDNOfs4mACcijBl9WxFBsJ9XwKV6O4ADwUygPPaj1CgmXOFLRopzn2JlE
         kzGMGzqBEJM/lScSJ9GI3sYFPWQFcot9PlCPJIu24B6do6JGsC/kez+9wnZMyKOzhFZJ
         5g54t/2ZCMEu2moeCrNxDZjZTl9nG2PPF0cqkdhvdx5+cFFu6oF4jxGNlzE43DGNwA8g
         ooYmxG8FuoWWoum/35KNjK9Hczj2AQYTRJF/PrCBogGq5SgHez7AL8DARpoOTi04nkT+
         m3HoRumU3lG5YI2nTG+GyM2uyp3zQwXDu/2REguouS083ycQr1llUOMnDhufBmZnOx6E
         wAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qbszP7j+MJt4uhKSGaNBrODnWapPPw9GmZ73321LCyU=;
        b=k79I8IhsKLYtDp/nQs/nVzV+iBP6HPXOgRtlO3gyX8TTRuImGvYF5OAy6p7ID50Xha
         yksrFkOC7l4G/tPvKAnVNUFWCG7dlAkJAmof8LHdGn4a/gftCRtW19GA3/iAxBxuylNc
         HRTaA+S/CLGAaxU97RYbhy1iQgL1YFeab0ZTaGJcGJrvUY7dKaFZNWzLfGWRKa6UcYdD
         eIqQl7pohE5IdTQqir0OzgKovPzWvyN45Ny6ThI8MWT+YVZNY+b90RdEq6AaAvcz973q
         KSsoaRa1JGcPNPNSUxZkImsXiN3hpM72C0w4Tk98A+rwSN/Hxv3+cgaUmeHbQei/cvzl
         aeGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cvF8Tg33;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si181062qvb.37.2018.06.02.17.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:17:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cvF8Tg33;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGiK-0001Jn-TT
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:17:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZx-00045R-Cg
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:09:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZw-00031W-9V
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:09:01 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:44465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZw-00031A-5Q; Sat, 02 Jun 2018 20:09:00 -0400
Received: by mail-qt0-x235.google.com with SMTP id d3-v6so36667494qtp.11;
	Sat, 02 Jun 2018 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qbszP7j+MJt4uhKSGaNBrODnWapPPw9GmZ73321LCyU=;
	b=cvF8Tg33QbdnnOAZ3avZ/yCia33PdV6xnMvUlvmAadoKfL12tt5gCgVP/4i8Bhx+Um
	gC9YmlNZIsZ/m/T6Ndm7LpB7pk3SA32412XspgzMAPBBgArtpqsy3ATLyclHkLy883B+
	RojfbUaSPI+AP7U6ltN4Mc38/JpMwu9VtzJaw+mv5chobZeYfZSzIb9tlCKawmRKPDf0
	ybKR72hPaSGAAAfm6mDz1XuF7wljFggqdQqkXCGccJXh55h1NW7UCkjc1hCfNIRti7tn
	RhTFG1FJ92Rvkw3ktYQIefHGPWBTEcI5MoWvq7n6luMB4Ry1GT0p+5wwwUsfiffhE+EY
	FmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qbszP7j+MJt4uhKSGaNBrODnWapPPw9GmZ73321LCyU=;
	b=EXfTav7cFPu9jl9RI2DpPuCWyjF29CKiSE50m89PKeu6a6kavjkUOvmjnQeXqzhO7m
	35sZfG6hqibSnuK83Ga1UkFgkRRlX0QkurQcVXXtO+E6pBAm45DXD02L+3bIQF3dKZ9J
	TS9vso+neGHH5ughjl/2JKb+KOlIO0iqkWj6/H3a1P6yNB80qE5OPw3Z0cZPBglYz9dg
	dy6qkOkqSj3w5P/EwX9AUB1gmqvk/sNrLwvnwjy1pZ7/lX4CfVf9Ec8H3zxCxclf8IZe
	ek9c8TmRIUQIXYHIp/KN55HjEC+TFlfknX+X8bew20X+oT5W6+UqM3nDM1UrFklL2uzB
	6hsg==
X-Gm-Message-State: APt69E2zpsuOtEv7OhVqLQ4/VtTDN1BQFy0SK9Gaz8U6L/N9aOnISdOF
	lJ8b1z12C/FBKFdN4aYVGBM=
X-Received: by 2002:ac8:22a1:: with SMTP id
	f30-v6mr15992160qta.358.1527984539737; 
	Sat, 02 Jun 2018 17:08:59 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:27 -0300
Message-Id: <20180603000827.30872-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: [Qemu-devel] [PATCH 8/8] sdcard: Disable CMD19/CMD23 for Spec v2
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
X-TUID: jQkaz6XVEk39

These commands got introduced by Spec v3.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 83426da133..ac202e05a1 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1178,6 +1178,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
+        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            break;
+        }
         if (sd->state == sd_transfer_state) {
             sd->state = sd_sendingdata_state;
             sd->data_offset = 0;
@@ -1186,6 +1189,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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

