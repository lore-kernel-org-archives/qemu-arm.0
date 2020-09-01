Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4462711lfc;
        Tue, 1 Sep 2020 03:41:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxencxLdJVJCyzSy5Y5nKUwVe2QqdnjGCuLXqrHBRKUNBRY5wvdoaWUxXZN0ekgC/Ukl5pU
X-Received: by 2002:a25:c345:: with SMTP id t66mr1823538ybf.218.1598956860844;
        Tue, 01 Sep 2020 03:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598956860; cv=none;
        d=google.com; s=arc-20160816;
        b=l6cYAAfMlzkBGJuuaDD1mz/ApIcbqAziWdQI7J/EnYPW3P8Giaky3GXR/egWgmZ8ia
         P/LHfNiOA/i+1gKRrGOi+x1pzhRTKszCuwuTWqXPOqetUUM/wPdmujKviEDZznLGs1ab
         INERPvSJjMyXWaR1UdrZE9yG4FQTE5sSEih570haODLC/WhoeN7UEIimdq8GVvwfvQNo
         gHWnsMYJIFxC+xfKioPpJfm3e9i4wgBdp/B1yKWce+zFr3KvEYKdyuqrOyw7aHiBCQyo
         YtdqYHiFsn7ELtBpugWvRjFOJrM96tNNT+LMdlkprJTgnRNK6VD9r/fk9F8BHBvatAh4
         QyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=AS9iE5jICxt728QvQddccBLJxmpLmZSe3J8QH1ar4ec=;
        b=N/xKyPhStY+NdBeCs8l+51hvgtx8tvg1rT9HajJ6v1tZ6ZduKJWWXYzn0LVCRlgPLq
         y5eTVFZ6QR5tMs/FhuZyHB4OAc2/naFlVHuCtpyehNXwpzqHmUwfOp14XOXRjq+o9vOw
         k+U/2atsVSMWY8mZYgzVL+BgevLoeJXRh9oi/hJEirG5lctXUJ8sKMdg9ECRaUfyF0lw
         YOWQGPLdET2DD34FFgXGluQWB8OtkNjK5ueIzLMiXjSRwSJ8qoUokjQhR64DJZDKj1NE
         uW2XE7NE4TAtsqNqrMioxn4+6a2beo4udyN9QCJKsBBUCj2jSsIgNMKjGv5HXcNnPPDz
         HwHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pWbeLGIU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si695862ybq.70.2020.09.01.03.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 03:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pWbeLGIU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD3im-0004We-5C
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 06:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ic-0004VC-NG; Tue, 01 Sep 2020 06:40:50 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ib-0001rU-8i; Tue, 01 Sep 2020 06:40:50 -0400
Received: by mail-wm1-x343.google.com with SMTP id v4so659720wmj.5;
 Tue, 01 Sep 2020 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AS9iE5jICxt728QvQddccBLJxmpLmZSe3J8QH1ar4ec=;
 b=pWbeLGIUG6DEWzohVYh0R3MPCT/wYTFQff8wIJt3ANIJTFzgkRIqJC76+yYfXX0DRK
 ap7/sLZ/97/yXBAfeUbeNHqICanWYLTYZFr17HHBGcspdXfa0XD6mR6sDw+mgE9811Xc
 Ol29xXEj1U1lAGw+xO59p/bQYP5N7tPaKgDz6ZiZ/OV6oBVC9e3cStMJKRrZaDhicctI
 k9/Ll0ktPxTtAIVp2pXE8sD2OoV1KWAAn7dP72jlpSpgLkKUDafpph0nnjIR517RSsdY
 6RkCeaE2eYMBYDr3QT7lU9DHBf7W9hMfF0LkV0ui3R3rBF8q1/GwmeTkvXa7tQGBztip
 VhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AS9iE5jICxt728QvQddccBLJxmpLmZSe3J8QH1ar4ec=;
 b=ImbQdPNQtQ5pApZMlW2Gym4w/JNp5NNYJXoSheaVQf/rDF9le72Dzhgzb+W9iTHvG9
 WKs5Tck2xD5p+NtpOdbUHbFMKJKFs5BfTV5wwrSMYuNK4QNikAxkU156fAtpdqgkaURV
 VwDvqq/oqF+Y6HN80rxTLptFzZqBYaK5FwycBbXUKAwRkCTK2hIYGEpQ075cC0vHaqxd
 NBMzzZ/15eKGN9eVW7cbZREr03v05HTyXg+Xay10e3Yv5kf7joPNwIZLuWEzbhuGZALe
 CNiiN0wfH51pCh2djtMOvY1VB0n6Uwo+qLbGZKtfA3M3uSkGpGxdVvqJibexAnaRa+x2
 kkIw==
X-Gm-Message-State: AOAM531sn+BqZj2X8M4b+L5+qno1f05d9Pje2r+AYfMnVq1SW6XSOuTd
 tq8u+KHZrtCzLgDrl8l2cOmce11vJMo=
X-Received: by 2002:a1c:4187:: with SMTP id o129mr1107714wma.113.1598956846547; 
 Tue, 01 Sep 2020 03:40:46 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id o9sm1541461wrw.58.2020.09.01.03.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:40:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw: Replace some impossible checks by assertions
Date: Tue,  1 Sep 2020 12:40:38 +0200
Message-Id: <20200901104043.91383-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KuKphjM6SGQT

Trivial patches removing unreachable code.

Philippe Mathieu-Daudé (5):
  hw/gpio/max7310: Remove impossible check
  hw/mips/fuloong2e: Convert pointless error message to an assert()
  hw/ppc/ppc4xx_pci: Use ARRAY_SIZE() instead of magic value
  hw/ppc/ppc4xx_pci: Replace pointless warning by assert()
  hw/isa/isa-bus: Replace hw_error() by assert()

 hw/gpio/max7310.c   | 4 ----
 hw/isa/isa-bus.c    | 9 ++-------
 hw/mips/fuloong2e.c | 5 +----
 hw/ppc/ppc4xx_pci.c | 8 +++-----
 4 files changed, 6 insertions(+), 20 deletions(-)

-- 
2.26.2

