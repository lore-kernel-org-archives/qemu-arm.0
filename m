Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1704883lfp;
        Tue, 12 Jul 2022 15:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uV0yKAtM11wmeehinpTr4AR85xDSHBtmWjywIwlQIpwmfrvfG5zlYEdcyop6Ya1ysENF0q
X-Received: by 2002:ac8:7dc6:0:b0:31b:33f:d90d with SMTP id c6-20020ac87dc6000000b0031b033fd90dmr143014qte.332.1657663349964;
        Tue, 12 Jul 2022 15:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657663349; cv=none;
        d=google.com; s=arc-20160816;
        b=eldnNTd0LNG9OcO0BmQPdy7N+9H0fjpVX0Viv3sUV1cCBtTvUkMhXrINUr2zbKg5t+
         lAV4pNB70BdkMLlaQe6UHPXSPf1gRv4GFaReHq94DKCSOEXtzD/oHMFhbeEJrwmJPMA4
         aR3wldSXsuZDHUPHjeTrq0YKESGPxt7QvqPygheLbV2+EU3GT9yUlQz3W6ZcSQi7Vwmy
         wHVsIiqTam7KBEvzY/Rsdn4kwoz/+WVn7NMXpzSuK2EhmDjy63ca0X3c1WPFmCm59oIG
         3cnC9ydX1PtICsj9H/LJI1r+y6jmnTuZCz8iRBRd3aVsKujb5rsHRKcrJqKMh1JjR7s4
         aNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=X6sC1OZTXLEfI5S5DKqwWLHrN8liDQWvWG/qVo/EOvU=;
        b=n7Qm/wWzmSkfEkWYeYMA6X0WyNe61+jwJp2ZXwmsGRdBglgrBLXinxxLWYk9B+vvzp
         QAF/xzlRn8xNAUn83hQJoMSAw+4HXXbOPR2CER8kNNaNtJnBxi5qc/IoxSVedSyXVFn1
         2Z+uq5LUzqMciLYdtlZjg+NVHHlBptSILhdvhl63GqiY03AyCeSZ87XSWDMcjuZM4ZIV
         fDVt5Y0mggDF9TNlbrc2JIkUTvmJkwBGMjH2OKaDyHZ63AwhrQugKACgj3myvdXN16uj
         POnH7nmKif/RiQsBTbgmW2bB8RClzx/Y36mUkgEZYJJZkftH40lWS3S2nOvpByiLkgHr
         KU6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=WAoUnpRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb18-20020a05622a1b1200b0031ccdde1174si5508260qtb.765.2022.07.12.15.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=WAoUnpRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBNxd-0005d7-4R
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpn-0002Md-UZ; Tue, 12 Jul 2022 17:54:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpm-0007sQ-Dp; Tue, 12 Jul 2022 17:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X6sC1OZTXLEfI5S5DKqwWLHrN8liDQWvWG/qVo/EOvU=; b=WAoUnpRhlWIe/yYDi2oQ6Z4gws
 wHr2JqeuvINHn/Z0p2KWlAqHDGNERNEv1NdVhsEO31s6q2y4e+9T48Jz+5NML1Cq8pBOpzeDfALyT
 jLobucYnJlVSViEfn6iQxz1Yh5kUuj2AWgRbR+t4hIpf7r4LbdVUK25ynqiNlFD6Ge2qJu0u3orh6
 qIZwrWDY0ZzmZTi8ltBNxRIUIyJWQhaefLdaSdpJ0Z8ryYsiwVCzK9EFR35VG6sE1D1lWke1U+K5R
 sXxH3VMtapqguEKAj3aTAdwT41MgZgN7uGfH9N2O2r3Q/+JugnFnfG6HZcIKPVhNkIjTFFzFKXkvU
 VRBSIiRTKbHDdlW10RPWzzyggx8qK30pjWu/0gh00XzGN3XVFnrxYq/Q9jBAvNAZaGI6f73em7txR
 nSZmfe9YOizGPXRrgJZ2U/SYCbLuIQC13CpG48YVL+wal/fQwh9XbC0XfImQx+uLMKy6FT25HS3+/
 VvAnAnMBqZEhJrAUm2nMa+gIg7TCdozwPdFtL8f/HtiTfrZ/5xkuxDVhzWD+wQRJDAVnRmM4CkZKj
 FAIPjx2dZ/WaTcZhJgrvK4d1gi7U1kfN7v/Szx2+yXdCOHOEkeKjYW0Y1ABukIXGWsf/zwcF71KhX
 2tTL7LUYXm8OWDJksKBz4PDEEXXsJRQn9pXxV7Gno=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNo5-000Bqt-6E; Tue, 12 Jul 2022 22:52:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:28 +0100
Message-Id: <20220712215251.7944-18-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 17/40] lasips2: introduce new LASIPS2_KBD_PORT QOM type
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+mK45dMiqgY

This will be soon be used to hold the underlying PS2_KBD_DEVICE object.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         | 7 +++++++
 include/hw/input/lasips2.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 56bfd759af..b043f2e264 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -318,10 +318,17 @@ static const TypeInfo lasips2_port_info = {
     .abstract      = true,
 };
 
+static const TypeInfo lasips2_kbd_port_info = {
+    .name          = TYPE_LASIPS2_KBD_PORT,
+    .parent        = TYPE_LASIPS2_PORT,
+    .instance_size = sizeof(LASIPS2KbdPort),
+};
+
 static void lasips2_register_types(void)
 {
     type_register_static(&lasips2_info);
     type_register_static(&lasips2_port_info);
+    type_register_static(&lasips2_kbd_port_info);
 }
 
 type_init(lasips2_register_types)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index f4514081fe..504e2c06de 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -43,6 +43,13 @@ struct LASIPS2Port {
     bool irq;
 };
 
+#define TYPE_LASIPS2_KBD_PORT "lasips2-kbd-port"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2KbdPort, LASIPS2_KBD_PORT)
+
+struct LASIPS2KbdPort {
+    LASIPS2Port parent_obj;
+};
+
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-- 
2.30.2

