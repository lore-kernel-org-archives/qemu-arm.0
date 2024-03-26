Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1432169ejj;
        Tue, 26 Mar 2024 08:45:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2eOwIEKh5Pu9C7aJtpn1kiDvGy13WYAeIeDx7msPP1K28m1uC4JwshTf7tydcHkyAzZ3V5/3YQnPLsMVpHgIB2kTfQeFa
X-Received: by 2002:a05:600c:5249:b0:414:1fc:1081 with SMTP id fc9-20020a05600c524900b0041401fc1081mr2063096wmb.36.1711467920855;
        Tue, 26 Mar 2024 08:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711467920; cv=none;
        d=google.com; s=arc-20160816;
        b=OtbGW2/OUKuVoBnTdDOoHj1RrPjVId6I7rUX3JT74ePdaVfB66pteqgC7pRkAtBEtt
         Y7KUvK5/mtVEM90t0SODHSkuefvbyA750VWitRnJNAtaUl60ayqD3zMzfaZaHyGfUEOy
         GpH9N8eyk8xVBl/xT+7Qcz4ZHMlfbLX4Wemr3zRUVNl5zqdjKNtZFlKar9iVBd7RYdf9
         3NQ1yh94g9I/7s6wUypSspi9zg0uENUTrzfn3VlgV0XXQsLrszmroPEegY2VtbyOQhis
         MjsAW/Tqi1d+UOkJaxQlYC/fiQ47OuvvhEu1aOnwzYhkBx3u2U46kacz2gomcNolcEyM
         ac5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D+2sufPZV1jZbwqSWcGkqalb0YdlIEBcm3JneTAQYPE=;
        fh=hOvFLsRUzzDM41klNA+6MRPlNk1pVOEDm1IIhmfuHos=;
        b=N2I/+r0D7Y6411dNY2PBOk4dpRql4prwo/P7nL42aEzmG3DsPjklsgK9v6AV+hOzWP
         l5VJOu8U/arcrjQLnym0xYBxjGIdFM5dp4tSx9h1bSX8g8uw5xWQWRTxC6pokeaFHORx
         F+z4yh3AwC7LtjqnBMbWfskoefLVzGI4YF82NsQwlIRRVlK0xbOKfJR1MfMQijpBblc6
         di5Z43WPt4nvt+vA3d92Z7Ul63cTTknZAwmonLKyoGA6URJ6GhxR++Z5p2QBV+FG7jSM
         n6w5X24MN4RiGy8BM6UAFEIlfk7Xug8bLIB+rpq7lnAtgvAEJWCTdxrS6UWh3RvNSD96
         a93Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFGTJY53;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q13-20020adfab0d000000b00341d977bd5dsor396675wrc.2.2024.03.26.08.45.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Mar 2024 08:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFGTJY53;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711467920; x=1712072720; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+2sufPZV1jZbwqSWcGkqalb0YdlIEBcm3JneTAQYPE=;
        b=LFGTJY53baSHdEmOiSznWN9y3WbyDYU1uhE+L4fyyGWerOpuWERliKEyKZj73zNXom
         H17PXk6yxzWSlqjzZWeNFNKTeHsA2ATvXp+x5CxyRjrcJv5kLeNWPG49U2br0d03HT7b
         DaBXhywJKx3uyk+eyjqDPl3G/3iVjzcSSzpQ9yqeVQ77mi3Gamf+7rOn+8snc6TZfd0d
         XeWfHu15qqvvtVkMntDQIMWaHMaHByIYqjqsOd7JaBWiOlXzXRqRawAGIqVJpt5qUCwS
         m3xTcG/CS+6BOMVMEKefWHi8+C5lFBKrlcAieKXz4t7XkV6R44L1qZtA1CNPILm0SK8x
         qLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711467920; x=1712072720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+2sufPZV1jZbwqSWcGkqalb0YdlIEBcm3JneTAQYPE=;
        b=O2TxhFmwTsLRy8ygFpUP+JfIv2/4/8JfFxTC5Zck6RwoEBXn6px7ym9lB8mts0A2PC
         g/+26vh2ImcSyqll9Guxn1uptgGPYxRr5uFA0OBBkICLxNlfeD1GU23yPO8gXZU/H4hw
         4NgjP3VIW5LTcapspoyrqJfPKU+knTLEYku3/VoWE29HFNsJuvKYr0p+Jhibj/MZPN8a
         U5tPsagMfcJLPs4CFydUJS62YIe44agWgypDDhkmHAVQkRGnNC2lKJVKThloKGkZQ3SV
         twZClp1jdJKbs8rzLTKgau3AOIFVrQZOiiW4kfSHkcE61ct6pbuBLFlCpNio5BC1wyMd
         N+8A==
X-Forwarded-Encrypted: i=1; AJvYcCVkPnjWzsV6W62/4JS9DY2oi3NIgoVz/mGr7doIK/JMW52BCfzDDmvzVkYQXfrZmEfIb4wx2KE+z1Q7+/1t3SuTmmNkkNi8
X-Gm-Message-State: AOJu0YzJsXcflU5Ml8YKVqhvhXKS/6eQhiCJdhnlie5oxvGrfuwwIBTt
	FmcYotZrkBN3bIU62nPoIUlgTpRJDioITDeLPxXDbQpTnx8xCEndHe+leE1TmrbD6eOqk2X1rAr
	VLsY=
X-Google-Smtp-Source: AGHT+IHwKtFMeWpq3ZJE9GoM5WPki6NX1BeYC0H8+aqSC47II9qYUq6lKqa65FD9RBme1NGAf6Rm0g==
X-Received: by 2002:a5d:63d1:0:b0:33e:bb5c:f60a with SMTP id c17-20020a5d63d1000000b0033ebb5cf60amr2406678wrw.66.1711467920447;
        Tue, 26 Mar 2024 08:45:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.155.229])
        by smtp.gmail.com with ESMTPSA id ay26-20020a5d6f1a000000b00341dc343e21sm573910wrb.65.2024.03.26.08.45.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 Mar 2024 08:45:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Lorenz Brun <lorenz@brun.one>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <fam@euphon.net>
Subject: [PULL 02/13] hw/scsi/scsi-generic: Fix io_timeout property not applying
Date: Tue, 26 Mar 2024 16:44:53 +0100
Message-ID: <20240326154505.8300-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
References: <20240326154505.8300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vMBlAO0kRhfj

From: Lorenz Brun <lorenz@brun.one>

The io_timeout property, introduced in c9b6609 (part of 6.0) is
silently overwritten by the hardcoded default value of 30 seconds
(DEFAULT_IO_TIMEOUT) in scsi_generic_realize because that function is
being called after the properties have already been applied.

The property definition already has a default value which is applied
correctly when no value is explicitly set, so we can just remove the
code which overrides the io_timeout completely.

This has been tested by stracing SG_IO operations with the io_timeout
property set and unset and now sets the timeout field in the ioctl
request to the proper value.

Fixes: c9b6609b69facad ("scsi: make io_timeout configurable")
Signed-off-by: Lorenz Brun <lorenz@brun.one>
Message-ID: <20240315145831.2531695-1-lorenz@brun.one>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/scsi-generic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index b7b04e1d63..ee945f87e3 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -752,7 +752,6 @@ static void scsi_generic_realize(SCSIDevice *s, Error **errp)
 
     /* Only used by scsi-block, but initialize it nevertheless to be clean.  */
     s->default_scsi_version = -1;
-    s->io_timeout = DEFAULT_IO_TIMEOUT;
     scsi_generic_read_device_inquiry(s);
 }
 
-- 
2.41.0
