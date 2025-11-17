Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CF1CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 20:39:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL60M-0005Mi-9T; Mon, 17 Nov 2025 15:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL60C-0005L1-Dv
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 15:39:10 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL605-0000dI-H5
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 15:39:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-429c4c65485so3999787f8f.0
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 12:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763411940; x=1764016740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fFyGRInXFBpZaeNlXle17cFajkY7UYBMTQRyOKOfKmE=;
 b=M/lm+vTui9Md5gLzuBt9S5BkvjAvtRpAYT9WArM6VrsrJJ5G7KMMTXLRyTluceECMa
 rPr9s2cjX5K41zJklBOA0KsSAHhXXi2wkG2xt0D6LbgtjrRB/HnKBLtD3ZteG4DWdttj
 9VKXP/csZtONS4GFRkMlFk0ZageOeIL7GT+Y06t2F6FtZWsj62BDBW4SRHlHrRn3PD5d
 xZOZUYvDqD7zKO50ZHZ3rhalNiJMr7r/t9VPeIo2iO21ZApiwGjlnrCpC6Ka6K1fNF3a
 p1q3TVscDpxTxgnlQnPJHF3rPIJgnIuJ5j9YBeoZNphcy7896u3Fbr9/aFLAQnzDqYbv
 InSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763411940; x=1764016740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fFyGRInXFBpZaeNlXle17cFajkY7UYBMTQRyOKOfKmE=;
 b=xTJ56waJb1qJ2UXMSrM7IrS+JaRn2bitdcbyVSUU3Ibvf8pHWYu6pwG2cRVop/HSCo
 cWgSxx05bHO/ZICgXgJdDV4fVEXPnh5ski5z0RC7t0qcWlsfoWg/otZJ7m4o7QMtzzx9
 pjT68BBdoSIP7h2Wsa40xSqtfOukZ8cWWfhk6syBe58RvCBq7z/7fY/9C+8i0DgDAQGQ
 wfsBtcI1YcL4qbmnXKgIYC/yZkennxDe2tNtid3WVcXdyuBrJC4pt/nfgrIv2diRH3hQ
 H4wiDbLBspscWsbS8pdVsPIhTPYXi9UFlQZ1coBvLFKWcidZuqeVJ7nU5vSoZNzz+6Kz
 ew2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWOhMxsTgsXTx4pkiIEmlvdMjqWcloZQsLNgQhNhIdT0ZPXF7dDU3w0r7QtI3anKg0GVrEXySZSQ==@nongnu.org
X-Gm-Message-State: AOJu0YwySfo+Ook8fCI1y8K1zvrhVM1D8a2k+zhX0ot4X+TN37sUXMjl
 SUUB3fhrvBCDy2cRq+vhvU9LIeglyzE+ZfAIExu0lKGjNTBKzG2kYDX5C2eQVkyG0B0=
X-Gm-Gg: ASbGncvvACm0mh/dHpGu+fBK3hOYr/6eDxah06/OR8HyXs/Tboh+N5dU4h0nzZA8LE6
 /UMRAHzrwVKiLjofdLoBj+bFnE+E2X3bxveq/GKLvSXAdRPejxoJIfi2/Ezy9QFaCQHojIMMaHL
 2AXYJMQtpg/56LRnUv1iJRbk53CGbdK9SpvTJChUWVw69Q5ofbIOcgTCp9HjfvkpnYrIqnTfIp6
 kZ2+AiaqG2RdWz8mqu/WczWf/olSbwvoPiVjNfbGsOr1txDT0F7i3AG6A0wd9DiirIHdsViAI8N
 dC5y9LSE/gg30N9BXl+tCcgS1aNXLodHh26beF2bpcM3KpypIk6zDcrcqZFhdmMEpPGqO5TXJZP
 H8S2NeRB7ocfG25VyHE1YTQHVMZQKZl/t76hcCYWumrsLuYgV3hgT4+hiDyTePB2XKcgqpKXeTl
 cJ/drnFgiQ3dg2ntSE7g4nqJMywYKQHSgYCBUnlyemXvlDS4LhcA==
X-Google-Smtp-Source: AGHT+IGasQkJTIBq9jHENy2gaGASJz+hCICNjeUX2rdp3uffCo4bb9CVdyOvFS1MDnPcfyT/7T1KGA==
X-Received: by 2002:a5d:584b:0:b0:405:3028:1be2 with SMTP id
 ffacd0b85a97d-42b59328ec3mr14512400f8f.11.1763411938834; 
 Mon, 17 Nov 2025 12:38:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7aea7sm27901909f8f.1.2025.11.17.12.38.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Nov 2025 12:38:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nick Briggs <nicholas.h.briggs@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH-for-10.2 3/3] target/arm/tcg: Undefine Solaris FSCALE
 definition as a kludge
