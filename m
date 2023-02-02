Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp241373ejb;
        Thu, 2 Feb 2023 02:12:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8kKQxgA9Cx8ATOXqu7MlfZ6aJfiQ0RHMo7qlOI0IVfvv/bKrbwSTGhQQBi6nPxC2ihdcYk
X-Received: by 2002:ac8:5a53:0:b0:3b8:3a59:6e13 with SMTP id o19-20020ac85a53000000b003b83a596e13mr11132656qta.62.1675332769966;
        Thu, 02 Feb 2023 02:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675332769; cv=none;
        d=google.com; s=arc-20160816;
        b=mrY1ZKpv8dOGt8jGtBPk4xviGPkdddM7e8L4j8HIoP7N8U+tkoZAEk2zvqoEGIEQYT
         zUmzVWLNo/S10Y6i8lIBkY129M3bOI9bUwHUecJcCY9HpeSVb6lwNnOZff7DmIFGdaug
         0BbnvFNOeEX7B1DnXMF8b/q0U2+sK/Nsc5pItwbWdlOW97PmhFB/Y3nZbw8OAPptPVmG
         Rv3CAS1c9SDz1lDGj5nxz/xS7HuRdoagsl0zQ4oKQExFmX3lW6oyGRmR+3R8HECDMF4r
         HYTCLTNXNxyTWSOJ/sPl6eCqduZvE64KF8R16xB3174Qd0KkSSjOuuBEDKeknSppzcnG
         vA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:reply-to:user-agent:references
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=/ob5Yg8Nu/kIpM4kLiGVwqSfmm4hqhAsqiWp9YSvg8U=;
        b=dho2AnCIbQQFR03cTCxQkBft2zIsCEjr4yNOxD1jdNdXnZgCO0g8fyowWhRie+kUDd
         Xu7CEC2X+GyzgiLuu994wdeFqmBPznTjEFP1pPONdhoV0Y4SAzvL1Oy8sQArAWDgbrCW
         X4qLv91KgeBIkZZur/WSMXKTaLcX9L6wzk+8PhRn5I7R9smoxcOG69d+9ELZQ7uyThkH
         zCyT2F8ibCAyYNe+Tb8lChwH1ycwe3CStP2DKUZB5dHqAjFrv69BRE5O+eKFFndHy8v3
         U5rcIpD+bNV4VFV41qBDqTqsPHLL0YvuhMazzbqrWqgVoa08T53rsQtCNcXMVHKKdUwa
         L6RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eFpnA+6D;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k9-20020a05620a142900b007297ce2baeesi2687178qkj.596.2023.02.02.02.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eFpnA+6D;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675332769;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=/ob5Yg8Nu/kIpM4kLiGVwqSfmm4hqhAsqiWp9YSvg8U=;
	b=eFpnA+6D5GtlDI9+CUFkihz6sUJF9k6aTTrAgscmUHD8WX6ZnYdpkh9zQv74CNnxF9B/VM
	26NLn4ECa3e8NmtCeAipsDEN3kI0luLfAqt15SerQTKqigqRWAk57IUOtc86Op1mLAtbvg
	7L6V55F5lnNSCWE5Rkz2ddsaoQwwrDI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-PAXs8dlbNnGeSjq1gyQNeA-1; Thu, 02 Feb 2023 05:12:48 -0500
X-MC-Unique: PAXs8dlbNnGeSjq1gyQNeA-1
Received: by mail-wm1-f71.google.com with SMTP id o8-20020a05600c510800b003dfdf09ffc2so349407wms.5
        for <alex.bennee@linaro.org>; Thu, 02 Feb 2023 02:12:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:reply-to:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ob5Yg8Nu/kIpM4kLiGVwqSfmm4hqhAsqiWp9YSvg8U=;
        b=2lgM8+OA2cwmb22ndQMFe+LC1rvmZbGqvVq1pqaVGm++6qnKEA1f54BceUM+wp7XQI
         gamqKWnzqj0KRKfLrls10nJZEz9RM95wHv/ZhaPffwW6CsUjKIzI8qRmB6Ev48leCcK3
         DqKvBd9nwyokt8M1AqzMswfKA3DQQBI4nd6ReAbf48BnZKx5S9CRNsVsbujlXgiGRkam
         p5k9+Owznkg/B3LehngX5XRW+khGEo6CAYVWIBpL0QKpVYnCf2IZTbsExu3JV1AtGv6L
         5V0+OTiXN3jPoZ4iYNT+GPkFrTOnIrBcZdb5Oe5Py/mG3wPDjLmesCNWMuLc9Pbyjq43
         uwmg==
X-Gm-Message-State: AO0yUKXk97MqNCIwujtgP9VgRjOWiKCdlgYfK5K79vmoGOkgFpghPfwk
	coQcsmh1BaDth2Ro2c0fgNc6D3fWDOWR2Kwc/zQHFHhGMytK6p4XGBN2uw/Sz/3g8sA5HLoKJtl
	9tMi2QlhLwKezGk3V
X-Received: by 2002:a05:6000:d2:b0:2bd:bed8:3b0f with SMTP id q18-20020a05600000d200b002bdbed83b0fmr5021380wrx.35.1675332766784;
        Thu, 02 Feb 2023 02:12:46 -0800 (PST)
