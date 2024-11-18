Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2742969njc;
        Mon, 18 Nov 2024 09:24:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWuTUPACTO98TFNMdqcOZcjfRcBYTqzankbtJUROyelH3y3Kfq5HPGBFAhW8seFDPjbzuybbBYGDQnRvw==@linaro.org
X-Received: by 2002:a17:903:1110:b0:20c:a0a5:a181 with SMTP id d9443c01a7336-211d0d724efmr177182365ad.19.1731950655377;
        Mon, 18 Nov 2024 09:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731950655; cv=none;
        d=google.com; s=arc-20240605;
        b=Y9LVSQROFRf6JmVLnH6rEVJ7Ty8lvDWLDRLyg0WSe//g2uQfBI/Q1zgyNkIk42hHCu
         OwhBRF9mnl4LIKvc7nGzjrIYbzSCpJ1mWmuS5IqkK8oxb0pYp+PgPnW+gFhdXfmIwpcg
         38T1GFcyBZTdCFBgbs4L1IjmuS4jn7yzVuTNYIbq4duWafJWoiy7wIs1nuOHervym44w
         fMIllZiNZw0SiKlBO/O9d0FgVAaX8ZTmQ25nxeLXsXJaqLRLL1sBUOeM0jfGuC3MeSpX
         d9tdkgXyW6PaVtMkNnL+xoAv0jzNU+wjAz7Nz5bnJb1FluXevTSzjJR7OSMIwfxXygIe
         HWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i4RsMVroYRLEeyBEwglGNgeTU+l2C3LQibeRDMRaXh0=;
        fh=67advxr84qbGHx83xeMiEeE0XAtDJIZ8+BOUIBsXrMU=;
        b=RxkdfHxB83VALSRGJc3BKkSyhCWRcduusTA/bhyMx9e3nIEfyhdYcviW0KfhSmtWsX
         EdY+3xWQq9oAFuns7f56pc8RNO/NVmso9qKZR76eG5t2GvSs8CXBCkztEkEDe2A4svXl
         J9kb3rCG49tl8P2l/rTE5yjBvJoZrBsW5l8ktld06Qx0ZePc80nVNkBw2zJ76h+2KPMj
         8KICCJ87Z0TY6Dgf7t76U5pWYYo8z8Sb6k1MQnmuSZz9jHnMv1uUCq4K2eT0y8VRZcQs
         yZK9hapBMTeV7DelU4cPkm6f3PPThPRss2Fh4Mt90KMLdJJpzRCyQPCFmP2ogeBr7PWg
         bY9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q4L4P/aO";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c784d260sor59478845ad.0.2024.11.18.09.24.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 09:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q4L4P/aO";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731950655; x=1732555455; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4RsMVroYRLEeyBEwglGNgeTU+l2C3LQibeRDMRaXh0=;
        b=Q4L4P/aOyQR2YsuL9JeU7HXdV991QpHhcZQCG7bAtLWBiw9lDVHwoRDBRRPUIkh9Ub
         ffhiP/fjyiOxQbWewNPkkh+waygJRslsCZ0fHfwTd76DeKBXhbO5052fRRbBQgh767kk
         GVdQOABY8nD5GjiPySIJmSsvQkqjUSBvgMKgInDnxb5cre343m5vIk/WE6IIN3tPPaPE
         dx5joYmM42prUWeP6XCcsbuYmQ4q/slkNZ65sk2hXM7nFXD/YJzufvAzGVFLmfoLC1gK
         mVwbguJk4gR0pX0cmYeYkxt0oNqOGTbmvpO7blUyQ3xC2eT5GGal2VHetrkIiXpiWbEp
         i09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950655; x=1732555455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4RsMVroYRLEeyBEwglGNgeTU+l2C3LQibeRDMRaXh0=;
        b=ehtKC4jIe9WDjBTiOQP+cZtoKyr6MxVBo7f2/nHrCdYEVWb12PyeJE6LSJA/MFEv1f
         c/wMGXj5AjJxmcGyjMMprrBxRK3trcez1nfTTycVKtiVCXmODzSWm4c9HkJaFmpEWKuZ
         xPF2Qdopdi6y56A5ehHe7XTrDhkdMrcNMrkr3fdh/g7MSBXLitjRbgA0uWYiLtsCzTrq
         l45mih0faIjUK+DzCIukKWJCHGegeal2TKFMJ1njt6siq9T+9x+WcJKp0loF8GBD1QMA
         +d/RFWNc+JOL/Tk09OtPpjURuCrN49BpG+Tu9CAeaUCAj9ish0Rfd8BNuygfxTJKdhHy
         Rx0A==
X-Forwarded-Encrypted: i=1; AJvYcCVnKdT+k1FaccD6AdfrvUf1sjp9gmGdr1V5CBuTpsKHzTPG8VuvCC5Lc1CQc2g+FCgMYcvqN4Ae/llMEg==@linaro.org
X-Gm-Message-State: AOJu0Yz97rwVci+CNWjMP5kVg49K31ffYHC+58EQVK0sbZdMCD95GYLU
	04nwlmhrjyxE9tVLz7igzzZ84SPgJGGZyc+hr+V5JAJTzU8BYeaJqekFl0XVB4p6Rg==
X-Google-Smtp-Source: AGHT+IFBygmmPIfGUz8O9UWqNtcVccOTwB5Fr5+w+tOYYwbTSp47Wyg/hcvxZd8kCJUQ/HvoeEuAJw==
X-Received: by 2002:a17:902:e74e:b0:211:f52d:4dfb with SMTP id d9443c01a7336-211f52d50e8mr141024505ad.34.1731950654881;
        Mon, 18 Nov 2024 09:24:14 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f55d04sm59469765ad.264.2024.11.18.09.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:24:14 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/7] docs/devel: remove dead video link for sourcehut submit process
Date: Mon, 18 Nov 2024 09:23:51 -0800
Message-Id: <20241118172357.475281-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2EDPITPOwCm9

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 83e9092b8c0..349c32ee3a9 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -252,10 +252,7 @@ patches to the QEMU mailing list by following these steps:
 #. Send your patches to the QEMU mailing list using the web-based
    ``git-send-email`` UI at https://git.sr.ht/~USERNAME/qemu/send-email
 
-`This video
-<https://spacepub.space/videos/watch/ad258d23-0ac6-488c-83fc-2bacf578de3a>`__
-shows the web-based ``git-send-email`` workflow. Documentation is
-available `here
+Documentation for sourcehut is available `here
 <https://man.sr.ht/git.sr.ht/#sending-patches-upstream>`__.
 
 .. _cc_the_relevant_maintainer:
-- 
2.39.5
