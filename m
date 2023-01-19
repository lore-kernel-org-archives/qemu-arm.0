Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp215171ejc;
        Thu, 19 Jan 2023 02:10:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuot+UrBziThkghsJw+ekrlvzLRctFIQqzekq/uwB4vwVZqVAVeL6fKZob5oy2jHOXrZwtj
X-Received: by 2002:a0c:f98f:0:b0:535:1fc2:e863 with SMTP id t15-20020a0cf98f000000b005351fc2e863mr13961740qvn.45.1674123027050;
        Thu, 19 Jan 2023 02:10:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674123027; cv=none;
        d=google.com; s=arc-20160816;
        b=DxP9iEHPt2+rU+8PCBfrSqnQAX+U6B+qnR3oHCpJYo5hRjQJeWiMz0Vkv8Ihh02itX
         hA+7MICicw2U9KbPvZlUprBboFjR4JiUHrniBmqVfVl6GK5PqHY4bsJdo78S2HTAxk/P
         Dy30Zj9XZ98UQV3qnNMGQgBbYf9rgH6byS97zKY+0aSOcYUjIGZoVQ/HDsIxY8FqaSky
         ZIPpoTmE3bAxqe/ltyW7oAmud0kHNXCBLyYqAscE8v13MfdDSuQNFe3ldnfeK8XqLFUc
         6lr8lKA1H0pcea2iw4QwVsk1lX/BSAnHqZsncG6jwBKrvfQD1V/VT5L3wHdGSWIeikaH
         HpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
        b=mqCHbnEbNa2TMl2RG+DIIzFaHI+eV2KJX6xG8xOQTmj8949t2k7ts78a5rh76aWnX+
         /8MyqpwWeuXBJTWLDGYpRdpOP9ruCqq2wXpAUVJgnnpzmaepDoLjdFb25EL7f+UVELDM
         AiQv8VGgMFqATRkDVeUycctut7qq1KLOJBp6PLKd6lAk7fF8iDiOUo/WAj08t5VGWUlY
         AAH+wOnCwCyuJB6agEJA1Y2E9EEMTCLPqkEUUosZMr8tSaRQw+Lq3VXy+hSF8G9FDewi
         Vgs6xOUNvNeHGfbKITP696AQ4q/uIJEkYyMSdKruc1hG3qKQjbWGdCb0D5elGOj6PfNx
         +63A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/gaUUR6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv8-20020a056214240800b005346e124cf3si14102291qvb.164.2023.01.19.02.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:10:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/gaUUR6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIRor-0004Li-GW; Thu, 19 Jan 2023 05:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnn-0003nr-UB
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:05:49 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnm-0005E9-Ab
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:05:47 -0500
Received: by mail-wr1-x429.google.com with SMTP id b7so1325747wrt.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 02:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
 b=Y/gaUUR62ZGPWWPVIABq5eI0Osm+q3hAlZtFCnyHqIr7C/MJAuGu3R7OSzNte0s3CP
 JHi0aDl74mzn16a3TXi0GTV5NRAaxIHfpfWzO3tuwURXeo2Zn6tlRAVXYYGScInF/pF/
 dJQAIpEfhMoDIX/qrrWTyf2IhUz4UU7Nb+0gmzaTyljUpwTnaUe9mqUwLxPFRYC77gwz
 mOD4KxUWa78gJhchPgCHQAi8IfqOxSQLPnDs24pSquW0afFrXcQoxRlP5iF1ohe2t693
 Tugb3bHFSMmxUq0NRt4zQCaPlTWyR7uCzQXD48sPZpS17GZYLv+sIPtbRJ0hYczmmSGt
 0d/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
 b=I4KKFnPtUYiA6R9JcmI/2swCk3IvseeBAXNxZzk12jTnsX6KHy2wpa5QubB+FTBLoc
 sLxT2h6p44Q6Wg3yNtmm6PNIlrXn5jySmtfR0rXUUkrNpBSCd9+3X4d3ve4rxQxroQJw
 dCCDUu9y5i33PD5sfiyqztkph47VE32d+ZhynVuz3+DILQAh/08EqIkdi3+YrumawIWu
 ftmB860CI64a/nEBJnBWhQNaXd5zbBjpwPzgbPA82yimnC0zPlCDAc5WXYuu+7OrO07/
 xnMx4rHblQvLhovV8vaU7/rH0lBRwwH2PA59tPs6PZdrez+/hUhkleIPPY3hUM1rWjGt
 Ffwg==
X-Gm-Message-State: AFqh2kqdKBPM+AxrzrZc0ZnVFdouJo1A/Hep8ls1msa+0945/0NRg6TG
 8KbCasIvoP++DKV06P2hoOTstQ==
X-Received: by 2002:adf:e841:0:b0:2bd:bf01:5c3 with SMTP id
 d1-20020adfe841000000b002bdbf0105c3mr8958364wrn.61.1674122744516; 
 Thu, 19 Jan 2023 02:05:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b002b8fe58d6desm33743435wrj.62.2023.01.19.02.05.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:05:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] tests/qtest/boot-serial-test: Constify tests[] array
Date: Thu, 19 Jan 2023 11:05:30 +0100
Message-Id: <20230119100537.5114-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: a8iTK6MkVpBj

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index b216519b62..3aef3a97a9 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -139,7 +139,7 @@ typedef struct testdef {
     const uint8_t *bios;    /* Set in case we use our own mini bios */
 } testdef_t;
 
-static testdef_t tests[] = {
+static const testdef_t tests[] = {
     { "alpha", "clipper", "", "PCI:" },
     { "avr", "arduino-duemilanove", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "avr", "arduino-mega-2560-v3", "", "T", sizeof(bios_avr), NULL, bios_avr},
-- 
2.38.1

