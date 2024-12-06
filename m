Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1091917njb;
        Fri, 6 Dec 2024 11:29:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYSpq3w2cQ4YMPTdmDJr+Vbp53KvhIuKrfn0uI20foAJmLX42SgOW6NgaWNlO6wcUXPmq+57Bis2un/A==@linaro.org
X-Received: by 2002:a17:903:240a:b0:215:a028:4ed with SMTP id d9443c01a7336-21614d45752mr60993885ad.20.1733513350011;
        Fri, 06 Dec 2024 11:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733513349; cv=none;
        d=google.com; s=arc-20240605;
        b=SezL69pbl6UJN8M0hn2WtiqvDqxo8aIzuUP3spc3PzMsn18NEiVYqMKL8ntD6hM5/f
         j5HslxnHfK7XT956Xex3isdBFl1ygwWrEvVPFlsZsftHQ6158mx6uGE1gPLx5Forr8ip
         kb8G6CkaeovnBtdllclkQLGci2Yei9WA3p5jYy7RRYLOPJ+1dT9JuXUQXZJVo5DBWNUv
         FgiSlAsklNb88PHtRE2ZyyQSgk6G5asxyQR8akhY1Thoaw49mk2fuTTYT4JEGpgzLnbh
         D9l0aZBzCyz0qbad1nGddJVA2S5+Vgsm5RlUXTzra+l5qIon5MmxDdO1FDfTlDcsaHLo
         7fvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FbPMtxcOc3D4j1V0HPSTBCu31VLQo3b2yamOLZCop3s=;
        fh=vCEHG+rlzqjTIoyLs6qut+agm1i3FYwYwtlJKuYptBE=;
        b=ME77VplyFdOah67ntt+Babbptd3UV5IU9CdBKQYd/pEFwqa2YAP27ny2pg715FyluW
         zpQsiDJSQ28uV93u9xzwmjvKMdpxBTcngVbez3fWaulOMWZC/yowO8sYserjzMQFG8zY
         YEU5AaCBiEh+oqnkcLebct5O2CdVSlanuGOtiXD9ZPKsPjinacF5BxYiEJ95q+1qOkLI
         agjE8BHzVMkri7fsJtshXtU2sau80tvRs34aphLX/morvXaDcKXWP+UxES7ePR2/H3fk
         fJuZLmvnsjScuDVT+ov5r+3aWYsnEXj0BatHTO/4NwNMNoPVOYIPWlKHGlaorkD0JAQS
         oHNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uSIyol+0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8f11670sor28434555ad.17.2024.12.06.11.29.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:29:09 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uSIyol+0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733513349; x=1734118149; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbPMtxcOc3D4j1V0HPSTBCu31VLQo3b2yamOLZCop3s=;
        b=uSIyol+0TEOkG4LEJXLI9AdEw2/i27+kAWM9gzHx6tgoRciflOarG1Cv1yo/oinPBC
         TIsn/NNapSfyysuZK8/+Bv+wuDhpsF1uIJnMTL6qiZ8WAD5X/Tgr4wrySgPnIsq0rQ95
         P9xNdk4B6KjBCMGnb/tpVTTnlCwGzgIKYcR0oXj7deNmvu5u5K+U8ki1/ERgD1C7cpDg
         NPggr4tP02Cad38ji/ZktS61D5ZCaBrk7H65RpJXYECoZxKKVpx65ptpNVREhaLONKjb
         XM9NOpNKFh3X6iMfbTlsn3xEQJposGtK/fqPPa4xQncsyicPbkEIfMKHi07tbojAW9j+
         2kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733513349; x=1734118149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbPMtxcOc3D4j1V0HPSTBCu31VLQo3b2yamOLZCop3s=;
        b=ipVqQwO7x/78LCY/DbYOFhWyjfgvZu6zyjhOvGKulPYsEDVYacE15Q3bcX5aRBB3Xx
         GYruZAn5pACi5PwvkVtci5/IA9lnCSWi8hkkqixeW28jNFtW6tbsG1KqHLIitSJpPcDT
         prM4hcPniaa0HXv3ucgh25WenID5qGpf8xtbik5E0UTblD495ZcKzUJKIweOVy3b3lFP
         zj/xzgQp1ao9iagcajMlN1tvWlKeto+u1FxFSdHR6JlV14h8xHtgbfQdY7ux+4VOZWiF
         Pr3aBbIrjwliH5mHLjsZcu8MFpLewQBnvcmjqxjDBhS4p3Rra9aAB/tkStwDUwSKaq+i
         sQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZoOjCtittzxtInXVwIB6OmsJW0U8NV/yGiG9gHxmX2aHJ9EML7Fx5eSOa0N/VXjcl4rjOOSvYgYmKmQ==@linaro.org
X-Gm-Message-State: AOJu0YzUcXZMIL8zGxewHKo0dzTjv+qeNc7rSAu/LxNFDyA6kyNT92gy
	D2fEHTHKtzXF4Zu4j3vDzaoKsJMJA4QWFkEsn15+6yZWQWP41I2EdJeU3otTqSznqYqC+pryEVD
	SGJaZ/Q==
X-Gm-Gg: ASbGnctgVqB/gBdqa/uVGSniWlqq5AIvfrGsULJSiGAyZDHG5kFvljOn/c5uMKeg905
	0zKDGSR57Kp5yr4TONS+E+o1gR12gOUh519C9Xlh9ByFyZEM8lXdBPzoLsBW7YVLsZGGGgaxf4b
	QLMCVKREKcLSG2MrOTGwdG+aqnS3oPUey1z/3sV5ug2u8Pn/VS6cAcBbF6isRLhE6ShLel17kaa
	MNtXVNed8C4PJ4zdT9hx4TMh1rrwMtCr1lmZJCY9/REm7Q2ndXdWD71VMuaAT02soa+29jC5z1I
	++aW+Yk8
X-Google-Smtp-Source: AGHT+IFMrlZJVSch9+XLcwCmnYK958N0MU6X3npy9db4D7XTYUqGyFCj6Ns4sOuLUYXsJ3CdST3c6g==
X-Received: by 2002:a17:903:2348:b0:212:996:3559 with SMTP id d9443c01a7336-21614d2e567mr62280495ad.5.1733513349592;
        Fri, 06 Dec 2024 11:29:09 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9fcdsm32110205ad.146.2024.12.06.11.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:29:09 -0800 (PST)
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
Subject: [PATCH v3 1/6] docs/devel: remove dead video link for sourcehut submit process
Date: Fri,  6 Dec 2024 11:28:55 -0800
Message-Id: <20241206192900.3893118-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
References: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: exevVSYkYajd

Reviewed-by: Thomas Huth <thuth@redhat.com>
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
