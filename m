Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp536502ejm;
        Wed, 26 Apr 2023 09:21:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350b5pIi8ltGLoVoqe0GSklpGqXfc1zRu+mGdbCSIw8FCUabJ/Rs9io5TlKnkfVnI5p/MINeC
X-Received: by 2002:ac8:5bc6:0:b0:3ef:36d0:c077 with SMTP id b6-20020ac85bc6000000b003ef36d0c077mr31879857qtb.49.1682526099147;
        Wed, 26 Apr 2023 09:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682526099; cv=none;
        d=google.com; s=arc-20160816;
        b=oBJoZGUlcCdGGSgm+qQ9fejYD4ZDUNOU7Q8ov1URkipjysYX0PuBVieMeqSQCKv0RE
         Evus0tECiVA77ko0YA/tGPWXfc6Syofa8q6J0lSOTEzyu5DZztHZT+q8CWLNRU8owoGL
         97eNoS55OqaYbiuY/N2lHTRFCU5lO2raCdK9Oncr42LXcErKJJsZa6ETbLFTbEf8JbLw
         AaVb7uItqWGO5PPr4qgvt6QINUvBVK0OuOrNSqo+GNrZc7Y+nUanubVbqoP1IOfrvVts
         VWt8MaIa/I92G3nZQwaNH5OxVXU42+VgKDx7w8fI37lqo9Fv8egDn7jDaRPwOCiRjYAm
         oi0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:ironport-hdrordr:ironport-data;
        bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
        b=avu72+RHRlvycAJwX54Bfn3N1batuPLO2Kz4ULWhWXm4/PWyStcAWQ92D/5Vl2P4K7
         umTOMRIOhQpL9mupxFszueRgzm4FB4Fn9fhTLWcCZeoWYBD5LBQT0tf+VPi7LvZIe5md
         z0Ohtcl1VJXnWq6ZE/yzEr1q6sEcF7z9LeiLRtTCJdG7lXK8s+7GhMTOF3eZp1/Dx/ZG
         B4FD+XCNRDyMsGRXTwE4vofoq6Xx2v+MOCyg137IMSXc0j+2o/rO7wKVUQByMkqysCUH
         6yD05NhVJtJWthxZVdYCym8o5Km7E7eE04BncQKFS/mTsH4I3cfh5kYMPwN1id/gQN8N
         eUiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=fqYaVpI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t35-20020a05622a182300b003e3882d4b39si10802752qtc.398.2023.04.26.09.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Apr 2023 09:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=fqYaVpI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prht1-0000pv-5L; Wed, 26 Apr 2023 12:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhsy-0000p2-OH
 for qemu-arm@nongnu.org; Wed, 26 Apr 2023 12:20:53 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhsx-0005op-3N
 for qemu-arm@nongnu.org; Wed, 26 Apr 2023 12:20:52 -0400
X-IronPort-RemoteIP: 209.85.219.199
X-IronPort-MID: 276516179
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:g07BpKCvOsESwxVW/5bhw5YqxClBgxIJ4kV8jS/XYbTApD92gj1Wm
 mcYXjyGPK2Ma2Okc94iPI+yoU9X75KDydIxTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0ilaYDkpOs/jY8E814qyo0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPt2ex+F21mbLYR1c1ROHMVx
 9gUCC40O0Xra+KemNpXS8Fpj8UnadjhZcYR4yAxiz7eCvkiTNbIRKCiCd1whm9hwJATW6yHN
 oxAOGsHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBovTWKklUugdABNvLNQ+HJT4J6rHqdv
 zrkrzTIBjs+GuW2nG/tHnWEw7WncTnAcJsfEaD9/+RvqFuUwGMVFVsRT1TTnBWioku3WtYaO
 kZNvyR3/Pl0+0usQd3wGRa/pRZooyIhZjaZKMVigCnl90Yey1zJboTYZlatsOAbifI=
IronPort-HdrOrdr: A9a23:RQsEVazGc0V49trgwLRgKrPwHb1zdoMgy1knxilNoH1uA6qlfq
 WV954mPHDP+U4ssR0b9+xoEpPhfZqkz+8Q3WBJB8bEYOCEggqVxeNZnPLfKlTbckXDH4VmuZ
 uIHZISNDWaZmIK7/oTiGKDYrUdKaG8n5xAct2uqktQcQ==
