Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748672njc;
        Fri, 22 Nov 2024 14:52:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtxV107Jgg11DrnrI02eA7HDBFd2a91wnt4W5gxF8CE2BuuqPhCW7Y5q4i1lMYhG7U8MjyPmxwlkEoSA==@linaro.org
X-Received: by 2002:a17:902:aa4a:b0:211:e812:3920 with SMTP id d9443c01a7336-2129f65e359mr44378625ad.7.1732315935372;
        Fri, 22 Nov 2024 14:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315935; cv=none;
        d=google.com; s=arc-20240605;
        b=JTBdc4wEIlz04WJi4sp5BnGV0RyAlaqasoXqyt7r7TFj26DgYQwJuSACN5g1B6wAGh
         e1JTjFnD2x5fHiWdQyR9twxaVB8rhONo0usAJ+WSb7og49gII74w64fLLlAUxBBgs3iv
         g3BxMBfwzb+NG95nCYuFI25Yq0MeAMxRLzAbDP5tm0aUl6CXGRGpOQ1VEKbOvQYgybN8
         MnokxWYhAStVk2esSQAIfrimbMwKVL+evrXgYOtn0VdoFSkejnzC6n34DEoxrNt6kfyG
         J+zqRsJjayL/9xPEZiVR6GjDgKB9LG7qm0lfpWWdiPTTH272X4qz0UUghK3hm/afH95k
         Tu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QyMS62Wj2zk+Bd6PpwrWdVnzgE/eSQ4f9nG6xzbtWnU=;
        fh=TxjUjuqo7Okbwtw6iSegRvpUgajYSj8OBTUqDJPBl3w=;
        b=GZ7lL0G9tDWtiNFwoX6PRvi70w81tQ7+Ow/ViR+/uyjk4f0jiOaSXPR3l1+x2lwxlJ
         D/HLWqWw7QmXafeVvohXWk9E5VONIXo9H1i5G+DEFyB7ba3T6/sNVwtYhwWaPf6B00Lf
         PoMFo9nN9VeQX4I/SBmjYcv+mObcGxXJMAYoFNAU2IvlBHXwQoqMHz5b/o+zaYVp8xKT
         c5KJyaCAFUTje8MLhs5R441mcuZIyszOFoWzi4H9jVgnV6qdV7r50tSLw99Etrj694s8
         DoB63iGQ2vtKBSQwO/sxGUUDUoIHh7NoQjrlHmVBgYlg9D5xoszMe528+KTBjt7AKDDq
         1FyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CRKx+2Ua;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21492934213sor7689985ad.15.2024.11.22.14.52.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CRKx+2Ua;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315935; x=1732920735; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyMS62Wj2zk+Bd6PpwrWdVnzgE/eSQ4f9nG6xzbtWnU=;
        b=CRKx+2UapyfjFmBXHERWX6wDyoJj5VUn0wA2lSGpiHeeMHBBshZ2jTU2fvRkaVtj9O
         wYZgsCNO6xu/Wzs7g9JoP2KVn//PLWUG59VWOXINc6BtQopJQUwtpzrsGRGop6+CK8mn
         uemkaCWrLS7UcA+IpJOqIlGncV8uSB3AFUQ/fNaGHBfHg1oTv2tMAClv2DjLiOWPbx9A
         6YKnnqt9qP/ZpO6tTUS7dNDOGfLET242Z9PvlHZUurGeu/009+vs7eQdMWyXQmFVJu1q
         gPP7MJbVd1HB3+SP8y6Ru97PBbHvKYg3o5vEhd0g8rnQCvXYee/uaYzWlCSZ28R+pdoV
         BXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315935; x=1732920735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyMS62Wj2zk+Bd6PpwrWdVnzgE/eSQ4f9nG6xzbtWnU=;
        b=I8KP4pDzF7ZbdKQgZf+uVgi4rcmVHANLQnXk9suBhlkjWJZ1Ystl//4ZMYqZcz8c3o
         az2/3AaCkvpC2PeEG5UAzjdq7DOX0jbSUd/nYdqpDEJADL4IqRe1s9T1IfD/CXuXR9UI
         JtKcaNKy2o4G/WuGnqv3mDlBYZBXMiDsq+U7Aqb9JzazCJVVBtpdE05An8SLb8djV/Hs
         5h+SfroNeAAyc9SSU9GBudnj1BwU96jQBY4dC5bg5zc4uDRdL/NDVglDFTf/SVBm5IAq
         qSkuD7YeGqzW3RENN1EYAeTSPWh6qHBM71Ikbo715Z1PVC8on3r2oOob3tAjbP93sER2
         RnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrwHY3JJslyZ0SwDeypvAddM3locyE3UD9aUs0vzWnzEvFs9ioCdrv+sBCyaSfsAMlz9l88xtpuK+jlA==@linaro.org
