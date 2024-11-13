Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp515293njc;
        Wed, 13 Nov 2024 09:02:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8uFCygH7Lb3jdGRlKAbXare0P3/0g1acX6a/pzb+rtsK/ksNd0PWhjsn/RsBL2leVHfmpjTMTT8aDHg==@linaro.org
X-Google-Smtp-Source: AGHT+IF5axmQRWu6aa54Flue+dnc79biHZFZ0+6zWGtD1o4ELfhpE+T7Eh+UjrpHOMT4N7T2NyCy
X-Received: by 2002:ac8:748c:0:b0:461:48f9:425b with SMTP id d75a77b69052e-46312180ccfmr232054571cf.10.1731517358562;
        Wed, 13 Nov 2024 09:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731517358; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDGkb/N6Tf4dVMTWmC61IVgJnrh/s72MkUWQG4xQkbAClHr8XdlbQV50eP2O8dKRlb
         wYWeOsWC4iKRtaHNKrPceSbCbxUwFSQsIhUaCeJ8S86nxCTW31ATPauI70CGB6tXwx02
         3Eunns2XUi+6pFFofzjCNqcoOOAndpA9RrfIZAjxZ5HXZ8PYgoqeVLxq0XZMKbQGQNQk
         aWvuHbYc/wDLZo+w2ldT8Z6qXQwUdn1d6SyeI8HMxmDbhlAyfWVrWevN4oZu0dTe11ZV
         NniwynxvwXL2oPZZHtpGoUgtg7cjQ3nIpiDnSRMiFPcraXSxptyoVt75qvTw9rCaUKQx
         XO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WSp7SVLPpgH6DgPCNIeqyEN0q4+H1pUqmrEd5VrzYU0=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=bQBbAG7Kahw2t7+jNNPvKiixv+7AHRqUHetre58kcGetREH7cG2dXWKFNml688oTGV
         F1pXM1V6zM8u0RDWJh1v22BMOssaU+WwvzsddEDAcIB8J/OanmKLrV4Ahnu4OnAvA7ck
         RR+xoFDW5c6gDgNEsze+E5vvW/tqBl1+LtGN8UVpWg2EcbKEhPXfZLFFOVDi4ahXoi6C
         FSf5MPmTcJC0hjkze/XN+51phef7+nrNYpyGwJLSRltuR6xPCyb4ecDk90yNEAbfppyn
         7LA05VlE1KKT4fxF1LbtNMhA3puTZTo+laZJW0JwAKWfxNlT/Ub2ZdPGUVxjZ1j7e1Yg
         acWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xXIWfRER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff680b82si163238491cf.586.2024.11.13.09.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 09:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xXIWfRER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBGkI-00030s-An; Wed, 13 Nov 2024 12:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBGkF-0002yB-6k
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 12:01:31 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBGkC-0001wF-O6
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 12:01:30 -0500
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7ee020ec76dso5335434a12.3
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 09:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731517286; x=1732122086; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WSp7SVLPpgH6DgPCNIeqyEN0q4+H1pUqmrEd5VrzYU0=;
 b=xXIWfRER7wKlciI1WoGKrR1kAbPVpbfDPNthqpzc417nfrCbmtmxy6lwXc6AsGtwzY
 Co2QrcCn58xWS0uBM6qIyOzix857TKpJFBbZarx2btjSqBjqvWkEOUCIopLA2/LJjEFz
 SLX4gt3Sru89m9XT/JDFlAao50t90HwYWWAXZkj+IG7vCzGPtdn04eoAJc5hf1sW2zy3
 qudyltJTOEL2x0Jt9G6QD3hGtPEcDwBrPPR6xjyjbBo8X3uR/D9TC5dOSNa7nlMQpUC0
 oFX/TnU7gE8HU7cw7sbvo+0z+Kz+6E7iBP/6JjLdY0kCkunWCJa6UL+k+G9LwYaUuNEp
 PSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731517286; x=1732122086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WSp7SVLPpgH6DgPCNIeqyEN0q4+H1pUqmrEd5VrzYU0=;
 b=H8H22sPoII3jBWUNsFmQuW2RmIl74R5NE5vGsuSQpDgzFQyUcnjt3Ny6HLSeu+unVv
 s6ajT/ZMGGuBO+3uokU+jWNn0f7A+Tl96Y5hF2GnBqU4AffdXJcn0PHD3SzZubXB6mkc
 KufhNAOibn8FhqElJOH1G5D86u4LbZfiTBffciSCEglCuj7l2LuPh9Slr0SSZ6BjT8MA
 aJcDjiLjJwBv6NGg4pV652ZN8XouQuniu1ekhZRwIPXN6MZmA/WHJhMxJ+UuPNqJmOtK
 b1k73uIqNTl9ucnOHp5+sh7McRon3anehHR+lWaAYk7lycrlRxxKY5OP1te/V+VFYjoZ
 HglQ==
