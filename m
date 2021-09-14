Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp732504lfp;
        Tue, 14 Sep 2021 07:22:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4+eZftZ0f0BbzawRU7xHCViP2Fibo2yvWt7kYQ7OYAMMg7yYixK+r3ne/ouL6s1+0+iCO
X-Received: by 2002:adf:902b:: with SMTP id h40mr18734421wrh.342.1631629361291;
        Tue, 14 Sep 2021 07:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631629361; cv=none;
        d=google.com; s=arc-20160816;
        b=v7OvWL7ZB4MjhlSbkEcJWvl8KHBkBKC0lUnryf9exickXw/LNWqmoqfRmCTEzm3utV
         eDNGslNAYTzYvvfkxHKU7xE9HT4I5Z8iG8IhqzDK7pEs2I/njT7rEaYXSiBDYTG4kOEW
         jJgt+lwWIUqnzADAupdXKXGZnGBQT6P6unnhbPj7Na0QYmfcIIzVdtMgsW37OWriXSZ6
         uqvfRq9cPHNvgMgveZa+4iK8Mv190+cvRt7KrmStqVWpM8kIf83W3HFJbY5eIc5a3Ccv
         fbY2FjZVuVQgwC+hXHEjGvkbETNlQeCRyUsWyEX0+Q7UrjgvjF7kkcmTfA625PCs89pO
         /xxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jqg+KbdjEyUa8qwGSIprn8VTfs1RlVUX+DOblupWdX8=;
        b=oTZsuOzULC/hjJ5FttMK/lRIeQi248JNHpCClC2FftHl+hec21fTYxd5eY74I4So3r
         iwq3fglqvu5PZABYDe8DgkIt8shtPWnJiXDxQVWguBkzPCzrN84HJmrd4+3fjHntcs3b
         GJX0cg5CenNXI2BmkviCxHi7NhsrF+mlUnCmKzEARYDIHk3T5yRoxBIYln8KDprF+4EV
         VmwXJz4d3GziJvVNdytcIy6AAsatn8WXSSaFP+IRhEjNThTPXlrMLqS9Csxi6X00fMcz
         PwAbmw54CKIaH9iG1VIQV78t1hiK/srIajNvk88vZaB/Ki0JhIbSrI3MhABbS2IM+NcT
         dflA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="W8/6Fo1X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si10633736wru.246.2021.09.14.07.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="W8/6Fo1X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9Ka-0000uP-BG
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ju-0000fD-M5
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Js-0003eh-3B
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqg+KbdjEyUa8qwGSIprn8VTfs1RlVUX+DOblupWdX8=;
 b=W8/6Fo1XBSR9oEHYrGMIwhjnhcfyVtYx6yv4BZARIfodwkNmiPupOUkwSo8Tb4QJjvE8DE
 fwGlji4eXX6R0PbiH/3UtaE32YQlCu48UKdDaBI+7jJS2Vrw3Gd/gHGLcNBnw5Y1VkADZy
 3jDUM64mhMFt3SF48kzVfa6soM2djT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-0ANmDWgANhWaZU5mbBWQ9w-1; Tue, 14 Sep 2021 10:21:53 -0400
X-MC-Unique: 0ANmDWgANhWaZU5mbBWQ9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17498835DE0;
 Tue, 14 Sep 2021 14:21:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A48F35D9CA;
 Tue, 14 Sep 2021 14:21:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/53] docs/devel: rename file for writing monitor commands
Date: Tue, 14 Sep 2021 15:19:50 +0100
Message-Id: <20210914142042.1655100-2-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9mdCNzXgIKCE

The file already covers writing new style HMP commands, in addition to
the QMP commands, so it deserves a more general name.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/index.rst                                        | 2 +-
 ...riting-qmp-commands.rst => writing-monitor-commands.rst} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename docs/devel/{writing-qmp-commands.rst => writing-monitor-commands.rst} (99%)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f95df10b3e..7c25177c5d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -44,4 +44,4 @@ modifying QEMU's source code.
    ebpf_rss
    vfio-migration
    qapi-code-gen
-   writing-qmp-commands
+   writing-monitor-commands
diff --git a/docs/devel/writing-qmp-commands.rst b/docs/devel/writing-monitor-commands.rst
similarity index 99%
rename from docs/devel/writing-qmp-commands.rst
rename to docs/devel/writing-monitor-commands.rst
index 6a10a06c48..497c9ce0d5 100644
--- a/docs/devel/writing-qmp-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -1,8 +1,8 @@
-How to write QMP commands using the QAPI framework
-==================================================
+How to write monitor commands
+=============================
 
 This document is a step-by-step guide on how to write new QMP commands using
-the QAPI framework. It also shows how to implement new style HMP commands.
+the QAPI framework and new style HMP commands.
 
 This document doesn't discuss QMP protocol level details, nor does it dive
 into the QAPI framework implementation.
-- 
2.31.1

