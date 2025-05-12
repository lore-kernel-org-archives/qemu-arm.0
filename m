Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp43003njb;
        Mon, 12 May 2025 11:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKdMuk8SEysCghSFfxfBoDcLst4XgK5GHSLYew3ikJAGiI2ygyUiN2XBQ7xizyYh3BfppnzHWMGFYYmg==@linaro.org
X-Received: by 2002:a17:902:f68f:b0:223:66a1:4503 with SMTP id d9443c01a7336-22fc8b73d0emr172353195ad.30.1747073145260;
        Mon, 12 May 2025 11:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073145; cv=none;
        d=google.com; s=arc-20240605;
        b=kY73OPdDkz02XoadCzWVG7kPSn+awYbrpvFMQyxb1HSeXwikVE7w+jW/n09Tq/0PPj
         FsGiBE1XKUtPxlK8pgjZbjkXuaFtux5IX839cNQbKc+OtqADV9H5y1EuiUdkTJLXZLG8
         aZJp3a5oZ7qtBQGxssKTS995TDHiXhR/dyZCle4iLLC6fiwOWeJ/+Kfh50Qs5wdaZhMN
         FLEgHBFfXxxR1C5Se5CY/WwjAxu1/P3A73WAokdgvWRKdOB0OI8IMzk9SA6nSpptY5J1
         v/GdoalvomYYkGjOOCluq6PHX9x9mxAqAqLFlsN6d/MnA92FqDFPOzlaWcx0eX3UGN/P
         6F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        fh=aUC+WF8VRd3r4gzVyHnoMmyhqouDqY3MPdP62xyx/L4=;
        b=IQU8OUYM/fIFcePSEbBmZPXcEkgligpVlFyF5cakKkcV8vpbo/9sD2I+NEHV00HghB
         AOJzBMIS/RkZcZR9gDmDxb0ZDXDUD5tMqVtLuRiXcuA5vgnrUIwDw2Dca+jntcrB4cYY
         +pq7VRNuwiNyC4MalL97/ddko+t+K7+KxJ8xgNr3iNuQDL0SOK9kupruEXF/ibj+Q1vR
         XoQMU++r0lUVKTAevi+Y0nAs4Z9kvQDxNwow8Il2Xr2OPiU37QKMSFcnBSTr9zzQC1GU
         cR2A70BPd8hd7sGQECSgkk2iJY7O9IEK9wQ80cxsjOfKnK/LvwZusfIL+U5a5nhMD76f
         JT+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sZhb9Is0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6cf15fesor49826755ad.16.2025.05.12.11.05.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sZhb9Is0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073145; x=1747677945; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        b=sZhb9Is0uvNsGnDCxmem9pK7IXtJVCQtaO51HQq+qoczZvsLN48SNKUAgvi6eONg+t
         2ZqVQQTMhrPrF6QMGNo14/I2dzcuz4OY46mmfdUnwAFJhGEb4z15+Oz1aeRGvF5+3n+B
         xke4m5RdRB6m1qbvcACtySq0dVhm6Mf1GsqU2yAHH7OUldAoBtGNt1P5WuV5hKhlYIiE
         SVpvXj6opQTDo61D4yf/bnYQaLy5NsmQcSoOPDyuoUQRxaVCkNRlSjrssuf/dUqug+uk
         DYyAcnMsbuT98+pVaozk01LJfQnfhy2ZEB098dGKIsOOPiNZYqh3UWRnAyL+96ewQguR
         Bcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073145; x=1747677945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        b=R+T9g8lAO1pTl/IFur/bKfLZc8IrcHfe9ylm53bc7sp2gEEZ8yxkcdz8LL0bSKNhAt
         5s2Qvo4SFok4TsKXf4S7bOgBZWQshoQPsvpz71S9FmYudNxlwMbrkYtYVKkWAjw2kSFV
         P+rnTr5if/VO7OZYXx5CbM2ZoJj2Axpb44w8G16pk4pcZLmVQndU5uPpdTNSUcAKJfOG
         lsNrxJ4B12Ub/k5BjDBIVY9+fN+QPP9BBo9TOGsN9AAS4HoPBrTu3inAIfCJLM/g7HVN
         rYg0Yab05hWrklXU9Kmz/iQ1D0PKEeQL/EhgEqCbV3fY7S5xYd7TvM9XYeRmvhSO07tH
         M1pw==
X-Forwarded-Encrypted: i=1; AJvYcCWHmtozQO91WefKoimPOFVlbgKLqpLDZ1odLMeWp9JHMjjQLzsGWoCNIj+5WZp4zjQ0ou2gVprhPmRHMQ==@linaro.org
X-Gm-Message-State: AOJu0Yw0If6iXkJ2Vhje6hx1Qa6zwTraYUIouKapj2lOaBCTd69kmKCA
	0S0IYNBZNubKr4GRLGKcrGG4SqvtQU5/7VqY7LzZhBKSCmnCtd89DC4IM1cACLkuZQ==
X-Gm-Gg: ASbGnctwwLvhThRmJVi8Z8Fx1qUFbTWJEx1+VRA6eyy2cPECEk6bt8Xs53Y27Erqkh3
	3EQl6GtVKTW8oBawIfFkOQxBBoR1wz0C+/TYkqPkhUKHLmZrEo7l//4AZxV8DwDkAx5ovI3hKi2
	5ImTky0NDiLZ6t8EzmxxJKj/p5mpC8J/GEO/wGi9QZ0HD2Bi9Y74A9sTp9hBvySbxHKTMpxTpzv
	n7X3vv1T/uTtxwyNIOhJ6Tsnk7HVZ6ZtKemHnuvuYaavkeNo8NygUyNR+TrmmxpZQs0FTezWESP
	cbuuW7rM3jqFGipEZyYbCUM/QySdpDJ6muWWCZqtf6GN7PeV+Hg=
X-Google-Smtp-Source: AGHT+IFDzqcaX/0EytonVdOMQTT5ip0rYF097hL95/ujsWihHVjpJwlVBrnlb5Xxz7eOAPoupInNqw==
X-Received: by 2002:a17:902:d4cf:b0:22e:60b9:ac99 with SMTP id d9443c01a7336-22fc8d9c6bdmr231746335ad.34.1747073144748;
        Mon, 12 May 2025 11:05:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 37/48] target/arm/kvm-stub: add missing stubs
Date: Mon, 12 May 2025 11:04:51 -0700
Message-ID: <20250512180502.2395029-38-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XcRWzlQn4TDh

Those become needed once kvm_enabled can't be known at compile time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 4806365cdc5..34e57fab011 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -109,3 +109,13 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_cpu_pre_save(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+bool kvm_arm_cpu_post_load(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
