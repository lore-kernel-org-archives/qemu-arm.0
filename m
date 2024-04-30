Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3112466ejb;
        Tue, 30 Apr 2024 09:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXDhPWOHgBwsTOWf8YkO/g0ne5F8ZFiXHFsSvzvfZginWhYixTFc0YgBHy+RZOBbf9lT6HrJESPRkrTBM+UkAfkyZ7B0UN
X-Google-Smtp-Source: AGHT+IF5eYaWuPZJYh5SeqCIa1wVdohK6Gg2BRbRmsnIX0xRYQpjJOA98rs9HQAjJX4OOvGoBMjm
X-Received: by 2002:a05:622a:47cf:b0:43a:71be:f3ae with SMTP id dp15-20020a05622a47cf00b0043a71bef3aemr5249245qtb.29.1714495972346;
        Tue, 30 Apr 2024 09:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714495972; cv=none;
        d=google.com; s=arc-20160816;
        b=WpTLI2D+ZBY7YdrABf1dmrMr9fiItrrGEdYUgv/w8HTgdGI/Dw4nHkxc2YCXmszOwg
         v9F7oKcOMsZBI8bPrDncFeTHTnC46wc1X4nlenogwz0LiLijaaA1w7eDHSC6ZMzOe/EG
         iy66/wVHotY6OZI4nigs1PzOiRYmYEiu+WEea0PLCa8Ga+Gvq6jADizBTECu63+ILu63
         l7Id9Vt1ua+G+wHXASQYHsut+KG6xkse6gr5xb3ynN5ivh3IG/owxhsZ+clNBD6vnmqw
         AvGa2GwJEvSZnzMyWUcE6+Wxz2G4MicZzpdBkXiWSk+bTHIEHiKGnlN1jFZSfAohpmxm
         H0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hzipat9jfi0juaK8DzS+Vl1mWo37mk7jTOq9poKtbag=;
        fh=btbmNKSrcLPUl3bGKSUuH3WOHnOpIlrZfUYX1wxHWLY=;
        b=jqAKWkrtOn+aR0igQ5S4z2Uir8oh9y6LPfbd2pDYTH/CQa8kbT41s6eu8UleGlmdFT
         w3UE6b1yEB2Ftkx83//KC83k/5NzzqfAKK+Xi5S5um077ZLNuwk3AdiWK7DBsac5s8wy
         E5uXzLkUVmb07g0oxDFqG6O+Q/4cUGyu+0STnWthLbQ/b3XHW8cx3fJFxn98txF3ieR+
         FsAKAXMY/6CA4gBvkUMuYpHU04WlRWTlNlzNkxhYLckWNXstWRFsxBs5/ONW/F0iAVS5
         /2P5Dna3qlaOct/3XsbMD0tt8EU1mgtFN0K0RWtaVcJk8VI0bYZssvrT29EZ5AsRfFZt
         cJEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=eyp4yrWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020ac858c6000000b0043af4cea683si4579429qta.244.2024.04.30.09.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 09:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=eyp4yrWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1qhc-0002o1-Pe; Tue, 30 Apr 2024 12:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1s1qgl-00075i-Ti; Tue, 30 Apr 2024 12:50:43 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1s1qgk-00066Q-3n; Tue, 30 Apr 2024 12:50:43 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2db13ca0363so95568181fa.3; 
 Tue, 30 Apr 2024 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714495840; x=1715100640; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzipat9jfi0juaK8DzS+Vl1mWo37mk7jTOq9poKtbag=;
 b=eyp4yrWJ3EK3PlXaY7Z8w9cc9tNZdj9yTSZDBKynFcBOAniFRHRGZ/Dvt5JNjIhKym
 NMwHb733HRfSALHk8Tkh1kHm4m5nLNUH31/53VVXuWYWtC0mfxa0aYqNCgmSBXa4Xnek
 mNbdw1RXAS1lSr/YG4Bp7URrnXLJy1nX7/MXkA5MK07iPVYAIDnsrc+KKQvs9hz5C286
 +OQ2u0pTFqQEjNGhvcbHKBYqu65/nf6W+MJrjoDeelAQ/X0wG+O44KKiz7p2G1gOT1O/
 q7FZi/PuGbr/bJfuhudoYtKfRrnoUQ+yjuKEqn7CcBXvQh4mn2C2LtLN0gGGgiS15P2r
 CCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714495840; x=1715100640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hzipat9jfi0juaK8DzS+Vl1mWo37mk7jTOq9poKtbag=;
 b=fQcY8NNkayUY5rTV23s3C5nu9JoWhkfe5+tQsAIgqyR0KzF1M/oLS70l0JLH27JYHZ
 CkydfqPax9D3TS+F86OvF/Jy/D3LXxyQMQYDasw1KLyDtUXyVOjMQ3wEzW9QmqhED13L
 2oh7L9zeYn145qww/AaHQ7WWgulnKsga31YxakAek7aH/EdWo9zyW0JX3VQbyuM+dr7t
 oCZ8DI2pGzLFJjXUNNuk+uRP/x8XfqoPxyBfzR2f6oZsJHaenJAcd8RJo555hSocQCwM
 O8a3b1I4I0PGHLUMt72XojAyRhMkwN1HMwLik10D2is35ytVFyJuRRQ803UVMr2DvOGy
 iRSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHMchipmxIb6VMi/cEdMdiImZd659zMGLNvXukmKal8q5fbUxO2dVxiBaPsp7jblUvlq6u9N+795fFXdqaT0Xq8WEy
X-Gm-Message-State: AOJu0YxycYJar5i1RzSGfFQcWV11zFfG+wFBR47ecIyMcNm/+VoN2yYI
 Hl2dyukx94j2mBsYztKDs3Fh00OHvDMP56BI46L+nDLz19sHnNdjpR37iqOf
X-Received: by 2002:a19:ad09:0:b0:51c:732e:4e1a with SMTP id
 t9-20020a19ad09000000b0051c732e4e1amr26295lfc.68.1714495839514; 
 Tue, 30 Apr 2024 09:50:39 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a19760f000000b0051c144062eesm2198113lff.273.2024.04.30.09.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:38 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com, sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 17/17] hw/arm: xen: Enable use of grant mappings
Date: Tue, 30 Apr 2024 18:49:39 +0200
Message-Id: <20240430164939.925307-18-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: e+JUPPcXdI0V

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 15fa7dfa84..6fad829ede 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -125,6 +125,11 @@ static void xen_init_ram(MachineState *machine)
                                  GUEST_RAM1_BASE, ram_size[1]);
         memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
     }
+
+    /* Setup support for grants.  */
+    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
 }
 
 void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
-- 
2.40.1

