Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2056056ejb;
        Wed, 21 Feb 2024 09:17:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPRphp0xVDZXjEOxSjMAwDdiYAEMYw99aOScvqqTp/TP8+MIaczEjowa7w7npEsJeLWQJ1tpGIEUDYlwNtR14JQwLg39Kj
X-Google-Smtp-Source: AGHT+IGACWjlUWnEAf/zZQeAPm31WWLGSMEk0liO8qjeg5BIInGUqvaNFk98EhgoZnk4Bm6tiJ/i
X-Received: by 2002:ac8:5716:0:b0:42d:afd3:7b69 with SMTP id 22-20020ac85716000000b0042dafd37b69mr24274801qtw.63.1708535869836;
        Wed, 21 Feb 2024 09:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708535869; cv=none;
        d=google.com; s=arc-20160816;
        b=GHRsvqMk4dcp6soAhAS5EcZ574OwKwl3/wR+IroCwVJAtGOjTKUgJp67nr8ChbkDVp
         UVXnmZMrQ945yt5pup0LyX2+Rf7I/IM4SUelL9yLmV8aORMwGbPfIo5ST+RVuALx97Yd
         mXvaPb52CbuAcd0EDfWGD+tr4nO9Zt8Py74G+zLepwsDHXOUaDj0qPx+WpvYWkTzUDox
         MhB5Hwj3VgS7TkJJ0VTWdHDMTZpJJR4SlqtqCHRMZ+gIxzaINfzCpVilt4fhqnBVpmrp
         p6JWJQ7oTxlMTQA7XrA5KBA8TgIeCzVY7HnTTqwcieYw+FSq6HBC9z21s2Vmgioa7BDv
         62MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=X/FmD0tvEMB0vrU/lqftU698V2aAgtD4PqSjN/oj0ik=;
        fh=zNp2EAj9swJofbfdsbnPe/VjGAuGZFd12mWvXxWqB6w=;
        b=OIZoYHRiegqbSdlo+rqkPJ0Dy23UTd26q0SgJI9EMSDA299p9JTF7COHmeEIjFkCRW
         fcmbPXvP1Vf1CNmJvbhLCuoVSCPAJr5O93KHnC6obeo0GtPphA2YOQHh9zNrBmAUX0DY
         S7ctHymrXaYvqtuI4nL9Pe25N+FP/TzE++9qC51R1hwIdegL/3j2u0WodP35Vxg/urBR
         5KesMPba0dYH3VZ300mnmisQA7HHDkLoWyCZKpYqUDC27KsqkgYPyTBfKpUYJiL6+rdt
         bzEvr7vKIIxwWwuzsSmOAGrXfH1aD/DygSoEJRCdxy1571K3VXKlTXBsr/i781Xq9OlQ
         jyag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=NP0af65u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a05622a174b00b0042e0477a1b9si9170791qtk.357.2024.02.21.09.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 09:17:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=NP0af65u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcqDp-0000TG-Ha; Wed, 21 Feb 2024 12:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ITDWZQwKCBA3qryxu89uvq3w44w1u.s426u2A-q72343w3A.47w@flex--nabihestefan.bounces.google.com>)
 id 1rcqDo-0000SW-5O
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:17:28 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ITDWZQwKCBA3qryxu89uvq3w44w1u.s426u2A-q72343w3A.47w@flex--nabihestefan.bounces.google.com>)
 id 1rcqDi-0007iB-RT
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:17:27 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-602dae507caso113036547b3.0
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 09:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708535841; x=1709140641; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=X/FmD0tvEMB0vrU/lqftU698V2aAgtD4PqSjN/oj0ik=;
 b=NP0af65uwwiHhY/3RPZvgU8y9Tn/cVaA1kvRbA5wX8koklj09r1ZEHPCykW6pikKQ5
 07Jw4nX7mB38TXjR6HXcyp2m7m0ou6795wZPLxE8rU2eFaAvS3I4bo7+TYvMNLDO5Q0i
 eXOZc5Nob17Z2ySltYYFNnk7coZVglCiT8f+ia+iqn4VdgVrqEBmaQ4nWUmn9OHNgyjF
 Sn50UGosTPLNwwi/IQkTJKnY4m6LYHuqqeGW6yqbL56NCKJCfrGyJzVtt68fs4+zIaS8
 hNBqgbfHjtGYyyPQXBzmD/4ptw8wWOopxZ45d5aA0n40FB2LTyYw4FVJ7HXfuNPGsrbs
 mIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708535841; x=1709140641;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X/FmD0tvEMB0vrU/lqftU698V2aAgtD4PqSjN/oj0ik=;
 b=oxhuI9FVhpTv4vTbWFhbiZJXl6GEQZ2Og5MdtkgawjuKAR4f0AOBSkgpxs9GFcuuvx
 92unXtMMn3ma19GXvnFuKflXQG81Avmwc9EtlYl3OvRi7eo9EeiJXTTCxUYOOLReovcf
 hQ91w5vJsSd3ppjTYFzu8W6avpre6K0ww2MpHQ6VYAe+6C7R5fINNUxuWpgt9DBppHSe
 mCL6T5Zk++jlNMoeSHrqvNen0G0NcknknX1V7lVPvQagM6M0SiUiMik4X70hNC0SNhQW
 tVVMGGF9D8g8rpOpEP7eRRKV8EOcqYHiRmYMw3jth/I2AZulQosU6HosauC4AvCISu2O
 8e3w==
