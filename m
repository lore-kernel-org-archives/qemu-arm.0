Received: by 10.28.91.67 with SMTP id p64csp1998084wmb;
        Thu, 1 Mar 2018 08:02:18 -0800 (PST)
X-Google-Smtp-Source: AG47ELsAq6TiLfeIJBbk+YjTUxEaW0GFDNyFVNhIUCaf0ljzBhAyZBYmKFt7Gi3BJ6zR5F+vCxry
X-Received: by 10.13.217.4 with SMTP id b4mr1528018ywe.314.1519920138092;
        Thu, 01 Mar 2018 08:02:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519920138; cv=none;
        d=google.com; s=arc-20160816;
        b=uaawoMN4eDv31h458Iy0m0Lbd5JwphEXMZo6NEb+TmvkQOIJdYTaW6P27+kkgL613f
         RRL/ZGkrBzuBnVHRPS2N0pbhLQqOs0cJ49st/swlF4oWysjOgcN314okUoQuKaAzJbFI
         Ns4L5GNhelUs39gtYQVVeXte62rEWE+tLEcyag0fdv8ecmAB9mHKIQCmXT9H9MWTQBtz
         Wl6N9Wh17J8IU2YcstVECpMxRpokuAccf5uya2yHDG2nLehmgrvzgxgO5paSDVYjqXt5
         2eQNYrdLXjc/PUFhewZfHklFNJg2Npbe29lwYYEhN8ZfuSCAjmm6ckKeoEhgNllX3K4J
         /UmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=obGKQsTmsqJO10kyp7+zrkiJhWlk2XV7sdP3ZWSb9uY=;
        b=mO5afxVXX4OvJaPdX9CntzP3sciGMWKLWzpL69rpGxE/LV1eSKVqPr912UWbcd9FGw
         q55AkR4vSj+m0NbNWXKK1ioy8zJNkIMFmbi5nK3ywbqdXcigPqEMNwY2EhRIkQ5jAOe4
         iDz5ub4xNMeHh1/pAPpD40iqKq3nAlRu0oTJl/PyZi4pL0/44z4ow4dttDnRshQbkC68
         JlISGwTpC97XK32/BaCubt/tuP9hHhQWZ5PzKCI8ge59Y9gsq5QWoOp1f/RE2kWpgkYD
         4JQWPPwM6LhUxllTAubNI4Co1BA1545uHqgWhPkzCm0aQ5XX22QnxfNkj9kfDgV1mksr
         jyeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xdz+CE4h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si676276ywf.531.2018.03.01.08.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 08:02:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xdz+CE4h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erQev-0005V1-GV
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 11:02:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erQdM-0004Z2-7V
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erQdL-00049n-1S
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:00:40 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:42418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erQdK-00049J-RQ
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:00:38 -0500
Received: by mail-ot0-x241.google.com with SMTP id l5so5988028otf.9
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=obGKQsTmsqJO10kyp7+zrkiJhWlk2XV7sdP3ZWSb9uY=;
	b=Xdz+CE4h0FPAeJrHlAXOCv1RrbIUspsH4xvRRoThS6e7cgrTO8qqwVWjVVrA0q6VCx
	wqBirNcBcVMOMZ94gsP1QeSgiQPOh0VxXPBLk4H7pENvhiqPjVsWBFi10U24yqd02HHT
	R9uWbM/iUqoDuz9j12X82RWLHXFQqvTjIucgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=obGKQsTmsqJO10kyp7+zrkiJhWlk2XV7sdP3ZWSb9uY=;
	b=W5O1JGo/K2EX2uw85IedJgD54YvSstpf3hDQiNqHlyot5HLFl7KcyM0C6qa/RAt8QO
	cRfIqfQVQjzs52DnqCc04GmQO19QitQh/+biybgbHPUh8ZCYEuPNNRDPJE7XZPHDHw6L
	+mqFoemNmk7xl2MyPlHlyANgcmZt7LBX5uLiWuEJhExrqjTBO9Iooqh0kPsR2o0Bjn5R
	3dYNslwKv3ckclxgv7A30EP3wCu2vwvbo+5VTyWZQnRzGYvroBUAvf2gk7JmyDJNNRTj
	Nd6zwtMoiTB9jGiAukFZRBQU6xPvrQd8ZhuPhiuQfFYdjEa9GRAq4b4O8rRy92JAKVxs
	tdYg==
