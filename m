Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5036100lfm;
        Tue, 21 Apr 2020 05:29:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypKiAJDlV81+BAnECqo6bljhCVVFqIdcX6Ax+qZbxMf7hUZp+Nhr1l/jv21A1/TA6LVuL/qv
X-Received: by 2002:a05:620a:1202:: with SMTP id u2mr21969985qkj.285.1587472143964;
        Tue, 21 Apr 2020 05:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587472143; cv=none;
        d=google.com; s=arc-20160816;
        b=T0BGRQNj+yE6JYZRmnja5WPjywdVMJh02PO+1YxRu3V7vCAcJLnhTOo2au076FjJSu
         G8VWCiKBCUyWjmj+tdgMUshv3Om8x4jmsM62vuqxqxgMjgiPK6whx2wNKS/73D/fVlIy
         vnO2QJqlzH2h1g0ym/8bfSENTNeT8i4k58ZENvrmf0+L0rPZddivLGFcw7cgZ2B2s+OX
         G4Ep6nFDqBN512O+JLzih/4Yx0xp47NUzfcw4uDXqmZOqybWshSkNcnAfjdF5TdTDOrG
         LOXP5Lz/GbvO0nygY1bTEXd6bVearzEvL4wtvPsE1yi0o1dhK0+3MLbZ3kU+2w4GH2YJ
         rTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6G+yfsnGl0+FoI1DVe5nG84rFUeB4gMvQlTXCcmvbGo=;
        b=PZ9UdgevoTrJR8noSOk73srQELzEsH3WXVz1sfyk/tNGMVSBDLexHyDaKXBeros3mg
         t1nAca5qj4hsBMc+PR9KloV/u5YSfoGeLhdSIlavSPfBYJHW9/QiTFuDf/OAkAsvPE+/
         4HspSQQK7KwmnqWuK0dN5gfskh8yxHAxb1YwHsf0aF+VY3KHysUiz6z0FZlU4goxXm5l
         DkkOHnQKR5EsJjRscaV/NNc1C+bj5zhQ52KdcF+6WdrFidnzlmweHIK2f5q3nKiHcH6q
         YpKRSKjaVxFZryumHkv77KdyZKCj/fC0ncC6Qi58V1A51SyrILjFwp9FlygKdCJF2vpF
         QXmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P28zWxOh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k32si1440768qtk.50.2020.04.21.05.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 05:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P28zWxOh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQs1P-0006qA-By
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 08:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpr-0005qW-VU
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 08:17:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpr-00071Y-B1
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 08:17:07 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpp-0006xF-LR; Tue, 21 Apr 2020 08:17:06 -0400
Received: by mail-wr1-x444.google.com with SMTP id f13so16187768wrm.13;
 Tue, 21 Apr 2020 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6G+yfsnGl0+FoI1DVe5nG84rFUeB4gMvQlTXCcmvbGo=;
 b=P28zWxOhgj/kk2eFtgcOogIrmHhqvdVkBUxEqOBLZDSXbJR4aDlGb6OJRXrE+ucTJh
 /mRlRhNA6dRmFOJMVJfv5MFOCzuDlgPN3+gR2Ou1oquTSOnc3Rrd8oL87UrZnZmeTbJm
 JPqyRT7CxAnKjbn0EVfscA2FmaiFc4LEtUt93YLVIk4+XJfZTa2p+wUFebt7BtuLi1NN
 rZ8GSu823RJfkTcNOF4vbJkDeN2wx0uqeCi5rGee15YV2zBbGnXIIOUF7JEdE6IhzVVg
 ZoSBdKfiwpRkGXnWXC31/fvc0FCVJ3ETFghWKoHX+UrENu+gEQlM08Ei1Vt3V3PNnZfp
 U3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6G+yfsnGl0+FoI1DVe5nG84rFUeB4gMvQlTXCcmvbGo=;
 b=J+R47HTsYSC8ZgG6p/N4miLx59onvvZ8xOupaQSaH8cGlA03arjOB9GRn7ga0igM48
 FZMbfBcljbeAHuOmtcjMsT9dSZ8pnmfxi6nU1wpDfI//tQXYd16KRYHSKXXhjgpxLFc1
 OCTnJ8W2Uc3bcyfeOjX3S7SlUMlf4sxwNouZtQDobetFCvAEZ1lGrczRgc2DT5lCYeIG
 cH2wooYlHjvOPJg3GEHVnVS1bP8WUYARbE+YU2SrEB2ZJJB6fTKEvRNmVijMoWsA9dcg
 2J/HkyXJssiVwDGqUoRm3KMoLTBY4oqJQBnBRmcCi7lWGp1TR/7PFZSgUaw+hxsR0D7W
 SKeg==
X-Gm-Message-State: AGi0PuZ9CcROhWC+2lAnPa7vZjOqVw9BQ16rhB412Y9gypTZcfbx4DPT
 7n1NxOp9YVv4s67cIMnumL6ZUudY1eY=
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr23542319wrw.402.1587471421434; 
 Tue, 21 Apr 2020 05:17:01 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id z76sm3761140wmc.9.2020.04.21.05.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:17:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 17/17] tests/qtest/tmp105-test: Trivial test for
 TempSensorClass
Date: Tue, 21 Apr 2020 14:16:26 +0200
Message-Id: <20200421121626.23791-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421121626.23791-1-f4bug@amsat.org>
References: <20200421121626.23791-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bGchqJiIrqEw

The qmp_tmp105_set_temperature() call will trigger
TempSensorClass::set_temperature(), then hmp_info_temperature()
triggers TempSensorClass::get_temperature().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/tmp105-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index f930a96b83..db7e505cbe 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -41,11 +41,26 @@ static void qmp_tmp105_set_temperature(const char *id, int value)
     qobject_unref(response);
 }
 
+static char *hmp_info_temperature(const char *id)
+{
+    QDict *response;
+    char *output;
+
+    response = qmp("{'execute': 'human-monitor-command',"
+                   " 'arguments': {'command-line': 'info temp'}}");
+    g_assert(qdict_haskey(response, "return"));
+    output = g_strdup(qdict_get_try_str(response, "return"));
+    qobject_unref(response);
+
+    return output;
+}
+
 #define TMP105_PRECISION (1000/16)
 static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
 {
     uint16_t value;
     QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    g_autofree char *s = NULL;
 
     value = qmp_tmp105_get_temperature(TMP105_TEST_ID);
     g_assert_cmpuint(value, ==, 0);
@@ -56,6 +71,9 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     qmp_tmp105_set_temperature(TMP105_TEST_ID, 20000);
     value = qmp_tmp105_get_temperature(TMP105_TEST_ID);
     g_assert_cmpuint(value, ==, 20000);
+    /* Test TempSensorClass via 'info temp' */
+    s = hmp_info_temperature(TMP105_TEST_ID);
+    g_assert(strstr(s, "tmp105-0                           20.00"));
 
     value = i2c_get16(i2cdev, TMP105_REG_TEMPERATURE);
     g_assert_cmphex(value, ==, 0x1400);
-- 
2.21.1

