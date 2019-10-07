Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3652676wrm;
        Mon, 7 Oct 2019 04:06:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxpVx/rK886A0YOE/9Fxu1GKDScG4UqfjxM92MMyKWrYZOVV1GmV4yunn6NammCa7lAkDZr
X-Received: by 2002:a37:9e47:: with SMTP id h68mr21647151qke.136.1570446398137;
        Mon, 07 Oct 2019 04:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570446398; cv=none;
        d=google.com; s=arc-20160816;
        b=SdKc8s78iKfLHuurAK/opbgqhFp6esQbaWfjPy6/PThqeffi5q4GlzGZglXIAdMm5r
         8S5pQ619hPNUSxd3y50L40Ig4PCGiNfp0UslhFSnty8kVk1ygF+FIKptw6LiyBh2vQ8f
         hiH8KH13Lkq6cFM/p8d3AZNJI/PAJ8geTJ2embiXRZjFgjbbUSxetGPgSghD6wniPpRt
         jTo45+GTUxqWE79Y+zOQXYdklqt+PPugbwGqt3CrZoTFdmR6C4iQOEsxbEuaQOLneOMT
         DyV3oakJ9joLKsy06Y1zlqQnslxmmwl0cLhBDuhL5rRMPmawR1QxZ+mT0fW0G25z++Yz
         5dtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=vbnMD/7NoyGaHnMSW14Qkx8O+GIbgDVqSHnOhyMIz+A=;
        b=sIdyCUIFXUEnnDOg+h6MFleqGVvOwwG9VyJ6n4tnHRXz66JM5gYPs738ByNZe6Q5NX
         W6pu9xxlt84VHVuIsYoQ+Hxrm6h6y5TxI1UaNUpo6KkYrfz+lC4oVkMO2fmwycbBQlqG
         G7KFhbFyOEU+63wxcjilFkDzqI0iZ4tuFidsh4rdOtaIR4eJdrzcnXEPKx9cJCZ9A6Q/
         5YpkvQqpNYfB3BKQZdpeK5rfKnvoclYBijPLDAxp+iNT5nYUGDJ+i4ngv5S8hc2n92a5
         xoPNCCLF3z/2MEmDrHsMePwIQn5nc68IlcVLEnBvFHT3LFvsI81k8p9Abf7QtF8Ih/BH
         1hDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D1XaM7vW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y38si12938001qtc.209.2019.10.07.04.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 04:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D1XaM7vW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHQqb-0007TA-EN
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 07:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iHQqO-0007RR-Gc
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 07:06:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iHQqM-0008LH-Ud
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 07:06:23 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56642)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iHQqM-0008L5-Qy
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 07:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1570446382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=vbnMD/7NoyGaHnMSW14Qkx8O+GIbgDVqSHnOhyMIz+A=;
 b=D1XaM7vWx5Jbsq0fp35xs0emQjHsqq/HF2nYpMzSkvKhgDDMrlyIbctWooAX6cZk+zWBrn
 uDMWGXYKvsdwr+Cp+Y+4PLxzxLC8xfFrGs3WC7i6zBj0QLl8BYFI3JwQCw6U9PJekfG8bv
 0J7CXbIjRhe8ZYZNaPQh1Ite+jLR+4I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-qePjSaNtNYSP_COWGq-L9w-1; Mon, 07 Oct 2019 07:06:19 -0400
Received: by mail-wr1-f71.google.com with SMTP id w2so7411903wrn.4
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2019 04:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WpTiXw1PnpBtqLC3a6ReXREa+xqhihGliBVrWTb489w=;
 b=XLdPBC8Wq2ntd7BgjxyAhX7rAGEaTBrN2RvLZlLl29pbpE5iYtQVGU7954/x58X2fE
 /upWAGCC6LEY4j8zM4h/i6A0YViL99YRt/WJGMEAgZIAZxpOwQeBrB7S6VznXIgMi6ut
 /pRbHt20fUYKQ14+rwj6YOaa/LSh6m3ciU2CDOw/cMb75V8fkv9GKBCHiEmSfuNX9q3y
 NiXB/U42CFaTyYewVVOPBrB2TipPCvsTDPc6P4nRMLPaJN5d5RmoO/3982rfXS4z6V4V
 oPFo7PkZsBFHOScVHlyKP7svcYEz7HI5F+0oeKub/bOYUf3oWIkKHXTR8hKZVxS5j8Ix
 RGzA==
