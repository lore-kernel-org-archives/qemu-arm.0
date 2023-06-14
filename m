Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp358665ejt;
        Wed, 14 Jun 2023 15:42:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Hrv0QwwZatxYR8RETz+99LMfh9c4CrBGOT+ySQi7wy5Lwd9l3mJH7qRTGj4F656mYe3Tw
X-Received: by 2002:a05:620a:f10:b0:75e:d64d:7011 with SMTP id v16-20020a05620a0f1000b0075ed64d7011mr20949601qkl.66.1686782540904;
        Wed, 14 Jun 2023 15:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686782540; cv=none;
        d=google.com; s=arc-20160816;
        b=cue428YnIoISmEJll9mMkc4eezlbLvWDmBSSZB8ZK7iB7enPV/E3aaf9Jr8DwAij7B
         SAq8rWw/OVs9Ex22VmZMTRyr9NFw47K73K85nriIjp55BtLlXthwXXC3SvH2wJqotPXV
         pfXd0cmz/yt5kJlQbhHhrtlR0qGscLRo2ZRNPrCvkRaX9t489MJGHNEE4grOlwSranRP
         p3iQMCif8hqmqMfV1RGGR7ZzRs57ILNLAVb53u5JTWZHR9rHAUe5Xb4ivq4sC1pEoQOV
         caGbCubknRgEPRocfmDV/UPBzowrjN9AUCS/rGL+WYJDLMSeFStUGEVCmEMXE0RRC1bj
         A80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2fctppHD3w/Jcf/bfpN1CRxKNa2uQAnxsxTpak9z+g0=;
        b=KAIxxOZNdN7GPBhnuD1gf+UuUpHQ4e018TplN6tMQvXPshi6Uvdm6Z3Y/6itcLfMv6
         0hhJURF78aRLgLJ7ND/htHjpO3289FRA6d8p3ceGaRIdNnFKhkjC1lCmk5uPEVeNyxZJ
         CbRxMC1VAl3zUkpGJH9nNtg3d/jax4ePieUVOKOlNNQuHl/T+4117bzTS/wpmhYtC9EL
         FFkII/0PAJ4ZY+2zyLxCfAzIZw3m/09M4oSXzRd2lfJC7B8RG/bTxeY9U1GHrxI89RIf
         hzSTNiY55tiPVqfDzjsUGRkFGlTxaJ3+msatSn5jKbHi2wvKZYzTkmU7b7VZSDFqWNNW
         Pyug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=FgWFoSJK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3-20020a05620a126300b0075781ba66d2si8847192qkl.389.2023.06.14.15.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 15:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=FgWFoSJK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ZAt-0001Hd-Pj; Wed, 14 Jun 2023 18:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZAr-0001Ev-Li; Wed, 14 Jun 2023 18:41:09 -0400
Received: from smtp-fw-9105.amazon.com ([207.171.188.204])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZAp-000584-4u; Wed, 14 Jun 2023 18:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1686782467; x=1718318467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2fctppHD3w/Jcf/bfpN1CRxKNa2uQAnxsxTpak9z+g0=;
 b=FgWFoSJKwI/HkSnbMI31HDJe9vtkrh8AvXxVNNmePoSzE9UYH1oNM+7U
 GWskK3vVxbD0Kdn5EIspEjogG/3v7aNkN+eFEkats3USt1ttwVgKbPTGy
 BzI1iG5E8+rZnsApU8aAUv109SDkFXbeu020dGO0VpHtxvHL+Q2jJ0/kt Q=;
X-IronPort-AV: E=Sophos;i="6.00,243,1681171200"; d="scan'208";a="654948828"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-245b69b1.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9105.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 22:40:59 +0000
Received: from EX19MTAUWB002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-m6i4x-245b69b1.us-east-1.amazon.com (Postfix)
 with ESMTPS id AF7233401B4; Wed, 14 Jun 2023 22:40:54 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:40:43 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:40:41 +0000
From: Alexander Graf <graf@amazon.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>, Cameron Esfahani
 <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>
Subject: [PATCH 01/12] build: Only define OS_OBJECT_USE_OBJC with gcc
Date: Wed, 14 Jun 2023 22:40:27 +0000
Message-ID: <20230614224038.86148-2-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614224038.86148-1-graf@amazon.com>
References: <20230614224038.86148-1-graf@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.171.188.204;
 envelope-from=prvs=52269c73c=graf@amazon.de; helo=smtp-fw-9105.amazon.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: 2nJ5/3iVTRtU

Recent versions of macOS use clang instead of gcc. The OS_OBJECT_USE_OBJC
define is only necessary when building with gcc. Let's not define it when
building with clang.

With this patch, I can successfully include GCD headers in QEMU when
building with clang.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 34306a6205..0bb5ea9d10 100644
--- a/meson.build
+++ b/meson.build
@@ -225,7 +225,9 @@ qemu_ldflags = []
 if targetos == 'darwin'
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
-  qemu_common_flags += '-DOS_OBJECT_USE_OBJC=0'
+  if compiler.get_id() == 'gcc'
+    qemu_common_flags += '-DOS_OBJECT_USE_OBJC=0'
+  endif
 elif targetos == 'solaris'
   # needed for CMSG_ macros in sys/socket.h
   qemu_common_flags += '-D_XOPEN_SOURCE=600'
-- 
2.39.2 (Apple Git-143)




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



