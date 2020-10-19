Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3716812lfa;
        Mon, 19 Oct 2020 02:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT8DmHrJUF+SoYdRWHJNhSqf2hPkMQjb8J5YkpY6l8G5U0EXh24ebFRyTSZN0rtHQucIQk
X-Received: by 2002:a25:16c4:: with SMTP id 187mr20378996ybw.496.1603101182684;
        Mon, 19 Oct 2020 02:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603101182; cv=none;
        d=google.com; s=arc-20160816;
        b=CyBBkZjq2KVHm8SFb4UV+Qc8tYhLnpvT74+Odp1Ha9iu2L5eFeqeC16vgOWrM81JYe
         4OZO5fmRd6RvTzKyuq1L7S/FtpJWnvekyvfNhPuTZodtvYW6b3uWDXjwlrdq12OvLdke
         3SPE5QDgq/qFZTHCS0kg/ffkJRMc+M1jIOa3TX+o5iHDLY2Zjqs15FJz+56xbsOIqhYt
         GkE/uem/LHR/HAiEYusg2n2RbVt99T/dJuSTHBNoZcobvaCPZT4v+XPpNbNY1lHaPei/
         1TrmgC4GJ2QvSqP418HSjink/1C4yojwyiW0ihf2dVjRO4RjtnNtq0mYADisnCsxJP8O
         Yo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=wgZScEWYKTpXPaYbK3zydk54RFmHl/X/t15IeTCJRI8=;
        b=H299GSlohvxWtvvCuiPnvnoS/AnCbpyGKwf/O225YIhdodRPyZhnMo4iwhKqopXARM
         2oYUAJ3wcDuUikv09U49ydvrzjGWwFkTVuNEpvfEQO22CRuHn+0/+mv7REzbu/xuui7R
         YKBspEPNxwASBCt0hr6mkcokuCiSxOzpAwMwaqD74ylCkUn8L8XqIy5zxmML4ue4KAqZ
         qOquC0Rx/bbrsOlXv2kJgkHNOmprSecVJ4MT4w19DST4eHAMaUKpYyMJpOydqy//8D8N
         fgeAvxQ9M1RGXKUaV8OA+AbWbBqQU3uRcqeVRKSkc66lzjIlfk8yLGxnYuLbdI0gpp7p
         IC0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lKtrtm9n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si10601187ybs.48.2020.10.19.02.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 02:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lKtrtm9n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kURqg-0002h8-4C
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 05:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kURpc-0002BV-FS; Mon, 19 Oct 2020 05:51:56 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kURpb-0002lg-0N; Mon, 19 Oct 2020 05:51:56 -0400
Received: by mail-wr1-x443.google.com with SMTP id n15so10670826wrq.2;
 Mon, 19 Oct 2020 02:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wgZScEWYKTpXPaYbK3zydk54RFmHl/X/t15IeTCJRI8=;
 b=lKtrtm9n3lWzzlfifUOD61dnSul5OX0l+d8EiLEpBlUSICBCLBXbtbkDKQvkfsR7YI
 /ML4uNued4yo8sOLM4gqZAJQH67342v+d3NZqsLPE7W9tnvLTzhukxzWF3L4LM75uHF4
 L0Esx8CQF85NBi6lGALa0FSC+OJhsJjia2YJK8M7mK0uut7cQJIlDj/Xn++jf3A6HMsa
 56ld6A2mr48zasF6RnIJ/qjJTT1b6HDNHfCcR5DNaiJkRGbJZ+u2jFhW7tEBZY8XnbOW
 DlBvaQm3YJrDxSc8a+J8n53BohsojY2y96jKOuL3lBdxb3uqjVLETcXFaQLv5FLyh8xt
 //mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wgZScEWYKTpXPaYbK3zydk54RFmHl/X/t15IeTCJRI8=;
 b=erFDkrtcsSDYKCuc5s6TR4BHwwXd3IIXKLMhis4Ea3RxXrN2qfF2VVob8B70jOlkmx
 CtJnbhRsdh4WF3H29UdBn9WFpjeJNsb/ZxvTs5L2Ogc8osefcQUiekFq1XhXJTq5axIJ
 Al/gWvYN1T4Rxz28JM5KhaZW5Z5vkRrpwZw+FjKci5mhlXBK2VSpXOlVMA2xRGDCNIbA
 6mWegUFAoZ4wZls9MYUOA4t7wV2Q7qNkRVEcF0uymCg66d94JJqcGOkJ0DSIIUXzd1rR
 vE3RlXO0AIjmL9nFaouyb1aIkVUiiKytK/Xb+g39f9vUkGVU3BjyVqYlUOTtNkGnrYWj
 fzxA==
X-Gm-Message-State: AOAM530mRD1kPQqVW9dJEBrgnj0LA6CxQISzB251wu8a7VtXnKZrdsJp
 yoy+kaLuQi52CHjxz6Hp4fsJqn7Gqog=
X-Received: by 2002:adf:e54b:: with SMTP id z11mr19803289wrm.128.1603101110100; 
 Mon, 19 Oct 2020 02:51:50 -0700 (PDT)
Received: from x1w.redhat.com (36.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.36])
 by smtp.gmail.com with ESMTPSA id t19sm16560535wmi.26.2020.10.19.02.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 02:51:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/nseries: Fix loading kernel image on n8x0 machines
Date: Mon, 19 Oct 2020 11:51:48 +0200
Message-Id: <20201019095148.1602119-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8k1eYn2vz4IR

Commit 7998beb9c2e removed the ram_size initialization in the
arm_boot_info structure, however it is used by arm_load_kernel().

Initialize the field to fix:

  $ qemu-system-arm -M n800 -append 'console=ttyS1' \
    -kernel meego-arm-n8x0-1.0.80.20100712.1431-vmlinuz-2.6.35~rc4-129.1-n8x0
  qemu-system-arm: kernel 'meego-arm-n8x0-1.0.80.20100712.1431-vmlinuz-2.6.35~rc4-129.1-n8x0' is too large to fit in RAM (kernel size 1964608, RAM size 0)

Noticed while running the test introduced in commit 050a82f0c5b
("tests/acceptance: Add a test for the N800 and N810 arm machines").

Fixes: 7998beb9c2e ("arm/nseries: use memdev for RAM")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/nseries.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index e48092ca047..76fd7fe9854 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1318,6 +1318,7 @@ static void n8x0_init(MachineState *machine,
         g_free(sz);
         exit(EXIT_FAILURE);
     }
+    binfo->ram_size = machine->ram_size;
 
     memory_region_add_subregion(get_system_memory(), OMAP2_Q2_BASE,
                                 machine->ram);
-- 
2.26.2

