Received: by 10.25.44.15 with SMTP id s15csp4221876lfs;
        Mon, 10 Jul 2017 19:59:51 -0700 (PDT)
X-Received: by 10.200.54.181 with SMTP id a50mr7871915qtc.66.1499741991134;
        Mon, 10 Jul 2017 19:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499741991; cv=none;
        d=google.com; s=arc-20160816;
        b=HlCWmHfb8bdsSyd3Qic6bcEZjN1djuRN/I9IjhdqEY1/jBsmabxQxIN4Pv2VG2E3Bk
         ai3KEuCinYsEB5diw99yCkhGW/Tqfs8KzCGuYlXYuRBklD5dbnVf7BJbM8Rq1SUcJlAq
         wRQ8yB0Tla0E1AJpSPJPQo6rqzuYfSqyQ8lFhCj/SQkOhhjMuC5E5txqBQDey0mj9LxB
         s+HWfjXsV67zx3SYqXoS+InvSVVZVbM5wkPm4TRfq4E7jA4duR7evxiPA+oepDYGX1BI
         nzHZbEDBo04zdgyjeFuFxwy/fP5LuchbzkSn6UqnsB2U9Co2Ns9MJeBkuWhyibGn0bAa
         lj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=o/0RcrL6lxCwB7LLYkFFT8oUiQZu4TVKRCsFxMNb24E=;
        b=wU6yPXurb4Mq90dRO7R1dJ/zH5G1sWRBTRjSNFfgHRpZXzRwhdqW56373a9r04ZFAs
         ujzpYa7+FlX0hGulToZ/UREOlElALoAQ+ieU+cExHktQ/UTBavrP1lZWknlKyctiWzBH
         T/YughoKw2un3jiSoIUcDyAnIfaeS8JheajFWeqvhm2SbSyo1ZSXofhZmE5kmcmsvoFa
         SiBCYS3cvBWqk8w0F2tR8+bnqTQsBSYIEby3yWl3BhDMVHcpBZN9U9uR0wlI/Y2axSPT
         IypcrA12gWwxlJZZzJj91vGRxzQ1ZlcBve/4B5lURO/sHvCsB+Wx+V4W0IAI6DEzuhJO
         H43g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FAls8hbW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r21si2244679qke.208.2017.07.10.19.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 19:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FAls8hbW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUlOu-0006xU-Cw
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 22:59:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlNa-00064K-2y
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 22:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlNX-0000Pl-0H
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 22:58:26 -0400
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33035)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlNW-0000PP-SL; Mon, 10 Jul 2017 22:58:22 -0400
Received: by mail-qk0-f194.google.com with SMTP id p21so15355240qke.0;
	Mon, 10 Jul 2017 19:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=o/0RcrL6lxCwB7LLYkFFT8oUiQZu4TVKRCsFxMNb24E=;
	b=FAls8hbWmixIcYb6JBqxt0XxD8e6uTLEvJTCwJ2CK/NyerqFTrDxn88FGS0hMB4Gr4
	KwRDFEIj4oM2AeMvXwGw0iYw7ucCjK2SNpkotWMs/8Q7mC3uZjrZbYt8rpagvO0Rg6dr
	+/gxrAS5pzZQi8VgY9Bg0ftWXXhCR9Wz8Gvspat4hD3ha2JV7DT3iNXKaOXVZ9M5YGqs
	9P6+FniYJcy4xW2fTKYYAADscHMuCvOKxfNX8Kfp+sg0h44qM/cWNNvtxpvzHzwQfrik
	5/zQpWxuOEt3QSA0j6aLdypVjAQsAIgMsXQVDAn0vSMd3FiP/hWOIemxZsT+PUB70V9d
	zDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=o/0RcrL6lxCwB7LLYkFFT8oUiQZu4TVKRCsFxMNb24E=;
	b=M3ykdiNWk7ILiObOzHUvWaUFWDoMlz5sFeQ6tn/+6vgpe3OSgJC9lkzSOXId3xndH7
	D8MvCutGVsZeDf1FeNFzkTX7PMV2w7ERqCeZCU148nA43s6PpDlW64e4qift5YwzmiZZ
	U7x6PHqNuXuPdmWARafFf6ic/8nroNm6yu7v3B+sH4fozVxRX416JifUBzv8mfmTqLkB
	J9WowO8ZJ+WhQ+mhUjWV377uMAPNrQY8/aScuTu3950Vb1fP4v0vMmcHtikaUPQfKtv9
	XP06zYE6XlWoW9tlyt+d25Pb9bilLxFcrM21in9kLWvAnAtliyG9MU08M9Nl+QnwxW5f
	MOxg==
