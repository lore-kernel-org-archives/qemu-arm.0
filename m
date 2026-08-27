Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080EFC61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 05:11:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzSOf-0004C9-7M; Thu, 27 Aug 2026 01:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOY-000461-TN
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:11:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOX-0004EK-BV
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:11:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3964dfb5a69so1800500a91.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 22:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807480; x=1788412280; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g7qPAmD5Uc4zNc8vOsv1rG83nWMR8s88x8LyK/YSuMs=;
 b=WWVaQ+3lyeyiCh2Yh4OK2Acdftkixg2hOcG7CO2+9Apb6gDQHKBktr+zRwZ/chSKJF
 5aqrbLHHbDK6E0AvtFHt2sGpMIpR7+XQzc4IA57wxPMoEFe9BFnwbYnyNyG+k+BOYpVU
 vsH4pjqkakV64baW7un0TQsiIAQrs8q4I463fYL0GY5LvGX53yvDORQlvl3VQm7M/ARr
 ImvjhU15p5CGLzrNtUfCTJDF/z5MltLOM4GSVaM6x0gDdPU11A5KNyuBde/CRnTxOF7m
 Wq56VRTjlaviCTepF8WX+wLrXvPBlJzkmk81h4/FjHt8ZyHoy065UOtFpvWpKkvK7iu/
 9jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807480; x=1788412280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g7qPAmD5Uc4zNc8vOsv1rG83nWMR8s88x8LyK/YSuMs=;
 b=OiOybsM94U0/unKns1akai1m82By/7LhzkjBzCF9LkTcP+ud5BU9yWblt7/N91LDNb
 Omv15SWq2d2sX28KGMFoi24cyViCmdEXQei7ibgHutJj/UgVclvwRHcnNef3OJEKisro
 HlMeUUBBIuRoehzqdc0LOMCDakgfTK/y1lqgw/IEhXOWZ1zfh5Q+ZJR/fEBNIROW18N+
 SPISYOIW20zc8NZlVFZu5FwWd8sq5UTxGvgROK0EZMG0wTsWAuKCtQYA84bElR/rnEze
 dvCvrGHoiqc+Up+c87C6U4cKvH2xYipkVxUQxWhD1yJJ9LGp82/WRMYjrki+3+Np/rlr
 ZV8A==
X-Forwarded-Encrypted: i=1;
 AHgh+RoP9lixV7Mxa9C9etQieu9QdOYJW0UNmP7mfmtFp+yxoWEv/Ef4V4XcVmdYmew2lcA1E20NT+xm5Q==@nongnu.org
X-Gm-Message-State: AFuF++ml7DN7GAQEk7m2melRKhLJoNInR/cad71PXMWa+AYRH9FS5poY
 5IJoOp/AvXOWz/QcAExtJAr/Etz5oUM63xaBS2j8qv8vPwUzMQna7wM4SUEmAxqv
X-Gm-Gg: AR+sD11IiDW3h/A3m5LxC+eI1rlJBSxkEfftEof6+sAjiUeeHyr81yr30znSo7moHy9
 FAjo/Kuwls09kQPLXVcXiAGY1gq4OCtQdwI7NPKe5exND1WBoU3HAmTKRymK7tfkF8/q2qqfFaS
 v/fAHz6y+kNHGcSxww5LLwBzQObQscBkTvbkY+KCd+Qek/Z7JQP7PA/16hUzoKHhkb4Dc9sv92+
 D+wrMfpNIPZ44/lKPtyXQbvtxKKrwM9RTkiNhZibTsBt1xV7z4utRH4q6uUGIUzLhtcSmJ7XO33
 S+WUvEb77TfAiaVCsX71dw/25m2yr+fUa83x7Zyg7ToW2N2s45zwShyPDyhM6ybG/QkF2gQ4yey
 twb6eN9pLi6yK1j59LuPlJWHuGTFG1NAJXA1M6OhpLQF9o+XBFr5OdWjdvFJ0dNBurx3nczhxSl
 8DNvQss1HIQNf1N+N88VO8ecLYAEIPvm0GQaq2ZJkkPUxUYO50AD8aBpZEYU3bLcOgZrSujXEgN
 xSRAq1cXf2kj/pE8nXCYLCNFiTPmhSbCQvspFAokrst6skOKLD+C8Uo0cjMeuRiD8Z+kelQNafL
 8uVK9vBYzU91Zeadi1MI
