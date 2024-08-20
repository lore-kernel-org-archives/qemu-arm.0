Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp341338njx;
        Tue, 20 Aug 2024 07:30:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJyQPEodDxnmO2Fu0aE3HnDA3eZrM6TspSvb/ps6ZJzxSIKfMb4mW8qiNZVLJC5fJ5t+bQmDV5P1hxbhhWSpVWUKprShZT
X-Received: by 2002:a2e:8884:0:b0:2ef:2dc7:a8f6 with SMTP id 38308e7fff4ca-2f3be585599mr91438211fa.13.1724164208946;
        Tue, 20 Aug 2024 07:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724164208; cv=none;
        d=google.com; s=arc-20160816;
        b=yAeeuVH67sAkGQeLKSK4GCbAM5kXpvaEkL+6GZoLc2J7eGnwFSUB1b5uMaHDPdgYnT
         +JX/dOfsphAGUwgmjrKnHp9GWyy3n4OTJHjFYqMNXfco+WJ8FIrjztPfkCrUbjQlD+ks
         66ST9sKiyDfaS3ZGMpDFAPlkn/49K5IO4kGWEp/gN1eowMfvHRjtipOCD9ib06/R4Q6Y
         4jh4x4zz198OP13F+MQkFQ7Z2K8o3Pqf8K9d7QzcH+cnivdn34FYJQ+CqGP+cyCjYqqx
         2o5Y9WV73TjSYfc8/zt4DlVWAaP79j5u8rXlm+TMp/R0QzKWKNdbyNp151vvOAK6HUhv
         78bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        fh=R6KNRn2B5cZyqgPiTvHDjoCj09q9k7g5KMGKLtXoCeQ=;
        b=VxgIkT4YSHk8TBiPllXpHbL2GruATJepPxW0ZNyUDyEUpf3XkyvXpvKpupMBu33+D9
         clHvMkCmkV2QhawJa4rMaLlsmaNkbf6k5UW8roXbj4f6KgtG7ltlqIRrNF02G4VkWncc
         QDcsOKRivB1A8/kvyHcPVgjrs5/taXmBRu03HEYXsiIiF02UISNhsNPhEsBMRyI/q/G0
         YwDqik82x0asqSY4Ui1ZWTTKgMKQwMjvbD8bOtH/6MG7nioXfAi25ATWsDLhKrI1cQZ2
         vfHGCV8mX2RZULNyhY3kVVHzSYia1mJSP5DlEilWqy6qn9HZUqWoDPoxEyT8nIiWfPhv
         yTPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OeZmgNv9;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f3eeaec92fsor4029811fa.11.2024.08.20.07.30.08
        (Google Transport Security);
        Tue, 20 Aug 2024 07:30:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OeZmgNv9;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164208; x=1724769008; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        b=OeZmgNv9r1Gj5drMlNfwJqouUcFcvrEaFdB7Wrc7N/hYEBRp7A8ZDxveNv1X6tRN1d
         BoOqIwuNkMBKUNE2gUPAli0vnZefJIJFHi6gfVyQ4i/9N7GomsTSBUSd/ywhYjBmW+EC
         cieo5Q5gTY8S78EfZ5cLTt7hzIUOAFtTHCeAbqGUaK7pW2hSBNPIaUR+SAOYlg/U4Sh1
         opBvQridJNuu1JFS+ly2OJuzjx4HBKRj2ggl9A2fNOrn3xdPalaWq3S+h5Xz5EDudWmm
         6YJ24GsLfsCE14tcnrhSpuRGt8ylUtg/XhP0HlgLR+rb/sUDl/nYV0A/sG9YfAecCDDk
         gW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164208; x=1724769008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        b=E372S/ZzIl5Uvg+uDsqzrwUR6RQcDAmp67oleDhCfYm5Ma3EleNaoaFruguVVhZ0GK
         iauXOQumlK4J2Ned5Ni3YUSs0hIMuMJs2ZYs07nvKxyiXf44Gx4uP8xeN+oo7C2NgGBU
         vM4xscJ1aDlRyS26WM7cnFot/PUmwZA/rSfLDAGVDaT/YC4FXm5ptEz+B5CMeFV2kiCx
         Qs5ez9ObH+Ro0iZ/J/G3Drs2VNQ9fOSK5FuPJsoRf8xwNsaaajPMRLdme83ctczNg8sH
         32Ah0V0dL5FeNWiumndDjxdAFw3BeEnHKorMA03YN6BLt7y9BE+iOvNi1/eaQQdSZpiw
         LFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLslLZL19zaGRIt6pgfaNnyT4Rd4RWFz5GUZQeF6Xz3Eqsyjm08VwVmjDhIEhFD/3mdQzKxsHVU3je+oCKbFFmAmoFE0mRQQSO0rlonDrq9uPAdDEAjdeOrkkpHDrJLts=
X-Gm-Message-State: AOJu0YwekbIg+/zhoeer7TBHla2u10Xag9bG4lfOnvL4V4161NP4rI6O
	TUzuEQJ35bmSCm182wtEIZdTqd7zGBCGmLLljYu1BMkopp83Dq9bABqSVl34
X-Google-Smtp-Source: AGHT+IGvYq0XUQaDgo2b1zhaMjoLQlam8cibWHn5GgbCoSKj72iq1ZAvahi0NkyE48N8bfPt4YQ3Fg==
X-Received: by 2002:a05:651c:b10:b0:2ef:26f2:d3e2 with SMTP id 38308e7fff4ca-2f3be574b20mr115566071fa.2.1724164207760;
        Tue, 20 Aug 2024 07:30:07 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b7729ca3sm17564031fa.124.2024.08.20.07.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:30:06 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 08/12] hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
Date: Tue, 20 Aug 2024 16:29:45 +0200
Message-ID: <20240820142949.533381-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2Y/mYL7/8TiO

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Rename xen_arm.c -> xen-pvh.c to better express that this
is a PVH machine and to align with x86 HVM and future PVH
machine filenames:
hw/i386/xen/xen-hvm.c
hw/i386/xen/xen-pvh.c (in preparation)

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/meson.build              | 2 +-
 hw/arm/{xen_arm.c => xen-pvh.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/arm/{xen_arm.c => xen-pvh.c} (100%)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 074612b40c..4059d0be2e 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -61,7 +61,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-e
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-stubs.c',
-  'xen_arm.c',
+  'xen-pvh.c',
 ))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen-pvh.c
similarity index 100%
rename from hw/arm/xen_arm.c
rename to hw/arm/xen-pvh.c
-- 
2.43.0
