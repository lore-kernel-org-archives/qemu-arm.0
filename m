Received: by 10.25.27.66 with SMTP id b63csp616225lfb;
        Sat, 4 Jun 2016 01:15:41 -0700 (PDT)
X-Received: by 10.55.207.149 with SMTP id v21mr7170947qkl.195.1465028141537;
        Sat, 04 Jun 2016 01:15:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m3si4817678qkl.62.2016.06.04.01.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Jun 2016 01:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b96k8-0001MY-Rs
	for alex.bennee@linaro.org; Sat, 04 Jun 2016 04:15:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96k1-0001Iu-RV
	for qemu-arm@nongnu.org; Sat, 04 Jun 2016 04:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jx-0002CJ-JG
	for qemu-arm@nongnu.org; Sat, 04 Jun 2016 04:15:32 -0400
Received: from m12-18.163.com ([220.181.12.18]:59032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b96jd-00021Y-I6; Sat, 04 Jun 2016 04:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=9fTeQh7498XNdPk9Yu
	EjlnaeSk3FWuEPUJ5uTXb8iFs=; b=EnD7eHSUFP/cSRQrjST9oo5DxxaLvdo7jm
	noNrQLo0j703jFXCx20y33IGbw8+aobip9FlZ46IHV/eOHIqiCcVyOS9qF6xXMqZ
	+oG+ftuMioSyA1wLYLR8x1F0Is6ihZDs20D+oBHukZuUM/uPhBJ9LgLNl+MhkFdr
	kgh1cFd80=
Received: from debian.lan (unknown [114.111.167.200])
	by smtp14 (Coremail) with SMTP id EsCowECpfUbfjVJXKXU9AA--.28040S8;
	Sat, 04 Jun 2016 16:14:42 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sat,  4 Jun 2016 16:14:25 +0800
Message-Id: <1465028065-5855-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
References: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECpfUbfjVJXKXU9AA--.28040S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy7ZrWUZFW7Ww48JFWDArb_yoW8Xr48pF
	93Cr9rury5WrW5Xr17GF1fCF15Ww1UGr17W34kuw1vv3Z0vw18ursrta10yryDXrZ2qryY
	vF93ZFs0ya15taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b4jjkUUUUU=
X-Originating-IP: [114.111.167.200]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOxJ+xlXlT5XBVQAAsv
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH v2 6/6] char: get rid of qemu_char_get_next_serial
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
Cc: robh@kernel.org, peter.maydell@linaro.org, armbru@redhat.com,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	antonynpavlov@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Ae2UsGM2nLN

since there is no user of qemu_char_get_next_serial any more,
it's time to let it go away.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.8.1


