Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87476CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 15:23:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usN7a-000063-TX; Sat, 30 Aug 2025 11:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1urtB8-00087b-BF
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 03:05:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1urtB6-000581-Fl
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 03:05:42 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b79ec2fbeso10641055e9.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 00:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756451138; x=1757055938; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cAOhZGc27dkuJST8zP11DmoI//cCNWK0In89yfdGBtI=;
 b=Usq7gCy7WWU9bQ4rkdCDMET2J0i/ktPvoy7cVBaD3jx0VAzxPPWEXhU0A/htE0ZtY1
 4hhIPhlcp5FAx8g5VTxrKW7jk1d4WczqjKXlrrwx9L9EU/vyIeGAhWOTuXmq0W3fXHrT
 TujhNh3y/g+9sMaqm/ApJ41CJ9wUsWAXeR5TqQjDHeZfujjeaUoNPWkIF0ZyxCL0EHoi
 YXEUU3eMCqmTOXNeVTEsbQ2JSok+vLjy7tiOK1waL/KLqnIlSZlQdPhaCSESRgAmtp3b
 2zKjxul/xfxUPiMW+OUudVinxH9rm1rD5gOvzDNPOVkkLA7e3ZHrzMAiu/6ujOdK1NnU
 8w6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756451138; x=1757055938;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAOhZGc27dkuJST8zP11DmoI//cCNWK0In89yfdGBtI=;
 b=MdWHbcBQQWvr9t/8dk8vXD8/uJEnl6KrIAH0U72iSPWI/7Pm/lD4fcZtMV9SmHaA6l
 mu2BoUaBHTaHuNa1SOAWcUGULJ8gq7SAB+bKDTFBHSsvqpfyzSf5I3DN9xvJaUaQyRGD
 xtvbKrwm4F8naJ61AlLUpPaDPAL1Q0Pj9WfeS4/cHR6nxJzsfowucYlSl4JEghHJCRGV
 4Rbc+j3qn8i/ax41h1IaYA27HsC+oL6r9LmNKxh6er07v7md44rIQGSYkOdARSky9LxH
 6ob4+dJjweWXDwsdXbtQRozFmGrtKFbC9ryVgR0GKtt0XI2PpdHHzrijMxCEQ1NLxMWY
 1mqA==
X-Gm-Message-State: AOJu0YwmDTbrU8VMmNuOuy3nkVIHmGjVXjs4j3If62CK7Y72zwoeoSwR
 pd3w13LWoPdiPHK3m3cUbUJ5KWrXIljBOTYuETijb/tJK1/QL+1omWkB0snjZpq38GI=
X-Gm-Gg: ASbGncvXgUrJfMcUhPYaWgFlr/OTmNYQaJ85W/SLStxgV+ohC1kOHLCjzluuIjGxfIa
 dGm/S2/D/RNQz2FbynOV2V/m1TdGBSl3NURkdC1ArYaoRBe8dkAPzCR1FLD9iAwKMFRxuW0K8/A
 ZjggajspdgOnldxcR+MKdMSMD0GDvlujK2XNwVOXkVGfyveN/m3OJ/ugRhXWg5iHp75fYlyOfeS
 1WfpBdTE+jglVFjcA2N0B+kFFQwTci2lQTJnc30V5ElSVcQxxrXTyQ+wtvfeMeGxJtpjgglvmpB
 IYlIVAJtRnu5/Uj8z/+cF3gWoJ//rxXCbs2l5wS4cBbsEkkCj54dEFwQg+qzJbf3IpRYDc1tn9A
 SXdxd9JJl60COb0B9eJYCG8xC+CowGoJPnsTVzPQQafvC1Y7dOPzCJBf3CsqA470Dv0VfR+6V
X-Google-Smtp-Source: AGHT+IGJ1PgFzNy1q7ttXbnzDctuCEmlWCg78sitn7yqV3Y4V4H/seXq6XhyiRDj8ifTEA2XoGJjmQ==
X-Received: by 2002:a5d:64e1:0:b0:3bb:2fb3:9afb with SMTP id
 ffacd0b85a97d-3c5dd8aa03cmr20614987f8f.31.1756451137823; 
 Fri, 29 Aug 2025 00:05:37 -0700 (PDT)
Received: from meli-email.org (athedsl-4441256.home.otenet.gr.
 [79.129.180.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7d1319sm27430195e9.5.2025.08.29.00.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:05:37 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:05:23 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 10/61] target/arm: Use raw_write in cp_reg_reset
User-Agent: meli/0.8.12
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
 <20250827010453.4059782-15-richard.henderson@linaro.org>
In-Reply-To: <20250827010453.4059782-15-richard.henderson@linaro.org>
Message-ID: <t1qudc.3cwx3bccf19p3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x334.google.com
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

On Wed, 27 Aug 2025 04:04, Richard Henderson <richard.henderson@linaro.org> wrote:
>Reduce the places that know about field types by 1.
>
>Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>---


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> target/arm/cpu.c | 10 ++--------
> 1 file changed, 2 insertions(+), 8 deletions(-)
>
>diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>index e2b2337399..ed40e102fc 100644
>--- a/target/arm/cpu.c
>+++ b/target/arm/cpu.c
>@@ -192,14 +192,8 @@ static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
>      * This is basically only used for fields in non-core coprocessors
>      * (like the pxa2xx ones).
>      */
>-    if (!ri->fieldoffset) {
>-        return;
>-    }
>-
>-    if (cpreg_field_is_64bit(ri)) {
>-        CPREG_FIELD64(&cpu->env, ri) = ri->resetvalue;
>-    } else {
>-        CPREG_FIELD32(&cpu->env, ri) = ri->resetvalue;
>+    if (ri->fieldoffset) {
>+        raw_write(&cpu->env, ri, ri->resetvalue);
>     }
> }
> 
>-- 
>2.43.0
>
>

