Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E41ECA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 12:54:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut428-0002Sp-Eb; Mon, 01 Sep 2025 08:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ut424-0002Ov-9D
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 08:53:12 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ut421-0004JD-PB
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 08:53:11 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b03fa5c5a89so247201266b.2
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756731188; x=1757335988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3i2Eag+k7j9y13dUOQK5hZi+NdV8CGfRchfnzsO2Kps=;
 b=Lb/Ukn2fWDTRdiHjxnglpcCuSX3RLALdZ0fNBUAfCf2q40xaWQ6DtPPRyK+zrkegdt
 PEvgnFPpt7gL1a3H59TkGSQDYs+7jmtxfateHR6moPD0nOr4R9zu1GEK22GpEStHaV4x
 i5zx3Q/oknH1CkE5kkxqPoozKAHxAMRCltzYYF3eW4M/V/2MdTqVGwc0pnz1zR9FoImF
 kwTobB2FwfN//5uwIiCryE+xULcVvmscXrTjmswHfGwFuiIU0qX9Dmvjwo3DM1VrWdKp
 /LFciXwT27U1FOg/yA3KrhjplRUh6/ait1OjPdrbju3fTrFd705sPmEIIEf5ngbRIbPh
 O8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756731188; x=1757335988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3i2Eag+k7j9y13dUOQK5hZi+NdV8CGfRchfnzsO2Kps=;
 b=VyhbcoOzX47p9+Wg2CGkbSmXAkpRU95MOA9BrI7bY4uIXobEeGH/9j6UxU1xW5mGyj
 I7x625qa9+emYehR/sMQL3pQ+d7S7Jx2SSLAjkJU6WMMNOCxZ5A0co6sBe09KgBS63nI
 brngdNRVOCRJmk43aXonUaFEJlGqVTL7Kj/1eEjXP954ZM0VxZEwjQFy5aEByfmm3J6L
 EOeiEm6xgCe2HPPBusbPCZHW0Yn+r1SVSRxcbEl0BCNUEJAxa9OrdWvFxlBauuDRRHC2
 fiskDNWTPJyjVKxXXeDco6bmsOjIlscT3l5u9x3g1hhTjiUeCJIYUqE+NMXj9JEOJtAC
 NE5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbHLxBLrcuQ6Bu1PLXyuy8dUNRBYTnBJSgFvZfxG/3bK+PI4DJLjacnNzzL8LEW1Dpec1tIMieXQ==@nongnu.org
X-Gm-Message-State: AOJu0YzMh28HlekpB1sgnyWqMs25N1HeBa4ltV+C7GsOMOmN0b0YHU7P
 /DpE5WAKsFPt6mFFQL+veQrWz6y+4Vl9j/CtIanzXW2KIInIPJ/M1YI6Dp2sKpohUTIDr0pmdni
 evhKDlso=
X-Gm-Gg: ASbGncuaxBNNUwcHpf7FC1O1B+EDqypZM363xC0wEYf8b49gxisNtEWKg9dvQalFkJs
 ED80CDJpbj70O+BWWGn/5khs0c3IDeQD0N3jdORl83yA8VITw2qlJJkku1IgQeWTIJQEhCnPS5x
 gOGa8QzSMNtyggviYmSCwJtW28isVOa1AUCCgILazpyWzJHqokIYmyWCRCAIpcraMTMqFYUZdsc
 KLQVI1PeE06a/ta8V3TnEA8O7cOTe+KFJHyG0xULnPOdRu2wzWNxPDnD7J6r47IBjJDxL89BPZF
 8CYTMb2h19M9I3SpjiZDDrz1SVXyFFvXKUm268rlMSb6NiBaEAGKQkigT52EPh0+jNlCM+msWQP
 xWcMgkcYhkkTlMweazdHXtaU=
X-Google-Smtp-Source: AGHT+IGqt0ogGqxj+izrq1zJvuiUR1IrPzKUuoY3YElHWhJFmIL22cW4DdFz8ymREILKQFynnZ+VKw==
X-Received: by 2002:a17:907:1ca0:b0:b04:286a:2fb8 with SMTP id
 a640c23a62f3a-b04286a4b87mr417188866b.56.1756731188009; 
 Mon, 01 Sep 2025 05:53:08 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b00bab3ef2esm609931666b.11.2025.09.01.05.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:53:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4484B5F8D8;
 Mon, 01 Sep 2025 13:53:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/4] hw/arm: use g_auto(GStrv) for node_path in arm_load_dtb
Date: Mon,  1 Sep 2025 13:53:03 +0100
Message-ID: <20250901125304.1047624-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901125304.1047624-1-alex.bennee@linaro.org>
References: <20250901125304.1047624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This is potentially more of a bike-shed case as node_path will persist
until the end of the function.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/boot.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 749f2d08341..f9d0bc7011e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -520,11 +520,11 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                  ARMCPU *cpu)
 {
     g_autofree void *fdt = NULL;
+    g_auto(GStrv) node_path = NULL;
     int size, rc, n = 0;
     uint32_t acells, scells;
     unsigned int i;
     hwaddr mem_base, mem_len;
-    char **node_path;
     Error *err = NULL;
 
     if (binfo->dtb_filename) {
@@ -586,7 +586,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
         n++;
     }
-    g_strfreev(node_path);
 
     /*
      * We drop all the memory nodes which correspond to empty NUMA nodes
-- 
2.47.2


