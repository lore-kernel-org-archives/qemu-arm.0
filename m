Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp657210lff;
        Fri, 6 Aug 2021 14:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8JQ7RD2gNhhAr5j/h+jFEVO3TXNc5RjzokyasHmGomlVsJMONebP0oTGKHyfspbvfKAJO
X-Received: by 2002:a5e:d508:: with SMTP id e8mr1202744iom.101.1628284638890;
        Fri, 06 Aug 2021 14:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628284638; cv=none;
        d=google.com; s=arc-20160816;
        b=HANbU2QGQb37QAM6tMw9WxhP6/A53oVO7bhs1yzEt58iRpP6g52U0z8HIqp3ZyFQ8P
         CipSHggVF1SpbtcLHAOeTi5OBBBGZa0EBLvTzHTzz4SrdColqLAhwzThC2Ac8kB0vITs
         cjsFZ2O75pSFIiV8bkisXMhnkf7CKe67FJqMawgeJI5dhw4hjJWZk9LqhEME8QG06wZn
         ypOFZ0imz3tsHculE7nTwCV+wdBy8tf6JVYGjaI9RWP34qdoTCG933fCE2+Zk5N7RJ/t
         IsKMArJToJCCLth6tuLuhw8pUtVHzu/5v76/etCflI6F5uo4+LtQEx+gqfb7fFVXZ5rV
         jf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6e3bCxX80xhER1z4RL3u0qqk2lfZ8RbsC+ozol/nQBU=;
        b=q4nnquAp8mAJQ/9HrC5pzXrYVxaqI2ejqeXNGwkKIWBS4uVPmGmCp5FjzjQshAoL9v
         eIYoSqN9g4Hpgnl1bcqe8ude7qKync++mn3Fp4xGEukPmTSVdmnqt2ypf2tlmkSG4g9O
         XuYpUgNKHA8O21UeIMKWyoLm9f0HKBC+xVKUtrba2t8AnqqqdWpflpxa8Ax3Uu8JQjBt
         pgZyhbXNT6L8pZV6xlis5cBD/CezlMT4tPx3zi0xtiBnouQPRP6H+2R5OZVUY6bzWD1L
         Gmap05XNN9pkuc4FD3USsbmH+1rRtkuzlWQoe4D2rmTAUYP5sGrOsw5yCJcPWPXLL5i0
         UHuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g6fwr60W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az3si10215530jab.111.2021.08.06.14.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 14:17:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g6fwr60W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mC7DR-0003j5-Uj
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 17:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79P-0002aS-OG
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 17:13:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79N-0004qN-7H
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 17:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6e3bCxX80xhER1z4RL3u0qqk2lfZ8RbsC+ozol/nQBU=;
 b=g6fwr60WFEv0p7ZP73Uc3nWR0Nxn+wraTPj3lVUpiye4usJo3zs78NEDQ/UJCZiCyF8/9H
 fM8wqZ+3IoW+43Czhmy5Xcuukne+aHSpoh/T0bB9hZ6FWdlgh21oFtpyZ+W8i74WU14Kf/
 9Gp035YXi2nJUSbkEXNkekyCJflpSkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-PiZpCBDZNpit99vp44GDXg-1; Fri, 06 Aug 2021 17:13:03 -0400
X-MC-Unique: PiZpCBDZNpit99vp44GDXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32F161008060;
 Fri,  6 Aug 2021 21:13:02 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 017CB10190AA;
 Fri,  6 Aug 2021 21:13:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 10/12] [automated] Use DECLARE_OBJ_CHECKERS when
 possible
Date: Fri,  6 Aug 2021 17:11:25 -0400
Message-Id: <20210806211127.646908-11-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DKzgAdfy0aT2

This automatically convert
DECLARE_INSTANCE_CHECKER/DECLARE_CLASS_CHECKER pairs to
DECLARE_OBJ_CHECKERS.

Generated using:

  $ ./scripts/codeconverter/converter.py -i \
    --pattern=AddDeclareObjCheckers $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/nvram/npcm7xx_otp.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/nvram/npcm7xx_otp.h b/include/hw/nvram/npcm7xx_otp.h
index 0a3ebb091d5..377cf462090 100644
--- a/include/hw/nvram/npcm7xx_otp.h
+++ b/include/hw/nvram/npcm7xx_otp.h
@@ -58,11 +58,9 @@ struct NPCM7xxOTPState {
 typedef struct NPCM7xxOTPState NPCM7xxOTPState;
 
 #define TYPE_NPCM7XX_OTP "npcm7xx-otp"
-DECLARE_INSTANCE_CHECKER(NPCM7xxOTPState, NPCM7XX_OTP,
-                         TYPE_NPCM7XX_OTP)
 typedef struct NPCM7xxOTPClass NPCM7xxOTPClass;
-DECLARE_CLASS_CHECKERS(NPCM7xxOTPClass, NPCM7XX_OTP,
-                       TYPE_NPCM7XX_OTP)
+DECLARE_OBJ_CHECKERS(NPCM7xxOTPState, NPCM7xxOTPClass,
+                     NPCM7XX_OTP, TYPE_NPCM7XX_OTP)
 
 #define TYPE_NPCM7XX_KEY_STORAGE "npcm7xx-key-storage"
 #define TYPE_NPCM7XX_FUSE_ARRAY "npcm7xx-fuse-array"
-- 
2.31.1

