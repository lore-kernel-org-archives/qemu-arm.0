Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp169800njb;
        Tue, 7 Jan 2025 05:58:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+psfz2shbClDh6+oV3tFrmyezmFOUQ2cR+DVkYB/Bbm71ev42RN0QW8jUlyoeRpFrHUaG5hfA8u+1QA==@linaro.org
X-Google-Smtp-Source: AGHT+IGqZc6nnMuLU54xH/gExlxWrUKDMuY4pf1Qn7UnmLXCXppdlUqwMr2iF4zwnejXHew+RWz5
X-Received: by 2002:a05:620a:1aa9:b0:7b6:6d99:ecfc with SMTP id af79cd13be357-7b9ba5e08a7mr10524671685a.0.1736258317446;
        Tue, 07 Jan 2025 05:58:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736258317; cv=none;
        d=google.com; s=arc-20240605;
        b=d2OEbgBpTR/F8z+fatR7fCxGYjCCMaA3raDsNT0t69f68o8k49ok2OwEaWWD193zKO
         7ml1+2f0axLK3DZ1yh0DQ4wybBlZyY0KJP+o7qcMQ3phWhcx5Z1vfwPp7ir+1sq4fYLN
         D4wDpq+gBCjr+JS6/AslF833GMXFRLibCukAa9CZ+chmf+zOgWOB4DlzBQd0oBqiRR0W
         8RWPMOZAWTDZDTpo5PSuakyfgug7KpoiIVqIogGbjsUPdMNtHaRMLFh3KmiCh8Otx+mA
         cD3EYtsPSHe39TgsWzI5VhbVf5XZgS/QbBVmzrrVIWKUzJSwVMNNdTq62Mw6XOKeKKYk
         aFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YYtSO87TvztjAyXEjizFAAxhiS+XoOlqzVv7TToVVGc=;
        fh=t2w8mzUnDuNDDIzWE5+LGpiFYvSPLrAuKcdaOMMpArA=;
        b=HWB4vWbMfiZMct+aVxYNOIDvHGbu2qH6zSQphbsWjnTeiy8KfPipr6FORzBQ9Pqwqx
         8oHSM6V9DjsptVn+7/AR6gdu7U3M+RvDMR24u37GYjhGjsooodQ/pRfUv6sblWbx7Jkq
         a63RxExM7lojQiuk+ZCf4g0P7W4LwHsS2TTPL23BUsdap3eMhwhXpobOHRAKHOCzv2Hh
         nfcdX/vIwsqVkZnENLLbZ+Ko3qt23xOIC36rfavBHN+7ee6noSAnRHRY9cxHYyRZO5mB
         pacxaUhmh9IckTlZA9+8wm4l42TAVHDZJzdKC0pogP11tk3rgoVN7GehXtzZ7ZHq/T2s
         NLqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VeyDfdE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ba2d9b5c17si1381974085a.282.2025.01.07.05.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 05:58:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VeyDfdE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVA5m-00061M-Mm; Tue, 07 Jan 2025 08:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVA5e-00060L-En
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 08:57:51 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVA5c-0007NO-Vx
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 08:57:50 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385e2880606so11269581f8f.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2025 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736258266; x=1736863066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYtSO87TvztjAyXEjizFAAxhiS+XoOlqzVv7TToVVGc=;
 b=VeyDfdE0sX+Zmi83bP75LGhPM/wgKSG6BR9Qm5XOmoafQjUDdOiOsNQG62GYmKTcsG
 75eIm/jr4qMVa58kc+9/6VtCzKDwKGvjBKEHlFwuuzwESe/FQbi6STedbxOq7iUfgHDB
 jMgJj71g5PVrNc+ltRC+kG+KZ5aK4zoKznGutjsGgAfTJ/oGYqZq9hVGm6q84hFmh1EL
 nc4pYmE7FgT+vEvVDdWN1SzpFq5oB8AeGAR/WBmRtiZ6SSLemoOz5ai6HAP/D+Td+6fJ
 UV3pQwlxIa7foYDEA5WmbGdSXxc+ALXfqgamRRDQ/DMmt3LVJUX04xc9JB7CwuVmvxu5
 h48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736258267; x=1736863067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYtSO87TvztjAyXEjizFAAxhiS+XoOlqzVv7TToVVGc=;
 b=g1EpSsps9smJm5LhLVK4+6fYAV5tZ2JgSGVZQy4QDHr4ohODbY3DHrWPuTYadDCHlL
 dSCbMf6TpMrTmKEHSUp5ytncJmvYWbeSf+8MqOUKYxDd1iJLAAweKSnXmXZyA3IKhKmo
 14ltSJWgH49Bu5Fb9LZDjrJbdKMVvOIFKZOZ7fBtvmsCaG0LEJoaP9XnO/34e79EZaL1
 95Wd1dt/fj5XjDKQH82qd/YhWeWqFUrQ8/u07qjy+LgI+xwP6zdKaW5JtHpsw4nCIUBJ
 Qh+ZmlDDHHS8rXs9/3evkUGeNtDwTDjm3bkqVo3jGJq/+jmxe6a86dPVKpjlt3PYmMkn
 ZNPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Ed6l/IbCsG4D4r5WMl9bRmbSVxKFkyWX/QQOggVLhq06OLOO2AdV5EBRLKJllxeZyldT1f9OuQ==@nongnu.org
