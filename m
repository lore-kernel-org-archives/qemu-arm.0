Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0668C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 11:32:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukLJz-0000V7-QR; Fri, 08 Aug 2025 07:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ukLJ2-0008Ms-7B
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 07:30:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ukLIx-0002yy-1y
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 07:30:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b78315ff04so1653800f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754652633; x=1755257433; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OKpOw6cmRXnrMPkbjs6BjMKU17cwpQUSXww1qIIx3gk=;
 b=GACmdvYBjCd8XYTMOk9Ywp/Hib1LqqHaoSmmC3dfnECTmu4HHkDx7shi39zxUUGtLg
 1IZINVyzY4d1u4A+Cx2Hxr4k96C9g4F1Z0VVvYoSDMZw5hi5dh15if5NsobTu/Xw74+a
 bEQvU7ITwuETzvWZi83cb7Irkh9VIwINA6Qkn0MYtwVxkw9W4hRY0jYuNs+wM/NGm36K
 1mKRez3eM2pARsoaVuQBpglOgyLkXTcKaotArxMgn1XlJ/obQHHjVB37Aqat0vFY2frb
 RyIlQov7jeuvojZ0QlMod02TtascJQwKpcxPBHbDy8uEQ21+t3Dut61GBEJkX2VYXbLy
 cv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754652633; x=1755257433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKpOw6cmRXnrMPkbjs6BjMKU17cwpQUSXww1qIIx3gk=;
 b=WyUsKvTE+rE4mSf1xO0jN58aAl8LxlC+yCBmdTh70APK2Cbom4/c7kxUUYT4L4/2eh
 LXR2TAw/IoVAybx73PMoQ3E0njXoPs2KY1+Wm+78iWep7c9cRYiv73T2kd7IyVAy4m1q
 SO4pMAHu51VE0W8rKra1rjOPHofOsGnm4+8rBHMS/8cmWqHKTkQ3HZxwe2SESF7fY9Oi
 YZWf6JwXKgiR/MKkxTodOvH1uU8i9hueUNvARSEjGPxTWozGLa/LV4KMZLKOYWS2tEjd
 bF0YZ9XictR64DhHQLLxSkwTFvZqopwoJoMha2+mFOekv0fU1q7Ufxn4ehQXBwIvSW0+
 IADA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcRJLzhpPKSFd/vEAUC4fT4uJJofLlnIDDyVsnr5wfVMXwM41//FFZOO9xwBQSzsrc9tWocCacHg==@nongnu.org
X-Gm-Message-State: AOJu0YwriWufbedTJVYj+lfcLJIs0AcxTHyJZuiZR6GMsRN5JQ3u0mSu
 Yz7xvoF9h0pz+nwI8x6Z4fNvrC9v2t3tHt1hj3ADT6Sv70jqTGbwKdfY0KuDTf23JXk=
X-Gm-Gg: ASbGncsEDrVGpf9sDflZ7yHfaEOf8SLSJLhCuTeNLdKf7XDG1iyPp9WhWpbs7jJ90AV
 YOw55KuGZS3x67OG2ouIwpLGw+AF8e2DvMkYEICpm62MTZHQsrmxU8jvrKfjCR+lwtRXd419ap5
 MiDQwWlv+9fwePuBS9wT4a5JX6+84/6BsYQLrxxc+Px4YgB1l4uUf38LGM5x1Dq9o1XRetqYGth
 MvZBWQd29j8nRlOebvxFDWu5TMmJ1/zjicm8g15w6T8Rl4rA3WbruINnaRQNT+V5IBPZlXUNISo
 ICiqJ8LCAPJUwsqUH1WFRO/767dqgN9rB9KMJ8HEzPMJ1aoUpmEDB56wFh40Ujv6TXPGnKaVmDx
 ilxzYzs6TWwf74YTEY4XrM7YdT9Vt2xhxkvJ3inP4U/0LJNveHPw+VJwtOhjqJtTvK08A+NR3yL
 V5Djg=
