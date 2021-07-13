Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027416qvs;
        Tue, 13 Jul 2021 14:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSQEvTnlyQV5hwuOIQtc2dMUvlNuKBzW14f+V7YiZpRoYtspoKOy6mVu4efNEk0CCA2W/3
X-Received: by 2002:a17:906:81da:: with SMTP id e26mr8301821ejx.352.1626211286394;
        Tue, 13 Jul 2021 14:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211286; cv=none;
        d=google.com; s=arc-20160816;
        b=yezy07pZzdOwH3CqW+1AIgGlDUzkl8n+f0xowQDMBEriUbUZzZvNYKrQpYKmgTDT81
         y6rlSjYfY+emNRjVfA+dDyoKJ6GMjOS42qQW4iTzwkzcVUUgHfAYgepcdoDSKZIM5mRU
         FqGrh3BAelk1+mE7rVLyWqwDaDoVOrN+auR3bFQf/6VwLYriaXckor+sc5Z0iMlzb9sl
         8dpaJCnvk5DhEtIyjY+RBJOUKyJ3Io2uS7QKFNfwp9hemUWmcWNsgHtqmhw8+jBWDkm8
         oGwsjwvIKddSYM3Ljg/RoG3w7Y+V8nLWmd4jwZT5KNuzj9cmth9M9OT+0bXZNvdPtSln
         Ei+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=t5bMoV8DVyKDKClunF8PHt3LKrK6DZFobxjtihc5tp4=;
        b=RP5Duz+4EYY+F5WEya+Hh2B8wdZQqynaebU7nEtnxskc92Ccgt+FUSEbB5GPj194Ec
         MJ8ScafQUGswiN+5KiNxdRcuO+TU46HHwgRcS2on7sW7/B8ETCXf/eo1moPcoq2Hs8HP
         4g7neEGkrnCxp+yX1ulRa3KNagA77I9GoiudBJ+k/4pdF9yaZ8dZwcH7n680u8F6rwSH
         6G3d7LwHVLS0wHQ9qvddelk5+Jy2s1TOT0mR6Qeq6GztZbMgOPP+Swm8ozb9HbHLDtTz
         zYYzcTuIA/8i0jczzfW7Lm4dtbvAfaxEIZPjv0yiXgVrsSci68ejCzCYkyHMPvnw/AX2
         +4GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bwsvmX9x;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id s2si20599769ejs.611.2021.07.13.14.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bwsvmX9x;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5bMoV8DVyKDKClunF8PHt3LKrK6DZFobxjtihc5tp4=;
	b=bwsvmX9xOY2XEHOo16IrNq6anq645ZTBISO5F71Qf6Scm6P0FkpNic0Mp0aUhpdD3Xe2P1
	V6MSvpQJ6bRG1lq5iA91Xapl1UcrD++9iyvtr38v9pPFcuCuIX8SzgpH/qoU/rwHH4bqKY
	KL10veat+dP4EwxBVc0GbLZPluJWdUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-Xf6dxCVFPQe39GKnYlLu3w-1; Tue, 13 Jul 2021 17:21:21 -0400
X-MC-Unique: Xf6dxCVFPQe39GKnYlLu3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6C411084F4B;
	Tue, 13 Jul 2021 21:21:18 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79CE519C44;
	Tue, 13 Jul 2021 21:21:16 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PULL 12/23] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
Date: Tue, 13 Jul 2021 17:19:12 -0400
Message-Id: <20210713211923.3809241-13-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WjXZ70+BBApj

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Avocado allows us to select set of tests using tags.
When wanting to run all tests using a NetBSD guest OS,
it is convenient to have them tagged, add the 'os:netbsd'
tag.

It allows one to run the NetBSD tests with:

 $ avocado --show=app,console run -t os:netbsd tests/acceptance/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210623180021.898286-4-f4bug@amsat.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
[PMD: ammend the commit message with example command]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 1 +
 tests/acceptance/ppc_prep_40p.py       | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 3ae11a7a8f..0a8222f17d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -905,6 +905,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
+        :avocado: tags=os:netbsd
         """
         # This test download a 304MB compressed image and expand it to 2GB
         deb_url = ('http://snapshot.debian.org/archive/debian/'
diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 96ba13b894..2993ee3b07 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -27,6 +27,7 @@ def test_factory_firmware_and_netbsd(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:40p
+        :avocado: tags=os:netbsd
         :avocado: tags=slowness:high
         """
         bios_url = ('http://ftpmirror.your.org/pub/misc/'
@@ -64,6 +65,7 @@ def test_openbios_and_netbsd(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:40p
+        :avocado: tags=os:netbsd
         """
         drive_url = ('https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/'
                      'NetBSD-7.1.2-prep.iso')
-- 
2.31.1
