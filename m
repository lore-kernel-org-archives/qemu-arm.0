Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4539855lfg;
        Tue, 2 Mar 2021 07:00:31 -0800 (PST)
X-Received: by 2002:a17:906:3e92:: with SMTP id a18mr15028373ejj.95.1614697231032;
        Tue, 02 Mar 2021 07:00:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697231; cv=none;
        d=google.com; s=arc-20160816;
        b=al+JrBwFrYHUWoxFYpjXT9PYtSTbeFZbUYWKSf0IAhUGEvy1REs40NUMToHBOT0J9S
         ey4vgBMTtiAzIhERiilv1mH+1vYaMwX/KKHk9S9Bv2ekn14noF2pVw4bEUgt1FD2KBmm
         6zOZk4FZlglqKBHDZZ4hCsjIZlgoBRcs7SjuBtrvBOevgUqu8bCyaZ/TGR+UoDl2thpq
         MpFh1W+F7Yu2wkCGOD3bLwFQ5Xty32Q3FnK2tYSfiqM6frVElhd0rSTK99PKPoiv6ssI
         qbkjjxh8u2Ufz7P1nDCiG5C+xySFINkjaq73QUzFtWeKgXvBFGdDkmuV0ZhE+1+7jdln
         O94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=j69ZoSRYfJYVN8Pr/CO14wOKQXEUVXgfUZYW8ZzPgjs=;
        b=MOCcvtYYcLF0hX1Yhjo8O7ggfW5Nl2vplOpl8zwyfB/xEL5KKm3GKSjDknBsoqzpGa
         tbun/iaNfSAiyfzsCrpQ79+yMaK3es2xb+CE6UAFgzBxVOz7RWSGVk2T7V1RMh4rCf+x
         ox2muftJO4E5hfyFoN+WmMqQqrVKnVL1k+uWz+t7UtKgXl31efofk1n3HqbQVpW+ZEoM
         6CbryC6bS0gXCZ/zJapegoxm1qRpjPEvOabOH5XMRG89SS4k5ZAFJweVMFu4Ipd0K4cu
         +npaQkvsec6vi4ZdvXNVwgCBLovVnZCd281XUt75UMm4VC7U9QFkmrXzxEYgPooIB/Id
         lQww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="rx9c/Fp9";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ce20sor12252679ejc.86.2021.03.02.07.00.30
        (Google Transport Security);
        Tue, 02 Mar 2021 07:00:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="rx9c/Fp9";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j69ZoSRYfJYVN8Pr/CO14wOKQXEUVXgfUZYW8ZzPgjs=;
        b=rx9c/Fp9AUXsNAby0S9o6a2kG8PE2rgPupHi+3ITK7y6g/MlNm85u6c1dfOTRUg5T4
         mr9Dv+AZ4B2Cv/jzmK/uVX9r0mFqHypc4TMWTJUiDO5m2g2xZ2XoEMVdnD3acdVbfm1s
         v+VSLYD5w9iAURWQDp3bSY6EjRNuyfsk6kG6I+AjOtorVqFif2NJj2gg2J9YdQkWQ0zs
         qtLh+P+qAL/vYTmxBODFSfqUKzZw6gTz/DNBA02OjTbwgu6GIFUCFtS43egEh4/hIuq+
         f/V/vpVK2aN7CsfnoqFDHIsNf7fmouwJyoKzh7DBw/JsQbn5gsjiN1fLR6qCQiLxsCrA
         TyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=j69ZoSRYfJYVN8Pr/CO14wOKQXEUVXgfUZYW8ZzPgjs=;
        b=N2LPV/XJpH0rGsbcMBFcaeZkzr5DyxzD3LPlXHoHXyqXx93b8Xi7GwyH18BK0ES9Cd
         sH/LaKggwrpLAdfuBaCksdig6vPcs/A7ilcJrZ4dpnjFoDVWmUHjkgmn+0aETCtS7iU5
         T354q0+rYggNAVEiecvETRPQbM60tdteOboTCRR/0czMnqaFE9azSvVublCJ+2Sl73F4
         JFXzlQLRnrlsCnkHg1tR6hriJcQKAXDjJB3/fWF8HUcoG2+IU6wsF+piNuoGBQZhPhpu
         3no7+DgDbqX75N2Z3H2gZGTsbJQjHRv6OMYjylYRKc7vWYiwBXE8IYRyofKVv5vHGnx4
         s/Rw==
X-Gm-Message-State: AOAM5314zF1FMZOpPN1xEr+ZCCOW49FoE1g8BX0zI8HGWG5jZIG7HZWX
	BMQS8bzD5NjGv32qbKVkoMk=
X-Google-Smtp-Source: ABdhPJxCZHaZgGw3rdREFUDJZbblbpV4aRAL5G0RgH7jbrGgCSzoR86eMC0dVNm51ZsxLWNdq9MDMg==
X-Received: by 2002:a17:906:1352:: with SMTP id x18mr10628239ejb.545.1614697225830;
        Tue, 02 Mar 2021 07:00:25 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id j14sm17921369eds.78.2021.03.02.07.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 07:00:25 -0800 (PST)
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
Subject: [PATCH v3 17/27] linux-user: Remove dead code
Date: Tue,  2 Mar 2021 15:58:08 +0100
Message-Id: <20210302145818.1161461-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: l4F1OE7UbM32

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. This code is expanded as empty stub in "hw/core/cpu.h"
anyway, so we can drop it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff54ed..d7af3ffbc22 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -200,7 +200,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
     CPUState *new_cpu = cpu_create(cpu_type);
     CPUArchState *new_env = new_cpu->env_ptr;
     CPUBreakpoint *bp;
-    CPUWatchpoint *wp;
 
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
@@ -211,13 +210,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
        Note: Once we support ptrace with hw-debug register access, make sure
        BP_CPU break/watchpoints are handled correctly on clone. */
     QTAILQ_INIT(&new_cpu->breakpoints);
-    QTAILQ_INIT(&new_cpu->watchpoints);
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
         cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
     }
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
-    }
 
     return new_env;
 }
-- 
2.26.2
