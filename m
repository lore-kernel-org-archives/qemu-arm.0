Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6201315lfg;
        Thu, 4 Mar 2021 04:41:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkSwzAtAxz21sQSl+ZYuZs8Q5OJiFh5sdqiQjvYczy8kfHWswPRlnWy8Qi83BE3jjTs2eL
X-Received: by 2002:aca:4915:: with SMTP id w21mr2612363oia.95.1614861662911;
        Thu, 04 Mar 2021 04:41:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614861662; cv=none;
        d=google.com; s=arc-20160816;
        b=bc3wWT4t7fj+y+e9meYtPhKVDDv7UhC2B5PAFHWlL/OIkGxlg/bYn8cJ54BTlpGCel
         QzBq8RWCg2x+nS9nVYQfnGLC2LGd4A87fxJQv9L0ZsNlXsVmFTTviSPu+ZxSCOam+V2A
         k+OF+GAw1C1wV6tmxV54dOQn7ALNelba8/UTg/Pb0Uh9/DS+aE23xR9kF9l/rdfkNWMD
         JCjpJvhCkn26VAk/mfEQQo96UyD6s1s32SAwvDMy7fQVKQL/iYq52CqHEqj+Xjchb0l9
         DEUfSbpMNiYT61KbDXvd7K6Wdqfdj8fTswU+B/P4BwzoN1L3IiZJb4HsSsyvx6XfIm53
         Bunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=EagLnrCfnxbI+u6u4D8ElQq9nmUh4StK1Ktaij6eEKo=;
        b=Z8zjLALJgui1ApWt4arS/q/p+jpDPUFGg0zzPlVmh5cRP5XJ7HLp1aYKFffEIYHBzQ
         VcZ8bb8GiWh+M7UT8EHh/Lr7q3bdRNaQkysqz/EPL6d4s7BPNuWf5WTRdE8BKavNtuhO
         BE9OGogghznTOuHX2hPMvaCyouvb8qvjHA1R4T9lE7lZNE9fztUUhg56UtWYTxki+bUF
         iv4M4Pd7UyzDWcDS7L9vT4v6vzPFrvLp8jrtbCVnqrAx03/RmcV94iQv8ubcPeEsBUxW
         tZB8wm6+8wwwOvWtyLQ0bIAZMjs0maniHTzTOzCZSYz7BSPWuJs9mlZ2FgMqSO9ZJb+E
         m19g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XSEzhLbQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h26si20730411oih.191.2021.03.04.04.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 04:41:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XSEzhLbQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHnHq-00023G-3F
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 07:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHnGz-000226-G2; Thu, 04 Mar 2021 07:40:09 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHnGw-00083p-AY; Thu, 04 Mar 2021 07:40:08 -0500
Received: by mail-pg1-x532.google.com with SMTP id g4so18857767pgj.0;
 Thu, 04 Mar 2021 04:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EagLnrCfnxbI+u6u4D8ElQq9nmUh4StK1Ktaij6eEKo=;
 b=XSEzhLbQHc9/VIb1cm4kuQtClK+ej1H18deTqJdAHREV5N1m7oT67II+P0lerHmPLK
 e6EM8KK/mVH1qeT4OTqlCNazjdkcmquzLzHev7YuWreDYJuKl5IQQVTcQng5SWOCpdV5
 OyUtAvXY5GAeFpylI/YjkzKMtefYW39cTIxfQKG/ZMOx9NLjcACYalYm7aXhw250NRls
 8zo2kd7PnkL+rkpbucGmywfHtIccE2TjRwoE+a5Wg3EYdmWsmrlhrthsgYi7OBiO9MCu
 sByH58VwT4PzD2td1lcvQ7GDiXyTsrkuSqJtUFRL0ll2TjpKufWNvPiP00uyObACPsgL
 Nkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EagLnrCfnxbI+u6u4D8ElQq9nmUh4StK1Ktaij6eEKo=;
 b=razKwpj3743uU5MmBqR5Ve48eXKCcsJ+dfT8ccj0AAR3jA/jHEx921GBpPy1upo4R7
 X/bwjS39Jlb/+IV5kHeSai7oQv0jGJ7qDALOWg914bP369PsGgUDSFhrNv+pJ8Gf9s+f
 u00MfuswABQwuc0yTZlkM3xvI+CHKSEg7VDwLQ/Gq9Ma9/10efc9IAs4N8ETt2OFS34m
 fHIjXBF+ALZyaYCxFyhTUAc9DG9JqVN2Hq72Yjwy5W7IVYWMptKH5oND+9BDjgSy2QqC
 1XEQ2XqoipnH+lMK8aU/6EKItiibY7u55b/XquzJaF12eCnje/qc3oV7cPeHURFAFZQP
 rjug==
X-Gm-Message-State: AOAM531Wvb26xvta2cP/GVaKbd0LuJ31zuWCHtJw5cqVsgLnx46M8haX
 bpxed5nx3F+NJDRVps6m+dU=
X-Received: by 2002:a63:1c19:: with SMTP id c25mr3499189pgc.374.1614861604028; 
 Thu, 04 Mar 2021 04:40:04 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id r13sm29228237pfg.37.2021.03.04.04.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 04:40:03 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 0/2] tests/acceptance: Test Aspeed ARM machines
Date: Thu,  4 Mar 2021 23:09:49 +1030
Message-Id: <20210304123951.163411-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P/lALWopDe0R

v2: Fix ast2600 test, thanks Cédric for the review.

This adds tests for the Aspeed ARM SoCs. The AST2400 and AST2500 tests
use OpenBMC images from that project, fetched from github releases. The
AST2600 test uses a Debian arm32 kernel.

Note that the ast2600 test will fail if [1] is not applied. I have
tested locally and all seems good.

I note that checkpatch warns about a couple of lines over 80 columns in
this file.  Can we agree to relax this restriction for this file, as it
helps the readability of the constants such as sha hashes and URLs?

[1] https://lore.kernel.org/qemu-devel/20210303010505.635621-1-joel@jms.id.au/T/#u

Joel Stanley (2):
  tests/acceptance: Test ast2400 and ast2500 machines
  tests/acceptance: Test ast2600 machine

 tests/acceptance/boot_linux_console.py | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

-- 
2.30.1

