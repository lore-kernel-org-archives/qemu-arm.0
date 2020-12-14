Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2877526lfq;
        Mon, 14 Dec 2020 12:07:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzC8SOO8FXI2FvScnnsOggJeV5Q0/0cuVnmVn37N9Ur+9QKh3TfONLmVEvS+Y2y8+g20cfF
X-Received: by 2002:a63:4:: with SMTP id 4mr25550746pga.443.1607976442835;
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607976442; cv=none;
        d=google.com; s=arc-20160816;
        b=ynJX8PmREMcnKU7po0dZ25SFUuYJ1sYdfHMVvZLI1tZhAHE2A+wKFg3DjE2vbmjjZN
         Icbq3JzdiBUF+9zdWTuHRtKnyQ6BLID5HPBs4h/6squ1+MRKKuCYJO9gJGNoEwoQOl+0
         CaHfaf7Rq1P56TUJmoMqHtIiN6oTWHIiC1IY8bTQHvsnghwgNOr0XnQ97zaOr3neC8Bx
         +lt74LHck9RYsf16mM/WGUK7l8Q+N2yBQRajuIUCD667xVGeLHZOj+q5VEHmK8tRasSW
         aspO4nv4iOf++BrBlrMkGkrw/l45gNl9Fgr7jdLvkrviert4UUFpW5QEdy5fQXmt0qHK
         Dm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=CinOSy8LsDZBNIUKlYUocjnFRDHtvHx0abtRoteA/Ic=;
        b=0qkBc6pRI8EA+ScaW3kJft1Gupv8T8o8L+neerDqJrfHOCv0tKeEK42zf8yXBbD3xz
         D3eUMI7wQJ1PAM76qbIkBl3DteN7XXKVL+XliaYXevxChw1mhTEd9X0XibRLdQkIvd9L
         aZ7+bSM0KfxJfkkvSxVOu3DyC0bT5z7HyEHQqVhU5MqzVSQAdFYHyw28cNlt3kFh39BA
         Ubai+C+jYdoNYcHOqtmd/OmLvQ7TsHarm4bhzZ7jfaSQkYzNdnHgw5Ag/Y5MhYxELEUw
         Wggo7G4l8DYFlDPvlexLK9qdOYbSDaxLGLaFzRTuj5ZtD29ACAjWWP/G8NlZQLZWQJaP
         TXhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=O5fR9FhS;
       dkim=pass header.i=@keithp.com header.s=mail header.b=po7cFpmr;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id j3si4349752pfj.250.2020.12.14.12.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=O5fR9FhS;
       dkim=pass header.i=@keithp.com header.s=mail header.b=po7cFpmr;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 6431D3F2E37A;
	Mon, 14 Dec 2020 12:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976441; bh=K/dnGbL6KdXY+xkFW0YSD6lvsulh4HeeZNJpZPFGyjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5fR9FhSTh75lAnE7QU9tYA63Dzwv+F3cwwN7PgWOcI0/QnK6zRigzDxh7APTvLd3
	 wLOJ7MLQTgflE14es14yIWv+YauzDltrV4XpBIGBkmCL+bW23TU0jagEnoTOWV4x5d
	 c7Zib3glDj5OiSrN/KHM1+7AvxHl+Xg9FHsGYz6MYpNZaITw8VK0s3ITNtT8moVczy
	 wq3sVMQuhG/lf1G64T80k1LjfPxZLEgmr/Ri61whcvXoVRIySEBOnKRFH8pnTfx+2E
	 aDuVXV8RVOiIKKLUMTNscQS3B0Nkb5kFFmBbSP25xx4icmnsro4KcxlfWXmr4oT3UC
	 DTs0PpiYiq7Tw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v4noaiu2j1Z2; Mon, 14 Dec 2020 12:07:21 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id CC9E73F2E392;
	Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976438; bh=K/dnGbL6KdXY+xkFW0YSD6lvsulh4HeeZNJpZPFGyjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=po7cFpmr3IvSqjD4oZPRT8cmajDRLewCAXzsGkSPr38FV9sb4alAq+46GSnltdr62
	 N7iDS41HkbIfKxejRNEXJO4bUVuBEPKJdwBd9IR1KwGrGqb4gzr1RD0T3mVyaL8X1u
	 bUse0ryvcbbCv01mYSZaJy/0AxE8E3sQjlgXumlYlqhb3ENJPmzpsVJpGudwMADNAD
	 9VpjqeUSbHdPiHYgmNdrksFml3zlcG17u4GZ7JHZLjY5OD+wRK1JuytygnTxhS1ZUS
	 FlVKle7s/91a23fQ3lO9g4IAvfFZd5v5PRf9hhK9A8ScdBQ8B85IAeF2QtUi9T1XkT
	 xr/lJXI2n9EYw==
Received: by keithp.com (Postfix, from userid 1000)
	id 620B4158229C; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 9/9] semihosting: Implement SYS_ISERROR
Date: Mon, 14 Dec 2020 12:07:13 -0800
Message-Id: <20201214200713.3886611-10-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ssv1Mj9D9azW

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index b0648c3812..abc15bf219 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -59,6 +59,7 @@
 #define TARGET_SYS_WRITE       0x05
 #define TARGET_SYS_READ        0x06
 #define TARGET_SYS_READC       0x07
+#define TARGET_SYS_ISERROR     0x08
 #define TARGET_SYS_ISTTY       0x09
 #define TARGET_SYS_SEEK        0x0a
 #define TARGET_SYS_FLEN        0x0c
@@ -967,6 +968,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
     case TARGET_SYS_READC:
         return qemu_semihosting_console_inc(cs->env_ptr);
+    case TARGET_SYS_ISERROR:
+        GET_ARG(0);
+        return (target_long) arg0 < 0 ? 1 : 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
-- 
2.29.2
