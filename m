Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CF8FB44C3
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 07:12:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGAhm-0000jd-Uh; Fri, 24 Apr 2026 03:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGAhk-0000ij-2E
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:12:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGAhg-0006FN-By
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:11:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso71879045e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 00:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777014714; x=1777619514; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MW2/G9TTsYqA6jxuX2jKu1nRSMEGG5MI1HQoXjEOg6c=;
 b=XjTbv05DEEbS8jO72ZgWk+56tXzFrJApbS4nHzLuIu3psury3JvuH7xh8veZYGTMYZ
 XmVRKI4eMh1YDWTvpKro3T9taJJWj5LVeUCBOu/GaeERzEV3imAy9cYi2MhZB1G2vjeP
 RDjiMqId1+cjCu6DYE34xc3sL/pAcPHhPUWafkf7z1wl8XV3/vlgQMyZB+Rd422MsUCB
 eVm4jDQONRHGfRVRvuHS/Ai5FXh5v8mB4xef8J3fRZl742NuK9cifDo3OZCZyq3UNi+b
 vLntInpAgBdILjcnwg4/iUXXZO6HDFEJ6+7KLiEuc7R9HFuCtf/XY9QAnJ/JeAOu4Wl4
 uEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777014714; x=1777619514;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MW2/G9TTsYqA6jxuX2jKu1nRSMEGG5MI1HQoXjEOg6c=;
 b=WPkWrLm3vd7OUx2aGg380Iovx71mLJKPvXsIfgK25gxtZzv15hA834ugu9qDn8mrUo
 GVKxLpAxpTHnWoIKX/8Vk5JGiI2gEiP5hn4WQPyJ7B6AW7eWxCk4gp7x7nEsMEAs5MLk
 KTlp9P8XvTJ8CsLuWdb75UKXbTiQYgVkybEDG0ZJ38irbtipQavqCswOI7YzO3Y7a6Z8
 kprNass1z30I7gxeEtEZlftyomT5xTw0A1eCaSSjMZaLvl7VKrRA3uq4y4HAMgV+SjYi
 UJM4YI4BbMkGjjjj/WAkxCiIU+j4SbUDRnL5+DMn9Z+sYnsvJNrwi5uKRiNzPz+Jv3zU
 2NYA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xtPxqo8/3WOmpyKRBJktVtKBVq/DbTrF+YC7gnY56uRtVWJgLIc9kREbufrmRI6igRO22YD4EMw==@nongnu.org
X-Gm-Message-State: AOJu0YzyVh2EOZLXU+TzQ0O+3bVm+U1bQfvnSwCyYoCdjsCxBNEMu2Bc
 tF2RX8Bak0PYpdlH9ap1ERcShBTSZAwOW6q8fjaNx4a83/keZR9o2ipUeznMnptyavk=
X-Gm-Gg: AeBDiesvXdvRos27Or9MAyoDE3/awsO7u9m+Gbyr/5QVyti6cYOwiXK5AwVFiD6gPxi
 BEylrEcXc/yhgzSYBnw/35i2p8ojnK1YVR1AZJbfx1tVICeTiJ5nUqwZc3z/lTfiehTa3guMK35
 /0i8Yozyr4SkIgpGKTDKa9IktoqwYwZn6tVRpLSUmztlmbfjyS4VHAb1dU9a/7WLfu/67ftqm9P
 NaUArJFOG6ql9wj6y0yIbld6DSXAO/YyEnCjIElvogz7VhU2nxdBSZ2HMEnA++9bl60vzARBNc+
 ZbfSQ1rOJQ2wtIBvwzvTSBT/NAJK1yIc9Y0ZbCX5PfLK3Eb2AkV3IsweBvevs/XkgTzNGK2/1oY
 mgQsKK3iVcAhbeYd2fsJyPNZFndezlWjvjE/f1azF4xvCPSQDIMRh7nr5ArA1S2QGmLX7flOb3r
 nYzmNy/byRWt6EWwhO4iNL5cBG1Xvc2bK4t2Gwm+Vl5JQAY2eOmJ6BpmeerVM1mvvF0LWBG/9Yh
 Kp2vZY/3uLShoFP4vF9NpepN0cJniGD7GfK+DoWAOpX/nMUYyhhZDGB49Qbbg==
X-Received: by 2002:a05:600d:8447:b0:487:338:b4f3 with SMTP id
 5b1f17b1804b1-488fb778734mr334080265e9.17.1777014714173; 
 Fri, 24 Apr 2026 00:11:54 -0700 (PDT)
Received: from meli-email.org (athedsl-338307.home.otenet.gr. [85.72.177.33])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc100162sm590075955e9.5.2026.04.24.00.11.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2026 00:11:53 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:11:39 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: Re: [PATCH v20 14/15] hvf: enable nested virtualisation support
User-Agent: meli/0.8.13
References: <20260316130642.13246-1-mohamed@unpredictable.fr>
 <20260316130642.13246-15-mohamed@unpredictable.fr>
In-Reply-To: <20260316130642.13246-15-mohamed@unpredictable.fr>
Message-ID: <tdzlbs.136zmg52jco0k@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32a.google.com
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

On Mon, 16 Mar 2026 15:06, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> hw/arm/virt.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>index 90769936d0..391ec722c0 100644
>--- a/hw/arm/virt.c
>+++ b/hw/arm/virt.c
>@@ -2393,7 +2393,8 @@ static void machvirt_init(MachineState *machine)
>         exit(1);
>     }
> 
>-    if (vms->virt && !kvm_enabled() && !tcg_enabled() && !qtest_enabled()) {
>+    if (vms->virt && !kvm_enabled() && !tcg_enabled()
>+       && !hvf_enabled() && !qtest_enabled()) {
>         error_report("mach-virt: %s does not support providing "
>                      "Virtualization extensions to the guest CPU",
>                      current_accel_name());
>-- 
>2.50.1 (Apple Git-155)
>
>