X-Received: by 2002:a05:6000:d2:b0:2bd:bed8:3b0f with SMTP id q18-20020a05600000d200b002bdbed83b0fmr5021345wrx.35.1675332766597;
        Thu, 02 Feb 2023 02:12:46 -0800 (PST)
Return-Path: <quintela@redhat.com>
Received: from redhat.com ([46.136.252.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4c49000000b002bfb7c2430bsm19387797wrt.19.2023.02.02.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:12:46 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Jason Wang <jasowang@redhat.com>,
  qemu-arm@nongnu.org,  Hanna Reitz <hreitz@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Eric Blake <eblake@redhat.com>,  Michael Tokarev
 <mjt@tls.msk.ru>,  Fam Zheng <fam@euphon.net>,  David Hildenbrand
 <david@redhat.com>,  Alex Williamson <alex.williamson@redhat.com>,  John
 Snow <jsnow@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  "Gonglei (Arei)" <arei.gonglei@huawei.com>,  Eric Farman
 <farman@linux.ibm.com>,  qemu-s390x@nongnu.org,  Kevin Wolf
 <kwolf@redhat.com>,  qemu-block@nongnu.org,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Laurent Vivier <lvivier@redhat.com>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Mathieu Poirier
 <mathieu.poirier@linaro.org>,  Peter Maydell <peter.maydell@linaro.org>,
  Viresh Kumar <viresh.kumar@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  Klaus
 Jensen <its@irrelevant.dk>,  Raphael Norwitz
 <raphael.norwitz@nutanix.com>,  Laurent Vivier <laurent@vivier.eu>,
  Xiaojuan Yang <yangxiaojuan@loongson.cn>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Keith Busch <kbusch@kernel.org>,  Thomas Huth
 <huth@tuxfamily.org>,  Song Gao <gaosong@loongson.cn>,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
  qemu-trivial@nongnu.org,  virtio-fs@redhat.com
Subject: Re: [PATCH v3] migration: Remove res_compatible parameter
In-Reply-To: <f37db85a-b0aa-b34a-7d5a-b1ab650f1683@yandex-team.ru> (Vladimir
	Sementsov-Ogievskiy's message of "Tue, 31 Jan 2023 11:33:22 +0300")
References: <20230130080608.2100-1-quintela@redhat.com>
	<f37db85a-b0aa-b34a-7d5a-b1ab650f1683@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 02 Feb 2023 11:12:45 +0100
Message-ID: <87v8kktlya.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-TUID: b06G0ZbHS33c

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 1/30/23 11:06, Juan Quintela wrote:
>> It was only used for RAM, and in that case, it means that this amount
>> of data was sent for memory.  Just delete the field in all callers.
>
> Could you describe, why it's safe to change the behavior for RAM?

I will start for the change in migration.c

-    uint64_t pend_pre, pend_compat, pend_post;
+    uint64_t pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending_estimate(&pend_pre, &pend_compat, &pend_post);
-    uint64_t pending_size = pend_pre + pend_compat + pend_post;

Here we add the three to pending_size, so it don't matter.

+    qemu_savevm_state_pending_estimate(&pend_pre, &pend_post);
+    uint64_t pending_size = pend_pre + pend_post;
 
-    trace_migrate_pending_estimate(pending_size,
-                                   pend_pre, pend_compat, pend_post);
+    trace_migrate_pending_estimate(pending_size, pend_pre, pend_post);

Trace, we don't care again.

-    if (pend_pre + pend_compat <= s->threshold_size) {

We do the test on pend_pre + pend_compat.
So, the only place where we are using pend_compat alone is on trace
messages.

I guess we can agree that changing trace messages don't matter.


-        qemu_savevm_state_pending_exact(&pend_pre, &pend_compat, &pend_post);
-        pending_size = pend_pre + pend_compat + pend_post;
-        trace_migrate_pending_exact(pending_size,
-                                    pend_pre, pend_compat, pend_post);
+    if (pend_pre <= s->threshold_size) {
+        qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
+        pending_size = pend_pre + pend_post;
+        trace_migrate_pending_exact(pending_size, pend_pre, pend_post);


Ok, Now go to ram.c changes:

The only change that we do is that if we are on postcopy, we add the

@@ -3448,9 +3444,9 @@ static void ram_state_pending_exact(void *opaque,
 
     if (migrate_postcopy_ram()) {
         /* We can do postcopy, and all the data is postcopiable */
-        *res_compatible += remaining_size;
+        *res_postcopy += remaining_size;
     } else {
-        *res_precopy_only += remaining_size;
+        *res_precopy += remaining_size;
     }
 }

The only use of res_compatible was when we were on postocpy, nothing
else sets it.

But when we are on postcopy, we can send that pages trough postcopy, so
we add them there and if we are on precopy, res_compatible was already zero.

So I think that is ok, i.e. no behaviour change.

What do you think?

> Also, I think it would be a lot better to split the change for RAM
> (s/res_compatible/res_postcopy) in one patch, and then drop the
> totally unused res_compatible file in the second patch

Ok, will do for next version.

Later, Juan.
