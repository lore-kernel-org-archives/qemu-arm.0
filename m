Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2794026njb;
        Mon, 9 Dec 2024 10:31:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVnU9QIYag76yWitritR+nufb5TQbzvZbyKaRJv5onExlVegE2NvuLiEWbf1Wbk8WDDt87flxdEuQcxCA==@linaro.org
X-Received: by 2002:a05:6a00:a8f:b0:725:41c4:dbc7 with SMTP id d2e1a72fcca58-728888ce9cemr673409b3a.4.1733769069285;
        Mon, 09 Dec 2024 10:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733769069; cv=none;
        d=google.com; s=arc-20240605;
        b=D5U/4ZFAm5Gy7Y82AhEA5kZ3cS86kQICo4MpczWgp9WHe/aJxtrMisUeo5gJoNoNSQ
         J+osK1CFaakmQDGfWkeBQL/RLx3ibxJH3wIBmy4yt85mzFvzQ2boglfM5SNltvdJc/pm
         sRsKXiGKJwlyyyRiwfLHWNrpQ64YN/RQSzf3oVjoFzTXH2cI77yGTq6yUqDTxtw7D5Aq
         loXcICrBRY5nM/4Mumlr8YqppG/DgH2c+ploTeSPeJ++sDUg3Ttyl9XN4neE1Bzk4HjC
         PPEO0pdeeNTdxzxLTtNaSAXMxzhn6Om2FFvznmVIJVyOS6fvnerMBWdHkxwfYK+LZ/3c
         Ihag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KJHfvwnJg5sZrvdjrL2PvGyTWu88t+rIUYQX6WpdBU0=;
        fh=hL1C7UoU+s2bG3fSRHH4oa7NlTssfWVlMDDTBIPCsJQ=;
        b=BI48/3VAUPR63jExq0YTgvzVV/eA9TXEaoaBCX7QLveprOwqwT++PTvnU+AyhMZCGd
         KmXwT+bpNgxA5XjxMnB3R6HwOamc4zpbHkgtedSGL5bRKes28346hiGKYqx4jPpKYwF9
         obiPMMZ/CTQ59IBtnJ5f2EDO3P8YQdoo6OlT+b7cQNKpvQdkLmq/fknF5vpDHrMa4spO
         uTvKs47R31ehIQnpj0aatpNTrPCVyKTxV9Rl+yAE0WGWkUNcrt2DowVUJptWlUClHlyw
         pzTpy+Esq+rJjyEGLJAsoK7LdS0We4A/O93rC47ZT1brflVxojvD7z0vUdoFF0fvzIvs
         fEGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZF3F/H2r";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-725ef9ea81esor1312956b3a.2.2024.12.09.10.31.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Dec 2024 10:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZF3F/H2r";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733769069; x=1734373869; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJHfvwnJg5sZrvdjrL2PvGyTWu88t+rIUYQX6WpdBU0=;
        b=ZF3F/H2r6WuwzMnxaji2qdkUuvTqB5PYx0u8R9H+jk0z3L5fW2u+AnSR4aXxhVhOLY
         vQswmaTZWVvbw5tZipr8QKWuLXRViqDpiooLebd+Dei5wxkpFdFQLVEeWw6FN0Ng5/09
         50E57pH/KZCPB2GFb8NCv5fYpyv12m7qM0uB5TIE3HZl/Zot2G5wuEPH8tu24FnwMzmV
         itwYmCUM6B1bvCcYapIFhN/yf/7DTCh4DwpbI3uCfX7SFbAhOKgF30OFO2uJNDDanx5c
         4wIu0KbaQAqHaVa//lmuAWwTEfjdMhKjIdaVvhrbK0PYUCTaQqxj4iZqbTll9cBDHT6H
         RKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769069; x=1734373869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJHfvwnJg5sZrvdjrL2PvGyTWu88t+rIUYQX6WpdBU0=;
        b=YLP9/yA9GD0MolOKU9uhCjNFyz0H/GrqVfoEkgFPD1iOjyb0zie3eLOrc71e9GtAo6
         R/ah/nCXDBJSlAWWHOnHhM46zqme281DkWOp/NQWSAj4tNB2nS03IATHOimN5IaRFDOt
         70B3wLDhO5Xwq7rIxwA/BgYk+x7m9YO8mWne1/8Zb39m57nOcjBpUk0QdJ8DksdsNwcb
         iswHYdtE6VJEZE1LK5CCY4BlMvdD40Agq43A5RP9OlnpHmySBGwCjwhAZ/8OjKtKBHV6
         eu6v9YKlQf6bz67Lz4pHW/kP+KTPXvuBgNLwtWd5aDyAipXuRJXNJn9otNQmqGna/18u
         ROCw==
X-Forwarded-Encrypted: i=1; AJvYcCWR4MNx/jNHWUtAPhvvJbQbKCtNqWOaMdi1gxKF4wrBIwYmG10gE++o5VA7KmMGnlMHganBk8SQXpoSIw==@linaro.org
X-Gm-Message-State: AOJu0YzS0gve4cTL8YmDP/qQGdPgzeEEa3+gfybveB84UJwLMo/zLVMS
	h5CjDX0S/BNnqk61dFqhQgb0KtxE5DuvCC4R6RTlleLZ87hOHP9AHI4SLxTIm3dMNA==
X-Gm-Gg: ASbGncsbBSksqudIyyy+t/zU5yTFQRq81yN5jzy7mrwFdhDtFbL2LklCBlX2Lt6nYo3
	wNgVxcr3+FtWtYpUg3j0XCrwxhaq/pMQLcX/X3YJYWypW0QGN49dIGJWZGGHWxoFkaF0O+DfpiB
	SD/680n+/4yDWcHAeU2Na49XHS+wjd7rtEsliGzT1NWimXHSz8O9zzDgDKW6KYGPSjNvx0rWPBr
	y3ZVWBurPClGzq5V4QcvLdhxYtw8HKu8k4eytCt+2S1TlPz5Hor2spU8I6Vg3u9ykNSmOcgglFw
	fl6otB/eRz1F
X-Google-Smtp-Source: AGHT+IH0W32vCMU/REHgWwitNQj0RdYViGRDdgZtnn1QKAsNMZMXRkehKM+GP8TM3mJLL1QW2KCPyw==
X-Received: by 2002:a05:6a00:4513:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-7288810e22fmr752631b3a.3.1733769068840;
        Mon, 09 Dec 2024 10:31:08 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e2388d37sm3322821b3a.73.2024.12.09.10.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 10:31:08 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Thomas Huth <thuth@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	qemu-block@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	philmd@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Markus Armbruster <armbru@redhat.com>,
	gustavo.romero@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 1/6] docs/devel: remove dead video link for sourcehut submit process
Date: Mon,  9 Dec 2024 10:30:59 -0800
Message-Id: <20241209183104.365796-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
References: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mtgnWcbuJu63

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 10b062eec26..03b2ac298aa 100644
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
