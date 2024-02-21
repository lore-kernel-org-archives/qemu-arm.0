Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1987927ejb;
        Wed, 21 Feb 2024 07:25:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWdhj8k9GhOnMDvoxbeboG9FyH6IV/ZsAX0A5Hw/8+dIKliTT+XnYSf5I9jNOx5kD1D8tUrAZ41J2Va1L7MzRh+nu8/7vC
X-Google-Smtp-Source: AGHT+IEFOAXGdL1oumtLqKvA1+CD7OjcgdmqL3ln6MMC/w7B+Wt7LSE2nKGCHOoKRFIJYsFL1TI6
X-Received: by 2002:a05:620a:2199:b0:787:84fb:fd8b with SMTP id g25-20020a05620a219900b0078784fbfd8bmr2172644qka.50.1708529146089;
        Wed, 21 Feb 2024 07:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529146; cv=none;
        d=google.com; s=arc-20160816;
        b=YCb07x9UEddOCJsK7cSm2KtWJeElw7ixNKjp0mgFoZ4V/kZQS5PY+CMun4TxjtkodY
         hvLm8YNutCwmlVR6VSDup6H6YtH9JF6UaUHgObQdhMm+0AW1w3oU3o1hqNhEBwWypAu9
         mBIpsJdTio8dbGfi6l2cgvAeRy4ov3D+7MxjlkClt3LBZocgz9XYGVaXShfFbyc5bO1f
         VkGGc1Okqsu4Ryspk0tmTd0FZDLr3HLDkrPtle9kBBZur+BxVuD2sVhdnzg+noU/VqmF
         uotcZejLPI3eQu5wI2VuI14uD2f/BzsxOBybOkWZfez3VY8GplSPVGr2PsUdjGm7bCdU
         v41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=hlagwSl2YsZuNFzln+6oCnnPHlq+xDD7OxjiWOTZMyU=;
        fh=m/xNVKb0kzgzkpl24h4aD0FdUowHmASrwLdpZffa/MA=;
        b=MmBeg3qASw59D+Sov5RVk5//2ik+phCTXFEqbwDwNfv5CvoAuk6D7Q4MC+rKQVx4q1
         F4SfMxzEFU9XizivSYHD1edBya0Zf5Ch9P07Rmt5OhmLSV/hgce4VS90TxocTuRW3Wei
         RVbH4WqTbyduHLhDiApbsFhDYNz6qv8qX0L5/rULbdyYJejcjfANnS/AGB0Ti8m67v0k
         J7v7xO4ReIe7aGJz+A2Jw9+0rQxUrKU1iETw2EDLYeI8r45dQx++ew3AhOBtW3NaAJN9
         nJUfcEz+F1CqzZ4cc3vF3OSqI6Kxj1P7ZPvOv0Z22lpU140SOqb4myMUIYYZ8zb/8DDZ
         O97g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YOBUnBXG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020a05620a211300b007871632c943si10944118qkl.57.2024.02.21.07.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YOBUnBXG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoSH-0003jr-AL; Wed, 21 Feb 2024 10:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rcoMP-0000sX-IM
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 10:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rcl4k-0000Ai-OH
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 06:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708516062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hlagwSl2YsZuNFzln+6oCnnPHlq+xDD7OxjiWOTZMyU=;
 b=YOBUnBXGwpg4Y+4Q3A47G1YcRaEzhEhk5ZYDqNdYljzVLM0t4UOoeRSSzTnqbWyBGrY0it
 ABHojnFEivkJ52SJYk8HbomFM51rcIRWXsuB+0CX8ZE3iYVWBKimjSeuOfE9dWjtmbPtI7
 10RjdWsEoolt2px9ht0Rc0Ub7VLIyk4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-LUpPYozJM523E6VipHT9CA-1; Wed, 21 Feb 2024 06:47:35 -0500
X-MC-Unique: LUpPYozJM523E6VipHT9CA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBD44863063;
 Wed, 21 Feb 2024 11:47:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E15A20169C6;
 Wed, 21 Feb 2024 11:47:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A98721E66D5; Wed, 21 Feb 2024 12:47:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,  Fan Ni
 <fan.ni@samsung.com>,  Laurent Vivier <laurent@vivier.eu>,  Alistair
 Francis <alistair@alistair23.me>,  "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Markus
 Armbruster
 <armbru@redhat.com>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org,  Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH 4/6] hw/misc/xlnx-versal-trng: Fix missing ERRP_GUARD()
 in trng_prop_fault_event_set()
In-Reply-To: <20240221094317.994454-5-zhao1.liu@linux.intel.com> (Zhao Liu's
 message of "Wed, 21 Feb 2024 17:43:15 +0800")
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <20240221094317.994454-5-zhao1.liu@linux.intel.com>
Date: Wed, 21 Feb 2024 12:47:33 +0100
Message-ID: <87ttm2ujhm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LLYH3vuvci8g

Zhao Liu <zhao1.liu@linux.intel.com> writes:

> From: Zhao Liu <zhao1.liu@intel.com>
>
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
>
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> * - It should not be passed to error_prepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
>
> Currently, since trng_prop_fault_event_set() doesn't get the NULL errp
> parameter as a "set" method of object property, it doesn't trigger the
> dereference issue.
>
> To follow the requirement of errp, add missing ERRP_GUARD() in
> trng_prop_fault_event_set().
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credit:
>  Markus: Referred his explanation about ERRP_GUARD().
> ---
>  hw/misc/xlnx-versal-trng.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/misc/xlnx-versal-trng.c b/hw/misc/xlnx-versal-trng.c
> index b8111b8b6626..3579348a9d17 100644
> --- a/hw/misc/xlnx-versal-trng.c
> +++ b/hw/misc/xlnx-versal-trng.c
> @@ -33,6 +33,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/guest-random.h"
>  #include "qemu/timer.h"
> +#include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "migration/vmstate.h"
>  #include "hw/qdev-properties.h"
> @@ -641,6 +642,7 @@ static void trng_prop_fault_event_set(Object *obj, Visitor *v,
>                                        const char *name, void *opaque,
>                                        Error **errp)
>  {
> +    ERRP_GUARD();
>      Property *prop = opaque;
>      uint32_t *events = object_field_prop_ptr(obj, prop);

       visit_type_uint32(v, name, events, errp);
       if (*errp) {
           return;
       }

Please do this instead:

diff --git a/hw/misc/xlnx-versal-trng.c b/hw/misc/xlnx-versal-trng.c
index b8111b8b66..6495188dc7 100644
--- a/hw/misc/xlnx-versal-trng.c
+++ b/hw/misc/xlnx-versal-trng.c
@@ -644,8 +644,7 @@ static void trng_prop_fault_event_set(Object *obj, Visitor *v,
     Property *prop = opaque;
     uint32_t *events = object_field_prop_ptr(obj, prop);
 
-    visit_type_uint32(v, name, events, errp);
-    if (*errp) {
+    if (!visit_type_uint32(v, name, events, errp)) {
         return;
     }
 

