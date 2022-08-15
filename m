Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1358544ejf;
        Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
X-Received: by 2002:a5d:59c5:0:b0:223:808d:51bb with SMTP id v5-20020a5d59c5000000b00223808d51bbmr9570178wry.454.1660590198746;
        Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660590198; cv=none;
        d=google.com; s=arc-20160816;
        b=jJboljsbX5cmEN9vGqLPO4KNLNB4cQKjR3PU7K6jYOMxWLJAUKJaKyNefdVWZEe6GA
         +auUszjljaeegxrd5MRE9i2efugb29rwDuk8hcU/Svq34XZ/8bBg9WEdY6oqfoywngKO
         K02WsJKOlLPV64vMq9VND2svqJL40Pl4FqTHlCunOar7hf6GtkQXPgrXB53/mf1MT+3Z
         M/kFu7UEbDUOCpEmoim3NN/l6vPLHqhGqzR8t8l1g7grBwhGKp7THRE0tbqJbIa6sHnS
         s0CwUVfkhyaeZVgEPCB87IGa6NAH72k/Qyov32mNA1zAFhzKv04xzAM7rKGe9Or0ZIi0
         k2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OGTDkR4LI4GDhkjGHuX42mV1KlnJTimkQ9agW47gbZY=;
        b=nKogDXRLBqSMZ3Z2uwHuUV0efx0MRKulb264RanXSVppJ781s5ioWv7bK2/mfWRwj8
         Swt0mlAEhH/tm3Dtwv87vCw25J4LqlXlcQZ8rOQcSGBtoSeOrin3coeFwZIZpgb6jYoX
         NOYnr+fp2P/NnigvYUPpPgNK5cGO52Htgzh374zPdI4qZczYKqcbOYwMjzulD84z0RoA
         ulpwty3r8nTKs1VNFTKsBf5Vyv4qL44aNyBUe3m2OCaJWXXjh+PMHfHSHkE+Enc5zqHg
         VKmsh7RclZpzuUIK/omam+viTAzmJHJ1ick/pKrNXfwqTWu4Ifgd7+6loy7Rw4MNkE4C
         BTBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jknClf+t;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y9-20020a05600015c900b00220630dd796sor2813697wry.18.2022.08.15.12.03.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jknClf+t;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=OGTDkR4LI4GDhkjGHuX42mV1KlnJTimkQ9agW47gbZY=;
        b=jknClf+toYIvPEkgUrydqqr9UCEeCEr58GLRzowOM/IR+L5/RRiMyasTBBMRmmqRh+
         VXmtjuUtV6pE17LQfKKL1GbOlJaW2ahc7y2BGrrhYaOsBJt9c+92OFP70Cj8GUH4cpjt
         FP+5S80H/lA3PfnsxbmYnpY4GG0F1g+qU5vO2TzsFXTvUY77ZLJIIbo/FeIaxLDF36xv
         a2R0r4ph5J4G45NgcdWOmn1wde72VHauCcdnjAES4VC1OApf+xdpoHJrnLBL4816MbHb
         KfF6rPf/qLx6WS2D4wOZsqK+d6jo6DcvcytgBHs1PuU0pgP5sxVqEV35A3KcyEKUgdq8
         ljuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=OGTDkR4LI4GDhkjGHuX42mV1KlnJTimkQ9agW47gbZY=;
        b=iB9OsQnHiBVvYMqJ/aFeCBrx692DvoOaOmqZ8qmhIBZcCB2Xnp8ccvlNSZ8KdekwAE
         qwnMuQcZ7h0L7Y/YgDKgaJVdlu2ber2EAJGDowon//xSJ7ywfpp32gzLstBfPilaW2vH
         qglxkW9iRbAl9F7JRveB7gA7a1r8bEvLFp0pg1stkrkg8BWMTZ5FUoRFWkDuWezEYxtN
         9XJNI8R+9eCTDaJXwdDwhzBMAaXNb5LmWO9HibWfBRLkODsCX17uw1uYiES+GpQSqarA
         QLc6p7Y5xBh+jBQ9B8dl4e+PNPNFMYuvp2kwG6n0nUgZ+iho4k1f0SHZVjlePgTSfdWJ
         uZxw==
X-Gm-Message-State: ACgBeo2IO5/0VWP31Tp3PVSloPvHHxqNm/+vSYCvCdgPePqf8fIO99Fk
	/R+nWRuP+Vcbz45QYPKdveuod5Gc
X-Google-Smtp-Source: AA6agR6EenKqtVnb6qh+v5OZDGtZ6StmoxTQ1eASfHElCzeymsfQZli0AJNuSum8kl6Yi5j4QTlgUw==
X-Received: by 2002:a5d:6047:0:b0:220:6dc5:73ee with SMTP id j7-20020a5d6047000000b002206dc573eemr9634750wrt.213.1660590198464;
        Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stefan Pejic <stefan.pejic@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on and enable=on
Date: Mon, 15 Aug 2022 20:03:03 +0100
Message-Id: <20220815190303.2061559-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: esz+45DEFRmK

The riscv target incorrectly enabled semihosting always, whether the
user asked for it or not.  Call semihosting_enabled() passing the
correct value to the is_userspace argument, which fixes this and also
handles the userspace=on argument.

Note that this is a behaviour change: we used to default to
semihosting being enabled, and now the user must pass
"-semihosting-config enable=on" if they want it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b2..49c4ea98ac9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
+#include "semihosting/semihost.h"
 #include "semihosting/common-semi.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
@@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong mtval2 = 0;
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
-        if (env->priv >= PRV_S) {
+        if (semihosting_enabled(env->priv < PRV_S)) {
             do_common_semihosting(cs);
             env->pc += 4;
             return;
-- 
2.25.1
