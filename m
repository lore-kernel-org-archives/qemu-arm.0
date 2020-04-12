Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3153259lfm;
        Sun, 12 Apr 2020 16:03:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypIwoVtYJHKhMXkhMu0/6OAroc5YWBbGqY5ElCiXz1bs6pAeaZB6YSSNpvB/GZYUaitR+D1r
X-Received: by 2002:ac8:7246:: with SMTP id l6mr8973673qtp.298.1586732580571;
        Sun, 12 Apr 2020 16:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732580; cv=none;
        d=google.com; s=arc-20160816;
        b=GZK4EqKYERepjQ/gEywoMgC7GpGRfKXfcYZSeVsTW+zdAQbOKBg7j8DOlHYjW/BSTt
         pRCa/ucbJYnMCmLgfj5RG6+U0aJqbw1veE7uoTylWRDGF4nNek/EtAbDauEcEo3PpOGP
         TTyLQB2yhAxvWwK0W+FFNeiCEuHmySFqmcMKhzQvcqndvPO01eS5XOVh3+fh4ii86oe5
         DKbXTvkgqsYTvPJSxz1qyYJt7Jd22M+twmKDwbvOMB1ScKYINFrofAZ0Opwudlzlz9Fi
         IXVOiMRIpPi39b9LENuVoEdm/QCb8B71aVQSUfbkJadT6UoFXUgn4J+jT+Heq9pimn4E
         WcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Er1m8ZT5D0yuOThtBE21KXgphcgOWZp5CA+pNN6Nq54=;
        b=DhpoZ7OJbXk7zz6CAoV1ImQnZUNStAXJNVIG+2VfoyBasV+sOUXaPX0pQtwYTaS8P3
         y8RjRpwB2FoivHnQBRwDiPPma4Xw8mghcwFlvt/dKRsqZfRpos9NL4hKtz5C/XI/yz0M
         JrxzdjAHWxJIUeXwf//ctoN/yhmRX/r4ZWm7+Ml4vF639N5ScwL7i3JfmhL9SJVDOIUH
         GDOgss2RghHu5XTxHi8/J/ceU1NQy+H2a9Rf85Fic1u23Jb5OiYqIXpKbMzMb6E/sLK3
         bKVIcNI5gMPVgxyx4iu55eV4bdmu8sI4iuhH8ZL6oxMmU7otXM2R1WlCbn8QKKqjcWhm
         +l3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Q/QpzHGY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i46si1480116qte.388.2020.04.12.16.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 16:03:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Q/QpzHGY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlcx-0007an-VM
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 19:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJZ-0002F6-JX
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJY-0006Kk-Jr
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:57 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJY-0006KJ-Ds; Sun, 12 Apr 2020 18:42:56 -0400
Received: by mail-wm1-x343.google.com with SMTP id r26so8426973wmh.0;
 Sun, 12 Apr 2020 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Er1m8ZT5D0yuOThtBE21KXgphcgOWZp5CA+pNN6Nq54=;
 b=Q/QpzHGYYeJh0GHGJydDYIzh6+3MTb8kq0jigm8qpafh6yu/Qc4R6Mt9ctMb22UNeA
 AlG76RShitrt1Kpk93ALb+rykdzvCLIwH+ZVzdG9z0jvMpU8+QLqxkGS98CShtbZceIl
 qROd838/+PrKbMFbcN/yAzt0BLnfd6WUHty+lEdLYh0wNK4UxMwP4afprd4gqZS2RaQg
 x0QQyZyQjkBfQycR30Kj8clyY2Adxy77jig48nxXFzQgYmz4Vv6L9FCuRjzVcI4KLz2T
 NxQNXtweW84xzSPgsRRhcfLbmuAF3UTsBBa1eKp4ngYZxa9ynRKtlO/g/aFcQKLbkG4e
 csnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Er1m8ZT5D0yuOThtBE21KXgphcgOWZp5CA+pNN6Nq54=;
 b=DsPrfj6HZyEf5sVmkh030QiBJtWh34URJ9bWFrCtZ6jQQ5JUoOUkGF0JScFcLX2vHL
 tm5LYvKZXsknHNNv8yUhGela1SDywdy9TcECMHmTaH6qanyDfInKwEjB7MSAubbk22ow
 uiHPKbilaGo3E6ABtmkcNrCn25BrNcjPsYohYp60wfq+TkSdU7RyQbCwbt29W5dasaa4
 nVIfdeMv/bWkWDKGpzso8WQBBfKDP/VUCISRavQ1l0zj7//gQH3WucXoRWt6gGH/+Ote
 OI/4L7UJjktVR84daYKJSDnofHV7pIpE9XPh982wbGhZ7pfiUgTB8HPcL1YxEXhljj2x
 qhlQ==
X-Gm-Message-State: AGi0PuYfRTHkVvHqOEzQxSigoIoaOX/IWGzW2CKa521bKk/Zd5CI6CdB
 M+xLFmd62ZdLJ4e7k05OL0+lCIs9rFIVOg==
X-Received: by 2002:a1c:2e91:: with SMTP id u139mr124653wmu.18.1586731375230; 
 Sun, 12 Apr 2020 15:42:55 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 18/23] hw/i386/x86: Add missing error-propagation
 code
Date: Mon, 13 Apr 2020 00:41:39 +0200
Message-Id: <20200412224144.12205-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AFlNyrr5sXr6

Running the coccinelle script:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/add-missing-error_propagate.cocci \
    --keep-comments --smpl-spacing --dir hw

inserted a block after object_property_set_uint("apic-id") which
calls error_propagate() and return.
Thanksfully code review noticed returning here would skip the
'object_unref(cpu)' call.
Manually fix the error propagation code by adding a label to the
existing call.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/x86.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b82770024c..ec807ce94f 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -124,8 +124,12 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
     cpu = object_new(MACHINE(x86ms)->cpu_type);
 
     object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
+    if (local_err) {
+        goto out;
+    }
     object_property_set_bool(cpu, true, "realized", &local_err);
 
+out:
     object_unref(cpu);
     error_propagate(errp, local_err);
 }
-- 
2.21.1

