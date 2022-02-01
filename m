Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660880lfk;
        Tue, 1 Feb 2022 11:32:20 -0800 (PST)
X-Received: by 2002:a5d:4005:: with SMTP id n5mr22752675wrp.470.1643743940248;
        Tue, 01 Feb 2022 11:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743940; cv=none;
        d=google.com; s=arc-20160816;
        b=njNhc/glFJUYL92dMfyzjlptXjBx+UQI8ikIGhkW6ymsvmeuz4yx8LsyEoqE6+6XaZ
         AORWK7ezilBW8f7dMlITYUgi2ZpDAZI7GREkOlIhSnoOAnW1CCaMCmlFOnTd845drsQJ
         ZjvjapRVO8fo/iV8OMvB8VTZUvshGal1z70XU6a4Vrf0T8Dj4kqJJJOJvwnvNHeW1TEc
         9yM43L2TlbYwYg/2BJQP/2KKo280sNQpDMOkAjxnYIQywPemoidhpsgMK5WXis2oh+jF
         M6poM4wvzIkfXF73UCHR0/eS4rPPWoWc8+ACQVwYeiKYW/LH0dT7Q62AC39xYONTOewR
         iowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PyoYFz0rNK5fksgWbnYb2wlrhqu+KYVYudh2oRoiZhU=;
        b=zxAsnon7dIq+6j/VSj4nnUZ7fmFnAnfKAYZgv9clxlgt9Bpzn3C+FBzxxj2lkWrul1
         JIFnpUiGZlrwBXZY+QFLL3BlESwaxcgd3Fkg/Ws6Awq5j2a1rey6pwOk5X33tgMEsql1
         UuJp/WdwsprxnuJtMIl7HEQr65WZEK/i45kOVxX0GH0p2zFoeFJ9SV/VZejSewAqRGWG
         o02mOJvQPgb1cdyl44FxrVPMjF8Lkg+mnjXViY/kMugz3/6482XE8NY7nGCPXKK4ot+x
         IoIDPSKsLk2wdEYrHlt4AkxwRfOnPP8nSaJimbxbH7HiYLsEx+KxujYXqAkYvXLRnRDM
         7kOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DRJO4rd5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m11sor6332015wrp.42.2022.02.01.11.32.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DRJO4rd5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PyoYFz0rNK5fksgWbnYb2wlrhqu+KYVYudh2oRoiZhU=;
        b=DRJO4rd5AVFypEImjA7KJFFGxfCuH6D6v8JACNPRmzBOEsGeMwFOmUmKEJU0UhV+Zq
         5jMSyUJM06eD/0WjLKttEfdnpxpnABPINsq/GYx+9BLXE1oQWLSD7azDdGj2JO13yeQQ
         dgQos0uFsG3ElJM6bXqnAxL4GjO0awqopx21nc8XI9Q1AM8bXoqWkswldPsxS25mnyK2
         Jorrc2DfcH7CAuK3eDCBgasnYMpZaHgUi+MWm2cHyri5s7UBWCJQZkgA3gEAUoYBUtPN
         CPaugd8AyiwJBvaVBWgLQb1YvxIlUBekGndKCLd2+qAgRAtuCpbEWL+gEGcSKBEWk/X0
         dUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PyoYFz0rNK5fksgWbnYb2wlrhqu+KYVYudh2oRoiZhU=;
        b=XEzdRQDTiYR+98NpTIVciG2n8HHZoTM3XmwgiAR2iWehNv/rGsuYxvxHuayuiKIHrz
         Bf5JPbzizTyQVexn7fHX9D/N8b/4sG/JURQNNQ6djd85KtemmDvP/i7Q+NcuA12BJK91
         WAlbCqmWpHyBKUaYnkIR3NfAmmzoavcTnXebWGXyVTAM7aKG2SM+yRqQ2swihOIhEU+5
         Cmw7MmZSNc9IUV2hUWABZI0bRCvYmxkHVu0Vn0bDO61fXqtOapuHrkPjewSWfvaPYPYI
         NgtNCfux+ff3xCf9nwQjF1WfwaLBkk7NTSle196518eagXprcwYH79giOl8jvCT+1rY3
         +Utg==
X-Gm-Message-State: AOAM532fFdT2wCGDu+0U0pfguxiftTZMtZEoMdR1klNob2fVs41mJgZ4
	sWJ83NNK3KB+vgXNOEhoVRoa0tnB
X-Google-Smtp-Source: ABdhPJygeBQuyX0J8zc2OlAfe+Y3XDaVTJShAHAQt+mmIOm0CG8UtQ2DcLiUlf7Sb1sXCrIY4wKqDw==
X-Received: by 2002:adf:fb10:: with SMTP id c16mr22693982wrr.200.1643743940023;
        Tue, 01 Feb 2022 11:32:20 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 12/13] hw/intc/arm_gicv3_its: Don't allow intid 1023 in MAPI/MAPTI
Date: Tue,  1 Feb 2022 19:32:06 +0000
Message-Id: <20220201193207.2771604-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bjgPTgCwqWAv

When handling MAPI/MAPTI, we allow the supplied interrupt ID to be
either 1023 or something in the valid LPI range.  This is a mistake:
only a real valid LPI is allowed.  (The general behaviour of the ITS
is that most interrupt ID fields require a value in the LPI range;
the exception is that fields specifying a doorbell value, which are
all in GICv4 commands, allow also 1023 to mean "no doorbell".)
Remove the condition that incorrectly allows 1023 here.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This one's my fault -- Shashi's original code did the right thing,
IIRC. The spec text and pseudocode disagree here, and in code review
I backed the wrong horse. Sorry.
---
 hw/intc/arm_gicv3_its.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 069991f7f36..8dade9440ac 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -406,8 +406,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
 
     if ((icid >= s->ct.num_entries)
             || !dte.valid || (eventid >= num_eventids) ||
-            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
-             (pIntid != INTID_SPURIOUS))) {
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
                       "icid %d or eventid %d or pIntid %d or"
-- 
2.25.1
