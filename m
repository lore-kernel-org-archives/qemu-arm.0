Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1414344lfb;
        Fri, 20 Nov 2020 07:45:52 -0800 (PST)
X-Received: by 2002:adf:f852:: with SMTP id d18mr15922921wrq.232.1605887152771;
        Fri, 20 Nov 2020 07:45:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605887152; cv=none;
        d=google.com; s=arc-20160816;
        b=sIGjQ31oY7yxGDVb8rcO7loUGo70t/767ZKBBlQqga4T5LOWP0KNPpQ1htpuCxPkWx
         n5FFnTjmbWwsGNJ37nQfCJtFqoNZiwynvu38R9zcovZ+vxl8YpXs3xw+jz7z8gRw1htR
         Pmycl7NGY6m6zIvQ5eADNB51eZHxDfIC+eYygdIBNp9Q+2L3tf1Pt3kiNBTZZF1poizl
         +27RHuE19OkTz9w5OigKFDypSoE2zWwzlEo1LMJ2bm5WOW9rZl/AacB61hid0VT+xuj5
         fZAvtBa4CmsNoZ23VKyz8w91U3SHAxyKs1LTpNj61kR/f+uQOTnvFhYctuMX4J/RQJGB
         Dd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=emCLnc/OuqxeNdsEYCGX+2nYKHJ2SF/H7wX2h0SEpds=;
        b=0qQTjIPTqyPSDGvzdir06A7nlJOV53+huhbJ3o1w1yo0Ws+tuVh22LNLLieQ3prTj2
         CLYsXG/jv8HkGumXXlKGiY8qZI5kzPcgeBdpo/ozpD9ZBXT9HLWgoC9THElId/krFqFC
         Y/H3rwf1h4ZkI11Zpn0QSZ0ydcDol7+fZdnn9LWlOLFgr9YnKPXnQySQ12mq9IfnbfrS
         UcGDF1hFpJ6sdtzgWGjHLUdWdKzSa4WHZFpi0GJo8tF1B4PZipuzpSxF8CApuwQE1zCx
         ubbAKhblmP/CrLyhhaY8UY+j1WeEfbPyoty1enIZ8GTEDWH+0sG+5QEicIbqb88o4dCT
         /t2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pG7PWRKH;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 67sor1826991wmb.8.2020.11.20.07.45.52
        (Google Transport Security);
        Fri, 20 Nov 2020 07:45:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pG7PWRKH;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emCLnc/OuqxeNdsEYCGX+2nYKHJ2SF/H7wX2h0SEpds=;
        b=pG7PWRKHJfRfImJnvBjuVULSdBfELwegiQEzvPGjI7Ey6oS/+dZB6Ox4oyJuDtVIhq
         vagPZKWCuPTQ0t3wHWv/+gBZi1+zOZJ7HG5sqnHSTXmPzuZN5D9LVuncUGp4YMSF2jk7
         v2W/xYIAhntDVY/UUw3NxsGQP/sM2rZ/KAeiPGpQPkjGXJO5Zhj1k1CS2jCQjdMmQ8ZZ
         eCyHce7P7zZde8L0o1iXZesl0LgaTQJxczTw0UGlNaKCqDlLIpc8iij1SxiwIWKLHMnr
         pYU6i7a7QszhshRr5zOV6Ac24ykMTo0bD4luwNzlTAWxTMJKEAkGK1gDfmuQqC0ufMbg
         9SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=emCLnc/OuqxeNdsEYCGX+2nYKHJ2SF/H7wX2h0SEpds=;
        b=pJXNaRHSkB7LL4tY+9Q/Ny7JvB2edSQKEcjBBt9XPZkmyl2E8lxtVf0h40GWsH672P
         heNtULGTiTZLpqC1VC8AJRbOYijYt6pRxdbUsxAVXKZVQOo/fJdpnSZUWCO2Ti5YiZUV
         V4gwNWjOn3mAL9mFKDl5qI77MSMPzJ62OlGYphbYkV5iAwvuKt4TExPgimMzCJtBkw8l
         GxOgibE9dYUe3PyPgl0+kmdTkJaP9W9EbiafpaUxYLkH8sE4DJi6BxBWA6LAwJUygLDy
         YPxVeXjGl/MjPbK6XeCHoqgvr5ap5f5aXmar1uKfU340yP4wewW1r+sq6e+kuV7hRD+m
         OyaA==
X-Gm-Message-State: AOAM5329oih23lqRiHVZIRZ0pgMy2/KMYMwG9nJtuhQ9H9cflb8nuJoq
	33bY2gp6+tvJ2vfqrMHVJXU=
X-Google-Smtp-Source: ABdhPJxC0ueqzDgBXTZXRttwbVH+SQ7sWJdlRDHjacMT35VjXrqI1unNy7HAP3TQREy5PNZ4scCprw==
X-Received: by 2002:a7b:ce05:: with SMTP id m5mr11513752wmc.16.1605887152561;
        Fri, 20 Nov 2020 07:45:52 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id w11sm4942109wmg.36.2020.11.20.07.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 07:45:51 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-5.2 1/6] MAINTAINERS: Cover system/arm/cpu-features.rst with ARM TCG CPUs
Date: Fri, 20 Nov 2020 16:45:40 +0100
Message-Id: <20201120154545.2504625-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BaOzSwUPD9LI

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ae9fc9649b..8d7a6026b91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -158,6 +158,7 @@ F: disas/arm.c
 F: disas/arm-a64.cc
 F: disas/libvixl/
 F: docs/system/target-arm.rst
+F: docs/system/arm/cpu-features.rst
 
 ARM SMMU
 M: Eric Auger <eric.auger@redhat.com>
-- 
2.26.2