X-Gm-Message-State: APjAAAVUozZx1sJhXE3emWxx0i/643Gg2NI1esVBrKM4BQ0P4i4PvPnh
 bpyQIVzzmNORYQsfl1LacPAiwMtQn6dn8l4S/g5P55s5nxa6vChfNYBFY3PZQb9FkViS5wPN9Wc
 RZpHUT/gr7Qy3
X-Received: by 2002:a5d:4747:: with SMTP id o7mr5305937wrs.311.1570446377939; 
 Mon, 07 Oct 2019 04:06:17 -0700 (PDT)
X-Received: by 2002:a5d:4747:: with SMTP id o7mr5305906wrs.311.1570446377603; 
 Mon, 07 Oct 2019 04:06:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9dd9:ce92:89b5:d1f2?
 ([2001:b07:6468:f312:9dd9:ce92:89b5:d1f2])
 by smtp.gmail.com with ESMTPSA id g17sm7228995wrq.58.2019.10.07.04.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 04:06:16 -0700 (PDT)
Subject: Re: [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2 possible issues
To: Jan Glauber <jglauber@marvell.com>,
 dann frazier <dann.frazier@canonical.com>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
 <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
 <1864070a-2f84-1d98-341e-f01ddf74ec4b@ubuntu.com>
 <20190924202517.GA21422@xps13.dannf> <20191002092253.GA3857@hc>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6dd73749-49b0-0fbc-b9bb-44c3736642b8@redhat.com>
Date: Mon, 7 Oct 2019 13:06:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002092253.GA3857@hc>
Content-Language: en-US
X-MC-Unique: qePjSaNtNYSP_COWGq-L9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 QEMU Developers - ARM <qemu-arm@nongnu.org>, lizhengui <lizhengui@huawei.com>,
 Bug 1805256 <1805256@bugs.launchpad.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y5+vGUBnzCde

On 02/10/19 11:23, Jan Glauber wrote:
> I've looked into this on ThunderX2. The arm64 code generated for the
> atomic_[add|sub] accesses of ctx->notify_me doesn't contain any
> memory barriers. It is just plain ldaxr/stlxr.
>=20
> From my understanding this is not sufficient for SMP sync.
>=20
> If I read this comment correct:
>=20
>     void aio_notify(AioContext *ctx)
>     {
>         /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pairs
>          * with atomic_or in aio_ctx_prepare or atomic_add in aio_poll.
>          */
>         smp_mb();
>         if (ctx->notify_me) {
>=20
> it points out that the smp_mb() should be paired. But as
> I said the used atomics don't generate any barriers at all.

Based on the rest of the thread, this patch should also fix the bug:

diff --git a/util/async.c b/util/async.c
index 47dcbfa..721ea53 100644
--- a/util/async.c
+++ b/util/async.c
@@ -249,7 +249,7 @@ aio_ctx_check(GSource *source)
     aio_notify_accept(ctx);
=20
     for (bh =3D ctx->first_bh; bh; bh =3D bh->next) {
-        if (bh->scheduled) {
+        if (atomic_mb_read(&bh->scheduled)) {
             return true;
         }
     }


And also the memory barrier in aio_notify can actually be replaced
with a SEQ_CST load:

diff --git a/util/async.c b/util/async.c
index 47dcbfa..721ea53 100644
--- a/util/async.c
+++ b/util/async.c
@@ -349,11 +349,11 @@ LinuxAioState *aio_get_linux_aio(AioContext *ctx)
=20
 void aio_notify(AioContext *ctx)
 {
-    /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pairs
-     * with atomic_or in aio_ctx_prepare or atomic_add in aio_poll.
+    /* Using atomic_mb_read ensures that e.g. bh->scheduled is written bef=
ore
+     * ctx->notify_me is read.  Pairs with atomic_or in aio_ctx_prepare or
+     * atomic_add in aio_poll.
      */
-    smp_mb();
-    if (ctx->notify_me) {
+    if (atomic_mb_read(&ctx->notify_me)) {
         event_notifier_set(&ctx->notifier);
         atomic_mb_set(&ctx->notified, true);
     }


Would you be able to test these (one by one possibly)?

> I've tried to verify me theory with this patch and didn't run into the
> issue for ~500 iterations (usually I would trigger the issue ~20 iteratio=
ns).

Sorry for asking the obvious---500 iterations of what?

Paolo

