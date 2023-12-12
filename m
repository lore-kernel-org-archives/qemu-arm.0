Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1025980ejo;
        Tue, 12 Dec 2023 08:31:45 -0800 (PST)
X-Received: by 2002:a05:6512:3282:b0:50b:ef68:f319 with SMTP id p2-20020a056512328200b0050bef68f319mr1193215lfe.247.1702398705089;
        Tue, 12 Dec 2023 08:31:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398705; cv=none;
        d=google.com; s=arc-20160816;
        b=eVQQXT+tkI+ZwZZ9sWiH0amkHuz6cuyjNj4x7c/+0e3EUZZIq2FgtXBPZ75mmskvWm
         Iin3hd8a11g/XxAftl9b+3DvysfbQa6MjwH7R0oMbr04XdkWKLepTKd0Mb3zKifXL4fo
         0Ag5rxz9ifJ9nx0X+VAdRtTtNwrnNhDtNFgP/UVp8O34M9/ZDFKLj+4drnOa4L54UYgD
         2mD/fQnwtkQuIbTuriqWeKNbIVp50I4lI4e3B3//jTGonfZ1lOm3OoSkUc4nPz5XPCe+
         NzQmfHr8dsAjUPWhd/VWK/vskwu6Gq33+MnU6uJpnBHIa4zllAck2zEm+jkkmtcQqxs9
         YyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0VzQTFGtBulS+CCTLCLD2ExWe/+5Y5bIpgcbR//mYas=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=TZ1TNj33aO57KGYf7fcgHMLxZGIiMyf1uDrXDKdTmUisxu1JNdmYwh98ZtHXXKtC7p
         agaoCerv9cKiplvw/iLwO70b/XkHrct96515o0rpGDPajhBx2r+d/1r3QS9B5fKAMb1t
         40Mh0trtYuHd0mQuVUO5c2gqnsbxAo0joXwZbKhovEcFK0cXDocc2qnxo99e3NXdB2Yn
         TJseH6g3j5Wg0C79AmJpb0Je25a1OUFZ0sSxpn2N8Ihe7m7s444xhGobpKCbFB5+gBxU
         NK/MScX8XAwGoS4BQhTuGMNS/2GPISsFOAbKiaRxjiCrOk7cDOnB54x0VeOGDGrCjwFD
         9cVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p/w7VB9Q";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x27-20020a056512047b00b0050bfdc6c96fsor2192870lfd.24.2023.12.12.08.31.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:31:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p/w7VB9Q";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398705; x=1703003505; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VzQTFGtBulS+CCTLCLD2ExWe/+5Y5bIpgcbR//mYas=;
        b=p/w7VB9QzvInS29L0S4Xe+1nFuGFf24vGabDZghnTNRrE53iQihy7SPIGFA3in+xGC
         zjOerdnFBkRkDh2n+WtqQIgEB3FI7xBD+W/X5+UVr5j0tAMfnViVU0ckWmamsV98FUAS
         MbwHHlENQs0vD4U6rHvvZzisfos6Q4MwSrhBlRi9JnFiKTCSzjwz1J4Bo2qw5NzqF1EW
         H3DXY4O/xaUH7RBCNlGhzPAkkDWh1T4OCS21t3Fhw4O+OxReG5wAr3F1Bh2pJ9rlRxJL
         6MGZOmbC/CpTFPZf5BTHtSYLY76TSrYZ59IIG2/9SfscJCHrSu6fEg2KZyrE8SlIwDoZ
         8AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398705; x=1703003505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VzQTFGtBulS+CCTLCLD2ExWe/+5Y5bIpgcbR//mYas=;
        b=fZ8vdHfpzfj06I1QQiu2znNLAoZWjbe/qG1sjpyCN7sxbD3wUgfCwy+5NQcsnfYCdm
         XbAe30LLG0V96sguce4t/1roxB5cUQEUZAobqrbDvU1GbGP7OcqZvL3Y0u8ixjso2R1Z
         mlJQepx8qkvb+J+IGVwbPHAVp/eBBmLyT8foEv9aQk20h1dq/16nkMKp9wMArX1G9ofU
         IRudbKJkatsj1CvzaJ1RhY4ny+Aqv/VG/1kmu4yeR+FbGDbswqOYEcjSZ8PtPQD8Lc5c
         c+mRvjgyidFwKjYW3dL7ZDbpdV8aN+CXVZbWr8fM2s+yDI2fHAwiPmwAdlMSbQsb3Y6Q
         OQ3g==
X-Gm-Message-State: AOJu0YzasL8QVCUBjTalGV0DjC4FoFK9Iqq1wO+ypdzcCFZFgBD340ye
	tEKGD/4uZiw5gc1cSA7LdlQrocj5
X-Google-Smtp-Source: AGHT+IFBnm9rAQDi2fs5vLvHFewLB/RO8lqaDp/cJ+jC29KN9FDAkk2MRVDhxXxGADwABnMwfReOcg==
X-Received: by 2002:a05:651c:231:b0:2ca:cc7:d1d with SMTP id z17-20020a05651c023100b002ca0cc70d1dmr1243530ljn.194.1702398704821;
        Tue, 12 Dec 2023 08:31:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id dh7-20020a0564021d2700b0054c76d0f755sm4827776edb.42.2023.12.12.08.31.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:31:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/33] hw/cpu/arm: Document more properties of CORTEX_MPCORE_PRIV QOM type
Date: Tue, 12 Dec 2023 17:29:17 +0100
Message-ID: <20231212162935.42910-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iZ1dgcvvduHh

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/cpu/cortex_mpcore.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index 4697fd47c7..73627bc415 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -28,10 +28,17 @@
  *  some timers and watchdogs
  *
  * QEMU interface:
+ *  + QOM property "cluster-id" which set the cluster ID and its affinity.
  *  + QOM property "num-cores" which set the number of cores present in
  *    the cluster.
+ *  + QOM property "cpu-type" is the CPU model typename.
  *  + QOM properties "cpu-has-el3", "cpu-has-el2" which set whether the CPUs
  *    have the exception level features present.
+ *  + QOM properties "cpu-has-vfp-d32", "cpu-has-neon" which set whether the
+ *    CPUs have the FPU features present.
+ *  + QOM property "cpu-freq-hz" is the frequency of each core
+ *  + QOM property "cpu-memory" is a MemoryRegion containing the devices
+ *    provided by the board model.
  *  + QOM property "gic-spi-num" sets the number of GIC Shared Peripheral
  *    Interrupts.
  * QEMU interface forwarded from the GIC:
-- 
2.41.0
