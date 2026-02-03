Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E003BE7C712
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 11:52:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnEwy-0007tH-RS; Tue, 03 Feb 2026 06:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEwx-0007s6-2D
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:07 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEwv-00057e-GK
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:06 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b884a84e655so808428166b.0
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 03:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770119524; x=1770724324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCrALKTLyk0E2VKZgTKk8x0b5abHTmgDgtK5TpMbn+A=;
 b=dgnXZb+DRHkH1ZMcFGTQefoN1EA5lXNKqDiJDVppalkylFRS5GdfZFP2vJbts/b/kr
 TA7uiJAI//WkPklCgHbWy2ijdQES9MQ2tfc40fPBvUe8H0vdasOb8LjBoCZOGojQ+dVh
 ZBGwbRNyIqF//+qcx2G9K95Xes5rxA+SRhLPigEIc7bK2Ub4vvGzd7QsRFxgQ7+Lfwoo
 t9+A1I9xoYLoGdkflApm6S5Xo9ZubGNYPsovs6q4uKWW+pE1CfdN5/PJ64C3TQvsWOaU
 DeG3V1tOkYaie1PxnNc42ybXCmDXkeS+7H0QmOuPATForPCOHZAsSjFla6zfMzr/eweD
 pxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770119524; x=1770724324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MCrALKTLyk0E2VKZgTKk8x0b5abHTmgDgtK5TpMbn+A=;
 b=heAAlb9lMWAyyW0pk24GywSFl8JXvzRdbuhxaU9btgdjdCB6OJIt5cKmPM6WTsR51X
 PjZnxDa7LWWybjAmwyRFgH5rBB/hIVgJEsmQsmrk4VouH4tM7PjUf02gw5k1Cuao94XZ
 Bu8tLO+nOuwm4q25+LNnYsaZm10B8DcJhcVKSVaxvWDbtoDD8KDmV6UpfmPltlFraNIg
 y31WMVzFKJMmG5yECetNp94qy+tJtHO2LT/TgrBRIYRop7tRqYWMp3MOYwpioKZznxAq
 7vOII+71KxkWUWdHK0xjUznno6chrrop4M7PSqSs3tniw0q4at1aq6roho41YaqtF6rc
 cZsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIPNrv+H+xcIcSrscXTxRYTXPdvnxwNNnn/RpBY+ElX4CZH0j3ZTUVHATQbpBQAjF5v2r2R5PEvA==@nongnu.org
X-Gm-Message-State: AOJu0YwH/5QiMT4wxywuXHdWEoStcIqY5YmvROW3sdQkQYJld+W6Bble
 wHEssasgzXpcvvJNweu0fc0HfBFC4sF/trxKMs/cbtmRee4Nv66QnykpeYAgKYeWBAk=
X-Gm-Gg: AZuq6aLSbikQFMwFwT3eBBPt3fpLSMe+CwTMS8dwQg+DTcxH5eSqnoiAegktE5dsolh
 BWmt624AxivwLGfx5vaj29hpVImyGNqnyllcZRCGjCkFs/gPPIoQtg2TyGu4CKnGXYFCWG/RBRq
 eT7BmS8lXJ/t1xxSyTAJEWOR/MM7oQCX001YziGY4Qq71CiFW4X4fgxifoFXvW9irkczn+4/pc5
 PlLKDoXe8qOKBawyIOayYKKMO/TLiwvvZrvHd6ZnMUb5aPyR5MNa4OQpGAZrbXRe+hqRzWEU0Bq
 LIBIBp7Zrbfuq42HNgh+rat73zAGrLI5DQzKRTwSI9sPQVBSyLPOeInlrM8YfrylDAMawU6kPYZ
 Gl/rCaGpbecPa0EuMhiVb+UUd1/ueOGiZul6X1ylg65EkkvHHhFioQ5R15wfPNb+h7H/dbZumFq
 RI6GiNNHm3zgY=
X-Received: by 2002:a17:906:c153:b0:b4f:e12e:aa24 with SMTP id
 a640c23a62f3a-b8dff5d95e5mr835340666b.22.1770119523543; 
 Tue, 03 Feb 2026 03:52:03 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8df8465cb5sm757815866b.40.2026.02.03.03.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 03:52:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3C4365F874;
 Tue, 03 Feb 2026 11:52:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 02/11] Makefile: add python script dependency for
 meson-buildoptions.sh
Date: Tue,  3 Feb 2026 11:51:52 +0000
Message-ID: <20260203115201.2387721-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260203115201.2387721-1-alex.bennee@linaro.org>
References: <20260203115201.2387721-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

If we update the script we should also make sure we regenerate the
help text.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9fb55dcf330..54547a37b1a 100644
--- a/Makefile
+++ b/Makefile
@@ -130,7 +130,7 @@ Makefile.mtest: build.ninja scripts/mtest2make.py
 
 .PHONY: update-buildoptions
 all update-buildoptions: $(SRC_PATH)/scripts/meson-buildoptions.sh
-$(SRC_PATH)/scripts/meson-buildoptions.sh: $(SRC_PATH)/meson_options.txt
+$(SRC_PATH)/scripts/meson-buildoptions.sh: $(SRC_PATH)/meson_options.txt $(SRC_PATH)/scripts/meson-buildoptions.py
 	$(MESON) introspect --buildoptions $(SRC_PATH)/meson.build | $(PYTHON) \
 	  scripts/meson-buildoptions.py > $@.tmp && mv $@.tmp $@
 endif
-- 
2.47.3


