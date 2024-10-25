Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086110njx;
        Fri, 25 Oct 2024 07:13:06 -0700 (PDT)
X-Received: by 2002:a05:6512:e83:b0:52e:9e70:d068 with SMTP id 2adb3069b0e04-53b1a2f1fdfmr5668588e87.4.1729865586533;
        Fri, 25 Oct 2024 07:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865586; cv=none;
        d=google.com; s=arc-20240605;
        b=eyo9UzyFCKquKaW+OHt9zYi0Jcg4++qn8XydleKB65paIY/pmjg9xRpYJuyVaiaU4V
         iOrl69nmKyT50z/tRQk8eR/Bdtidr3c8aVXIni10oWbOjHZoXFmihxjupZqZg+rgBlQ/
         FFlMV7NgmfwmlSSRpDG7LFG4D5Re8fBf6KaN00vjuv7nCWshMpxujGtOY/H0lLxcik76
         JtvNG2px7YX3yL+9hUDbjG1XNRAhgKd7inRqAv5cAjMnlH4M9mMP+mWIs+EPCOQBD675
         UkqGdFFMfhet2quIlvs54V75o+9EFMyMG6X9tinhpnoq+rg6VME0o0IPGUbWbS239tNH
         dblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jjOM3QYK37qULOvoMpKikOAGRTQIulU/PhbW7+12E+A=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=JrcH8ACUXZXS3LQVFPIvpYohQZGOhbDQnIxmTOPkmYIIo51fmIKc769lTGdZeE8DIq
         JmWHG6vplhdMEMu3dY+pxtpzN5E1iXkXAqE5bKuHEb0xqALnPAuO+GsAer0PjCl5abFi
         3RZHd6YKKum7ESm+IaoWdQNSI02hOwO3OhKRx+O/GieRQTzHQ1LjNu2wQ5Veen3Q0TPL
         b3wjpxOGFh0vsFg8rEtaycPH7CWDb/TWWed7kvu4KP0t/Jd69G3PKEVV/GqYkBnDeUoe
         sxW2OPisMFXVOZIcO+YYkM86gwna1ITuPKNAGUy6HJF4Frb/BW/sE3HNZwZf1AM44Pgf
         zr3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5hCKZDS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431938e52eesor4627515e9.5.2024.10.25.07.13.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5hCKZDS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865586; x=1730470386; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjOM3QYK37qULOvoMpKikOAGRTQIulU/PhbW7+12E+A=;
        b=W5hCKZDSelEw+N7+7slH5p6QhM8cjAWdZ0xtPNnuitoWGSkDjkhvWAJ+lxoS1jzcal
         1buLzFzqohyQr9x7SuiVeMLvbDV/nY5UoSVyiDkowqwN8alrV+2FGpq3lrvuIjoDxdHR
         ttFstXZeGck2D8bJBEyDThswZjWcKZfNst6g5zvhtEdaP3BsT6F/EiTk4lstv8rs3Y9R
         +a+QXYxCY7SPfeg+7eyXQjOpRSxCC3h02G265NcVBG1CIhPkH0MVI31MJOfSV1m6taTO
         wqM1R1gS13M4oA0y2PSllKM0H/eC6AbLC/AmmFtuExwCec9V2zEVAAx/ULegOpQiWbl3
         3swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865586; x=1730470386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjOM3QYK37qULOvoMpKikOAGRTQIulU/PhbW7+12E+A=;
        b=KaV9R1iE7eIC/70Ls596VNRq2nK+zinBz9ZtqbXT+3QC1mRdxQwTwDybB0rsiPDJQM
         d3/Qy+U3tzYh+l/dobjR6C7CX6MPPUvdQMJWv1fV7UVHuQQHk08vYlKsBSB1f/mO+ZmV
         n6x3wwddjM4o1ppMK62DXLNDZH0nBNr/kMYfJT3YJ8bQJDhb1DzPXt8IMB86xHnzE1I+
         9mdE1EuUkECLfBFwVah1z7WS1FXSmVjgDk3CaUSmZmxnvuH9NjSmFBdgpR63g4OkQs1L
         U5gvs/ohC2BuTIUMtRzMtrOcgpVqlFQYui5dTvJxcIgPL8d2pqJy6hPT0aGoEb2IJ+oZ
         OUtw==
X-Gm-Message-State: AOJu0YzSJHVQBJtiWSi2P2EpYpmdJJASHeUYQsChRt5XOOl3dhBjxXx9
	r8HpzzRQVYJAMHm21HcCy+4jdii5bbG1cRXTyGgUeZ7RwWhyBtpQ3a9/XHIimLKFTA==
X-Google-Smtp-Source: AGHT+IElcpmJ1LU46tPdnbNHuTc3BFBmHYJc+kaPi4JdihFLfSRZx1lONZoPeZB6hUVJoUrQ/Pjf/w==
X-Received: by 2002:a05:600c:5118:b0:431:3a6d:b84a with SMTP id 5b1f17b1804b1-431841e12cdmr75651695e9.4.1729865585974;
        Fri, 25 Oct 2024 07:13:05 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 11/21] target/sparc: Move cpu_put_fsr(env, 0) call to reset
Date: Fri, 25 Oct 2024 15:12:44 +0100
Message-Id: <20241025141254.2141506-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: d43DdyvmHgjZ

Currently we call cpu_put_fsr(0) in sparc_cpu_realizefn(), which
initializes various fields in the CPU struct:
 * fsr_cexc_ftt
 * fcc[]
 * fsr_qne
 * fsr
It also sets the rounding mode in env->fp_status.

This is largely pointless, because when we later reset the CPU
this will zero out all the fields up until the "end_reset_fields"
label, which includes all of these (but not fp_status!)

Move the cpu_put_fsr(env, 0) call to reset, because that expresses
the logical requirement: we want to reset FSR to 0 on every reset.
This isn't a behaviour change because the fields are all zero anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 54cb269e0af..e7f4068a162 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -76,6 +76,7 @@ static void sparc_cpu_reset_hold(Object *obj, ResetType type)
     env->npc = env->pc + 4;
 #endif
     env->cache_control = 0;
+    cpu_put_fsr(env, 0);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -805,7 +806,6 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
     env->version |= env->def.maxtl << 8;
     env->version |= env->def.nwindows - 1;
 #endif
-    cpu_put_fsr(env, 0);
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
-- 
2.34.1
