Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026363lfb;
        Sat, 9 May 2020 06:09:24 -0700 (PDT)
X-Received: by 2002:a5d:5388:: with SMTP id d8mr1314095wrv.242.1589029764269;
        Sat, 09 May 2020 06:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029764; cv=none;
        d=google.com; s=arc-20160816;
        b=H87rf0FC4KBRZW2Ubpmvwn+loOj/6SVFX/ayCFZp6MgyPaiGZ7W/rnOJhSwwzuHVXY
         h8cZkMJg3VAz69enXUZ2p7ArTvR7JjoM+cpNaZoPRu4UUMNQMZ6pfVaNusB9yziXY+Fo
         xgaE4auwGygtPPxtCCShZGeGxsccHYs8IiuP5f/cOhsUm7rQAUkGKm3XPGndGqgwbf/p
         9XU/a8nKtHsmxRn33BZl5FTKJW5JyWDcaolmSJCfQ4ON0IQPJB9e3x1vR56ySeswheJU
         L4fBd/d9bOaML8W6TKcTVqGWr3vxgjVNj/acXPMxJnzTC4MOyhN6cmeW1AbrlQQDhbYd
         5gnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=q8Yj7Svj+riGcka/Uh3qsXECOKShvQfR2c9eaJKoO3w=;
        b=xbBL6ajoNHo0AAyCa2CEovW9I26muhvVhVfz+5R5JLasxfMaTVMaamZ9ApNr4A/b8A
         RcN2LFNd0yo4Vqgbr0oK5gDLqS4K4/T65sZADo3M7UKpzt2G3xagmfqvRZMsjcJ/+Yhs
         FFjoPcn7NBVfGQ+2VbF29JiZOozkOj3hPOB1N0jhaUw5ivC26oen9AAw7UNICytXEMj4
         nTo2A8Q546RR+PMFApJ+BQAEhC5u9zaa8FEbxjtB6A/YlG/2FeWElC6gmFJ4+e+W0dOQ
         MqmzmTHfkU/xPU0eZphSWqP5Wj55Fs453j7OUjqxU6oAkYwioA/ro/Ckekko6yje4Kgm
         TTqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hgE12GnE;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m5sor8190616wmg.5.2020.05.09.06.09.24
        (Google Transport Security);
        Sat, 09 May 2020 06:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hgE12GnE;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q8Yj7Svj+riGcka/Uh3qsXECOKShvQfR2c9eaJKoO3w=;
        b=hgE12GnE7B03Rf0Li5UMoMVIpZwMF5xdaHeVTULpTEAeAyfTIxU/73x0FkzMTfwU1G
         j18eIGtDShw1NpPuIcibyAKGBEv8Z+jV2kfFqO00+zmXDW3YeHpN1wFTTPAlEXSvevsN
         GTt8SqYZGq2Fz6QJYhaCWQZRqUoF3WMNhNvcgcmVb+1w917mRa4ESy502W8DLWAScJrO
         6SyLHzlIeiDPyjJBWJnhTPBdv1EUZgShPkZ3nvVULre8KMn44FOQVM30REYOpSZUpkFZ
         acaIk8sfbkQh1N7LKB7gZJovLowPsd+E2L/X4weuyf+xaIZdReBPyPHRiuq+l8li+feS
         3W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=q8Yj7Svj+riGcka/Uh3qsXECOKShvQfR2c9eaJKoO3w=;
        b=YwnTmBhmanMFN7R2yTZKpn6VrsVMRb18/DtGffah3h8zDlOsSyghD4mcOnV2PeJ2h9
         OchwmuLRnrbIVGp913sPB+V4EtT3PxbOlBfMbH0NvvPfY6wmoApvFscQMVWxLWOhZtJt
         sgyMOSO7EMU1PBGCHWe/Kiw2Uk5sNi7h2un8jp/lFj8oOIQQgC3zDvsZceIXnEkIeSSA
         tnChhjxDniLpewmsWdwzsXwlc/l8kZolGvNhDfgf+AALicPPzBZLgUu+t7eMUj0xhvjo
         Q2EA0rf+xLVeNXVpyV/YxVrpvN5QNZb7370X5x7Ar6FARPo/ix0TSADUYzIUeneeFwmc
         Hdrg==
X-Gm-Message-State: AGi0PuYQ84ZBFMCUteD7TYw8kj2wWZS1NWdgXCrS3/UKHeap6c5wi425
	lTe4t4MAiWJQrh/x4nQpwo8=
X-Google-Smtp-Source: APiQypL0YdzBqET4iF7tG3bgS7EpeWyVFfBof8z1hou5dM1nUjXm3UvbLE6X0Jtl9HSfA7evL3JbLw==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr20375629wmj.14.1589029764010;
        Sat, 09 May 2020 06:09:24 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 03/11] sysemu/tcg: Only declare tcg_allowed when TCG is available
Date: Sat,  9 May 2020 15:09:02 +0200
Message-Id: <20200509130910.26335-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: UdxShzpsbvML

When TCG is not available, the tcg_allowed variable does not exist.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/tcg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 7d116d2e80..d9d3ca8559 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -8,9 +8,9 @@
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
-extern bool tcg_allowed;
 void tcg_exec_init(unsigned long tb_size);
 #ifdef CONFIG_TCG
+extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
 #else
 #define tcg_enabled() 0
-- 
2.21.3
