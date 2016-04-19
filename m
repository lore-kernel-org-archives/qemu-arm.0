Received: by 10.25.208.194 with SMTP id h185csp1930608lfg;
        Tue, 19 Apr 2016 06:40:58 -0700 (PDT)
X-Received: by 10.194.175.168 with SMTP id cb8mr3309134wjc.56.1461073232740;
        Tue, 19 Apr 2016 06:40:32 -0700 (PDT)
Return-Path: <mttcg-owner@listserver.greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id pz4si344200wjb.78.2016.04.19.06.40.32;
        Tue, 19 Apr 2016 06:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@virtualopensystems-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=mttcg-owner@listserver.greensocs.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5C700251283;
	Tue, 19 Apr 2016 15:40:32 +0200 (CEST)
Authentication-Results: greensocs.com;
	dkim=pass (2048-bit key) header.d=virtualopensystems-com.20150623.gappssmtp.com header.i=@virtualopensystems-com.20150623.gappssmtp.com header.b=1kR1ETuc
X-Virus-Scanned: amavisd-new at greensocs.com
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
X-Spam-Status: No, score=-1.898 tagged_above=-999 required=6.2
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, HK_RANDOM_ENVFROM=0.001]
	autolearn=no autolearn_force=no
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (2048-bit key)
	header.d=virtualopensystems-com.20150623.gappssmtp.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9K7GVr6pwogU; Tue, 19 Apr 2016 15:40:31 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 123)
	id BEF132C004E; Tue, 19 Apr 2016 15:40:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4D45D164D94
	for <mttcg@listserver.greensocs.com>; Tue, 19 Apr 2016 15:40:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aR1ZC73BebeV for <mttcg@listserver.greensocs.com>;
	Tue, 19 Apr 2016 15:40:09 +0200 (CEST)
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by greensocs.com (Postfix) with ESMTPS id 95093251283
	for <mttcg@listserver.greensocs.com>; Tue, 19 Apr 2016 15:39:56 +0200 (CEST)
Received: by mail-wm0-f68.google.com with SMTP id l6so5279493wml.3
        for <mttcg@listserver.greensocs.com>; Tue, 19 Apr 2016 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=virtualopensystems-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OxxmWpeMi9s1caWvBFSrRNDixa2JiEMb4LjTkbvBvN4=;
        b=1kR1ETucIGV15Qx9PnYnvdjCVj1UMkEJRl3D+0a4guQS40SAEY0X/DdEQImjUJVIiZ
         p93yK2A7KCdtddrBXUelVbw0TDo8bNzTfikG/efIcZfPstXEAdAyQeYL7NcwJZEr77eg
         itum425TeGxs3MECnHqhAlHnzF0eJ0I6h66X8//DEOGV9AfZyaDTH0uqAxyivJ3zEOyB
         8ql69/9nyZhaU5eLTbUrbxwGjOZ/eyPcU6Y7NaslyGNL6Ki2jCwsBiUQxNDV3g73f6jZ
         uYkz08ne2LVIz9pY3ZnCQQ9D6qjZiVkTgANwmfXq70DHZcSaWwY24C+e05aFaCEreDe7
         4V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OxxmWpeMi9s1caWvBFSrRNDixa2JiEMb4LjTkbvBvN4=;
        b=LwfC002sIueXRcrQvzU8wF5RxVxqprslyuW9aUwQzPTsebpFiYwYs2nsZxVCEyWDZu
         U60GlewCW1wEa2yr0YUAEUX/2wvv4jbTZP29tm+SI81cqT3T72iwwazk5XQwOuQxkuOL
         1a0yKXeST7MwQ1BziUDHzhfDq//lQlIAJEL3gN3f3qxRIz2m5jLoJl7fFFkI+1kPgjPz
         g7k/49E+hZ6NySPARHoHYhpgFKlMgujcqTbDRolzmbV9PhF6za3I/aihVF8fYWH9n/Gg
         sgFTYqrFfFAkMPX5HuJVzfEYTOblZyiSE1jIMKzt3XMq8eH18lbFCUerqUaSPrQqyhAT
         OOvg==
