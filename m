Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp370675ejc;
        Sat, 9 Mar 2024 11:31:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0Ua8RQSc37eLjTY9z6C0u44En1brM/1nG2VvPU/NF9cFcHwUduiL4E9xQWsLsZiAy1uDydCjOnQah9NlTVBLHMc7WcHvd
X-Google-Smtp-Source: AGHT+IH99apq8FVMPs8ZfJ1qXidj2rugl++Tf+ZiFBzSljzTvpyMaEurqnZbVVcPHh2vXP3ZrCio
X-Received: by 2002:a05:6870:1605:b0:21f:1547:35cc with SMTP id b5-20020a056870160500b0021f154735ccmr2853349oae.47.1710012695000;
        Sat, 09 Mar 2024 11:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012694; cv=none;
        d=google.com; s=arc-20160816;
        b=G+yP26XYx6eCsJE7nP6p/aOh00B6OPTEtjA6AiP5f1oQxSO933YWG8yKIfccxfWCZl
         PegW6m6vk2QCcUOt5x2kne5AAQXN5EDWM459GC/Io8ISJCb5Gz4R54UrgnjMz+Gi+qun
         7DBCdF0Bobg3HJryhl4taDo7E8PXrQHAAeAs0tu/YN68gCPYPmaMcsIUDfntgaWpIEwP
         TCtmXFZSmC6o0jrWL7nufncBLiha5BYfF9D5MZmaCtCVG5tfiJZTfcsZCm2ui9MYsGq1
         gp1p3HoGrG1CBhOPG4WIzT46mQSbAUoB69BR6ntE6H/1SxR4gu5WkkULlVTxautwjzZ5
         n8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+fuJ29vWBRe9UmwN0pN4V44UAyM0aAmIqNcBSmPyHVo=;
        fh=cdQ8TwJ2wslJTnZrrH4ZU8W1CGhkNqYpU3pwmSPvcVA=;
        b=GYhmWP2pMDpI+Z3oRYakXbU9TWGcqNXIt0BhPzlndLjUsTERflBf6QxsXHqn5H6mjg
         kf6krwsdFav/fwtLmOTC6U68j+81yL7SP2Rye1EsXjmq02KYO+F/oXybloEN+zgBLZde
         2COC7AFQrFyaxdIybS4szzzvlVyRG1hDXW1WT0dXLEtpsBLBvujN7nDWgCyfiN6b2YeI
         VA2FMEfuFd3CljsiycCMWCpihamjDyAfc9SICMahbzPxvpfN5V8eXrAWxyUGFkFufzoi
         mPo+zb58WHkpRFaH3ivlgDZMh+rcJE6keHxj1dcVa/c72MFjg5TX+knDG80gqy2UJ+H9
         QoVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQBRYj9o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc18-20020a056214411200b00690099c0edasi2125818qvb.474.2024.03.09.11.31.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:31:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQBRYj9o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2J6-0004Qb-NB; Sat, 09 Mar 2024 14:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2J5-0004IH-6l
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:31 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2J3-0002p0-HK
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:30 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56759dc7ea6so3972812a12.1
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012268; x=1710617068; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+fuJ29vWBRe9UmwN0pN4V44UAyM0aAmIqNcBSmPyHVo=;
 b=TQBRYj9oVVvJad8rlOOGoPAGnUBtBMrNe/KfipJ2jsfgNFLgJxpMGrdpMZv15cBU66
 wjguUt/JuktcOw2K0+vt8zScN+6wSx/NBgZHzKVh3KWtKc75qrERDku+w4XSChZfIO2z
 bleR5uAlL4jsH5ceFZqO54jUW/jiIWkSiXejrD4rlD4dWsCPAkbZ01yZzxH1uookLpdV
 Z8P9P417ZNiTMOIYk16VQR+EST5v513AththRotSyLW+rE1SBzpjR3NWje0/IRWVDagI
 //pd4mf7Mn71K+mKquo3XfOoiATSQJRuBVXzuNdpXs+OtT+x+DDp7g8KjDHjCt8D+pQG
 TFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012268; x=1710617068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+fuJ29vWBRe9UmwN0pN4V44UAyM0aAmIqNcBSmPyHVo=;
 b=fvF/qegDxXB5hjjVLWUmZpEVwVhJlP0OWYg+Oe3uAw+m+4LSKcrphTJA/oG3OAYl05
 x/xOKsoivoQn9bEY4MdnMqjH98JbM/SoQP0GYeqXSdUb4c4feyeTU0GuxARcYFfn/8Om
 n+zQiJf8imtYkmlnBlqAGr/8xNR3EaPSpUiVlDFEt1ifq8fdIlvrrQoiC8l3dXahLuuV
 vMrHalrnUZdKCbndraH9+QXco4eidmOyFjZ2G/plQqwMfo6I1JVe9QmE1sGkPPAV/+hW
 DnTqdc2BZeVLHxW8Zri66o1dVPr9xXhBNHCiIK9vNeUmxNtn1HRQU870k5u8wJKmcIum
 C/Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp1Nv7X4U8YSxiVQPydRfvhoB8hpdKpPkPT2Uu23uGyBUq2rZRiw60gYRxVQWZsaN2IRAHFjUqouhc5wz1GwpdhO+j
X-Gm-Message-State: AOJu0Yxmv8uNxoyJfx9cjio+jeYbDwwTVDNhTQV5geiDjbqnjQ+4ijSq
 pUJy5oWnypHAHu2NVRCVYQyeS9O2iS4jIgxpeBIqB7QTC8fwD63TgSIszG2hq60=
X-Received: by 2002:a17:906:52c8:b0:a45:a2cc:eb8d with SMTP id
 w8-20020a17090652c800b00a45a2cceb8dmr1224240ejn.25.1710012268039; 
 Sat, 09 Mar 2024 11:24:28 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 bk15-20020a170906b0cf00b00a4617dfc36bsm124195ejb.178.2024.03.09.11.24.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:24:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 22/43] hw/i386/pc: Have pc_init_isa() pass a NULL pci_type
 argument
Date: Sat,  9 Mar 2024 20:21:49 +0100
Message-ID: <20240309192213.23420-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ycKT1G0m/Dlt

The "isapc" machine only provides an ISA bus, not a PCI one,
and doesn't instanciate any i440FX south bridge.
Its machine class defines PCMachineClass::pci_enabled = false,
and pc_init1() only uses the pci_type argument when pci_enabled
is true. Since for this machine the argument is not used,
passing NULL makes more sense.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20240301185936.95175-5-philmd@linaro.org>
---
 hw/i386/pc_piix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e14dce951d..319bc4b180 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -450,7 +450,7 @@ static void pc_compat_2_0_fn(MachineState *machine)
 #ifdef CONFIG_ISAPC
 static void pc_init_isa(MachineState *machine)
 {
-    pc_init1(machine, TYPE_I440FX_PCI_DEVICE);
+    pc_init1(machine, NULL);
 }
 #endif
 
-- 
2.41.0

