Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368056ejc;
        Sat, 9 Mar 2024 11:24:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXkStWwM/YxEWwOhj7iBEjvH+Q7Cpj3XM6c0SosqtsyN9oHX6SA+PfY3H9ZhjolUGRD29PezpswVlRWw9eFQQIXDxhN5jp+
X-Google-Smtp-Source: AGHT+IGxxVkC15GTp98qfkc/Vrnf5RMEDLqZj6YsAl9iMmQvMD4nJYw6sv3VtYI+OPcGHFNhIazb
X-Received: by 2002:a05:620a:40c8:b0:788:2c33:5694 with SMTP id g8-20020a05620a40c800b007882c335694mr4054241qko.78.1710012247735;
        Sat, 09 Mar 2024 11:24:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012247; cv=none;
        d=google.com; s=arc-20160816;
        b=FDjwOYNzN64pTkd8UZoTUSh9Wu5qKsTAhgVP2BfugECt/X5nCWSlmLpQQQd6+uZxEI
         7ligrNikjQEGYPUqVgvXfy4SqBqdpoTHPiHPPaP0myG2hCHV016RVI6gN5TST2UMIUvy
         euDilJ6v2YLUiSmmj8IJ5catuHtdELYvrC0hSv1+FXSvJ4v07khKo2ljnnquhwJbIOaj
         5lKc+gQHbSkntOUHCva9ohQ6y1ujsXSDWIvAcViWPNGGRAqVhaDtVeQ3qj2A6KIQJEBh
         BmI8pQ+24xIVldwp/ilyBb9uEAYkMp+vdtorXmcEKNgx4AfiU+0uzk44jUsdMI8FDpRn
         V3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=A3YPWAKLFpXy74v59/y9ZVQ7mfzqWdCePg5o0rXQJdU=;
        fh=smbE/iFXf0NstIZGPbHI2a9RcQ0JC/NkDrp2IS6nDg8=;
        b=Eb5Wbc6Zid8gPP1qhbQJRKIZScLRSqqFnTtAR9t72mE/YqjUZaY2qoxksQXeStqElz
         Rof1OOBL8dF1XUTVGKQY/Fb1zTmbk5RDhqan3XjMo3XoYc9fJDxGp0laiNxWZyBoawCC
         4kjjJuoU3oO5NtIjOuOAIpIVCJHCTcuMijHtnHJuDMCEv/krHkOeGioTseq6jfouVOZL
         HA5FI+S5RZ+Pd6qRX0meXDyjVkmzhtDFHSCxeVkejxuUF4WyKmCY5YSgSyIH7+06GDfW
         5cf8K1uxUWKMd33ECMGd58t5Bjt8amxH6CtJ3F3DK412j6W6ed8KnWvksN8W/p691lvE
         l7bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WGMZShYZ;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id wg19-20020a05620a569300b0078860f42747si1342751qkn.297.2024.03.09.11.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 11:24:07 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WGMZShYZ;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.690976.1076726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2I1-0003Hc-Nq; Sat, 09 Mar 2024 19:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690976.1076726; Sat, 09 Mar 2024 19:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2I1-0003HU-IH; Sat, 09 Mar 2024 19:23:25 +0000
Received: by outflank-mailman (input) for mailman id 690976;
 Sat, 09 Mar 2024 19:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2Hz-0000Lp-MQ
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:23 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e33ef02-de4a-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 20:23:22 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a44f2d894b7so410823566b.1
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:22 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a170906595500b00a45a96a9c37sm1182786ejr.65.2024.03.09.11.23.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:21 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7e33ef02-de4a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012202; x=1710617002; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3YPWAKLFpXy74v59/y9ZVQ7mfzqWdCePg5o0rXQJdU=;
        b=WGMZShYZLxi8XKRo8QOv1JT27KOo+vUH+RE2vuiFfnbXpIVXsWjrapKQlmhOT8hfdy
         PORz8Zyin31DkaKVjXtMB9rMLAy+RvQsSMHzIXCPcqBZ7OmoHSaLSXknqVkE3xqBtNQK
         Ka2m1anq4cXog7dj5m3o2eS+yViJY7WJ0vLhr7itViZ8fG+Gva/C2CcN/7C4VLvOrkr3
         016+SeJnXKE4+CKg/WuVZwZ8NDpHAgU7xh0v7neLdstg1l4tM+dEcmPdJx1qIUcUUA9i
         vTiw1QqGM5V2eUN0Y1lS3cWeYU0St4bl+vSezz8PVBRj9ZBZeYJThjvfyB00CCb/gQMr
         PpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012202; x=1710617002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3YPWAKLFpXy74v59/y9ZVQ7mfzqWdCePg5o0rXQJdU=;
        b=pjU2BYunbzat3gCVnJwqrjnC3f7lmiQn/CeSL49kQRmXhHjHtdVa36QrP6BwPlE/mr
         Ya4eKdNViYPvxJdmcx+0QiX4yauCdyYZqOXll3HPI2kfsmyZfN/8NF3b86VXmjhj+Cy9
         IrLBb+TzNjTElwd5svBrhFkLQkBO+QZSKApq95/SR/jdPnlPN9aGRt826yUCv3zRxDCa
         rP0Ip0+m14BKkZ3HJVzRXIOrdeHntFY42ryHtFKH8E6Bm/ESpFRaLNXtPVdXxmBY+Ou5
         2JBQV6tc0OAw8GGir1Lv1bqb295XlqNzeq1HUmSuupuCj7bqzorVKvy6hneGyrQ9sJFR
         O3sA==
X-Forwarded-Encrypted: i=1; AJvYcCV7zGDt3AsloAqtQa/XqxlUApXQtzC0QBKK8OauU1/cYRIKUg2mDVS5Qlai1JZcnJeaOPGRrWFChMRiU2JFVa57GUTsKGSfZBuTlzMJUVk=
X-Gm-Message-State: AOJu0YwXHJxy+59ntkzMi2j4dV1VuyM4Q31G8dD7oPo7jcChQNK5BZP9
	qYZ7Bh4B/3yEZkYUasBBhnWll7+HIT9Bze6yGK8LtNh9iRQZskhkIAPfkhZQb9g=
X-Received: by 2002:a17:906:b110:b0:a45:c9fb:86d7 with SMTP id u16-20020a170906b11000b00a45c9fb86d7mr1387127ejy.54.1710012201803;
        Sat, 09 Mar 2024 11:23:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: [PULL 11/43] hw/i386/xen: Compile 'xen-hvm.c' with Xen CPPFLAGS
Date: Sat,  9 Mar 2024 20:21:38 +0100
Message-ID: <20240309192213.23420-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JfyPA5T/43c4

xen-hvm.c calls xc_set_hvm_param() from <xenctrl.h>,
so better compile it with Xen CPPFLAGS.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-19-philmd@linaro.org>
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

