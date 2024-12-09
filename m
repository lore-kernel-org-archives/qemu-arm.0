Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2868124njb;
        Mon, 9 Dec 2024 12:38:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfRhMBHDVA2QuCS/g3iGmRHdwxCgAjQT3BWoL1EhZ/XQPVCc8Jtv7hicsOTJ8RI7Ne9Tpx2NjJrhMKww==@linaro.org
X-Google-Smtp-Source: AGHT+IGUDo7OqwdkjdS5UZFNGEqlOWcGfPxO3HkIewb7LATfFa3ldtRzWN+IQgxX1iD7HXYAk1Ri
X-Received: by 2002:ad4:5dcc:0:b0:6d8:8f81:e2e3 with SMTP id 6a1803df08f44-6d8e70ef424mr201340596d6.8.1733776730745;
        Mon, 09 Dec 2024 12:38:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733776730; cv=none;
        d=google.com; s=arc-20240605;
        b=Jp6Fft8HKr1GCALecniqW9dMCLI+RDDTV2zp06YSj7vCreLru/vguO5deR2TmIsM4P
         rXlDlhi4Y10UkJKQecPM2yrxGeZg8ya+a8Pk+GESHixsNMvZ4y99ozYK0Cu6lDkCOYGM
         8vsgjtYfLtrMYidNNycPSHNW9yK4nCObs7NKAO1gc0hsIgFBrSQAaSflHmnVOLrjTxYZ
         /xVBFD7DwRvLz3W6+hq/Ed0KFRLiONV8PhDMPuy+rxnY4LqmUHBZavEEXVrhKgOaOT0B
         aUJ+qKiivx/mGGEiMiPbSm9/mPvbh7yQZNfhHgv9vFjjyqxbx9/sGUiSDpk5w+ynZm3V
         +dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IDfEUP5t3qEfB5+/2Qs/ja/PBzmRbPZf8EVWTjWrIGc=;
        fh=bQkS108b468PDWrMlLdqLKWA8DzC4ZergiF0RQEBaSw=;
        b=X7H2hdNe65XDcmvxSX7U8EVaOWHK6zt4a/bj0+2FAgkTIVorlxpF5U/WtF3iqokXv4
         sd6Cqp/IRiFhHv5nifx3S8CnKo3k2SHdJhHNoca9E8YwIWH5qOPu2DIfpyGVxabKAZN6
         lO6kRgI9BwWwv+wPOO7B1y+jGFag59+N+i3FVuTy+rVonFdVlU4CtO/E7L5yR/TdZW50
         +rtA2m1arY8E2SjNLmJaMB+PRA8l+mUFvBbRkTkWAsJDlfo738eMPWNXsPHtcg2tuDFJ
         Hgj01SclC6lciUo6C6GkehlVLbsa1UjUx1ZtUMcEMooP+qEnb0ewSxJUULbm2J5RS6Yt
         D03Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=J+4Juwqy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d9081ac750si47462096d6.409.2024.12.09.12.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:38:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=J+4Juwqy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tKkVe-0006Vi-9R; Mon, 09 Dec 2024 15:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkVE-0006Iu-DS
 for qemu-devel@nongnu.org; Mon, 09 Dec 2024 15:37:12 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkVC-0003G3-V0
 for qemu-devel@nongnu.org; Mon, 09 Dec 2024 15:37:12 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so2271940a12.1
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2024 12:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733776629; x=1734381429;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDfEUP5t3qEfB5+/2Qs/ja/PBzmRbPZf8EVWTjWrIGc=;
 b=J+4JuwqyJBLIFpUlJf+k1RJFDlmTO2jp2tnxbO6P2rE4Cumv1nMMq/EaF0jzwJP1Fh
 Bw57UNf/M8cOishB4aSvIgRoAK7FGI5SOyCObsaSCXolqOTxWC2HRHxF0j61ADmyySCB
 bI9EKk/Weqlr4PNiVcDO2TyTmJuwTdzb9SVe9Stgfz9T8fw9Qu2D7JYM2c439nOO0bCL
 thsaxMtPNkvILwY5z11cG4PzcQw3PYjEfWpQvlpWegq2tR/G5a8XXvFSWLRXgWNzsdJr
 Zmdn+vK6gGHG4pm1NYdOrQq1R0STw+OBPDZyaDhfbLyimVDwrLarGPqlCqPV9LDzI7EX
 xTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776629; x=1734381429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDfEUP5t3qEfB5+/2Qs/ja/PBzmRbPZf8EVWTjWrIGc=;
 b=IF651jSxuXVTa6PIH0JxpVVPf5AIUapt5vVrX5p/nxIF8uWC7rTfVr4eADp/HC5Jjh
 e/eDoaywfF6tUbcnsv5FJ2oydykJnIjmTSyv9ehgebjR0GWDvw/s/FXUfBgXWakQfs7F
 1BLkdx2YyVQjvUYIlxXL8Q7u4PAMS7Qp3pUcTKJnMm9CzMuL9SCoAV6SvTWqM/BOa6XC
 DxRxd9mWXaW+X1C1xlh6+yiOozWap/TdnO7eGvRcRAADLf/WIjz9090m72mO/BJfuxbd
 kUxGTzgMRJPFXK10Eq8bZ5pXMxYj5J2ZVrBKs9YbtoVE6t99BA/m7vIiBP353SAs7bII
 U5Zg==