X-Gm-Message-State: AOJu0YxJN+9nMET+YngAyYeistGZOQTqvdypI10pbqCJPZaqDfOK2RsV
 aYD0lA6j21wcxwz/gMHPv6HvQOCUpRtulaIOJ6op9SZVBzPZcNtdQB6NLIuN+jGbbvCxjApca3h
 uuT3Ribjr4pkhPOw12wYwxos0bw==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:1208:b0:dc6:53c3:bcbd with
 SMTP id s8-20020a056902120800b00dc653c3bcbdmr4675123ybu.7.1708535841023; Wed,
 21 Feb 2024 09:17:21 -0800 (PST)
Date: Wed, 21 Feb 2024 17:17:15 +0000
In-Reply-To: <20240221171716.1260192-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240221171716.1260192-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221171716.1260192-2-nabihestefan@google.com>
Subject: [PATCH 1/2] hw/arm/smmuv3: Check StreamIDs against SMMU_IDR1.SIDSIZE
 value
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, eric.auger@redhat.com, 
 roqueh@google.com, nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3ITDWZQwKCBA3qryxu89uvq3w44w1u.s426u2A-q72343w3A.47w@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: D/p0HnbM4yy/

From: Roque Arcudia Hernandez <roqueh@google.com>

Current implementation checks the StreamIDs against STRTAB_BASE_CFG.LOG2SIZE
register field value and a constant SMMU_IDR1_SIDSIZE which is also used as
initial value for field SMMU_IDR1.SIDSIZE.

This limits the possibility of extending the SMMUv3 by inheritance and
redefining the value of SMMU_IDR1.SIDSIZE because the check is hardcoded to the
constant SMMU_IDR1_SIDSIZE rather than the register value.

Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/arm/smmuv3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9eb56a70f3..a01031821a 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -580,15 +580,17 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
 {
     dma_addr_t addr, strtab_base;
     uint32_t log2size;
+    uint32_t idr1_sidsize;
     int strtab_size_shift;
     int ret;
 
     trace_smmuv3_find_ste(sid, s->features, s->sid_split);
     log2size = FIELD_EX32(s->strtab_base_cfg, STRTAB_BASE_CFG, LOG2SIZE);
+    idr1_sidsize = FIELD_EX32(s->idr[1], IDR1, SIDSIZE);
     /*
      * Check SID range against both guest-configured and implementation limits
      */
-    if (sid >= (1 << MIN(log2size, SMMU_IDR1_SIDSIZE))) {
+    if (sid >= (1 << MIN(log2size, idr1_sidsize))) {
         event->type = SMMU_EVT_C_BAD_STREAMID;
         return -EINVAL;
     }
-- 
2.44.0.rc0.258.g7320e95886-goog

