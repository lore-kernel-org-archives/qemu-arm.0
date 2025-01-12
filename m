Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1413305njn;
        Sun, 12 Jan 2025 13:01:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWyY/vHZlTA0aiXLHylQQvF3xoHiJOQU3DtyHlYr9MelVwxKty9WnSNpLgsdQNqjXe3dCdg6RH1MWZtsw==@linaro.org
X-Google-Smtp-Source: AGHT+IEiyAq/em9N1zs3/EBdLP9qHH49aLnO3VGIEEOgFxfz69C5DUEmSfNs5bIBs+iVTHxwWbCt
X-Received: by 2002:a05:620a:2a15:b0:7b6:6634:5a42 with SMTP id af79cd13be357-7bcd973e684mr2805458385a.23.1736715716145;
        Sun, 12 Jan 2025 13:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736715716; cv=none;
        d=google.com; s=arc-20240605;
        b=kIk0TiE3gadbtP9iQ780SM6O+/v9oDVSMd33pEC5h7DcdhGa0vLxnUGu5Uur/oBcdA
         VKY6K632ba0mly1iUWRQyS9KDf/v1X50JctkHP0ccJ4tS2g9Rwl+JZ6NVXYD/4OGyESZ
         ndu/nyxqiGJm73p8XTkWQKNnc8eQqjyN0a7jq5tCSTiciD/FQ81sB5MvFLbnlVnAI3fp
         fO+xtZdH1DJiVFGCXktuz3Dw6+CV1iuKiSq/g/wF0KBAJZjdJjE2Y8oYhbuCzgDMluJs
         j4Xl1wfthQsHpyjbcCsRhcQ3fSfhZ/zb3iGL6DWA2hDklYzZEQMgZRpOirS4C1tTjFmQ
         bfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y742HvnBW/DaljtWfLgOW0bZlwROPRmuvKZaV8wXJYw=;
        fh=hKRLOOKzUJos+yqfyYtgUmzIDi6gvkBVc6vr37O4+RE=;
        b=lCnU5bW70TnJDoAxOgkNYIUv/4oyEvqYxmB8IKmRD+Eb9pFJx/b9daeQfUdtLTeVlf
         PrVgIfFllPinWpXe//UqwUiUymIKhJJ9JgkFo4CYDHpwcW0O0O1HZiRH5gDrkxts70Gi
         MTCag3mU86D49r4OLWeJP5//xwo/Ah1YK7RrxjnivZkL4fq+bRx03HvgcReCMu7MhD/r
         rszlSELQrhQz/tHhgJeoKSw25KyF5FGa3R41NVLBi8hzTWRybsnXyR3CtfmNTqo7ad0B
         wkXP+sgjreuvaV7R8zdsyvDDRW6En095c+8NO/EuH9QhNxpO/+k8+bA3K7sWbYOzuy/Y
         WNQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=sqMyZGlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadf6b74csi80664776d6.363.2025.01.12.13.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 13:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=sqMyZGlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX55T-0004Rm-Ml; Sun, 12 Jan 2025 16:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55R-0004RC-7I
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:33 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55M-0006Mf-PC
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:32 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so6404620a12.3
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 13:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736715687; x=1737320487;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y742HvnBW/DaljtWfLgOW0bZlwROPRmuvKZaV8wXJYw=;
 b=sqMyZGlussrSXI/NpkCg9lAmrMjNWWfDy+j88gi8D3IlDUwP24N2NWYg8pngQAOu4L
 nem3Upehu1+y0CFQCs+86+2nPRWysGh5SvdxctevMINYIYOsZH6fU04Iq99Z5Aig49YI
 mOQOOcn3I720mIRwlt1NEdaoh3zNK3olWsmP6VnE2vi3vKOBJFPzb1HUZW18v6DSXYgI
 6TqkZefjzZwLYXqQU8tMWTwiJhSWTfQFCySPbpOOfaJk3zNuqL2I7ToVbDSDXB4oXlW3
 j49Ljf39Gm3u7MDR6SwFwuYGugwK56IUaxVzb7cuSrTc0rxNFH1E1/PoS5MSCTBlOQ1V
 DiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715687; x=1737320487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y742HvnBW/DaljtWfLgOW0bZlwROPRmuvKZaV8wXJYw=;
 b=oimnCgsFLFPewuCsrTI9Klg3He+6g+yTS0WInprIEV0oHP5PFfBTZl4BmFac6OEW9B
 q48Tvkvm4AZrYmvUo9cwW1EOzimXln7RsLlM6PCmZjM4teC5fTIPF+qfsLAeh6Cip9TU
 aUXCtd+uokxUA7AA9sV9EmhWU0Gsh8dtwdARuXdOzFF/Q3z9UiXTdtPigMBsNlW7R/J3
 hK93AcHBf/vr9uIYFu0hRefRCTJaJ8mHpKF4F+P+Rhj0SinAQoyEIsNrdr4EO53hzQ2e
 i2bsHu6i6TVQNBceBPDU8t8QbximyLQ4p0eXDsj8Yv8pmWEAMAujOFwVQrPBrzb2RNxi
 p/jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5m3w0Fo7NB/hLO3K87hsA4hoXo/A5bdeQZcOOzzIZ9S6so1OjBaKG28e6vn9yiifb3wgzvqNaqw==@nongnu.org
