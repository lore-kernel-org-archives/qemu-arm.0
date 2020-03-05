Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3203396lfi;
        Thu, 5 Mar 2020 09:59:21 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuakkCfr9NGxc5ErCvxDV/m9Tkun00hqZTq7z4hgbSEYF8X09l2TlGi6VoV/G/84Gc1aV2+
X-Received: by 2002:a0c:fde7:: with SMTP id m7mr4850508qvu.53.1583431161168;
        Thu, 05 Mar 2020 09:59:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583431161; cv=none;
        d=google.com; s=arc-20160816;
        b=md0HamdJkaHlCoIPGk7ysHiWrxBeALjS04aYnQHK04QHL79dOMHqKjMzBmvgcxYvUr
         2uaAlaZ6KzEGDmzMju1FKS7Z6+jcNRyAx8mUXhu0F+hdOkJtzAsh/oVZsoE+zulL36Za
         45S+BQfT2hs5CS+UC/gxnu45CyV5YfYBT54RUVHg+lk5Xvlz8gvb0PbsoaaCqHsqkZm+
         cp+WQztNLGPCHKFXyHc+k8MMcweRpMj4kggvXM45Xc4kLqmva62e/J72vV6LMLuyXEST
         8TL7SSsJfStB4JQZjkkGyex5ClpZdIBiTselxdPgPKxRE0OhYSbLvkO246aN5g0hawy1
         O1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hFzOf21mMRMWBpr53hzhWDWl6EUS9wSXvSla5EkKK0o=;
        b=F5FnAApkmHM2KdlcQ0O9/Hv4ZkN5Gmx78az0/mV7SLgrU5moa4pN6/w+06y61AQ1qI
         97KrYgAcDq+58GjIJFDc7Xy2EkLeTMC8kE4INd47ebAz3VAmQ/yAAWeFX3qol3+IPXID
         vwoGkS9OlZp41hP6bZy5jdw/HEPUT8PGQxOx2ChEd5SEj1yiTffoEBcpRvom85xAgcza
         ztUZEpxQ1LFVT1qmHZaqd6RerYush7MnOV2gHQ2T/iB3WSfDEG4z+uU56Mno6UJlBs2R
         8pCghOrbGRAjaG0rxBTc3DtzEYsQXpoG2yvKJs1O70VtxhLMfx9wWjoVcZ24Hz/4gpiO
         DgbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EfFQqDHT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si3494969qkl.152.2020.03.05.09.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 09:59:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EfFQqDHT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9umG-0002rl-Iu
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 12:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47159)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ukI-0007dR-65
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ukH-0002uM-3I
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24466
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ukG-0002tw-W8
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583431036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFzOf21mMRMWBpr53hzhWDWl6EUS9wSXvSla5EkKK0o=;
 b=EfFQqDHTUEg4jFEla9iviswXvoCTW1AM9UBrFdvs3LOGgstRyzKr+WEV4dNjsAfezDkWgG
 SquDItZc8wqGiMaQF4QENJrjqjervRk9lnMvYMtBl8QsGFuVy8OPAPSclM+cg7KekzYzsY
 JJ5KXIBOPD3qUEdJX84EEmWf/Y7r0A4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-jLfmTb2gOImu0ISXk252Xg-1; Thu, 05 Mar 2020 12:57:15 -0500
X-MC-Unique: jLfmTb2gOImu0ISXk252Xg-1
Received: by mail-wr1-f71.google.com with SMTP id p11so2598638wrn.10
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 09:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuZu0l8YBqYXQOonzFZy05S+UvA1gUT1JdqmPkqMlAs=;
 b=dEtLhEPJsPdSQaIfp40FR5byiOenaUWjWb57l1A95nILR2skhjeXO8VroHyUM37Ecq
 4IcFB19VfCE0QZfDcXxxV9WGj378l4P8bwv5Jr0lwOh18+ek0RPpWm4Q6c76/MIHdK6p
 ID4Fsuluf+GnxaSYnfj1boDX/yEjJyrnTgd5GLdRbZOa/i+ExfaKKYxAjjvulMACSrQl
 ZguUY3zTh4bJT7zJwMlv37XeIcK+PCfQEf3SvYo/FvL+5vjv+kPBf3BvWbfSeI68b+Ij
 mv9d4IIr02KXqBALcGZbTBd7MwKOE73diBIJi3xj24xCdKj6AUkUZLmUp2elXuzXR8VV
 glJA==
X-Gm-Message-State: ANhLgQ1tkKhYSNweWrI22DJamGM8OvX50PXIanHWwyzqGdLDbFYn4wX/
 jMqGPZ4xH6hP/+n9iSrisXDp8viVHW8MezWjKKb1VyVmrfLRZoYD4AJ69VAfE9tv5TbvwAjW5iB
 iwrUgBIyX+pkv
X-Received: by 2002:a1c:750e:: with SMTP id o14mr10482413wmc.156.1583431033782; 
 Thu, 05 Mar 2020 09:57:13 -0800 (PST)
X-Received: by 2002:a1c:750e:: with SMTP id o14mr10482398wmc.156.1583431033617; 
 Thu, 05 Mar 2020 09:57:13 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id a1sm5164615wru.75.2020.03.05.09.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 09:57:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/net/rtl8139: Update coding style to make checkpatch.pl
 happy
Date: Thu,  5 Mar 2020 18:56:48 +0100
Message-Id: <20200305175651.4563-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305175651.4563-1-philmd@redhat.com>
References: <20200305175651.4563-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, Beniamino Galvani <b.galvani@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vRzsg728ctQ8

We will modify this code in the next commit. Clean it up
first to avoid checkpatch.pl errors.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/rtl8139.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index ef3211537f..be9a0af629 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -799,10 +799,12 @@ static int rtl8139_can_receive(NetClientState *nc)
     int avail;
=20
     /* Receive (drop) packets if card is disabled.  */
-    if (!s->clock_enabled)
-      return 1;
-    if (!rtl8139_receiver_enabled(s))
-      return 1;
+    if (!s->clock_enabled) {
+        return 1;
+    }
+    if (!rtl8139_receiver_enabled(s)) {
+        return 1;
+    }
=20
     if (rtl8139_cp_receiver_enabled(s) && rtl8139_cp_rx_valid(s)) {
         /* ??? Flow control not implemented in c+ mode.
--=20
2.21.1