X-Gm-Message-State: AOJu0YzYArSNhpJofH8urhwrGz5ZEltQS+F4gtgNcZ4tUA4eb0WoZY9q
	5gxImDjNMjhyAE6J5fUh6AzIYYWt9yOHWZ9X4AB0YXOT1M04sjfQMQY/2EsL3grYtA==
X-Gm-Gg: ASbGncuH+qiK1m+SnQQSbquq/fEpX/x6k3BngnAzpLVvNFkYyyJWcOXyverXVzHChVH
	Bd+Ldx0H9pYYTGHYo5DNL9B5brINOn8njq+X98TgaINBcOR5PhUHE/zUlGj2ClKeodAGG2ucRpx
	kDI3/YsPvtJPKOgpodgFqN/Gz+/6nk/HFltVTvWfCmiOrcqdDOPuWxM6TkHp64gNEg0F1y8T1B1
	rlNJPx/Dj5KvTB33g6+3AX0Qrr0XEj73QLJgV8D1KKlQ6G/TrpyxMrstdamruYYphMSI9HhXDEG
	70R1I0wdfye8CA==
X-Google-Smtp-Source: AGHT+IGqHqmgIMXwvUq61VXajd8KTbEubCufIExybbU0aXk2k1aZnPkuFwsh8/O1Ap0RUIbGKO8U5A==
X-Received: by 2002:a17:902:ce91:b0:20b:c287:202d with SMTP id d9443c01a7336-2129f75ca43mr45276485ad.55.1732315934976;
        Fri, 22 Nov 2024 14:52:14 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:14 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 11/12] docs/system/arm/virt: document missing properties
Date: Fri, 22 Nov 2024 14:50:48 -0800
Message-Id: <20241122225049.1617774-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oiVIp4iDPkdb

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/bypass-iommu.txt    |  2 ++
 docs/system/arm/virt.rst | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/docs/bypass-iommu.txt b/docs/bypass-iommu.txt
index e6677bddd32..62818e44ed9 100644
--- a/docs/bypass-iommu.txt
+++ b/docs/bypass-iommu.txt
@@ -1,3 +1,5 @@
+.. _bypass_iommu:
+
 BYPASS IOMMU PROPERTY
 =====================
 
diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 11ceb898264..d3d21499ff5 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -169,10 +169,17 @@ iommu
   ``smmuv3``
     Create an SMMUv3
 
+default-bus-bypass-iommu
+  Set ``on``/``off`` to enable/disable `bypass_iommu <bypass_iommu>`_ for
+  default root bus.
+
 ras
   Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
   using ACPI and guest external abort exceptions. The default is off.
 
+acpi
+  Set ``on``/``off``/``auto`` to enable/disable ACPI.
+
 dtb-randomness
   Set ``on``/``off`` to pass random seeds via the guest DTB
   rng-seed and kaslr-seed nodes (in both "/chosen" and
@@ -186,6 +193,14 @@ dtb-randomness
 dtb-kaslr-seed
   A deprecated synonym for dtb-randomness.
 
+x-oem-id
+  Set string (up to 6 bytes) to override the default value of field OEMID in ACPI
+  table header.
+
+x-oem-table-id
+  Set string (up to 8 bytes) to override the default value of field OEM Table ID
+  in ACPI table header.
+
 Linux guest kernel configuration
 """"""""""""""""""""""""""""""""
 
-- 
2.39.5
