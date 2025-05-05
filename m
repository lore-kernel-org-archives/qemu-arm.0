Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778331njj;
        Mon, 5 May 2025 16:20:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpuftDH+RGmzx7HVx2DU/3ghX9liFdbgHgxYdaJW9Its3u9JTCwR7SOn7FgHnqHiCH0YMw6RK5S1TMxg==@linaro.org
X-Received: by 2002:a17:903:3ba6:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22e328fc9bfmr15988805ad.14.1746487246625;
        Mon, 05 May 2025 16:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487246; cv=none;
        d=google.com; s=arc-20240605;
        b=IOsTrX3m7+pCx/SIM4jfiEgWUqy+54OwnRYa427NepEXvt0DC1WNfzZwEGzb6RfVD0
         9gwn5d5Lw4cICKd4ugJxWTmiHoaFjzsMA173rAsRDhAfEdg/nUp51fhYrWI6b+YnXYT3
         rqGiTtZDZLHFlw5vsBpLvKQM3iCGmPFASInZYiIX1hE5jEdqwzqKl8/T6ENRUKbu998S
         mwDgwR53RcielZU5SByrFM50nm8Q6t1FOSPzDlz65PA94PNzNPNCG6IkoN2dyvvIdBNr
         bU/cvKJiU6drri/joJcy1UvDiRobr45Gzt7fR+6ZGrWnJQyFs+grAfmzSqJhdmhVvQYE
         8new==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        fh=eiPc/E/+NI0to23naYtAalM2jl6yzR/u8zgaaswyzeQ=;
        b=aD6DApWcOdIBVB5WhzOANWiOx1p0roKkapoEKvZMlyuw2HcZVCSCzxwKAbH99wsPHD
         918Lr+JanENwzfchoPgevB4a9T7Yf41H/d5Fo0Lp/rLw+II622d/uniA5bDVkWqCUERL
         4mL1ZFdqzyatE5k8EBXxbBkTOcUaluwswDD3s/qvwbyUjfe60t761d3uIjuDEykrOlE1
         2C/WGYsvkeCIJ9Nw++wB7KqbcEREhSsMxF0D7KMKXt9JcqbOsSIyYKtgr5JHXPTN988P
         cKn01tut1C9SYTnURM+xSigSCCxUgRFBby45yNCkj620koGIhD0iAd+TB9VeYvn5cQ8C
         Sj2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYcbaV0i;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc6ef03sor51626505ad.12.2025.05.05.16.20.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYcbaV0i;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487246; x=1747092046; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=VYcbaV0iuMbLQSQSQ6tTK+0zrh78+z9xzZXQ0EWL1tTXj0jXVvKMnW9j1C2jGgsxY0
         gOcZ417FSUlr8ikio4Ez/FHm5U0npXKbn4X7dRrPS27ykjd6ZxYal9OmS9RqHO2+0p74
         R/F5nRQ+zf00vyZD0jgAnORQQBDEELEAPteRyOV2s6yEsu/R4PQ+CwoCXm0a7ABbrOA2
         nQhYR7n8HYD2sVJ3CMVNBJzOcuNt9jJ8czpwYNE3/fT1SveZ9hyouKJqcU1LP1A8m3FZ
         DZCKcCNngvzOM9GZHQ07j0iu/C68v6d4fEo/6tuljyxw33ZwFDliH9QgVybz0RTEQBE9
         g4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487246; x=1747092046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=JQ4KD1DCEVzNIKsOYMtxbmjYLAcrzl+PEFMwRJLeofEGEV3o76443dRjWM9ub/gsEY
         rc95buoKzHdqDw7EBOZR8lxkf+6XOu/eEsFwPBqCCH6ksIdZ7hGJpJnDRNZ/DRPDu5xw
         mfztGBtwcOTy78Yzr8D8aHJ+APvDoSx8rhJsWRUU1diDnf58FF0Hb4jpAsrP3y+4qjB+
         oxXjieI+a4c0gB0BIok4HFLJgb5vUWcIC3Z0/AnBeo+dyoXBu2J/c0cfiZ5Ptnt0nHsZ
         NihEZNQCtL/rS9jPQbaGk4MGFZBS+7Qmns+UL+1gFhneCEy/aVUt4OsGKRTpdUwSfHmU
         O+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy95o0aymjcLUkpcWZ/7SfHrgJHAGsO1GD4AFNBQNyYwK+Q8Zsf8NthhCAIYuef1g1sZv9YK9qf8uJpQ==@linaro.org
X-Gm-Message-State: AOJu0Yw35bUkMre+SdFbjAek7/NRHmaWJ6EjSJ3fGF8dkG6vQdCcGBDH
	kKb6jQBVQlRrETruOJyGahEoTjN80dmAuvsK0mVqs11my55R5sfIqJUV8af0QMyTFg==
X-Gm-Gg: ASbGnctO8bEGWV0HeKXhQFuCAYsXEW9CYkSbI+FcddmI5N7Z620um66q4Mi3lHyNp0S
	i34ifKTJJ2ZqxmHehF9lUJdQkUSFmiwS80rXIExDu5CcLu2VQiSpUFzq4jqwWVBz0oRSGdkF8/I
	7/iOGF3M35Ei8Mis2U/9RMBHZRC1dKfDe9zFexzajXcMLk9Nx+mloEYE77TzOvUBbHOOBGUj10H
	4zE4qUJ6VYHuBKBeAWCUEUPZu9jmeaIACdJhYuY4RYPVhgsQf4VJIjDeyZj4isOBAOQpgEin6yh
	r79WE2fQNAlsjA4wor1ptGl/mQM0SPlEeNVULwLJ
X-Google-Smtp-Source: AGHT+IFNUpBxaxlaaMr2/wMPpI/FmXGW2lNuJg+7HXwY+aLS43ce6Bg6LfXYfcUASH6/r3st2BArqA==
X-Received: by 2002:a17:902:d2d1:b0:224:2175:b0cd with SMTP id d9443c01a7336-22e32ba0bddmr14905925ad.26.1746487246254;
        Mon, 05 May 2025 16:20:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 29/50] target/arm/arm-powerctl: compile file once (system)
Date: Mon,  5 May 2025 16:19:54 -0700
Message-ID: <20250505232015.130990-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oJpHfQU7Mrvw

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 95a2b077dd6..7db573f4a97 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
   'machine.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
+  'arm-powerctl.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
