Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3780710lfm;
        Tue, 30 Jun 2020 02:29:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3jMGQgW0B34vFw/6K7J5x08cbTgKDCBX74fHb4ZTHDjmxi1W0DzijRLTr4zHWNuVkr1GC
X-Received: by 2002:a25:e812:: with SMTP id k18mr18452027ybd.62.1593509360043;
        Tue, 30 Jun 2020 02:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593509360; cv=none;
        d=google.com; s=arc-20160816;
        b=p2C6SMfuuYu4OhJCvNH+f6JtVHuYIeL3Pidts7vmJlhI8T2LIqSmUqmpCSEqz1H1Pe
         +3raP68laVmnHY/uuxmuBi1JMw1mCW2y2jZyRpa0lfoGfbFB/xWBq+K0NqNlqyYjnXIz
         xAL1fIQJyayPOHkG5kdICctUvau6IZaxHrnGFSWk+8G807u4tF4Gw/rTSRd63WLFJVfa
         SwHhMg6R21tJ1HkrNSejMLtStjOeaZF/wpJ/t2RTiRBf7iJ8+97Ghond5jiKnJ74w+xP
         4KTJ4VXn4khvkCc7CzXODsGa/fikq0TktAnOPSKVSPElfMGTa/EBSde5HkDC+JvQ6CwZ
         6Y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=mcvnlQe1R9yvYzfHbvW4W8qErrPOOrx4jLzOlsECtWM=;
        b=CblJVIhMQZLEt18au7X2Mf3KkoY4oLN4rHwmlIN0Bt9/yD69vh6m+jdAIodJyOD9FQ
         eugCn50riXEJ1MlCVvrj//QC4/+mt5QzopI/P3lKyGWK7aNBslrk/DmbIaNvcayAm1X/
         M4g35V1DnDEjQXjfn0TnLJSefCXfDxmJ9RZR4IvaYi+dBibAiQdU7pY3h+Fm8A7JNn9A
         x95JcSgItLbFOnnQKCf3YelnJt+pI2X3UMYk7Jw+G0xxc2BuI3D+sLgJrP3NdkQRqvgr
         VPfw4QdJVpoJQA8gI2fyadprFz8DybV/k7/Nn+1LqCBxYuuF9/hnmwulBCXmY2G1bO7G
         v1kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IBcf4MHC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e63si2254187yba.164.2020.06.30.02.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 02:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IBcf4MHC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqCZr-0002yF-Et
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 05:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCYl-00019U-DP
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:28:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54048
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCYj-0006t8-Ip
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593509288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcvnlQe1R9yvYzfHbvW4W8qErrPOOrx4jLzOlsECtWM=;
 b=IBcf4MHCK33CO1LERs0y85lA7XD2h4xRQ3ICNxTHd0xbuoP4WLHeQQNhoNDcE5IzIA5dHF
 oSmv2MMRTdEiSQWA5e8P1eEyXV/69CPNqeg7R/FsMF49zdOjoSQ0bPtMkhXXoE+Fbh/q7D
 KzQK+hwN41x09FKs8Faw+lok6GNjE9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-1eluJmn7OMKWEm3zo487yw-1; Tue, 30 Jun 2020 05:28:04 -0400
X-MC-Unique: 1eluJmn7OMKWEm3zo487yw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB77879511;
 Tue, 30 Jun 2020 09:28:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B73775C1C5;
 Tue, 30 Jun 2020 09:28:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 402D411384A6; Tue, 30 Jun 2020 11:28:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/5] hw/i2c/aspeed_i2c: Simplify aspeed_i2c_get_bus()
References: <20200629173821.22037-1-f4bug@amsat.org>
 <20200629173821.22037-2-f4bug@amsat.org>
Date: Tue, 30 Jun 2020 11:28:00 +0200
In-Reply-To: <20200629173821.22037-2-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 29 Jun 2020 19:38:17
 +0200")
Message-ID: <87r1twhpi7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:00:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eW3BDzvDH5Qe

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Simplify aspeed_i2c_get_bus() by using a AspeedI2CState argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The real motivation seems to be simplifying the callers: every single
one of them casts the argument from AspeedI2CState * to DeviceState *.
Pointing that out in the commit message wouldn't hurt.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

