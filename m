Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp265146ejb;
        Thu, 5 Jan 2023 04:22:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs72wRM+MxWsPpUesXyUoJgf28X15R2+dEdG4B8kxX7ZkvZe+ZemesePdl3TelA7ctQijOu
X-Received: by 2002:a05:6102:1501:b0:3ce:967e:1243 with SMTP id f1-20020a056102150100b003ce967e1243mr6480589vsv.21.1672921338094;
        Thu, 05 Jan 2023 04:22:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672921338; cv=none;
        d=google.com; s=arc-20160816;
        b=EgH6//ns/61TlfA4IxkSDY2vb3y+HT9F5xzAwBZoWoZHoc10zBAnAueeMZLcNAKIgI
         sTIZ8Ts/SiAVxAyYGbnokULkZU8nST/hriYuxUk9vsiW6uAUQN1I2Eq5eQzmUwxyVfMt
         e0TmsmXhsBlOO+fpTpne/j88iPl1B/xeEbvDFsSXEe6dXU6c7Rmj5EfWAN+/N9LpE2Pm
         CKthnRRp9dAF+y09N+QNYzfz1aw/q/WevGSfrQwA4fPudTGgQoy66fuq9FFdVx6wT+3N
         tSonRhIecFFqkqwoHN2/utBYraMwkm/XQtp8cgq6x6JncxVVfsX2W/3+PJDG1xqYy1nh
         5Xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wSbohjQFOFcZIW8WgzeUD31/UXv5Ig2v5luEIJLWhr0=;
        b=V9GHjik6mPIWGQyeX2kgJVu1Ozq9JOwWJA1l013sPZAqLVmrswudaWq++e/Sf8idHz
         3seTCAEBdkC0HMYgZmVnt972ngpUXA+zX9ZzDyFhMa9UZDu+rRRtu0gdw9yxWK+1lkTQ
         YX1ga1zyA0hQSgxnhj7nhXoOoDcWYGpcjmaji4HC43kMdlhDl3/ZCTvwv5ZQDZjwl1sj
         YWq1QkPTyK7UxMxBtIvsEpFNhzwlR4cMEc7voFIkYUJUAgl8IfKAdE9jq26ozwoOpuCO
         U6rtWyAxebQV2EQZ06iRWffQ38lDoOQs9UhdcdawJUcf46VconCrB8XUbyKt7263d/0e
         FP0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GhFZentP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a280800b006fcc01875c9si11746208qkp.201.2023.01.05.04.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:22:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GhFZentP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDPFn-0001xO-7B; Thu, 05 Jan 2023 07:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPFk-0001v8-5R
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:21:48 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPFi-0004pD-Am
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:21:47 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d15so39181330pls.6
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 04:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wSbohjQFOFcZIW8WgzeUD31/UXv5Ig2v5luEIJLWhr0=;
 b=GhFZentPZIggZxK/p0xAg+7hdvpqBeudsXWz04dUJPDJ29eARcUZ6Oql88BP+OYGcJ
 aExI9HmlAfkwmVJGMtrLDbNNW7KXCcVWk4IlO2bAXg+DlSepp9vG6nvoqo+AOHQ/9I2y
 +P3MtjJijtuSp96pPX3IN/KdtsmQPtqH9mvBq2EnbF6aW97d0QpodkQZWzeMH7RNjCxr
 bO505itQQWGk9cgG/4nNL1gJs1UnU//H4A4wX5fy7jD7KVYke0iSWsMBhKCLG+wAEI4f
 CevS/7cNtM4dD6gNZcsS+MKu2oTD1T+FSRzIM7r0IiyZY5dPUKm32Y7agaVmmc9PvkU4
 ZahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSbohjQFOFcZIW8WgzeUD31/UXv5Ig2v5luEIJLWhr0=;
 b=sobYljcJSbIaLwz6HVCUXeF2RqnkOW5XUkHkoldwKaKmvrN7nYBJlXHMvcfvPakMN1
 aBZvqWMNxnZCvzjQvawTzxdNlKadvU7/ZSDFqRoYdP3+FvLAkovI16jAoEdOJncAm0b0
 m3VtrUaQs2m8inKgTXM5vu8CB9I3ZGl5t38f5F2tTjd7q+YYKHLmhTCYawtV5hpjx2Cg
 Yx4b3a09qMQg6qsJYMyQILtHX21NwyRgn2pmGlzwz5wFfX6q8XY3KrtJWwNEaaGeV8bI
 1eOgFdhnz69GULUPNB54JzocmIzqkWQjnIx23WMZDggPqOXe67LLYM9cqpTzWW0EhvtR
 mxTA==
X-Gm-Message-State: AFqh2ko+mhW/WhaAJgnItQKqgu/LGRJiCGh9mx6Hpceh9wadxanvzOhP
 Ytpk82XbEO4yiQ6ybdy52DOm/OWNhYzfC7ChtGg2gA==
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr3436441plb.168.1672921304388; Thu, 05
 Jan 2023 04:21:44 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-8@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-8@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:21:32 +0000
Message-ID: <CAFEAcA8u-RdHJGw61tN=qkWwwLsDgm0o=BZsEhBKA__cnmw9yw@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 8/8] hw/timer/imx_epit: fix compare timer
 handling
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: T34NyVDofAay

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> - fix #1263 for CR writes
> - rework compare time handling
>   - The compare timer has to run even if CR.OCIEN is not set,
>     as SR.OCIF must be updated.
>   - The compare timer fires exactly once when the
>     compare value is less than the current value, but the
>     reload values is less than the compare value.
>   - The compare timer will never fire if the reload value is
>     less than the compare value. Disable it in this case.
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

There's a couple of minor code-style issues here (block comment
format, variable declarations in the middle of a block); rather
than asking you to re-roll the series I'll just squash in the
fixes for those:

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 663907f9cf9..f63d3a20830 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -161,7 +161,8 @@ static void imx_epit_update_compare_timer(IMXEPITState *s)
 {
     uint64_t counter = 0;
     bool is_oneshot = false;
-    /* The compare timer only has to run if the timer peripheral is active
+    /*
+     * The compare timer only has to run if the timer peripheral is active
      * and there is an input clock, Otherwise it can be switched off.
      */
     bool is_active = (s->cr & CR_EN) && imx_epit_get_freq(s);
@@ -233,19 +234,22 @@ static void imx_epit_write_cr(IMXEPITState *s,
uint32_t value)
          */
         imx_epit_reset(s, false);
     } else {
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
-        uint32_t freq = imx_epit_get_freq(s);
-        if (freq) {
-            ptimer_set_freq(s->timer_reload, freq);
-            ptimer_set_freq(s->timer_cmp, freq);
-        }
+        uint32_t freq;
         uint32_t toggled_cr_bits = oldcr ^ s->cr;
         /* re-initialize the limits if CR.RLD has changed */
         bool set_limit = toggled_cr_bits & CR_RLD;
         /* set the counter if the timer got just enabled and CR.ENMOD is set */
         bool is_switched_on = (toggled_cr_bits & s->cr) & CR_EN;
         bool set_counter = is_switched_on && (s->cr & CR_ENMOD);
+
+        ptimer_transaction_begin(s->timer_cmp);
+        ptimer_transaction_begin(s->timer_reload);
+        freq = imx_epit_get_freq(s);
+        if (freq) {
+            ptimer_set_freq(s->timer_reload, freq);
+            ptimer_set_freq(s->timer_cmp, freq);
+        }
+
         if (set_limit || set_counter) {
             uint64_t limit = (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
             ptimer_set_limit(s->timer_reload, limit, set_counter ? 1 : 0);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
