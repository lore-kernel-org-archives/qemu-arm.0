Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp735027lfp;
        Tue, 14 Sep 2021 07:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3ynktqWyYApkiaXxNrIB2BGAFpUpnj+oOgJqjykhvg2VjUdCj/Kjq85g/6vZOiHe2WBO+
X-Received: by 2002:a17:906:c0cd:: with SMTP id bn13mr19059752ejb.251.1631629545628;
        Tue, 14 Sep 2021 07:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631629545; cv=none;
        d=google.com; s=arc-20160816;
        b=DMUhOHQpph5S1LMT8vcdXvk3db8aUVGlwKU0F16CWQbywO/1xQ2btq4UReBnyy4sCb
         l0Mv7iye+szc+Xfv98O1NNHhtW0esikkVmI6EhdOo6xcAkZhvVGcF5cPl2Me8X1NWKi6
         KHjJ9D0TxbbrYotwZxwZvC5AJnLPoWjQTo7OhHq0hRs4Rv+MI+NDKFOjFKPTTTZ0xtCc
         aSViV8LXtMAwJOclwxBfL6PxmS/U8aOqZUNW8HPwKu0O/tLGmaqleGkfKpjPdxCLLn64
         jWGEYZHZIof7bOFSUlrpoyDg+dnqbaoxDIz75BMRcpqhxYDZ5EVOl2IS8Ov4Y3vEGJML
         1ZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S4mcFixgI8QWYygoX/mbTsK3lsPq8Q1IHo4rS1KMgFE=;
        b=Y6D3Xhjgi4Dycra92c/zb7grQHMJf3EaZmcY0SFrPd5g94vxrfE3extOLw9nWaQIw2
         sU5Orne1AQHhPAHe8bKKTyZvhw6c9zbl+RwehSplTkKWG5b/NQ0D4CW8H9+F9gFlLrCS
         XaV7ws5FfP+KosX/zkAvtHt96p7Unz/vyUvHBP1gYDAXg3FVAUZLnP/tf92595uTKQm9
         alZTFDY63/3gAS5x/bI5sBVUgJUElaG2I1Ar29wCcgx7KBxyv74DhHaPpzOO6JQGqAQI
         l4x1qD3p2dshTK3DryqGdQCpD/s2lr5nSQ6WvF8KYZaTt1qPHseAxMmmplT2il7XHjZ2
         bGOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WA8+DuDj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hy4si9828020ejc.105.2021.09.14.07.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WA8+DuDj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9NY-00077W-OX
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9KB-0000qm-8W
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:22:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9K9-0003qZ-K3
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4mcFixgI8QWYygoX/mbTsK3lsPq8Q1IHo4rS1KMgFE=;
 b=WA8+DuDjrl2WwplG/PLUF5oi3JDh9hxliYiGrf0KqWhB4c3CLcY8QnX6RgW8+1SFdqH95s
 ZKAE5KOxC3yuqeFmw1f8naHzCD4EXYYkfb4Fwtl6cGnhdt1jz5DMoQwDEwSTSVIJRcp3x8
 KsdTp3EWaktFeJP4UDg7i9XH/LKZI54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-NNEgaP0pPJWT2ZgG2q1f7A-1; Tue, 14 Sep 2021 10:22:11 -0400
X-MC-Unique: NNEgaP0pPJWT2ZgG2q1f7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19763180831A;
 Tue, 14 Sep 2021 14:22:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 728C65D9DC;
 Tue, 14 Sep 2021 14:21:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/53] docs/devel: tweak headings in monitor command docs
Date: Tue, 14 Sep 2021 15:19:51 +0100
Message-Id: <20210914142042.1655100-3-berrange@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: OCBCUiwWD8xi

The new headings reflect the intended structure of the document and will
better suit additions that follow.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index 497c9ce0d5..cddb36fb74 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -85,8 +85,8 @@ any data". Now you're ready to enter the QMP example commands as explained in
 the following sections.
 
 
-Writing a command that doesn't return data
-------------------------------------------
+Writing a simple command: hello-world
+-------------------------------------
 
 That's the most simple QMP command that can be written. Usually, this kind of
 command carries some meaningful action in QEMU but here it will just print
@@ -340,8 +340,8 @@ Please, check the "-monitor" command-line option to know how to open a user
 monitor.
 
 
-Writing a command that returns data
------------------------------------
+Writing more complex commands
+-----------------------------
 
 A QMP command is capable of returning any data the QAPI supports like integers,
 strings, booleans, enumerations and user defined types.
-- 
2.31.1

