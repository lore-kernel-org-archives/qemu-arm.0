Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756635njj;
        Sat, 3 May 2025 22:31:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSyC+SriiOfFjevejQLYKDSXXtx593/0uHMo61ozGaeNGrT/SFCpcg/LWjl4LcSDg/hlkScaFSnDiDeg==@linaro.org
X-Received: by 2002:a17:902:f711:b0:223:5e54:c521 with SMTP id d9443c01a7336-22e1e6f0091mr44787175ad.0.1746336590345;
        Sat, 03 May 2025 22:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336590; cv=none;
        d=google.com; s=arc-20240605;
        b=F7ZiBOfRnaLDfDrd0MT2CZas0xOxXVWBk5Q6UPXf4JduWwx9FJ4trSnZJyo8pV1Lmv
         rixeoiAuJc6eKqbNCf30tsOqHAudcJSzjaOm96kBwhtzG2/YsiA+N+8Zx6psXS74ND3v
         N2x3u+d/ZDdR7ifdXfac/mGNoWJdG0HmYMVy5NcZ3oeR4F5p28ibll/9QvwMsE6Jgn1B
         qiamj1amw/sleFikGEy5NrJZo/77KlGL3KdrCy/4aIsjTmTE41usOcLJAyRZoM4HLrT+
         sq4GXOuv7jCONCe+vESiqkfILpJ5obG2Fz8aQpSx+lDF2Fm4De3z6nmNluppWEO5Iu3e
         szOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        fh=peb4TLzz8+0UydfdK1uJ9GTKq7ODVbC4v6z1I/jGmfw=;
        b=EIBMfJ6foKZyqOLreWAjyjlJDqFLBDUYHOOUBvJWjZF+Ke2cqvszUnYqsVDMrsIR75
         mrT8Ay5KTJQSqZ+zWbdUSq1KIPwTuwf+371pLu1rwEYzYcXW874XA3Pt+WGom3X/kF99
         RxJeZJLenofQ90VtZHtaAilhmSu9Sai6jtvFMJ/ZVoR2LeGqKx+4dDW/OiygemVlDjRI
         38ps13aorXM+TaplNSjUPw+0tzAMljvZYG8qcpbnizG2tglUL9EMVQaRPefv7fPHM1dZ
         fZx9sXIpSLzo+jLYLTaQW7qjd4LZLfGo3WAcKC1QX7oAXoXBjzt0Sjx1vnjBXmWCzLU8
         qWAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTPpD0HN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb19448sor32444435ad.3.2025.05.03.22.29.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTPpD0HN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336590; x=1746941390; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=fTPpD0HN0efTqqZ92RoZ5mh7vPXkTgNLO+90UBOPRoC0symezfA+rs5rd9S0Lu5SU8
         dWDbUAG3IxWfaTm8zjDfQN+77gyQQiDL8NBwDjprpytb2Gz7Liba3GMij1M58iKldhO8
         wcRYhKf4vKfiLML0/sUwzsLk0Htqxc3BtjWNzxr/FTuKGj61iZg6wfP10dpO+DT8gOD/
         /D0xpU//lPXwE/AnZb1fD4ex7XDj3B0tWR3SsCT5PV4cvU4IFn8AJ/JIU2n3tt2AOFuK
         0//md4jcf4q3Py/Ooce28JiD3kYi+NZomVCVE9IXGje9PWUDQZDjANvbfxoaSThoySxE
         h6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336590; x=1746941390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=LnD6MQZRl8wd+c6FT8JhVnqKx8CcjxEq3rtiFpa9PSi3+/xL1/b6rmTzBNS9lRWjYa
         W0cmqVgNIZVqjQPtDz/t8DlS6qwl4h33M+5Mzd1N56MFhyDJcJ/6QPUCOaaZm0eND+b3
         kFk82ZsNuwXgWK7LDiu2kvyYPs2zdQyXcoX8GBtsv6Tf6AX1IEiLHdgTxqPel1XnveXy
         fT66bswc/6/oSzawNrwC1F3coNOqyC/YxTKfDBTvCCA7CWlweJR5RJvmqwo1nt4gXF8i
         aEFAGu4YayrI8M3kEpTfZkrL6xb/+qmqgDnbtSgRcbCw7ahp+5Rafrh65rlrTKzPaN7t
         HvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwfkXImOm3uaBiRh7lBBtk1M616t9RZEERr4L92UT/MT72TNTXyWTOVXoFlKGmNq4z6CbPYI78Au0Knw==@linaro.org
X-Gm-Message-State: AOJu0YxuymjfqfhwU3HAA6OGmD1Hvg7CWrz8eAxtYWXC6nPfTC01nfWa
	KfnzVfjmzFXUx3mfHJFlJTVj9UKnQ5n7NZz09Ihu7QpcPpzd0XUrxYwtqtiMipwBmw==
X-Gm-Gg: ASbGncvrdXjgtgc0nr1OKOnZJ7f29905YMf+fK8T+SxfjwyJmaEexciIWsTWRvgJrw0
	K36zNMmb0p4gl3QVXXeQxPMSNeGxFA7YWq8fBeYIchoKOpS225HHSHaMMkWTr0P6wZzNomfjy4W
	Dk1bGQrJQ0FIY2xsOO5olBqWWVp7gRdRS1Ep7sK81OYg3m7jLv3fj0dfpOA/mR3FULV3tQn50Nz
	de9nb3aJOnbpcWFA/iHiYbBG7NTmuikWfpctwoBcKGh8ZLojQyCNjA+sRHB91f0pJp2LqGUHeVc
	Kah162K6L05BFmcSR1KMmBYxq2LCR01kJ/jnKIO2
X-Google-Smtp-Source: AGHT+IGp1Z+ingLQ/zaY5mlWqvBGcOfRi5+H8f3dhypRIFBlvK+ozmXQgUbNrGD1UrydKARVERewBA==
X-Received: by 2002:a17:902:ce89:b0:223:4bd6:3863 with SMTP id d9443c01a7336-22e1e8d5f5bmr45403065ad.10.1746336589950;
        Sat, 03 May 2025 22:29:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:49 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 34/40] target/arm/meson: accelerator files are not needed in user mode
Date: Sat,  3 May 2025 22:29:08 -0700
Message-ID: <20250504052914.3525365-35-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KQjKoEHSlMe7

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 151184da71c..29a36fb3c5e 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -5,9 +5,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
-arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c'))
@@ -18,6 +15,8 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
-- 
2.47.2
