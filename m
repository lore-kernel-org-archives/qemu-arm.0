Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581423lfo;
        Sun, 31 Jan 2021 03:14:00 -0800 (PST)
X-Received: by 2002:a5d:4a11:: with SMTP id m17mr12934122wrq.39.1612091640151;
        Sun, 31 Jan 2021 03:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091640; cv=none;
        d=google.com; s=arc-20160816;
        b=j3MbHsrp+gE8kqwSF4g/TiyYwzBf7jl3uCnd7CJZGIPjgudDxhJYRcSgqJgHtCyqN9
         kHt/fEybQfWBNF3ABXFW8+dqkDC+UGbcgPlaJeRuLJ8QAeyffYuwxedAh4+rWBIgMn+h
         F2RjGMqGxa6StrDgoohzbg/l8+Kkkg/20ikziRcKxalwQ3ZQl6pndMuDhElly7ZpWL2U
         JBaPYGydqIR70M3OlOLPfN5j5ArVv8i0c/FKqPOrpempNpgKEwRZj1rY0NtGKKbNneJk
         m//LiFy8dsylZLagKqPJybdyiLnxO+yVvr8/UJ9UacloQjKAa7fR2UJuBOxxwHN0Gm+i
         Sccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UVDP5iZ65cycEwd/7jK5GwJYW+9woRIPB0EI+jBBZJo=;
        b=psy8ixrQ6j7r6DPoPBY+iGZhPMoLX1ZNmbQdaYN6tTKpei5Wh77ul1p/sIjV5MskKl
         Pqxf0ojEf7RoKESHmTGnkoDe4PHWT8fx38QBVDel/s44ViS/3l2/a9KB734dgq1SPP17
         rxXsuSBxOSbY0sICu5sGmeSLS0bXqVVWCwhhJk2Gr9cYDHQh82bgIYbISAN327PbKAL1
         8+EVRRpLc+aiRBkAdR+YHpwhRRxeQWeFdjqyL/r1l46yZNV6CDJ1R4PmgSzHHqeKSOSs
         WRHZg8NO4mjLNZjxmIyqWLJwKjiOQiSR/Y9RBrw3gdqKeFROsgxqcGjH63VLwMqc/Lyp
         jFAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="H1VKl/jL";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t5sor7217087wrm.19.2021.01.31.03.14.00
        (Google Transport Security);
        Sun, 31 Jan 2021 03:14:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="H1VKl/jL";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UVDP5iZ65cycEwd/7jK5GwJYW+9woRIPB0EI+jBBZJo=;
        b=H1VKl/jLoZuALreDrzHs6jlJJtI4s79PnyL65Fvkl559kD9TTO17/wUhjhNnr5kScT
         QqnnPVAbLkjv+sAPUcEO3jmvccBu7FAqhvC/PefidCgeN43qeMjJhE4UfOfJ+N5ZkUSY
         iVefVaiXTReTEkXxOt+JPv4rKLBeA5QwprmR22cZugwbQVarE2SdF7/af7EcRv2stro2
         zNFRLWlS8MFXPRxBSDbeXVwVKUBcC7aNs1LnH47iw42iRmvEuvpDatknxNCuor1qiwLF
         gQKcDvDFASkjrOgQaHZdRgwAHx6m3Qc3lsKOJ7Et81s8nsly93n4nGXuUKlr8CWszXeP
         oyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=UVDP5iZ65cycEwd/7jK5GwJYW+9woRIPB0EI+jBBZJo=;
        b=WHvK+SsFxMyBmx+T7mPN1pB7KwQjymhyqjB+kJm4xcVSfFwwbtja4WLX6hnvF0Ks2U
         0nSvjcHVbR/xPzYbNyM0Y7iAjrVRILeUuWNBr40CYjxmw3S0G8mocmMIRinztU4wFYpd
         QiVbAG2XKUppuBI0r4WNVWUnwDxZe5DfatI5oL5gLBVvqLl/RtLzq6FuOs/ZaLjOvT4N
         cR1kOgXjbQGZiqPTxTprAs06WjCOKK3OUsQ1Ah82FD3NbGPspIhWtdYWo+thTRScbuV1
         iacJf2Nvy2HJfuugHlKGgBuqA6HCfvPIc6Kj7e+n75LM7zogNkRvmxtidCjgKsXf75ki
         YQxg==
X-Gm-Message-State: AOAM5320Wps3Kf/fdzYn4Glp3atyBb5J1tY0LHnYGCxc9+6zDm+FMfty
	bQ/ECVerRhDBfLYbLkguXcE=
X-Google-Smtp-Source: ABdhPJxkPyi7k+bbTRrGn1kJUzqknXAJNH+OD/SNSOUMw81yzPYOXWCbbKwCfP44+Y2JXFpoeOojDw==
X-Received: by 2002:adf:9148:: with SMTP id j66mr13801208wrj.28.1612091639958;
        Sun, 31 Jan 2021 03:13:59 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id l11sm21775517wrt.23.2021.01.31.03.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:13:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Anthony Green <green@moxielogic.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Walle <michael@walle.cc>,
	Greg Kurz <groug@kaod.org>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Marek Vasut <marex@denx.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 06/10] target/i386: Move SEV feature to target Kconfig
Date: Sun, 31 Jan 2021 12:13:12 +0100
Message-Id: <20210131111316.232778-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HN3Zfh2Eyb3A

SEV is an architecture feature, move its declaration to target/i386/.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/Kconfig     | 4 ----
 target/i386/Kconfig | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..3d67c172dab 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -1,7 +1,3 @@
-config SEV
-    bool
-    depends on KVM
-
 config PC
     bool
     imply APPLESMC
diff --git a/target/i386/Kconfig b/target/i386/Kconfig
index ce6968906ee..27c76c554c7 100644
--- a/target/i386/Kconfig
+++ b/target/i386/Kconfig
@@ -3,3 +3,7 @@ config I386
 
 config X86_64
     bool
+
+config SEV
+    bool
+    depends on KVM && I386
-- 
2.26.2