Date: Mon, 17 Nov 2025 21:38:34 +0100
Message-ID: <20251117203834.83713-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117203834.83713-1-philmd@linaro.org>
References: <20251117203834.83713-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

 CONFIG_SOLARIS_FSCALE

Solaris defines FSCALE in <sys/param.h>:

  301 /*
  302  * Scale factor for scaled integers used to count
  303  * %cpu time and load averages.
  304  */
  305 #define FSHIFT  8               /* bits to right of fixed binary point */
  306 #define FSCALE  (1<<FSHIFT)

When emulating the SVE FSCALE instruction, we defines the same name
in decodetree format in target/arm/tcg/sve.decode:

  1129:FSCALE          01100101 .. 00 1001 100 ... ..... .....    @rdn_pg_rm

This leads to a definition clash:

  In file included from ../target/arm/tcg/translate-sve.c:21:
  ../target/arm/tcg/translate.h:875:17: error: pasting "trans_" and "(" does not give a valid preprocessing token
    875 |     static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
        |                 ^~~~~~
  ../target/arm/tcg/translate-sve.c:4205:5: note: in expansion of macro 'TRANS_FEAT'
   4205 |     TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz, name##_zpzz_fns[a->esz], a)
        |     ^~~~~~~~~~
  ../target/arm/tcg/translate-sve.c:4249:1: note: in expansion of macro 'DO_ZPZZ_FP'
   4249 | DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
        | ^~~~~~~~~~
  ../target/arm/tcg/translate-sve.c:4249:12: error: expected declaration specifiers or '...' before numeric constant
   4249 | DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
        |            ^~~~~~
  ../target/arm/tcg/translate.h:875:25: note: in definition of macro 'TRANS_FEAT'
    875 |     static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
        |                         ^~~~
  ../target/arm/tcg/translate-sve.c:4249:1: note: in expansion of macro 'DO_ZPZZ_FP'
   4249 | DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
        | ^~~~~~~~~~
  ../target/arm/tcg/translate.h:875:47: error: pasting "arg_" and "(" does not give a valid preprocessing token
    875 |     static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
        |                                               ^~~~
  ../target/arm/tcg/translate-sve.c:4205:5: note: in expansion of macro 'TRANS_FEAT'
   4205 |     TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz, name##_zpzz_fns[a->esz], a)
        |     ^~~~~~~~~~
  ../target/arm/tcg/translate-sve.c:4249:1: note: in expansion of macro 'DO_ZPZZ_FP'
   4249 | DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
        | ^~~~~~~~~~
  In file included from ../target/arm/tcg/translate-sve.c:100:
  libqemu-aarch64-softmmu.a.p/decode-sve.c.inc:1227:13: warning: 'trans_FSCALE' used but never defined
   1227 | static bool trans_FSCALE(DisasContext *ctx, arg_FSCALE *a);
        |             ^~~~~~~~~~~~
  ../target/arm/tcg/translate-sve.c:4249:30: warning: 'sve_fscalbn_zpzz_fns' defined but not used [-Wunused-const-variable=]
   4249 | DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
        |                              ^~~~~~~~~~~
  ../target/arm/tcg/translate-sve.c:4201:42: note: in definition of macro 'DO_ZPZZ_FP'
   4201 |     static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = { \
        |                                          ^~~~

As a kludge, check the definition existence with meson, then undefine
it locally in target/arm/tcg/translate-sve.c file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build                    | 3 +++
 target/arm/tcg/translate-sve.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index 72edd6097a4..65dd2bc6873 100644
--- a/meson.build
+++ b/meson.build
@@ -2779,6 +2779,9 @@ config_host_data.set('HAVE_TCP_KEEPINTVL',
                      #endif
                      int main(void) { return 0; }''',
                      name: 'Win32 TCP_KEEPINTVL'))
+if host_os == 'sunos'
+  config_host_data.set('CONFIG_SOLARIS_FSCALE', cc.has_header_symbol('sys/param.h', 'FSCALE'))
+endif
 
 # has_member
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 07b827fa8e8..b6fd069aa0c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4246,6 +4246,9 @@ DO_ZPZZ_AH_FP_B16(FMAX_zpzz, aa64_sve, sve_fmax, sve_ah_fmax)
 DO_ZPZZ_FP_B16(FMINNM_zpzz, aa64_sve, sve_fminnum)
 DO_ZPZZ_FP_B16(FMAXNM_zpzz, aa64_sve, sve_fmaxnum)
 DO_ZPZZ_AH_FP(FABD, aa64_sve, sve_fabd, sve_ah_fabd)
+#ifdef CONFIG_SOLARIS_FSCALE
+#undef FSCALE /* Kludge for Solaris which defines FSCALE in <sys/param.h> */
+#endif
 DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
 DO_ZPZZ_FP(FDIV, aa64_sve, sve_fdiv)
 DO_ZPZZ_FP(FMULX, aa64_sve, sve_fmulx)
-- 
2.51.0


