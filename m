Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286368njm;
        Mon, 1 Jul 2024 04:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmHDXueyOspPb5hVFtNs25KjpHdR70+nk1dY9JsqXg4WzowmdWyZiuW6H5XzBQ3+8hl0YRanLtybnSsZLcOHLslRb22OI3
X-Received: by 2002:a25:2d0a:0:b0:e03:5bdd:f2d8 with SMTP id 3f1490d57ef6-e036eb5d9dcmr5378780276.20.1719831803452;
        Mon, 01 Jul 2024 04:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831803; cv=none;
        d=google.com; s=arc-20160816;
        b=T6Y2IuKhv6ih6EK9d7YC8yKEweDt5z8csovJDj+yP+4gop8GSEyWf1qqb5DKBakO4b
         0Baen5WrH2zh20QOhScEedfBbF9bSN5WaolkzS5ebgfaBF6iLoDexAyzMUiIEDQcFyYG
         Lqrhdf/I+dNO8BIJDhYETimRT/p5RpEW/3LRN7Ca+fxR4/IGRM9cQ1L9IJEd3fvjD7d+
         ePNriq1Tv3hhZblwh1V0B+aTcfGyR4JdrZ4gUg/P0T7BnP9pAq5FBLGk5KCOYvrgonZa
         zYWJVKmW6lYT8axKliW6EapqvubLLsgK0FjontIbdPRE6Jq0tiIFFGNbuEeYmGH5g0zc
         y9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=UfBJyxBJlX36JReOZrhuuKa8JG/QE6j++ZmqLb/7jGE=;
        fh=iJWXd2j33zqU+nPq7rLi/uZTN7maafJg1e9Lke/+DjE=;
        b=abEVzaMoQZwzu5VUjd7B5LfpKyOVUzht8uM4A+oS4Fdqjm37J4cuvHDl4uqlAkYIZj
         YwR9wVWtrkPLzJWvSgXJCLzQ98+DXjCCSWPdquTwYmcXV/sNXgJB5T/i34w1VI++axJO
         mn6jscnuzNvMfuoHhActIK1wEbfY9XRLGIdvk+V+/kse49yQn6wK+9B0WpPqBlApo2h6
         i6swh15KD/T9GoCG9YiBdx2T1RFjOqb70L2bCzS8I3hT4Cypx1+m/yRNsN0eqmbf+yhC
         ZjLYItiDFTvJ+zW7WSJP0kuCv+7udePKhp/Wa7R4F2EpIFRYklJW9c5Lh2RlnaSCLRNN
         1ejg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=X5wO5EEq;
       spf=pass (google.com: domain of 3-4yczggkc1okegkl2728gg8d6.4ge2d6p.36ff66daf2jg.gj8@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3-4yCZggKC1oKEGKL2728GG8D6.4GE2D6P.36FF66DAF2JG.GJ8@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3-4yCZggKC1oKEGKL2728GG8D6.4GE2D6P.36FF66DAF2JG.GJ8@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0353d6b042sor3757768276.4.2024.07.01.04.03.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3-4yczggkc1okegkl2728gg8d6.4ge2d6p.36ff66daf2jg.gj8@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=X5wO5EEq;
       spf=pass (google.com: domain of 3-4yczggkc1okegkl2728gg8d6.4ge2d6p.36ff66daf2jg.gj8@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3-4yCZggKC1oKEGKL2728GG8D6.4GE2D6P.36FF66DAF2JG.GJ8@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831803; x=1720436603; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfBJyxBJlX36JReOZrhuuKa8JG/QE6j++ZmqLb/7jGE=;
        b=X5wO5EEq6D0rd9pnkMSLd6Tfs+wWvzBmTy6jLCr0WJdjhyhBbk4qE30wPx1WGQV0Io
         QWlIXh8vECAl5c+FCN+WGnZtF2c6jpEk+QxIbPgci17IKNPzgVte8vGUxjdctMcQNTIv
         Bo4EvxtlNdvStdFm2c/gpTEuV4TorGmHhjcZOyxOY3lx3mURRli2T2wqhUmbKGSCXPWP
         4qTWhxPd1cXs2m5aAxpm0bBnDkZyw2GEjYxUe4EgHxYX5IAsgctaxHS5MuIbxAMUZcra
         QtnnapSpbcdkw92osa0gYf1idUbIqgMCxIrM8TtttzC3QC3mqpgJEv9QzzjB2FF6/Zy8
         7uiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831803; x=1720436603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UfBJyxBJlX36JReOZrhuuKa8JG/QE6j++ZmqLb/7jGE=;
        b=qRCbQ/ZfSyJCT7wH8om4ck4vNBtzxMLgJTO8mBMMbr7ryU18xHUYUDvrwKAB7CL/NL
         /Fc3wisobKs8ht1GbreRytJF3Jy70EOMPzzJ1/3mhkgMzOKKLWPCjHJ1LCufbJgOkfJN
         odoJBDmlc2UGgvNIV7v5R6rA+j1MOnOTwhD6cA3dlnNz6ZrRNBRdeBuvSA9QTUYEEzk1
         cHct/eNRikO1akIilRqokWimPskiYnGl67t4b9rc3tIzfZkrVm9YiJIBaODcq3XslrYv
         5ixH4a57x1KbuTRkaaPBnctpFRBSlifq6KVqxy5coDyERxxU2MhAwLvUkmeXqWJJUZOA
         GjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAkGVOFbujGnOwBnwmhL+adwdHfG61f6ilWlbidzZUbdTOnGyWiLSktgc/LkA8DyDRsdgOSGSni8wsNjkbXnzqpp0pnFuR
X-Gm-Message-State: AOJu0YyUDP2KdUi6Mt4AcsvW6D/jFZOpJjgVSVNr1ffsVHYACy8KMSA8
	abc0nLAYk97dfG5yfgdQTTQItH+dAWkNFybd3N6viXHk5XRwkQjFrX4yWqIIfoSabokiRYaG2Pn
	kNUH8K/SlhA==
X-Google-Smtp-Source: AGHT+IG/Fq2m8cESYu8kSPxryk9xDGzQ8B4vYXhoSYRAV11KJ6UaKbL/GvAU4MD78NH5G2gXWjssOCLkrFQKEQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1542:b0:de5:2694:45ba with SMTP
 id 3f1490d57ef6-e036e6c3acdmr558657276.0.1719831803084; Mon, 01 Jul 2024
 04:03:23 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:29 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-8-smostafa@google.com>
Subject: [PATCH v4 07/19] hw/arm/smmu: Introduce CACHED_ENTRY_TO_ADDR
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Xu8tnYNOs84P

Soon, smmuv3_do_translate() will be used to translate the CD and the
TTBx, instead of re-writting the same logic to convert the returned
cached entry to an address, add a new macro CACHED_ENTRY_TO_ADDR.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c              | 3 +--
 include/hw/arm/smmu-common.h | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index cc61708160..229b3c388c 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -950,8 +950,7 @@ epilogue:
     switch (status) {
     case SMMU_TRANS_SUCCESS:
         entry.perm = cached_entry->entry.perm;
-        entry.translated_addr = cached_entry->entry.translated_addr +
-                                    (addr & cached_entry->entry.addr_mask);
+        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
         entry.addr_mask = cached_entry->entry.addr_mask;
         trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
                                        entry.translated_addr, entry.perm,
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 96eb017e50..09d3b9e734 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -37,6 +37,9 @@
 #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
                                              VMSA_BIT_LVL(isz, strd, lvl)) - 1)
 
+#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
+                                             ((addr) & (ent)->entry.addr_mask);
+
 /*
  * Page table walk error types
  */
-- 
2.45.2.803.g4e1b14247a-goog
