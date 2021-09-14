Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp738611lfp;
        Tue, 14 Sep 2021 07:30:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjlCC17FxM8YvLFnVvAN4e5PlnmC9CSa0l7bzMxEbc/wTdhj/uJwdRcnRCCMrUPRKwsg6M
X-Received: by 2002:a17:906:8cd:: with SMTP id o13mr19024931eje.341.1631629815872;
        Tue, 14 Sep 2021 07:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631629815; cv=none;
        d=google.com; s=arc-20160816;
        b=s4bTriNWjLWl3mYloaUqU7jPk6amuM7u5DyiYVnnEaUzSzS91kzLkewLvFRYw/USdK
         VUNDP4IaGciUiH+xxiXKty2qN5GIIGupWMT9F6Liv8M/16MhCPIS+qfl+bZL272ScOYM
         4S3MapIZPPl7RJc2l2ckMVS9k+9/vfwEg+2NZNN51waPtdIFjOk32VRbs4yattK1I17I
         BN6dD8RKq7VHkYgQ6ufWc+yiOry+ai4be93jSRKkcJBH0f+MWN1j/47uW5uaBaQJJbP4
         pEaAMQRnjjis9w9j32oxvjFwGZmA3pUvpCkQ4PQHoykgdi6LMv876Be6NWM2UKd+2jhb
         j9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=m2c50X1HcjOI8LxDAAuTPtCdgQQQ4EI3QbjaNt6yV6Y=;
        b=JvIpPP5R4V9DMN4pMt1cjkqt9I4zfalhlS5bAQsLQBF1C3kSVYXm+SUb9x916WDz3B
         7CHSKaI41f192fDcbU6NS6b+cB0B5bI5Tzxes1c3DzxcSNINm8CaneIUBkyJUW5as+2M
         fF5uPW4u47HfKunlq/bBmaXKXum1pqnBCEXDtlAEeO3OVZmZ8KqfvC4+FoDzyZKjHtLU
         sBoJd1CnbrO/+ugZmDU9kWyq97Ov+pBS7ffhQAwZx+9xxrTakPRI+2Yaovk7Yh/gBAQ0
         2ISpqIyCs5kdw0zqEhMBgWkwvZT3OcqJEEdttVVGYJeOy/hpZYQX/PftF0ahLA9/RJtp
         qa6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J1FIAMq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si4622887edr.246.2021.09.14.07.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J1FIAMq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9Rv-0005kb-1I
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9MF-0005oN-Bx
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9MC-0005IN-9V
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2c50X1HcjOI8LxDAAuTPtCdgQQQ4EI3QbjaNt6yV6Y=;
 b=J1FIAMq9P3vH6YogNozqUjKmnvpwBptIySdBJFRihBZH4YofpM42FPAT+AVBQDrqphG8Yq
 PA7Hp5MNNflO+zNPYqQ5zL63i979dFe9dt/3kWnrJSXIhTiUNB2T8h908gpKVP45Mj9842
 FnlFhOtjA1tSIlc4o/x7LBNBpwfzmrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-T1Wd6paBM5W9Ez1ipBntEg-1; Tue, 14 Sep 2021 10:24:18 -0400
X-MC-Unique: T1Wd6paBM5W9Ez1ipBntEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A67BB1006AA4;
 Tue, 14 Sep 2021 14:24:14 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 992D55D9DC;
 Tue, 14 Sep 2021 14:23:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/53] target/hexagon: delete unused hexagon_debug() method
Date: Tue, 14 Sep 2021 15:20:00 +0100
Message-Id: <20210914142042.1655100-12-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UuBQAfHKPH3F

This method isn't used in any code and its functionality is already
available via the 'info registers' HMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/hexagon/cpu.c      | 5 -----
 target/hexagon/internal.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16..14c628db7a 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -169,11 +169,6 @@ static void hexagon_dump_state(CPUState *cs, FILE *f, int flags)
     hexagon_dump(env, f);
 }
 
-void hexagon_debug(CPUHexagonState *env)
-{
-    hexagon_dump(env, stdout);
-}
-
 static void hexagon_cpu_set_pc(CPUState *cs, vaddr value)
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index 6b20affdfa..167e91026a 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -31,7 +31,6 @@
 
 int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void hexagon_debug(CPUHexagonState *env);
 
 extern const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS];
 
-- 
2.31.1

