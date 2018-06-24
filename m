Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2449184wrq;
        Sat, 23 Jun 2018 21:14:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJvNsE7LCDZCKt2C23EyMUomzy08E5mEDC8xvJzD1MaTyhmpc+SnDuphYMkRFT4KuiWAPPk
X-Received: by 2002:ac8:29e:: with SMTP id p30-v6mr541208qtg.131.1529813660272;
        Sat, 23 Jun 2018 21:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813660; cv=none;
        d=google.com; s=arc-20160816;
        b=jYGMscSQiFoMfY6uHKf4CAIeI/en0N3YraHvN2Ut2yw1jbc7wk6JDEM/rvhANOyKhJ
         8AgoVwGzWmqH/qUVjJv1Uqha8WBY67KKS8jmBveHMi/hc3Y5ylP9I1bAX3AH56Vay98R
         Ayl6f2kvEU7ngNs9uA3FzUMu4YT5GSfSzLqngXgFxmEAAiB8XC8+QIG3kNhcwcGNcBcq
         A1SAG9MaqcdYCjiWQDZihGVdUVbgBnMWyYQzRn/BwZrj5khvDq+9v+yvFYktLJc+m1oi
         JT8aCLS6vbkemqsT3JjNhXQqDx6PcQHjT80BnKx8ujkTa9oE5siklXra8Kai/VtjVo4R
         Ab/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=0813b3tZy7rwAPhFhDgW2zSrtA+q6aqQyRwlZWaHh0c=;
        b=q1Wk8xEA6DNboXXSYhtfvcRInmGfJoM7LBJokaN2xLFut6dtWa7xEfxYwSjkOft8n8
         hPimnO/w4y8Cez+Ns9uQwYL5GpHNNZ7rfJ3SHWLVHjc810nsJeLWmjEYnm7zaLHyaY47
         7CawS4NSsyqvNoyv+DV0R9sUTaknt5qsuGe8rxEnd9sWK9IrX545uqfCO9ulHH/5jLDF
         PwgedA9xg4/Vb6KGDGuMQDXiNhlQJDuCb3Kzhxi0hkIX8qU0F+PUlR5OkzOdm8bdMwGt
         zVYH1iJLl7P1kMdgYF+pquDa00/3QJE4Vwzr9UKblPuxOGFCXMGo52QWfPCwr+OB1J+E
         iFOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dLRBr+Y0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17-v6si2460847qvf.115.2018.06.23.21.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dLRBr+Y0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwPr-0001KK-OA
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIz-0004Ok-FI
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:07:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIv-0004P6-3Y
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:07:13 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:34040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIu-0004Oo-VE; Sun, 24 Jun 2018 00:07:09 -0400
Received: by mail-qt0-x231.google.com with SMTP id b20-v6so116313qtp.1;
	Sat, 23 Jun 2018 21:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0813b3tZy7rwAPhFhDgW2zSrtA+q6aqQyRwlZWaHh0c=;
	b=dLRBr+Y0fdF+CbPtlsr6YFCANMK7JE5KsBQU/rfO2r2gvpPhTkQNF3mR5udCb+5Tz4
	35RH2GhNIntlOL2qghjdI6bEi4lUN0iOrljxAE/WjoQAoHpqfKR+uqcV+scxuJXarTfI
	kxDxD/6VWyUwLp20H1HdYBZydp2D7mUAh2bsMKRzCOLdwvHfnI+T0ApwFsbAgIc29xDU
	k1N0jQz1lTA34Dxw9BDY9jLYMLIo4iWTQc2rKVHR1v+xGGjCmPxlgsDb/4R5BfPhMmXL
	5u3WKNk2mCDZJCIJLiXeOVNwTjRYtWPnW6Bn0/I6Op6FUATCqiR6YH4bL6aT7ag+zVRw
	xq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0813b3tZy7rwAPhFhDgW2zSrtA+q6aqQyRwlZWaHh0c=;
	b=FwLofxpC3PMCQXZ8v6zy2vvs4NMysbdfMftv1baxoAjwqSAWnyvr0A8oEYeBIN/8xm
	5D2Ngxtj925BwB6jCO/NVhUKsnuG+mOrD3pfQ4sp8MTX0W5dyAH1F79Y2T69SKT7s5pQ
	290z/RrGxNPGDqmZCT87fKwaImswT3/YgKeBAMTBrtrGBXSoDtf8mbu2AsApCYQ0gt/d
	Swz7cCVA0+A59ennml5OVMYxrTRDonX4HTMjwcbANQ1erODWVhKtfSfqTXvF7InCXEqy
	1aR6K2u02aMPcaUJusRnBNp1y10v9V5n2FSG7LF85DJZYcVtDpSbhrBp+UtlpBhHifyO
	WxlQ==
X-Gm-Message-State: APt69E2r1BOIh0pidlNDCxqKkvCwkiujeZvYlyRiVlHi6jxJ2H557mr7
	UmfLiHe7eXS06En9oTHsN2Y=
X-Received: by 2002:ac8:6045:: with SMTP id
	k5-v6mr6752064qtm.204.1529813228490; 
	Sat, 23 Jun 2018 21:07:08 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.07.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:07:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:09 -0300
Message-Id: <20180624040609.17572-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: [Qemu-devel] [PATCH v3 16/16] hw/arm/stellaris: Use HWADDR_PRIx to
 display register address
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
X-TUID: wJXKpXI9JA/I

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 42baa768b2..dc521b4a5a 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -212,7 +212,8 @@ static uint64_t gptm_read(void *opaque, hwaddr offset,
         return 0;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: read at bad offset 0x%x\n", (int)offset);
+                      "GPTM: read at bad offset 0x02%" HWADDR_PRIx "\n",
+                      offset);
         return 0;
     }
 }
@@ -294,7 +295,8 @@ static void gptm_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: write at bad offset 0x%x\n", (int)offset);
+                      "GPTM: write at bad offset 0x02%" HWADDR_PRIx "\n",
+                      offset);
     }
     gptm_update_irq(s);
 }
-- 
2.18.0

