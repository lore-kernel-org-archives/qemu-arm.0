Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5180704ejb;
        Tue, 7 Feb 2023 02:08:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/j+ehkliGxQBfjqeBVqWOz+7B72wemrF/ndehl4FC6dv1h02HpH7NAQLLn3kUKaOB7wYzL
X-Received: by 2002:a17:902:dcc5:b0:199:4d:40d1 with SMTP id t5-20020a170902dcc500b00199004d40d1mr1750264pll.46.1675764497711;
        Tue, 07 Feb 2023 02:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764497; cv=none;
        d=google.com; s=arc-20160816;
        b=f5LYxCZQ75tdkOjjWzXWrIIfF7zByZIjEPCLchG4iOvP9fJDI7Co4/2Idoh6WF3uoo
         PdFnNMUf2lJkIGM8THpJHfn0NPgzv/0yigOLVO1+qAXWamNbrQNXr0fEUvXUdx4pvOW6
         M4LnTra4zCvAGcQ1/mEmPRYOEZzXZDKHkBt7qP3AFBI7wR8VXNblqLdRLQNFw8kAh9L/
         kJUEf9NIyw5KL3nc/3UwM6R+tumQNQAGPfu7qPOBBlh+OmLXPRtH/H5DSwSLuDoEgjc9
         GdeCzQ5To/cbrSgA22MxlgKNU/oNeVjgtpLmgfE1a9cw99+ABymkg+C2fOyQjK9IO19H
         g6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=3CNPUtAJvLIsuCbOAZaEy6XuPlCz2Q3U6/ytvqunPCU=;
        b=euf4JMjcT37Qg7A+uZCCaj6yQg/BTgrHFRyqFbE3KLHvA4AezGzzI4qvc2GR2dwNX5
         fSdqLrPD3VqiuNxDtVOzGczQW/biWAL2oudZCelme5WP7JemSr8r3a0AzhyMb0cXgxaJ
         X2etVXjOVBVvHOfVKNh/N1V3dC7S5zbJui0dG9PMLyjxq+Ur84Knza7YSgbxS+rrDDS/
         msIf+dGwClWfx3AXTUmxm6lLWxaz/XushaRYEJ0XRVsp2nZx9k9zBt4Oq4wulrnRzvUI
         QYwes1xg5bkIcjb2hBOtrLUGBw4Z6ICIxSzZX8Xsap6TlrD+edNVAbdgXbSAAyU965Fn
         T5kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=a43c=6d=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=a43c=6D=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id bc11-20020a170902930b00b0019894a59c08si12941071plb.524.2023.02.07.02.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 02:08:17 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=a43c=6d=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=a43c=6d=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=a43c=6D=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNH5kNYz4xwy;
	Tue,  7 Feb 2023 21:08:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNF0FnDz4xwl;
	Tue,  7 Feb 2023 21:08:12 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PULL 09/25] hw/core/loader: Remove declarations of option_rom_has_mr/rom_file_has_mr
Date: Tue,  7 Feb 2023 11:07:28 +0100
Message-Id: <20230207100744.698694-10-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ad/TJK7oFfz4

These globals were moved to MachineClass by commit 71ae9e94d9 ("pc: Move
option_rom_has_mr/rom_file_has_mr globals to MachineClass"). Finish cleanup.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/loader.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 70248e0da7..1384796a4b 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -251,9 +251,6 @@ void pstrcpy_targphys(const char *name,
                       hwaddr dest, int buf_size,
                       const char *source);
 
-extern bool option_rom_has_mr;
-extern bool rom_file_has_mr;
-
 ssize_t rom_add_file(const char *file, const char *fw_dir,
                      hwaddr addr, int32_t bootindex,
                      bool option_rom, MemoryRegion *mr, AddressSpace *as);
-- 
2.39.1
