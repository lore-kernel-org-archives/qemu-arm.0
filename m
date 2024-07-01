Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286182njm;
        Mon, 1 Jul 2024 04:03:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvuYsvp6SZx4qWaNsNxPa4kszx0D5/A4JraxbdWB8n15jFN/4bkJgtKQgnHIc61dVZDkWj5GPvJlfMtX+oraxTSaZIazdA
X-Received: by 2002:a05:600c:4f13:b0:425:6290:b11b with SMTP id 5b1f17b1804b1-4256d58dc93mr74649715e9.18.1719831788840;
        Mon, 01 Jul 2024 04:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831788; cv=none;
        d=google.com; s=arc-20160816;
        b=GT1tMbbpZNJtfEt/BFSbprvTLj1cYQSpfLF+mF4cYFtIAHrJtr1wJcJ6DFMW/BGdb5
         Pc2s3CY+VkdnUmH0OzuBV9l/QdnvCpbgXngElLhGzNeXZ5JIO8vN2IEfQ16pKIho9iB6
         eVcEhgVGVVeqPVNl3Iw2jVDH3aMTNlyx5yIALhgbJvv/Am0+ERv0FkXpKvhlUmjGgKx4
         yT4wWcOOOGYmFZoObbc4SGe/W16idf7Bn0Aw4oFtPhyxMwXC95SDmuhxJTcg9D34PHRN
         +odVp3F1J2sG/IwTa4sC0aPoh5DsbY8bV9ReTEEgApI7S7QrOTmUJbkZuQYnMXeA9vhY
         LMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=qxpHwQ7ZLe0+eKBQXYl3PeRw1kiPzmlmXkdnv1EDlyk=;
        fh=qKmJp9eCKKRLBlemFoCZ6LF0sHvk47/if5gMHw7o2ks=;
        b=CYWOAa9nfQvlLY9Ro3PeKD12rEVLZ/5ZHiYvj6hH7UgEr8+O2jz21Yrf/vuPO4tUHF
         4BSR9e6jRBIa9bgH3GZuwMOls0lRWmLCOXqFvi7J/VPGMEbvZlmbdI7G9PVtxvc39La6
         IGmY2jSAn0+fUvMNJRfDeCZOhiWL8Z12xfzQ8NmBSI3pAli99awbC7y60el6beBWGUyW
         WR95W/+Bg0OQlJFwaxE2RLo1KhqAhWNQccfHxwUjsQXWlVrUVls3xyvk7BjoOEeZpkZG
         4Se55EMXRDwuUhSzjhszcXHnzAEJrOLlYBvRGyWrwuEl135+g5HU8aiI1bWvo3fWo0rq
         VUbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=dRdtjKf6;
       spf=pass (google.com: domain of 37iyczggkc0s5z156nsnt11tyr.p1znyra.or00rryv0n41.14t@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=37IyCZggKC0s5z156nsnt11tyr.p1znyrA.or00rryv0n41.14t@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <37IyCZggKC0s5z156nsnt11tyr.p1znyrA.or00rryv0n41.14t@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4257b77f974sor8548095e9.2.2024.07.01.04.03.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of 37iyczggkc0s5z156nsnt11tyr.p1znyra.or00rryv0n41.14t@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=dRdtjKf6;
       spf=pass (google.com: domain of 37iyczggkc0s5z156nsnt11tyr.p1znyra.or00rryv0n41.14t@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=37IyCZggKC0s5z156nsnt11tyr.p1znyrA.or00rryv0n41.14t@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831788; x=1720436588; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxpHwQ7ZLe0+eKBQXYl3PeRw1kiPzmlmXkdnv1EDlyk=;
        b=dRdtjKf6xzH8A0TQrTD75rrqobKOpLve+cXRYh6/5BFUSyxXh85ZZqHP3GWfjMuiw8
         yYmoE8yLEqAVNk5dqQ53yRiQ65AmHdWb9LNLwAxlW0CHrUjVhBsUSc8TH9N6ghbm5P5f
         qmTmQJ10fOmjUSAzj/z/qOtXpL9zfdKo9Cf9Z2GC0p4IGb7lTGTXtmsuTF0BTHOUlRTM
         s9xNB1JtBvPUoPlrGEEbf8nDF1aaOTwBKQnGR3rF95jwRUaTyb72vqpUt3Ex15S9Xwqd
         L/Ev6DpDbsLkza/Y5qWzUe1PUWbpRa0pEEFzPAWSbOwQ4ChFNsU321QOQx9LoSmIVZKF
         /Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831788; x=1720436588;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qxpHwQ7ZLe0+eKBQXYl3PeRw1kiPzmlmXkdnv1EDlyk=;
        b=P+kDBYsQv6RhxMKJM7FNGLLMZ+874EKdgM6YEXLBaSLMHhf3j61GQYGCMIxRpHLKTC
         yUwxMgil8PTooJY+gUxhVJ6WN1I08Bn+jatwH5y06XBAvACH8uwt5CpNXcwY1klFzv/x
         vfr1Aqs1zeBzwMISMIKot82vqNxC2EKNJwlczX5ZtQgls3FFMDSmY6h7eZ7cBPDgl6de
         M1lwR1+H722yRsf+K2SdEjJgeO0VYmYUWtmRWknQ7gPqMj44fH1+BxMg4KS11g07cO6S
         xkWsAaT3GZQ4/mP96SubyoZnRijtdUTfzO8nLORuCqw+c6RIwNHo15blHBJwKPUM910m
         N57g==
X-Forwarded-Encrypted: i=1; AJvYcCU+9ok6cskXeeqVTgNHI9wuGIa0V3NBTkc/ma2GSvlRo5POyasjUdqCG8y5eqzAqnGEuTODk9fCuBRoGDvay4KQF/NOqTfL
X-Gm-Message-State: AOJu0Yyj1ubuOTGSjlWYA9Abpv1R0j2R6Oyyiy2S8AS/RBHGd596Z4MK
	EV/LKUbKpuT8qPD14zuW5kI9qZaY9+sEoGH+g6r1sLTICzj/m0GH7BtJiFtOQ6mpxMHryrAPjY2
	rDk1Y1p/A0w==
X-Google-Smtp-Source: AGHT+IF8cxj1aSXEUWa68rT0Cuu9AhGmCho3GCpbqZvCZuxtG5rXVQ/+ZoV0t+qybSSVhA28kmzbKU77w3buAg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1d0f:b0:425:7ac6:96f8 with SMTP
 id 5b1f17b1804b1-4257ac6994amr138575e9.0.1719831788201; Mon, 01 Jul 2024
 04:03:08 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:23 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-2-smostafa@google.com>
Subject: [PATCH v4 01/19] hw/arm/smmu-common: Add missing size check for stage-1
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 4QtdWTgNmsgI

According to the SMMU architecture specification (ARM IHI 0070 F.b),
in =E2=80=9C3.4 Address sizes=E2=80=9D
    The address output from the translation causes a stage 1 Address Size
    fault if it exceeds the range of the effective IPA size for the given C=
D.

However, this check was missing.

There is already a similar check for stage-2 against effective PA.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 1ce706bf94..eb2356bc35 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -381,6 +381,16 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
             goto error;
         }
=20
+        /*
+         * The address output from the translation causes a stage 1 Addres=
s
+         * Size fault if it exceeds the range of the effective IPA size fo=
r
+         * the given CD.
+         */
+        if (gpa >=3D (1ULL << cfg->oas)) {
+            info->type =3D SMMU_PTW_ERR_ADDR_SIZE;
+            goto error;
+        }
+
         tlbe->entry.translated_addr =3D gpa;
         tlbe->entry.iova =3D iova & ~mask;
         tlbe->entry.addr_mask =3D mask;
--=20
2.45.2.803.g4e1b14247a-goog
