Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3A8CCF9EC
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:12:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL2V-0001mY-36; Mon, 27 Oct 2025 07:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL2S-0001jc-7t
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:05:24 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1a-0005co-JP
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:05:23 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b6d3340dc2aso1049243366b.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563030; x=1762167830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPRpRXWNkgzTelJ9LaP0XDvrgpGKDnKCNCyXswtjrG8=;
 b=w5dLCARn5qgqtBNCDCY41zmbiYRysQivS7/97/aDe/4US434ThlSgwfMG2x2Ex+gg4
 pd4Fmj5rvKt0bxhzfl2AR41IMMbc41OGjR0Bqab7pk1CG2zRcBMS8X9STFNRk9XFzM/z
 jutJwpxpipYbqmLvFhgAXHgUXXuJA7PKSXlTVRzFxEH4XEtx4/SnppriHCMU014Vxhc4
 BcaF4u+o3XQDfu9VdPR12TOnYoDEhdHZkMlUtg/HAOY1G2jkG5Xs9kvlsg0utfgvEai7
 zjCOTJSKNOeAVz0N+2vEPkpeQxqlnSGYp0VVYEu0G2K/F6zocIpDZ0RGa+bPHsKdNTa8
 pqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563030; x=1762167830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPRpRXWNkgzTelJ9LaP0XDvrgpGKDnKCNCyXswtjrG8=;
 b=Ole5i71r5PfBWjapNLgWWdk2Bkx+LbIkdfg7ON6uFOF8vczPoQZBcDnfJBUtFW9rWR
 HXFugrM39NuBpG19N8GSdO4//cv8xlYC/jVZqMnDazGZesJiUlPCKjbxrVgzy1tgodBZ
 MJv97J4INUbINAg8bZdbReuXS7g7XY/z7ItGs+QjgCI7OVkdr6leEhmOmvWZhNNDeoda
 FjVSutnr/L/O6GLVI/HNTECI3AM3aq/yrKDCumLdpn157fANwP3dCazqdL9d35LlDtTH
 0ecLVvbfhc5aogXkGFag++rNDSHwTMqySHvJmSq2PqYVf08aESjUpCt9ZICBRsXcbtpD
 63FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD0eP/RYfTbefblfYqDU5TPCyGUYs0RS8s73ZDluFGw3tC3tiQL6V894tIV7tTYMlfyLhOtheH3w==@nongnu.org
X-Gm-Message-State: AOJu0YxuZZc4OUSLc/sr55WZSO+wCyeEpyfbXxao2bYU11G1DOAcv0Iy
 EmjA0Jw/uNZRk6blzN9ZIGIsZj4xs9iAB3peeorJmsPW+Z6HyU51ZUxDKOEQX3m7IUY=
X-Gm-Gg: ASbGncswvxdAJr1pezoJsJMbpV026oxbEmm93Npvqf/EXHXGYhctKWYBybNfgYGYyIc
 3sUp5jIjk6Oa4MhWCSmXtenimWRjnP0ms8q1DmIgLEBIn+GzdOQ0cF8XeSuR5rvX88CNWzOJDQo
 Q/stkvQIoeskgFTd6qvYme9anMscatFt2CwXE0vkOUbgIdmoFpZiiOKMgNyCEPqVbpqOi9z/pnO
 9mRELGDRB8oL5YtPZ7jEZpqjvImWrSYcWKcY4SDzDOeNa/JiE4vwjiXhqVsYukAXBNMut9p1MwA
 sGxeC2RSm2JxGaPL6rAC2HaOlg9S/SB+wsCev2NX7RFzupUZMeWRhW8f7/olhVK+00/IZkNJt9H
 LQVc/XwqZ/NBhF+bpwJSshL0WZht/w5cr0E3a6Z0hwFlv4F7gQ1KvuRZj/JulLyGAmBZS9QEsNa
 1RoIMtQaoAfnc=
X-Google-Smtp-Source: AGHT+IEKOw2sZTHAivgqlTb6K/HYXBQhpYwxsm2va8DyFrA5s6EN+1suG8QBDsLHPxzTUtSD784+vA==
X-Received: by 2002:a17:906:7955:b0:b6d:5fbf:8c63 with SMTP id
 a640c23a62f3a-b6d6bb4a57emr1240007166b.15.1761563030330; 
 Mon, 27 Oct 2025 04:03:50 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85309069sm716387666b.10.2025.10.27.04.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A833D5FAA7;
 Mon, 27 Oct 2025 11:03:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH 06/35] scripts/ci: modify gitlab runner deb setup
Date: Mon, 27 Oct 2025 11:03:13 +0000
Message-ID: <20251027110344.2289945-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Both Debian and Ubuntu are setup the same way.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 7025935487a..76aeaf4ee95 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -56,12 +56,12 @@
         url: "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh"
         mode: 0755
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
 
     - name: Run gitlab-runner repo setup script (DEB)
       shell: "/root/script.deb.sh"
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
 
     - name: Install gitlab-runner (DEB)
       ansible.builtin.apt:
@@ -69,7 +69,7 @@
           update_cache: yes
           state: present
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
 
     # RPM setup
     - name: Get gitlab-runner repo setup script (RPM)
-- 
2.47.3


