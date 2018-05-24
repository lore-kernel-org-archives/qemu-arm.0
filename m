Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2341889wre;
        Thu, 24 May 2018 14:38:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLDArniRuIGdxxok2UnuHq471Q032hljEnx2P/a2fygX1MV/hJ6dJlaITJsRUxYJIIyx4kv
X-Received: by 2002:a37:2801:: with SMTP id o1-v6mr6994155qkh.319.1527197891856;
        Thu, 24 May 2018 14:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527197891; cv=none;
        d=google.com; s=arc-20160816;
        b=ytU6YNgrt6i24wPWJZI6PC/mNfDpDji2J0miY1WodRb5G6DdamfJ6+UvsODBQfLeFS
         8fscB9uJARTx3schmUo64tk0TrpYEJVF8wV3l6Cda30CruBTdb7WOaLDsBPkvd887O9m
         F1j0e9jr6FYQyodP+eCv5OIACowK5AagrYXhJXmRskHIz1O2r2GjgENZiKKkuYk8xXiz
         ByyjngsMNj6BWK7N9+cDLQ2cCedgQfr28OjYn6l/EahsYZ42N2P9LdkeNLS5PW94U3z2
         nCaH4vMsuMsufNvJTFcDCs/t1z5D1ZFNbSf5D0WhkgjvHFVJR15Qzkq78F82vPFnhb2V
         rlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:cc:to
         :from:dkim-signature:arc-authentication-results;
        bh=Za28Eq8EhE0KTKKRttIkMAJQwX0h2D9qS7apFLdkK8w=;
        b=cvM1bm17MvNuba0/uCXUmEPzpG73FQtV79k6WfwnYekrcUQuHgYrip0daqXzqxiWxl
         T5LBAQI6rrbLfXQuRmWsolxyRLn8twloH0+pu8YwBVzMTSPvp43bqgD9YtPQxRV5DSgK
         XDg7d4Vj3QVJgZWXcfLuQCsn9HEUnJ/T1Qaxdg+7i2IhjoiRtH81EropMZjZqgO8I7nw
         jT4HQiD+bbr8gcT7o/2n4YFWRh+k+fqSeJ1yC/bdGDsl74+N3i3yU2fQ+tokAHAJWLTc
         Sh7XT05hy6n/+43PrF/HXFkrmA114DFN3X7GAxEsKBd1EYrJHErIHR/fwWyW9/suMa5a
         Dxqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A9NhWt9d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q30-v6si3975318qtg.61.2018.05.24.14.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 14:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A9NhWt9d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLxw3-0000UF-CX
	for alex.bennee@linaro.org; Thu, 24 May 2018 17:38:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fLxvx-0000U9-3O
	for qemu-arm@nongnu.org; Thu, 24 May 2018 17:38:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fLxvs-0003sg-8n
	for qemu-arm@nongnu.org; Thu, 24 May 2018 17:38:05 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:38632)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1fLxvs-0003sE-3k
	for qemu-arm@nongnu.org; Thu, 24 May 2018 17:38:00 -0400
Received: by mail-pl0-x242.google.com with SMTP id c11-v6so1822822plr.5
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Za28Eq8EhE0KTKKRttIkMAJQwX0h2D9qS7apFLdkK8w=;
	b=A9NhWt9daiYZSHpEhSipxX7ohbWUAOBKhZuOKUJmxigfFML8x5RG0+widkA17pJ8f2
	qYOpAEi6DXbJPe4/szZcXoKs8ARLR+UOYnMw+5v0AeX3MteBrgHfVrzKLTFoJ2Hh7uTT
	gLc/3huK7wCkHxPJ13sLyT1sTz9uSEug8qN05Z1z+fh0jafJwHmc0J2VsbudzJK4nqfo
	qaSvP7ZnnN9IgZwJLbro/1f/c7LfnNBqq0TRS6hNumIt+yuTFRx/guvD51kLqf4uDMwc
	x5M6Q8ZTGjqYiBx4Y6ADC+IfTVpTzPHFeE/60uFX5X9VD6CBWBnmaaTWYX3xBcWG69M8
	SzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Za28Eq8EhE0KTKKRttIkMAJQwX0h2D9qS7apFLdkK8w=;
	b=D5aqPH/7C4TW8DKvqeygLTzenwgtAY76JgTi5K3yzJfbM7yfVrsMjv2AkPUlwy8YE7
	mOMqHuUmjXM/SJ82oawL4FAMRd2NxNQfyg/AFTPQBPtj9CB/11X8QNd5sv6QtRzxO9FP
	ZoZnwR5AQrrcHii5bThpec12ySGATsaAIngXvrX/yKbv/dTOHMg6rQ7ZCoUYiqnMvTD3
	3jT9Kjt8QwXGAImX3Ie2Kr+TZ6E4kMEVZTJqsqV2EUqskvIuQ26pwTs/jHI6aVOp1FXT
	mUHbbCJQxxUgF7GjmabaJ+vStrdoAWapHUqWvNXhOPvUIw7fTKsoAdcGiDDxciw2zx7K
	mikA==
X-Gm-Message-State: ALKqPweEb7I/ZbExjDOV5nzLfIh6Ym2TTQ1v2dJiQt+JXDA2Bg9G+yDY
	JSzfes6xY1kSFeHCFiqfwL6sJOzh
X-Received: by 2002:a17:902:1025:: with SMTP id
	b34-v6mr8935691pla.207.1527197878537; 
	Thu, 24 May 2018 14:37:58 -0700 (PDT)
Received: from donizetti.event.priv ([72.28.93.239])
	by smtp.gmail.com with ESMTPSA id
	w134-v6sm37981095pfd.187.2018.05.24.14.37.57
	for <qemu-arm@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 May 2018 14:37:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: 
Cc: qemu-arm@nongnu.org
Date: Thu, 24 May 2018 23:37:56 +0200
Message-Id: <20180524213756.7528-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH] arm: fix malloc type mismatch
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SDvR7+r7ur6c

cpregs_keys is an uint32_t* so the allocation should use uint32_t.
g_new is even better because it is type-safe.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/arm/gdbstub.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index e80cfb47c7..0c64c0292e 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -157,8 +157,7 @@ int arm_gen_dynamic_xml(CPUState *cs)
     RegisterSysregXmlParam param = {cs, s};
 
     cpu->dyn_xml.num_cpregs = 0;
-    cpu->dyn_xml.cpregs_keys = g_malloc(sizeof(uint32_t *) *
-                                        g_hash_table_size(cpu->cp_regs));
+    cpu->dyn_xml.cpregs_keys = g_new(uint32_t, g_hash_table_size(cpu->cp_regs));
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
-- 
2.17.0

