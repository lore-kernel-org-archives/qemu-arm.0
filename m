Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp335505lfo;
        Tue, 1 Mar 2022 17:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYlzFeahP2ESEJZnNAOZ4VabyLmjyANWQGq+ILRM/5CEn/QjMDsVCEMDW6qy5sAbPHS5Jq
X-Received: by 2002:a25:2f84:0:b0:628:7312:e37e with SMTP id v126-20020a252f84000000b006287312e37emr7437607ybv.495.1646185882860;
        Tue, 01 Mar 2022 17:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646185882; cv=none;
        d=google.com; s=arc-20160816;
        b=ntd60J92UJjFaUwtnHD3qMrH9U02GDerBgFhAJmsP6R4Y0qC366g3jr2LYFF31GHuy
         A1HnRaHOLXjNj5pxyv2LByDaycL6Z/6ZWe+mcCZHdIXBKpWU89H6ELthS0PvLWtACKhf
         TxlAydFttoyrjsIj9cNS3yc8c2GEB/qjsJU81HZvdjWMKfqJkAPSN0DpV/EXAObFoQnm
         S1HzG5iLchC84IT+HCVE0DV1zsRLDS/v8nidKsNuP6KLTgulOYUxpDh7y4oqzKOA7/fW
         VlC3XO2RdHUK5D8fhR++NHK5uN89Ush0Fzk/WTmdLeL6SjEvVjChVnWjD7l+RwVGa238
         TiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
        b=m7XT58lGcEdkDwuzgmvVd3k+J9j/a0aaTvZAFNy7V/UbKK2JEhO3xrJBALB69ps+8L
         isycrBUO38iMHtdugWKlbjF7a0fwdY+KQ9Egzz6CQ8YtbyE3UfH+BV4FjOA4/QS6pBkb
         luFbIpqxA448F5YaSni9MlRF0bqrbyNd+AnUKnBrIpJea6Eq2s5lItcGXJyQSuPvvsOR
         ZA5ZHZ0VtNUueUEykNmwMm7YxdSJtZipzaRsVdNPHLc6EEEPUB553otBujxENyYXXgYX
         y/OZP5+NgfC9VxEyTkoChgzcQO6MmUAqsaxSHGshOWDDIH/3BbV34A+VelQZIwB47gEo
         /AnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=muZibxf2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11-20020a056902070b00b00628771a6a1esi4554656ybt.304.2022.03.01.17.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 17:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=muZibxf2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPE9C-0007Mr-8z
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 20:51:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3i80eYgYKCLgrgrsqpemmejc.amkocks-Ypklmlels.mpe@flex--titusr.bounces.google.com>)
 id 1nPE90-0007M1-N4
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 20:51:10 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=46062
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3i80eYgYKCLgrgrsqpemmejc.amkocks-Ypklmlels.mpe@flex--titusr.bounces.google.com>)
 id 1nPE8z-0004ya-6M
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 20:51:10 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 n66-20020a254045000000b0062883b59ddbso178904yba.12
 for <qemu-arm@nongnu.org>; Tue, 01 Mar 2022 17:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
 b=muZibxf298oqgP//MOYsu0QhspwgRNMM8vkRn4vvB7vgRQHKIzCmCC3uU4FZ1vofWp
 KO4g98tDJ+gja7v0FznfIjKaanStB0xifyxM2PxVW+Do0vqf+yC5L44ZwK7FVt2Gr1at
 JWYi3ybZ7lmxjUzeDSgKYc/JkBZ5lkwpAZSm17eNdztcmvQSgrv5D97vFz0pNa/P4FPc
 XpvQvuOeAF4Nf1l7fGXLq0hzITvNSAIVqjO/2ZgTLpOTrPgAGEjG+jW+aVejWGm1+CHt
 JYdkQC+lp89bqpWofbjKCLxOGZbv4GgqK3pHojV3tYZBxw3ffSy3FDFABs/ZaDA+kIjO
 xIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
 b=iM/57Uun2A7/vJDU42bSAn5ZqpUkLmrlHMhGx/H4XqYdqjRYOBF7KI+l4/Gre+y8md
 +xDx7RN9Kkp5EN+XIPrKycqXjRxt9N7SEJvu+cxL50BLDLtu1CbY8OmOX8FpPL5DaCnc
 JBkqlwQcVTghmI6FZh+/j7oT94iCCJ2bIxjnDLKNstSAOZDJvHBS8F+buOivuzZsHZ5L
 miP3Re4KncC3MENB+vKnVhG2+6kMPPaEbJsJdLLRp/F4dRy9EAOFjo0akS0fKBO56rFd
 pNdA3Gkx0KweJds/h6m4nqJBS+Zbb7gCDaV2S26dGrOSOjOsUFD/YjzadBNLmzxZPXkE
 rQ/g==
X-Gm-Message-State: AOAM533FSXI6zks4Z2jWaYCkDTFU5O1HjVE0rdV3gK4/VQwLMOOC0pLJ
 XTkBlKYsKZDp4cCmN3vhYs7NIL5ktyk=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:b18e:0:b0:624:62c1:be56 with SMTP id
 h14-20020a25b18e000000b0062462c1be56mr26991882ybj.624.1646185867848; Tue, 01
 Mar 2022 17:51:07 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:47 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-4-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 3/9] hw/i2c: pmbus: add PEC unsupported warning
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3i80eYgYKCLgrgrsqpemmejc.amkocks-Ypklmlels.mpe@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wcHFi8Ilp5K+

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 93c746bab3..6eeb0731d7 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 
     case PMBUS_CAPABILITY:
         pmbus_send8(pmdev, pmdev->capability);
+        if (pmdev->capability & BIT(7)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: PEC is enabled but not yet supported.\n",
+                          __func__);
+        }
         break;
 
     case PMBUS_VOUT_MODE:                 /* R/W byte */
-- 
2.35.1.616.g0bdcbb4464-goog

