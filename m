Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp462214njb;
        Thu, 5 Dec 2024 14:22:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUc3QYDgn5mMJ1rvvvqkfykHbWdbRbglZTJYTTv9RlcjEPN7buZgKs8mSdvlrAagKOEgRJayhXZj9rA/A==@linaro.org
X-Received: by 2002:a17:902:cecc:b0:215:b468:1a33 with SMTP id d9443c01a7336-21614d1ed2fmr7575295ad.4.1733437372526;
        Thu, 05 Dec 2024 14:22:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733437372; cv=none;
        d=google.com; s=arc-20240605;
        b=ChygLusSIMiXqLSy9EPM7o+t0wasLJN47fZL6U2ZiMpgBuFhC3PcUJdo8FsHUQz2dz
         3qAThJHAD6FSZI00DF7UYuU/wYF7845nLm3aimoKcKUgVAJ9Ks7Wqydyhhg6wMbfpUBd
         Rjt+7CABSrM3Pfp/C7JsACHpzX/1EZbo46UxdxlLwC1FQDYfDqTIpll/lJLMX7Fld78P
         OBNqR7eIWUWdUdqeVSRSn1H7fQYb2Q//I0GZFnDCTGwrVlaHVZKiJJr1o0jYaz7yIKSO
         Rcr2Buj07n6hbUKCFQy9BmgEszLJ/R5YKj5TAATWW2eaOIuVPpUnC4A93i4g/syLynaB
         3Cqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VJU6LTkTBYM7iWtOHgTlgOKxjsUORD0kvMkrC1zUSAU=;
        fh=j/2FQTrBl2TdKgMLESmLYXeMkglFGQm6Z0lroDeGjVY=;
        b=N2mAniL3nNISdPr1DgiE7jRWtnjklbfGrvLkLeZe7mMxCbclZVAZHITFlxQFB/xxJW
         vCaqPvlVo8g/7t1RdnSWTlY/HiMiwiEi0MyWWh0LZYKki4U3l9IXGTo+8VPh5zejh5sH
         hormVLCA3B8YCXOXqBaq6PKCgQ+eRcxo3/X9cFaEckSXwbli4ZxEtUlpaViKn3Fchr10
         teYV6MKPZ5N8DR1kGIMB4Uh9NakYJ63u+muUjfvzFUYNR0QK1TWPdfzw1UagdWBsPMGS
         C7KsMaiQcAYtoIo79/kzeDKwjtaceLPDuZGK6KU6miO39hBZqIhjIXQqMdPPpaREwcXs
         uzVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQDsoIup;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8f2615csor20367395ad.14.2024.12.05.14.22.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:22:52 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQDsoIup;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733437372; x=1734042172; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJU6LTkTBYM7iWtOHgTlgOKxjsUORD0kvMkrC1zUSAU=;
        b=XQDsoIuptq1MPW3H8BAkn5Pkd31jGx06BzFW8Z4vemHXJ2ag/+neSGudoypAXNCFuO
         xPDjaNuwp81IMYHbAG0w39/wS1CNEsjnX6SxBlUpwJ4vU3h9Rkiic1FZjiZs9eoXnQhn
         Qx6M5+7F81uBNA4ZI8ijhP6yRHZ7/o6U1ZnsuVX0Tj0sAE6IEBzkGUKLY6fzeheZvIG7
         ZG2xu5EDKSKD1DR1p5J/rY4Y8AJ0/B9+9IAyaq9w4ErFnYF+j44g5nYKAm/wRiquXtRG
         Gbsb7jVtGXSVB61m4KZDKxWdENLLDjYzsA65LDJgg4ydBGW+7z79ezwHvTcO4Y7fJd/z
         69xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437372; x=1734042172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJU6LTkTBYM7iWtOHgTlgOKxjsUORD0kvMkrC1zUSAU=;
        b=Owv8cqVrGhhG6DtCKVBlhZx+B8MKXa6bzmzC3cP3liqDh0PaQIc4CXKqTOd2mKUG4u
         jbpHC9Mo8Hyp1hXPpLo/FdXMTHbZbLMmMp6SlBFmCT2idQJojh2SP4dGCqXfHqoHdZv6
         ryG3kDAeyiUETx4xTBoQ0oHTifulQrqFXwOAe1VUFecq4b2Lwh5SF77F6kPc3lheYjrc
         NHIQHlMurGSv3VuiSZNR8tnw4HWJ1am/TRq69YsxUbgKCG6Oc4G+CIr2p0k3DI80fpXG
         4Dy73EKvlyIxIoygFLpIzVR18FPgnT1BNSVc8q4/y1GtoxF84Ey4qS9AorhS7rjcsLoI
         Nyhg==
X-Forwarded-Encrypted: i=1; AJvYcCVw3NNRvR5IMQ8bguT9OtDBo+/EgPS6QVC6Q4fuE2QTrm7epn76xSTf+owhS4K+CkqSP4z4+0E2p2THog==@linaro.org
X-Gm-Message-State: AOJu0YyrmMZz+vdYQvTmdSWSPTbw1CqTqgwDKmRci+3mEIdTKKM+56A/
	0Efd6qKA3Y1sx84vA2ONBo7s1tfRxFlwnrxrsNdTD/GptZa66DWo6UCIfY9ZR5YdxQ==
X-Gm-Gg: ASbGncsmnKF7/cid9/e0ymf0ZK+e+pDWauVfbsEw1Ff8EGZQ4ULfwAoZkDyJ9HPnDq6
	zJJMDwZVeiU67NmaNQ2uXH48wsCmP1yJoL9Uy3ggCkCefLCaOys6s8ABqG8jO00Jwdy++C39Hr7
	9MlPDn62u4ZZGZHT0Q+1NuSxqzt9iul0FuHFBi5qdl9NzSsORnQ+LuXPhbeGneW07FZayqbbKVu
	L1H3V5L9BVRaOsFJBEl92wCNyy5KNHe5xSEUFUw86KiInn8KfU5PA/fm/5n9Q7AYTHnYeFGeEJu
	C+q+OMxj
X-Google-Smtp-Source: AGHT+IHFA6TZyZzj5zKebKMPbD5MvWXbAMQRgtvdNPIShavDxnpEu45VjwenpBR042wJxB4xGoJ5Ug==
X-Received: by 2002:a17:902:e5cd:b0:215:7ce4:57bc with SMTP id d9443c01a7336-21614d3b228mr9364535ad.16.1733437372098;
        Thu, 05 Dec 2024 14:22:52 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0b571sm17310435ad.183.2024.12.05.14.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:22:51 -0800 (PST)
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
Subject: [PATCH v2 3/6] docs/devel: add b4 for patch retrieval
Date: Thu,  5 Dec 2024 14:22:38 -0800
Message-Id: <20241205222241.3789437-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IvB6iHgGreox

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index f8b7fc59544..99f14d4b44d 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -427,6 +427,16 @@ For more details on how QEMU's stable process works, refer to the
 
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