X-Gm-Message-State: AOJu0YzB4JgRBPICDje+dnoV6mgG28Hd7rDBUbRjpGLQcqJHRB6CumDF
 WlcKtP8aE4vO1wXO46yBRBmZPcoTUma8DlZGdZVpGnmEV29b+8ha2/PRPGo5NvcUHHxyT3XBCb2
 o
X-Received: by 2002:a05:6a20:9150:b0:1db:eeb3:d06d with SMTP id
 adf61e73a8af0-1dc229b02e9mr27211065637.21.1731517286187; 
 Wed, 13 Nov 2024 09:01:26 -0800 (PST)
Received: from stoup.. (wsip-24-120-228-34.lv.lv.cox.net. [24.120.228.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f41f5df1cdsm12629166a12.39.2024.11.13.09.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 09:01:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-9.2] linux-user/arm: Select vdso for be8 and be32 modes
Date: Wed, 13 Nov 2024 09:01:24 -0800
Message-ID: <20241113170124.1944984-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: X1Kjs9x0Kga/

In be8 mode, instructions are little-endian.
In be32 mode, instructions are big-endian.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2333
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Based-on: 20241112203757.804320-1-richard.henderson@linaro.org
("linux-user: Fix elf load and vdso alignment")
---
 linux-user/elfload.c                       |  31 +++++++++++++++++----
 linux-user/arm/Makefile.vdso               |   9 ++++--
 linux-user/arm/meson.build                 |  13 +++++++--
 linux-user/arm/vdso-be32.so                | Bin 0 -> 2648 bytes
 linux-user/arm/{vdso-be.so => vdso-be8.so} | Bin 2648 -> 2648 bytes
 5 files changed, 41 insertions(+), 12 deletions(-)
 create mode 100755 linux-user/arm/vdso-be32.so
 rename linux-user/arm/{vdso-be.so => vdso-be8.so} (95%)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ef9cffbe4a..471a384b22 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -659,6 +659,23 @@ static const char *get_elf_platform(void)
 #undef END
 }
 
+#if TARGET_BIG_ENDIAN
+#include "elf.h"
+#include "vdso-be8.c.inc"
+#include "vdso-be32.c.inc"
+
+static const VdsoImageInfo *vdso_image_info(uint32_t elf_flags)
+{
+    return (EF_ARM_EABI_VERSION(elf_flags) >= EF_ARM_EABI_VER4
+            && (elf_flags & EF_ARM_BE8)
+            ? &vdso_be8_image_info
+            : &vdso_be32_image_info);
+}
+#define vdso_image_info vdso_image_info
+#else
+# define VDSO_HEADER  "vdso-le.c.inc"
+#endif
+
 #else
 /* 64 bit ARM definitions */
 
@@ -958,14 +975,14 @@ const char *elf_hwcap2_str(uint32_t bit)
 
 #undef GET_FEATURE_ID
 
-#endif /* not TARGET_AARCH64 */
-
 #if TARGET_BIG_ENDIAN
 # define VDSO_HEADER  "vdso-be.c.inc"
 #else
 # define VDSO_HEADER  "vdso-le.c.inc"
 #endif
 
+#endif /* not TARGET_AARCH64 */
+
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_SPARC
@@ -3524,12 +3541,14 @@ static void load_elf_interp(const char *filename, struct image_info *info,
     load_elf_image(filename, &src, info, &ehdr, NULL);
 }
 
+#ifndef vdso_image_info
 #ifdef VDSO_HEADER
 #include VDSO_HEADER
-#define  vdso_image_info()  &vdso_image_info
+#define  vdso_image_info(flags)  &vdso_image_info
 #else
