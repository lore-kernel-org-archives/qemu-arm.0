Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538442lfg;
        Tue, 2 Mar 2021 06:58:58 -0800 (PST)
X-Received: by 2002:a05:6402:1a3c:: with SMTP id be28mr20366377edb.125.1614697138687;
        Tue, 02 Mar 2021 06:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697138; cv=none;
        d=google.com; s=arc-20160816;
        b=B3QcTfQso4F9Q+aYuRXfPPqgqWCvBX2pUEU3+ewNP5nyV7yOZ8YtoXGQv1kv7f1rSr
         6RCUOwEQzixxI4cjj8ZEaxrAHe/cHtQdFrh+f7b4H7Il3iHvlXg5yMRJr87GYOkTGt+o
         6/KO39YcG1dqK4iTFiPXI+udAxIu9g9GahKI7ZOe/Qu9XAaERN5E0Nzn7+JF0GpXnEap
         R+1j17HDJXGSXVAtiWqE7KQSLbnnPfumYefyCev6z7ueCPTytyZes0WuOTBk/k8jZE/k
         16LeevjWF/8ir9s/bdYWd663z2SMBCNCKDaZzPSU0faCV0ChhnFltu/1vkh2Ctu9AhxU
         wB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
        b=vUydHojC6mARDS7h/qgbpWcI4sudpXOBAZx846LqUn7H/KesWR3sM58OIgKrl6F9gq
         trjiUUxnmsfFqLT8dZUP5kr3KlXDo7D/lptzDgSG5IgvJ7vpVef27r6Lk5kNuBI0xl4y
         IFzF0O/TLmP/MAx5HdX1uPRL+7zsXlR5BQHD4+Ql/HYePxH1WRGQaFNhCWMq19mpS1uj
         COG6g29Qh9G5GMlNgZ5bQ4UCEuLBBrLQo/0tX5wolKwTjkMMc47/yx7mar2mJKZZWeg1
         0MV7LgKZSJd58IFc8b2jGAKIs/hxHwl/Lv7TVJWO2mVolRRe7T8ZaT/XXilNIy6UWOLs
         aOcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFXJEhvp;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id du20sor11943875ejc.15.2021.03.02.06.58.58
        (Google Transport Security);
        Tue, 02 Mar 2021 06:58:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFXJEhvp;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
        b=UFXJEhvpwGNnwZ3cATGGDjHqwcfQaVRLe18I2nu0tPyGoewRcB0DhJwjdZtHpsGG2f
         qukKK/Fidd8BgXzTTV/1zoQMvy3qn3M5SIC92NcJ94CYw0jVfUDq3YiXsZcbnyy3uuQ8
         qWMb3o6la6aSMmSr8agE7UcYvDSzJZ6iGiTTY79TElyryVCo07hTj2Iar0/6C5Yr1+uV
         Cgg0Iry4NAnb6c5XKpWY6TQ6M9Cm43ZngXNOJaIp3m9mfHJV8kL/8LItLTSkrCSqmMwG
         Ua8ZH2NJrSWrlSCkOkY+Un7HJUn6KpgVa6cAFT0A/vHoLuEW61XDjimiP3oFsmKhB+sU
         DMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
        b=rWHqGAEM59k4uw8clk6ssk9MMRfzYa1en/FdOJmXdx1vsxHm6vtAAH0RE2g0XbiXVh
         ehNuTcb0MDSlJ4dHQgLWdA0PkHyHLqMNtIsuetWRvU2W6EFOKkI9GUT7mi2oQuyJEX/8
         pf8SNTPuEOuxX0E9LaOqBk5cs2ITQmI/nng2ObHiBPIKMkphCFVeaG4hi8ocUdCmfKB4
         vMCQqC3bb5K6iKLLbpC8tWTE0uIn1CgSqNujDJquTWsM7XT3gTYJvzowZyD21gQWSy0X
         GK25XMTPqmrZqTVzzyK+bkKVKz+/sl9QdsjpMufu7LDhGNW0R70kL+RMPvPHD7+v9e2T
         lrmw==
X-Gm-Message-State: AOAM532tLD0djyV13kQ2xqXbXWQTxcMl9HktSoAR0V4VH8eshnhTUFh7
	TvfA841AtM1HHsEZbq89GZY=
X-Google-Smtp-Source: ABdhPJyhz1UbNmCwPE3jcQWxXtrCELHMJNGYWoqWK9l9CslW53mIykbeihbjS9zo7dFgQXmQ4pKj/Q==
X-Received: by 2002:a17:906:2bd6:: with SMTP id n22mr20993643ejg.91.1614697138491;
        Tue, 02 Mar 2021 06:58:58 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id t8sm18610414edv.16.2021.03.02.06.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:58:57 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Stafford Horne <shorne@gmail.com>,
	qemu-ppc@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-s390x@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 05/27] cpu: Directly use get_paging_enabled() fallback handlers in place
Date: Tue,  2 Mar 2021 15:57:56 +0100
Message-Id: <20210302145818.1161461-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7At1yPRWPQ6c

No code uses CPUClass::get_paging_enabled() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_paging_enabled'
  hw/core/cpu.c:74:    return cc->get_paging_enabled(cpu);
  hw/core/cpu.c:438:    k->get_paging_enabled = cpu_common_get_paging_enabled;
  target/i386/cpu.c:7418:    cc->get_paging_enabled = x86_cpu_get_paging_enabled;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index a9ee2c74ec5..1de00bbb474 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -71,11 +71,10 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    return cc->get_paging_enabled(cpu);
-}
+    if (cc->get_paging_enabled) {
+        return cc->get_paging_enabled(cpu);
+    }
 
-static bool cpu_common_get_paging_enabled(const CPUState *cpu)
-{
     return false;
 }
 
@@ -420,7 +419,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-- 
2.26.2
