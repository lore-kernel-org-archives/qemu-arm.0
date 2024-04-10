Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp414081ejc;
        Wed, 10 Apr 2024 09:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW018Fp4I1nEJcVxwuyWMkoKO1bFlfZqiBPz+03FswtrRifen4Jh1rQ4lUQ9vDKr23+EewxQAzIT5vbe4bQyzT4HkH9DukE
X-Google-Smtp-Source: AGHT+IHfh7GXNvkqjSCgkoEV4ovrn7SQUskj0HW+uCSLrjKfDdtl1MMCiILPUfLojMuh2+SnokXZ
X-Received: by 2002:a05:6214:76d:b0:69b:1540:50c3 with SMTP id f13-20020a056214076d00b0069b154050c3mr3425375qvz.52.1712765292930;
        Wed, 10 Apr 2024 09:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712765292; cv=none;
        d=google.com; s=arc-20160816;
        b=g9HBqqJmyUg/knLRCFIrAvbj+QbncZ0f7CHRQBxlUlXK2vv9zcFX1ZkxQPTU9XbbbC
         Q5tGfMP752ZXBkdJcluF8QjwPdl7Fhj8rgdQMn13rzlMsvD05lqSbHq337+MyFFMr2vZ
         vgS2n6+HZxKhECgk2/+gn+TlRmnSAs7JulE8pfnxXjASm32qGOz+EtXaO1p0/VrCgFpq
         5XecbHKtMUh3HHnYRJe7s3Y8RQ5LlRMeejgjGJDIyIIfFgKV5M3dGxCmdHT1qZfpw5xx
         oGJrfUklJkBOSTm4QqrFR9pxSqkjWQ/A6F2TafG2Ugq+5AS336BNsrtzFCFkAp3YYy57
         FCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i/lq6iuLQ5c9JQCAm384BpFlIIX3V3zTqW1RLNIFCYE=;
        fh=4EEpT38Gxapud64ap2SuXE59J/e7CHOmreWM7wR9OBw=;
        b=jUFL2DxZRsUMD65lSvLziPD4hcInwYLj47DekwhQz5pZkSa4nUOKZDKszKr4QQ9V0n
         O8OcbIYrSugOP+rxIv33aMKzqC6u9viLoGGrp8iI1Cg+cGwLaJ2DPjiB3AyLjf1dYm/c
         jCXxawLDh+Ctewd2Y1YxGkwfkKA+LnLGuAdWnRB0GEuVwWqiE2F5S9q6isnUpDgjARtT
         aekYZsYTiQHCG044Zrc/gWw+WpU5IE0ph/154w+ok59mTlaVBjw6Sft0K8+O9PF0gAhU
         s+9NrGSO6WY/AIeVxtxJcuE5Sn7xD+qBCF+P6TkgItvN0SM+wVfiphuKsvXpNCw9RdjF
         V/oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRw3OsPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk3-20020ad45d43000000b006990ec28721si5690228qvb.424.2024.04.10.09.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 09:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRw3OsPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruaTM-0000KM-JJ; Wed, 10 Apr 2024 12:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaT7-0000BA-7b
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 12:06:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaSv-0002Z6-GT
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 12:06:31 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso6967499a12.3
 for <qemu-arm@nongnu.org>; Wed, 10 Apr 2024 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712765183; x=1713369983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/lq6iuLQ5c9JQCAm384BpFlIIX3V3zTqW1RLNIFCYE=;
 b=nRw3OsPAUNL+/YJc7hP6f+fuumc/B/CWcjQDX7kioAS1m09OS1nXXoIcRsWuN0qBP3
 or+5OypbJuLERnN39H4AQTxdpEfve42Fho4T0/4f0QqHo67Gr0aswbK9N3zt+Ho4RA1i
 QVdKLqnznMLb+hI3Z+5xf5M3gxpm0HwNKl/PrUGC0s8rcMrkfoMz3qy3utUWHY5JuJaZ
 NR+b9/6/Lk010HUalMK0UXRMjJMRqclW6Zi6O26TSNkp8A1Ar/dwh60YUbcMEba/uHFY
 C1EWa74WTmCQAFuVs6y/CG8J0SEbzo28fKRrXFcSlrYzDVZVFMtlbxVW+ACe5hiXNG1o
 9OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712765183; x=1713369983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/lq6iuLQ5c9JQCAm384BpFlIIX3V3zTqW1RLNIFCYE=;
 b=q4E3UuSGDJY8KVPzhWP5Caf12R1P2UWqfQa/tIrf3dZBW69j0PLSignGJYzAEe09ib
 N0ySp4QFIj0QDIrYQzKPqAnVQpmHd0oIhEPTeFMy7T4d//h3kJtS941GfooO2Xgl0sAK
 6A8BR5d2fSK7qLhkQspmXH6KAqBBS+vKJw/D37jlRmW8+KgkxGZP7F2OKKMEQ6WndkoD
 fhOTk7fhdflsBKovxZxD7PpVquh0Gg911pVnVAh3bVQ2C8pd1Xy771SpJyGSdsB8Ghay
 in+Ck/wKPy/b46B80a+usCwBqT0HXtSsNrIjhlaUNrQHf84n0+x830A3p9wsTVFU9EsW
 v3VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgdrSLHCnYdMWT2V/kxiNHOUSkR1E8Yg4X3vVokfss0z6iQyCFZ20hpQ+HZZLEklUsfG9veMCb4ToYSi84msPAoYTE
