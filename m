Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931618ejb;
        Sun, 28 Apr 2024 20:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLlPK8+d1+E45ReCClbKv3nkafi7EYgXIDafraBbwgF/EblLYScyke5ex8nWikKLV6+DXfAQg/kq6EKJwTWcbeupIaeiP8
X-Received: by 2002:a2e:3513:0:b0:2de:d00f:e656 with SMTP id z19-20020a2e3513000000b002ded00fe656mr6135458ljz.37.1714361074674;
        Sun, 28 Apr 2024 20:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361074; cv=none;
        d=google.com; s=arc-20160816;
        b=0aXqdMyteghND63UvU+bfs3k3Gb9B9qLxmXvNqwsQbAQRWo63eLxlWIqQtPtnyXA/B
         y9MgUR9/mitCX8h03xaBgzsJEhtDdl3rGDm7QdV+s4BQTA/P9OAjhT1naazmInrCPR2H
         SbxsUbSLjLUah5BzUj0d4y7XA9pj/d3O1NOMbv19V5isikyNLMge1MD8/BixQ7RPZAj7
         eAvMUyS9Mfr1foMdihFgjcDg3ticLYV3esJDL1PKVkRs/5FrPbmtp7XVIQeUUU1bUXpx
         8DRgovUEOJZOT9Br0j9zq2URukVqvn22EkHwDXw4K2WXfx9yqRaPK5t6vgYsB082dWKf
         YJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=t4fDtAqBHvik6c00yf3CE8uzzU6Ock9eQkwSvIwh/JI=;
        fh=yUw+T27n6W27C4Z2l3KvhslDxkqZgWuXJLLXB2xlKGU=;
        b=ZM+4AH/n7D2OPX5DWxQjParvkJbLIiTIGSWXepdy6B2Fld12pYyy4KpOn3btftGt55
         EAZn9wkLsftMZLgnX7Hr7raYVRB/NRXFBj8pzmBFkXuSKtDwm7X+QfVqtvU2gCZDWTEb
         agHwXuiMfUdw+hcwiiqd/5n+yDqHZOs6jY9CzNKQ4D7fsTW1CG3u3vAjTmaG/+NncRLx
         rDew3VURTuI+kdrBslA4Eqa+ckZzXfuRrTs4sbfKvWUTXOLVX6zCEYrKBYIb8Lc3W5Zi
         dBpEYZVqZagySYeJVaY1ALoKsls4bJLk5GPfwiiFinvZJWLgmIH4N6+jCnGbV5pSVs4z
         14DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3TDhepDm;
       spf=pass (google.com: domain of 38hivzggkcw05z156nsnt11tyr.p1znyra.or00rryv0n41.14t@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=38hIvZggKCw05z156nsnt11tyr.p1znyrA.or00rryv0n41.14t@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <38hIvZggKCw05z156nsnt11tyr.p1znyrA.or00rryv0n41.14t@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id p26-20020a05600c205a00b004163a891f52sor7060428wmg.7.2024.04.28.20.24.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of 38hivzggkcw05z156nsnt11tyr.p1znyra.or00rryv0n41.14t@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3TDhepDm;
       spf=pass (google.com: domain of 38hivzggkcw05z156nsnt11tyr.p1znyra.or00rryv0n41.14t@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=38hIvZggKCw05z156nsnt11tyr.p1znyrA.or00rryv0n41.14t@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361074; x=1714965874; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4fDtAqBHvik6c00yf3CE8uzzU6Ock9eQkwSvIwh/JI=;
        b=3TDhepDmfqXMQczHD3MFEiENeoWx625fqr71A0dPRsG9b7Wku3m0WffCK1rnWUCEb6
         bGjtDnXSoNUVz4SOJXibq9g7KvKgEPpffbol4t4xVTeZUXTSew9Uq3HR8EFKVbIrVkZn
         pFEVos9BGM2Ba6EdKzssY6P19lDECpwzVuEMZOYOrzyV9HqLbqGGJGP1IB721lIq0pQC
         cc1PCoXLMnAkP6L+3oSAJot5irAmRmxBB6lZDNVmU9Ls6/RIMsP70Ub69E9z2f2Ps4FB
         DZqd2x2JWeOhHTh9vi+/zIyYp4ZY12GqVpnMdo/n+RyzaU198TcK7AMO0Pypkc1t5G3V
         qzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361074; x=1714965874;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t4fDtAqBHvik6c00yf3CE8uzzU6Ock9eQkwSvIwh/JI=;
        b=tSHHn/r0g1K6HqT48GE5qO9AsoX7XFZAEJKqh8rH6FEGZvTqVK8fEGAKtP8m/t6AVb
         Ip0OOSIO80yz2s3vGOCov5HS4Y6eNen+x4mzOYryJhYrWKGQAtpQH7s4VL38fNmKX8dY
         Z0ryP0wWYCgu89bZCNdV5BnKjWlMzYVEpQ1AmNioR2zJEEA3EviG1THrIFpOcFjK/o9K
         29Et0YaFD/2bReUordJhyoAwshYdaD66YX9hQocR1iLizWTX8Fiu216CEKX8LP4pP6Yc
         +GQi98JSN9S2HO8AHDfPYllqAu1l/YJj4F37QXe5eG7iZ8JzTDVSLv2eKbj5WE52/siw
         kg5A==
X-Forwarded-Encrypted: i=1; AJvYcCXfoDxg/ZloM3Dkusb3TXJLd2awtogjc1dgOkMW+Z3J+0KrqRe4TG/DTMVUE8mQ4c4qM1NbwMhQKxS4gpKYZOEOIrhrQtGG
X-Gm-Message-State: AOJu0YwVIEuFJOv95xhnoVFsNwZ36NUekZv47sKWDe8dHaSGkVXIZQvh
	3kWk5Aqh4KjhFkL3NMtYpq9crZ3WBxZzGYjb3gJMkzZN/Jm/Yy69hKRr6QJKkZCh8rzREoeTu2L
	g94VhBwGOzA==
X-Google-Smtp-Source: AGHT+IHTewv4ewCx2m33Lu518GlLek76sLkfFW/hEqOUcoHrf5P5HmaSPCpCKExWDpHRXQP+CcFHQkwLBZtonQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6000:1212:b0:34a:6e5b:6c37 with SMTP
 id e18-20020a056000121200b0034a6e5b6c37mr19534wrx.10.1714361074056; Sun, 28
 Apr 2024 20:24:34 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:45 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-2-smostafa@google.com>
Subject: [RFC PATCH v3 01/18] hw/arm/smmu-common: Add missing size check for stage-1
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WX2h9SWVJQzv

According to the SMMU architecture specification (ARM IHI 0070 F.b),
in =E2=80=9C3.4 Address sizes=E2=80=9D
    The address output from the translation causes a stage 1 Address Size
    fault if it exceeds the range of the effective IPA size for the given C=
D.

However, this check was missing.

There is already a similar check for stage-2 against effective PA.

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
2.44.0.769.g3c40516874-goog
