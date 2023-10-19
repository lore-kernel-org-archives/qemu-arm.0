Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp800317ejb;
        Thu, 19 Oct 2023 14:19:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1BzJS1cHtTgnf+6pwRafJLwIXm0sxBzYUKN6Y9aFFxCT3pENB+so14bBeXW+k4hbo3g7X
X-Received: by 2002:a05:620a:2847:b0:76f:44c:5cd0 with SMTP id h7-20020a05620a284700b0076f044c5cd0mr3582415qkp.48.1697750398745;
        Thu, 19 Oct 2023 14:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750398; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAUbX1YovkPjBeRaXNcrhs8P/CylQAIeQs+N1G1Mkd4zQKko6MFOtCgQm2TbNQGpLI
         cPvC2x5jaApZemvjOIPtsX4A9yK/qthGsMUUerC3mA+pRYY6v+u4BdbT9pss+mbuRNR0
         WATb56Ps8F4TRXKPJRjEyOERVocI4XnAWGHkJxUP6a0FWi/rkZtk263+eqixbag3GfJ3
         ALk9VREjOByNIZei1RtuXI6LvAFBhSo6ZvwFET0myWNo+fQrzYdHeali/BT8mHq/DMp9
         ML+yxkcAYbiZ7qOR9kteaw39gyM7p5LfS0gTzO0vfzVaIRpmxsCUlUhLTE9+Md4B6VAY
         huTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CDOh9aTp1V6NdKCqXsAlRdEiv+EPu9d2PQpbnuZZmkw=;
        fh=ulNUqG6n2HecJzpsniCvENKN89PnjK3EayQSiKZY0zw=;
        b=M4Ver/as1pTw1JMnlS3Bn//WkOO9UPFf18SmscZaD1Chp8pBy3TQ3vHmSgMeT2GLr6
         XdLig6KlJhpDi3Vlcn1uaLUqtPmaXqBf8UYeufVzOEyl4Ljuubn+AhthSrUlwh8wrzgG
         O3j/NvY4YRCcAih17VeBpUHJFKxLEcrbEYC0LvdY9ZEsdIbtoOwobWIk09M1DXuDknQ/
         n6qpFTAAWlIpqRFOaJXc3pHY9MH70KaqkTqkUiJWx+D2nssRUjOopzmRGO8wkKjnnJmR
         KxY6bSwZoX6FryZ6RFK2Furbvct06sGBkJKs+NGdwfoy1cyKU9pWgzkBK0u5UFgFEdHh
         JzGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijlTvkQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020a05620a0a0c00b00768046bd0f6si234782qka.381.2023.10.19.14.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijlTvkQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaQ9-0005Fl-8V; Thu, 19 Oct 2023 17:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQ7-0005BQ-OR
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:19:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQ5-0004wo-CR
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:19:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so105220f8f.3
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750343; x=1698355143; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDOh9aTp1V6NdKCqXsAlRdEiv+EPu9d2PQpbnuZZmkw=;
 b=ijlTvkQhrA3R7DrCIJnjQNsHxaS17/o7LvU/mECsrx3oBkl3Ep/PbuEaUfNcjOgYLl
 9MVo7MlAIVHmhSC3tlKcWB4WEPfzPNV0ptPV8ZUXeJ4+CRQy3mKUhxbvSWW2a+IIImbE
 6xf4C04VFGe13A5CPWMbkplORssUc4+5TMzH+qXqCEIy8V2Ly/mDD/U8NKZu6P//0hAj
 qQF26hcN/3VQcDHQfG5fj0MlHapuRD00ykRupgigccoeAx5PCynLrj8p7WDufnHAg5CD
 7aChIhWOhdtzqfrqZOK7jiZJ2YSHZ0nrXRfpya38F7KCSfS7Y330GTfRM3RUziZDrGNo
 in8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750343; x=1698355143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDOh9aTp1V6NdKCqXsAlRdEiv+EPu9d2PQpbnuZZmkw=;
 b=tHlQSGKRMSHKQZnrZAqFfAwGvpVcxR9WAlNnHTPTlOJuBRnk4C3o4DlSK7Up8JlC35
 Y0G3nR+QHCvOTvC0X/FprVZwkRhiADlgS/XcZ9PQWPRUMk1EzHqQAAgqUOM79fkZcTw7
 J+pAzkpwDBWaefCRid7jhFd/U1vJHp6R7NuA//7RJrZ1TnYZyJ/aECaV667btboC4mAT
 eH9AH9olJswt2yccLs/QWaxRAdZAQ901TNfGbu3InwzsSusQYYzTp9xbb2eZsBtuXqMN
 wV658arlCVumkIe/22bt5UBkZRnm1oI/dKOyY0mwwUCeR3LB5QFhgsl3yhUKcSdkRCEt
 Gisg==
X-Gm-Message-State: AOJu0YwNTETfb3fqCXjjlJ306ABjtMP7K2QXDFseAc9Nk9y8/nSq0XCY
 OXAghtfssyiDJFgUBpHKSBVgz4TSXEMuMX+U73oDGw==
X-Received: by 2002:a5d:6189:0:b0:327:e073:d604 with SMTP id
 j9-20020a5d6189000000b00327e073d604mr2005103wru.45.1697750343472; 
 Thu, 19 Oct 2023 14:19:03 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d470a000000b0032d9efeccd8sm220126wrq.51.2023.10.19.14.19.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:19:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 07/46] buildsys: Only display Objective-C information when
 Objective-C is used
Date: Thu, 19 Oct 2023 23:17:32 +0200
Message-ID: <20231019211814.30576-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +CVzbapRpY2x

When configuring with '--disable-cocoa --disable-coreaudio'
on Darwin, we get:

 meson.build:4081:58: ERROR: Tried to access compiler for language "objc", not specified for host machine.
 meson.build:4097:47: ERROR: Tried to access unknown option 'objc_args'.

Instead of unconditionally display Objective-C informations
on Darwin, display them when Objective-C is discovered.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20231009093812.52915-1-philmd@linaro.org>
---
 meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 259dc5f308..4961c82a6b 100644
--- a/meson.build
+++ b/meson.build
@@ -4087,8 +4087,10 @@ if 'cpp' in all_languages
 else
   summary_info += {'C++ compiler':      false}
 endif
-if targetos == 'darwin'
+if 'objc' in all_languages
   summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
+else
+  summary_info += {'Objective-C compiler': false}
 endif
 option_cflags = (get_option('debug') ? ['-g'] : [])
 if get_option('optimization') != 'plain'
@@ -4098,7 +4100,7 @@ summary_info += {'CFLAGS':            ' '.join(get_option('c_args') + option_cfl
 if 'cpp' in all_languages
   summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args') + option_cflags)}
 endif
-if targetos == 'darwin'
+if 'objc' in all_languages
   summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args') + option_cflags)}
 endif
 link_args = get_option('c_link_args')
-- 
2.41.0

