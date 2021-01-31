Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599410lfo;
        Sun, 31 Jan 2021 03:50:31 -0800 (PST)
X-Received: by 2002:adf:dc88:: with SMTP id r8mr13471438wrj.401.1612093831732;
        Sun, 31 Jan 2021 03:50:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093831; cv=none;
        d=google.com; s=arc-20160816;
        b=ujWwBg0QaDVGpvYtHYSlf3ecLZLWcVEJ8KeXRZKFvP9t2RtAvpMFSWHTbDao4qBJF7
         qW45z2RCe6846Zlvquz1QBFlku23qfRW/jNJVrbs7rAiUn0ExQ17tv8P7HRSEA2iGn5e
         WMM+0GKHG8mF9rAlnWVB+ozbwBMEsW/2iYkFXaJTtj9wm1nZhJFWQJdym6kKpbZfddd5
         DQhL+BOhZ2z638kOcW5/3/6hOKsogHVXRiRKVaAS5FW6Ghayjq/ZPVSldsO5XJxbKZUQ
         yi6MgGALPtU3706BkVyvZ7YR2cJfyf99bCPJb+nD/NcM8yvdj1SbYnpunCmnsF5rdNDv
         /0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=NbTS4eSvhYMRXHU2vVjE8jfBdk95n+pM+UWftFmVvfU=;
        b=K/JSqEG/QtxGmgjMogGba07IDD/o9kRmxwjNFU8O6dSFOqwQw7TSEsTCQuRS/JLi1A
         mr4bkJlnVeZJPzfdZakYStAl+hyZSHKpsRg8duiqnvDU6cZ5gubYTxu72Sy4SaX9Ubsu
         6ngCi2lzgTwfwGvGOSA2dei9kXLw8+03dxmhwBw8WKwvmxYPmLF9i6OmRSHOwtggkdxx
         LJn0EtaQRbKSwKrDl4x7+hFWaKR6urL1VjbvzJlB56gYcE/zxt37LO3qItAYF4taCyil
         plJqdtz+iPOPUwL6fiGiC6TKvBJM+LqlOnQzTU38jGFaMpznudo5r4PmqDlNBQWjmpSh
         Pj6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=h1LzEJAX;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r12sor7407506wrl.12.2021.01.31.03.50.31
        (Google Transport Security);
        Sun, 31 Jan 2021 03:50:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=h1LzEJAX;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NbTS4eSvhYMRXHU2vVjE8jfBdk95n+pM+UWftFmVvfU=;
        b=h1LzEJAXnr2fpxrCr74qTa92E0dAQb5YiEWfKSWN16Ei7mKBJSZQMVHDtkutWVDdYD
         QqYbWZZHSoxyuWQZ0pIEs9v6rLkDln3JPGHTftQ6RA5bwJSd93SlGR2L+ITnjWAutK0g
         tIS1BhDZkCAnE9y0tqhEZkdrRtZlLeW8E5mcViIcVkm0C6Wv07Py5VZXtuO1xTDY3Dc7
         mvaI5qvAC6+T8+Mvqn86Ru7LvFhZ9yPMrtGUe0qq02OGSlaFwVC0zKhpVON0ICphi4MA
         y3ISRBAX0Z+MYNv5DS5/to54WQKzMmf73GoOvsshWv3hWIjt2qa4xFrh33b18Zx6xf8E
         pYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=NbTS4eSvhYMRXHU2vVjE8jfBdk95n+pM+UWftFmVvfU=;
        b=IM5TjNh3rPGiqdqQsULVQuoDctmZ09TtCAHHFUCqYSOEMpkP8GyFmSR3JC0mbvZz27
         epB+arQ9HcFOkdbwQ1rQ78dE1ZT2JGcOfDHLLpg1k5HDq6BM9ax98n1s3TIRsDTsPAfv
         Jmp6BV3MAn4HArm3glfdnpUqnLdHIaQon40GKBjGSjPZ92IiCNvrZTNiCA+rcjPg+cFY
         i0GljYmra8AGK0Vq8YxtTkOQRsCZvLMIsh+eDHL3BPSRc7VSBLP5lBgXb559+x1bC1VG
         78L6B3d04iZGzk8yqInFtLaE4D510NiTvqNCBGkxdrKTmdsEQQhnlmUNB1oe+I6NFBXi
         7wsw==
X-Gm-Message-State: AOAM5305F3ijlUk9Uw+QD1jJwO4F39WKllwSenYgKo4p6yZ+kyz8fiZW
	qf1OdWV4bqjb37Zt5gHS2vg=
X-Google-Smtp-Source: ABdhPJzbicD1HJnXpjT27xzPC9x3I2AWZtVjzXvYLMRzjxZrSarnOD5x4M7qz2f/ytk+RI73IOJ3pg==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr13399523wrq.168.1612093831543;
        Sun, 31 Jan 2021 03:50:31 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id c62sm5346752wmd.43.2021.01.31.03.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:50:30 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 01/11] sysemu/tcg: Introduce tcg_builtin() helper
Date: Sun, 31 Jan 2021 12:50:12 +0100
Message-Id: <20210131115022.242570-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: APf+TP5GWD3Y

Modules are registered early with type_register_static().

We would like to call tcg_enabled() when registering QOM types,
but tcg_enabled() returns tcg_allowed which is a runtime property
initialized later (See commit 2f181fbd5a9 which introduced the
MachineInitPhase in "hw/qdev-core.h" representing the different
phases of machine initialization and commit 0427b6257e2 which
document the initialization order).

As we are only interested if the TCG accelerator is builtin,
regardless of being enabled, introduce the tcg_builtin() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Markus Armbruster <armbru@redhat.com>
---
 include/sysemu/tcg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 00349fb18a7..6ac5c2ca89d 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -13,8 +13,10 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
 #ifdef CONFIG_TCG
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
+#define tcg_builtin() 1
 #else
 #define tcg_enabled() 0
+#define tcg_builtin() 0
 #endif
 
 #endif
-- 
2.26.2
