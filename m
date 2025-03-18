Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694613njb;
        Mon, 17 Mar 2025 21:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+0Bw8BD3hQn+S6/xHC1XNGlJ9QwRIh74IRvEnNjiC2zfredY1gYtzwdogzB4QUFcFxU0wEB9Uyk4F9A==@linaro.org
X-Received: by 2002:a17:903:228c:b0:226:194f:48ef with SMTP id d9443c01a7336-2262c9d26d4mr30525945ad.13.1742273500094;
        Mon, 17 Mar 2025 21:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273500; cv=none;
        d=google.com; s=arc-20240605;
        b=lbVXmKZ7qq7r4Z2ThuvRUKQOCJai8nxb8empH9zV+ik5xM1/3Du7vROj183etmjXu6
         sb0p1UlYw6eB3lVc7/dsv2VOZu2CpWAEdCbK1xmfF9bgNQDUtZSW2dtH/xbVlw/obcjJ
         VSTrsfaCTkbYT6qA0C2YtvXwTWq7QXfx5fqQkKHgkBrpabnNJoY2nYf5ZpqeVfsN2zR6
         8pf+oJZRQd+d01lpapF6Sz6UiVDxJOdaHXtiC5lV0lLOihHJ4CMdmtjd7RzdrU0uiFbD
         2J58n8Vjb5elhrvoyYoVTbVCMvFVXimMMpZpbM5LDIG6JLi0ivaLEz7bXr4o+iHDLBju
         9t8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=e9rzsv10o1w5kRlHax2UvpGLKsY+tUQFsRxZLLJXZ6E=;
        fh=uPrixYDp2qJ/UMzGBvkgQUY++9foLq4WM8nemSXD6qM=;
        b=GGska8thsVqSen0kvqx2UYCdXRKOdDB06hkX1My+K7mYJ8xg235mKE0rWNKaREQeCB
         mEz/XVOuXAvC/ye6ukxvwC0GRy2kCEzfJlb2ijBRQRE8LbBTBPQ5HjJR9XnE/Y9b4Rik
         ylc8UQMlcl2Z16Fj5noDMOQfWU3d9zxpQne2mnK7Zs9qC/hyLy7mTzDPq4IqPzscqqEH
         7P+y92A9TaXZWmN2FNZRHc79aJLluXc/NCVY4G91+f3VYE7LnGXimdUP+GwHMmBdPLZ/
         zMhJpQerEkBctSOIbIHllGF7fafRbZY8L3APaFNj/bkX7twCslBuQg6hkhbhsVmM3VBj
         5l9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VLR4xQ8/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7370ffc75e7sor5788743b3a.5.2025.03.17.21.51.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VLR4xQ8/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273499; x=1742878299; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9rzsv10o1w5kRlHax2UvpGLKsY+tUQFsRxZLLJXZ6E=;
        b=VLR4xQ8/p8RenhB/0W6VRT/PuG7ooX2p+87m2Bz+xaA/rBUEToOwaQUAxywdDjP68x
         tH3nJDMgtHo2PddWTmOf8KEVy7K3yLDeBPCC1GX8ZxF2jo0YL5aQAqES3gQABKolyMEL
         cH24QYjeovx+wOi1bLyhnm4jkACJfOY96mWebOUcmagfXbwkjJdco8vjs4nqOdlFgQKF
         UzVzOsH24l6CDv5zmN8tQ6VEAxxVAsitBlAYIzzSE714ml5UcMGsRlld/VBjg+p1/k5o
         Hc/10rn4oDByV1wEtjj01DcJqlK/nlRoE4atpKa8rsiWxpnKJbpY/OtcIazmpC0VX7ea
         2VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273499; x=1742878299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9rzsv10o1w5kRlHax2UvpGLKsY+tUQFsRxZLLJXZ6E=;
        b=LdXYx4q1/LkqEJwYbQkiQW6je6rSSuL+8WmgdF5wS5umjUsJKtV+11b+PoyCjgHDk2
         GKttOmQtJ0yXhP0jSZkuatXLGEdLsNAXvalOVLlonJNU+bJhw8E79Z/koOwl++0BcUB7
         CfTU+zhbj4vex84eGNBKJI9vdcAtcF/7hEPYkFBois9KGUtLA5kBgG8h2EhDgGSK1euG
         ZXuqYEVbXg1GPGdgiUgxI6cF7Ti9diN6uQMzJ4yam6KIDF6t6IaOzqGESFv8VU7vl3Kd
         CQG02tUZByhYSGv6t8LwncHLkl79EN7EHdKCcLzWd5yoc7+koYKPeTLxdjbZpf+B7jte
         LIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+n6Jr6Lktf2KMg/uurLnq660dMwDseZSQ/Nr3tCOcvn1yWHLZRZxgx/gXggZefLuzu0oPdulgIt1YOA==@linaro.org
X-Gm-Message-State: AOJu0YwxwmK3AJblxYceupvYJ+DlXjvmzrEFrHEnwzy7FHcyAkdlbvA6
	bYcpc6oBIjnBd7tGNN5+5Lbx4Ks45B6b8DhB11iEAkLlLpCiDGsAWnCu4IqcMuyzZw==
X-Gm-Gg: ASbGncvSDqq+bZrDZEn4IPNczjyT3OXfuhwJ/kiQZ//nsn55WF6HHZVXVcbnJRW+J3b
	KPadg+SMxH2VmlVNvN8OJRfe/dczxgq+M0p4OpNsG2bAdiax6SZ/CRvF2qt7np4zDLChdS2Asx8
	jI2VEAXPgPbReESECPLlfdIanQ2DLTGBYEbWk4p06hkuw2OgMFZGi1JqZypsUXMbUbDXJ+A2X4S
	Jyk4euFK09/Rysm9J9vKmuuV2/Zv8dpohvR0ZHvnfcLavaDvdfc1ku0zSwLjEyiiK8tLCS/USDl
	2eiwUog5YOnKc20zq7Wny4KLUtE+R65C0fXmU0BBbVXc
X-Google-Smtp-Source: AGHT+IE8qR7rvWy16B29zqVKeH+5Xs9FEHJRohxtlVk1ha0v5ACDqhpK4pBzwowgaOfPj90X8hPjJA==
X-Received: by 2002:a05:6a21:27aa:b0:1f3:1ba1:266a with SMTP id adf61e73a8af0-1fa4c6a1afemr2173708637.0.1742273499683;
        Mon, 17 Mar 2025 21:51:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:39 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 07/13] target/arm/cpu: always define kvm related registers
Date: Mon, 17 Mar 2025 21:51:19 -0700
Message-Id: <20250318045125.759259-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uZKcXhVK0WSS

This does not hurt, even if they are not used.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 23c2293f7d1..96f7801a239 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -971,7 +971,6 @@ struct ArchCPU {
      */
     uint32_t kvm_target;
 
-#ifdef CONFIG_KVM
     /* KVM init features for this CPU */
     uint32_t kvm_init_features[7];
 
@@ -984,7 +983,6 @@ struct ArchCPU {
 
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
-#endif /* CONFIG_KVM */
 
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
-- 
2.39.5
