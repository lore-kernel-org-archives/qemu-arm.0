Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538549lfg;
        Tue, 2 Mar 2021 06:59:06 -0800 (PST)
X-Received: by 2002:a05:6402:181a:: with SMTP id g26mr13324226edy.225.1614697145833;
        Tue, 02 Mar 2021 06:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697145; cv=none;
        d=google.com; s=arc-20160816;
        b=s4Os8RR2a4yb05bao5MYUxCqt/C82+SVzDvxAuXdt6KYiFykzk6e/cIGsjHKHQp+F0
         B1H4BoaXCOObzo1kgdMUDc17ay1gNwN9pnpDkcIJ6ldnVXCXYfiUe1ROullwmpWoMr7F
         L47vAjeuR6Ua3aF1AekrFVptLytWlyCRSkttukiU9jDI4reHCKT0EluaE5VqEuergUVO
         06gGbTvuMiZTQJ5+3b5FEefsFbvFUu3qswUzPg8YIm3DiLw3J5nTbDmekHWdpeUzdbvW
         Sy3ZWB9R5chuI5EGYijODjYflIox3UHagJshwwD4X9XAOYJso538AjF4evqV6kZnAZQ3
         UfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
        b=vBmz3VMmAt019/OiDUV1nvvv2jZjuA+ES/S6Nbf0IV+8Dwyd+84+Txbn47oA0mIU5L
         z2FIbRanyP9jQkuemWSHy0KORRT4+jWik9LpbGA36K5O3j9atbWIUcVKGqAL9Yv5JgcV
         Bmih+/aJOg+vEakoMNW4723pmqxUoLTGy6MixCDrbgAloMSyZ7vcTrZVxNMIemAT9gNj
         XwBOVDPOB/ZZE75NI2b1liriQ+D47u5YcUWZUsTOUCIdsbdM6oIfys8D1NI72dxHmWZN
         AjXfOYJwGzLcWmzoTwZ0ouzOegUwv+ickUGNCobfp1B0cgLmbwFVngXsaAeogIY9nuGS
         zmKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kVLUnHsp;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id si12sor12506824ejb.87.2021.03.02.06.59.05
        (Google Transport Security);
        Tue, 02 Mar 2021 06:59:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kVLUnHsp;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
        b=kVLUnHspJyIvBEWj+E9qUPp1Qh5iHn8Q6lrsAKp62fcgX68jBggwX11G1ZAH9z1aNP
         0qOa6D00MSG8x1QfGX4KtJ5wmVdYjJqG1q0eQ3wcCTSTlPC2oEu7EcsN1XnnBIcganWL
         Pp82N59mH2X/rQkDVrOH60/8vLmkwzpUcufFs1wqDwhlXmf9zfOprsvWim4cZSUgDlv2
         Xocj4eO9T3rSSNwP8D+/WfQ7KQpmRskv8Qb2EUsSt8ykorI4su7z5oP68sO07KRYx3Ph
         WJw/P62qZoiR0O4MulWLzB3kE/znOJrT32WwDceFa60fBE5QeUInZuzfMo3FArMDYNEU
         pz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
        b=ruPpVN+v+gCdImTSBcgLIQYhrfKdHGRHVPQrF3LN9e70uBgJePs7qE22vxahuS71ct
         Y9SAGnOrqAVgOQ8DPsCe+3VmJqfNEK8UBNfR6lHUR12yWBFOjyKAkri3Yg+pJYk7izGO
         zSpXez8+t8GV+9gktPkpSQd1zmfq+24q/76E+ptNkvR0osjAItD4AGtIcGcZov91EuYa
         fz2qOLD12Lcz1VoKD95zypumUEOBzP21yg4eTSjmcdY+zSQyP0Utd/yUzeagENHBASqB
         H2kSQouxiTUk2J5lqIcswOFRqwD/83nwlLJarFG7+ZoLoEO55CK3H7EA62oQlddETgZW
         eVsw==
X-Gm-Message-State: AOAM532BcZ+83We1Qdub9IMcJHfm1H86lj1phIc0mXiUsEMSURYXfSgb
	QM30rG7RWlCHxMgjuAKsb+8=
X-Google-Smtp-Source: ABdhPJz6BIFMUMLQH5Qh9VKBfT7syr5VibvnTHgVfIgpPM6beywX8pSQQk+mYAjVUchMlmtY4TZBvA==
X-Received: by 2002:aa7:d642:: with SMTP id v2mr19207256edr.257.1614697145594;
        Tue, 02 Mar 2021 06:59:05 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id q18sm16520383eji.100.2021.03.02.06.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:59:04 -0800 (PST)
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
Subject: [PATCH v3 06/27] cpu: Directly use get_memory_mapping() fallback handlers in place
Date: Tue,  2 Mar 2021 15:57:57 +0100
Message-Id: <20210302145818.1161461-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: s1O//NhWkWqU

No code uses CPUClass::get_memory_mapping() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_memory_mapping'
  hw/core/cpu.c:87:    cc->get_memory_mapping(cpu, list, errp);
  hw/core/cpu.c:439:    k->get_memory_mapping = cpu_common_get_memory_mapping;
  target/i386/cpu.c:7422:    cc->get_memory_mapping = x86_cpu_get_memory_mapping;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 1de00bbb474..5abf8bed2e4 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,13 +83,11 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->get_memory_mapping(cpu, list, errp);
-}
+    if (cc->get_memory_mapping) {
+        cc->get_memory_mapping(cpu, list, errp);
+        return;
+    }
 
-static void cpu_common_get_memory_mapping(CPUState *cpu,
-                                          MemoryMappingList *list,
-                                          Error **errp)
-{
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
@@ -419,7 +417,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.2