X-Talos-CUID: 9a23:jfHiZGE6IgLksCuOqmJm7lcEAex1I0bU41z2Gl3jO0JlaKOsHAo=
X-Talos-MUID: 9a23:9LBn4QQzIirJq5a2RXT0vQwhPoBH0ZirERgvwcU3v+OgGxVZbmI=
Received: from mail-yb1-f199.google.com ([209.85.219.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:20:41 -0400
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-b999367041aso7786542276.3
 for <qemu-arm@nongnu.org>; Wed, 26 Apr 2023 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682526040; x=1685118040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
 b=fqYaVpI3mVVZXrXXNVlRMPdSc4nGj4DAsGDewE2NPkuCm7MeTHELE/dFZf6OEMhWg/
 5HI+k9NcKgyyHryxK/2WKddtdicHOUdNVONtNivPqHcaWKHc4lnWOM2NZU+SHBufIOBV
 TtP1UMrS6o302zpK5t3wpeE0pT6iNxyTIO2ZkZ4H1X9TjEqMLOzAVYDO9YPaYnPGFGP+
 0vzdQOpnOmcTtUgfE1cffzFlL1mwQqRV2XSLsO/IQg3fRng4S5+mlExOBj+61vXzng0q
 ofrNbGjR5W60Q5TBaYx23IRuyxqTCHh76i/drT/li2qTQ3GrMfha4rsdpygulBCMc5HC
 EpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526040; x=1685118040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
 b=IB1JUC3u5uMoK6S08imSwXC7uXR5VvluCKt5u8CYIzreXGth1Ei9WHR/71U5Gg7y6I
 BX6bt/M/uLEPZ4LUxDkcWWJ7uVjpymlb1Lm/Rf2hS+ym+yFMQ5HWkWbx8E+nydYl6Cif
 nKHcYLMSF9bo84MmmEJ7OyLM5U7h3BHlEIToqlAWbDadZO7t8sWb3cHRlfcluESLF/zW
 N+led2oP3fsa915J+Thm8dm00zXpqkSwhv0pocKih9Czu5niMwFLpQxgpCnuFdmKwN3w
 FnO3A/mJqBsEV6EYEGncEjbwZ1uCkFRZaeW4Iq1b7MoPM+aFds2ju/khclHwQgQaMVXs
 iSJQ==
X-Gm-Message-State: AAQBX9eVOJg8iGCqZgnPI8e2gVlk//ij0A6RBxZgUx13UF4VkkuAx/xY
 ismjk3+7surwhUw0PzZj7/HSXBS3dmYTXYi3wdujak5Pxk/wPJwEbH5X3XKVPNFopUWJXmCWdai
 h1B4qejkoZDtRkHg/BRTYErlQnS8=
X-Received: by 2002:a05:6214:1c4f:b0:5ef:5144:9d24 with SMTP id
 if15-20020a0562141c4f00b005ef51449d24mr38061698qvb.21.1682526019494; 
 Wed, 26 Apr 2023 09:20:19 -0700 (PDT)
X-Received: by 2002:a05:6214:1c4f:b0:5ef:5144:9d24 with SMTP id
 if15-20020a0562141c4f00b005ef51449d24mr38061600qvb.21.1682526018604; 
 Wed, 26 Apr 2023 09:20:18 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a0ccc08000000b005f160622f3esm4953167qvk.85.2023.04.26.09.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:20:18 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [PATCH v9 6/8] bcm2835_property: disable reentrancy detection for
 iomem
Date: Wed, 26 Apr 2023 12:19:49 -0400
Message-Id: <20230426161951.2948996-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230426161951.2948996-1-alxndr@bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 95e142ZeutKi

As the code is designed for re-entrant calls from bcm2835_property to
bcm2835_mbox and back into bcm2835_property, mark iomem as
reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/bcm2835_property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 890ae7bae5..de056ea2df 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -382,6 +382,13 @@ static void bcm2835_property_init(Object *obj)
 
     memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
                           TYPE_BCM2835_PROPERTY, 0x10);
+
+    /*
+     * bcm2835_property_ops call into bcm2835_mbox, which in-turn reads from
+     * iomem. As such, mark iomem as re-entracy safe.
+     */
+    s->iomem.disable_reentrancy_guard = true;
+
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
 }
-- 
2.39.0

