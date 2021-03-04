Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6204045lfg;
        Thu, 4 Mar 2021 04:45:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJFMHQ+6nYHWBROaWv7MVHh3/349RRkm//zVAsxMMctbwmexaLmRqrg9T6/2nm9/NBxIQa
X-Received: by 2002:a92:444e:: with SMTP id a14mr3717205ilm.215.1614861931361;
        Thu, 04 Mar 2021 04:45:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614861931; cv=none;
        d=google.com; s=arc-20160816;
        b=qwakWGpeOye7eetya7zqM+RD2gFE+PXL5qdspPgyzbOy/1aQ/NRJLyVsKXU/sq9y73
         D//aFa/nbh83iDdTCwWK1glOVcvEctgAPETK+POLGEPpEJbJ4Bs58836FjYj2S+PQ3I7
         TsDqSUxftvY8iX9byufbulKLFPadRScgaJCsW7uRib5WftLSmLiJz5JcKUfdOr74Sutz
         vlJ477EyA876kMwOxMlb0t4nX0/KQzN9fz9taSUaiCIOEMD0dubqhgrWMsofk0N8fC+B
         y0LCcBlz9QQDMrMv4Ji13qaESWm95KQat0YYE/q0/Tm/WwsBj7hf3Q2fspvSNDwa1vJU
         alCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=M3igz7jopzXfWJ6+eBF3vNO5uEjoqswrCPxUBIjqFVM=;
        b=SaqCOe1OGYYwv9wZpcqUCz2NBKnckA4Az6b4G6ZyduMnNPAoff/ckXXsoxjHpHXvEZ
         cgimYUBmKXyH3ClPgs8DyYnPn7p4onpneIXztUzLNNifelX2PfYhrIPZMJdP4968KS7g
         f3go2ec77eLB1dW9O6LW1v1aBDyi58WfC3E03vZmJ0e5lDYM17YvcEXbs6DvXzV+IsiO
         rtTAhb7klxmB1D/B56NnzZJffHJ8qCPHUfMn4zB0TJdxoNrOrrmRW1+BuVmlWqjo71t0
         2F8vbHuJHHQflRs6ReLHxAoxhQnsjKwVRG4bNS2D7QvW+wab6hFHOiYvLY81MSpNvoPT
         K4ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VwJ3dc/H";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si21097874iov.19.2021.03.04.04.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 04:45:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VwJ3dc/H";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHnMA-00047M-IZ
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 07:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHnH8-000274-2C; Thu, 04 Mar 2021 07:40:19 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHnH4-00088J-V0; Thu, 04 Mar 2021 07:40:16 -0500
Received: by mail-pl1-x632.google.com with SMTP id z7so16063273plk.7;
 Thu, 04 Mar 2021 04:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M3igz7jopzXfWJ6+eBF3vNO5uEjoqswrCPxUBIjqFVM=;
 b=VwJ3dc/Ho3D1HzPwK77isIgBzhp49GCGc8yn5fJ2XlV24spK62Nk/4BFGT8XoMjq2y
 3BBy82trL6ThW4Y1YvaJsSwru18Y9xSkBv3noRcMuzjN6LC99qXxpkPMdiXjhp1XQN6k
 4kcroNPhiC2CyeztEaue8BEbCGDQWN/L4fofd9FCSZZ//xwZ47ACXmqI8Q0RecRynJp1
 REefcEjFeEIDiwV/6rJ/uJ9lW6Dt4DB/cmdOqojt7Sufy9JQ6nXrVfAJCFnDtag2yt0Z
 Kzbg+PM41A9Qg2vh6sAAQrBt+7zdm0ijgBSEZRfi3mNXImYSrWgUiTdAEI7C3sNKMeQg
 5dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M3igz7jopzXfWJ6+eBF3vNO5uEjoqswrCPxUBIjqFVM=;
 b=ZyRBaBfkX3NS1ilOuyDz7FKVTgA/stw0LfRndBovwRnPxzf8Dystci8Ws/90oOSo/K
 6LrTfVRv49uFf6luutscY1kGwz7UZrI7H5IAFjHT6Y84ycFhwgIIHFgJLKg2lEES4d9h
 H1hq2TUE5KTMIpZ13/NGjF4s4GqkhuzS+dJIS4H1TsvOfmCWpi/wSp7Zm8nFYkdNPYH4
 ufqGIcDaZFT0EKMwLjYIlX2vQBNBUu9HTS0yyePJZU0OS3v7V4v0tm7oT6TfJ7Oj+lKY
 U5lh5jPAG7oeIYq3k8LNdieWtNLDeO3pDFSVE24sfz/YNuPr5MjwjFERHmUwTmCaf96W
 ACng==
X-Gm-Message-State: AOAM533kL0A57rtgMeRcgwzk6+XlVaNTWBhcC38gjeaO+TswEv6y8qcc
 DgMoELUQ3FFfHfOYGcKrUog=
X-Received: by 2002:a17:90a:9f83:: with SMTP id
 o3mr4321325pjp.133.1614861613433; 
 Thu, 04 Mar 2021 04:40:13 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id r13sm29228237pfg.37.2021.03.04.04.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 04:40:12 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 2/2] tests/acceptance: Test ast2600 machine
Date: Thu,  4 Mar 2021 23:09:51 +1030
Message-Id: <20210304123951.163411-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304123951.163411-1-joel@jms.id.au>
References: <20210304123951.163411-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p/hhyzf+lGk1

This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
Tacoma BMC machine.

There is no root file system so the test terminates when boot reaches
the stage where it attempts and fails to mount something.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Update expected strings so test passes
---
 tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 2f46a08fdc10..4f1df69bc75c 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1094,6 +1094,32 @@ def do_test_arm_aspeed(self, image):
         # self.wait_for_console_pattern("login:")
         self.vm.shutdown()
 
+    def test_arm_ast2600_debian(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:tacoma-bmc
+        """
+        deb_url = ('http://snapshot.debian.org/archive/debian/'
+                   '20210302T203551Z/'
+                   'pool/main/l/linux/'
+                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
+        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
+                                    algorithm='sha256')
+        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
+        dtb_path = self.extract_from_deb(deb_path,
+                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
+
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-net', 'nic')
+        self.vm.launch()
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00")
+        self.wait_for_console_pattern("SMP: Total of 2 processors activated")
+        self.wait_for_console_pattern("No filesystem could mount root")
+        self.vm.shutdown()
+
     def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=arch:m68k
-- 
2.30.1

