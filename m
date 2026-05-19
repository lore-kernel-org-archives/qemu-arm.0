Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C3CCD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 16:49:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPNcQ-00039I-Cb; Tue, 19 May 2026 12:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wPNcK-00037T-8f
 for qemu-arm@nongnu.org; Tue, 19 May 2026 12:48:29 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wPNcI-0007fz-9P
 for qemu-arm@nongnu.org; Tue, 19 May 2026 12:48:27 -0400
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-90fe17c157aso444080285a.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779209305; x=1779814105; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4/lqHZRCy3sAKq1DW5PUtGDY6iZILtZtdMIPcKbBuI=;
 b=dHioeM1U5T+qzGhJd8biRJ2A4jZVAyba5BaItxthDdsK9uzv7hk9UBmV1Jxgezmx6T
 2/u9dLoSBPdOZkhfDeq9KoaI9RF3sl9eexASVW1MPHJ7Ukd/XuFSAwcVtsXks+FF05hU
 72n/WMXtsDwvVrNvs7syb+YpyHQY2l2K0R33NiS97FNXc6sGFLnCUSdhBql7OtrzEx6Q
 F30wHTUUAujZQ+55mu8QHj9r41w39bQtC9vBVp9NgNQ1FDhzbkgC8Q7972bgTNR4e5HI
 GbDx9XFHsC/ndoTmc/VMsnZICsuZ24J7UtqN28Drwda7/o9IqYXbIWw8riSIs/W5KiHY
 idzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779209305; x=1779814105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N4/lqHZRCy3sAKq1DW5PUtGDY6iZILtZtdMIPcKbBuI=;
 b=mze92cBtWPwJhlelwyN+BSIXuYHll+09tjWhDNTFWtoyhsAhP/KBZNP7u2/dxwCnG5
 iRyLMOppS86OCgk/fdDDwCSr0I+F5xxAaLYVeJbJiueKQcvYNLE0ZmP7Ic2zY2lwJkpV
 WVN9eZgi6J9X4S8l+m0uR963uAMIPFfVD7C9X2trUMxk2IRUdHmw4gd8unQ3wFgw6+DZ
 4+ySwYprdee8lx5B8aH+Z9rdtxKbyXJ8kbW9W3E+PDmMnNWwdZiq5i5eBgdcc5/AOOMs
 TjycZWJyzEZVyBqbPvj8YcJcP5XOI4OsxAo2MqfdGZOgCFKWiBJZmJZDT3z3JmIs3CoM
 6lYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/FTEtmd/58pNeLFllEkUD79JshgLlBkp3WoApcXP49AA1pPvTZUtt7smJj5llBDQUe04NMG+0qSQ==@nongnu.org
X-Gm-Message-State: AOJu0YwxX5zsNsQcUS342d0hnmkuFC6hX4+rpkvU8wc2qpKgad32srh0
 /UW7DuURRknTbcklV2HD0B1lvY/Voppwv0qj0VTRIFCCCQwu1bzeeU+/
X-Gm-Gg: Acq92OGQUs4B4txOSAY/LORw9fkGwJxnMkgQH4VZ6GZYnJoNZqxvgspwMEdoqEDq76w
 BmnsITqFJqORKLO+gDMdHUxOo/AASabV0iOWZtFshDoaC2+rTLNh2al2Go0qQAaskXF2go+wYzf
 9zhy420G5pflYHy1B73qRu9m6GqlbiEHeXJyGdLCH/8Vp9V+BOpRfEDJWjMtr7Joulc0b30AONj
 4Vpd/Xg+nI1KrsbJAI68aZa10oQXt7WEQYwNUWoNk4VmmjYF48oa/IvcEQVzrP3xKzOCSBZLP+M
 5y72C+yPjU7lAP82t+HixkYT7F45eDmfDrxQ8DL6IrXZavwAEabCqJw0DvJJMrP1OpdqRGs5hkl
 2aiiVa3Pc3Kn70dpDqx+EFugqAdyw5zyX8MJRxjOtuRWJg/8WOJ0a8ufCyWuWEkIqBO+uvyM8wC
 MyZfbacCG8ci8/523y1+DUF01vvU4X06NxXt3xO4U/quaEQGCHt/NRELgPhch+ACM=
X-Received: by 2002:a05:620a:4707:b0:8cd:9033:1724 with SMTP id
 af79cd13be357-911cce886fbmr3068237685a.9.1779209305083; 
 Tue, 19 May 2026 09:48:25 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:208b:c9c5:39b5:dd2b:4560])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-910ba182535sm1880223685a.8.2026.05.19.09.48.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 09:48:24 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 0/4] virtio-gpu: enable Venus/Vulkan without OpenGL
 display
Date: Tue, 19 May 2026 13:48:18 -0300
Message-ID: <20260519164818.22982-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <874ik3d6gq.fsf@draig.linaro.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=lucaaamaral@gmail.com; helo=mail-qk1-x72a.google.com
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

Alex Bennée <alex.bennee@linaro.org> writes:

> I don't see the r-b on the patch.

It's on the v2 thread for the same patch (then 1/3, unchanged content
in v5 patch 1/4):

  https://patchew.org/QEMU/20260311022752.64192-1-lucaaamaral@gmail.com/20260311022752.64192-2-lucaaamaral@gmail.com/

I'm not familiar with the convention here -- should the Reviewed-by
be re-stated in the cover letter of each respin, or carried only in
the patch trailer of the next version? Will do whichever is standard
in v6.

Thanks,
Lucas

