Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1733319ejb;
        Fri, 16 Dec 2022 13:55:37 -0800 (PST)
X-Received: by 2002:a05:6402:5389:b0:461:5e1b:85b5 with SMTP id ew9-20020a056402538900b004615e1b85b5mr28280268edb.2.1671227737101;
        Fri, 16 Dec 2022 13:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671227737; cv=none;
        d=google.com; s=arc-20160816;
        b=RYS1cPmSkFLFW+SptS7Cxd1vqCDEuixP1sXRr+Bx1roiqenWssMVwq0fvTv4nNSVp+
         J1szCym9Q2TpoIWQ+Gv9kckYr+PUCbSdUZlP1yaZOMXr4tkJGBSUZC6A6uo9QcEW+I36
         Sg46vkWtCnwk1XTjN3LxLtKJGvBbVfNN+06uxsiMjrA51hifukIoVhLJM+x8hs/glIg8
         ZRYNzxsQpN2o8uBl9mrTJqevDEtm1RcJfOkvPFniYYJiWZ7Q5cIJhJZOMlevaYQvag6Q
         1FZbyDBChgi9k66W4+PN/W5uxQBIqWLFRNPKHDfJdfpjriTkJ6VEgy6MZWvB794psKI+
         ITqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nvZo37ZGtVvWlqFUnT7DRRxDMf6Z0v34B1J4o3P2gxo=;
        b=EX4LnhFN2eU1c37meWflQ6Lvrg5809rSzmW+5Up6vAoirJ8Mxym77eQSrplUr4YSoO
         coZUca8ua109fAjS6sUChZ6evvcctiSxQFw2aaw3w+ItpTYYB7nUIAsk9om24TfQYgVF
         hUc55TNr7+YKJh7WJyaY5AMcxLqO7ArQXrUz0Zd1KnH1P/7JwbjNKjkiYgb+QngUXGxc
         hgbNwKPz13mW3xcTvlkcm2C9W2la+Nokk97FvbGgH8w/vYCiNv1l2YqyJIwKCVNw1Nbd
         k9zVNW6Nz21rSJPZERDz6J+9ysOaZ4z76MQTlI/iU8mK5pmHLo8BdhVx/HbKILrK5gXv
         xmTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QS0A4bcm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u2-20020a509502000000b0046b00745ec7sor2044441eda.31.2022.12.16.13.55.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Dec 2022 13:55:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QS0A4bcm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvZo37ZGtVvWlqFUnT7DRRxDMf6Z0v34B1J4o3P2gxo=;
        b=QS0A4bcmsLrLzAvLNYrOY5w8cZdoY1wwxif6xMojgWQOAiFtUT0tyaroPGfboOpQ2M
         9tTkUTUiUIvNuaxXdEl79rqJPjrVybuh5vKsJrfjDWzWk/3saSRlFFqHnJp4MAJrOX8y
         /ORKMsnJ9Xbrv0tjAgP7a65XJR0xgndOa8Hc12o+v4ZHAsJNmSGQKK7pMY9zrikKGhy5
         gMx3W4y4qmn8yUBQJfvGteoFvNMU+DJXU2QDEOefmTnGQfb+v6778f+oNfaGDVbVBkAu
         zRV6hWtnAaMFaCOXfSpnNctLyz2SDDScekUo/i5qbeEyy7GQ0s4N1/3cDFH5OVYtr3FL
         y2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvZo37ZGtVvWlqFUnT7DRRxDMf6Z0v34B1J4o3P2gxo=;
        b=rKzZ2M4k6tdDZx/2COX0S45nHAwwi6b6f1dY5a/OOKYDx1FE3Cpy+5wC3o1Wi0pCJB
         sayiSf2ZFTlt+3l+VbmdJAaUiyBsBp6PWwPsfOykKgPzibL4TNSOBBXbz+ZGKElr28wU
         er44tMUe90UPA0x4xJFSwodx4CmhhLFrCfOd1F1VmqSdCHBVCjTnrAWWB7M9MXLB9jQg
         fbtSSOnSMtWq4CZ4ukXt49tKCTRGbL/+ZwV3KxQ18mvgOrADRBsVN0/IMycNALJqLR5j
         UO+5X9rrT7zVVXGSSxrZhLaOoeXhVYP3nmOftzkfUd/uXsmi9vlE45sJ/mqC/GsCJDCR
         Zw0Q==
X-Gm-Message-State: ANoB5plvkJwq0PnZBy4ktJ8DADJ7ibXAKcfVrSPqGgMCph7/o1B0aW3l
	OUSCLL/xEzybUp4nQ4hVUYowyECf
X-Google-Smtp-Source: AA0mqf5kfpZN4t4L2lET0LgUlbZyIuAzHNhhqhUt6pU5qluuvLw/vvtion/rV3n/7E9moXZb6GvBmA==
X-Received: by 2002:a05:6402:2989:b0:467:4df0:7185 with SMTP id eq9-20020a056402298900b004674df07185mr27588064edb.4.1671227736819;
        Fri, 16 Dec 2022 13:55:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id cq21-20020a056402221500b004678b543163sm1338647edb.0.2022.12.16.13.55.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Dec 2022 13:55:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Bin Meng <bin.meng@windriver.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>
Subject: [PATCH v3 2/5] cputlb: Restrict SavedIOTLB to system emulation
Date: Fri, 16 Dec 2022 22:55:16 +0100
Message-Id: <20221216215519.5522-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216215519.5522-1-philmd@linaro.org>
References: <20221216215519.5522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mgRBYoaYvqgg

Commit 2f3a57ee47 ("cputlb: ensure we save the IOTLB data in
case of reset") added the SavedIOTLB structure -- which is
system emulation specific -- in the generic CPUState structure.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8830546121..bc3229ae13 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -222,7 +222,7 @@ struct CPUWatchpoint {
     QTAILQ_ENTRY(CPUWatchpoint) entry;
 };
 
-#ifdef CONFIG_PLUGIN
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
 /*
  * For plugins we sometime need to save the resolved iotlb data before
  * the memory regions get moved around  by io_writex.
@@ -406,9 +406,11 @@ struct CPUState {
 
 #ifdef CONFIG_PLUGIN
     GArray *plugin_mem_cbs;
+#if !defined(CONFIG_USER_ONLY)
     /* saved iotlb data from io_writex */
     SavedIOTLB saved_iotlb;
-#endif
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_PLUGIN */
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
-- 
2.38.1
