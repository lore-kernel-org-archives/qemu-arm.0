Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4348248wrp;
        Tue, 24 Sep 2019 13:21:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyl/sSk+mUODLR1H6Zh4LuOQkdj8kayMFD0jRU/mPZNlP+xxrXlj86HGc13JY7w3JebeBo5
X-Received: by 2002:ac8:1cf:: with SMTP id b15mr4787280qtg.56.1569356518472;
        Tue, 24 Sep 2019 13:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569356518; cv=none;
        d=google.com; s=arc-20160816;
        b=dx0eQUzmmJBI9kL4I2MNu444GT6FcVumEWj1ApiZi9fyYLDJ57Rx5ZBpGwyGPba6/0
         r2UISloxlBWPbTlc1OzhiUe3yj3I7I2Sx3BNNEMNIsBQY7LFpqtXWFNCKqu4S3wndmwB
         t0r3InTGvTZOH/Y+dAzpC8Y4nsgSuVfKkopvdb9lnS2NPazgAXR1o4LG0lgVo/cFGx08
         tThmJ70iV2mLbLAVJD/6xzezdSFuphbpeA4nwtvhF6XmJuner+JtF5WHcWhVXUajN1LD
         YNFoSSRyRrRvvoy7v8eSk5HxYKAPcQ61haqJk84pJVF2VfqpNrdD6i8oXQNsOvIUz4mU
         CGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=k8GFrrjbVkHKVZH32INLmIGqdgT8oQ+MJRfAi9S1Gg0=;
        b=DR9sCmIjr9lHQi4U91t6keVO3eD5SQ0K5oG8u9vCEHQucEG5j0tdOKuppddKbZc2Oz
         ScWOenyGTeiP7X9G5yktTe51fA6btt0EftN1BVAno+SZkr3u8B8PQFrUhHqmUjx7uNQ7
         NQSiwt7Bm+XGcY0m8M7l9hdvOdwVgcPP23/rfjISTYr9rD/MYNuRYKonq03cNhXlla6o
         dfkZ+OBV1a3zPjVl8Y80Yk7KmoA9Lhyx7R7KdGCGeGmboFzBXNevu1OPLJN9hXhvp8VY
         7hTu/s3jOMJBmZRQbHOyLNChrJ1yuAfRJrC0n2OfR2v5T7IRzsgHtHIs9S4w/rYogdfz
         yl5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u45si2066952qtk.44.2019.09.24.13.21.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 13:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:50684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCrJt-0004x5-I0
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 16:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr8B-0000YL-Ke
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr89-0002sl-W1
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:51 -0400
Received: from relay.sw.ru ([185.231.240.75]:38068)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr89-0002rd-Nn; Tue, 24 Sep 2019 16:09:49 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr88-0001Mk-Aq; Tue, 24 Sep 2019 23:09:48 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/25] arm: Fix error_append_hint usage
Date: Tue, 24 Sep 2019 23:08:47 +0300
Message-Id: <20190924200902.4703-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924200902.4703-1-vsementsov@virtuozzo.com>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, vsementsov@virtuozzo.com,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MUf7UZzvnRzh

If we want append hint to errp, we must use ERRP_FUNCTION_BEGIN macro.
Otherwise hint will not be appended in case of errp == &fatal_err
(program will exit before error_append_hint() call). Fix such cases.

This commit (together with its neighbors) was generated by

git grep -l 'error_append_hint(errp' | while read f; do \
spatch --sp-file scripts/coccinelle/fix-error_append_hint-usage.cocci \
--in-place $f; done

and then

./python/commit-per-subsystem.py MAINTAINERS "$(< auto-msg)"

(auto-msg was a file with this commit message)

Still, for backporting it may be more comfortable to use only the first
command and then do one huge commit.

Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/intc/arm_gicv3_kvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 9c7f4ab871..42487fc62b 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -766,6 +766,7 @@ static void vm_change_state_handler(void *opaque, int running,
 
 static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_FUNCTION_BEGIN();
     GICv3State *s = KVM_ARM_GICV3(dev);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
     bool multiple_redist_region_allowed;
-- 
2.21.0

