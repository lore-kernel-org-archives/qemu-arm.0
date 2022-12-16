Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1258170ejb;
        Fri, 16 Dec 2022 02:13:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtGRjFitTl9JTw34UmK9PfZs+9vwDQartTGZ7nvLjOmHVDGMO0NQMlsO2P+uAls6WKdbOXb
X-Received: by 2002:a05:622a:5c1b:b0:3a8:16dd:ed9e with SMTP id gd27-20020a05622a5c1b00b003a816dded9emr3642926qtb.1.1671185584434;
        Fri, 16 Dec 2022 02:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671185584; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtAWLUIBaqbV1nLfJtBikLuYw4bh58U5v3M6j3oB9BQ3HEySp4sBkgOSOSbrE0fcYX
         G+Jd3SpYEvBNZlX5XVYAFJw3E637hLkklQ+Ovnm67hUUgK9TxcCeUI+iyYTlScTX4J53
         3GIfgGdMxCheyuXRNmNMAb0k7zwTDikDVBGVjX50LgvnWam0YEf2zrb+9CwkxZskH/R9
         tu4mL4bt6rzFNdHLhxCzH/KcdGiRBCg8rNP8HvWfnDybvlEcpppPsN6Fa1HyvLCzxye5
         LZ+1NAnGgnIoaY85op3EQIAHsCgq5OdrSZfwxNAKpEJIS4y/G8h8bJfa+hZrW1qrHU+9
         SoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RYzvRBQIDUwvGBZspoha4+v2EeYD9wbj3dLE3c96Mf4=;
        b=hEQ/TiTTqFddra/FO5o74Y6LrhohYsjoYB5XmtpzAwC3SIlIoYA0yFUIBzZsIXCPlM
         j8qvDPzBxNEcUSz8PJ/Q/WclAeyEugtD33I1RClIR6KZcKu4EllitfIpZcgZZOEVDh6/
         YrjBnyBhiJNE828/dlZkX12wMp5w5+I+RcyzXQd4jzAAB+YSUYOkueG7GeUjbkkNsphM
         dacqR2TA6kihD6NbzSISZp2D0ivVJsm02dQUXUP2vVm7wryHaHk4tevPydLof0D8wS/1
         Ks+Z6VC7IKERcbdOnUv+8cEjvlJ1TBWogKJIqeMtTUlZfVccMpf4rUArxYPAVMaxJORg
         jqJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GfRyT2hS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca21-20020a05622a1f1500b003a68cfe337asi915709qtb.121.2022.12.16.02.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Dec 2022 02:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GfRyT2hS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p67hr-0006Pj-8C; Fri, 16 Dec 2022 05:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p67hp-0006P8-Ef
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 05:12:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p67ho-0003CY-4h
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 05:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671185558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RYzvRBQIDUwvGBZspoha4+v2EeYD9wbj3dLE3c96Mf4=;
 b=GfRyT2hS2FHqxEk5AgAUgk6/ZOW29sO9Hk+06FBnJba6C1Er6UwZiDGYjZDJxyA5IPhY7Z
 f0o4aiTPy/wMhtF4rCYUuCzvtn9Uizv9LW7xF7ac7yL97jB/r+6UWYVZsZx+Bmj4JnBcd/
 EtdXOx692uTb/Y805WUwukHky4GUtiU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-wZhXZw9GN0mjk_gFxqR-aA-1; Fri, 16 Dec 2022 05:12:36 -0500
X-MC-Unique: wZhXZw9GN0mjk_gFxqR-aA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F34C3C0CD39;
 Fri, 16 Dec 2022 10:12:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15FB7C15BA0;
 Fri, 16 Dec 2022 10:12:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CD5D31800084; Fri, 16 Dec 2022 11:12:34 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kashyap Chamarthy <kchamart@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 0/2] hw/arm: allow flash images being smaller than the
 available space
Date: Fri, 16 Dec 2022 11:12:32 +0100
Message-Id: <20221216101234.2202009-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: eVv+B9IAxpi5



Gerd Hoffmann (2):
  hw/arm: allow flash images being smaller than the available space
  docs: add no-padding firmware feature

 hw/arm/virt.c              | 16 ++++++++++++++++
 docs/interop/firmware.json |  5 ++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.38.1

