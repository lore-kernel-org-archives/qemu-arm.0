Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp462204njb;
        Thu, 5 Dec 2024 14:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0QHp0yiLi9lH+YUbzx4R+kW+g6Jf6MdgY7in3ke/1ftZXYGApKwsHykIHlNU1q9IxEJTcGQCohpzqrw==@linaro.org
X-Received: by 2002:a17:902:e544:b0:215:9ab0:404 with SMTP id d9443c01a7336-21614d85fe5mr7942085ad.19.1733437370252;
        Thu, 05 Dec 2024 14:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733437370; cv=none;
        d=google.com; s=arc-20240605;
        b=Wpysm4GJVSoIZOL4Agu9TDDviTvIbCmfltp9deE39mECnqVeDG8opc/k6lyKfOjLu1
         u8d+jnrlmwJ7id3NVNBvfp8bXeaN5bUxMbOy1/NT9lr24njymnjv2oyVWJKlrjS6ehC0
         rYe2GGiqeEHnXEPK8jn8GT92oSot12u5CoAmeQS2ri/SYlyAPHrQLQY4CX1DbhtwZ/zH
         xDw/1RR5VFhniN7PQGh4fXY1olFg4gEfRWp07NE3dT6CKLqMPJ1kbKQbpPhwB++gWzg+
         hgMXYgFUzE6q2Wd2yUjfvIwHVh4DxDOCwTYu6pHQQMHxHpkiXf+IQNajTJpwwmTyQi8z
         D5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FbPMtxcOc3D4j1V0HPSTBCu31VLQo3b2yamOLZCop3s=;
        fh=AQNklLD18ZVMpm+qndrfbCLGio0xe9uTBXQZqvvx+M8=;
        b=K0k71CllDWKbdvU5y2N3cyfNHSmSz8r0S7AhHyhj3GwbLbkQF1aVidkiFelfyzsAtH
         jkZ5WA4DyANJazkPJa9PG02rBVLjEkVpjehVt4SPVmRO1ngbBNREdOyHCSbs4dH4ZOg3
         yvfnDyKJWBMr7aFicq7IGoPAuTnoXipamIJ9tROBXx6ULEKG6DvhvSuANo6bEJVBJgCL
         zMYiF6eOLR7lh2VcTm3UBL44nynJFmLX8N85jF0wYcHITljMr1a1tbJNjpVs2MXoUw6a
         yaZSqAbESJeve/HMu6QtgGDf9N/ylrz0PnjwyBLepivKBUzsM+XYFrb7OF7kYbh25th3
         DblA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q+D61ZkV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8f7e933sor23139265ad.12.2024.12.05.14.22.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:22:50 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q+D61ZkV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733437370; x=1734042170; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbPMtxcOc3D4j1V0HPSTBCu31VLQo3b2yamOLZCop3s=;
        b=q+D61ZkVqzkuTzC27035AweVr2HmONiFGt9ujO9UjAuvtyIBAoDJHkedUQNK6T8D+7
         Rejmhe7oqzU7a+CZOBXEMoGMu5Nq4CxeXBeJa0a+OTy8f6q4xmvXUFOoEw4QrC8DzNnk
         tlZ+DlnGR3jk48EMYsNQRsGJp5Fy2u2u6FHI623zIME6sO/6ccDvIb/KoA4MKULm5X3q
         1CF1r9So5FNq1+a2u9XTVkTXf2E4Ov1B/zBg8lK/v70n5V14gNZZLzlbL6oIgCmfIXQT
         AeE93AyT5wU7/06KYHcAIpDkQOZw9NA7BpKpJ7bufH4l+aOVKkN+1SzAxPa+bHjWGf+v
         BL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437370; x=1734042170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbPMtxcOc3D4j1V0HPSTBCu31VLQo3b2yamOLZCop3s=;
        b=RKNxaeJtpXup7oxTcgldrtmG/cuxOj72SnDu4khugK7hNrvg7MYf0AKe+R2irxK/h7
         AftIhRr0z1soWHFX7wxpIlA/PhZ+YYF6S05CM/t/uWUIZ72EY8xpYrC8iQgPJh0uEXTK
         BWMhrZ9ofJH6YaZUcx8IcT3PPVkrggL2mNMApetqJxxiag/UgVUvQysRfUJ40SJnJd4I
         nbQ2x5V9Z/b17CcQuu3tqXNYgtFaR44bl2HMeRst6mnUdwqwQAvaC+g9n/9McsfdOFCk
         BJUNP9gOAk/YOI2X9xmMs18cpIxcQEG0e9RqgX/eQ9z65uIotETKg6yof+Q04hRYNNke
         XC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVodtxxO/n7eS1lHlj1AL7Hw/7bUcT9zz1LrjffD65hrj1qjxKZBlZgFE+9n3jhjhdzUECOY8x4ND1mw==@linaro.org
X-Gm-Message-State: AOJu0YwO+oLbaR9z4fihMSE7kUdWH+7W+D86k4yNf6spWsCkj3rTpRiO
	bU3Gj7679FcpF4eX9PWlzb9Y4p9QpFZ38CEV1Cd5fp2LsKpGtPM4KTDJmGWNbVhMCw==
X-Gm-Gg: ASbGnct+MWpa5UM+CoMt77zOa9O8niawqKVetdsyATn/ReCBvk1pJ3DZs8mNhkxrZNV
	nVSRvg5Ev4UZNxmZtdvBxAnoAzXJcp8rzPOZUsL9JuWnUetYuk12VG5ONbvg56qhKw+JV3WatWj
	C8aVI3yQAtvQmEdpC2uJZOoI27tbz4sfRERh/e57wL+FuJQUcqZ+4x2DGQ3oCA2t9UmQ19CXCSS
	1e+e47IZ5fK7jjqTJUHsAjXTpXAC4+8ASHB2PwQD8b4Vjrn5GZfgIOWm+UTb+vBZnGH5JdXksJH
	uZqZ1SFe
X-Google-Smtp-Source: AGHT+IGGpMrgNZ1O4bZqOEYDSDjgfdADe/h62ubd0eMgisrR560w3IkgYU6NwrzANqjBgeoLeUxSbg==
X-Received: by 2002:a17:902:c405:b0:215:a3fb:b4d6 with SMTP id d9443c01a7336-21614d54353mr8243025ad.8.1733437369826;
        Thu, 05 Dec 2024 14:22:49 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0b571sm17310435ad.183.2024.12.05.14.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:22:49 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	gustavo.romero@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 1/6] docs/devel: remove dead video link for sourcehut submit process
Date: Thu,  5 Dec 2024 14:22:36 -0800
Message-Id: <20241205222241.3789437-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5LfrTNVXBrle

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
