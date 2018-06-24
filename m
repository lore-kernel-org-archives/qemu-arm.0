Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2454894wrq;
        Sat, 23 Jun 2018 21:25:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpctjXNo6UrqTQ3NKZHSgiDVsqZQAksSYxnQsr7GeCypl/fqVk/F28UEWhzYjLiBsXQl94qr
X-Received: by 2002:a37:8704:: with SMTP id j4-v6mr6473414qkd.235.1529814354447;
        Sat, 23 Jun 2018 21:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529814354; cv=none;
        d=google.com; s=arc-20160816;
        b=ONrnEdFC2NHNRFmqfPYgv1uEgDGkjRT8rhkOh8puBNkAInSKl9B96QWsdVuoX7KxPc
         rRwfhzKO/ckgn4Zpgf2ejgnjiGIRfsMqSM6+8Jrxbf3Vu380kSLCDxgKiMdCBCje8z1R
         8T5HG8T9c0S1g9J7v+WmvgVjSp5WY7uRqyzxLYve9LuFeGZxPSo8r7NfaU8zF3rHLpCf
         zWFV5j9tES/jWaJFmMs49OGs/Ax2jLTRmyCqH6R5df7eSG85U9eoifaG2JSs7NSuZ3P4
         OMsgMhwvczVy4l9s43lXv0tD6ix65xOCLRa0hwrQcJJyDfk7Vs25iMvXVd5FRQzJK9MQ
         l+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ChrS/spx+A2v0ilF0tFUJ3RU9zfGVuplHoHQXfS1MYs=;
        b=cvNBr3K4uzcq8I6zGlPAT402QcjiuEZpfn4rakLKhFhykiDf2S20QYCy8CpDvwT9Yv
         4riydu44A0DvRGhfoiwgAa1HJEvxvOIQoC+e8JBrs/+cO4xNlWTPkF+zk59Jy+f6Mwja
         uk5oBzlVwWwoJbSVcctbunkXTVizqNqxzS31KZqcPxFccfFzthf99CF/W6uFs1XkzDM5
         7aaCUkEjWWAHylEGITNhoXMkDIgV05h4EkCC9wVz549JW4Qns+GgHlKyBPZYVkWTryVr
         laQTQY0SoZEQ7zXvC6x7zoFmbq4k04HSztPW/GNI4WWL8gibirAw/kMrHr01DInSGSLu
         vSUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LmdjT+Pc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x12-v6si1834768qvk.211.2018.06.23.21.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LmdjT+Pc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwb4-0000l5-15
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:25:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIt-0004JX-7M
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIs-0004NS-FB
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:07:07 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIs-0004N2-BF; Sun, 24 Jun 2018 00:07:06 -0400
Received: by mail-qt0-x241.google.com with SMTP id h5-v6so9321598qtm.13;
	Sat, 23 Jun 2018 21:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ChrS/spx+A2v0ilF0tFUJ3RU9zfGVuplHoHQXfS1MYs=;
	b=LmdjT+PcmACB3Dm1t9cv3q01HuI6twQFKpowfoUkyiInMXPr/vFR6LgzWVo16fMjrz
	6g2d9EjTdz4BnvURf3Z96lRGPftVcjMFZCWNyadIJ/ph/LYkcUjWuM2PeO2tbn9IBazk
	kOg933xt9GZcvrHX0ZbO02hWX+RdfsRq8yAQAakYFPRS5uBvi4TS5z75CxhfvoXNsLce
	4u2iSBr2GyM7fUi9WzSI/skR7ZZzjHgF7HvresGxN9dhkV1YGlbDm/exdxJ6qYXV/3DX
	nQLuDUAtOrpTM3cVQUsKVUrZo+eEEaXnnJVse8w6afNDBm4J90IpKxGP6ZjdM5aufJQZ
	HNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ChrS/spx+A2v0ilF0tFUJ3RU9zfGVuplHoHQXfS1MYs=;
	b=Uih+UmcRlA+M6Sv2G0Z3x/wnVznueXAEchCeUEpoRGdrceE1v6skHGb19bbfuC9NXj
	saOv+iYP//aKmCDChApoaA6lB90N17qaedu/0YKT9u56rTS/DsUnwIS+9OOQvfm+7SPs
	xK+gWDkf/tXeuoeRB4AlKP3CpoCJcLvW1AhOHrunuCuNnfdYgNVqiU28iybkpycxO12h
	bhwIitQvbMb5Jk54upfej0m38M82qOeWDA+o84dyNxTZXpLPhMTTBcFpmm4+8fa7SLVH
	uZuPJ7jCRyjcam9YRVwg6snG3u1ACBNne08tM7eLovBw4Sqmr0pFXPHo0GwM/IelEY7p
	o1YQ==
X-Gm-Message-State: APt69E0h8k3kgUp0V80AvtADSZ1BBwleFVerKXr0D/8WKjN5Oh4ZSb5n
	pbYODWWs8kT6NYCsxW8XA28=
X-Received: by 2002:a0c:8c8a:: with SMTP id
	p10-v6mr6606448qvb.68.1529813225927; 
	Sat, 23 Jun 2018 21:07:05 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.07.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:07:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:08 -0300
Message-Id: <20180624040609.17572-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v3 15/16] hw/arm/stellaris: Fix gptm_write()
 error message
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
X-TUID: vAk/W0oe3cZ6

Missed in df3692e04b2.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d06e366402..42baa768b2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -294,7 +294,7 @@ static void gptm_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: read at bad offset 0x%x\n", (int)offset);
+                      "GPTM: write at bad offset 0x%x\n", (int)offset);
     }
     gptm_update_irq(s);
 }
-- 
2.18.0

