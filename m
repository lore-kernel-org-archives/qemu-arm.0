Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB7BCCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 08:11:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE1HB-0007XH-PN; Wed, 29 Oct 2025 04:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vE1Gj-0007OX-2J
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 04:11:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vE1Gc-0004bK-Ip
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 04:10:56 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4298b49f103so2431549f8f.2
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761725447; x=1762330247; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WMZtSrVCQzr0uAODDe4WO0RNkp8rQj/Tb5xXoORj8fQ=;
 b=HTqGdX1b9cYtzfLe/lXs/E6s9TXDsizysHRc164jLydnkpCjF0HkRKSnbmuAMMbr7R
 yIYVxMIWxAcUyE66zveT8eAs5wLtIZ3AS+g+dLCjiE0nsvKQuhy9EKhqUyXMPvqizmC/
 Eiz4OEsglIIw7vK+DSCDw9310tLx9qupDbLRPLtNPj2q7Cdp1T2KjEFn641xolLkHSJ/
 C4ySjcwOSqQbxeRjnqcJQNkdhLW2Lkh1DKKcx4R5xOyrfsuDyi/k1knPSveKn7NuTJc1
 AIufqP+h+KrkMav0XLJPouYg9PQ5BFdbaBH3I9qWyOfEHFlhaDS2vPXuxFDiGVX0t1qU
 xAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761725447; x=1762330247;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMZtSrVCQzr0uAODDe4WO0RNkp8rQj/Tb5xXoORj8fQ=;
 b=sz5cMdX6h70RrRpM+Pta42o+0I0eYv+wCnxlf9loINWaHQrixJSOQckcttztizAzUL
 vfvagc8uLNVGsUNTUQqG6u1y/VFBNRLWobRJlRzbMdRxiNLPj6sf4ZoG9MLDgmIcDCWG
 FU26eoGvFzP2BdMPl3dr0DQPgf8oIWASyUwZCZkyj7ZgUPD30EJGXKpuvr2iCPw7hPn+
 QLJk4LBtHfIOcfOIm/3UGy1TPq0HnZAz8r2/9O/1HECZ89Vo+/V0XNX0euzSivD11QYL
 k/uBl21z8Q7XqjAdlbcFTKR84FTVUhGb6KTGx7dy4Cz/RM88n61YNAmFfkZ7Gan2pldi
 IpMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVERZslp9Vk7eEPKoVzWY3oc9vaRGWhhJwGsmrLF82wKNfUai+bVlFy00bNcr+XonIRtvrlZVIzvw==@nongnu.org
X-Gm-Message-State: AOJu0YxGxQL9zsxH+6sfHInOeRUY0mhNZeZyD3PfySUdP6Sfd1DvIHfG
 Xw/1GQPG1v9Rx/1UqMMxkoTm81hsks7NBLEVKOkhofphhSKw9y2dnb4Luigo9+DtOqk=
X-Gm-Gg: ASbGncu5B0cByWksujCZZ7FulP+wGhnwQRcKXDfR5ijf7nFZ2I6YM8M94Iz91jbmnVP
 yPSGFc2i8kIBjvd4GyQ3w8+qNQlZo7EPsPRL2VRSzuf+p23OWlf9A6CI2q6w5CU0H9oFjTWMmWH
 ecV4LuU8hrqgEL9IPZBd91LKHh9OKkqxRY6DCz7O8afepiSD2l13Hgr12zXezu5ktdEMUft5OrT
 j1OyJjUQul7zOeKg7rUde5oQwqERDFnLUDt50OyfJ/dPg4N3hPIAe++BalehQlxqOhovJiA6x6D
 Dz4cSHU20W6akrl5yq44ZRnpmtC1B6meeMRaolEq/z/BkTHYltsl5jrgha4JVSphb9naZPYzvB/
 4jqE/RjozDE9WlXBbkU7pBmNiU8wJFTfBr4KNFVaBJeTU4P0OnKEk+3Wq+KKef+dEg+JmopRWmO
 QGf3Hh8SUmXQ4ynjJnt9Qu2YyknD7+rTGM99KSc7Bast39YD0F
X-Google-Smtp-Source: AGHT+IGT7zOS85s9tlg3jilcN9QYaJKuyN0sURC4ERCaHbjy3qjLqWlaD+DPUcv8eJq6jQcxMchs9A==
X-Received: by 2002:a05:6000:1846:b0:429:8d8b:fef7 with SMTP id
 ffacd0b85a97d-429aefca3a0mr1393034f8f.49.1761725447248; 
 Wed, 29 Oct 2025 01:10:47 -0700 (PDT)
Received: from meli-email.org (athedsl-4440624.home.otenet.gr. [79.129.178.32])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5c9dsm25987917f8f.26.2025.10.29.01.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:10:46 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:10:24 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9_?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org, 
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: Re: [PATCH 06/35] scripts/ci: modify gitlab runner deb setup
User-Agent: meli/0.8.12
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
 <20251027110344.2289945-7-alex.bennee@linaro.org>
In-Reply-To: <20251027110344.2289945-7-alex.bennee@linaro.org>
Message-ID: <t4vw1x.1ndc8wjayp8ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.737,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 27 Oct 2025 13:03, Alex Bennée <alex.bennee@linaro.org> wrote:
>Both Debian and Ubuntu are setup the same way.
>
>Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> scripts/ci/setup/gitlab-runner.yml | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
>index 7025935487a..76aeaf4ee95 100644
>--- a/scripts/ci/setup/gitlab-runner.yml
>+++ b/scripts/ci/setup/gitlab-runner.yml
>@@ -56,12 +56,12 @@
>         url: "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh"
>         mode: 0755
>       when:
>-        - ansible_facts['distribution'] == 'Ubuntu'
>+        - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
> 
>     - name: Run gitlab-runner repo setup script (DEB)
>       shell: "/root/script.deb.sh"
>       when:
>-        - ansible_facts['distribution'] == 'Ubuntu'
>+        - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
> 
>     - name: Install gitlab-runner (DEB)
>       ansible.builtin.apt:
>@@ -69,7 +69,7 @@
>           update_cache: yes
>           state: present
>       when:
>-        - ansible_facts['distribution'] == 'Ubuntu'
>+        - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
> 
>     # RPM setup
>     - name: Get gitlab-runner repo setup script (RPM)
>-- 
>2.47.3
>
>