X-Received: by 2002:a17:90b:5828:b0:395:4de4:92be with SMTP id
 98e67ed59e1d1-3966d486840mr26426950a91.13.1787807480024; 
 Wed, 26 Aug 2026 22:11:20 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:11:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 11/12] configure: Provide OBJDUMP to the tcg tests
Date: Thu, 27 Aug 2026 14:39:50 +0930
Message-ID: <20260827050953.67184-12-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Probe for a cross objdump alongside the other binutils and add
OBJDUMP to tests/tcg config-target.mak so test makefiles can
inspect the binaries they build.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configure | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/configure b/configure
index 56158cd95f7b..b82a43018563 100755
--- a/configure
+++ b/configure
@@ -318,6 +318,7 @@ as="${AS-${cross_prefix}as}"
 ccas="${CCAS-$cc}"
 dlltool="${DLLTOOL-${cross_prefix}dlltool}"
 objcopy="${OBJCOPY-${cross_prefix}objcopy}"
+objdump="${OBJDUMP-${cross_prefix}objdump}"
 ld="${LD-${cross_prefix}ld}"
 ranlib="${RANLIB-${cross_prefix}ranlib}"
 nm="${NM-${cross_prefix}nm}"
@@ -1384,6 +1385,7 @@ probe_target_compiler() {
   container_cross_ld=
   container_cross_nm=
   container_cross_objcopy=
+  container_cross_objdump=
   container_cross_ranlib=
   container_cross_strip=
 
@@ -1489,6 +1491,7 @@ probe_target_compiler() {
     : ${container_cross_ld:=${container_cross_prefix}ld}
     : ${container_cross_nm:=${container_cross_prefix}nm}
     : ${container_cross_objcopy:=${container_cross_prefix}objcopy}
+    : ${container_cross_objdump:=${container_cross_prefix}objdump}
     : ${container_cross_ranlib:=${container_cross_prefix}ranlib}
     : ${container_cross_strip:=${container_cross_prefix}strip}
   done
@@ -1517,6 +1520,7 @@ probe_target_compiler() {
       target_ld=$ld
       target_nm=$nm
       target_objcopy=$objcopy
+      target_objdump=$objdump
       target_ranlib=$ranlib
       target_strip=$strip
       ;;
@@ -1535,6 +1539,7 @@ probe_target_compiler() {
       compute_target_variable $target_arch target_ld ld
       compute_target_variable $target_arch target_nm nm
       compute_target_variable $target_arch target_objcopy objcopy
+      compute_target_variable $target_arch target_objdump objdump
       compute_target_variable $target_arch target_ranlib ranlib
       compute_target_variable $target_arch target_strip strip
       ;;
@@ -1596,6 +1601,7 @@ probe_target_compiler() {
     target_ld=
     target_nm=
     target_objcopy=
+    target_objdump=
     target_ranlib=
     target_strip=
   fi
@@ -1617,6 +1623,7 @@ write_target_makefile() {
     echo "LD=$docker_py cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
     echo "NM=$docker_py cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
     echo "OBJCOPY=$docker_py cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+    echo "OBJDUMP=$docker_py cc --cc $container_cross_objdump -i qemu/$container_image -s $source_path --"
     echo "RANLIB=$docker_py cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
     echo "STRIP=$docker_py cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
   else
@@ -1639,6 +1646,9 @@ write_target_makefile() {
     if test -n "$target_objcopy"; then
       echo "OBJCOPY=$target_objcopy"
     fi
+    if test -n "$target_objdump"; then
+      echo "OBJDUMP=$target_objdump"
+    fi
     if test -n "$target_ranlib"; then
       echo "RANLIB=$target_ranlib"
     fi
@@ -1998,6 +2008,7 @@ preserve_env LD_LIBRARY_PATH
 preserve_env NM
 preserve_env OBJCFLAGS
 preserve_env OBJCOPY
+preserve_env OBJDUMP
 preserve_env PATH
 preserve_env PKG_CONFIG
 preserve_env PKG_CONFIG_LIBDIR
-- 
2.47.3


