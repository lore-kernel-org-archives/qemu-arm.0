Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2400569lfc;
        Sun, 31 May 2020 10:44:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdaZomEjPKFsAI3lXvKe002bDMxFcV2nxrtW1/VD5EWIcwjlUSzKdFMwpHrijFWxQSqzlX
X-Received: by 2002:a25:683:: with SMTP id 125mr27710859ybg.80.1590947071737;
        Sun, 31 May 2020 10:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590947071; cv=none;
        d=google.com; s=arc-20160816;
        b=wj+qTGcRcL+FCzgjDEt9CAmU/Qo3wwuJJLZYb+NqontjrQu0oUSf0dxwCM/BLjtSEF
         HJFh9Wsrm5j7Ef2zdoduVrK8V94hUbIWGsREpG9YiuqgNQQxZpB4h/Ovbn8x+3NWydeS
         pSrVbfuyV8m4Zj3+HrpGMnZg5507wGLPi7aTI/aY9J+2XBqy/Jv6go/MO+dvCr50/pAu
         HzMOxVNXyNpV5+BgtAEsYx27TgNT3oDmmB/Emf8oX0F5fjcMGjE67PGWaULB3eEXLaFA
         XcIT5hAa7e9krq0t2JMrfEjVeqzwwpgKBSlXnwV8nn6l1h6HUtoW46mo8nVkASTUp2bq
         CAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jnJt4nNSB0E2pLIKum3vjItQrLzo5DO2iXhJKs1nBc8=;
        b=mfGuBW8rmrTeEGB1nSbksQwm45h0+ydxrPBVoOgOXQO7skFwmytymUWF4r6FlGrdJs
         wl43WPFgaW7KJ7QiY21k2acu+NgsrcyL9Iz6ciFmewgxblDjq/A4j/Q7Tx8qn2jgmX1S
         El/5Ds+n4r91Ya/QcH5ViePd/KGdRPjwBVj3w0GOvsItPISBsenbwuafzFPA8XmZGkox
         2zAKyE9DeevJNoC8UV7Vn4Vu0i62p/Hji9spWHjyTYnwyp+EuI12yIzfraQJ1JLPuvl3
         b0Q6SEp7GEyaMb/gRXke9YHBVFkkxcg9TJAkbalsPJOYEB4yhWqf2IVRZ+Y4dBHE4wIt
         JOhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kPgx3uRg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e205si13165248yba.419.2020.05.31.10.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 10:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kPgx3uRg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfS0c-0005B8-Sk
	for alex.bennee@linaro.org; Sun, 31 May 2020 13:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRus-0004F3-6L; Sun, 31 May 2020 13:38:34 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRuq-0004Gq-0D; Sun, 31 May 2020 13:38:33 -0400
Received: by mail-wm1-x342.google.com with SMTP id v19so8627245wmj.0;
 Sun, 31 May 2020 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnJt4nNSB0E2pLIKum3vjItQrLzo5DO2iXhJKs1nBc8=;
 b=kPgx3uRgc7TXjjpq1UvXYDhszlo8l3sRGueug/C8vRhLjgvZQ5Mieac9b318WBFJ2/
 aeYe32r9/P1YQ0T5IBGEZZ7DL+Wy3+63lPgyyyIx0+YmMwTp5IOUGd2IT1wgrMl/x1tR
 KJz6LeuNQroYjMDQHIcgiF8BdxJylz7XpfRhndCHWb8t1o//QCW5SH5/lCsvTvNfTjTe
 II8tGrhBafOYy7pR3oJLWiTvPSFZijdqdapNq7SavzV2LWsL6fiHgv7zZkvxDTXFVwkn
 nhmlNB2/Qmcnalw8/VjytMqmdx2T42K5JNc3hbG2/fcaGN2tjOK+OXLUHm3TmUzbuQVt
 aGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jnJt4nNSB0E2pLIKum3vjItQrLzo5DO2iXhJKs1nBc8=;
 b=TYNByybJ1CAG82yeJhlodW38/5zSPHyFCRkn3DcHpb7WB875ZMHwk15IK2OAqv3Giq
 4cm2Z9pU17TeG7wi+nn2BSybywhHTJJHxfE3S/h+xtqwki1myemnWufjgPvRrfueVzJm
 6sMC8tVE7/lumjStdzuLPM/F9OTc2qjSHI8mPiuatXvktSICtPfIus/sX4NQmd0A+SYY
 X9gPMNDU5PUuze9MO6e4Z9XR1C91nDvE75FZm86wNWK28yevXrA1/2HHDrPjg35cVhVG
 wmaFr4rUncs/iSxLQnxFzXWiXehtol1JDz6+V22++1Hf3L7GBTtWa1ljwhRdVbiy4Fj2
 X5sQ==
X-Gm-Message-State: AOAM5304AZPmvxaNhREyiGYY1y+44Cg7yNop0jcCeF+tP5CqN0wKXci5
 Pqay4cdoSLkeKk9Jmkw0VCNrJdhb
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr17828736wma.101.1590946709508; 
 Sun, 31 May 2020 10:38:29 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/i386/cpu: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:14 +0200
Message-Id: <20200531173814.8734-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wITZWrgzpwJR

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3733d9a279..33ce4861fb 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6159,7 +6159,7 @@ static void x86_cpu_machine_done(Notifier *n, void *unused)
     if (smram) {
         cpu->smram = g_new(MemoryRegion, 1);
         memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
-                                 smram, 0, 1ull << 32);
+                                 smram, 0, 4 * GiB);
         memory_region_set_enabled(cpu->smram, true);
         memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->smram, 1);
     }
-- 
2.21.3

