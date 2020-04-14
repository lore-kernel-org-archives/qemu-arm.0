Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1078502qvm;
        Tue, 14 Apr 2020 09:51:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypLEFflomlebKxq7uyMFyO1HB/nfNGYFejaHTZmE9cnZcOJYCTmY3vMe6YPjo1AY5TZIYEqM
X-Received: by 2002:a37:85c2:: with SMTP id h185mr21328988qkd.446.1586883085337;
        Tue, 14 Apr 2020 09:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586883085; cv=none;
        d=google.com; s=arc-20160816;
        b=TtZwwZqhAO5d2+hh/BNTffPPeRWr4tx8SBd3Fzo4RhpBPGtSHivHzV457Lly0RnyrF
         ovTf32zgt0kGXWnR9W3sKh8fNo0TORGanRg0Hc+Vv7mcBcpMNyVhDN3I1apUt5givw0s
         GRjXZMdH6qi1UU89RDMHs38m4j4l32W3r2M8fPsSnrfyapdMu66F4R4N1X5keV0XCP/9
         7BWOoqSAqZ28gJdcP990o3bnm+ebQCPz/S9aOQpt1kKyoQNHrRNntCqvEosEkTTPMUTR
         eazeBaMY0BkdDR63D5IiQKGBaQvmOniE8WmV3RsSztw3RINdcdAwgc+RP9EvGVpg5KJr
         YqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=42lVAfyseGz1VGufIzij+GuSVkOjvcpSK4kWq6V6gmk=;
        b=JkdQbUj0ctT2y9r3n7iogUoLGaecfiWxPUD73deiwrcJz/elyE1n7sPpgdkk1lXT/R
         4Szlyopkk0N3sYIKN7PJbwo1rDW2JDz4luTbnQvDaoio46xVT5KBj/lkeX/SDBg3HBuM
         W1OYrZaeBGrMgMUih2SMkuSq675Rqqv4Kc7p5esKjBPG6i6wq6g96tkbuinhow+h2fUw
         T46Xfxm527/9u2HANzwxMTHDvsro4PmQLSnuyVxL5CDSaiFHrSl33efV9a1srtjRNfUa
         wOZHEmEk2UgXPf5tZiCW/7b44lt0bYVKLuwnYyYhTfGjh4j9pg9CP1pdUIQsLtaIQd8q
         pNbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HzO8STMD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 96si4033949qvc.106.2020.04.14.09.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HzO8STMD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOmS-0006PA-S9
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOdZ-0000wF-N1
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOdY-0006Mo-A0
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:42:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23900
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLec-0008CQ-Im
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42lVAfyseGz1VGufIzij+GuSVkOjvcpSK4kWq6V6gmk=;
 b=HzO8STMDDgZl5dL2Y9vXGJvm/TKx/4/4TO97T/alIxOK00ACgBuNHKJub7/T6sGouLPqEP
 TxT7h1cJdTZyxmAI2+8fLtqwCds+qSAjIm5JBTEynbB1OVidlwUKxNDrPPOfq2WYFGpu/O
 pPoxn0+AVNAuXnAPro6Z9wytXk9bY6Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-8hi55XSEM5WwVFPGRdm9Nw-1; Tue, 14 Apr 2020 09:31:02 -0400
X-MC-Unique: 8hi55XSEM5WwVFPGRdm9Nw-1
Received: by mail-wr1-f72.google.com with SMTP id m5so5560435wru.15
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 06:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kGKRmnKwmRxlOxdVqgxjmKtx9Q2hpJOt1NAPPmcNK0Y=;
 b=ikeU5bX9d8W19zyu85KnMn4Mx0PIIIq0HdRZ/qY3lYAabXGsJJknR/uZ+RsXd/1knY
 AxYvcloxgA8u9kM0kotDQ/nAQG0G19w2GRb7mw50YUvo2aNBlOp7QgMt7KA3mOvJdcg8
 ouhDBs8pKfTH5d3UkZTjg6+uwhPeIxxO/GF28vSgDzDpxqkOhmC3yZf1OdFQUYzr6vN1
 CW2qnu7v9KyLJmn3x291Fog1ptwnQfa7oLMcyAURitg6jq08wQRTrgDOiJDhwUlOuvvp
 AOxfQHK0rJid3VUsGtrMepoZYJWLIFpWNZ74B/oE9vbFalmF+xMWkFXjzqw7rg3T6slJ
 mGBg==
X-Gm-Message-State: AGi0PubfwuUNQCAj5bnz/QcenVYL2CdDPyBo5m3a9aGTrUPH1gKhdbAd
 1N/iJ2DR2qA/gBAwUdSwNG/EWmt6HHmI0KN6u2ht9wsxK17INGcNrHf3wqiBrL1H+voOr/uJ5Go
 upsEdV1BfGb6M7n8=
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr23523422wmh.175.1586871060655; 
 Tue, 14 Apr 2020 06:31:00 -0700 (PDT)
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr23523395wmh.175.1586871060392; 
 Tue, 14 Apr 2020 06:31:00 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id q8sm18307453wmg.22.2020.04.14.06.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:30:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 01/12] Revert "prevent crash when executing
 guest-file-read with large count"
Date: Tue, 14 Apr 2020 15:30:41 +0200
Message-Id: <20200414133052.13712-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N6KUugrLsh3I

As noted by Daniel Berrang=C3=A9 in [*], the fix from commit 807e2b6fce
which replaced malloc() by try_malloc() is not enough, the process
can still run out of memory a few line later:

 346     buf =3D g_try_malloc0(count + 1);
 347     if (!buf) {
 348         error_setg(errp,
 349                    "failed to allocate sufficient memory "
 350                    "to complete the requested service");
 351         return NULL;
 352     }
 353     is_ok =3D ReadFile(fh, buf, count, &read_count, NULL);
 354     if (!is_ok) {
 355         error_setg_win32(errp, GetLastError(), "failed to read file");
 356         slog("guest-file-read failed, handle %" PRId64, handle);
 357     } else {
 358         buf[read_count] =3D 0;
 359         read_data =3D g_new0(GuestFileRead, 1);
                         ^^^^^^

Instead we are going to put a low hard limit on 'count' in the next
commits. This reverts commit 807e2b6fce022707418bc8f61c069d91c613b3d2.

[*] https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg03471.html

Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qga/commands-win32.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index b49920e201..46cea7d1d9 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -343,13 +343,7 @@ GuestFileRead *qmp_guest_file_read(int64_t handle, boo=
l has_count,
     }
=20
     fh =3D gfh->fh;
-    buf =3D g_try_malloc0(count + 1);
-    if (!buf) {
-        error_setg(errp,
-                   "failed to allocate sufficient memory "
-                   "to complete the requested service");
-        return NULL;
-    }
+    buf =3D g_malloc0(count + 1);
     is_ok =3D ReadFile(fh, buf, count, &read_count, NULL);
     if (!is_ok) {
         error_setg_win32(errp, GetLastError(), "failed to read file");
--=20
2.21.1