X-Google-Smtp-Source: AGHT+IGGD2uX+62nzHHyHbpapmomC79mZR5QsMYHjCPp0znhsngOdUkkjGERK4AVj3PIyh9Oi4Zv4A==
X-Received: by 2002:a05:6000:250a:b0:3b7:9dde:2a4 with SMTP id
 ffacd0b85a97d-3b900b80391mr2436894f8f.55.1754652633411; 
 Fri, 08 Aug 2025 04:30:33 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4440194.home.otenet.gr. [79.129.176.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9386sm30034248f8f.18.2025.08.08.04.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 04:30:32 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 08 Aug 2025 14:30:16 +0300
Subject: [PATCH 4/4] gdbstub/aarch64: add SPSel register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-gdbstub-aarch64-pstate-regs-v1-4-14ba70be1b3d@linaro.org>
References: <20250808-gdbstub-aarch64-pstate-regs-v1-0-14ba70be1b3d@linaro.org>
In-Reply-To: <20250808-gdbstub-aarch64-pstate-regs-v1-0-14ba70be1b3d@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=BVTDTUEh/mb8WZ71acn29Z8+dgaJ2Aq1gIdxHDatpbY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9sZC9TK0tZZlNlVTMrUVVHeTg0MU9laU1QUWM3CmhGZllsdGpieFdyWTJOcVd4
 ZXlKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpYZjBnQUt
 DUkIzS2Nkd2YzNEowSFVzRUFDWHZzZzFGSXNIcHJSRExHNDN3SDFLdG9TSXYwb0g0S2RiSTNteg
 pUYUN5WnNOU1Y2Yk1PZElsZmswNWFLMkZ3OEIxcEUzMFFZVGw1cTRSV2pMTjlLNDFheDQ0NGZic
 ENUZHE1YXQzCm5ENjJLM0ZKQXJXeXUxcWhGVUVJQnFJYTh1YzJsaWhxNWFDRGNjV2w4WjdNbFpk
 ZHhjUDlONkNFTjlkNlpIeTQKVG5iUHhXc3NGT3BnN1k2WjgrWGZ6aDdzbHZKQWEwbS9JRStCSXd
 Ia3ZhQldLNExQZnpZTEpTUHlQb0xEd09VQQpIWDh2MHBBR2NYYXQ2WGM0UjY1V0JFN1FwUjZBOC
 tPV0hDY2cxL1lMRk4wVVpFWmNMMG5kTTZZdUdwNnhac1FlCitnTjRLV2tiWHRncTZyYzZObFJNR
 XlWR1JpemNvODg2MXR3RW9LQytuQ3dhNVd5MDZNUnZybDJuZE1lN3U2bGQKNnhHNS9zSkxXOUFq
 ekdIYjgwUjA3bzVxY1drVVlwR2JHVzBxSTZuQ1lHbzVwNmJqb0NOT1lpY2VJQWdLYlRZMgpzTXh
 lN1ZGR01YaTZ5aHk1Sk04QUxWR1VnTTFBRFZzMG53UHlaQXVWeGh1aklwR2NFWmVhdUVDbGVtTV
 FBaU4zCjRJVzEwV0F6U01kUFpibUJDcUk0WlBKM3dpbm52MTgxZTZ4WWlGREM5TCtNQ3gvR3pNV
 S9JMVNPa3diZmdLZEIKdmVRb25NZ3R3a0hRQjBtOXJ4ZEVNVUpiU1Z4ditXWnhKdG40VGVLZWpp
 N3dGWnpPN0RNb0tMbnhXMmVYY3hLOApaRUlRaWVyOGFOK0Q0YUlpanFhR09BYTRSNEQ0dkg2b1F
 RVUc5cWRFTDBTNFdYdFpRZVk3MjdvOUNyamVvVmF6ClJxbDRIdz09Cj1NanA5Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42d.google.com
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

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 gdb-xml/aarch64-core.xml | 6 ++++++
 target/arm/gdbstub64.c   | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/gdb-xml/aarch64-core.xml b/gdb-xml/aarch64-core.xml
index dffc92303fc7b7e8221cf6afd6009101f34352ed..42793f063d9a9180d6233376a03835238c4a9c53 100644
--- a/gdb-xml/aarch64-core.xml
+++ b/gdb-xml/aarch64-core.xml
@@ -120,4 +120,10 @@
     <field name="D" start="9" end="9"/>
   </flags>
   <reg name="DAIF" bitsize="64" type="daif_flags"/>
+
+  <flags id="spsel_flags" size="8">
+    <!-- Stack Pointer.  -->
+    <field name="SP" start="0" end="0"/>
+  </flags>
+  <reg name="SPSel" bitsize="64" type="spsel_flags"/>
 </feature>
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 6c424ed361e32e12836c6ef00a06397bd684bac4..143e2b104f961da603404cdfb5247b044f0e84cd 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -57,6 +57,9 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     case 36:
         /* DAIF */
         return gdb_get_reg64(mem_buf, env->daif);
+    case 37:
+        /* SPSel */
+        return gdb_get_reg64(mem_buf, env->pstate & PSTATE_SP);
     }
     /* Unknown register.  */
     return 0;
@@ -98,6 +101,11 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         /* DAIF */
         env->daif = tmp & PSTATE_DAIF;
         return 8;
+    case 37:
+        /* SPSel */
+        tmp = (pstate_read(env) & ~PSTATE_SP) | (tmp & PSTATE_SP);
+        pstate_write(env, tmp);
+        return 8;
     }
     /* Unknown register.  */
     return 0;

-- 
2.47.2


