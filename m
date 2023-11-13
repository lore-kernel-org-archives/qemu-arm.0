Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1339628ejc;
        Mon, 13 Nov 2023 05:44:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIke7NFhB8YGF9LEhf+CJAOuTa5uJRd/N1DNAdIuGhg3DK/z0snHS8XgplrUkCdeEOLvV4
X-Received: by 2002:a05:622a:1894:b0:403:eb5b:1f6 with SMTP id v20-20020a05622a189400b00403eb5b01f6mr8816559qtc.63.1699883095405;
        Mon, 13 Nov 2023 05:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699883095; cv=none;
        d=google.com; s=arc-20160816;
        b=rEQARoC0AhihEDsBny66G6tnfocR/IjTWoC1UAa1NDJELXW1+Gcm17omLgnRGUsMZ6
         xxlYS2W7pNR2OtvXj+ZEI7yYWDfmTUlp2+eK4vxINLbPvAE2wjptEH8HJzjsuFUeGFRl
         hpBMOhiKCyWbu5G+Kx6FifTYzjD6Nj1eM6b0mO70MfUYPJKflEo81Xd39wz0L6oO3+Rn
         u/JriFd9rvLam6G75elIvKmThekCtDD9K9kiIe1erHE8DGYzIFN3fB5bPFHU24VO6RZD
         pexaDX4Uy5MZFRE8bBqqXbL7ZYjJil7q41rHtmsLl/jEOD2WSH3TaQZSrKLsxeYuzYrP
         ZM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uv3oL7Y2G0XLMiOnzVJ7oNmg5jL57540u26sSWVlPC8=;
        fh=fyoUBle+Um4ADRf4VLLg4tenzAlmU+iCfEmj0Kb7yeY=;
        b=XkfPd8wKz1Y9OYyP1o+5t084xdlcliWgVZvx+jSPzSEEDRRzA0AmK8zZUQGf4tTmaZ
         tj8K8YSObBgJdvaZqK8S+Ze+aRjre40rUUl1Pund4jRNtomGBbwjJOLXiHIr2hC271RJ
         sDU0jdnUPylfnX2paaehL+/m89IpwnWE97y1x2om/wWw7bXI4w+gfZ5l8sohtzoVBKgO
         5hzGAaY0ioIQf2302q1fc4R2i7OpMHR3P2xSpf7sMTsPF4vAf0uaPl1YG7WoLCL71l6q
         pt/5nWBuyGH+XyGUB4U9TjD07vvUCq4rUvuttNKYKgS9bYRvbhKQgPOWhG2hmuJBZJA0
         kFxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EnT+NT0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020ac85885000000b00419864f8c0fsi4461567qta.561.2023.11.13.05.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 05:44:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EnT+NT0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2XEK-0005Nc-B0; Mon, 13 Nov 2023 08:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r2XEG-0005Kd-1N
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 08:43:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r2XED-0006eP-HZ
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 08:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699883028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uv3oL7Y2G0XLMiOnzVJ7oNmg5jL57540u26sSWVlPC8=;
 b=EnT+NT0dZYYBrkPaCZIRrLC5rerMnlQIWxMElGa/v8rHtQ42XV5D24J3+usB3PIsF54woc
 m+vugXIrehaukAibzckdBXb+UiZfe7XQ6yuxBe1zikbioJOBAqZnXZ3Lgu8ByOUvKGJcsH
 xPId7cvtR2nM5HbFoM1fg1ggQCdQ9yM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-mqVAkllUOfy7qB806qLh9w-1; Mon,
 13 Nov 2023 08:43:45 -0500
X-MC-Unique: mqVAkllUOfy7qB806qLh9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E19D3C14904;
 Mon, 13 Nov 2023 13:43:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28FE6C15983;
 Mon, 13 Nov 2023 13:43:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D05A21E6A1F; Mon, 13 Nov 2023 14:43:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, alistair@alistair23.me, edgar.iglesias@gmail.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com, qemu-arm@nongnu.org
Subject: [PATCH 0/2] Replace anti-social QOM type names (again)
Date: Mon, 13 Nov 2023 14:43:42 +0100
Message-ID: <20231113134344.1195478-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: PGXtWcZy3SpV

We got rid of QOM type names containing ',' in 6.0, but some have
crept back in.  Replace them just like we did in 6.0.

Cover letter of 6.0's replacement:
https://lore.kernel.org/qemu-devel/20210304140229.575481-1-armbru@redhat.com/

Markus Armbruster (2):
  docs/system/arm: Fix for rename of type "xlnx.bbram-ctrl"
  hw: Replace anti-social QOM type names (again)

 docs/system/arm/xlnx-versal-virt.rst     | 4 ++--
 include/hw/misc/xlnx-versal-cframe-reg.h | 2 +-
 include/hw/misc/xlnx-versal-cfu.h        | 6 +++---
 include/hw/misc/xlnx-versal-crl.h        | 2 +-
 include/hw/nvram/xlnx-efuse.h            | 2 +-
 include/hw/nvram/xlnx-versal-efuse.h     | 4 ++--
 include/hw/nvram/xlnx-zynqmp-efuse.h     | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.41.0