X-Gm-Message-State: AOJu0YwaRfYB5xLY64JtBSl9fGnz9VwUeKYqPjLC4CWDa0AlcYzJj2xF
 NfDIGoMGueIJM3AiawlfDj3jcjHk8kK8IxQb0NfE1C4PytREkNtNvEGzYLW1Yl6G7FvLJMvBHoW
 3Zg==
X-Gm-Gg: ASbGncvccQVy1G6aWLzKO3+jBAobqw9JUrfubR6KqXsotNxyvo132KBWR43EyfORSPn
 lCVJNHR790jr2wpL68hd4burJJc5m4g0tu4Ae6R+Lfd8czub3dRpjs+oJg/1+Mk0qf9Xyu+FE3y
 tXsW91qoxjBZEKeHUQ1xVM43HtUyUQAa0YAEZC61eZq7yUcJGDC8f7b7pLkz62cFHOz19jnV9hS
 RHGV0eEzwBC2d7CmpQyk19sNiY9Yj43dSs3t7sUQpyy5JPiLqU+BfDJK/jUFQyXrS702uUBEv9G
 HpLRU13Pd2zYHYOabeiqrQcAgYfExQ==
X-Received: by 2002:a05:6402:3490:b0:5d0:d2ed:ebb with SMTP id
 4fb4d7f45d1cf-5d4184dd0e0mr5226880a12.3.1733776629471; 
 Mon, 09 Dec 2024 12:37:09 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692e4e9d5sm141783566b.129.2024.12.09.12.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:37:09 -0800 (PST)
From: phil@philjordan.eu
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 10/11] hw/intc/apic: Fixes magic number use,
 removes outdated comment
Date: Mon,  9 Dec 2024 21:36:28 +0100
Message-Id: <20241209203629.74436-11-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241209203629.74436-1-phil@philjordan.eu>
References: <20241209203629.74436-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::532;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x532.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tK0pQMylTvjA

From: Phil Dennis-Jordan <phil@philjordan.eu>

This changes replaces the use of an explicit literal constant for
the APIC base address mask with the existing symbolic constant
intended for this purpose.

Additionally, we remove the comment about not being able to
re-enable the APIC after disabling it. This is no longer
the case after the APIC implementation's state machine was
modified in 9.0.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 hw/intc/apic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index add99f01e5..d72cbb2a8f 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -350,9 +350,8 @@ static int apic_set_base(APICCommonState *s, uint64_t val)
         return -1;
     }
 
-    s->apicbase = (val & 0xfffff000) |
+    s->apicbase = (val & MSR_IA32_APICBASE_BASE) |
         (s->apicbase & (MSR_IA32_APICBASE_BSP | MSR_IA32_APICBASE_ENABLE));
-    /* if disabled, cannot be enabled again */
     if (!(val & MSR_IA32_APICBASE_ENABLE)) {
         s->apicbase &= ~MSR_IA32_APICBASE_ENABLE;
         cpu_clear_apic_feature(&s->cpu->env);
-- 
2.39.3 (Apple Git-146)