X-Gm-Message-State: AElRT7F9t8sD+oDP/MPX5vMjU7pq8Mb0GKXKE5+PRMMRJSflR6kQA1dW
	ScPRPQ1I8M+snIqChpB5z73Ea3KTc8/ba3x7K4NZpQ==
X-Received: by 10.157.28.156 with SMTP id l28mr1348995ota.316.1519920037825;
	Thu, 01 Mar 2018 08:00:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 08:00:17 -0800 (PST)
In-Reply-To: <20180220180325.29818-6-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-6-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 16:00:17 +0000
Message-ID: <CAFEAcA-8VnzF5CwJsbfYxUOX87zH_iLS6gM2r1e6PochemNVQQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 05/19] armv7m: Forward idau
 property to CPU object
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SnwFwZdWrmlC

On 20 February 2018 at 18:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> Create an "idau" property on the armv7m container object which
> we can forward to the CPU object. Annoyingly, we can't use
> object_property_add_alias() because the CPU object we want to
> forward to doesn't exist until the armv7m container is realized.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armv7m.h | 3 +++
>  hw/arm/armv7m.c         | 7 +++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index 35ab757264..5c3f406ccc 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -12,6 +12,7 @@
>
>  #include "hw/sysbus.h"
>  #include "hw/intc/armv7m_nvic.h"
> +#include "target/arm/idau.h"
>
>  #define TYPE_BITBAND "ARM,bitband-memory"
>  #define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
> @@ -40,6 +41,7 @@ typedef struct {
>   * + Property "memory": MemoryRegion defining the physical address space
>   *   that CPU accesses see. (The NVIC, bitbanding and other CPU-internal
>   *   devices will be automatically layered on top of this view.)
> + * + Property "idau": IDAU interface (forwarded to CPU object)
>   */
>  typedef struct ARMv7MState {
>      /*< private >*/
> @@ -58,6 +60,7 @@ typedef struct ARMv7MState {
>      char *cpu_type;
>      /* MemoryRegion the board provides to us (with its devices, RAM, etc) */
>      MemoryRegion *board_memory;
> +    Object *idau;
>  } ARMv7MState;
>
>  #endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index facc536b07..189066812c 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -19,6 +19,7 @@
>  #include "sysemu/qtest.h"
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
> +#include "target/arm/idau.h"
>
>  /* Bitbanded IO.  Each word corresponds to a single bit.  */
>
> @@ -162,6 +163,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>
>      object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
>                               &error_abort);
> +    object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }

This turns out to not quite be right -- if the CPU doesn't have
the "idau" property (ie it is a v7M CPU like the cortex-m3) then
the object_property_set_link will fail. This causes 'make check'
to fail when it tries to run the M3/M4 boards with
"qemu-system-aarch64: Property '.init-svtor' not found"

The fix is to squash in this:

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 149aa07cd5..70871eb139 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -163,10 +163,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)

     object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
                              &error_abort);
-    object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
-    if (err != NULL) {
-        error_propagate(errp, err);
-        return;
+    if (object_property_find(OBJECT(s->cpu), "idau", NULL)) {
+        object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
     }
     object_property_set_uint(OBJECT(s->cpu), s->init_svtor,
"init-svtor", &err);
     if (err != NULL) {

which I propose to do in putting the patchset into target-arm.next.

Similarly for init-svtor in the patch later in this series which adds that.

thanks
-- PMM
