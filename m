Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800905lfj;
        Tue, 11 Jan 2022 09:10:53 -0800 (PST)
X-Received: by 2002:a05:6000:1184:: with SMTP id g4mr4762318wrx.278.1641921053187;
        Tue, 11 Jan 2022 09:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921053; cv=none;
        d=google.com; s=arc-20160816;
        b=HLT0iHhrcbiZQ6X9XudMKMAKdQoyFor8rwLkHcHP9XXEjAXZ19NrZUM9o/Gl3cjra7
         9gYb7WyQQPRRYw9kmbcOZkt4/dJODJyazv7p0cheTk8yo5fEz3awVf+nGzaNTgMOztl6
         DZj7anQ7k2plEflIiX93w9wWtC2hvRX7zqmTsQn/uvIKQt62eNG+zS/oXrx2ouwD+GHP
         yrSQrZXrS3nPTZNDINc3e6X67XrRWYBP2vDPn4etI1HzBiGtq1wJoX9tQeG03QQkPt7P
         xkqSIsj4sn6nmWqjRQOQDdrDbu+tw1ICyGeqyXLx62YIDXoBLmbSUbyZ1grBnif+AEEk
         Nmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JYYFGFnkCFT6+fa4EaAq6TzfkXiIkABdM4xMZSz4G4w=;
        b=Ybyb68DEbFkAfXSNmfCojT+GDphr4kPFedpLyBd9ZG5K/I8yQGxmcEN+1U9Yn9WprK
         3pqgQ8zokD0qno3j4Nb+ff7TOKaAQlu7HXauyPmAZw/m/7LBUSNt9k90/okrNuIttDzw
         HqeMFIWD7p6xWsTNjLELClas4C+AwOzZML/mnXeGp1EFHeEz1IULPXpRRgg7UrLU/eNU
         3W9cKC4b91DFeyA9Ev9vBPvwZDNqMXW1e9VTgtD1TzBtxZ5ON4BlWDDmzdztt4oBTMVz
         BQQZ47iUVg8IyJ9uaVBal86pw5Qs2qjCQZluL75NKHQ3qzCUSeOQmLJnLxLNwnt7YT72
         5Z3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDCdAjWs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l18sor1289306wms.17.2022.01.11.09.10.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDCdAjWs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JYYFGFnkCFT6+fa4EaAq6TzfkXiIkABdM4xMZSz4G4w=;
        b=yDCdAjWsHofW7aXSfx2hOBhoDBo6vW8AltwWXoe+9zEI6gepGK5xZBVbP/XK58hGMv
         26YrTLZQsxGGFjYLFEdRpbZQg68p3rlxI2N9DHRGY9VQ/aCaWQfyKVhv2WdMB7VfSrpy
         MMnJQB2C3W71ALNxT8Jrf5G23hxVs7ecR1vRXn7Oe5lQUVdqGs4cAg9gnZwsONpAUCoD
         05Y0Cm2jkGnes1R3hiDNrzgxPJ+NxIBG4RTEbjsTeMpOMD9lvbKALalnkPaWwdEVXBOJ
         wagTEmRMOnvxmxcDqfxOaQBp9zUav5t0r8xxwhLgLHAWGL6onivzWn+oL/hJaPOr+Ja4
         V4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JYYFGFnkCFT6+fa4EaAq6TzfkXiIkABdM4xMZSz4G4w=;
        b=20PHRZVrceO5X3RChUvZZVaF8UZ082tQabttZvxppFw6Q7U013bWmx+UqRHE6iUcDs
         1mOD3akQwAYrW2DGnSSZqGEkSE8CPP6In/oK25Wf64ncQJr+V3wR/y8GIHW6cAJvYGVm
         5iHt2LHgBE1B9yq9zvaAltaxz5X0h4279C+C/pfU1vru1Y0VEwM+j3t78OuMx552LV55
         HyMR7O+Y4STFBaX1pf+SIAGWyxBmtig74xRXeg5huvQzkrcttf2EqixUKTZoEbANCDWg
         p4OrccyHqTQljizy0GXKWMw19jsTHktnEqATbFdXpIjq3OGMo1Ogg8m42zlDxJrRV90G
         WFYA==
X-Gm-Message-State: AOAM530992CyrJfXqtNOP+NsYsJTxZFMSkoeKAo1NTKHiJRHfTK1n2Mh
	7sCQsa2aL9o3zahWphr7uHYl2Yjt
X-Google-Smtp-Source: ABdhPJyx94xPengilqitMoTf/ROuezr2toRSHBVsJwv/GjhkudQF5+eH5bO/yMRooWQPpMPj7gWkbQ==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr3389055wmc.114.1641921052948;
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 03/13] hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
Date: Tue, 11 Jan 2022 17:10:38 +0000
Message-Id: <20220111171048.3545974-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Nmr7s1iAOkfo

process_its_cmd() returns a bool, like all the other process_ functions.
However we were putting its return value into 'res', not 'result',
which meant we would ignore it when deciding whether to continue
or stall the command queue. Fix the typo.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 5919b1a3b7f..a6c2299a091 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -678,10 +678,10 @@ static void process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
-            res = process_its_cmd(s, data, cq_offset, INTERRUPT);
+            result = process_its_cmd(s, data, cq_offset, INTERRUPT);
             break;
         case GITS_CMD_CLEAR:
-            res = process_its_cmd(s, data, cq_offset, CLEAR);
+            result = process_its_cmd(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
-- 
2.25.1
