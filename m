Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4348163lfg;
        Tue, 2 Mar 2021 02:28:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIhn8FdEOLL+DDENKuGgWBgpwoLT5T7WScQDgVAhcCKPHx/wa3hbQ+byu8o35dpX0nMr1c
X-Received: by 2002:a25:cfc5:: with SMTP id f188mr29753559ybg.485.1614680917145;
        Tue, 02 Mar 2021 02:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614680917; cv=none;
        d=google.com; s=arc-20160816;
        b=w2C3s2r9lwU/yViRhl006dsaN/wgM7Yh1Nt9lS1LGzL8mnGPyQ3QL+hFNfET10aKIY
         GigNAmC7M7F9mafd7D0qpRJsh1kBR2Y/OcnR2KyBgE6dv/1cTB28My19aVuzo5tMWhkO
         8/qzY4a9+3hMbrGX6Xmlm3JrllEBJ3ENDAZ9H7RNryPdgfOWaWhWNbnLHEMGGsDAh7ca
         +Lc4JLVI+oI5XezuC9svcotpQGI1uzzoSL0Ki130LhHQWWvjY9cOIaEft08+MX70DUpU
         wAHQbiHu07PPOjUwCNFYw59SyeNze9ePlH4APW38+NzyE9I5exNt0nGti1wdVbbPaXBN
         sUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sZzqDSzbsexD9Zh3aq/wd1p0b53KS/Yn8zf4kVHZSu8=;
        b=aVO969sdrEMi7BfTiQxiXE+dFgFr/CxpREBGCd1ywwf9YDbJUkmocTpZp8cPECFX00
         Xt08m9bJeRuH5EE7NQ8PtLL+sCP6obt7EWgbDN8LXvuPWo8MBLirvrmnNb+zkgJebh+g
         2rg7TEcDfpOPfeVCxvBPpc1tjGpDQxdaECInUaBIMeobiTowZouQKOM9VEn4AVNcitw5
         rtcJgrt8L1t1bvvBTZ+BZRDe+on6Ez+Egrq9UJF+iAoTs8yAc6FLkFSqhEg899Ydp5dR
         +nSLgbgoXR7NIVd7FkGkZbuamFY/bOB7onXnL01O+f5CYGwdcSpmnl7AaF9Hgmi3fSQU
         oG0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C3VIutOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si19606026ybm.155.2021.03.02.02.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 02:28:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C3VIutOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH2Ga-0002Ti-Fe
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 05:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2Fs-0001YX-OC; Tue, 02 Mar 2021 05:27:52 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2Fr-0008GO-6O; Tue, 02 Mar 2021 05:27:52 -0500
Received: by mail-ed1-x535.google.com with SMTP id l12so24482147edt.3;
 Tue, 02 Mar 2021 02:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZzqDSzbsexD9Zh3aq/wd1p0b53KS/Yn8zf4kVHZSu8=;
 b=C3VIutOQ4snDMas8WGz4Eq0p3PRH6FNWNO92X7rY5mbfYX477lNZZGR4VVP3Ji8btv
 Fu/VuNP8Ha633E687ZFIC8LSvXQI44CP3k+PPrKQtAN3YOYO+UeSMTvmpyM6+pCZk6Fi
 JlW+vV340tpRIX6XHxZqcBpFAeBtekvvVN62Xr4+cQ3Qomi7SSEWsjW7ecL37ydyZXXA
 zr7Txx9+4uuKzEIj+VfTkJNEa6Nrt8SZcKCZXcfzjTtOtVHk4gKi3hwE1zNeHahQBGDH
 iWKnGxrkWlvbVaocp9Mtb2NjfGK8vt5Jwn1XD2fWnNsdDqPUp6UfTS4q/H8uRPaqh9hZ
 Y2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sZzqDSzbsexD9Zh3aq/wd1p0b53KS/Yn8zf4kVHZSu8=;
 b=rL656dPBDAOHxcejM1IJxzqFX5yf+6BqZ4rym6dowu3V8g/rVnztEwUfgfUXLT2ayl
 /PQ580JY3bLN1VugvWou92Fakc/g1/OJR7GnrDwvQUEyBL7RQTMS0018ou1TvEvfXaw1
 VcjH9oUu5cZCgP1thdi9768w40D7e5ZMVd36YTnDy/Pu4ROCimyXVG6hE1owC8du1r+3
 ZAStVezRN/BVQVbT9xikifVYrQXRBZHo18b14soY6xQwyFzwTzeu+//CGpVxz/kgOMGs
 fAmGit4yChXA+C8sqjZJgyfcLW5TqU2qDk1T6sOStdrgnT4OiLkrMQRZwJkIDbnflSEV
 ui7g==
X-Gm-Message-State: AOAM533Dh2jvwQxOEp8ql173XI6E9+ilc4hmwjoBByEFAXlYsvByxoUA
 U+CsUPGYyjgYZD4LuTMDJ87jbvTZ8WQ=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr18340311edr.172.1614680868034; 
 Tue, 02 Mar 2021 02:27:48 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f17sm17965537edu.28.2021.03.02.02.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:27:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] sysemu/tcg: Restrict tcg_exec_init() to CONFIG_TCG
Date: Tue,  2 Mar 2021 11:27:31 +0100
Message-Id: <20210302102737.1031287-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302102737.1031287-1-f4bug@amsat.org>
References: <20210302102737.1031287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6MoYIP8MTaSr

Invert the #ifdef'ry to easily restrict tcg_exec_init() declaration
to CONFIG_TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/tcg.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 00349fb18a7..fddde2b6b9a 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -8,13 +8,15 @@
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
+#ifndef CONFIG_TCG
+#define tcg_enabled() 0
+#else
+
 void tcg_exec_init(unsigned long tb_size, int splitwx);
 
-#ifdef CONFIG_TCG
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
-#else
-#define tcg_enabled() 0
-#endif
+
+#endif /* CONFIG_TCG */
 
 #endif
-- 
2.26.2

