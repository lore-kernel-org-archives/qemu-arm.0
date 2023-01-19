Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp295873ejc;
        Thu, 19 Jan 2023 04:35:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjrsTzLFP2vxYlP8pRkJv8IH43FhIPtOWz57iyDeA6MSr8n96bFd2Hucur45fRL0/6iQir
X-Received: by 2002:a05:6a00:26e3:b0:58b:c4b4:86e3 with SMTP id p35-20020a056a0026e300b0058bc4b486e3mr20424932pfw.24.1674131730841;
        Thu, 19 Jan 2023 04:35:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131730; cv=none;
        d=google.com; s=arc-20160816;
        b=H3XY+PV0qdGCa2fYqzGzreBY6q91nHBN1a2lqEtnBfMvDY1SMYH/cLQXTz9NCvAt9x
         E2qCaH0oUx59HdOl/M+v85kHodrZTCD3hKNdfyGANFUkc1MVAQJFpBwbIQAZrkU9oWbY
         uBzbZAPKVv99Hze0JjAaJs7ryGsJstt567rlKl8rBlt3XprEbe/2Xmm8MjDsW61b7RaF
         uL1sfHthUTwZxHQuYgEUwLESJW37DVpGKJqFd6SynQLetyt+fI3wbGOFQRmkCiGDfWUj
         6siUbOF7jN8YZbFf3JLeJWnMNK5tErmcoMl+Q4ribbf9/skkd1V8MLdPaCvGDW4i03D3
         sNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gSPSWg+di0mfyH8cRPdv69trPt5Kmk1VJj1F4M5/t+M=;
        b=l2Z/wGNs4dht0nVGUWwJwIz34KtaPcAmnzlhHL5r+m6mT7Z03bwwEHZjyebMS2SFoq
         zg9h92A6w+5+J2pUgFmSrBAZPSeIkUgreHiGatxH1ZJmqo3DrhGMsrJWPkYFafr6xPR4
         zpjPQjAtcuvt3zO1gd9f+517rI9qdvY2z01CiE9p66prJLVIvKKVWWC7SPUnHd2oQbWu
         JB5s6feqJI6flBaOuFdS3TYraSoCYaBspNwSxUxuRpWIKsJ1p7cc6qm6xmTIucIn+dtm
         SGbQdLpbetAoe4sAa14eQSOV+Qx64PuMzrLDO5JjZkP6EfacBEe4QgDuUn+CpxdE78Jr
         FbdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=w1sb=5q=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id a1-20020aa78641000000b0057462551be5si17990857pfo.237.2023.01.19.04.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 04:35:30 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=w1sb=5q=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=w1sb=5q=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXw6mMyz4xyB;
	Thu, 19 Jan 2023 23:35:28 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXt2sdSz4xN1;
	Thu, 19 Jan 2023 23:35:26 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/25] hw/core/loader: Remove declarations of option_rom_has_mr/rom_file_has_mr
Date: Thu, 19 Jan 2023 13:34:33 +0100
Message-Id: <20230119123449.531826-10-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hgyBstHXnW1Q

These globals were moved to MachineClass by commit 71ae9e94d9 ("pc: Move
option_rom_has_mr/rom_file_has_mr globals to MachineClass"). Finish cleanup.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.39.0
