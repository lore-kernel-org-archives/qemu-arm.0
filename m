Received: by 10.25.159.19 with SMTP id i19csp3910364lfe;
        Thu, 21 Jan 2016 11:08:34 -0800 (PST)
X-Received: by 10.140.133.146 with SMTP id 140mr54535477qhf.99.1453403314128;
        Thu, 21 Jan 2016 11:08:34 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u68si2706439qkl.12.2016.01.21.11.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 11:08:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMKav-0005d9-J8
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 14:08:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXN-0007X8-Hj
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXI-0001Cv-7M
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:53 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aMKXH-0001Cq-VD; Thu, 21 Jan 2016 14:04:48 -0500
Received: by mail-lf0-x241.google.com with SMTP id c134so2839419lfb.2;
	Thu, 21 Jan 2016 11:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QkhP8k1Opv+JA53f0t4rI5ieQisnq8wqD6P4Le2sO/Q=;
	b=B/4zqVTZAgu4Z80Jr8DowX2mO/oq+biFKzG6jfvTVp4k427WmllYPKSlOEdHt2MZ9G
	Tup8GfV62ovsoZHS5nLzGGQSnJjOU7Qo4sz8hlgjsQuk8F0T3C7iecy0RnajF5m9IRIK
	tKMOily4ftpbVWlvJ+XYYZDmYR7WT0RL/IBwrBERJv8j2tT1c+1v+QfPr8Gr6XdPE+on
	aKJwV8DL8LmMx58D4F2c/JCzGXMBl/1/yffS9MezBl6Y9ahByhMr8IAV4jBVKgIYXcAZ
	D/tpmigjJ3K0RlhIO2fzLIYpk6q9MLDZt8cqsqDWUtDUfPZK3cUzdhB9jQq9hu7dvFdu
	2AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=QkhP8k1Opv+JA53f0t4rI5ieQisnq8wqD6P4Le2sO/Q=;
	b=doyQobnWBtLg6Sa2BMGz97Mv0P2YPGis6TfE9kFOB6Hrk8Dh/mGO0EYtrT3iWqc7Q0
	yAfWjDN5BlKDer01X/zRKOzHL8RRzYV318rm0hG1Qy6LIjOotOVpd9Rtt1B3Uw0pISln
	vzfKdVX94ZXqXBN/G+TBA0hPKH3z7oux2LxdsrOEEJVCDK8Vzmnfh2OGqB/PmuseeGF+
	Ly+zcVA3JvRRZOmQ0z6LoAyav/8KOMxn/ScZO3NTygni8s/Ht1G08IrwJWIc4kwgZYoC
	FtmToyFUv2gTlwN72rrk9FAuqUWxwBZUBMXAtMVADb+U0WkazUResTwriWGegI4jqK83
	Ozqw==
X-Gm-Message-State: ALoCoQmKqrNLLcuswLloVv2GQQXbW0Pkyf7Na1J75Jrq0Lf9/mSw7AUN4YIhL0ZSKkFGX3lAAF8/zm4wyc6NVs5FL2O89aLo+A==
X-Received: by 10.25.153.130 with SMTP id b124mr16317554lfe.81.1453403087125; 
	Thu, 21 Jan 2016 11:04:47 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163])
	by smtp.gmail.com with ESMTPSA id m21sm382496lfe.29.2016.01.21.11.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 11:04:46 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jan 2016 22:03:48 +0300
Message-Id: <e848f85c73ff96bd12cd33e48c8b10177fb86806.1453402860.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v11 5/7] hw/ptimer: Introduce ptimer_get_limit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NK3S1uIMYjD0

Currently ptimer users are used to store copy of the limit value, because
ptimer doesn't provide facility to retrieve the limit. Let's provide it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c    | 5 +++++
 include/hw/ptimer.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index a85d1ae..142cc64 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -224,6 +224,11 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
     }
 }
 
+uint64_t ptimer_get_limit(ptimer_state *s)
+{
+    return s->limit;
+}
+
 const VMStateDescription vmstate_ptimer = {
     .name = "ptimer",
     .version_id = 1,
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 8ebacbb..e397db5 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -19,6 +19,7 @@ typedef void (*ptimer_cb)(void *opaque);
 ptimer_state *ptimer_init(QEMUBH *bh);
 void ptimer_set_period(ptimer_state *s, int64_t period);
 void ptimer_set_freq(ptimer_state *s, uint32_t freq);
+uint64_t ptimer_get_limit(ptimer_state *s);
 void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload);
 uint64_t ptimer_get_count(ptimer_state *s);
 void ptimer_set_count(ptimer_state *s, uint64_t count);
-- 
2.7.0

