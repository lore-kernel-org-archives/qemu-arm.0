Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3666715lfp;
        Mon, 3 Feb 2020 00:28:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqyh7kFf1Q4rWkgl4Nmt1NtC9oHB9ouMhJC/C0g6OcDVcAUFHv65i8X+lnFjUC20GZFHZTaC
X-Received: by 2002:ae9:efc5:: with SMTP id d188mr22728987qkg.178.1580718524054;
        Mon, 03 Feb 2020 00:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580718524; cv=none;
        d=google.com; s=arc-20160816;
        b=qF2bR81jZnpbtPglOiGKfP4uCllKSyqwzYIjMf37sYK7/fEbC92vjvpuq50uMVirUn
         +pqfMRe+lKaVo6sgZnmviLmIX86x9CN54cWUFS6BMPct7ijYSUapTKyEdX8h5jaP+CeM
         Qs6urR9P5/nZHik0zAYgo1fEZAo/FR5cbEGKffnHAFcryedc40yYlj9HOLwELco+0iYW
         tQuJiZdKXh2Xq8Odwi/EAmWu9avswJr0SPttK33mRQ1QcUiVvOQ9Yr/bHzvK4P/4RDX3
         ydXgOu2fze8HUYJHAAgBIHjnk+KazPqFJHktdqmVWY6OJDaTWNBskB1UxjTp48TTG0AL
         rUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EpUTRq0kxtJ0Er2jTMdb5IFTVrAUR3PzkNabxGsF4V8=;
        b=VgTaXRSvt8Z9cRNRfFcO1UWGjxqKq7nCHWYYbvb8RpGGUUPomgSw4rvNl1JSQxnxnt
         yZdsgTJEbkVSx8hbLbtecALJM7Ec5vbVqwaN98Z7WRwOBFI10m3hfXK/HQOA38r7Ur31
         XsYa2sJFQ4v6wbWTWYVQ/UTBba7VfMs8cmR/Fb9tae8EbQOdMaNmP7wtLdL8W20xQIBX
         +J6Bgfl7LKe6wBZxX9d9us86+0leHW118SGI/8Tmwwjbo5SoZ0ozP37kGsC1Uxy1B+cV
         buvJPhDigyno/PQWFOWNd1eybt3J2iGS99yAp73BOKaoruupzAVBTK0AqyvZkq3Y0pJ0
         rPAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fywPq+Yh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x36si11604485qtj.402.2020.02.03.00.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 00:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fywPq+Yh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36041 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyX63-0005T3-Fd
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 03:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3u-0002DO-QS
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:26:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3t-00011l-1j
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:26:30 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55913)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3s-00011F-Rs; Mon, 03 Feb 2020 03:26:28 -0500
Received: by mail-wm1-x342.google.com with SMTP id q9so14722384wmj.5;
 Mon, 03 Feb 2020 00:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EpUTRq0kxtJ0Er2jTMdb5IFTVrAUR3PzkNabxGsF4V8=;
 b=fywPq+YhIU+m28yFYLG6vh+ESwLEVWNCo/gl2Px9g0Q4TZgCJWnV0kmQVeXAOr1YCg
 OxjQWaDmn59Ktu19BxXfsCgaMZme9hgS1ECZkle7ZyvbdFgdt+T733EWMznrleXHUzJp
 8M9bwZJNoAh1eiec5eREX3kMryrB/4WkrKhm/DNx6G1H3UGspky0jOvdXxOiKHiCEuNK
 QoauoNjYKzZb1I+s6XEIwAGlk4w/1KWpTpdUFBIGbE6I0gzIGC0hNAEfdc9sGkW1zUS9
 6M/60oYaoth0V49RiZX/EZmQ0YeBkTESe+F0qtiK6LfxmbYVsp1VEANdFspNCUjww0AH
 gbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EpUTRq0kxtJ0Er2jTMdb5IFTVrAUR3PzkNabxGsF4V8=;
 b=KzQ5lyEBnWT4lEQ1PRfpEf2z5vXcmlcAWkIorsuCoEjqrdPus76snAQwVaOBipj2Eg
 cgHyanRvGdB7DQ7+ZbPWXzpt/ebmlQxc7dnryFT3hiJo72K8Dx9bpiKCPmPA+zwM+al6
 nJ97tr3yDhTTySxLKH6bjJv+HjBSxG/p93oR5gUn9OxPDjs5zGU0H7q3FX5rsyC7s7rI
 H4FxhQWkf9YfvUO9jZyDjmt4BQ7ZQCYElylcQmAk21C6HMxjCv1xJJ/mJw8CjL+pT/9z
 1tT9/0zC5rUS8+rRWejwrPeY2uKVYGG19ay0IJiCGqiUOD6mfZbMSGwtNuMdIuoPgkYx
 O8Gw==
X-Gm-Message-State: APjAAAVJOwMWFpjMNuEJufZ8+P7FHdv8aWKtVFQGEucuSqE7eN5MGFpS
 dP1eCiNPv17ZVb05uj+1o/40ryii
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr28804653wme.26.1580718386542; 
 Mon, 03 Feb 2020 00:26:26 -0800 (PST)
Received: from localhost.localdomain (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id w20sm22396778wmk.34.2020.02.03.00.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:26:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/arm/raspi: Get the SoC type name from the revision code
Date: Mon,  3 Feb 2020 09:26:16 +0100
Message-Id: <20200203082619.7426-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200203082619.7426-1-f4bug@amsat.org>
References: <20200203082619.7426-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 04ShpsDgBkZe

We already know the Chip ID, let's name it with the
board_soc_name() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index eaa8c49009..f5e54fe876 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -31,6 +31,18 @@
 
 #define MACH_TYPE_BCM2708   3138 /* Linux board IDs */
 
+enum BoardIdChip {
+    C_BCM2836 = 1,
+    C_BCM2837 = 2,
+};
+
+static const struct {
+    const char *soc_name;
+} soc_config[] = {
+    [C_BCM2836] = {TYPE_BCM2836},
+    [C_BCM2837] = {TYPE_BCM2837},
+};
+
 typedef struct RasPiState {
     BCM283XState soc;
     MemoryRegion ram;
@@ -69,6 +81,11 @@ static int board_version(const RaspiBoardInfo *config)
     return board_chip_id(config) + 1;
 }
 
+static const char *board_soc_name(const RaspiBoardInfo *config)
+{
+    return soc_config[board_chip_id(config)].soc_name;
+}
+
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const uint32_t smpboot[] = {
@@ -213,8 +230,7 @@ static void raspi_init(MachineState *machine, const RaspiBoardInfo *config)
     }
 
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            version == 3 ? TYPE_BCM2837 : TYPE_BCM2836,
-                            &error_abort, NULL);
+                            board_soc_name(config), &error_abort, NULL);
 
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
-- 
2.21.1