X-Gm-Message-State: AOJu0YyiEzbLRd8yprpr8w7+2g3fqV6ok+e9JT8Fd5NmIJYqZnm4G2Ad
 SijsQgiD+y5Y99P5ljJ8cz4sRLDkRz9pN6a/cfUHgjw8ZHGdQ0yA10frUYzqskc=
X-Received: by 2002:a17:906:45a:b0:a47:34b2:ca4b with SMTP id
 e26-20020a170906045a00b00a4734b2ca4bmr2296275eja.50.1712765182972; 
 Wed, 10 Apr 2024 09:06:22 -0700 (PDT)
Received: from m1x-phil.lan (arl95-h02-176-184-34-173.dsl.sta.abo.bbox.fr.
 [176.184.34.173]) by smtp.gmail.com with ESMTPSA id
 c27-20020a170906d19b00b00a51a00142bdsm7106150ejz.212.2024.04.10.09.06.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Apr 2024 09:06:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 01/12] ui/console-vc: Replace sprintf() by g_strdup_printf()
Date: Wed, 10 Apr 2024 18:06:02 +0200
Message-ID: <20240410160614.90627-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240410160614.90627-1-philmd@linaro.org>
References: <20240410160614.90627-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dbSVXeMotKm+

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Replace sprintf() by g_strdup_printf() in order to avoid:

  [702/1310] Compiling C object libcommon.fa.p/ui_console-vc.c.o
  ui/console-vc.c:824:21: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
                    sprintf(response, "\033[%d;%dR",
                    ^
  1 warning generated.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ui/console-vc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/console-vc.c b/ui/console-vc.c
index 899fa11c94..b455db436d 100644
--- a/ui/console-vc.c
+++ b/ui/console-vc.c
@@ -648,7 +648,7 @@ static void vc_putchar(VCChardev *vc, int ch)
     QemuTextConsole *s = vc->console;
     int i;
     int x, y;
-    char response[40];
+    g_autofree char *response = NULL;
 
     switch(vc->state) {
     case TTY_STATE_NORM:
@@ -821,7 +821,7 @@ static void vc_putchar(VCChardev *vc, int ch)
                     break;
                 case 6:
                     /* report cursor position */
-                    sprintf(response, "\033[%d;%dR",
+                    response = g_strdup_printf("\033[%d;%dR",
                            (s->y_base + s->y) % s->total_height + 1,
                             s->x + 1);
                     vc_respond_str(vc, response);
-- 
2.41.0

