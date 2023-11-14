Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082436ejc;
        Tue, 14 Nov 2023 06:38:34 -0800 (PST)
X-Received: by 2002:a17:907:7883:b0:9e2:b85e:59e2 with SMTP id ku3-20020a170907788300b009e2b85e59e2mr7142179ejc.32.1699972714497;
        Tue, 14 Nov 2023 06:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972714; cv=none;
        d=google.com; s=arc-20160816;
        b=wnIObo1iJakeROc4QhKXIVMqEdrkFgDdbn+LOjW8LkBJbEkp3+t85kBw0UNvDmPxmr
         DliYmuEuEIql3I5QNJvmy43J+5Hk0L8BmmZf435jorsS+qGXYOK3atHgLZI04NnOQh5Z
         UeWFN0BGaFa5UUfaiqi0U87cbriPPoK3tP9MU5rZuke54wDtndu0aNHMZF5NzdsXVKnZ
         PbK1PlnbH3Pml5xUY+9B9iPJ+Pf1Nqj5T/ia1hBh8fqKKDPiGdfKJfYQ4RUB4iMNc5zF
         6L+EjAi2wdG4HgFruZBbOpO4/zrCdKldORJ7MwYshynxZyIxO3+VbeyzCJi09eRFpEtu
         H7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r7OOTLwbh53U5+FgsPEU5EGeXSv4SaNpAAr4X/+o3UA=;
        fh=WgzlLWvbY5R8+4JotruerK0jeEkAYyt0q4wPP6dSEVI=;
        b=ZIbU3r/kbIKHxG6939u0aNN7wwaoap59A5JnoRKr9lGey7i83PVcz09Z64SRQslQzh
         iSJfw2oItfJ3lYJimCRO+ck248Jv34Z+a20zmoKjtLPb4nLsZV4Vk1s5J1U/LNqPV8ZR
         OQDNAWpSsiJKR+XPhg/puxTctCK3Wzf8AF36FrtcJBITdoyjked2wz6JUTSvWHCWAow+
         08pZcbtnk1DN62/MekcFtg+GOYkJ4RV/cl8cp7MUmka1+rO0Kw0t28segMyrVF2ag0fM
         zm2jKLGkRyBlm6xY1Z3dUt2W+gHmCGt18Y6A7CXGc70jqGH93PxpoEGvWR0iiJ6tUOCx
         ZInA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iCpKWA/k";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k24-20020a170906681800b009dd8453eac1sor1883275ejr.13.2023.11.14.06.38.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:38:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iCpKWA/k";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972714; x=1700577514; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7OOTLwbh53U5+FgsPEU5EGeXSv4SaNpAAr4X/+o3UA=;
        b=iCpKWA/kfngOnC2yt25y4Jpo9u9JWKPKYPOJPjNlyYzaVTt4UKitH78QQlT8VHPpMk
         8CeaJ2O9J/X054jsM23CECkqARM/eE5fhRgL65aAhA5BBTQM/L9gm5YsuMYiS2KjNXa6
         Ub3/2HmAeSdkKu9r3xV41grFfYrbwhk0iGlKli0HhWhOBcAfnTNtrJ3jaepkZt48eTCE
         TJTOcPK6OMhzwRyZResdCfhC+QgJyFo+H/5ealbgshTonB10VkJdNgLHJwcHU4K6oL93
         b4S5f4ZuQ+Pxxtao2umb3Uu+9ieNwiJjln4eDCyLyYh6sP8mm9qfqvmz3ZpPqRXb96eP
         Adlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972714; x=1700577514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7OOTLwbh53U5+FgsPEU5EGeXSv4SaNpAAr4X/+o3UA=;
        b=TFxeTBggAV8viasqwEUIByo8cl3GfKDJgjRdQICXvBi45blfk0QBDpb+AS5kWOyPky
         ySmkuNgFbx0+sAjIieAgHRn6OhTvqzcRw9K8oYPqe0bKhxZJB2frpzWGsMCmkpptjY0s
         r9+HlSLIWq9LZWMkVWVH/e9ni7Ce+t/SxOkKiBj+h2zdv3LbrnUVdG9U2XC3Vv3gW3tC
         PDNTcVEskRVaq6a55KP3WLMOwhDFqftJMtOlJnceBhtfpQhnyZlJJzxn+0c84a6OYNPd
         iAT4xg5ud65gxYQLEss6ZFIdPUyBcXM+CmzkVlzO+ZmPTtuVN/G4VLyt3B8PihBIRSYH
         hBWA==
X-Gm-Message-State: AOJu0YxAyTBZHgTV/1ub/PVRYaibLuC3U4KnABtuAt5KBZuFQrODXqT1
	hVnR+72yk4ln049fAUt+bvz2gjeD
X-Google-Smtp-Source: AGHT+IELhzs9bxNKpuVpMav1CIPsLfztJ8ibvFnuauNtaNuW/pX7cLT4uf7lQThdsPSioUMrMZEBQA==
X-Received: by 2002:a17:906:ca5b:b0:9be:30c2:b8ff with SMTP id jx27-20020a170906ca5b00b009be30c2b8ffmr7193715ejb.61.1699972713904;
        Tue, 14 Nov 2023 06:38:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id ha17-20020a170906a89100b009dd8473559dsm5543525ejb.110.2023.11.14.06.38.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:38:33 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 02/19] sysemu/xen: Forbid using Xen headers in user emulation
Date: Tue, 14 Nov 2023 15:37:58 +0100
Message-ID: <20231114143816.71079-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hvxZHGBbTy1f

Xen is a system specific accelerator, it makes no sense
to include its headers in user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/sysemu/xen.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index bc13ad5692..a9f591f26d 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -10,6 +10,10 @@
 #ifndef SYSEMU_XEN_H
 #define SYSEMU_XEN_H
 
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu/xen.h from user emulation
+#endif
+
 #include "exec/cpu-common.h"
 
 #ifdef NEED_CPU_H
@@ -26,16 +30,13 @@ extern bool xen_allowed;
 
 #define xen_enabled()           (xen_allowed)
 
-#ifndef CONFIG_USER_ONLY
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
-#endif
 
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
-#ifndef CONFIG_USER_ONLY
 static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     /* nothing */
@@ -45,7 +46,6 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 {
     g_assert_not_reached();
 }
-#endif
 
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
-- 
2.41.0
