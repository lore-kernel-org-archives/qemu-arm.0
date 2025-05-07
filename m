Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94286njb;
        Wed, 7 May 2025 16:42:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVckjCVngRhLVhEGN9WkL9jrK2e3rvw6nsl28U7XJ7V/q7vMH2Vm2PZnO9YlY1spT+SFSIggSZpLTxslw==@linaro.org
X-Received: by 2002:a17:903:18b:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22e5ecd2cdcmr84962515ad.40.1746661373333;
        Wed, 07 May 2025 16:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661373; cv=none;
        d=google.com; s=arc-20240605;
        b=MBV5zrMbh18ykXSl84EUR6eMqbg+ycki0km37V24BpCvY6/5tAci6OJg3nXzTU9dWC
         x8PzkaWo9xceg3VYn3BrSE+dnNdj1yPoKRAvGXcHXiLrs3owk2plXuarf0sik57isu7g
         NFJ5ZFpKVql+PWGY4b4+rw+hi+iqlAE2L+PlK8Vo9eMUKFI2aYZE43xGi1HcfBi11pni
         /UriGG04uE+fOofSZWskxyGgZKuyp3tF2ixatrPBohL/R6wMEW+39vxOtkOEKIbw1elz
         gUXid6h8l3gPWiAaDF3Sxax56uBT5JjCsOsQoH88/SHRTFmE6yyez1JNgS/piWXMjKUe
         AcBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        fh=4QGYOwyLWxXhHwsXl02MnOk06Pg12suWnZl2hfF0to0=;
        b=kWkE98se/QQ3hnzfMWFYeZaLS5QyUOo0j2qT+ITJxJL1IOROUv9GUdjg6e4c/+LCX4
         4DHMW0Yh1wnYg6uxGmyoVkMUBK2wihkKWlK5o4DCWaDG7JCvEu81jG5+O6alZ8o98IPM
         al33nd0LZgSJIN9/cMSSRCfEG/R9EFyaOnS6Lm5vvAs0jVN/IVlcByAgH8pBdNtx7dX/
         RjOke/W2LoDUEULrza1IHOj7bbfAuZhk6KMA+G4i9q56JZvpXQCrBtIhaouvZxXm1V6r
         kZXL+yjmLfPTC5NtGVXai6MFOhK02+oEcxbN/SiHvZJA6pO4lb9sWuHCMaW4cOELM3BA
         OG9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=afx7wzzu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e570bd174sor41270725ad.12.2025.05.07.16.42.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=afx7wzzu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661373; x=1747266173; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        b=afx7wzzu16asb2Ofny+1BzsoLyHXHoNA8oUQ6FRr/LUhkce225JYVpsRcfiAQGAtNn
         POTrqbmZ8ZwFuwLakocpxW8/XlS79oOf7uiJTqcgWnxeBepiu49/wtdDzqdxBy+jMIQe
         D96nY/xlw1c+PaOS5EMZgccfbDVYznUfUCY48YIgvt0MmBjjlBxqx8aq3DrsJpjj2i41
         j9h+XLcylUIo8nn4pb3lkjl9vXqCDKhKBZDQmJeviVxp6mk3p1kjOElLgMDTcovicKxM
         +ImAHtxOYTv8TXmCS5WgkU38sq7qqxZYWSg3p8Zp/0LbUDzI8m1G8JWOBEzvHbp3LgK1
         Lfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661373; x=1747266173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        b=o5LlDA0MNajF1EYC2jZ706qUPxAKB2tJNeIY8tH8DbkeNAIIYSBEsdGkXELu9ajR/G
         GURuNym6ddBjx54exA9eDjiPmuVPEORzo1MUCV3ESwxbg9s84cTlrXNvZkGLwuQIJ2bo
         JBzW5y44pXlYn9TO1OSeaY86q2+wEWJB9ps5izQxuMsXLTbEvCIRRBoL6YmyJScDqvQw
         2JX/ZlEWUoWxY5hq31qO2h90LAXXDyB7XHkzBJc9A6gn72ikAwDp0KDE0pmXtgNQsZKk
         vjO6ZpKjX0Ljk6sgsQwOYz53cEtB3arcJH9lEfUp3neFqZMIk/SH3PvEPkH4vTf9xmib
         tVww==
X-Forwarded-Encrypted: i=1; AJvYcCWOX61qkmdkNrGSple2HTNcAEbnU3z984z0lbtdEwqVhLZqCJG6G5w971xOhhGC2O8b3+/LonvmAnvQYw==@linaro.org
X-Gm-Message-State: AOJu0Yxghy/LF9EJeSGagfqmwnDJXGp4U0ZVI3ZCfknzd/+CooEB3q2P
	fhhbYH1j76wwqezER4dQxarsWZCjJWWBD+hdaXp+o4YIwpwVmI7Ef6j2roHLSEf7iA==
X-Gm-Gg: ASbGncs7KdLHF2GMOjzfYreKfM2wZtst8rHlXtVisL2mdAy+Ozz8zQ9RI+aKglNHLWB
	7I4lsA8A9x1pZq8AxWf7pE34q5C1mEzUPhkzwJYSBbXKKpl/5te660OqUGqnXYZmO00bhV4loi3
	R+gnvKtb6Jq8lMH9Rkz2etUI5vzjhUVhRx5qFm2q2jQ3odIIZ9oE1UzMZEyyHEp4OdhVaAwQb5r
	uQdVwli6Ct2OzIuB+ijXAtnhqg/W2kUilnPEq18Kytvmg8vHArPdXYVzAHVkY1DBkf+YIltn8P+
	2tteuaNrv4n20Pi0j82n8UsLUQSNx/dR76tpbLv1
X-Google-Smtp-Source: AGHT+IGT9jj0uwCiSn5aHiR6pkWAiqIqY3mUNfD2ufhi6mS0ZBXJtvhfq5oYsu0oWVVtjh2cwW1W1A==
X-Received: by 2002:a17:90b:38c6:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-30aac18622dmr7695290a91.2.1746661372934;
        Wed, 07 May 2025 16:42:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 11/49] target/arm/cpu: compile file twice (user, system) only
Date: Wed,  7 May 2025 16:42:02 -0700
Message-ID: <20250507234241.957746-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 88muoBvtM5Qj

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index c39ddc4427b..89e305eb56a 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,6 @@
 arm_ss = ss.source_set()
+arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'cpu.c',
   'debug_helper.c',
   'gdbstub.c',
   'helper.c',
@@ -20,6 +20,7 @@ arm_ss.add(when: 'TARGET_AARCH64',
 )
 
 arm_system_ss = ss.source_set()
+arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
@@ -30,6 +31,9 @@ arm_system_ss.add(files(
 ))
 
 arm_user_ss = ss.source_set()
+arm_user_ss.add(files('cpu.c'))
+
+arm_common_system_ss.add(files('cpu.c'), capstone)
 
 subdir('hvf')
 
@@ -42,3 +46,5 @@ endif
 target_arch += {'arm': arm_ss}
 target_system_arch += {'arm': arm_system_ss}
 target_user_arch += {'arm': arm_user_ss}
+target_common_arch += {'arm': arm_common_ss}
+target_common_system_arch += {'arm': arm_common_system_ss}
-- 
2.47.2
