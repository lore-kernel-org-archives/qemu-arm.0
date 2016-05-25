Received: by 10.25.30.65 with SMTP id e62csp1249257lfe;
        Wed, 25 May 2016 04:25:23 -0700 (PDT)
X-Received: by 10.55.109.135 with SMTP id i129mr2991977qkc.127.1464175522949;
        Wed, 25 May 2016 04:25:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t93si7374266qtd.107.2016.05.25.04.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5WwE-0007n4-AF
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:25:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WX2-0000mQ-Q8
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:59:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WX0-0002Tx-TF
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:59:19 -0400
Received: from m12-18.163.com ([220.181.12.18]:39500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b5WWj-0002K4-7o; Wed, 25 May 2016 06:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=pA+nzu9PB+oZgeSdXO
	tLP/bY4ZddOeUWqiN+xDRTw8M=; b=AOuzKFHq3cZZovU9IMSUFrdhjfyPKzXpF2
	u3ezwd9HRzhsSN6Jhiqk5PMbgezt9CaJUw0e4Crk6l9aZb5B9BAsJYrS9/WZKRTJ
	072+7ebzTXhJhsu8BJMwTgyjpRS/cXvF4a8rF/I6EMYROcrfy1SCrmJUG6I7fvxz
	cxyx6NjYE=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZp0pKhUVXzcaKAA--.5553S8;
	Wed, 25 May 2016 18:58:52 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 18:58:16 +0800
Message-Id: <1464173896-4088-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZp0pKhUVXzcaKAA--.5553S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyfCw4DGw4UZw4rZr4kXrb_yoW8GFykpr
	9akr9rWry5Wry5Xr17GF13CF15Ww1UGr17W34kuwnYv3WYvw10grsrta10yryUXrZ2qryY
	vF93XFs0ya15taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkxhLUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgx0xlZXx--fXwABsU
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 6/6] char: get rid of qemu_char_get_next_serial
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: robh@kernel.org, peter.maydell@linaro.org, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o+PoFC7qmIdg

since there is no user of qemu_char_get_next_serial any more,
it's time to let it go away.

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 include/sysemu/char.h |  1 -
 qemu-char.c           | 16 ----------------
 2 files changed, 17 deletions(-)

diff --git a/include/sysemu/char.h b/include/sysemu/char.h
index 307fd8f..372a6fd 100644
--- a/include/sysemu/char.h
+++ b/include/sysemu/char.h
@@ -403,7 +403,6 @@ void register_char_driver(const char *name, ChardevBackendKind kind,
 
 extern int term_escape_char;
 
-CharDriverState *qemu_char_get_next_serial(void);
 
 /* console.c */
 typedef CharDriverState *(VcHandler)(ChardevVC *vc, Error **errp);
diff --git a/qemu-char.c b/qemu-char.c
index b597ee1..b13ecbb 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -4088,22 +4088,6 @@ CharDriverState *qemu_chr_find(const char *name)
     return NULL;
 }
 
-/* Get a character (serial) device interface.  */
-CharDriverState *qemu_char_get_next_serial(void)
-{
-    static int next_serial;
-    CharDriverState *chr;
-
-    /* FIXME: This function needs to go away: use chardev properties!  */
-
-    while (next_serial < MAX_SERIAL_PORTS && serial_hds[next_serial]) {
-        chr = serial_hds[next_serial++];
-        qemu_chr_fe_claim_no_fail(chr);
-        return chr;
-    }
-    return NULL;
-}
-
 QemuOptsList qemu_chardev_opts = {
     .name = "chardev",
     .implied_opt_name = "backend",
-- 
2.1.4


