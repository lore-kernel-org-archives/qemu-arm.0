Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679482lfb;
        Fri, 15 May 2020 10:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8YGKlQHxvz93cqyWJzLYVs6RlfqeUZHkCXp2SluxzHtgIGZ0oMixqpcrxmAaae9VogogN
X-Received: by 2002:a50:ccc5:: with SMTP id b5mr3703593edj.340.1589562539687;
        Fri, 15 May 2020 10:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562539; cv=none;
        d=google.com; s=arc-20160816;
        b=NTMuyI9ufmGi1GgV1J1xkciRBY12bg+oI6GXRO8UQMVm0GSbebGACTQIST/rSSmj3r
         RT2qD76bu3df4kQB3dLQ1PW+O5dXZM3yyLoN+6nNjEkWB63ESdG8gUaC07Y4NoYHfhPb
         QbqwXtZQo5yGwvq3OCuOhSBUcvplN/DB9zbKnpy6Bls8+5ZAqG2z4Lz06DKN1gmIRmv9
         dbfNjKbtqVfXYArHb8qP5MRwDhFrSAP2wbJOEC3SkcqEOMh/mg9uVzYyrutRY5hUzScY
         ppA2zk0AXGbdeuPiVvscGcjh4fF0NASy1OBkusNpicy0fakkqwGOZ1FaNrUtMt3oNvXB
         eCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iBgI8c9GR0YajQTulaxYrH/xuvizDOHwgtiNZBEHy48=;
        b=QSTtfvTu3XjnsaV2j+idfPVMMEQtwKavpOdSxQGMLARWHd3kWq8tHkmcTVWE0S7YG8
         kLG93Baniapg3d4cJtj/r8ET49ZPDNmuFb4+v6MjbkNT7wu5RaK8jCi3h4gbVAVTl8My
         E7NxEwJTbra3JeC1EvklFo06olyd6LjHDLGGITtVEZkNph0r0uE/TtLEL5nF81I86Ec6
         8hwJv0Jsmrw0xYPhtDrMFiWKDkMCnO8UXUBzMud25DlnpIKHAwOza8SS93SIwwAK4BsZ
         eRWD06lu+1J1hwphTmAxPJ3+T9KuAmGOEnTeIKIeYqtYjiKjayiluIwTOIcI1qOo0UeD
         qj1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KtLa1NFz;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id j2si1689354edf.312.2020.05.15.10.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KtLa1NFz;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBgI8c9GR0YajQTulaxYrH/xuvizDOHwgtiNZBEHy48=;
	b=KtLa1NFzFKLO/8WV0U3aUbD3nbWEBtavmNobx4SElsuB0YkecfKLS7yS2PnpLlsEvZT8bA
	pOS4EvgG2DkfIBiyu9O4CjZwqdLo8AwFpgqWERT3a3myN38VjB2mDqHr/dOF3iqL8Fy+5Z
	JWY9exR354W5iVkeRAoXR261ikTMJx8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-LZMrbspVMHqB1S-WKWB1Ng-1; Fri, 15 May 2020 13:08:54 -0400
X-MC-Unique: LZMrbspVMHqB1S-WKWB1Ng-1
Received: by mail-wm1-f70.google.com with SMTP id v23so1268622wmj.0
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iBgI8c9GR0YajQTulaxYrH/xuvizDOHwgtiNZBEHy48=;
        b=R6DAs88WDO4rYIvYSw4H4n/1/TDQ2xvwPW0ExNvxDb0D4h2Rgrh2OZWEAEGOPYqbeM
         wNCU0QlKII/aGxESPiY0/YkID1Ii0BwJYWKYGxlur0in5HlImUoXEz2Cb+J6vIld49Rv
         Dga4FxEkHiCaOxeBTkytqjG8+jRdZNc0V9LIZZb4oS2HBIskqEwWRHL1KCeS21ZgxaCA
         wxjhaO+4LsjOp1v5pv7tYJJKWxvxqE+1NPS9Waksgl7qVR8NgRfJN0A0ijLiq2Mi6YKq
         pXfveglUsatQFtK27sFJQSFU/IRWt6+0YEX+DrEIIYdFpg5a/NzqSSxs+uglbbJj5HPG
         teYA==
X-Gm-Message-State: AOAM5328+akrOVI4ID2exVgfc+yLaN33SvxFL25l1d1AVnHgzZYYXvzM
	daWR7hIcbDNSdf6lKsqaWXtJILVSOZ9U1a8NgcNDTJRix4u0M4vayFhZRXz6x7XHpSB8KuDD4/+
	XL8zLeikqvoTnO634
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr5220435wrt.411.1589562532452;
        Fri, 15 May 2020 10:08:52 -0700 (PDT)
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr5220415wrt.411.1589562532245;
        Fri, 15 May 2020 10:08:52 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id h1sm4614912wme.42.2020.05.15.10.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/10] accel/Kconfig: Add the TCG selector
Date: Fri, 15 May 2020 19:08:02 +0200
Message-Id: <20200515170804.5707-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: qlkMy21/UOOF

Expose the CONFIG_TCG selector to let minikconf.py uses it.

When building with --disable-tcg build, this helps to deselect
devices that are TCG-dependent.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 accel/Kconfig | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 06826273c1..b4c0830b26 100644
--- a/Makefile
+++ b/Makefile
@@ -405,6 +405,7 @@ endif
 MINIKCONF_ARGS = \
     $(CONFIG_MINIKCONF_MODE) \
     $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
+    CONFIG_TCG=$(CONFIG_TCG) \
     CONFIG_KVM=$(CONFIG_KVM) \
     CONFIG_SPICE=$(CONFIG_SPICE) \
     CONFIG_IVSHMEM=$(CONFIG_IVSHMEM) \
diff --git a/accel/Kconfig b/accel/Kconfig
index c21802bb49..2ad94a3839 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -1,3 +1,6 @@
+config TCG
+    bool
+
 config KVM
     bool
 
-- 
2.21.3
