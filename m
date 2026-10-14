Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711B9CC6B1A
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:46:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvXV-0005er-L9; Wed, 14 Oct 2026 05:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvXH-00053t-LL
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:44:37 -0400
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvX8-00026A-MV
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:44:28 -0400
Received: by mail-dl1-x1236.google.com with SMTP id
 a92af1059eb24-14394530ec6so2730117c88.1
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971065; x=1792575865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KO0jK5ge8mQcD+JCrU2SKqU9WNdQjJjrvSJVIgwsHK4=;
 b=fiKSLXk1gBPktQkd2RQFd8jEwjvdew9A+6VLJGsE93t1SYVtzCtNwDRfnGs2iurLNH
 XP86gq9lBs2YePRGUlPxUFLMP5RzCnFvCJ79F8DHaUanumG/acw2TPmfYtUCzoky2oJR
 QPwulIeZ/cWhKKOx58XW3Qh2zdYz1ZSg1s6Ht7hWUMjyZ1cCZRn19zR9BRbK27Vu1Uui
 ehrWLRZG/7oUWI65Y5akmWseRVt8teGav99JI5xdHbYAMySzn/L5OcIYB9LAwMg8Xbiu
 entDHed5WoWdOpOFXQLjJ8RmDa/hCt+PUKwT6b/ok4e5v3D0vD5doH0ipaKd3nSrIbRR
 gZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971065; x=1792575865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KO0jK5ge8mQcD+JCrU2SKqU9WNdQjJjrvSJVIgwsHK4=;
 b=ozzshbEbw2pReK1BElmCrNi/GHRSPyBRAYsxR6L9frupY73ZnDS62q3DTWa7MuVKaW
 BuVk14qfAXteMfMoCdkZgBYxIetp+sDZelT/73PfxKf6L+VerItcMfKg3XXmuwYSKrp9
 Yp7+G4XXV4LFt6LKprruPnub4ST02jyTM0Hu89APcNYgU416btSCVQgh35a6V6ytIGub
 aMko4O/0a97Igdlt8ewPyVqCcvgJjUYnMPaGji6eZRNS7jRYlRXslb48XmjSFoEkS4I+
 cnMJZpU0OfwXH9ZMpVjYOHRbXVsqyrDIVJW/ABwT5AZfkk19i3+Di5D+X9bhpzuRfN0f
 QJ0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxGGHOzOzRPj8wIvF1P6lHs6jYb1XUQQzWRaTsBBMn/MOI7V3XQ+1TUieP3I9EFsBe1oCpt37zu0Q==@nongnu.org
X-Gm-Message-State: AFq9FYLwQM4mnlO1q/oiJL7DD2+xcnfnvAyKR39OorihnSvNWkRmg6ys
 H72s9SpcfKkTl6OgDLi2t9+XJpgiWrqR653aOiNG5HjHdPaU6JsxGWs/
X-Gm-Gg: AYBFou1WkQvHEQcKARP+6OrVDXlUQolqTiede+oRqyA6fAlxoDMbhuSwIZ11ZrHlo9Z
 7Ia8lAsf/5T0jSPkIeCc4q8Nv3D8gZWZ1MBDAJjl8+R8B5l+b10fuUDxNFotGCMJJyfUdl2xMMJ
 zOA8+FrB4IC3Q/IAFrCFviynKLnp68c6ZzYBGtktC40BfxSVfIyXO6PkwAEs8o20ajg7xa1VFQT
 5UkaifyGhTd1g97KE/RTZtdMoJUEw2UrFECBvK/QZ4jTW4+FyjEguoY9qaQxdBUAbUrG73L1NMw
 hg61MA35SvJIfUKsZ6pkIj5FsU49mDCPy9B6UqlTQ3oyr+D9+FW+9oMbFckkQ7/OD7A0ppBfE5/
 GMmKYJ0s1bgx2FoqV+xvmm5MJx9QhytOxzU5JQzHjljQocrHMGI0irzBsDDGDLq+9KowpV5wFyx
 7riy11fGl3/wEsXZY3rmtR5WBxAsYod41wig6cwPxSXPiW/i+nTu3s+KG9g5WqLs9VBIi2YEC7F
 GulPxBr0DvIIJtiZw==
X-Received: by 2002:a05:7022:7e08:b0:144:fa58:95d8 with SMTP id
 a92af1059eb24-16a61a6ebb0mr28600435c88.27.1791971064923; 
 Wed, 14 Oct 2026 02:44:24 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:44:24 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 27/34] machine: match the versioned virt example to arm virt
Date: Wed, 14 Oct 2026 17:41:42 +0800
Message-ID: <20261014094224.1976-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1236;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The comment still showed MACHINE_VER_TYPE_NAME("virt") and left out
machine_class_set_name(). Show the arm-virt QOM type, keep the -M name
as virt-<version>, and name the latest helper
DEFINE_VIRT_MACHINE_AS_LATEST.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/core/boards.h | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
index 6e5c8dac2d1..66d530bedf5 100644
--- a/include/hw/core/boards.h
+++ b/include/hw/core/boards.h
@@ -480,28 +480,37 @@ struct MachineState {
  * For example, a macro that can be used to define versioned
  * 'virt' machine types would look like:
  *
+ *  #define TYPE_VIRT_MACHINE (target_combined_binary() ? \
+ *                             MACHINE_TYPE_NAME("arm-virt") : \
+ *                             MACHINE_TYPE_NAME("virt"))
+ *
  *  #define DEFINE_VIRT_MACHINE_IMPL(latest, ...) \
  *      static void MACHINE_VER_SYM(class_init, virt, __VA_ARGS__)( \
  *          ObjectClass *oc, \
- *          void *data) \
+ *          const void *data) \
  *      { \
  *          MachineClass *mc = MACHINE_CLASS(oc); \
  *          MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
- *          mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " Virtual Machine"; \
+ *          mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) \
+ *                     " ARM Virtual Machine"; \
  *          MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+ *          machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
  *          if (latest) { \
  *              mc->alias = "virt"; \
  *          } \
  *      } \
- *      static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = { \
- *          .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
- *          .parent = TYPE_VIRT_MACHINE, \
- *          .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
- *      }; \
  *      static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
  *      { \
+ *          const TypeInfo virt_machine_info = \
+ *          { \
+ *              .name = target_combined_binary() ? \
+ *                      MACHINE_VER_TYPE_NAME("arm-virt", __VA_ARGS__) : \
+ *                      MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+ *              .parent = TYPE_VIRT_MACHINE, \
+ *              .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+ *          }; \
  *          MACHINE_VER_DELETION(__VA_ARGS__); \
- *          type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
+ *          type_register_static(&virt_machine_info); \
  *      } \
  *      type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
  *
@@ -509,7 +518,7 @@ struct MachineState {
  * whichever scenarios need to be catered for with a machine:
  *
  *  // Normal 2 digit, marked as latest e.g. 'virt-9.0'
- *  #define DEFINE_VIRT_MACHINE_LATEST(major, minor) \
+ *  #define DEFINE_VIRT_MACHINE_AS_LATEST(major, minor) \
  *      DEFINE_VIRT_MACHINE_IMPL(true, major, minor)
  *
  *  // Normal 2 digit e.g. 'virt-9.0'
-- 
2.55.0.windows.3


