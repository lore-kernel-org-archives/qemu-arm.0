Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083573ejc;
        Tue, 14 Nov 2023 06:40:22 -0800 (PST)
X-Received: by 2002:a05:6512:3c98:b0:507:c507:c9b6 with SMTP id h24-20020a0565123c9800b00507c507c9b6mr8998350lfv.41.1699972822116;
        Tue, 14 Nov 2023 06:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972822; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4gIO5/RuBNKn5nDragXk8lNw95RzV25HdRabssG8kr70+9+DGpDVLjoU7oAe9OaR9
         e6ej4ikK+7jm/D0n2bNGS2wUuoeO4v1uEcWWhiVcjGJ4Yi+v7qMxy5fQ4DNah7IST6DH
         RsXqmO/L+rADI9d4czyIEYfLKOChgpevQEV77MLQo3Lz1Gj1UJm0ZVpWYaduWMkFBrI2
         oxnuIba58LX8M4PLrLOclMBh/NEC0z6GxFCk/dKu3ewJ8TybwLMyHKcgA2TST7pHEYeZ
         w68vlNxKVx3iUGs20DkY0N6yrb1FFMeDbcJYnGxnmVuo9HQnwRlRZiLyxDHU2P0iaJ3a
         3hqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xWc7O88tTfL+IROUfXsM+NSd2X7VWDO4aCdpc797HXc=;
        fh=HmK5r7mZViO4nQL9yfrGC7+i5gIPLTvrHBCedGapqLw=;
        b=uwqv+WzQCvooYjwSMkdz5icOVExXjJtIP7vnpUfuB6i8VfcFh2c4/1soT+sBHg+YWa
         CDzLOeeQcIEH8M/RZRlZjMsooCjY7T0IIJ9GJYPPG8E/+VQk65bLj+ONBnUYyK8iONXl
         trYTIvF1ucT5SGDPssi7uGobswkJ1HyAcEYdK8SJjuBzCCgB6bG/a7yTHat629KP/Hn0
         bp7bzE6BYgA5eaozWU/zkwjc+k43k2TIA7PQ898eXhFYCzMgX5sbmv5JSrpbjxJEiEdr
         hFOFRhHLs2EiwDT20RkLL+KCvxmn7TPuxC6zFb0abvPT3MIkYEFonwQwJO8GJWvbyUsj
         lRYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nrAQEfWy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fe6-20020a056402390600b0054766c42343sor1137701edb.1.2023.11.14.06.40.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:40:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nrAQEfWy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972822; x=1700577622; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWc7O88tTfL+IROUfXsM+NSd2X7VWDO4aCdpc797HXc=;
        b=nrAQEfWyd4RRIoTcye2ylm8401Ev1X23LqcVNUqCp2qX1kp/rE7nYpMymjhehUhrCm
         7h0DVsXckoOOG2lyjn5xxSm8aNzr0vG/43c6OpWNm0QewiTbH/7o8G3gRThFhXCo79tp
         +a0bAiBDY7oM3/+CLKvuEP1VKj64hqsNLMdEU8fU6bKSbcasCdrTzcjuG+ED6kEOpzhg
         xYKfie7qddPFavPkpVMb4/heDZML1wW67E9lPqvMkTKGdVPbd1sOKQZpRwdDT6LhaRzn
         yXwW1OrpnFX30R8u7Ykgo17ic8Um9Yx9GKJV2aoejd+29gUD2mj+Q8uZlG+q5DBicSxS
         mWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972822; x=1700577622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWc7O88tTfL+IROUfXsM+NSd2X7VWDO4aCdpc797HXc=;
        b=U1YU3zb69JFVVv9haU+gVsYvIx33Z1ki2+BbKsxb4Qgybns/RFDyi22JMEK/C8OCHL
         5pexXx8+zuFWP/+4p6sTkm+f8/zREa86fTrmquGppTiK/ZHPLI5jdU436xZSNG+oGYTt
         F6BTuDXM3I+6yUbUQfPXJJMPCYtvUlKl25VpvZxoNZPW3LhP53mfGSBi32N53GZ6UUp4
         GyAZKxtwWTVR1rF9uTvOxCwGoiNRgSxL5b91iN35wbI8Adrnfvu3hcYr4w33P5hGh2nu
         jff1bInXOx0ZsULr9vrXRDKm363axjxKLHY9v8aoo2x1DnyZHm/1NdNnxzdLDAGZUpEF
         Bd9w==
X-Gm-Message-State: AOJu0Yx4HAvKl74/5ZCIdYyIGhX0O7dMBHP2DJpQ8ANRnWEsuvKxQz1j
	3y/GI/y25Ku6BefnX4/ZMYhux6Ew
X-Google-Smtp-Source: AGHT+IHNrn5T4boQ0NzVhZdNm2rxcLbpt1HdZaO6IACtyCbzFgVV5y7RIxXgNNvQBcNbwz/XH0TntA==
X-Received: by 2002:a05:6402:518e:b0:543:5c2f:e0e6 with SMTP id q14-20020a056402518e00b005435c2fe0e6mr7401790edd.17.1699972821905;
        Tue, 14 Nov 2023 06:40:21 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id e29-20020a50d4dd000000b0052e1783ab25sm5343752edj.70.2023.11.14.06.40.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:40:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 v2 18/19] hw/i386/xen: Compile 'xen-hvm.c' with Xen CPPFLAGS
Date: Tue, 14 Nov 2023 15:38:14 +0100
Message-ID: <20231114143816.71079-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rgsEwavM1Nky

xen-hvm.c calls xc_set_hvm_param() from <xenctrl.h>,
so better compile it with Xen CPPFLAGS.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index 3dc4c4f106..3f0df8bc07 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,8 +1,10 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
-  'xen-hvm.c',
   'xen_apic.c',
   'xen_pvdevice.c',
 ))
+i386_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+  'xen-hvm.c',
+))
 
 i386_ss.add(when: 'CONFIG_XEN_BUS', if_true: files(
   'xen_platform.c',
-- 
2.41.0
