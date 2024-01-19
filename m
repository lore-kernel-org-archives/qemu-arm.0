Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881319ejg;
        Fri, 19 Jan 2024 03:42:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw0ntqsYneg19prcwsaB8vMejhtf8EI367wontVrWWCK7wfzHRVG6QClVxeNOpm2Vu3XHV
X-Received: by 2002:ac8:5905:0:b0:42a:beb:2998 with SMTP id 5-20020ac85905000000b0042a0beb2998mr2321603qty.91.1705664569428;
        Fri, 19 Jan 2024 03:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664569; cv=none;
        d=google.com; s=arc-20160816;
        b=EB+9EuiB+HbkJgDfCH3ypgY8rQUwqUAoYVCxZHcXCRhDV8grvDSoz/UXKhWM0paC1V
         GfRWmtLc7Pu8+iKe1aBS7ZyyykVe3PsQsHkKTQQXqdMDGrXbecm1sg4o6T+2wJG9h319
         fRpNHHWZ5+gXbiX2pmCJ8j70Uag8EgUweyxw10uTwbVuGL6oGFmTIaq1pJdclQKidkt1
         dz97S5kmC1USVB5hakaRjT/pCHqonz1zFrREGV654rB1VqhtMWw2CrbhCPiJHsCiO44E
         fkgj4ylLPNpOGY9IXTkqdnc1QBefV1VA113j7z7QCjhsnRUSjxiHNWG6lYLhURj3AATu
         eg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A62n8Zh8RpmMErwo1MEyf8UlsAdx9GAivnN08aL/XMQ=;
        fh=XLakvtB6oC5IMcaqtPCkqGbS478DvU9x3LtFcAk/a0g=;
        b=hpPchzyiieWm21pLaH/D1YIOQysJf08J96Cj8T5OxoQmXN2CZ+3ri8oxs6P1D1LR/3
         BaqpRlJyW+kmXGPwOIExA2QBzxYy1CodIk3vs1Mzav8LfEFtYN8LyZdbStNLplZUNcWn
         JE5SQjMs3dySiScC5icxBY/vhP2uFNVkOhY4vCe7bkYY9dOwQqzpoMOhvyYxuF4q4Nqq
         ECVMU5UE98+sgmBhXRRuKqL2LR8McoufS0hp4fhDBN94I2OQ81Ng7IIYV6Jd5dorWvGM
         CooQ6A3EwMk/kbTP98VNBfm+B7zbZwXV2R0ngDzxUmiqPN3fgYEkV7pa36/R/sgMfs3Y
         HeYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eiUOTzRx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a13d200b00429f136c83fsi9740727qtk.56.2024.01.19.03.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:42:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eiUOTzRx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnBX-0005XG-1H; Fri, 19 Jan 2024 06:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBN-00055I-VZ
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:11 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBL-0002wf-54
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-337d99f9cdfso466029f8f.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664225; x=1706269025; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A62n8Zh8RpmMErwo1MEyf8UlsAdx9GAivnN08aL/XMQ=;
 b=eiUOTzRxxJhCL0AtVbS+3pkyib0S8oN3qJuJU9cAOpzky0vokNRM4MF4JkghJ5CM+1
 sOWQMBjr1jHAOtOG9yP4K/T6NIfIukxVieXTtusZG3svU2YvafRSzayMxqcyKMvSD4SK
 FxALO+Dn8OFGlAXmAK5DvIlPewQWT0y7auz1qCJB20L6Kolqz0tiV6nemk3SuVJxdMLm
 OjRR7MaGcrjC/Dp1ys/FdiVbc1SMudzuRwUu9ZEpKTUmIgM3EcfSKJMxYuZofsPHM26l
 SbmnzrWV7i0a8oEauHLmUp7e3ODHmVecmWEufNQpkcHZVUdYzKjPuNym7oItk8GRua5W
 uINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664225; x=1706269025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A62n8Zh8RpmMErwo1MEyf8UlsAdx9GAivnN08aL/XMQ=;
 b=BDSIbEtfhI1xhxtcUQsYJZgbG0CrRY1RO8CTGI1wZG0PHYVrfeGuCbNj4uYUWZkspI
 CWg2Xgx8MuRmSK3L47US/ygpFM4M/HKrLva9kknKouCYkEoje2Q1wC/jBU3Alo5rLQ8C
 ZSbcMxBemIx1OsNGgoXSuYVkDU24xkIo2dB1WWJvoeTcYAtLf9KkE4pK7PhYqSU8D+Sf
 deQJrt5Xnk1TgoO57jTadeACx9/JD5oGW0bUR/tI55FrfR0CaUcD+tM9b8P5fw8IcIo0
 E5rBw5eFRlOSCbVvISfQSp5aqZ7fbo6XdgzaSPyUFzkcJ7Zbilaa5EP1ALdK/OAPyps0
 fXpw==
X-Gm-Message-State: AOJu0YxuVpwNKw1hrPLfUTPIdaZW6n9b6VQJOgTc+udhJGTQMQb4nn2e
 vmKs7zMnUpgqcbrbVXXtlsX3MNfGvh1iPKShTFHGuwyq4fMGV9YrROjoB86yszE=
X-Received: by 2002:adf:e610:0:b0:337:aeee:4bae with SMTP id
 p16-20020adfe610000000b00337aeee4baemr1442716wrm.47.1705664225789; 
 Fri, 19 Jan 2024 03:37:05 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 x16-20020adfdd90000000b00337d6539d52sm2974212wrl.18.2024.01.19.03.37.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 26/36] hw/s390x: Rename cpu_class_init() to include 'sclp'
Date: Fri, 19 Jan 2024 12:34:55 +0100
Message-ID: <20240119113507.31951-27-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vRCsrdpiqHap

cpu_class_init() is specific to s390x SCLP, so rename
it as sclp_cpu_class_init() (as other names in this file)
to ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Message-ID: <20240111120221.35072-4-philmd@linaro.org>
---
 hw/s390x/sclpcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
index f2b1a4b037..fa79891f5a 100644
--- a/hw/s390x/sclpcpu.c
+++ b/hw/s390x/sclpcpu.c
@@ -73,7 +73,7 @@ static int read_event_data(SCLPEvent *event, EventBufferHeader *evt_buf_hdr,
     return 1;
 }
 
-static void cpu_class_init(ObjectClass *oc, void *data)
+static void sclp_cpu_class_init(ObjectClass *oc, void *data)
 {
     SCLPEventClass *k = SCLP_EVENT_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -94,7 +94,7 @@ static const TypeInfo sclp_cpu_info = {
     .name          = TYPE_SCLP_CPU_HOTPLUG,
     .parent        = TYPE_SCLP_EVENT,
     .instance_size = sizeof(SCLPEvent),
-    .class_init    = cpu_class_init,
+    .class_init    = sclp_cpu_class_init,
     .class_size    = sizeof(SCLPEventClass),
 };
 
-- 
2.41.0

