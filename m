Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp720389lfr;
        Thu, 15 Apr 2021 10:13:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpPvUs6CC6Q+76fvWX19wIf1rDwt8HolV3aSnfPHpzX+GovB9viKmVWz8s7I7VWUT1MadM
X-Received: by 2002:a92:dcc8:: with SMTP id b8mr3510989ilr.286.1618506819782;
        Thu, 15 Apr 2021 10:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618506819; cv=none;
        d=google.com; s=arc-20160816;
        b=gDEVEHqENXaEoZ6e5P//vzza0j4CYAHKPVylyWMYFT5AdiSMkvkWGK19274GBrjb7K
         Zyqn7WAy5dBDYdCeDNUMz6Kkmqn9LlweaPFVQeeWoLLD+PmqA239UH++AMfLYFjO2kQN
         Bm9gVzQwBMJSTdVA0A0ST3IFJZHSM7FPxvz1DM0QUrRJzNOCF0IWzSCwg6mtjb/rOb4l
         NVwxP4jzen3ka4x5GmuG4WZNqRoiy4jjkJ3CqXot2PF8z2gdItOyzWDCdoN2wv+4W5oL
         4sXmaL4Ecs2/rIjJPuJ3MQQhp8ljq3yjVzXxU6YC3mmDKQ8HptzGRKq9FLh9YnQN4hdM
         t0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=x5Ys7sRuD4s3PZnXr8+EJKY4p5KaQmgJ4cCnBkyyJFc=;
        b=r0qMW9oVdzW3IUyDAo4hKJwH/MWkYKj0a4D6st49cGCrE6XBTnw1SBka0OyjpP/fzH
         Lx6fLCPS51z8f+ylwZhOVgj9zBmwW+0/o29x7BniwRnFntO+sm674Y0YPp3FQVh6v2SL
         jOIWkg536mNzJauU8tm6L5tt2eBrBqPkBWy21tY5w5xr6sX3clPup/WuQddTWDLt2wVo
         AN0+hIYdn22Xop/hQLull2QEBJ1QuWMVXeqoUpBsAnGIF/oU0Mu1wEJqzd32eLttCk3l
         zOr8nQHp+lDFYkBz71No+hi6TBKXPf4PvuonbyAkmPGRpYp7n923EqBmwGGH5QC2rjdn
         G6iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SLGqzCjE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b26si678614jal.123.2021.04.15.10.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 10:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SLGqzCjE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX5Yh-0000b1-0t
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 13:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX584-00041p-J5
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX57q-0002RG-H6
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618505153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5Ys7sRuD4s3PZnXr8+EJKY4p5KaQmgJ4cCnBkyyJFc=;
 b=SLGqzCjEcO2GN81HhP+IjNozPVbpVBN5lWw9ov/8kDTbt0vNCUEktDVP1bc58aowGO9p4J
 /rdB7Hd/ytIC9ZhHFGj9sS+Y1dpS9ythVBdoL4nfGBLZaQ1QUwQy6emzSuBt5kKHTn6ilD
 O43QEnAIZQJqIl7X3n7y/dYSfxClBzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-Fcl2hWEZMjqs90D2C8WubQ-1; Thu, 15 Apr 2021 12:45:51 -0400
X-MC-Unique: Fcl2hWEZMjqs90D2C8WubQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C82A1107ACC7;
 Thu, 15 Apr 2021 16:45:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D98410074E1;
 Thu, 15 Apr 2021 16:45:43 +0000 (UTC)
Date: Thu, 15 Apr 2021 18:45:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 07/12] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
Message-ID: <20210415164541.4t4yjxclkamsopto@kamzik.brq.redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-8-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-8-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gOF1vsYHbWRc

On Thu, Apr 15, 2021 at 06:32:59PM +0200, Philippe Mathieu-Daudé wrote:
> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, only run these tests if TCG
> is built into the QEMU binary.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/arm-cpu-features.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

