Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026331lfb;
        Sat, 9 May 2020 06:09:21 -0700 (PDT)
X-Received: by 2002:a5d:4dca:: with SMTP id f10mr9270895wru.347.1589029761455;
        Sat, 09 May 2020 06:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029761; cv=none;
        d=google.com; s=arc-20160816;
        b=c5wFq/8XSUAg/ZXD/2S5jYMzmYwxfUSD+NFnkFsxr0hYvHPAyWaZZIHHso3UySih3k
         4/cyx//DA/CGlvpMrjPv8UyffZB4XTNybT/BeO5tSTg+3Pdkh/Qxho4TbI0TQvpuFoTU
         vJsmhA6JjpLw5HZ82f6hbXrcAP9OD1noWtkxxehSlEASp6lXS1RDNHxlH/7F5tPVHYtV
         D2kTXROmnvIQ8jkTN/lvJIXx57f6ahX9WaCEELRQ/Iv3xo2taT4+DiN9lYfiJpVmSnq4
         Jc88PQh2f0+oWKzMqN7pp5wwWcsWeq58L48Bo6C8RbLfTCzqk7oOjMPzg1GKbjXLNAk+
         WZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=FsKgzNtj0JOKlhy4WvhLDnKHvG30g1UF9KO56LbtNlA=;
        b=om8jnPnk4eEiszyvl57dW0aTyaVuFAKlJpRpbOJSftfFIQMJuVEkIWwTFnK1sz2fba
         GBnTwnOtpi93JRBKQJz7YLN8ysc9B+H88xoZsyoUqNMj49DZ8y4WLJ2URUMl+EGkcP5v
         mNwmjDzEZYrHXQ2xlcGWzx641XFubsX8JVxCARkcSVHLRQzgGtDxWBAQyFwX+v1gm9S5
         d++6mcpozkU/w2XPL4bR748s/RTU0mIqPjyKrYZ2hSG45Eb3rgYqav0DyNI8gKozoOUM
         fu2385RC8kGilEJr/3AKNPtyDilBbG295MqfQVTDCn4B53CtwY/CU0ZvUJMCHF1R109Y
         pjKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QSXhQonq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 61sor2822536wrj.48.2020.05.09.06.09.21
        (Google Transport Security);
        Sat, 09 May 2020 06:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QSXhQonq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FsKgzNtj0JOKlhy4WvhLDnKHvG30g1UF9KO56LbtNlA=;
        b=QSXhQonqNvr9y6aJqookdYR2z9b+6/7vg30IC+CtmajxekI8w5NmMlHOd8VP9kSOXr
         3Qt3QFOzv4yBJ4DGsuoRdGjckHFFKV2+oYWuRHO4ZL1BvRcXWzkNNaJcwIOnxzpee3ty
         yIaPH41DahTx2g9qjWcaj2Jjwy+dsB3j8dfh3h7p3Wfmpl/a963139QKsbxPurlFs4+O
         CYC58AlfyyOs/noYt3dYHtc2uWKEuyQ7R2FMftMs/KgfrwtoCNVJ07ZoHD1/8CkUMGE4
         c+v6IOUFGGHAQVVSLlNlLI8Atgc/Am63e3IoSXUkWgYWi507/sXOv+M+JJK/Fz8751RN
         DkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=FsKgzNtj0JOKlhy4WvhLDnKHvG30g1UF9KO56LbtNlA=;
        b=iBarN/0jJg8xd2Kp3oYkMxThtU/IA/bMenwtRqOtDc5pGX4sXyyDOtgWVpXQ4CUs0g
         poQy8uge0SZXlZASAKg9FSdqaz74KW1GsCp36su9NshPGXLBcww78tZ1AOPkDI+a66tt
         C++ByssJehYFuJd5b37/asFgADbIdosyTVNRUmdxFIr1xR4Q4f93h5n/TjwjTsfy8lDp
         U28vIZIBWoVAXDNcKMOZ3SES4kHDNKhoEchH066yur4PL9UPQNFnXoHr8fqZfusNEQ6Z
         /2jPcMF/NL82MTi84vAxBamywYStzBJbgBfEQOXAIP0FoVenGzzQnLgirgFHG2TCDcCP
         TE9w==
X-Gm-Message-State: AGi0PuYx1EQtLSdsGvTISyKAK9zd+594xUB0nHG2zGQtIj65jfe2XHUM
	DevfRN4q3yDSYUgX16TtyIs=
X-Google-Smtp-Source: APiQypJsKW0QaSa4nLUBm/QYXRV1pBW3RL2/LwqZFzcRqs467g/ETRp/URxzLlFFHMMH6bHXqUtvBQ==
X-Received: by 2002:a5d:6712:: with SMTP id o18mr9021292wru.115.1589029761168;
        Sat, 09 May 2020 06:09:21 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 02/11] sysemu/accel: Restrict machine methods to system-mode
Date: Sat,  9 May 2020 15:09:01 +0200
Message-Id: <20200509130910.26335-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Kg+tUmvVH1RO

Restrict init_machine(), setup_post() and has_memory()
to system-mode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index 47e5788530..e08b8ab8fa 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -37,10 +37,12 @@ typedef struct AccelClass {
     /*< public >*/
 
     const char *name;
+#ifndef CONFIG_USER_ONLY
     int (*init_machine)(MachineState *ms);
     void (*setup_post)(MachineState *ms, AccelState *accel);
     bool (*has_memory)(MachineState *ms, AddressSpace *as,
                        hwaddr start_addr, hwaddr size);
+#endif
     bool *allowed;
     /*
      * Array of global properties that would be applied when specific
-- 
2.21.3
