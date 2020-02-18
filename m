Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5940986lfp;
        Tue, 18 Feb 2020 01:46:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxod/Rmntvl4WqkLQ1I9kKneeWeHtweQyKV6omiuiDQv3UUFAFmg0lWNREmT5SOdaSVvAFL
X-Received: by 2002:ac8:16ca:: with SMTP id y10mr17227461qtk.340.1582019217001;
        Tue, 18 Feb 2020 01:46:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019216; cv=none;
        d=google.com; s=arc-20160816;
        b=X1draY2NybCR4nhnGwy1JkkxiaNm/8URlfotldOfsYNJw+yxexjLM5jI6DmodJ07hr
         N1jcnId7Gq4EMv7pLWKLo5JrraAIS70gazczM17evEjJfJiW5WMnzynGkDwGipY8Hh9b
         Ubo624OEJwZbF4Y0x+eAjUmN/T4yolX9g5ZIQ7z0xHk3I0OjrqWOsYG0GhEHy5Woz16D
         dHYDQStCNNLKEpFLkneiov085NJL4hjNzIKSLGJLXT5SqeCtGs/dlb2PV70WigYmkJCT
         pO+sIijxlYxDNLwGg/BIzasfyfsfg4DsgSrIVEyDH47nI3V3Jssmh05GtPCA9MicDzkd
         Uymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZU7fveF1nmznN+St3KEHVmWeNf346k9KkwUIERJBNlc=;
        b=ERCZD/mfNMblnGukyBHxkWRq9fNnlsvOsEbVdXx1Rz8gvFt05Gtr+g4xQOnfxU/I9E
         Q8nkOTSPoT69m2OuvDgludBIzeFJtTfJTG3J+9KmJxNkmg9as9s7XWMtluV8NUuwgjzv
         BLSoQqacul/PswuiGmdV1XjP0WEDuyyzrZHFEKEmJBAkz8IM+fQ+3SHKEe3j1zsbaoCf
         GbZpfaQy3gyQrRh4zer7/w7c4HroVGxMXaNoxn/qef0K7+/id/CbqAPae3UTSH8Rz8iF
         Ky/5PFJEuTtMPpe0eClTTuvgtQ1DAeLqVI/m7yxZNBUXROmyNwBUKVImSa4vv6KFO5Gp
         HNEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FBuP2m39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si1421259qvw.135.2020.02.18.01.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:46:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FBuP2m39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zSy-0005dE-DR
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQM-00014Y-8u
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQL-0005pl-9T
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49111
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQL-0005pH-5r
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZU7fveF1nmznN+St3KEHVmWeNf346k9KkwUIERJBNlc=;
 b=FBuP2m39Ei0u5yezOGWskeu39oWChFC0pyaj2rfFkmB/w3/gu6MaCBGvA1g8wJTuB3Wn9L
 5bkE+jmN1SVmm7b1zR6Q+dLjp34l452wqTJFEYxcxJqmpPbiRu8kxSD8MB2PdifvKeD7mv
 A8x+hnVpW+gV6YNH9QTXIBxPrlFUjFs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Uoun4uODPeyvbD_SnZFYug-1; Tue, 18 Feb 2020 04:44:11 -0500
Received: by mail-wr1-f70.google.com with SMTP id j4so10508867wrs.13
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ajGEvpxvLQVL8Fd5Rt9Hd36QOTmv1kRHcUMcc2d9U3U=;
 b=X+09M0Cc+OQ2F23M8XSZRzqUz+Fjm1nb/JlG3G0Nfc29qInI/DJni6wxLSi+K/KLpf
 We3kobKvAT88u+dnR2gM6qsQ8Fe+o3uKyWCNqrrGToBzHECSpkFxnapNGlFiwhkfg7pY
 bcLbQpXUn0J6PTxI52v4xTrf8f3Bp/vc7WifqhgIXbege7YLLMgRIFV+oLWv+ihghfqF
 y3G9FG8w9VKq1S7RBs71bH6C0OV0+tWsupkET9PQtCUL+3zQyQhQmaisgrA+TlgrY7Xs
 Lp7vmwQIUco/xiIAqZ1i3XnSQ3nIFDEzz+XaDQBFJKLFg/U3ocTNbYv+TwF/tOyQGveX
 lyxw==
X-Gm-Message-State: APjAAAUSfgCg+cXhuDq7WBr/L2RNSA3rVRE+l2aKKCvtPDrl1yKVoD7K
 TJ0D0fodL1b85C/nZZt2xUpdOtbFUygLb5DIA/yHDQE7SgoIGZRFRIft5+hkjyE7IAr2z8bgNp+
 MUrXeP9qFoGfl
X-Received: by 2002:a7b:c119:: with SMTP id w25mr2205632wmi.116.1582019049932; 
 Tue, 18 Feb 2020 01:44:09 -0800 (PST)
X-Received: by 2002:a7b:c119:: with SMTP id w25mr2205584wmi.116.1582019049667; 
 Tue, 18 Feb 2020 01:44:09 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 02/13] audio/alsaaudio: Remove superfluous semicolons
Date: Tue, 18 Feb 2020 10:43:51 +0100
Message-Id: <20200218094402.26625-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: Uoun4uODPeyvbD_SnZFYug-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>,
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
X-TUID: yPbQ4GnBPm6o

Fixes: 286a5d201e4
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <DirtY.iCE.hu@gmail.com>
---
 audio/alsaaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index a23a5a0b60..a8e62542f9 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -819,7 +819,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, size_=
t len)
             switch (nread) {
             case 0:
                 trace_alsa_read_zero(len);
-                return pos;;
+                return pos;
=20
             case -EPIPE:
                 if (alsa_recover(alsa->handle)) {
@@ -835,7 +835,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, size_=
t len)
             default:
                 alsa_logerr(nread, "Failed to read %zu frames to %p\n",
                             len, dst);
-                return pos;;
+                return pos;
             }
         }
=20
--=20
2.21.1

