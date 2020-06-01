Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3158512lfc;
        Mon, 1 Jun 2020 07:32:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweLZ2frop4qsD0kkkaoqpqgfzJmtbY97cT/P0TqD4kffZe+Ar4IgC4Klbk56PjQt1FTo9p
X-Received: by 2002:a25:c6c2:: with SMTP id k185mr13162430ybf.94.1591021973624;
        Mon, 01 Jun 2020 07:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591021973; cv=none;
        d=google.com; s=arc-20160816;
        b=g7qS3xqj0Os9lV/S1Kz9dSfG0PiXuTHg1+DE2Bz0g/66tH1DHpta/+YQ/sS0bQePvS
         vBxs7g7tCqyixCRnGMXo0iihbsfZINQpyuu1wAoNFuz43hVp2zPFergxyNI2y+E4NRdu
         c3b8XJvTwjDLi8HOWkJBkiPFtdJx7/BxEthD9VnbQ8cxzBMp2DzbtJNoo0KTF0A5Zh6c
         s7vsLEtxbOjct15MCTcsEy9jk/8nQYe7S5lZiC0nfEkDdPU990pCCOsKb6JbpfRHJtJf
         3692I3dPsyLytQOLkHxqvmFztkyAK6t9SSl+3/5Ku2Pso5hgb8+i6tj1vGyd1+Q9MOR8
         qxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WN1hnPJG9k0d4gUFGI62xXK6PTE3h6bC3clI/uY9zSA=;
        b=ujeSVzUCAhRrEZV0RhL+qL31Iy6UJ6XDSd4seD6ulThzt328Hh/dL9ZXAgHHaaq5Mt
         V2H0cYjppr9MiqKgty09+kWP0fVstgfnZXIZzTIMkNu3QpFLk2GQbM9mr8AgLBmgBAiY
         JAb5KjlbPN2D9zqkXbiBWPSwpiVxuF8RprIECkyUi7You7ieEp59KR2FocOkdkXFtBtg
         7FiBo3zrLZJQjZ6+1aA+CSCZXZqJzqJhx0T9B9qDJcOWVNyG5AsHXWbU66S61gkTjC8+
         rLmPQVR5XutbWvJ8ejXwnRZgtt5A9u74dvN2cHMIXxRIws9v0JS910IqopZSoEDQtHIp
         u7mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rQwXUg5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si14790210ybq.35.2020.06.01.07.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 07:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rQwXUg5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jflUi-0007HZ-Tm
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 10:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRe-0002SA-6m; Mon, 01 Jun 2020 10:29:42 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRd-0002bh-F4; Mon, 01 Jun 2020 10:29:41 -0400
Received: by mail-wr1-x443.google.com with SMTP id t18so51838wru.6;
 Mon, 01 Jun 2020 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WN1hnPJG9k0d4gUFGI62xXK6PTE3h6bC3clI/uY9zSA=;
 b=rQwXUg5DD3bZsQKBRP7+TLjtYRMRCkZaFS2Fc7UIHD4mZRBfDS/xiHu1Ue7JMj47lo
 YQCrXZP8AKSO/hQoXyFxRj5UVshxPxPHrfI8L5MRjJGqrtaXVeGmzmB9k3tsSYkegpHw
 rIZyb6oYca/YB/VWnAwFypBPoGjFMyWYhhvnp6dYTnCShgkU3DdL0ATl0WZqM+1xZXmC
 I1gkLtwqiSpUmsOC1Cw04fVuPZqiVTOd/bU8DnmQyuNBlhYQOcgvPtNCedgy/w67TQHv
 DYIcgr00vL3ihkHjppAsbuMqntmvih0rbRttVm6m483rOleYpDp9FZ9JTr7I1AgIraLC
 bcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WN1hnPJG9k0d4gUFGI62xXK6PTE3h6bC3clI/uY9zSA=;
 b=I7LU67KYgWuDeWiVcVjnjAi0riXaH40Am8cHtt/LL0P8V6XxGUmvAdU68JZ4lIRRGj
 QiW6FIqmgzWCEaQdn2qBFCiywMYvwzSDcoOjy+7OEUZNaAQtq7xGyDCYGextZMa15+Al
 ijhdkzWCXIIVHVLrUJNflkKLiSsOMiXWutrKxtXotoF/VFr7WPRae8unVwy5hg889DtL
 AhMano3GyGkZ5sZM2jXJoXwqDjlBUKuLyQgxf17GF1eV7gyLnUEU4S/iosCfiKMx4Y3w
 9kKIbXiwMnzXuI0brT85TrR5OQ2T3g9v3yZaOyuIkF56M3+DxZnQPol3NWaz7ver6H10
 +JxQ==
X-Gm-Message-State: AOAM531XizH1LmL0tfob19FESnjEMKYr3yNpbxLV1qIpS+cjP1ZfuL5Z
 WFGCLNbR11wfWNbW/7LydXt8TE6y
X-Received: by 2002:adf:bac8:: with SMTP id w8mr21300417wrg.47.1591021778914; 
 Mon, 01 Jun 2020 07:29:38 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] hw/pci/pci_bridge: Use the IEC binary prefix
 definitions
Date: Mon,  1 Jun 2020 16:29:26 +0200
Message-Id: <20200601142930.29408-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xp0jNmQJMWhu

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci/pci_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 3ba3203f72..3789c17edc 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -423,14 +423,14 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
     }
 
     if (res_reserve.mem_non_pref != (uint64_t)-1 &&
-        res_reserve.mem_non_pref >= (1ULL << 32)) {
+        res_reserve.mem_non_pref >= 4 * GiB) {
         error_setg(errp,
                    "PCI resource reserve cap: mem-reserve must be less than 4G");
         return -EINVAL;
     }
 
     if (res_reserve.mem_pref_32 != (uint64_t)-1 &&
-        res_reserve.mem_pref_32 >= (1ULL << 32)) {
+        res_reserve.mem_pref_32 >= 4 * GiB) {
         error_setg(errp,
                    "PCI resource reserve cap: pref32-reserve  must be less than 4G");
         return -EINVAL;
-- 
2.21.3

