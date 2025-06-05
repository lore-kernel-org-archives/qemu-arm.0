Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp488154njc;
        Thu, 5 Jun 2025 12:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXW2WvbIMA8ff+aXU8mDCmxCZX8H+s9apoqphj947zHYYmLVf5Ggg+kCwzFxTuDAkgUmvTpzJmYd08v5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGKM8CTO0ySbF9jD9h5fVYCG5mW/oUfDZ0TxbskqniYk6UCylqC3O0RhmodBJ8Paj7p+yG7
X-Received: by 2002:a05:622a:228e:b0:476:b7cf:4d42 with SMTP id d75a77b69052e-4a5b9d33e91mr16121811cf.27.1749152206114;
        Thu, 05 Jun 2025 12:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749152206; cv=none;
        d=google.com; s=arc-20240605;
        b=L02ie2dq62DUapxA2ZY0nB6c1oqP8Jo5epp5CTEoZJLF1Y+NZgshr1yR4KfkpqtUM3
         TAEJLcw3F19xvry5wxFFcZVANeD9AFPODNdDR0i9D745vEWQhDaJn4eUKEXOfTd0So+V
         D83M5YlT0I4gtqmlhMw/85Nh4Xlk7MmXwz1uMY2exKmrkpbaypIy3GIZn1AlIl2tO+Ke
         ONKJnpeBgAZNfiUjHjJei8zPVVhTuXuf3nRH03QFYKnEbrSnnbdny1IVlkg3w5kdBb8g
         5sGaXu0iI+zfFew0LjGMZC2/VbVHW5r5+eptpuTXGq2SOEJ3BQmXDJ63nN9GEXBKQeUJ
         IzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WEDanJuT5WWXk9pLyRjI3VBPkEYLoZCOaoP/BA1XIzI=;
        fh=LiYgnoRamy6GlmFaag7I2C+uKI2XB2RWV6DRAqopszM=;
        b=MeAyJd0JR49PeJXLfsFmqMxdWBr4mLZgLl3g6GlvgN3h7nBKpfjbsiQliV5rA8Nod0
         7xGGSkHywk63BCHhMvqdyeB15AHuctLBr7l1vHHg21Fz36/ZgiqcvNtByAT0Opw8nReG
         bWW8N7e770A6a30ZZI4RQMWlvMChIvVh/MP+l0KD3HQT0On3cHXPfHSYybzhgxYF6qKF
         16By/uebqq0AbS/xF0dhEMJw/IJmXJIUXCWRUZaesnz336/KYvEdT8DbqqyhI3SYi4d6
         iVvKl0Di47n9wo9RWWogypSRvqaSaIUjpEEyhAqM012dkb+5KCLuTw5k6ltC+vttvGG0
         OAdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXUu01cl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61985c75esi142031cf.286.2025.06.05.12.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 12:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXUu01cl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNGNf-0006kW-1A; Thu, 05 Jun 2025 15:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNGNY-0006hf-NN
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 15:35:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNGNT-000166-Dz
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 15:35:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a366843fa6so751255f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 12:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749152148; x=1749756948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WEDanJuT5WWXk9pLyRjI3VBPkEYLoZCOaoP/BA1XIzI=;
 b=CXUu01cldqKDPVabUN5W7UTR0ufznTeB5ImugbyT3WsRUqD3/kqYoFwznAwdmi3475
 V56DP/axfeZCn31SNQD4/8gXCFURDmZdLwJCv7NQRJeb2aiJbcLAO39DoMEHL0rwglED
 fjhPTyzJfFEUbT8KS5snlPHBQ8iOmbfN/nJs0VHqT4i9I8GMWcyWEKcyTr/7O7zf+tep
 lNfWyBFTyUzrOY2nh5uBuaDLn9jcXs78gFhazrrWYK1NMExnqWMvqlwU1Q3KMtmFNL8k
 3nH7lCfNtt8eLgQVLjm1gGD3oqG2ZUgEMpb898QyjHA/6KxSIO4Cx2on2UG2UGaujrCr
 uR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749152148; x=1749756948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WEDanJuT5WWXk9pLyRjI3VBPkEYLoZCOaoP/BA1XIzI=;
 b=rXkcszkE909ASBRX3W1ydmqMJ/jB6eSikeKQqopydQKEoU8AxjMxlJcxHrm4wK383a
 yNX3lrZFE+NCAEtmY5yxR7NFlhUpqxHyHI1bQOgGyRmhSzF5KMqznq/YqD1X+EBueqaN
 dUgzG3+QC40wAjlNSCbNJ66fFpFzHGkZwxsXMIWUCk/LyNmwBfU/4V8bmPQTraJP7LSx
 136Q7Jv5XIxPYBn5B+fLpurlu5EioPxBCNieXOcmmh4YP7JKTQuR6nq9nc9SRAUwB7fq
 /CxgAPldGLBEZwiy0c1DwmM3e8i1xXwaR9LMtD2c7VD1YYy2OAk+dJbjW7b9XKTUCd7Z
 CW0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsPIZ47IaBBoWZwphpfZGNLaPTAn6no333aYr2CXDpjtn8cCs8+hZhdTVprUItaoWoWSl59u7WKw==@nongnu.org
