Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A8D606A324
	for <qemu-arm@archiver.kernel.org>; Sun,  1 Nov 2026 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0/2O/DU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNZoR-000532-Ki; Sun, 01 Nov 2026 12:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNZMo-0006p6-T2
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 12:29:14 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNZMi-0000gt-Ri
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 12:29:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso22171075e9.0
 for <qemu-arm@nongnu.org>; Sun, 01 Nov 2026 09:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793554145; x=1794158945; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VzDJP5bF+ZfkTM6l/82UKIRdcr9quHo5sFyNRYRV49Y=;
 b=P0/2O/DUP7Y39ywHg2kS9r377mT4O3ZWGcwcTl1ZQqerBFgTPKnJZ61dw/+xSdEiTv
 HxQ6pbhwMivRfxcbxllMbM4+oV9RG3GBy3tddMWDqngQ0mZ+643rIW//AnxxaLUr8GdI
 KPv1P3999Jcv6QaVC3hwJZqO2+wUJNt1Z3HneNvOtgCkSzMvzHH26Ngb2IeHTvdWLI7C
 IFfkx7wLysHI3+21hgUqvLm1qyW+uckF41sNGYsVikbZCp9CUhKzZuJQY4E3wWEEqduS
 r1DYm/7Yoh/KdLgNWAcw4QBT1Vv55M7W7KQ3UQGhLvjTLgl0ptwagQfkMcpqTsdHDN6C
 c+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793554145; x=1794158945;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VzDJP5bF+ZfkTM6l/82UKIRdcr9quHo5sFyNRYRV49Y=;
 b=NUOBsYAwnkeOxMoa23kAIGhBrge5YX0+Vz+/gGRE/065aYrNEsd5yJLuZCK7uyWGyb
 nWSM4Gqnj4/fxNz+DWuLK5SYMOmOKS8O0oSXsFQQ592OzWbir8Ub9fSXD1y5Q1wc8qUG
 6mL4Y9OElJl1mv4hDEGuX+LmFLKLCTGjbC+l32qgh7VmWbkSpCGGlcRl9pgy98ukdQiJ
 ByRliX68srNUusVEmfaMCmCqgicgMuaiP87lKC7367C7CRTEvjp6iJhmQ+uKF1cJ4tFi
 U8brVgqdzLUaIGbBKyhqYy7bp71qL5+AhnLCvv8qEF7Q1pgXkHuj3rD65o5G2QN7rcqx
 CQWA==
X-Forwarded-Encrypted: i=1;
 AKwUvByJqdBkp37GQ8laHQDBdfdHRunUEVv+LcLHJxFtxkgtuOzX0aziHnhf2oIbs5CNJR/BqFN5j6lzbQ==@nongnu.org
X-Gm-Message-State: AFq9FYI7ozDYyANAdsWcpMVXPXgvdaIr6OXG+UaJUzHcEh199937CFXE
 0AO1IoHDdcDHH6dNkv7Wc0mi2z6Wtj2v+Gixdqa6RX8hLYBTvrFzWf2r
X-Gm-Gg: AYBFou3tBcyJVhxDmMl1COtrdALNxh0DB6SxGpNcHQdtC1UITk63KzO8UgQYCQf8haP
 ma6Oc3ZYUt+rJKj8SB/EWpmantMfWH2w9P+rkVaeu3+cQGyYumbexfX+MUIknrdCKd6SOYEXG1E
 r5YUSYp1y2jxqks+rJjrgU0r6g8EnT9lBvsMOys8Yikja7eJ+Fvup0ObOvV8uiE4mXgmI/sFOqn
 eWEdWxcxrlVdIc40AbCoPLoqEEDl/ZU0SPdTUTmrZUEWThpqDzJHzSsSYQ6uHV6uJ22htVqQmk3
 7SwuR9pNtWYvGT21IqeXjAyBLpa5B0Qadm3yesmMczbiWjjyoU+w9khtPFZC6lDX3KqVI7adXuk
 7ghZJAWj7rQ+ThEZK47WOZl4X1w2uuSAnSrC7fq7SLidb301tMYgG9JyAFillWFwzD1bdGrL0H9
 JRCIG/qnIDHkfBoDCr5xXPxgXHOBocw7ZHoUcdw2BOi4vCbijd7fTJadaqRo39xPxNOWpLRCo1/
 e1gbKeLqqV7AepkyfO50Ch1zBGabjLxkBUiaLj0yG5CX8x3fL8hDRFB5CbZPtqI31H00JuOjWtd
 BTCO3mEjIo3BxlEG4a1KZuhv8x3mytQrhHu+Uqiyp9x1/qQ39Qg=
X-Received: by 2002:a05:600c:4454:b0:4a5:1cf1:b7bd with SMTP id
 5b1f17b1804b1-4ac1794032cmr185740865e9.16.1793554145086; 
 Sun, 01 Nov 2026 09:29:05 -0800 (PST)
Received: from localhost.localdomain ([2001:9e8:8c1a:8d00:4ed:aeed:5810:610b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ab61d8b9f4sm254261355e9.12.2026.11.01.09.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2026 09:29:04 -0800 (PST)
From: Lorand Marton <lorandmarton.dev@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Subject: Re: [PATCH 1/4] target/arm: hold bql when SEV sets the event_register
Date: Sun,  1 Nov 2026 18:29:01 +0100
Message-ID: <20261101172901.873975-1-lorandmarton.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030141046.2710206-2-alex.bennee@linaro.org>
References: <20261030141046.2710206-1-alex.bennee@linaro.org>
 <20261030141046.2710206-2-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=lorandmarton.dev@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 01 Nov 2026 12:57:46 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 14:10, Alex Bennée <alex.bennee@linaro.org> wrote:
> There is a race in qemu_process_cpu_events and sleeping on halt_cond
> where we can miss the setting of the event_register which would cause
> arm_cpu_has_work to report we shouldn't sleep. As by definition the
> bql has to be held when we go to sleep against halt_cond guard the
> kicking of the cpus by the SEV helper with the BQL to ensure things
> are properly serialised.

I hit this race with a bare-metal test in which two CPUs pass a turn
back and forth 500000 times with WFE and SEV (virt, -smp 2,
semihosting).

On master (af1179b406) it hangs in 10 of 10 runs with -cpu max and in
10 of 10 with cortex-a72 (no result after 20 s; a passing run takes
2 s). A second test, in which a CPU waits in WFE for a broadcast TLBI
and an SEV, hangs in 23 of 100 runs with cortex-a53.

With this series applied on the same master, the first test passes
150 of 150 runs (50 each with max, cortex-a72 and cortex-a53) and the
second 600 of 600 (200 each).

Tested-by: Lorand Marton <lorandmarton.dev@gmail.com>

The series has no test case now; I can post these two as
tests/tcg/aarch64/system tests if that helps.

Thanks,
Lorand

