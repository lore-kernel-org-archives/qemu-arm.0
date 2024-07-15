Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118011nji;
        Mon, 15 Jul 2024 01:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVy0GviNma16ZvkFRB559Y2XB2/Cv6EaYp9DJL5u+biUKA+EZiOszoS8tPw3De92SYhYcdFoa3fUKWLcCXM5kLpV0dv6Mje
X-Received: by 2002:a25:d30b:0:b0:dfb:142a:ddb with SMTP id 3f1490d57ef6-e041b178500mr21140700276.44.1721033135379;
        Mon, 15 Jul 2024 01:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033135; cv=none;
        d=google.com; s=arc-20160816;
        b=NOygN3MoyyK7vIPG9tmWolvgdJREXG06UOonbSAsiifnFPB4v0zw4lJolvukKgLO7q
         WvuqzWs0Gqfjn7ub7ilOgZTzOfJr87R36Qy1BKRbc0tmb5bRpgwGX76S8vUxpPq/k6sa
         VpALvUpoUsuK8lVS56Qz8TaBJ13C5s5dvlX/MTafTdjEVs20QJWvfyKmu95BEYq+pmoc
         4zSGz9q5jubKhCtygHg4LcFBDdcHbuU447Ab9Zei/Hql80SJRDbzu1BkBmJQNs4njZtP
         E4sAc0yZrwZjCe1dHty+07rupAIKONRdDYOMHgl4Z3fVGwQCNDl52KJAviZYuZCo6U3z
         W+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=efuWH9iEl5hVtqwexwkMil4Lcb9Um4BJHv2cntoMT6E=;
        fh=hZ3aCo2gX99/4UWomMUoibP/TRdlFtrVSxSb/A6Wgs0=;
        b=RrSJl98NhRlYdB56Ww039KMD1HUaZCtPEmKplQM85QLyUob7qN5LHrvFwbp1D68XMV
         965wgbenRyqiAgcqYLxsMz5GjxP/UdXBzQLinLyHFh1rAvgZjphoWeMGcXVBBrys3peo
         WZv6xT6i8OGxSRTlzelMsKaBivrQJmqrGxB9zMki+9IRm7mEvModNIrtQAzY90KDrwic
         S1d1M7Gk9o33Us/G5DMo7DuqAD4UIyZRJPjYEgCn8UXoBYvI7LIelKVnpvjoAKTx2pYa
         okSP98JC+K62mCDoGouM0qSRNxLVJYAOpSgWQ3gS9GpPg7Fp5mbAbrN2kxHKr2L+udDs
         MiMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="ryhQW/9W";
       spf=pass (google.com: domain of 3ruguzggkcwetnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ruGUZggKCwEtnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3ruGUZggKCwEtnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e05a4dc1fe5sor2194456276.2.2024.07.15.01.45.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ruguzggkcwetnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="ryhQW/9W";
       spf=pass (google.com: domain of 3ruguzggkcwetnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ruGUZggKCwEtnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033135; x=1721637935; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efuWH9iEl5hVtqwexwkMil4Lcb9Um4BJHv2cntoMT6E=;
        b=ryhQW/9Whk4XYmW6jobSUQtSyHNV9E+pFSB13b6jmSliVpE/PWBz/BJRDK+FDMwJ+X
         1mipTGLFPW7/ijTw+TfYy/Lmn0X1VKkb/f7Y43aHHbmnKv5yqVOtk3wKS2kiT04JdB6b
         2jrndjqeYHwzSyzdhaP3SvFkVR/v2oFDczEbOAZ8RbX8u3EHPhlYEwrpAu2xzCQF1n6u
         lAzFft0AXVyl3zppS+iZokcLSICbrCaos1P8+JumnxqAc/aZE5MX/XgX9Aup5QWG+2Xp
         fLFHtB2w/O1pN4E4phwicVkRc+zQ0z8A+g5iyCKjiCZNn9XGTiWpv8E5dxsHEOwFncbX
         3KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033135; x=1721637935;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=efuWH9iEl5hVtqwexwkMil4Lcb9Um4BJHv2cntoMT6E=;
        b=dFTWTBZAj1iX2WlVZojQsDyKMS367B1Mw8qgdxotUFsAr0jqrI/x7dWLZmXkPFuQI8
         bsEYsngc7gAMCmL+/FBoCxE+IZb0PDBGNRhGGKeMJmyt9LWwJ8XzzTLcY+sGBjjHvoq/
         KIUCKZxhGQElEPbzZP9u7y7TBu07A3CNOQJCa6U3/kSYVfPj+bcba5hOUGhbCP5tZ/KJ
         95EPWIq3lon9nAtQuFoCrHfsF/G6IAAahffkLALCYEn16iIG7w0Zal56Q7vqpxtACkO3
         K9aJhot9TTz36LKNYHRO4JDkfQAieRkb6awG8GImMzXv+bUvc+ZoocAi3KWJjamy94Aj
         Np7w==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZqgLWGDlVq+R/9mLOOvvndp4K4zwsCO5SEsnpP/XBTo1tnVAStXyPXPH0FuERAXeZNJZwkJ3VfhcR8lEcT60WaDjzQIu
X-Gm-Message-State: AOJu0Yw1xD+90TKu7wSDtbsjKf/MKMvIKwu8BV30DcvzuaTnJuRVggEJ
	v7dRdEJavI5XnJs+/Xcfi+sIrvjqda5sYoMHCjbWmuo2j8h6+49TJokrWPviIeM+A7BcMoPIIPr
	MElgDC1jdbg==
X-Google-Smtp-Source: AGHT+IECRNkDx3NAXrgUapXDLG6Uc0kQFBcXu+5LQvWLlm3BdoPhQmW6DGCjCxaUucD//bKKbJZhqppR5xC6tQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1887:b0:e02:5b08:d3a with SMTP
 id 3f1490d57ef6-e041af3e444mr46942276.0.1721033134922; Mon, 15 Jul 2024
 01:45:34 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:03 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-4-smostafa@google.com>
Subject: [PATCH v5 03/18] hw/arm/smmuv3: Fix encoding of CLASS in events
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FaH+5Q/Std1S

The SMMUv3 spec (ARM IHI 0070 F.b - 7.3 Event records) defines the
class of events faults as:

CLASS: The class of the operation that caused the fault:
- 0b00: CD, CD fetch.
- 0b01: TTD, Stage 1 translation table fetch.
- 0b10: IN, Input address

However, this value was not set and left as 0 which means CD and not
IN (0b10).

Another problem was that stage-2 class is considered IN not TT for
EABT, according to the spec:
    Translation of an IPA after successful stage 1 translation (or,
    in stage 2-only configuration, an input IPA)
    - S2 =3D=3D 1 (stage 2), CLASS =3D=3D IN (Input to stage)

This would change soon when nested translations are supported.

While at it, add an enum for class as it would be used for nesting.
However, at the moment stage-1 and stage-2 use the same class values,
except for EABT.

Fixes: 9bde7f0674 =E2=80=9Chw/arm/smmuv3: Implement translate callback=E2=
=80=9D
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h | 6 ++++++
 hw/arm/smmuv3.c          | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index e4dd11e1e6..0f3ecec804 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -32,6 +32,12 @@ typedef enum SMMUTranslationStatus {
     SMMU_TRANS_SUCCESS,
 } SMMUTranslationStatus;
=20
+typedef enum SMMUTranslationClass {
+    SMMU_CLASS_CD,
+    SMMU_CLASS_TT,
+    SMMU_CLASS_IN,
+} SMMUTranslationClass;
+
 /* MMIO Registers */
=20
 REG32(IDR0,                0x0)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9dd3ea48e4..3d214c9f57 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -942,7 +942,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
             event.type =3D SMMU_EVT_F_WALK_EABT;
             event.u.f_walk_eabt.addr =3D addr;
             event.u.f_walk_eabt.rnw =3D flag & 0x1;
-            event.u.f_walk_eabt.class =3D 0x1;
+            /* Stage-2 (only) is class IN while stage-1 is class TT */
+            event.u.f_walk_eabt.class =3D (ptw_info.stage =3D=3D 2) ?
+                                         SMMU_CLASS_IN : SMMU_CLASS_TT;
             event.u.f_walk_eabt.addr2 =3D ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
@@ -950,6 +952,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
                 event.type =3D SMMU_EVT_F_TRANSLATION;
                 event.u.f_translation.addr =3D addr;
                 event.u.f_translation.addr2 =3D ptw_info.addr;
+                event.u.f_translation.class =3D SMMU_CLASS_IN;
                 event.u.f_translation.rnw =3D flag & 0x1;
             }
             break;
@@ -958,6 +961,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
                 event.type =3D SMMU_EVT_F_ADDR_SIZE;
                 event.u.f_addr_size.addr =3D addr;
                 event.u.f_addr_size.addr2 =3D ptw_info.addr;
+                event.u.f_translation.class =3D SMMU_CLASS_IN;
                 event.u.f_addr_size.rnw =3D flag & 0x1;
             }
             break;
@@ -966,6 +970,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
                 event.type =3D SMMU_EVT_F_ACCESS;
                 event.u.f_access.addr =3D addr;
                 event.u.f_access.addr2 =3D ptw_info.addr;
+                event.u.f_translation.class =3D SMMU_CLASS_IN;
                 event.u.f_access.rnw =3D flag & 0x1;
             }
             break;
@@ -974,6 +979,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
                 event.type =3D SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr =3D addr;
                 event.u.f_permission.addr2 =3D ptw_info.addr;
+                event.u.f_translation.class =3D SMMU_CLASS_IN;
                 event.u.f_permission.rnw =3D flag & 0x1;
             }
             break;
--=20
2.45.2.993.g49e7a77208-goog
