Received: by 10.25.44.15 with SMTP id s15csp4221008lfs;
        Mon, 10 Jul 2017 19:58:41 -0700 (PDT)
X-Received: by 10.200.44.215 with SMTP id 23mr8687982qtx.167.1499741921099;
        Mon, 10 Jul 2017 19:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499741921; cv=none;
        d=google.com; s=arc-20160816;
        b=wHGvewwh9lATwG+hlRylhlacCM0MCXVHddIhXrcTc4eKyrMelcrT9P4VAvV1ORXSkH
         2a1NDQlf5uFGPdoZuzQXC9BOpgvZ2ykbEKiHzaHNg65p3r/ExXwsloVL8H/+S5zeYX1Y
         EYJZIlQapz/wchCAverea1pTY3oHN7JHld5+3H3NiOmV2gnKW85n2FVVIHOFXaLdoHpB
         cn6xEuCyuz9C1kL/XG3IrQ7WuVg94o0ZhCW60OrKyUB9vd5QfoUDyTlLvK850r/RjuhY
         oMep6SU34vesiblhuIrAQ25biQ8yYKMUFQlJJ4JK4D4Jn9mWKGHA005Nf3AfkZXcKoZ4
         sO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dWRVvfU59+6/j1GscjKiOzV6Mf+IhWgFCMg3s18drds=;
        b=UtdPzb9KUttJjOuklWFGnMvPoD47wdysOaL40AcRhaT6tksqSSqZCsGxxPENn69pEZ
         DzHbw53X6oXLC1Nbmp2AX7uCiyiEGGbNvMl7P4RiB1kDSlFsdZ4kY3QWcUoPDTVO6pUh
         mgyMpLDsmFf7PMyHjJ3rhSk+Xvc3+6sbwJGTJhF7De6ehhZD135ztrvvt0CXFOqMvXGi
         KjMqKs5kXZroxc1PTLtm3DeD7DrpY3poETuHaaEVS3skEr3abNFNB+HvFOiSXL9evUqg
         8W2sJBWvMS4gUqvgKIOEZ+s90389fea2pthAmGlVnaLc3x6grm1MfMSGXDh/we9G5IP7
         iK8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=D2QY5Ufe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s55si12442390qtb.326.2017.07.10.19.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 19:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=D2QY5Ufe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUlNm-0006A7-FW
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 22:58:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlNg-00067Z-Jk
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 22:58:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlNf-0000Uc-NX
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 22:58:32 -0400
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlNb-0000Rq-AD; Mon, 10 Jul 2017 22:58:27 -0400
Received: by mail-qt0-f195.google.com with SMTP id m54so15102688qtb.1;
	Mon, 10 Jul 2017 19:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dWRVvfU59+6/j1GscjKiOzV6Mf+IhWgFCMg3s18drds=;
	b=D2QY5UfeeggpnenPpfSnopKzSvPYI62E7VgkSjbDFhxj8e7wn8uCvigJrPBsr96hGp
	hmmaAHSLFt7QHWd4xqtJ21n9X0ewZse3532VA/dcNcp3Tlqa6Yy42NjaqICdLlG1fbde
	SmlTuPu+D6HzCumXNhMNgpdaf7nc5FSrKFqirDsA8X1dZt6G6WzMczlT1ogHPwLj8BAT
	0PO/re0AH5hSAXKqvFjb/aDnIu2Qcbx4l5lgC4oxTTIPDxsCVyWhejp7OoYjf/iggunk
	LCBfz3/eLUnbMj53oe7Bd96GFaKxU9mhkMch27gJA0LjtkrxyK3zIfaqreS2BWCf0TDy
	hkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dWRVvfU59+6/j1GscjKiOzV6Mf+IhWgFCMg3s18drds=;
	b=D6i9/oOZ5W2zC0S0k1ECjkFWR72NXO1T7WUMR6/xJqj7BtHZUHBE8M9lcdcZ7mjdmd
	vzGJIAakbM8/OighO8Ehj+TACKlKVSrAEoMi+J/ZOkfoJLb25w+m0uIt0wyHidXQkxXg
	R+bxTaKrT6NsMNfC2F0uB4SmNpT/xYOHjwL7bmztpQUG9Nhv8b7gxyfeyNFUkkxV4/eQ
	Hq5I5lNqUgEBKebhvUI3VHiYw8BcK6Ix785zN6jp22ozlphQEgRhjU5ObRXnXzq8hNjQ
	/F+ZImfwcAo5vV+bxw3vxwyQvziStiklsw3hITPo+Fx1MsRwJ85yBnIyjAXS8xlC5oDi
	QISA==
X-Gm-Message-State: AIVw111zSByDQwdIe7z5BUxmu8maDq0LYn3xTZVL5v49tpBS05XBHwXT
	Lp48xpSvsQNOyywH1Bd8Rg==
X-Received: by 10.237.39.135 with SMTP id a7mr972074qtd.164.1499741846268;
	Mon, 10 Jul 2017 19:57:26 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	w46sm10813234qtw.28.2017.07.10.19.57.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 19:57:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-arm@nongnu.org
Date: Mon, 10 Jul 2017 23:57:02 -0300
Message-Id: <20170711025703.24194-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170711025703.24194-1-f4bug@amsat.org>
References: <20170711025703.24194-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.195
Subject: [Qemu-arm] [RFC PATCH 2/3] xen/mapcache: disable Xen on arm*
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Anthony Xu <anthony.xu@intel.com>, Anoob Soman <anoob.soman@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-arm@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g17FeI+2Bp54

linking on Linux debian/stretch/arm[64] with libxen-4.8:

    exec.o: In function `reclaim_ramblock':
    qemu/exec.c:2071: undefined reference to `xen_invalidate_map_cache_entry'
    exec.o: In function `qemu_map_ram_ptr':
    qemu/exec.c:2177: undefined reference to `xen_map_cache'
    qemu/exec.c:2174: undefined reference to `xen_map_cache'
    exec.o: In function `qemu_ram_block_from_host':
    qemu/exec.c:2242: undefined reference to `xen_ram_addr_from_mapcache'
    qemu/exec.c:2242: undefined reference to `xen_ram_addr_from_mapcache'
    exec.o: In function `qemu_ram_ptr_length':
    qemu/exec.c:2210: undefined reference to `xen_map_cache'
    qemu/exec.c:2207: undefined reference to `xen_map_cache'
    exec.o: In function `address_space_unmap':
    qemu/exec.c:3357: undefined reference to `xen_invalidate_map_cache_entry'
    collect2: error: ld returned 1 exit status
    Makefile:197: recipe for target 'qemu-system-aarch64' failed
    make[1]: *** [qemu-system-aarch64] Error 1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/xen-mapcache.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index 01daaad00c..75f0988e04 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -12,7 +12,9 @@
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr start_addr,
                                                      ram_addr_t size,
                                                      void *opaque);
-#ifdef CONFIG_XEN
+/* FIXME ARM supported since Xen 4.3? */
+#if defined(CONFIG_XEN) /* XXX supported_xen_target() wrong? */ && \
+    !defined(HOST_ARM) && !defined(HOST_AARCH64)
 
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
-- 
2.13.2

