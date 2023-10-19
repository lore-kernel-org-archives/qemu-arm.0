Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp800005ejb;
        Thu, 19 Oct 2023 14:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtS3qZH2KckIIvjlsPJJCSVzHCe4vOKqDY//+bIIAoTk4hOrAfq7TjNfLilEkmrkkYmdw
X-Received: by 2002:a25:c8c6:0:b0:d9a:f897:f9b4 with SMTP id y189-20020a25c8c6000000b00d9af897f9b4mr3255323ybf.65.1697750359808;
        Thu, 19 Oct 2023 14:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750359; cv=none;
        d=google.com; s=arc-20160816;
        b=gRzTk62o1KHCcXF9nMME/vUU359y2Zt/ZKh2XS4yukY20aufcSDmFS6Z11jIOjVb5b
         /QmWwDqTCFfSIfl4VEARstbh7jbpXnFx1tMxpaOuNiKF+FpzJpUfpEDkBmkCRYSpHf9A
         cRDvXVw96Kkf/Pj45OR7zGhZCDUKwPYP8Md50f+cl/u5AgKAArZK7XAq2/w4A9em5zBW
         bbVCsLprt7rAF1uwFStIXGmmsao3zP6FZ3u23R9SwiFoGZVzE+mKt9KbM+lV3v9IN/b2
         wr6ETyy2ZCv06PRrlEcYh/BAptxeqtU7OVIAw9EBLqqpp71RfX+6ZKnRJmtk9dX9TGDJ
         4etg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kiEw9YpCoXl5uwZnYD6Z6QL4RjcbavrFkOGyAF3Ak2A=;
        fh=ckwBQsqz2xEj0TM3ZdnCjvIA59leA+DNG3TK60N43N0=;
        b=uAGnTa27ncPRAVBuZ5N7H5L00pFhFs1h9ZWG8lwqk+8yXPMWYj90ylWk4bGg6gjF3D
         Qr+3ofjQzLTHz+VsvrefLQjAEmg0Z4dPGNIrCUi+HpQW/EHA+hxyaM48UgDY17zPZCrz
         ZRm/Ss6AZEn23D/ZW2LOeirmEuEzPswvsdu6MWmLooqhM64FyFw2rGL0KCVwD/f0eNuk
         jsSdUd/9JDfayb1T9xiJQtHx3RQeM1vEmDMl/caCYnhT1WVC77luL3jtpSQJ9hADsjGP
         H9qxRehtIaJe30HKbHojY7WPF1TV5NaFFLhBoptGD6gaxPPushQ1OHv1B1XaaoqgfZHy
         Nw8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TSSkRj/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020ad457a8000000b0066d1e996112si368777qvx.135.2023.10.19.14.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TSSkRj/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaPp-0004xk-PT; Thu, 19 Oct 2023 17:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaPo-0004uO-10
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:18:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaPl-0004W0-Bx
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:18:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso103250f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750324; x=1698355124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kiEw9YpCoXl5uwZnYD6Z6QL4RjcbavrFkOGyAF3Ak2A=;
 b=TSSkRj/b5FdRwYnmfAj+2T+70VEgqQ48MGSrRDOdcXeZ0fSVzb6EeGQJ43whoNXJIH
 vPvVg8+bXHnr0mkAWQVZM00Qk3F5yYtrNtQOhUKsI12bqISDEiWZDVt2xBnYj5JCcklJ
 rx+lJH7gxhZqekM5xh0kXeBsR1ceIXJMmFXZTrvnGbNpUu4vkEUOR03Zoxo9qbYOEI/F
 ct7Dz0ren0XiekVxRIGjtMsGP6LAsmI8ryRL5FYCjfZMxYqHwileQ+FgACf2Vxm7a8rF
 9qRvuPG26Rv0uZlVHXSDno+lOSjhqMh4vejx9bweX0k8vxQfVkMOB+13OpNRocWIQILN
 Sl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750324; x=1698355124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kiEw9YpCoXl5uwZnYD6Z6QL4RjcbavrFkOGyAF3Ak2A=;
 b=tqBm7aSiYuqAPyzY90qjy6Hg5ZjEErII1UG2ASdh0at3Geq90TFAERgSLdesC7W44O
 kjVPCNzuQkddp0tpAQfbLoPITJ10ONzJ5GxH17Hc71dd6pqkqaaBHIqYB3pTq843Ml7Q
 8/bAzFXt8zuiVsoPGaFKuMEUVVBAvP8Vw5lN9+dSOvbjfqMxBJGh1NyxbhdbpZ4L1JZf
 lYpGIa3s+cDIhBNimQETTVyPXKhbMFHYkgLnmAZ6I7b/QsQBbDxJXqhhDbGcFHeKMtsG
 KoSjLuOJw1QoAbvB+Ejm5EW9/hmYANc+0udXLFvjX5m8OD/Eq98mmksQwi+H6rjYbdae
 qz7Q==
X-Gm-Message-State: AOJu0YxNlD8EtwMg4bJZ4rDCgUspq9idtD8DT6kbK6Ssz2wUFJpqRMkb
 +okreunNVCqLJPGlxsVoYenMGg==
X-Received: by 2002:adf:ee49:0:b0:32d:bc7d:c431 with SMTP id
 w9-20020adfee49000000b0032dbc7dc431mr2176023wro.1.1697750324033; 
 Thu, 19 Oct 2023 14:18:44 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 f1-20020adff8c1000000b0032da75af3easm212753wrq.80.2023.10.19.14.18.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:18:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 04/46] MAINTAINERS: Add include/hw/intc/loongson_liointc.h to
 the Loongson-3 virt section
Date: Thu, 19 Oct 2023 23:17:29 +0200
Message-ID: <20231019211814.30576-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: NgzOQ2SqJHIX

From: Thomas Huth <thuth@redhat.com>

The corresponding .c file is already listed here, so we should
mention the header here, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-ID: <20231017153345.233807-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29b350f819..91ca93328a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1336,6 +1336,7 @@ F: hw/intc/loongson_liointc.c
 F: hw/mips/loongson3_bootp.c
 F: hw/mips/loongson3_bootp.h
 F: hw/mips/loongson3_virt.c
+F: include/hw/intc/loongson_liointc.h
 F: tests/avocado/machine_mips_loongson3v.py
 
 Boston
-- 
2.41.0

