Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1334430lfp;
        Tue, 21 Jan 2020 03:09:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFiF2pzRBzrkeMpWgwP/RASVsuFEvXDc3NSYz1zCsr9wsqvm/bdzfhqwGVxnZ7IaKmrgDP
X-Received: by 2002:aa7:c591:: with SMTP id g17mr3312172edq.341.1579604984159;
        Tue, 21 Jan 2020 03:09:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579604984; cv=none;
        d=google.com; s=arc-20160816;
        b=mOoY4t4enrg6lZTJGKItHl3Kes3t7WXo8GJd0iRk1IchIou+jOQx3ffpqzGHAjWwrP
         U+mNt3Cy0yzJgTfJ8rOpSCddR1B/tpc1XuFSB/PsCZVJ+ie+yhn4FeV638Kz1JMo4Noq
         IwxdvlITqbXhsTgfnCo908j6XEKoolaKAA/y34QKvUL2Y9CSTCO3FpACmjQ3D/Rytg7u
         +8uxwlpkt39siHLyMweozuyJCdMuQ6YbESzvhs7TgTXmjOkoFckB93AplqCV4PdyXOSU
         QeTzMFzoWdCTi6vfMsH9en2Vam9TZ0ur07muGfO4yikb7RyvGpp1BTjT91QEeJD8lnIr
         xeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xXEz7PhStQkERVMKiqaV7Qb0h7hoBdcqu+yYcMWd3AI=;
        b=bSW2Owm+uSq7R87kpjW9/51eDgdZQPHbczEb96vLm54lZylWUqAmRQj2vyp/36mG4Q
         1dfM77kwIBaLkeiFNxdbV6usCoZKAkKWrm/LJdMXKqLkOpOYQjoT9LU0uGO8xkg6oi/e
         ZTjwEtd15j4Kx904P4daBu+Ljvng/Yd8/bF/XJFyOINbUzuI+LGcL9198nMKTyoncLex
         EnUFWTvcEQ5nkDGgsRQ69hd+Vi6aV8/JdNnw658ISmT4Dhvn608r9am6+IJJbZkzAjfs
         7aLNkLlJQCtWn/WBsLZhKgoWsVUXSkgX5vWe7BBZfdEb+SYXKbzRossIA1HOnwIyfM5U
         StqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SvYTNB+x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si28184443edk.350.2020.01.21.03.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 03:09:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SvYTNB+x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itrPi-00010k-NQ
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 06:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itrLe-00044N-KM
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itrLa-0002vK-0l
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55445
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itrLZ-0002v1-SL
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579604725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXEz7PhStQkERVMKiqaV7Qb0h7hoBdcqu+yYcMWd3AI=;
 b=SvYTNB+xFc3bY8irYanOOqqf93prNKz4Cb+71gaEpOk/wqZxYCbnJn6/1yDkfU3+A91fTk
 ygg83djv5WvuWVtGZeQZkWKtGYNJcjaKNcIxbebn/FEDgUKuvs96XhrPZzJ3oYNqvQGPbJ
 BS+ckoPLydyabcQL+Yn0VfE+8MlwfFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-_7zYfEwQPzuFedrPlu-uRQ-1; Tue, 21 Jan 2020 06:05:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D131107ACC4;
 Tue, 21 Jan 2020 11:05:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FF2E811F8;
 Tue, 21 Jan 2020 11:05:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/10] accel: Introduce the current_accel() wrapper
Date: Tue, 21 Jan 2020 12:03:47 +0100
Message-Id: <20200121110349.25842-9-philmd@redhat.com>
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: _7zYfEwQPzuFedrPlu-uRQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PSP3TOHuvq/Y

The accel/ code only access the MachineState::accel field.
As we simply want to access the accelerator, not the machine,
add a current_accel() wrapper.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Reworded description using 'wrapper'
---
 include/sysemu/accel.h | 2 ++
 accel/accel.c          | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index d4c1429711..47e5788530 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -70,4 +70,6 @@ int accel_init_machine(AccelState *accel, MachineState *m=
s);
 /* Called just before os_setup_post (ie just before drop OS privs) */
 void accel_setup_post(MachineState *ms);
=20
+AccelState *current_accel(void);
+
 #endif
diff --git a/accel/accel.c b/accel/accel.c
index 1c5c3a6abb..cb555e3b06 100644
--- a/accel/accel.c
+++ b/accel/accel.c
@@ -63,6 +63,11 @@ int accel_init_machine(AccelState *accel, MachineState *=
ms)
     return ret;
 }
=20
+AccelState *current_accel(void)
+{
+    return current_machine->accelerator;
+}
+
 void accel_setup_post(MachineState *ms)
 {
     AccelState *accel =3D ms->accelerator;
--=20
2.21.1