X-Gm-Message-State: AOPr4FVi6CJvlmtzJ9so8NkJhIQDa9CTmAO0pIUU+HoTUmNtirH8Ely6Qtzz5Vzn4xMe0w==
X-Received: by 10.28.220.213 with SMTP id t204mr4047554wmg.42.1461073196184;
        Tue, 19 Apr 2016 06:39:56 -0700 (PDT)
Received: from localhost.localdomain (LPuteaux-656-1-278-113.w80-15.abo.wanadoo.fr. [80.15.154.113])
        by smtp.googlemail.com with ESMTPSA id c85sm2789756wmd.0.2016.04.19.06.39.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 19 Apr 2016 06:39:55 -0700 (PDT)
From: Alvise Rigo <a.rigo@virtualopensystems.com>
To: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com
Cc: jani.kokkonen@huawei.com,
	claudio.fontana@huawei.com,
	tech@virtualopensystems.com,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	rth@twiddle.net,
	serge.fdrv@gmail.com,
	Alvise Rigo <a.rigo@virtualopensystems.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [Qemu-devel] [RFC v8 13/14] target-arm: cpu64: use custom set_excl hook
Date: Tue, 19 Apr 2016 15:39:30 +0200
Message-Id: <1461073171-22953-14-git-send-email-a.rigo@virtualopensystems.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1461073171-22953-1-git-send-email-a.rigo@virtualopensystems.com>
References: <1461073171-22953-1-git-send-email-a.rigo@virtualopensystems.com>
Reply-To: Alvise Rigo <a.rigo@virtualopensystems.com>
X-Loop: mttcg@listserver.greensocs.com
X-Sequence: 205
Errors-to: mttcg-owner@listserver.greensocs.com
Precedence: list
Precedence: bulk
Sender: mttcg-request@listserver.greensocs.com
X-no-archive: yes
List-Id: <mttcg.listserver.greensocs.com>
List-Help: <mailto:sympa@listserver.greensocs.com?subject=help>
List-Subscribe: <mailto:sympa@listserver.greensocs.com?subject=subscribe%20mttcg>
List-Unsubscribe: <mailto:sympa@listserver.greensocs.com?subject=unsubscribe%20mttcg>
List-Post: <mailto:mttcg@listserver.greensocs.com>
List-Owner: <mailto:mttcg-request@listserver.greensocs.com>
List-Archive: <http://listserver.greensocs.com/wws/arc/mttcg>
X-TUID: 0pBk29aZvKxK

In aarch64 the LDXP/STXP instructions allow to perform up to 128 bits
exclusive accesses. However, due to a softmmu limitation, such wide
accesses are not allowed.

To workaround this limitation, we need to support LoadLink instructions
that cover at least 128 consecutive bits (see the next patch for more
details).

Suggested-by: Jani Kokkonen <jani.kokkonen@huawei.com>
Suggested-by: Claudio Fontana <claudio.fontana@huawei.com>
Signed-off-by: Alvise Rigo <a.rigo@virtualopensystems.com>
---
 target-arm/cpu64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
index cc177bb..1d45e66 100644
--- a/target-arm/cpu64.c
+++ b/target-arm/cpu64.c
@@ -287,6 +287,13 @@ static void aarch64_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
+static void aarch64_set_excl_range(CPUState *cpu, hwaddr addr, hwaddr size)
+{
+    cpu->excl_protected_range.begin = addr;
+    /* At least cover 128 bits for a STXP access (two paired doublewords case)*/
+    cpu->excl_protected_range.end = addr + 16;
+}
+
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
@@ -297,6 +304,7 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
+    cc->cpu_set_excl_protected_range = aarch64_set_excl_range;
 }
 
 static void aarch64_cpu_register(const ARMCPUInfo *info)
-- 
2.8.0
