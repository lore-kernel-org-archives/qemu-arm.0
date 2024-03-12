Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1674827ejc;
        Tue, 12 Mar 2024 01:24:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSYVsTJxPTaaC0iQe+LXuwD1q8SCAM3tSGAW7ZVESwujo8UmmFUDAHy0Q/EuyzEG2EAMwf9vMCRnS65kgFlc3zff902RAa
X-Google-Smtp-Source: AGHT+IFHVXY64KmQYil+i4MEbE0Ll0311PzT69HPSQDfDVrTAL+aD9FYrNXwPFT+UV3Sad7Hpe7M
X-Received: by 2002:a0c:cb87:0:b0:690:7e89:d5e5 with SMTP id p7-20020a0ccb87000000b006907e89d5e5mr9055468qvk.45.1710231879516;
        Tue, 12 Mar 2024 01:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231879; cv=none;
        d=google.com; s=arc-20160816;
        b=JKyBfxQu5HVeQYeoyfA6BC6ZZMPg2YsMxffsM1HMys1n/o4M6X4/19PWb4a042krUC
         mq9h4m558F5/rzksyfYLSmyl7JpvBGaRrDpejNRSBo7x1pvnUT85AkVOjOntH9fggCQo
         3uONMgWjXNoJPiAdL5e8H09a7gch3aeKmMp3extWdZbeUlrym/fNIaJvR/QyeogGGZ+Y
         bLE7OUiyKqTd9LXVYO6MYL0VVEjgfdyx+XrApSrmEgEnRcnqANic/tBPuYf6Nn/00bEJ
         F9hiY9p7zr8ZviL+z23PlgVPy3tI34jq87Kdo+b2qbHsGM90KmXfUmHD6Ffr12nza+7i
         tjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QyCNdGxEUzn56uZqvjtKqW1lxcPgF0npDxgJEUvvre8=;
        fh=q0p/DAoa83wMU/IpXW0+Auv+BdiFhgFQ0g9pdcNuBB4=;
        b=aX34OkqGtvsKwZ00cJnLo9w0KeYWEgi5/x12v0qAZ6LyuY7NCBDey4EIA9dwKPxqDP
         oZUpmqUTIiaE9H558+ntn82h8T49lK597fJj1740Hq5JPrWEkBmM13VuvErZSig4xyu2
         5JnXxgsEca2Mc/+wP58SRdf4jjp8/mZ1cPfY6r+INIlLU3DuyODWXBt0v61rb+ITJ0BJ
         55GLcap4oIHpot2UZul+2uTiyj0yYDetCy+Dx/zQGvlJ7B4xcz0w2Rl6QgeuDUjX4CTq
         4SwYSD2N51x+ScEN9jI0OEdYdImA9Wacb9P9cVlRKWjnr7ZLi3t1ylzIO0OeKevZNgAC
         LVaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lesFdg4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg1-20020a056214252100b00690db8b4ae1si2436337qvb.443.2024.03.12.01.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lesFdg4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxPw-0005ox-O6; Tue, 12 Mar 2024 04:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPs-0005mH-51
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPp-0001AU-CW
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412e784060cso36385035e9.1
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231794; x=1710836594; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QyCNdGxEUzn56uZqvjtKqW1lxcPgF0npDxgJEUvvre8=;
 b=lesFdg4HTUSflfoAzyWIKAOpzPkDoogKt6NUsFGz/EQjOpVxrG6XxgfCDPR4H/Lm3T
 7xO+/UjqxJ/79LtMN8or/470jknfzLB0KlpoJ0O9Ny1zd7nWd56p+rJ7jG6aHWE88Kdb
 V4uHpXRjyyKHcY+1FEviUnbUKFPbxDznjfBaT/n3hQ14I9AvHmgWHXL6rg4L5kViiaqn
 QN4Saxe+Jb2/cNqBwtp/LzmKEtfNBYX8zpR/OTiGLh5EwpPQayI+9hkaPEdQw+c5uJzM
 kHlxasfAnpBqJaPIDD8Gv2VV+6OPOneiyqu9uTQ974IUlJkDEw79GxoT5rjKxhYXbr21
 gqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231794; x=1710836594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QyCNdGxEUzn56uZqvjtKqW1lxcPgF0npDxgJEUvvre8=;
 b=YOEwRkRsmqFNKkOGoqWp3zBftwFjMkupu2/lI5sz7cNApn5LiJHdxE0HDuVRINXnpP
 FQLIttxHGjQAT92oAcvHOXrAWDFKkc1dlDHaCjpmYUQ97uADFV11jCCfDWERypE0Vhqp
 wtplgxHFK/Kiy6u1zakkcXII9HyHprCJkrpi7cfSBqK/DmZRseCCZEAx7bcJokftX4uE
 j26qpfKcEkyFPfoY8JIVmY1bNAXMpvX2BfQgAbmueT5jAS8kJM06BQsuZJ7kTBZnN4vv
 F96QxFsvfYzQCaNqEt32UZJYuZDwXMzgaINgLlra5BnW2asMkYdJGyQiqMIFnt23u9KX
 egBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVfMfVXHgKqeE98tUPONKfVYSqptCKy1hJNyBDVYcDyeeN3eeITgtFaneUFLOiDz6lsifH/f3HwWRhKJD03Wl6FymQ
X-Gm-Message-State: AOJu0YztVUjxkquzQKYjxZUDEvMSwBCDNr1nCC4BukT6kdmSa8DgL1jt
 XKD+9y9p9rYGvpaXaMxEGAyTseRRcthgyjg6VVGL8TwHIRo9t2zdv8kTkVfyx7c=
X-Received: by 2002:adf:a15a:0:b0:33e:9ce8:407a with SMTP id
 r26-20020adfa15a000000b0033e9ce8407amr3030528wrr.13.1710231794245; 
 Tue, 12 Mar 2024 01:23:14 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfe74d000000b0033cf4e47496sm8443384wrn.51.2024.03.12.01.23.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:23:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 05/13] hw/core/qdev-properties-system: Fix missing ERRP_GUARD()
 for error_prepend()
Date: Tue, 12 Mar 2024 09:22:30 +0100
Message-ID: <20240312082239.69696-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: Gg3gfEamKrWR

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, passing @errp to error_prepend() requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
...
* - It should not be passed to error_prepend(), error_vprepend() or
*   error_append_hint(), because that doesn't work with &error_fatal.
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.

ERRP_GUARD() could avoid the case when @errp is &error_fatal, the user
can't see this additional information, because exit() happens in
error_setg earlier than information is added [1].

The set_chr() passes @errp to error_prepend() without ERRP_GUARD().

As a PropertyInfo.set method, there are too many possible callers to
check the impact of this defect; it may or may not be harmless. Thus it
is necessary to protect @errp with ERRP_GUARD().

To avoid the issue like [1] said, add missing ERRP_GUARD() at the
beginning of this function.

[1]: Issue description in the commit message of commit ae7c80a7bd73
     ("error: New macro ERRP_GUARD()").

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-ID: <20240311033822.3142585-16-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties-system.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index b45e90edb2..00c968f4f5 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -242,6 +242,7 @@ static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
+    ERRP_GUARD();
     Property *prop = opaque;
     CharBackend *be = object_field_prop_ptr(obj, prop);
     Chardev *s;
-- 
2.41.0

