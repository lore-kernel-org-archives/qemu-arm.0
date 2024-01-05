Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795260ejo;
        Fri, 5 Jan 2024 07:50:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGik1szUTYGPokycPUwDBEVm/07p5PgShh4nmhybvoOBaG8qrOQhEe1QGliUmAflILch9n
X-Received: by 2002:a05:6808:1a06:b0:3bb:c1c3:4c5a with SMTP id bk6-20020a0568081a0600b003bbc1c34c5amr2492828oib.104.1704469820290;
        Fri, 05 Jan 2024 07:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469820; cv=none;
        d=google.com; s=arc-20160816;
        b=VLG8b0Epip/2TTtIkX71XeXiwkcHr6g0FKFuTNA2naY5Ka9fpraZAYMrEm7WUVRTGb
         Ri22edVne42BwIpwoIza7FdW9McNVNV/4GnCAq41/ypAQpS4St1uWssbykgZtb5LWA83
         Bz0noiGbP6BMBdX+qBxSecwNa0xFZ1pPD2nQVQIZO7TWKEMt7RWXhxpQn37xGk0ggDX2
         wIiF9KOg59P/jKkRq8sY7qMfdCK1nfVqxuuryZNYtC/xWK0IzDvGAcX8car2xYPaCxZs
         vEf+cLq7lN0xpA1uSoTKf7ce9ND2kyud/4CQfB2lePbmITqzOxMJdZbyM1wG/a3GHuEK
         STvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rwNOMMIAYzGSLWabz4mQJXWqt1PJzQTuexNMmuOK734=;
        fh=c+l8ms79slf+HkInAquXl8YtF8vGf6PikhLcunVcZ64=;
        b=WIg4DxxY6A6vP/e1sJQtXayZ853Mz4CKM2PTpCMHnoyxZ1IEzVKUIcgxV6Bhfn2hhy
         GnqwfM12+JdzjLPOk6FR4KJUSEUDaotd6XHVrezeL/Hp6Q0LvXD3ssUlYbpzu/6ZIfUS
         l/gEhJkNn3m9UUL39XfxoFPKG9I1cA++UNeGaeCWRyQkVWF5JXRyIX8J2g60OVT2bWxC
         n01gbSAlwVBPgQGkpDC2m+EuMqSTVUgWcvjFvDkKvvt0TPq7LSp1e/D8NqFjaFvUuaiT
         FOtpaftPknfEiHjPCHs9HVgr0cUQiOmE77TuyYioP+YP7z+ovFp6jZ/oufa8dwC5RM+S
         jljA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zTpWELja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a0cf387000000b0067f28704aacsi1997690qvk.565.2024.01.05.07.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:50:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zTpWELja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmRN-0004mI-ES; Fri, 05 Jan 2024 10:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQf-0000Ww-Qy
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:14 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQc-00052H-Ds
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1227766f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469688; x=1705074488; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwNOMMIAYzGSLWabz4mQJXWqt1PJzQTuexNMmuOK734=;
 b=zTpWELjazCjgv0efnlE4zgCZ6HMfKPlhg7nalHCtNUcEufcNlCWuRjuP6LJ9uo75Ur
 +ULrhv/L//U7gescR667EK9aNhCAPgAS8DWNrKeVSbPTXSLugeLAee/nUj3nl4cEBez/
 F331TfRBGXG4m0zMU6p+k6Nh0HmUpU0NP91eJFH1AGeyRcyX2GNwnhPpWO9ksIBaZlps
 eR+BMefEpXYEBfigksRECRFsDbzf+JDqMOeGJVmHb+MRGf37TATqYwxecIizGM5M+ZD3
 7TxuOS9ny3tgcLdMuthxk+SbODKAIGH7osJoZBxrlUBgL/0xxDSVgVPbryjwvtywRgcy
 kFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469688; x=1705074488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwNOMMIAYzGSLWabz4mQJXWqt1PJzQTuexNMmuOK734=;
 b=oZdPiDkV7ur+tLBz5BR+NpQNnYUIzWBmzS0gfh2C+WSstB58WMRIgf6U2eM4O2fbBb
 tmUBip8PveVnhhHPmwIryR5oEGIR5VSXcjPifgTEWCUyl2tYt0JYCOzB+hwOZ5RGyK3w
 qy7iwlTDD/9J5K+8HEpcMNtQyWi42g4R9wUfEiYPG5oD5kcL7IuR41tMwA8WXRLmHkSt
 uSqy2GVhxESVdyAIs6Vcp26MxaegRuRxom/5ZFxfwtXt5IxhA5uccke1IPeINGkl8PVZ
 k9yzpVxQtIhXMWrvj0xG4uNv3h1D+SGNIObyuNoNLQk8kKrRXVk6mRd97jNGjv50WoMR
 uo8A==
X-Gm-Message-State: AOJu0Yzs2U/FV04m+EqYRreuVzzDXXxl7SsV4C+nT718InRbJ382zgOl
 zaNb0Qz2TKcWlQW2SehLdE9xpj7zHB4Aow==
X-Received: by 2002:adf:e0d0:0:b0:336:e366:471 with SMTP id
 m16-20020adfe0d0000000b00336e3660471mr1336264wri.58.1704469688486; 
 Fri, 05 Jan 2024 07:48:08 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 o5-20020adfca05000000b00336ee9edbb3sm1605985wrh.94.2024.01.05.07.48.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 47/71] memory: Simplify memory_region_init_rom_nomigrate() calls
Date: Fri,  5 Jan 2024 16:42:40 +0100
Message-ID: <20240105154307.21385-48-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: /NFaDv5HqRhX

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, errp;
@@
-   memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp);
    if (
-       errp
+       !memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-5-philmd@linaro.org>
---
 system/memory.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 72c6441e20..3997ac5928 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3601,11 +3601,8 @@ void memory_region_init_rom(MemoryRegion *mr,
                             Error **errp)
 {
     DeviceState *owner_dev;
-    Error *err = NULL;
 
-    memory_region_init_rom_nomigrate(mr, owner, name, size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom_nomigrate(mr, owner, name, size, errp)) {
         return;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
-- 
2.41.0