X-Gm-Message-State: AOJu0YwIYH/MafJbPI880BqM9CZe/G048dJcxhihGfV8uFVxiwrsqMFU
 QffNX8gOih/WjNeFnTqPOFwTaPdpT9uq4viIOOKthhuIOmHu+7AV7pIViWfCqzU=
X-Gm-Gg: ASbGncvlneWkBjlTa15wq6R/DU5PO0xpD4zkK+eqnOVeo2W4AJ4Ood4ILNI0qyiE2s7
 YN2Yq9geaMbd+7RpaT+tAMm+PHmF6w5EY5gc7u3ZGYmc3aWGVv408D0pEJKxQKhOjGwh9FcNH4d
 Gq2gXJYjYz7atk7hTccayYpT0ZdAUopearVa6jbLlMheYr0Fk20fCheGv55atBetx5o3GF6P5u6
 EgZDHG4LjYraIIuSZCByO74BGTv12J8XF7hkrTvK+IM9QKoT8p/ylYSUF7/IPTZ/PuPjEfPX/fs
 LXYDLmt1GVRdKXEsjo9EFjd+0X4TXuU=
X-Received: by 2002:a5d:5f54:0:b0:385:fc00:f5e1 with SMTP id
 ffacd0b85a97d-38a221e2448mr54763938f8f.9.1736258266671; 
 Tue, 07 Jan 2025 05:57:46 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8289a0sm51878061f8f.7.2025.01.07.05.57.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jan 2025 05:57:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anton Johansson <anjo@rev.ng>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Zhao Liu <zhao1.liu@intel.com>, Thomas Huth <thuth@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/2] cpus: Introduce cpu_is_of_type() helper
Date: Tue,  7 Jan 2025 14:57:38 +0100
Message-ID: <20250107135739.48324-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107135739.48324-1-philmd@linaro.org>
References: <20250107135739.48324-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0E3KGxDCHgV2

Introduce a helper to check whether a vCPU instance is from
a certain QOM parent type.
We don't need to use the type-safe QOM cast macros and can
directly access the cached CPUClass (see commit 6fbdff87062
"cpu: cache CPUClass in CPUState for hot code paths").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 9 +++++++++
 cpu-common.c          | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c3ca0babcb3..d55d4802ceb 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -795,6 +795,15 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
  */
 char *cpu_model_from_type(const char *typename);
 
+/**
+ * cpu_is_of_type: Check if a CPU instance implement a QOM type
+ * @cpu: The CPU to be added to the list of CPUs.
+ * @typename: The CPU type.
+ *
+ * Returns: %true if @cpu is a QOM child of type @typename.
+ */
+bool cpu_is_of_type(CPUState *cpu, const char *typename);
+
 /**
  * cpu_create:
  * @typename: The CPU type.
diff --git a/cpu-common.c b/cpu-common.c
index 4248b2d727e..2541a81ef87 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -455,3 +455,8 @@ void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
         }
     }
 }
+
+bool cpu_is_of_type(CPUState *cpu, const char *typename)
+{
+    return !!object_class_dynamic_cast((ObjectClass *)cpu->cc, typename);
+}
-- 
2.47.1