X-Gm-Message-State: AIVw113Vf9/6bhzIDQJqUCyd2qAPWS9l6tIuyPpb0Q/yb8mkYeSvTge4
	VOatSDZ1bqieZfL1D14QvQ==
X-Received: by 10.55.165.5 with SMTP id o5mr7502665qke.112.1499741841832;
	Mon, 10 Jul 2017 19:57:21 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	w46sm10813234qtw.28.2017.07.10.19.57.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 19:57:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-arm@nongnu.org
Date: Mon, 10 Jul 2017 23:57:01 -0300
Message-Id: <20170711025703.24194-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170711025703.24194-1-f4bug@amsat.org>
References: <20170711025703.24194-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.194
Subject: [Qemu-devel] [RFC PATCH 1/3] configure: disable Xen PCI Passthrough
 on !x86 archs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Anthony Xu <anthony.xu@intel.com>, Anoob Soman <anoob.soman@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-arm@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +fSyB1vY0ytK

linking on Linux debian/stretch/arm64 with libxen-4.8:

    hw/xen/xen_pt.o: In function `xen_pt_pci_read_config':
    qemu/hw/xen/xen_pt.c:206: undefined reference to `xen_shutdown_fatal_error'
    hw/xen/xen_pt.o: In function `xen_igd_passthrough_isa_bridge_create':
    qemu/hw/xen/xen_pt.c:698: undefined reference to `igd_passthrough_isa_bridge_create'
    hw/xen/xen_pt.o: In function `xen_pt_pci_write_config':
    qemu/hw/xen/xen_pt.c:355: undefined reference to `xen_shutdown_fatal_error'
    hw/xen/xen_pt_config_init.o: In function `xen_pt_status_reg_init':
    qemu/hw/xen/xen_pt_config_init.c:281: undefined reference to `xen_shutdown_fatal_error'
    qemu/hw/xen/xen_pt_config_init.c:275: undefined reference to `xen_shutdown_fatal_error'
    hw/xen/xen_pt_graphics.o: In function `get_vgabios':
    qemu/hw/xen/xen_pt_graphics.c:135: undefined reference to `pci_assign_dev_load_option_rom'
    collect2: error: ld returned 1 exit status
    Makefile:197: recipe for target 'qemu-system-aarch64' failed
    make[1]: *** [qemu-system-aarch64] Error 1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 806658c98b..e4b173405a 100755
--- a/configure
+++ b/configure
@@ -2344,8 +2344,15 @@ EOF
 fi
 
 if test "$xen_pci_passthrough" != "no"; then
-  if test "$xen" = "yes" && test "$linux" = "yes"; then
-    xen_pci_passthrough=yes
+  if test "$xen" = "yes"; then
+    case "$cpu" in
+    i386|x32|x86_64)
+        if test "$linux" = "yes"; then
+            xen_pci_passthrough=yes
+        fi ;;
+    *)  echo "Disabling Xen PCI Passthrough (not implemented on $cpu)"
+        xen_pci_passthrough=no ;;
+    esac
   else
     if test "$xen_pci_passthrough" = "yes"; then
       error_exit "User requested feature Xen PCI Passthrough" \
-- 
2.13.2