X-Gm-Message-State: AOJu0YznvyVEID3Q2/QItrcOehky3t/QJsuBtFtRYI/pn0omqINdNxfs
 WyVpQ0U6rdtKfx1qi/HKfaWWAtSmgpsged7+ir9HWw5STuu26ZeNajjxwx2moUpj/wo=
X-Gm-Gg: ASbGnctVD5hpQduEKqreZEilCXziaG5ZeH24e71F68/aWq7faRE/r2581pfnhwj9FZX
 to7QmiO5CDwy2RPrCKU0wge0zD4apmHqR/N1LdOMtiPIBeDVqd8Cuk8xL+uSu+ptUZU07C1M5pw
 +D7n07XkCeqrtiUMjnhfVIDqOPXx5exkuQjHwK1Uni4pDpD6JRh4b5vbr+Bh8EpINe1Z3JZsbju
 sEjeFD3BcV4JpyFCspMy0hk7TX2HKYP/IylOQz92ghPm4mntdTB0hYGOkMIz4Tedqo2ECU13vDM
 AkQfApNRlAMswa9XKEWJ7SQokn3rZ/0j8uSG5SafQGbT0KfFmKSROUPW3TS2oOTZ5xCwssXYx7j
 DC/WdkqPYIQYzClXClG+DUHdhhw==
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id
 ffacd0b85a97d-3a531caa070mr364860f8f.13.1749152148183; 
 Thu, 05 Jun 2025 12:35:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45213754973sm2179575e9.35.2025.06.05.12.35.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jun 2025 12:35:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/4] hw/gpio/pca9552: Avoid using g_newa()
Date: Thu,  5 Jun 2025 21:35:37 +0200
Message-ID: <20250605193540.59874-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605193540.59874-1-philmd@linaro.org>
References: <20250605193540.59874-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: upc2iVJRpO/v

We have pin_count <= PCA955X_PIN_COUNT_MAX. Having
PCA955X_PIN_COUNT_MAX = 16, it is safe to explicitly
allocate the char buffer on the stack, without g_newa().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/gpio/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/pca9552.c b/hw/gpio/pca9552.c
index d65c0a2e90f..1e10238b2e0 100644
--- a/hw/gpio/pca9552.c
+++ b/hw/gpio/pca9552.c
@@ -76,7 +76,7 @@ static void pca955x_display_pins_status(PCA955xState *s,
         return;
     }
     if (trace_event_get_state_backends(TRACE_PCA955X_GPIO_STATUS)) {
-        char *buf = g_newa(char, k->pin_count + 1);
+        char buf[PCA955X_PIN_COUNT_MAX + 1];
 
         for (i = 0; i < k->pin_count; i++) {
             if (extract32(pins_status, i, 1)) {
-- 
2.49.0