X-Gm-Message-State: AOJu0YzgV5Q0lSO62cgyd56gKtIOXYAUgCBnJJnUBe/I1+1jQbndYslt
 3/+owm2KEDlXzh5H1C4GpBV5TYxXGvfNv4fCBBBSqugKozfL8ZDkGh993TY9iw==
X-Gm-Gg: ASbGncvQs0JT4kAsgAoIYL/F9D3BZs/Ik3j4WpCtUBI6s0W5zpqHnRLNl6ifs6oiUb2
 jdzqSUkQmhMaciOqBCelxSckabRnnB+E/K1oP9PD5S6FWeCspfbU5KZZrhEQkaLCxOIw3uOdDeh
 pevJBzFHyRxrhgxBP0T1RSGOPIAk2kTRZxQY2geNyWGLBVayflokkKcvNx9m0VB8aUZEdZe3jGS
 bBDnGmugCtIfP5hojCvLRVdWqn6jc55PygmB3+wzLV5lF4MNKItaUQxBQw1aPs3S3WZyKfvUEt4
 DxUJM9qZuZ5Qx1rxYmwFBT3CU0reaLj+
X-Received: by 2002:a17:907:60d5:b0:aa6:a228:afaf with SMTP id
 a640c23a62f3a-ab2abcb139cmr1756254366b.52.1736715686921; 
 Sun, 12 Jan 2025 13:01:26 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e283sm418276666b.31.2025.01.12.13.01.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 13:01:26 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org
Subject: [PATCH v17 01/11] hw/usb/hcd-xhci-pci: Use modulo to select MSI
 vector as per spec
Date: Sun, 12 Jan 2025 22:00:46 +0100
Message-Id: <20250112210056.16658-2-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
References: <20250112210056.16658-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::530;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LnKZPIiRHAuR

QEMU would crash with a failed assertion if the XHCI controller
attempted to raise the interrupt on an interrupter corresponding
to a MSI vector with a higher index than the highest configured
for the device by the guest driver.

This behaviour is correct on the MSI/PCI side: per PCI 3.0 spec,
devices must ensure they do not send MSI notifications for
vectors beyond the range of those allocated by the system/driver
software. Unlike MSI-X, there is no generic way for handling
aliasing in the case of fewer allocated vectors than requested,
so the specifics are up to device implementors. (Section
6.8.3.4. "Sending Messages")

It turns out the XHCI spec (Implementation Note in section 4.17,
"Interrupters") requires that the host controller signal the MSI
vector with the number computed by taking the interrupter number
modulo the number of enabled MSI vectors.

This change introduces that modulo calculation, fixing the
failed assertion. This makes the device work correctly in MSI mode
with macOS's XHCI driver, which only allocates a single vector.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---

v2:

 * Switch to modulo arithmetic for MSI vector number rather than dropping,
   as per spec.

 hw/usb/hcd-xhci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index a069b42338..49642aab58 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -74,6 +74,7 @@ static bool xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
     }
 
     if (msi_enabled(pci_dev) && level) {
+        n %= msi_nr_vectors_allocated(pci_dev);
         msi_notify(pci_dev, n);
         return true;
     }
-- 
2.39.5 (Apple Git-154)

