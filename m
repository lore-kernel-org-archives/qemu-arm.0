Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2408311ejc;
        Tue, 14 Nov 2023 15:58:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8bo2lkTQIDGa+AjR6uThx+YesAMGFmyCTalHsV/pbK8I9UMKNrI7MtKplyV/oNaRZZS0M
X-Received: by 2002:a05:620a:1310:b0:779:ecef:63fc with SMTP id o16-20020a05620a131000b00779ecef63fcmr4043997qkj.6.1700006288648;
        Tue, 14 Nov 2023 15:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006288; cv=none;
        d=google.com; s=arc-20160816;
        b=ppkgGZXh5HgO+QR4zI3p6N+czxhJ/oj6bVNphMaJCt9x5Ie4sy9vwjG4yf8Rbur9Pv
         BU5cBhd4sK/c6O5DgqoMKau0Ar5631KHpCv0TppkWu0Nbu2PxKfgl0ZyiHeUUO84rzx/
         W0zZhsF8DAKwiLs2KO8QT1b8XMa0k0hHrOd6P0DS0JuOsPphnVEta62lPSQTO5IaMmyf
         +Dp8OjLKlFO5mwglg0xfcSSUAMV8/xbeKBGx8cYsjqNSP5XkeOWRvFoFeNON4ocRRyLW
         6kD8RoEJ7HNC6vZJDSos8gAfumjTE78gtiMUI8l+FSNoQyoXTu1AczsSej3aAnprqe+W
         g0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HjR+mV8IECSGVtRW/YEIv2k6pZHa6Lsbyk/hz9urYhM=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=obncPyQ+beD59dvjQ1/9uLhgewMtuIaiv+3tBB3o0EJU3oI7m3E+COL/gTHe/Z+gXQ
         C5AO8RMxXoySmN0t5TQEEY6lHQdap/NcV+76sRMOiK27iCVxowyrRFZv+Ryjmq4PeQSx
         UvB1Ixg3zTooazl1FvdxDB5Bl+pE8lcaaLzKWP/6U6oszI6vpFkQzMOPhJIB6nb8ZYhi
         kn1eitIYRV/qDtpLH5o8bkFURG/p3uFiPAt5WhjQQ1uKL77zUp6h+eDsj7SHCbYtNvEY
         qhxvi9e4+q40QEhbt5PH0+wJ104iRgUfFyhR7PSbfZO0/sZ6HBGzCcUvGO7xCVsbac4U
         LKCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S6pJjecD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr3-20020a05620a390300b0077a0935a8a7si8042281qkn.363.2023.11.14.15.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 15:58:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S6pJjecD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33Hl-000840-L2; Tue, 14 Nov 2023 18:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Hk-00082e-F8
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Hh-0006nQ-Py
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjR+mV8IECSGVtRW/YEIv2k6pZHa6Lsbyk/hz9urYhM=;
 b=S6pJjecDF4UFKISrZAVOHAB6CTP1YeRK81iairaGEJAeTuVX0rikJlk6rrMYlkir0AFoQt
 +/N5OnjMkWMdUVzioKUz8/VDjTLNNc+rBTnoryWhkg+nTEdClDuAWzNWZ2V/itqYOuFEKq
 tQm24TtigGLrXSI8RmG9gbNqDqbUJrs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-EA0TRCVeMFOH4WV3NOy7RQ-1; Tue,
 14 Nov 2023 18:57:28 -0500
X-MC-Unique: EA0TRCVeMFOH4WV3NOy7RQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 348C11C18CC5;
 Tue, 14 Nov 2023 23:57:26 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77CF4C15885;
 Tue, 14 Nov 2023 23:57:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 02/31] target/hppa: Remove object_class_is_abstract()
Date: Wed, 15 Nov 2023 09:55:59 +1000
Message-ID: <20231114235628.534334-3-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: j94/d8SNbJFk

No need to check if @oc is abstract because it has been covered
by cpu_class_by_name().

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/hppa/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 04de1689d7..fc4d2abad7 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -163,7 +163,6 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc = object_class_by_name(typename);
 
     if (oc &&
-        !object_class_is_abstract(oc) &&
         object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {
         return oc;
     }
-- 
2.41.0

