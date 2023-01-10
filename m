Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317181ejc;
        Tue, 10 Jan 2023 08:45:11 -0800 (PST)
X-Received: by 2002:a05:6000:1e0b:b0:2bc:371a:8a4 with SMTP id bj11-20020a0560001e0b00b002bc371a08a4mr5562192wrb.32.1673369110855;
        Tue, 10 Jan 2023 08:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369110; cv=none;
        d=google.com; s=arc-20160816;
        b=E/ZNRVL/v0pdiM4Ac9RxteF1anc6W+Pxyh7qSh8KWfYiYojFpdLMN0X47OHTLqSS5o
         8OIm1zSmL48WXwKEoQPsxox4RnKhw7bKDxTSAXOUZAECnqM02mBMd6Fw0FW2BWyokahh
         0Lexzty4ScW0vbXpqP4k4THzP+PI3KLrU5Jlg+IchvvT1jMIT7rwZfm0vhUctHAOexqw
         un4PU2MKXS6ELC7svKIQXvlovLqY6bmt71268UUlKIb+NlhBcLm0XpIZvNjbXEmWKGSj
         W87E/V5kjCVhLWEH0F7cd7gV1jN47oA9QruyIxomii9QoP+H7G1pMSkF607gFjC4EJOK
         Fy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4tBrKZ6IbVMGWAXp461rKXQbFtVaeFBCzeTvYCck8So=;
        b=XCDeYIyAWiielW6/f5N5ofefCUfqdSxnlbPfRg83Ob+vwiE2Qap7pulKtFWieltYDc
         trONcFBb6Vcy/D+ANhHdv9bZShhIL9wg1LAEAsokUsuNh5/ZisZJuYI9idiFx534NRoA
         P1DqK5GVbvxUzvqfq56XpxEMxZRwM3e8eYEXmlEI5l/HTkBvtsBzdxCwBvA/ixUZ1jVy
         aYsLWgByV+Sa4nr3oIwYw/yc2al8Cv7rJf6a7HgIHQLY9wUpHw9kOFfmbWsun3As6KpJ
         nrH9no9to7+jHsh0ispka4oTOwSvmlzU82Irn0QF1gs4TPCgkyNj1V409Kz5uaMz/KgI
         IfSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tMNGBOep;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x10-20020adfae0a000000b002bc84e8e8dcsor1342519wrc.69.2023.01.10.08.45.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tMNGBOep;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tBrKZ6IbVMGWAXp461rKXQbFtVaeFBCzeTvYCck8So=;
        b=tMNGBOepFtBHU/QxxjREv7FmcoA5ZHiUMhJCWI8WAFSYySpQVEykFCnN/OTjYvCYdX
         BL2yPpIrwl4ZYY+tulrF/pyVWNVfeQUuO8ufYRvovG0r1gnghnz4tHPe0l1irh/x//s8
         hlL0enOreGDKm7kXHryNerX7AzU6D/dqp51k370hAWb6Sq2/sUeY9D0qkny2x2mC3Jrp
         UyMufEIYEXqb+5TKp0qj2TzkTnKBsZEF75gt/4WSfx+YN30arCAoD/LhLBNCFd3ZJE3I
         a2wLU3DxGzfjZPNuJvMGYlvDyA8A7rvRjllEV7KbNnSnh730eXHxIiOcwizf85SBb7Kf
         qaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tBrKZ6IbVMGWAXp461rKXQbFtVaeFBCzeTvYCck8So=;
        b=ZFnFoirPdZ86pz8K4BxprHbWKJC+Mg1xCopM/auZBAi3jXdPFrECSqsBUW3Kqmsr1C
         BaJUdX4oxMVfS9ghcwVc+ck05hou6jWJCNGA6V2YFxhNojj2W22YI2mj7vjcT5eSMxOW
         yLhoUAD3KeGdO1T6tl1+XsWoa3DGW/TUdZEwrLjfNngzVJXlu2aIBvWrHoBS3XRUlLYG
         iHVE9WlbDb7jqMPff3UkrCZ0ZOEvJKPbsck0UvC7Fn9m+i8BeIrR/afPpMFi7ghRUlQg
         fzlyqhJ+kcMmM04ZQiq+b9v9PK59LkdHbD7MKmtT/ot0RhZOB27kBFIf5nXLz1loRy+n
         0hrA==
X-Gm-Message-State: AFqh2kpsaVACarfbwLtLL0HKlZHn82RmUL+WBQNfBKsy1q2q3M3UBG/9
	eDkN3W+TJOTPaxsIEmZ08U+QJ0du
X-Google-Smtp-Source: AMrXdXuHctpuY3NZsJE81NHFn7CwrfH1d4hKf5uzkdHZpNAdqmdR1l8iJ30CAHk7aLcC6NHP1f0WQw==
X-Received: by 2002:a5d:5b18:0:b0:28d:f043:490f with SMTP id bx24-20020a5d5b18000000b0028df043490fmr31167448wrb.71.1673369110657;
        Tue, 10 Jan 2023 08:45:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe58d000000b00296730b5c3esm11708750wrm.102.2023.01.10.08.45.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 11/18] hw/arm/digic: Remove unnecessary target_long use
Date: Tue, 10 Jan 2023 17:43:59 +0100
Message-Id: <20230110164406.94366-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BbBvsipabGeA

load_image_targphys(), declared in "hw/loader.h", returns a ssize_t.

Remove the 'target_long' type which size changes per target.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/digic_boards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 4093af09cb..529d44e4e7 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -80,7 +80,7 @@ static void digic4_board_init(MachineState *machine, DigicBoard *board)
 static void digic_load_rom(DigicState *s, hwaddr addr,
                            hwaddr max_size, const char *filename)
 {
-    target_long rom_size;
+    ssize_t rom_size;
 
     if (qtest_enabled()) {
         /* qtest runs no code so don't attempt a ROM load which
-- 
2.38.1
