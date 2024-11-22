Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748649njc;
        Fri, 22 Nov 2024 14:52:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWL2IFh3b8mhVlqqMMoTCZzuhIcdDNNhy9qn1gLcPmGY5mddx6grD3vdZbN1DIwB0FWirzFa+L/KpRpkA==@linaro.org
X-Received: by 2002:a17:902:dad1:b0:20c:b052:7e14 with SMTP id d9443c01a7336-2129f28eca5mr44726765ad.50.1732315933248;
        Fri, 22 Nov 2024 14:52:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315933; cv=none;
        d=google.com; s=arc-20240605;
        b=d7X/I/uER/pelfAtDlfuun14TQY9zqxnrvg2jk4+Ij/Rrk8OBbAdn8LaWVBuMQt27w
         /5BbhegrBTWbxA8Nccq+VNG9MEM0lBSPfOXkR0IORcscsb/f/OfRnP7zpmy1q4v+i27t
         F3kbUPTxtyC22qafoqLEJOKgyrvjXhhMbI6XdfPv6OHUDwVK26+INp+47gLwAY8Vv9Of
         P8C7NPb/bTkzoTsNks0fACBCWpwjDYyiEvGhzqHmFXdBzQh7GYb714ky/+ZdK2LcSRIf
         Z7eDQdJAqX37siNI81hAUM8k3p7cMU8/tCtl2QIFEfZUn+8Nktm1BVh1+9Jbo8zYF5sE
         yMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bWdFX19LP1eO2d2hfCa/1XQLyxsvMQu6F75MlNcMwzA=;
        fh=K0pLxXWotk5b6eshQq31JS5p8gj8s7vXra8Jeq/Uia8=;
        b=f5okEPzW2K8pCn+fal0g+Lg26YkhN46eaXPOCtCj2aW3tiQoKAgRe8/fx3mGP/U9xa
         2tjIeyWbZYm+Abukx1iQc1gFjRpabHg2bDUpfijRNCQt4CD2n2jKf/nrhxZf1CW2Hke9
         N7+UdjFwSCyudhdyocFBHA+bmlZPOO4P/BlgxfLpN1/XzF0mnEewgMCzCjGs/bBlEd4b
         wXPKBBV6S8xz+KCw2uD7Apc4/2CcdY5G7iViuiScR+fNqU9T7N4IK0bYjsdnqJI1et+D
         2n3qKJuqLtrkHl+v6Ck5b64kUvwSLKSiyxoLdk8ATFrh+OKsBG040YpCeXda6LWTMDij
         XV8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtiSCI0q;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129db4aad2sor20297755ad.2.2024.11.22.14.52.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:13 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtiSCI0q;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315933; x=1732920733; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWdFX19LP1eO2d2hfCa/1XQLyxsvMQu6F75MlNcMwzA=;
        b=JtiSCI0qpqSUkVnN28UKtVjGkXJcaWbbQi9uP4GUhFkIVdul8HYBOTanu3w3aItyca
         v48nSJUaOTb0XILCujFRXSDUxMldSP1dYWqrz+x6gj12q5GiK3Ftr+cYhMPZ5K91xO+u
         3C8Mhaj5tXOS5ib8bMNN2d+W+zoaTPiA+qhD9ZI/N13117J+TJlFioMEkNSdImPw5eHI
         a2ETMMzASlxm3qGuD0cNMsFuPpQRcvKWZyzJGgyTo2SbBS2dFMZPuQZ8a2LNC3drF9JD
         s6WGyU60eHrbCMklrgpEawun0hpZGfQzsAOmWcGAZ6scnZKXWf4cZAQ8ypqFYxQjo4N9
         nCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315933; x=1732920733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWdFX19LP1eO2d2hfCa/1XQLyxsvMQu6F75MlNcMwzA=;
        b=AH88fhLImOL8sOSytJxc5lsaXO4YdE0vLbhRFw8ARbHb7HL3hGcYz4RkB5/SEkqcOv
         1nnjHxJx9iksN3vuak9/c+rd2mMC7AkkILZrfHzCf7P2r0L8I+AXfLPq0flMyvPWhXwG
         ESYfYHKAM0HiwhYBVm0vEjjbhSozwQRzCSlTnrkmZx/IVSwEVL+exaLa1PTefleGn026
         zlcMVnMgpQFZtoWwSgxAlU4CbaiyxeBo/W+FP9P3HPmkO2NAI8NogIVWlQuuISbB3eTh
         Ft+6nrdS3cmwteKVC7xooSmfSK8tlUH2m2wuyK52QdQNvkSxPCqBVjax3S+rrkjgCHrF
         p62Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIkwZWeQb/imRoFkYU6djzSOiCM/YztluQYBLHjD6A8bRDDlw6p1U+ZrK5Qd4rmP7PPMG1xaR2yUb0Gw==@linaro.org
X-Gm-Message-State: AOJu0YysiVTCKeSuMMTX7DYFjmJ296L5f+t3hRUJacnIr7lniNEM8wI+
	pfks3ENOhX54ubS/fNiPRw1/L8ScXX5pGvaWdWNsHC/0M+UxQbkCC98XgAoNE81kAknDQycxGn8
	SZvM=
X-Gm-Gg: ASbGncs17wy1oY24MjyajW+UoIm7+lqG/+jxC5XbCiYV6P1XIkvrYhSQLPoaoiB1l1L
	WfmMmT3tpOqAW8LqX0rFmClb0XUGpLGHbXvl6QbPi3IdBhhmMwEad2RI50Gs49bIPN2EwJ1cnvW
	OhBsIolJh5maJ2FHnvTE3bk7ap/fjgSyC6khkVvPQdRWUZDfkVd2uwf+rUpYEUEcW+EH/EzbsiR
	sRvvSRvm/OErXDg2ScJ9vkDZEyWb3iBDIOVDuoijmOSm8TdF5XvY+68QpnIWbcucWouSSt+4IgS
	TebqHNTo8j4CaA==
X-Google-Smtp-Source: AGHT+IFHxlPkXIfpi2NECT/B2lMRj6kiopG/6qpcD/87ID64JCiOua19NjTqI6jGE68bP+p+XbwTbA==
X-Received: by 2002:a17:902:ea03:b0:20c:6bff:fcae with SMTP id d9443c01a7336-2129f217f69mr62632455ad.5.1732315932863;
        Fri, 22 Nov 2024 14:52:12 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:12 -0800 (PST)
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
Subject: [PATCH 09/12] docs/system/arm/fby35: document execute-in-place property
Date: Fri, 22 Nov 2024 14:50:46 -0800
Message-Id: <20241122225049.1617774-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: K2z3khU83VcX

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/fby35.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/arm/fby35.rst b/docs/system/arm/fby35.rst
index bf6da6baa2a..ed9faef363c 100644
--- a/docs/system/arm/fby35.rst
+++ b/docs/system/arm/fby35.rst
@@ -45,3 +45,6 @@ process starts.
     $ screen /dev/tty0 # In a separate TMUX pane, terminal window, etc.
     $ screen /dev/tty1
     $ (qemu) c		   # Start the boot process once screen is setup.
+
+This machine model supports emulation of the boot from the CEO flash device by
+setting option ``execute-in-place``.
-- 
2.39.5
