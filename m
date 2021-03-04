Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6565530lfg;
        Thu, 4 Mar 2021 12:42:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZV02/ahPK2BpFbFUQmNfICDEDmy7IcxlRR6s298y3ve5pif1lX6W1s2Xahgu3z95c4HGp
X-Received: by 2002:a05:6e02:2199:: with SMTP id j25mr5599019ila.18.1614890534694;
        Thu, 04 Mar 2021 12:42:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614890534; cv=none;
        d=google.com; s=arc-20160816;
        b=mzEFlJiYobVEh9N6J64F7iZIdIRtHDLta3Ieiag7yQYQN1eSQ60Q1/PfifunsIDD/c
         gTs/EjSqdgpRB7qaql1XreykFOU4079E1VE8wFW+oroAQs6j5taJZpU1s2gDzTGnsdhI
         2VthuHUeYwuiP+H9q9YzegiAC6zCmhE6piRsQKxYY4cL2zfW8yOV/P8Ql2IHVJzl9b8m
         8mt40gesB/WgowRSnGu9x50TS15f5o6iiWuYCRK5XLx0/5EgurNOgeY3lM0HLB1Y/gEi
         JtpSOhR/e0gISgj3+asb/qfiOKM9SmCQgvtZiArmupR7A0y4CPZLrmHTd68rohCgW8Of
         1Qnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0Iw51pp9UDsbKR+bTJDoskOEwn0mQCRO4DvU3s7VEns=;
        b=0j8A+e4My2zT0agrTeCIN2TmPs/jxvpE6QjzNErioCyDhOKlCfjxl11ylek9/nLJAS
         ykcL/aPwhLzIsjHrm7wr2D4JgSDHuT6m8dmwGI8ITCcyfQ0ITwNwIDehHHvre1W3ZhSv
         LSAbUY6OuZmyWls6Ab6EGQZIKHM8Sfn6qhcIAxzt+bEPEhNjZ8mg2krVisK2UnXkkzHq
         zPo5R79PuA5hBQVmgjQyDsEnfNJyKrCyo5L3Lp0FBw3E0sRjUKmWP/MZEzX0JFbLtWf7
         mzw2U+Ed5IM6LcZaPcqtnvSuHOEFOPh6f++6uWE7UKxIQ7APU/PMQoiBg+FjfRdpB2uU
         vQLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pSmYC8NL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si169318ilu.87.2021.03.04.12.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pSmYC8NL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHunV-0007aB-TP
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhb-0001ix-AS; Thu, 04 Mar 2021 15:36:10 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhT-0005LG-QO; Thu, 04 Mar 2021 15:36:06 -0500
Received: by mail-ej1-x62d.google.com with SMTP id dx17so24443128ejb.2;
 Thu, 04 Mar 2021 12:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Iw51pp9UDsbKR+bTJDoskOEwn0mQCRO4DvU3s7VEns=;
 b=pSmYC8NLS28oZcZElhZk6QUmSAFWhlIIyRXVF8TunaVmz72LcSMXGi3S1lufWR29p9
 ohdvKX8HQwYgBnnSQvpICHOrF0t6kq5CkiFcVeKo6rUkpx97FPu+DQEbjnKkoedkRVzD
 09Xexcomp11EX+g5PQ35HG5SoSbn+/Oo3A77nmxGGy/eeemOCa5m0gktBCiDTbMVDAwZ
 Oi/pX4jDZPU6HyARJaTw1Q9Bri0XqCQU3ylZ70xhKmxpVUPFTB2DpR9vYLRIHamf2JLC
 hbpFEyBq6HtwWMGnB4hFemIdDCKG+C85deyFsvcYjqDG2w8CnbEzyYWZhuIdtnBZ/ncq
 YOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Iw51pp9UDsbKR+bTJDoskOEwn0mQCRO4DvU3s7VEns=;
 b=EirVtozCHNmpAO6BoPX+ivN0UAbyYwiCAUdNGr2cWQEPfHfmwWDwnoEJO5UkHZFtaq
 bbg3zDpxh7iNMP3LHNFyTtVzf0OPhyFBGmO1y9VHrWu/H9CsEJZYidzlaqcDKr5qW4nY
 sQ4wRyQvUlCtTfoxIGo8phCY5fTiV2ES9Uj5TtsUUwIJzwBJN8pS2v3OHXcaA311tDfY
 0uSowF4QHUR2I0hmiSK0nSa6/g2gvrKCPuTDYP4RizCLWeooErs6mNTmJXgV3y6p39Y4
 mMuI0xyUyI5rkxMvsg028w7UwpXmnjM5HWlVrMLgMOCOLZUcKZYCIyIE42YCd78WsLiq
 LmWg==
X-Gm-Message-State: AOAM530jETO2nz69U+6PUvnWZyC+amd6812rlvt6BJ1wiZUPRL4aTQXG
 sk/jWNInVPHj0qtcbC1qyAbE5oEsRyCEag==
X-Received: by 2002:a17:906:2404:: with SMTP id
 z4mr6221233eja.14.1614890156648; 
 Thu, 04 Mar 2021 12:35:56 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-ebf2-7b2-6f3d-5954.fixed6.kpn.net.
 [2a02:a456:6be8:1:ebf2:7b2:6f3d:5954])
 by smtp.gmail.com with ESMTPSA id t8sm289956edv.16.2021.03.04.12.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 12:35:56 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] tests/acceptance/boot_linux_console: change URL for
 test_arm_orangepi_bionic_20_08
Date: Thu,  4 Mar 2021 21:35:38 +0100
Message-Id: <20210304203540.41614-4-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304203540.41614-1-nieklinnenbank@gmail.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /T6BLibjTxig

Update the download URL of the Armbian 20.08 Bionic image for
test_arm_orangepi_bionic_20_08 of the orangepi-pc machine.

The archive.armbian.com URL contains more images and should keep stable
for a longer period of time than dl.armbian.com.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 9fadea9958..4a7a6830ca 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -816,7 +816,7 @@ def test_arm_orangepi_bionic_20_08(self):
         # to 1036 MiB, but the underlying filesystem is 1552 MiB...
         # As we expand it to 2 GiB we are safe.
 
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+        image_url = ('https://archive.armbian.com/orangepipc/archive/'
                      'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
         image_hash = ('b4d6775f5673486329e45a0586bf06b6'
                       'dbe792199fd182ac6b9c7bb6c7d3e6dd')
-- 
2.25.1

