Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp383786ejq;
        Fri, 5 May 2023 05:35:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mF+9PtmETlZvSI57TV9oNeWchHBDZ2waVWoHexQVwmR9efMA0hLwNP2HPWSYPBKfd444k
X-Received: by 2002:a7b:ce96:0:b0:3f1:75a9:5c0d with SMTP id q22-20020a7bce96000000b003f175a95c0dmr1068473wmj.26.1683290131899;
        Fri, 05 May 2023 05:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683290131; cv=none;
        d=google.com; s=arc-20160816;
        b=LDzL7z7GT0myEvs4bgEDOqIAJVJdEXuoOv5a9HNLrJteVZnUICdP0kzYMNw3+55xUp
         F2J+SLw44FkgbXDnNJI5+rnu/GCwQj6bXGQs8L6X/Vw3fqG35+AsLhIhZrtaTZBwPmlm
         VV3+Wu4Ld623Cip+sgCOi3P8AxFtgM3zgLXZaJjAma/WwxUzNewqTDq0k/NZE6afX2G7
         kerjR88jdlYPJWKOG2jukZX9KFRnjJWEHUpLAdFgnwntFcj0BCUH1EJqm/NmEFzD2kRx
         80bXyCSkcnOtFZt3Y9fL0Ar9jcebNm6IWrtKP0Mt8IfT1t8z0o3JgGaVRpyRHSOytgjm
         c4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Ppt0sa0XAwy+XRuOa3p9oGr7/EBACeoA3VT1BgrZHhI=;
        b=TD7nPQ9T6OT3VAlf7HUei+1pi7bbN0E/Tw01M/Jbp8xk3cDK1bpEa99J6byol5vFIQ
         GQWL93fWaJ1ARcOU57Xo0S7tG6YUAHjm20U12ud4u+yWI/hKy3XGYkYLufXbAFp+AZMA
         04tif6VX4oWDBGqtizKnGd3/yXqE5GhB6507acd3vFbcJ9EelvU/YZ6LylTo792658ZW
         1FSOJbjOKM599WKlmFJEOGv4k7ui6N3uoUvQ1QMUir5KQSrJbP4KuyGVKR7npK6Y2ge5
         hynMPuDFO3581zvRYPZpQhuagck0uqn5niFh6A5fhCDAMxvrfYEYKoXsVZZSV8eCiXKp
         4e6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MLywpLEi;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id c12-20020a7bc84c000000b003f17affe148si3895674wml.208.2023.05.05.05.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 05:35:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MLywpLEi;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84B0022AE4;
	Fri,  5 May 2023 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683290131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ppt0sa0XAwy+XRuOa3p9oGr7/EBACeoA3VT1BgrZHhI=;
	b=MLywpLEikVZVZ/dTKIx8GrtuNLeG81FpJyb0SqvhE7tF3h2KO8B6XwStDjD6VJ/CnEpm/+
	InBj5jCbLIv6QjbS5KVbbw5vHr7AqYDhdVgv/KFkgAvbVJ/uUKniGAGh93qyIO67pQr0Nb
	wYuAF68rxFkKgDlq/a1rHp2aTTxm4BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683290131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ppt0sa0XAwy+XRuOa3p9oGr7/EBACeoA3VT1BgrZHhI=;
	b=uOokQTEprtud4ekXz10WjrWuQzV6lyVpbj/fjBVsWmRH8ygs6scalnMGc7909N1wWgWQaw
	q7uLTc0sEhDaIrDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D05B13513;
	Fri,  5 May 2023 12:35:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cCIqERH4VGTaOgAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 05 May 2023 12:35:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/3] target/arm: Select SEMIHOSTING when using TCG
Date: Fri,  5 May 2023 09:35:22 -0300
Message-Id: <20230505123524.23401-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230505123524.23401-1-farosas@suse.de>
References: <20230505123524.23401-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UeXgFjWA6zKd

Semihosting has been made a 'default y' entry in Kconfig, which does
not work because when building --without-default-devices, the
semihosting code would not be available.

Make semihosting unconditional when TCG is present.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/Kconfig | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 39f05b6420..3fffdcb61b 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,13 +1,7 @@
 config ARM
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING if TCG
 
 config AARCH64
     bool
     select ARM
-
-# This config exists just so we can make SEMIHOSTING default when TCG
-# is selected without also changing it for other architectures.
-config ARM_SEMIHOSTING
-    bool
-    default y if TCG && ARM
-    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.35.3