-#define  vdso_image_info()  NULL
-#endif
+#define  vdso_image_info(flags)  NULL
+#endif /* VDSO_HEADER */
+#endif /* vdso_image_info */
 
 static void load_elf_vdso(struct image_info *info, const VdsoImageInfo *vdso)
 {
@@ -3860,7 +3879,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
      * Load a vdso if available, which will amongst other things contain the
      * signal trampolines.  Otherwise, allocate a separate page for them.
      */
-    const VdsoImageInfo *vdso = vdso_image_info();
+    const VdsoImageInfo *vdso = vdso_image_info(info->elf_flags);
     if (vdso) {
         load_elf_vdso(&vdso_info, vdso);
         info->vdso = vdso_info.load_bias;
diff --git a/linux-user/arm/Makefile.vdso b/linux-user/arm/Makefile.vdso
index 8a24b0e534..ede489e236 100644
--- a/linux-user/arm/Makefile.vdso
+++ b/linux-user/arm/Makefile.vdso
@@ -3,15 +3,18 @@ include $(BUILD_DIR)/tests/tcg/arm-linux-user/config-target.mak
 SUBDIR = $(SRC_PATH)/linux-user/arm
 VPATH += $(SUBDIR)
 
-all: $(SUBDIR)/vdso-be.so $(SUBDIR)/vdso-le.so
+all: $(SUBDIR)/vdso-be8.so $(SUBDIR)/vdso-be32.so $(SUBDIR)/vdso-le.so
 
 # Adding -use-blx disables unneeded interworking without actually using blx.
 LDFLAGS = -nostdlib -shared -Wl,-use-blx -Wl,-z,max-page-size=4096 \
 	  -Wl,-h,linux-vdso.so.1 -Wl,--build-id=sha1 \
 	  -Wl,--hash-style=both -Wl,-T,$(SUBDIR)/vdso.ld
 
-$(SUBDIR)/vdso-be.so: vdso.S vdso.ld vdso-asmoffset.h
-	$(CC) -o $@ $(LDFLAGS) -mbig-endian $<
+$(SUBDIR)/vdso-be8.so: vdso.S vdso.ld vdso-asmoffset.h
+	$(CC) -o $@ $(LDFLAGS) -mbig-endian -mbe8 $<
+
+$(SUBDIR)/vdso-be32.so: vdso.S vdso.ld vdso-asmoffset.h
+	$(CC) -o $@ $(LDFLAGS) -mbig-endian -mbe32 $<
 
 $(SUBDIR)/vdso-le.so: vdso.S vdso.ld vdso-asmoffset.h
 	$(CC) -o $@ $(LDFLAGS) -mlittle-endian $<
diff --git a/linux-user/arm/meson.build b/linux-user/arm/meson.build
index c4bb9af5b8..348ffb810d 100644
--- a/linux-user/arm/meson.build
+++ b/linux-user/arm/meson.build
@@ -10,10 +10,17 @@ syscall_nr_generators += {
 # is always true as far as source_set.apply() is concerned.  Always build
 # both header files and include the right one via #if.
 
-vdso_be_inc = gen_vdso.process('vdso-be.so',
-                               extra_args: ['-s', 'sigreturn_codes'])
+vdso_be8_inc = gen_vdso.process('vdso-be8.so',
+                               extra_args: ['-s', 'sigreturn_codes',
+                                            '-p', 'vdso_be8'])
+
+vdso_be32_inc = gen_vdso.process('vdso-be32.so',
+                               extra_args: ['-s', 'sigreturn_codes',
+                                            '-p', 'vdso_be32'])
 
 vdso_le_inc = gen_vdso.process('vdso-le.so',
                                extra_args: ['-s', 'sigreturn_codes'])
 
-linux_user_ss.add(when: 'TARGET_ARM', if_true: [vdso_be_inc, vdso_le_inc])
+linux_user_ss.add(when: 'TARGET_ARM', if_true: [
+    vdso_be8_inc, vdso_be32_inc, vdso_le_inc
+])
diff --git a/linux-user/arm/vdso-be32.so b/linux-user/arm/vdso-be32.so
new file mode 100755
index 0000000000000000000000000000000000000000..b896d3d545ebf91942038831a9535b023137a86b
GIT binary patch
literal 2648
zcmbtVO-x)>6h3eM80atz#?V$w#FU7s?MrPY6@OwJ7zS#9;uIpr#K$o6U?zom&CCPA
z_(K)jYPEI2#x#u>*BWAK(oG}X7}JGu(U>kYb%7gWj2bmA)bac7dzTK##(3a+=YHp$
zd+&Sqo^$4vzQK$UFl1ALazDn}kQ8ZH3rj#GDIF4quT>K8M*#RXv5GMf@}cL0QbMa9
zq(RhlE+~K0VF_bG%`dp$jfe!`*N`-Pg!23P2DC;e#zejUPViv=@R<Cvd*J4^Txa)J
z@7#0Z+Iu5y`)ZH;3||}=^X3>EPVMjCuphrI44sC?HyR7jO@IUJ0uoNG_9y)7(0_pk
zpnrn8jPd`K6kebEMDGxZK_3LSp__c(2L5av#~Fv7s^g4R(keB6AJ11y5Ch&BHHGIy
z!MCcr=6z^k4DXK!hxdkb4CjQ`+OJFT(1mRCl`nhCy&vqo@3Z~q#IoiKRmaNDIQbLS
zwC%d3S$jw0k>tP36}zf!{!C}8kXw|QQh9FSAlEhV|DX&W9UdFE4x2~t7C7+DKLhWH
zzvdr5eIIt-`P~5TRezZg{AliXF#0I!oQ(G1qZmH{ASaD+Xuz0+J_$VoeHMBidKLO*
zXxy{00z?7Y4#38I5#xod1YV3A?XhN3?z0Er`8P=_9z7E{&$Fcc5b*sD_5s+w-oZWr
z+ZRBzZk;4J_dJeGTe#`OQsPw0tMS*Gmt(K*I^A@p@oe;shBqVU!f%D%4xSHO;N}qS
z{}^x@Xp{c<x4yjt{BvL#h)E(Ie(Be6B$8-spxzf^+DHfR1Hf~MdNC0{CZc2D68U7Q
ztM*XzmRwy@qm|83qdyv^&aCUduIFzF$6X(K`r_5=vCO;uiHqNOI)ycN=j_~M3AZfL
z98Qi(B+%%;I(OV6H^`8{+Rr;64^YFrz$Z9!9Aez$6U46vW5egnd5G!<^s7SvPtyvH
zoS}Gi500Ere4S75Mr!!={_G);AkUwE_7X^Fgir7owH9zDlKuv~oT_KUc=7Ntz6CSY
ze2o3|FoO8;Xd7M+FueKg@SK9J1Bb!+59s&9nD6(vJ`X>B6gDM(KY0%G>-$p$oVBF;
z6Y^?Hf4T&IyFcagBjZl~;aSs>PFFe$Vx^xMP7NLHm1=3aV!LydvXyrVsvDqbTYUpo
zCYu`Svj);xvHAy(^`r)^W0}nHzENv5)ic;<)wKk_0c~j@+nZ8dquJ7^cIZi}e~DRL
zoON@P&~C-kMLjAzt}SL^v7DPN<<$VO&^b3J=5%?^Eas|3&+b+{%e-BwmYnhyVim-+
zi`G;nH)~tP0wOgN)3p~|F;m$gGv~UM(&U_rqxnyQ`&N0%+-F@7oq!fU=jC1)nBPb{
zl`qWMCBV;dq?4E5`=Oa<SdVq2YH0$Tam-c5u^%4xIo4x+sT!-#Z^jX<1=bnY+wdR<
z!1*2&9oLQDSoUwku^v@TCc(GI_4qc%r9G(MZJ3qldU_J;)nH-VWe=(z^m?$<Cr|6&
zc+hnZ(hWPmmwvt<WeVWhTn}fbY99M<ijH$(@#EMB2xI%Xa1wuO7>7Gyy{nqnbxuFe
zn6iBG_8EYNR`J*aXyF<Ze@~Af?g~t6VCWzC9e@Ggn(SHn3^0ro@%R|fqStGMp)RiB
MF7Oo{1g+x!0gGmCQ~&?~

literal 0
HcmV?d00001

diff --git a/linux-user/arm/vdso-be.so b/linux-user/arm/vdso-be8.so
similarity index 95%
rename from linux-user/arm/vdso-be.so
rename to linux-user/arm/vdso-be8.so
index bed02804a4bd367eb9fd8ca54d0c980103c02245..784b7bdb2a9308671bbc4c1e38ab4eac568ea6f7 100755
GIT binary patch
delta 19
acmca1azkW8HXECHj$?pF(B?w6=ga^|Lk8ji

delta 19
acmca1azkW8HXB=JPDHqi;pRfN=ga^~jt30@

-- 
2.43.0

