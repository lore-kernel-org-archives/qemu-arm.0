Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5705954lfg;
        Wed, 3 Mar 2021 13:47:37 -0800 (PST)
X-Received: by 2002:adf:9bca:: with SMTP id e10mr777179wrc.364.1614808056933;
        Wed, 03 Mar 2021 13:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808056; cv=none;
        d=google.com; s=arc-20160816;
        b=hvqE9vYO0IctcokuSWK5xraHge0TvS8szwaLZFt2t/YulokpFFm4E8AFatQucdyuhk
         1bgyM9OcDLHx5DPJy0JE47PpTiQzY0on01qat/X+2VN7ungASy0CK4LQ/Rmw6O7UatG+
         mnFSUh+xYuZZmDjjNC3wgj0iar8qJ6Y4Uu3LClVT4Vtwkzm0hckUGwoo0lzrJdLRS+Fr
         m2CgjWGmWF4yBr13wH7O6Ts3nE4Wf5NuctVqTv5RCOB2Mg+VUDE2ohM4L1umxkSLiO/k
         VWFDbdJmchtE6ESHYrYC6arHAlcfbIeBjE3EkMkKkbmhnKn6Ngj31NtLwzH5FsVCnI6W
         iP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
        b=meM2secL1WrwKTPSv3izmhm8OUGItsJSh1lk3c6vHwhtTGtXjR04TMLYnmD6+8OHPz
         6ldfdX3TN1ZNuANMMBEt72Y4q+ZvDH8BNio9o1Wfm7phQn9ckmkoWsVmVSWnXIe60j/P
         93zaQoki3fRgcbqF7sYal/BeyrDEIL+uhDXYVdHcrfRITIHNBcPc4y2favsIaqH5N8nJ
         b+kJY6DQSavm/Mil9hh7b2cd4uAP3Plz2yIhhWRG1mAtSTUAvIa03wLDe2va7c2Eb7nM
         EdygMqeJFYvf0OX1H3Hoy+MY0k/YrSgdqaimCjAZ25ALA/Jo6PTWB5B3gUl4EHvhHlEe
         Cs7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sXWy4MUA;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a13sor7427914wrt.21.2021.03.03.13.47.36
        (Google Transport Security);
        Wed, 03 Mar 2021 13:47:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sXWy4MUA;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
        b=sXWy4MUACGSPd5NPgWXirQrkFX+fN6+K9/FZbmETAlGkcqp9FiygCi31bkTrCoJbj7
         Jfo6zVqQJzWbYtuhbNcLpyAf7HX5TBRNw/yQAlGkoS8emkCU3otkO0UtRrXnjl9d7vkM
         wjLRDOf6yaWNxB45UKkCY1Npx6GrM25/H1aqWZekSWNYASr7QqG2rk+ED+nciimTfwd1
         TdZVcTicRlHbda5DJ0VU8Df95AkI90VVEr0aJgElN0CnQaY45+x75+bko/r0XicA9f9m
         bxvuPgVeOFzMQ3MNuhTYQFWTNEQlW8H69wzskpLmGnioyime3W5KpO2n9IU6lRvzllCl
         zLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=yI5v3ChjpgUoMVznW3/vQVCaXLpm+f+cFTMRG3SQklk=;
        b=e6HUib5P9TrRZiAktCrei4XUUW/dWnNiY0UrG+XVT2R82E+c37y0AfHTP0GYgNMfLU
         cRj9GwwO0hioDvzKdZaHZIGuUEp6gb6A8VKy1BNcxEJNr9/hx7RXEG+1Vm/D86kZt4Gp
         linhBs6W4hQ8wAm5ku0y4IM50GAXYGA37T6zjlNklFSDvih04vrawidNa8kZkJxEHb9y
         Id6v0Y8RtdUUjRgXofimZbsWDx5UzTCcdOszj7ct2/cqsYj3+hxXfgNUp0k93y+5nvU0
         xULVr1xgAbfAzWAqkbIYH6C7f844ipuax6nxPa7UNfGI8aEb5ba+cSiaLzrkq9toSSj9
         KZIw==
X-Gm-Message-State: AOAM533FLa2lATiIYPU5b6DZ5Tmmt2jHZlzS3Z5JCVJG7sg8LExcNApw
	WmZThfpULKSIHDGXk0izNnU=
X-Google-Smtp-Source: ABdhPJxqIH0Ww3giDB0byK+vFGzlNSpnTwVJ2DfY3n21Z3+TTxvouratr/T8dvTbD0znc0f84r1NpQ==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr652242wrw.323.1614808056742;
        Wed, 03 Mar 2021 13:47:36 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id w18sm7480294wrr.7.2021.03.03.13.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:47:36 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 05/28] cpu: Directly use get_paging_enabled() fallback handlers in place
Date: Wed,  3 Mar 2021 22:46:45 +0100
Message-Id: <20210303214708.1727801-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ToQ/+2TN8E83

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
