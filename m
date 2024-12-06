Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1091931njb;
        Fri, 6 Dec 2024 11:29:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWp0QyCRYG2CwGksKtPVn0GhLv3qNkrBiD97DuZQg/284hcObPURGv8vizT3BZwgoKbdjUulagUn/nxCQ==@linaro.org
X-Received: by 2002:a17:902:d4ca:b0:215:6816:632e with SMTP id d9443c01a7336-21614dcbc3cmr63991735ad.48.1733513352237;
        Fri, 06 Dec 2024 11:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733513352; cv=none;
        d=google.com; s=arc-20240605;
        b=Br+01ZqZhaCpYR2R8SiX/imf/qChp72GU8RrFEHISeJDjC03iTy4Hd3znmrbYkKXWV
         nWLj6egT+tZ8RWg6xgpHby2bdafDFVyARMmK24oAZyCTB+D9E7Gqe0vHs7RIAMlk/OfO
         dhLnnDQELdlprvXEoiwz/htXv8XcF/WCm8quPM9zZxuEmGgpXLpYLswNZaUHf5xOAciV
         74rgHaq7dgaiRGlFLA1Vg/WUR/3Q/ft1RVo8upxkB3JbyUy0AKsriBeCr8xkVcjGLYKU
         HZfg0yMXp+V0dh/mxkCEN6dSmxwu1II3xUr5kcvbX3EiP+FBWL5iQ8W2y7ROKkhOlRnM
         xKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=97w0wPWp6SUzaCB1TOeEg95vGLLrte4OzIrt9h4+KrY=;
        fh=+t/sNfk1X+PUJ/lDJi9Ck94Hre6F9Gp39uJCN51wClA=;
        b=FeTAV3b9IGEWHFrzNgif71kthM2mV4ayjTd1UHhuslZuEsVWw9mlyrLTbs3n4fXMRe
         bHYaVqfRW2urK2McuqEHr0rMOQZijx9EVyeJBEY7GkS3NbRyGSPovIm5jLvVk8Fg1l29
         9kk8mMB4My/VsjdkQas4majm+RSxaUM+cmjs1qs7N/iwN2vJz04muw2BTugdaOJ1tnLS
         GErLXhgeTDizFjvNkUo+u3cKWY8DBN8KKVMRGQMfbZ2/rGl8/AWwCHmXzz5qFy21Qci7
         wJgkWPSNEjUm2VdK5AoJU6zDSq2QnfNralMRsGMiKcQnSOm3skXDnJYdRnTidzSAyOfK
         e0NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eYJUAn1/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8e4dd99sor31430445ad.2.2024.12.06.11.29.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:29:12 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eYJUAn1/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733513352; x=1734118152; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97w0wPWp6SUzaCB1TOeEg95vGLLrte4OzIrt9h4+KrY=;
        b=eYJUAn1/jrcPCqMlECfCDUDmEbJB4xQuUNGRcNueXO0DV0Y/txjdwRgkVtG6ogrrXl
         3EZTVSfgntz+q1rD78+xQt/cT/giKT1Pr+8+EmibReFgTvUZvsAzM8ddxUo+y423Ur8Q
         2g8itSqHQaC+ppEDUdNWFP5INL2yIdSHOblWDNhqqqdjB1TnFlkICh9onZc5NiY3iDH6
         TBaApBsmwfmsg8XjtVWL82mUoA7iB7iMC5ngdEx8wDYymf9AXpZX6ttWvtaXspfvHajS
         6qG7c+e7SKXpOFgnerJnWJZ7mmxPS7X/3P0vP72jDzUCTN4jW3KhW2HrDqqf6kqmHs0i
         +VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733513352; x=1734118152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97w0wPWp6SUzaCB1TOeEg95vGLLrte4OzIrt9h4+KrY=;
        b=dlvCeAog9cpO8z4nq7WAtFgyRcqkxGrNRsRxlBZ/UAApy8ukRwltvCk7MoHrISjXp9
         PzXyhcWZwWQkqsKB991rwQrFeC6RohJtOjpwbMBqXCii9+MkiiMI1z4VlU81T5SVrjtV
         dbrxZ2VrD4oQ+18iK26j2hWWvC2+OhUbPniWPpySHNPQmEm34cs4+l1D0Lm5RXzFvibZ
         /v5d3qkALPhiuBAyJ6Q81hj2Ms7Uc6gvEt6jbBkHXsPbiWdA9wU4jqJuV5oySp5gfQzI
         w8NAqVANBCq/FD3wVekiPM9Kl42dJaRIIL5blr8lRICdktxJzBLN70ogIEXCpEg7sWrD
         4y5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT7QJQroWpjA/FAKXTsr9YGfctTTszNP0C8NWElcLZBzuijMKSOi19dAtvdCQMcz6yHZVO6xxA5jaM4A==@linaro.org
X-Gm-Message-State: AOJu0Ywju09TPgVciC2z0GP0Wfb7CqJd5m5RJJWS2/c11Jt7JshI6lYR
	xGq0HuQmSbUGH5Ma40NT2gPqY897EBSuw4OEukUfgiwHenhIi8ofQpLyGEijx9UMDA==
X-Gm-Gg: ASbGnctfueQBGcI7VsuxJioxaXhzqdb7jcOO+8aZHgCnaIOJ6T7YvkMYBKEcJXtCA5Y
	y7wC7gCrVFENckUpL3MvHlEpDcUjAZDmU/xFrk8f+Z9/ooJujmrfiQlOcB/3I3tPvAbxKvFIixO
	GZFR3GR9EfMQ0+A3GkK5g95Pd8MBKYJBWYq2NskTRnt/XSPhlx4humVC2nO+nLDHfT3AYX01tOn
	dhKF90aLHJcqYENWpXmsziFmnee1tuNbRC0WAmxlmwpGK6w6iNyDWQWyKHCGAOhYwQKe+HzhCl0
	rmvrB6Yn
X-Google-Smtp-Source: AGHT+IHa0Y/Dxhv2xnIXn3gCj2NVW4p+ze0am4IQbPdvBV+gOCBF4RSnRzRWyYyqr8PfF/9cgWcsEw==
X-Received: by 2002:a17:903:98b:b0:215:9bce:2c98 with SMTP id d9443c01a7336-21614dcdcc6mr58945655ad.51.1733513351854;
        Fri, 06 Dec 2024 11:29:11 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9fcdsm32110205ad.146.2024.12.06.11.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:29:11 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	philmd@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Eric Blake <eblake@redhat.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	manos.pitsidianakis@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 3/6] docs/devel: add b4 for patch retrieval
Date: Fri,  6 Dec 2024 11:28:57 -0800
Message-Id: <20241206192900.3893118-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
References: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Z4mDjhRxVllX

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 69df7682c5e..1ef7d137320 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -433,6 +433,16 @@ For more details on how QEMU's stable process works, refer to the
 
 .. _participating_in_code_review:
 
+Retrieve an existing series
+---------------------------
+
+If you want to apply an existing series on top of your tree, you can simply use
+`b4 <https://github.com/mricon/b4>`__.
+
+::
+
+    b4 shazam $msg-id
+
 Participating in Code Review
 ----------------------------
 
-- 
2.39.5
