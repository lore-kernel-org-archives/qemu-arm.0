Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp241747lfb;
        Thu, 22 Apr 2021 03:53:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0aRqhUWMjcaPVjfM2kxwZi2FotzSj178pi2Lc7SMHulrFAV0rAvPemfscRNP7DumnlFpW
X-Received: by 2002:a37:7a05:: with SMTP id v5mr2990899qkc.266.1619088804869;
        Thu, 22 Apr 2021 03:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619088804; cv=none;
        d=google.com; s=arc-20160816;
        b=LXeDtzFPPgKchnbLVRuF3nM3hBWIIdRhUDM5UdNVI1pMy9xXwWgrAlsXu8aM9LRZJB
         cj4oy4P6hTm0gJXTeFCu/25dtdeYcz2X+WzHoVwiChBz0AqqPiAjboA16FtU1IihFxlT
         +5VX/SUsQZB+uMkaxK9L4okZN0rsFNxzRpFhva3lgocCPn3pscbaWg1oOdCMMgd2AjW6
         GBlXRyg35e7AXMiUq9jZGchv48KuwMQtlTDq0f+DhWEjtJvxjo6IsrMNkzIjWMLFKnTI
         h+n0e/HH8nET5IgE60u0ggOm0uPgnmMctXDi+RfUZy+Z1n36d/40QxFoS8giL4is9kyL
         5pCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y73DhisXrZCkQN7S3qTtV5uihkPH6tpgdxs7MXvhbiA=;
        b=fR5CgaKETtdyoRAfskn5U9i0a7Bgo+dorX5a4AhTVBqrOzEYJkPuVSfrGLwZFOTelh
         oz34wObFjYydoY5Imtfnj3LO59PhpIaKizknHrx35cIEyPLSFv1mLXHHPR9yXEp8jpdj
         wIytg3WgDYFjRMLzpMDX2op8YGa51enEHJKfnzvTp4hLaU0tZX5qvtRLWPFerypok9Fu
         J070y4Y3nPvnK/6YPBFGjaHqRkZla18cgZSYlvrFYAxKWBTGrFTRoj0Yaq6O44iGdA1U
         5K/gnnyOO5nTfNHgMNOtiNf1iZbqn1rP0cxmlyibuSh49V3fvsRIXh+n01NYjBofiPPk
         7/PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=undSZNoG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si1963794qvb.179.2021.04.22.03.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 03:53:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=undSZNoG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZWxY-0004IW-70
	for alex.bennee@linaro.org; Thu, 22 Apr 2021 06:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrt-0005kK-LC; Thu, 22 Apr 2021 06:47:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrs-00050m-7S; Thu, 22 Apr 2021 06:47:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so31565452wrx.3;
 Thu, 22 Apr 2021 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y73DhisXrZCkQN7S3qTtV5uihkPH6tpgdxs7MXvhbiA=;
 b=undSZNoGnciSySVrOpga/wm4OMA7T7l91EHCRUVeSb8dRpaKKZaLBSLlUb5ilRqF5/
 X4h+62CD/GXfIg3IIIBk16+Um/9QVK0kEvSmV2YJYb9g1fJr9H+8qSaBxckOLhx0+OQe
 ZvltPLaewLuiI4FiCokosjwWArim01IEVrLaJrI68Yoi92nKq0fHcjecSb8lpSbOIBrn
 dR7xJgXRjd+ELG83Jxupjgv6t4YRwtwc3ua0CaKC8TV2eWP5WeDadqAhk6IxP3D/4JFc
 0ZeOefZ+dt19jFYtrac1FtSN3mTyYlpy3uCrdGzKpd2gO1TE58cgLncDLxEY39zg00nb
 f+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y73DhisXrZCkQN7S3qTtV5uihkPH6tpgdxs7MXvhbiA=;
 b=H/uYckKpO7svOq/qop//hME2DBvJRzP0Ka+1TvrxfgsVp/Z8AWw7f0ty/OfwOLdd2W
 HOi3CZfZvqG2L3IqFnp4/o6k+u0klwr24oup+24E8PlNQgGQ+jNEfBN9szNlByR04WDO
 LeOFfRFcdeALz1ca032nwm1pDnPpYwGu8DrdxmEaP5DgcM2ESHubPfovKMYveAhxBF92
 Fl65FPuCcOvk9q00s3h0fdKKFdYwG93eZ49nQtsKBs4BnZTkMN5IzyHX5dzLMzyBe73M
 sIues9rohLVk4RINczLNeIhyAkZCtgdduRHQkcGrwqDtDo/2/MH0IP0lfz49dI64N/tW
 XyUg==
X-Gm-Message-State: AOAM5300EZrUISBZOFTz+ta5G7wLU1LbQ2IGYGMI5UgV51kJRoYZn74a
 HzuzFSC3HJ6+jLYQkqBPk69XwyT9EAGxEw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr3309964wrt.408.1619088449329; 
 Thu, 22 Apr 2021 03:47:29 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l7sm3280863wrb.35.2021.04.22.03.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:47:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/15] cpu: Directly use get_paging_enabled() fallback
 handlers in place
Date: Thu, 22 Apr 2021 12:46:53 +0200
Message-Id: <20210422104705.2454166-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pL47h4E9rn06

No code uses CPUClass::get_paging_enabled() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_paging_enabled'
  hw/core/cpu.c:74:    return cc->get_paging_enabled(cpu);
  hw/core/cpu.c:438:    k->get_paging_enabled = cpu_common_get_paging_enabled;
  target/i386/cpu.c:7418:    cc->get_paging_enabled = x86_cpu_get_paging_enabled;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.26.3

