Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5223217lfc;
        Mon, 8 Jun 2020 09:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0aZycn5t+H6VncVWKclnAmDmzJtIr0ocfExkuDkTkpro993msRRxxnoLqWGz9X+Nf1BCt
X-Received: by 2002:a25:5d0e:: with SMTP id r14mr38221012ybb.493.1591633561440;
        Mon, 08 Jun 2020 09:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633561; cv=none;
        d=google.com; s=arc-20160816;
        b=bVcNDW2og42rpyC1yOfQglbNHQMXvzdMToXWg7Wu1rDCxqIYTDAYDC8kodpL+kG9OS
         laajDO3zraFU90+QJD2/TQOvGXgsr8PzOs4jQ8cidxmRwxwYjVcxuHpPBb+WY4NNPjBE
         X2TJ3AIbEcfqJBbp1WP0LvG4TPWD06cnop5hvgHdgvX5f4arWgUahBpk6Az8emEFBS8L
         LzAht3gekLbeaDdk6hbwJFKVJhqVCliymWdVxn4zFAajfNPs4+2DXnoGhTaVm3svF0SD
         nAZzLC3OXUHooPjOmacJQqU3EcUFneLhw6rVUoyUhCcmNTC2zuYIIeOlL3S1zOx/8cEI
         qmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tavsnBMcjbLYqmKTQpJNbu5aW+OtaIuHgP5ZHfhD4y8=;
        b=tdTJ8fCCWjmKXljRAaXq+kDIbxoUOQFECXsOEwREV1H0TE/SZrCioR/vBDxuDZcscX
         Js3NLwplin2UpAHKcorZq6UbgGSskKc4TnNU518eW0k069tE3afaRsgRDgqG/0/czMNT
         WPzvy2wV2SzDso74hAKsw5uteu9vtLbdvxSx0PWrcwJfMHZEWU3BFPhnlgOms7ZAP7O5
         3l/bftiju7ng77EaUC1VFmWxHKxqYJDIaU8rD7BrXM3/BDr6XoQft3LKM5437yFEXB56
         Oja5sfce94wnXx/g86CnwtzIZg5Y19Bq/WQn4CXvA6dJEaTJJHPX1blPxYyheIjFTOpm
         NwKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GRGtXz49;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l133si85621ybf.104.2020.06.08.09.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GRGtXz49;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKb2-00061f-PD
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFY-0007k1-6D
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25250
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFX-0008DV-Fz
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tavsnBMcjbLYqmKTQpJNbu5aW+OtaIuHgP5ZHfhD4y8=;
 b=GRGtXz49rc9AGNSu2V0pthG4vX2r3m+NoeJhFpegEAAquTyS3dm9CoWxalAD85b+a/bCnE
 OIEFp9uP5WVnMbEFGQlRCP7Fr7ghjz/K4eifEbTnnsXMJrt5xbqyGit2jLyY0KcDBQLHt9
 HpRXCAir30xHEsOEusSBU/Fm7o4rrAU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-CCwZkobrMpShOkdVsfQsjw-1; Mon, 08 Jun 2020 12:03:41 -0400
X-MC-Unique: CCwZkobrMpShOkdVsfQsjw-1
Received: by mail-wm1-f69.google.com with SMTP id p24so9118wma.4
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tavsnBMcjbLYqmKTQpJNbu5aW+OtaIuHgP5ZHfhD4y8=;
 b=axlNLgptfoTly+ETEVAhFzSINYiRJBVan8gqRZjpcwf7PRhT/rqPoRo50CJptq4lcU
 gkVRKgTOeY1fZnp/3J4FfBAYKtPUPNvnDjdcXEIFy8mmIufHLbwSbci4IBZ4df/tuQGw
 24kI15g2s+v3je689zOXA8zsK7VOJS3smG4FeI36KJ3IEAxyFZThcuDWuLeE6pdKuWG6
 3ixm1OGmlSjeJmH9BPIUbOHbt214sD87IVZgmYBRDL5ON3UHmJDzthD47F46FKTxze+M
 O9sF8rqrGHc4vdD5D4gIDx9EHieeUQYBQ3/OmWZk6TbjOP0Sf2cZb84etLuABRFrkdjs
 KtPw==
X-Gm-Message-State: AOAM532btEvKorOzDEHfepOyjdkqww8M+Lk4Edjz890+Ks8D0o+qHMuZ
 ekvNh5YR8M59VMG2TtpNrZPTFyL8RtQC7f7hNMiACXcXnuaI+AvBCn5eRQ4OisR6xxhxlqxtH56
 6dKVpF8CYtClb
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr73337wmj.118.1591632216900;
 Mon, 08 Jun 2020 09:03:36 -0700 (PDT)
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr73214wmj.118.1591632215737;
 Mon, 08 Jun 2020 09:03:35 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l17sm200565wrq.17.2020.06.08.09.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 29/35] hw/ppc/ppc_booke: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:38 +0200
Message-Id: <20200608160044.15531-30-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MwOt9TpI9RD3

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/ppc_booke.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 652a21b806..a9e5e68578 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -31,7 +31,7 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_ppc.h"
-
+#include "hw/qdev-deprecated.h"
 
 /* Timer Control Register */
 
@@ -338,6 +338,8 @@ void ppc_booke_timers_init(PowerPCCPU *cpu, uint32_t freq, uint32_t flags)
     booke_timer_t *booke_timer;
     int ret = 0;
 
+    qdev_warn_deprecated_function_used();
+
     tb_env      = g_malloc0(sizeof(ppc_tb_t));
     booke_timer = g_malloc0(sizeof(booke_timer_t));
 
-- 
2.21.3

