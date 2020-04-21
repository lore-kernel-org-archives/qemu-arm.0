Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5027614lfm;
        Tue, 21 Apr 2020 05:19:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypLUiY1qYWkfFJP36U23m4qi7pZ889fJNzt0yTwH2uQfB5JJiQ+WL9Nnnm2up8WFWFxrFizX
X-Received: by 2002:a05:620a:22a4:: with SMTP id p4mr7281227qkh.459.1587471559913;
        Tue, 21 Apr 2020 05:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587471559; cv=none;
        d=google.com; s=arc-20160816;
        b=x/P16EkRkAxBQd3P8JElk4DqQ6EbIgPIlbbUoGw679RYq5ZD7WGl+3qqM0+zyAkLvl
         kRleraCfS//KL/WqMdTDSU7GSurTTs375kSxlMAyNYbq0EZEUnvX24uTFUPYlmy2b108
         8nkDp0cioggKNLsHtQRqnsf54UrUMJgBEvbmiKzve5cldf8VJn1KfQqgz3UHw19xH3SA
         mi/nzDk9YLhTqTQUZJi3cBAiJ4EoIm+Bjo/fTjVKxUreQ169qKOOQmhFWqEAhKz/prDM
         K01NUtsiswKS/4bKZlCH1mXojAUzQFWPpkcGsQgeu2sfPs7WeiC2mTN4Ax/csCQ1dpi6
         CgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9frTWORwoZW0igeAZ1RXaslrznC6xIFQopqjx+iyoJ4=;
        b=oTvshTeTMTbgFu2+AHRA31DxX7CELGn1szJ2nm4+QRmIMsuM4MnJtsjEKzVj0E6W+J
         uy9gLUQ0uxcdE+qGafOzqYk4GcvZhrUOzMyQL0KDjBgwn+bMuonI5DExYrmejH2OMLEa
         9L5/yYUGkFKRch8fgNFOr2JbR61bC+ASko9imfImlOEuPQnKtWe1aEO8LNbkktkKRtfb
         xctq5txktgaGQloRo5QgfqClj7m8O5HZcoY3Cv+nhdpcCUVMpd8+oGYT8pQRaDu0Xyn5
         kaDidvW4rSEkkXTWBJNujWF1s/SSrmfSfggnV+pRsww92i+8o0mfVenIFL/5iWbwRqeR
         JBNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Jy8aISSO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b47si1382078qtc.75.2020.04.21.05.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 05:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Jy8aISSO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQrrz-0008Em-87
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 08:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpV-0005AK-DF
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 08:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpU-0006DL-UL
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 08:16:45 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpU-0006B5-HG; Tue, 21 Apr 2020 08:16:44 -0400
Received: by mail-wr1-x441.google.com with SMTP id b11so16192155wrs.6;
 Tue, 21 Apr 2020 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9frTWORwoZW0igeAZ1RXaslrznC6xIFQopqjx+iyoJ4=;
 b=Jy8aISSO9mAH6DEX7PgZAbbFPpnz8qQOpSBTdbT0Zo4AAEBL+o5p4GUNMtweMYSaGh
 ikB2eMudeWP5n3oviEJ5lFEAVCRJCer+b1VklP7SmLoxCaRps3SiiyYBQRnX1j/DkJg/
 DtbTqX6X/m9qLCs+viF0KkIkOhHR6S1Oj45L6oE8sAXrpaiClUJeka0rouKofKRJBEo8
 CUkFCMtabI1vm4gHllXIxWIzly0Mmr2qZZqFeIaUABKWBdS034Mi2CCMD0Yf+fQ+AKp4
 Fbn0wJYvrK9VEXOvArmlraxbPs8jXBJ3HIOveVsmUB8RhM/MqF+uGoBEPOQljJWwY70a
 e2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9frTWORwoZW0igeAZ1RXaslrznC6xIFQopqjx+iyoJ4=;
 b=cDYsiLFg+HRVP/0G/NRztQ0bcWw7LH6Y+mcGM/EG9hlBJgG/YHxUVTUiAg/PDtq0mk
 KgQEiNAxBT5FxgENTlEnZ+hrm/7y5RJeRoKHzR3+2rYIHd6VrlKXFgE8LAEncV5v1m/k
 pOqXc3qySmLDk7+462OJ19tXMF/5WcFkTqwUDxaxAWxZkpONtJxX2OyhyQQ/EmRdNTiF
 InIM4hIZnXELiLrDGuJpUndA3yIOrSItKOGYkLd9R44r97E8mi8fwEFm9jVsZhYlKx8T
 ilegiHap76l3nTploXIGQusYiw3HAcWptBH0OaS1tZdsB++PUyJ15A04rneTYU/kOE13
 gzVg==
X-Gm-Message-State: AGi0PuZQ8TpnmDwiMxS/jKqQS3ig495mBFyWTO8P8gx2ZdesXJLIURrr
 yex3q3PvVeCLReiGJTqpb06wVivTJZQ=
X-Received: by 2002:a5d:5224:: with SMTP id i4mr23837459wra.1.1587471402031;
 Tue, 21 Apr 2020 05:16:42 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id z76sm3761140wmc.9.2020.04.21.05.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:16:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/17] hw/misc/tmp421: Extract get_temp_mC() helper
Date: Tue, 21 Apr 2020 14:16:16 +0200
Message-Id: <20200421121626.23791-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421121626.23791-1-f4bug@amsat.org>
References: <20200421121626.23791-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::441
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
X-TUID: hC6kVijk0B3U

Since we are going to reuse this code, extract it first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/tmp421.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index 04c3b3ca6e..8003356307 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -112,12 +112,19 @@ typedef struct TMP421Class {
 static const int32_t mins[2] = { -40000, -55000 };
 static const int32_t maxs[2] = { 127000, 150000 };
 
+static int64_t get_temp_mC(TMP421State *s, unsigned int id)
+{
+    bool ext_range = (s->config[0] & TMP421_CONFIG_RANGE);
+    int offset = ext_range * 64 * 256;
+
+    assert(id < SENSORS_COUNT);
+
+    return ((s->temperature[id] - offset) * 1000 + 128) / 256;
+}
+
 static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    TMP421State *s = TMP421(obj);
-    bool ext_range = (s->config[0] & TMP421_CONFIG_RANGE);
-    int offset = ext_range * 64 * 256;
     int64_t value;
     int tempid;
 
@@ -131,7 +138,7 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    value = ((s->temperature[tempid] - offset) * 1000 + 128) / 256;
+    value = get_temp_mC(TMP421(obj), tempid);
 
     visit_type_int(v, name, &value, errp);
 }
-- 
2.21.1

