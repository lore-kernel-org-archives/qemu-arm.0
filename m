Received: by 10.223.172.38 with SMTP id v35csp5250597wrc;
        Tue, 19 Sep 2017 11:32:25 -0700 (PDT)
X-Received: by 10.55.27.66 with SMTP id b63mr3132447qkb.338.1505845945865;
        Tue, 19 Sep 2017 11:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505845945; cv=none;
        d=google.com; s=arc-20160816;
        b=zHWnWBbATfDX0vnpHUrLPGFaUXpvo2LXZwBEpZXJfFybPbf9dCLGOlpMLwvEF/OP2A
         t4+maxEIZaAiNC8UgkPFJ3jGkhGvHN8uju6VK/FRBNakGjbfkJcIGY8ycIy7n8mOYiVt
         q9gNZngVxQedCzXyUcEzL6SfWuQrJeW2mJLSCDMVrtt6hLTwycr5NRLdE2vIwBUcAGS1
         G9yJJWdxR8EHXCApNuQbl52UiDIMSIKDUFEf93tdtqWAtYL5KBnUqG4qBvYPYQ9LVqq0
         lpTV14mZyzav+n19APNgCevSEewlo3nxgadOIpTdndmF4hLvMlFv7BdDmaqV/GLXktFv
         3+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NlyGwrGBShUp0VZmPB3XJvAWyqtCTRlPHjp1c1Jg84k=;
        b=ExqR1LkSlLXoTQjf1IIL+Z4hFEFt4nmbcTWoezIeZZ/KIs6PQcmfFPURbIWzAjHFxl
         M59tWOGBRlkLHebaCEPBusHpu4Lxmb1Al81egExoFipofu34fPeHJHynsqC5AbBFy3dx
         Y9C8HNXsvm3K1ZUYRR8yMsOBzINReAS9VEYOmr8WtzX84eqJiRIAxlVaQymshPRO2zEn
         6iZoSMrJCOXQ7FN4oaSK11yAcxWBb5hC+2B2TLGe/vritwMZ1j+8S8VoFus4Dn3bUvxO
         Lu4RoBDuHHum0V+uBXKfJx+YlNLftkuAQrEczpr4LM+UsWodKcdf8icRKT6xB0h7rM7a
         AwJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sf6IkNOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q74si9629570qka.28.2017.09.19.11.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:32:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sf6IkNOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNJn-0007DO-Ht
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:32:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1duNJX-0007Bg-HR
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1duNJW-0002sC-KA
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:32:07 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:44865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1duNJW-0002qb-EF
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:32:06 -0400
Received: by mail-wm0-x236.google.com with SMTP id 189so1150492wmh.1
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NlyGwrGBShUp0VZmPB3XJvAWyqtCTRlPHjp1c1Jg84k=;
	b=Sf6IkNOVgx6BwVcddSz6ujQ5u81OZ1EGyksLZwwbZnH7Fmx30MdbOhATGrx/UdrNcs
	MBIT1J6KtaDNYc7BZjFlIi2aWuGoTs5zOfKpY8g+rtB03lOjxMb2ZlkRjSY0F4m/4OJm
	mtou/fIi2BaujKIzclyYmkkcIFJyGCe2ZcSCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NlyGwrGBShUp0VZmPB3XJvAWyqtCTRlPHjp1c1Jg84k=;
	b=IIMGpO+7ofSXJm7RGXIQzI+j9P2dvWyVkF0Q/QmfqKF5hQbQWcV4jjgAsT0UvfMV1E
	FA36mp4B/qwTP1NV9aJEI3R3zEtVgzD+YcsxC/R/xcUOyfqvfGLcjATHSHZqgHavaVah
	5sKLj7LHN1NeKOCApaGdKyufHwYJNOXRykI+DO1FvOtak3FIzpDi4yXBiGfQKeqV6IdS
	c8IixmFxZESUV9CzPJzPJmI86trOc2e1ToqDgxPa9fN36hqYb5dCDahphQnwwFkQPyyP
	wkCFmO4vGK0Y9a6AhsPjzRHxkqpZYbOo2SbNe28Na3a/OjycWmV1ZDIHznsCe2d5paB9
	rNdg==
X-Gm-Message-State: AHPjjUjChmKUOLlJzQAxkt1F+Be2TvlPxPWAoKJ4yV3tXHjkRwX9Aleg
	kxfSTCeLjj/Hb6iECWE9kfdrM6xLLVjka6k10AtKX91s
X-Google-Smtp-Source: AOwi7QAD8LORL87FXZBAileNNuo7DEeOknCq2yxy+MCllK4g1ukD2YcJRiJPGcf7ZLSHdBVoMobTEqQm+VEGtqjrMVU=
X-Received: by 10.28.166.135 with SMTP id p129mr1929285wme.147.1505845925138; 
	Tue, 19 Sep 2017 11:32:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 19 Sep 2017 11:31:44 -0700 (PDT)
In-Reply-To: <1505240046-11454-3-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-3-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Sep 2017 19:31:44 +0100
Message-ID: <CAFEAcA8hy2Om-yf1QvoE33tB5u7tvs_mLJeUDR1Hm_SLq7WACA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [PATCH 02/19] nvic: Add banked exception states
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0svOYnuBPM8C

On 12 September 2017 at 19:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> For the v8M security extension, some exceptions must be banked
> between security states. Add the new vecinfo array which holds
> the state for the banked exceptions and migrate it if the
> CPU the NVIC is attached to implements the security extension.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> +static const VMStateDescription vmstate_nvic_security = {
> +    .name = "nvic/m-security",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = nvic_security_needed,
> +    .post_load = &nvic_security_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT_ARRAY(sec_vectors, NVICState, NVIC_INTERNAL_VECTORS, 1,
> +                             vmstate_VecInfo, VecInfo),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_nvic = {
>      .name = "armv7m_nvic",
>      .version_id = 4,

This patch needs the following folded in, so that we actually
include the new vmstate subsection in the top level's subsection
list...

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 694b9e0..8793f75 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1205,6 +1205,10 @@ static const VMStateDescription vmstate_nvic = {
                              vmstate_VecInfo, VecInfo),
         VMSTATE_UINT32(prigroup, NVICState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_nvic_security,
+        NULL
     }
 };

thanks
-- PMM
