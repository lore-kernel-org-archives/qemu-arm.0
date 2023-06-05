Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2956356ejb;
        Mon, 5 Jun 2023 10:58:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74CC7Z5Njq7CNKBNSw05Pgr47T+dIpNcfRIq5rcjmsIbICa+9kiucHgjcrdFCsLWvD8XNv
X-Received: by 2002:a05:6214:c8c:b0:625:b72a:142c with SMTP id r12-20020a0562140c8c00b00625b72a142cmr7752690qvr.14.1685987900223;
        Mon, 05 Jun 2023 10:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685987900; cv=none;
        d=google.com; s=arc-20160816;
        b=ZO2aTxwKkjyuTwbITCcCCrgUIjMxknfKf+6LoclIbmo44jADb/ZzyvxoFFZJRBoYUA
         PihMBz9Ntk3AdTzrQOrVfoB7YDSwJcQCtfDgN1IjjcW96elYKf5aXYMnlw9bZ3xqEWmC
         Nzvaop6Gr7xVzMINqBCSoKOdIlaF54V6zLFNeGK9HBxRks2MiYo0vpsFHF0jmGFNPcKx
         +WzLGRRN7/8zzpgXJ/MjlB1a02XhtcyuvufeNh1rkMa0r0sE3ONQ3ZG2Kbe+1XHZ4WwT
         bXXiDwizFyAltL1VPGoMwci6U/w+w03mmoforVFz5ZoT8gQyQHcMtJQuajLXDfI8RgB7
         Dsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+uFa3AhXkk8vWcOVshy7TkiBL8878/+j67TcSdApmPA=;
        b=mrFE1q/IJSqhgo5fSeGSBFXoksCq+EvbLZBGO8uPbawkNGqHyxLOIExFUCaPGxNpf4
         hhCYpo9tFXN4MyF5s5Uxvn06XV5IQx46+YSOXhQueCktzg+Ck/InmBuLv1j8trbBT15l
         lfWDRTsCn1SQOXRbvWRHp8PVYC3rTRJ5cdXgjS9FhmjcB431PlAAxCvz/kY2nPwY8pJG
         OZ2H8CTevWiwlOfcVP9D0Br5wx/EE4aesvDuBEu1MA9y+QGvvJGGTFnveBFOO1b7DJIW
         lW6gaPvgQ/xiAom0LcV4A894NjWMy+7ACqIB/CvFd6L7zZ65f1LPQNE6X0FYneIFKxxb
         5ydw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G7YWQfY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a056214194700b0062613bf8357si5394985qvk.173.2023.06.05.10.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 10:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G7YWQfY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6ESJ-0006If-HX; Mon, 05 Jun 2023 13:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6ESH-0006GG-VF
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 13:57:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6ESG-0001ac-Eh
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 13:57:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6e68cc738so44827185e9.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685987839; x=1688579839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uFa3AhXkk8vWcOVshy7TkiBL8878/+j67TcSdApmPA=;
 b=G7YWQfY48+wYPu4fP4w5XSiJFFSJI3LyXRijb5EMpp0Wi4zIhP9nqCMyLgY9OpczDn
 5LyC4OLmgFhameqZ/mn6cht1bduJTRtAotHwWvXgcMRSeVaJXpYp0BUmPOZs/ZurajFI
 d6Nd2HSpqmRmqEtnJjVKNESLvoVhQrGDf340PJCfc/2HVceDPPY1dEgAD39okyWbmNlZ
 GPVTnb5tS299pZl+9LzfSA3/UnM/VS507ET3oD+ZUwkszVnO+iaGZ0GqnqEH/wgg0HAl
 G3ZTUvqgQm4sFP7gD5mP1DmM8EsWKi7YCnPpQXA0jZKGza/y+FLmNRJuxmWZh2Op2y0y
 3JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685987839; x=1688579839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uFa3AhXkk8vWcOVshy7TkiBL8878/+j67TcSdApmPA=;
 b=dtF3aE2ZCoQF2piUaV1zcmiYjJolAuwx2znq3pTzIIu5YSYa3hQPrwAzXxt89FnxRm
 tKnhJwvpMYHhw6IMEsDzPeS3yx2kYAhwZOiIuX2Qu3SdBex+Mymq0uarRMWw5nsWqWcI
 paTQgVyjWDNEh9FXdYCHZ74KkXH4tur7CxySrx9eWlf8WzttgN8Z1DG1z+G9hstX0iN1
 9fhfEmsR1s4mBzY1Pd9P1QEq/lNfsNYy+9+lBAcsut4/8xBpjOUJWiHaeWy/O9o0+peV
 qTzFF91D1dphZTTq6Tu8IJKckcCJmIWhMjM56urtcxHqK2EjRqTtYnoU9yPBEAP9N/GR
 NhiQ==
X-Gm-Message-State: AC+VfDym1jOdPwnw5Ctk0/NhV/A7JnX1xRnNlF739SDmn+N65yi13GZ+
 UDOQeR76lIwbN3/PwQ5JLiPIOQ==
X-Received: by 2002:a7b:c4d5:0:b0:3f5:1728:bde9 with SMTP id
 g21-20020a7bc4d5000000b003f51728bde9mr7960wmk.2.1685987838888; 
 Mon, 05 Jun 2023 10:57:18 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d4c52000000b0030ae901bc54sm10257905wrt.62.2023.06.05.10.57.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 10:57:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 5/5] bulk: Replace __attribute__((noreturn)) -> G_NORETURN
Date: Mon,  5 Jun 2023 19:56:47 +0200
Message-Id: <20230605175647.88395-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230605175647.88395-1-philmd@linaro.org>
References: <20230605175647.88395-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LCz4w33TqFSC

Under MSYS2, G_NORETURN is expanded to '[[noreturn]]'.
Simpler to use the same definition everywhere, unifying
the code style.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/sysemu/os-win32.h | 2 +-
 tests/migration/stress.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index f8e300d302..fb076a6eb9 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -67,7 +67,7 @@ extern "C" {
  * which gets linked automatically.
  */
 int __mingw_setjmp(jmp_buf);
-void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
+G_NORETURN void __mingw_longjmp(jmp_buf, int);
 #define setjmp(env) __mingw_setjmp(env)
 #define longjmp(env, val) __mingw_longjmp(env, val)
 #elif defined(_WIN64)
diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index 88acf8dc25..54a95c07f1 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -36,7 +36,7 @@ static int gettid(void)
 }
 #endif
 
-static __attribute__((noreturn)) void exit_failure(void)
+static G_NORETURN void exit_failure(void)
 {
     if (getpid() == 1) {
         sync();
-- 
2.38.1

