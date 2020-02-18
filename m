Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5940048lfp;
        Tue, 18 Feb 2020 01:45:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8Iv1U4MaiQKwUbPVHgojbJz1U/3ltE9CuQXBeyyYpzbAy5pSTQ9yYgizESm+KPamlv0pN
X-Received: by 2002:aed:2266:: with SMTP id o35mr16744606qtc.392.1582019146976;
        Tue, 18 Feb 2020 01:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019146; cv=none;
        d=google.com; s=arc-20160816;
        b=kLm9BeKA8vP1Yno8dsFs3RSomliXFOne0FcqOvAvWob9PmnPcxcC5XEgacXqniwB7Z
         eI6ArgqeYbZRK03VUSjGO/LWQ35tQLOHmNBXkiszpH6Mp36baQCxMR1g1e32MNPwtl/5
         tmeGh3h4/3LJZlYzz5DCViJ/m13G5kjye05biThm1DD5orqCJp6VX3csIGJkMmYLnztG
         zUqr6NTBTa3to8PaHwVDnzBeHi5BOxFuF4Ghv1tgHy8XZwyB2nCpLKjmKNuiZe6WaWgL
         wjHT9B2GFnYe5fjMtYxmVV5WTxlDCphpI9PgEpaSqb4tIc6JmwbrL5j+S+cYwdaBClwd
         7h7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WaAuyfScAf/2MXUb8PYYTyYX7vPM6AQh9bWF3qhXnuk=;
        b=ZhxFDqBdbWIUFF2ejMjfcezmlVLhy8m6Q3QqlYJiIXke60671x/JjmyCdeHo6l8jjQ
         R4yZ4xBe/xs9fOO0tygiaZzyW38bIbLtIec8bWGJnm60+iU4+CRM1jguj2bEhHM8Kabo
         tCzBAnpjTQ1brqE9cZFng1W/VUmswIE5H8gzFOPANa5ngprtLrtwV3HMWJLGn2x23ZQp
         aukMRQCFf80sNndXntBPCXWx6j2umNh8mhRB2IuAZgrqMBNfJA1RD+pY15IbMwXS9g+s
         9dS4rWvFmGmFj1j59pZwoA50j1mIP3duJvPfTAh++luk1TEMYrbUqT3QnHjZZMuNnps9
         URlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YD4mqRWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l79si1539333qke.282.2020.02.18.01.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:45:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YD4mqRWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zRp-000479-Uv
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQj-0002Ay-TC
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQh-00069F-Q0
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53475
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQh-00068m-MP
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaAuyfScAf/2MXUb8PYYTyYX7vPM6AQh9bWF3qhXnuk=;
 b=YD4mqRWFD9apKpNvkOYxbJIpbRi2jrVAcoObTbpXvICPVQgKeBxfMSmAVzQ1972dVU3Cqe
 /gTTD76+6aE6JwIhIbwPVieUfLjtQo5s2chRmFPj++HUoKWeGL/jwA4bWAXAj+Hft3xj7k
 W0/3MeWXIrn/MouE9UReIv/ZjJt8p+w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-KBnPxfaHMZO3Zdgvlp_TXA-1; Tue, 18 Feb 2020 04:44:24 -0500
Received: by mail-wr1-f70.google.com with SMTP id d8so10456967wrq.12
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvommiOA9aXWAuznO/0p1zmrVr71xLCprwkebrVj7q4=;
 b=C1bG/35SWG4JdwLAZRaJGm/QpSQ6cvZKVzjzF0c9gTfc+KU7fQVSzsEQyW/zDj8BtE
 zNpTMcxYl9xXwy3E2fO5vL/Y9hoFscmgaw6VTQX945WGV/3JdOAnH0B42o8lK4XKG7qW
 wwjMpUtIEs1bjvBGCKEtEToP3dXlSyD13y9uCU21aCH/CRNFYct05l/goM9Swb2ZjJfN
 rFAv+7GGyO4C25BKg0DKtBeYXGIQJF7cafGFS55JAKa64x6RD8Ma3BXl2ZBLZUe/ljmR
 w0Sq58Cpf+lp36Axnp8G08hGzXVGU9OngSx2FkTcnT3/9ahVXJvQ9lt6Y3ikv+7FR/7G
 lIuQ==
X-Gm-Message-State: APjAAAUWe7yS5l+AENyqVM7vFjDQeqjEuJ88JVXXfr8oTg7bYp8EjGGX
 MKWebHiF4+uTUQjAUvi9sh+Zv2FFqZ2hUxgoh3tY4aqqLNhhMPQEAB9KQSYp3BPREiDTWuxC2hz
 3L01ACtzV7TMT
X-Received: by 2002:a5d:614a:: with SMTP id y10mr29114183wrt.73.1582019063781; 
 Tue, 18 Feb 2020 01:44:23 -0800 (PST)
X-Received: by 2002:a5d:614a:: with SMTP id y10mr29114137wrt.73.1582019063586; 
 Tue, 18 Feb 2020 01:44:23 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 09/13] migration/multifd: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:58 +0100
Message-Id: <20200218094402.26625-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: KBnPxfaHMZO3Zdgvlp_TXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /cLamqZ45qAI

Fixes: d32ca5ad798
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 migration/multifd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index b3e8ae9bcc..cfaba1369e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -305,7 +305,7 @@ static int multifd_send_pages(QEMUFile *f)
                 + p->packet_len;
     qemu_file_update_transfer(f, transferred);
     ram_counters.multifd_bytes +=3D transferred;
-    ram_counters.transferred +=3D transferred;;
+    ram_counters.transferred +=3D transferred;
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
=20
--=20
2.21.1

