Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp53817lff;
        Fri, 11 Jun 2021 17:15:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1BoktDG4rAg3Z/QOdR/kdj3dwTnlBhAfFNubv1kE2Jbpi6wivuPAtlEPQPkwf6AYO+InT
X-Received: by 2002:a6b:3b05:: with SMTP id i5mr5128080ioa.135.1623456942669;
        Fri, 11 Jun 2021 17:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623456942; cv=none;
        d=google.com; s=arc-20160816;
        b=mClifyegTGX4IxKENG3bEDaOwUstZrDi/Ry9jK4XnDwrUz8+VJ3A+aQGgvq3+mKKMr
         +Av3k5GePPQDkn3gYdciCwWvIbO/tHZN9HNy36NBeGaW0ipmCfnQIqyvAvSu2bLS9wtM
         KQhTMXKWKLJpJ3BuBBK3cXgzMiOwv6so6j1cgbs2ve/n+q5sLxBDedpRkX4inclxyHoN
         9yplHfc8eRLdy+jmrW2k+C2hcpokTzf3Hf3AJy8eoC2VAQDvOM/BAvEkKepkCW344k9g
         Qv1LcbzKdE2j6ElJKKTRgXGSwAu73cab+ngcsbXmI3ELO6kORULJFJhckC6mpmV4sYtn
         4jgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JlzpSNBwy36z9O6GZXAyDdytUTOP63X4cHyKK0txBRU=;
        b=nal73+329JOdpHrKxIP5r0BT+kdkEJyxKwLjXGFW8y3zJ4I2an4ki13/oOYJYB+mju
         i17ZbV++vyC8n0LzlE/bCLhW9bpwN4VdDE2zb4AvvgC0agfR7+VruObNj7bci/uK1QTw
         ROchAaAlWS8FYp7Oz59kvnKrTZhXdFUWgPWwoXj/bsEZyMsuuqaqVfwkIKDVkk9emSQ7
         /8Ul8feA/bUwfyDfiDtRzf7IPaMBPYWq9zye95A+T2rgTXFftssHgkZDl1SgWV1XlZ+1
         lU72Oi3NzMn1jrvQo9Ky9LZ3CQeVtkRdeKo1XylBBxF3LGykV5Mm0epmI0Euo6fcR+oU
         KLjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmx.net header.s=badeba3b8450 header.b=AwJ2Wb2j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si8858892jaj.69.2021.06.11.17.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jun 2021 17:15:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmx.net header.s=badeba3b8450 header.b=AwJ2Wb2j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1]:49778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrrJO-0001xi-04
	for alex.bennee@linaro.org; Fri, 11 Jun 2021 20:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrqsB-0006Vq-2E; Fri, 11 Jun 2021 19:47:35 -0400
Received: from mout.gmx.net ([212.227.15.15]:52571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrqs6-0006Ay-Qv; Fri, 11 Jun 2021 19:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623455241;
 bh=QbhSxLeKcFBz1aqno/rerDdcDjyI9405VKqcoSqOeig=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AwJ2Wb2j25TZUfY1sLmpzxjcXEMP/4wLzS8NE3tmgJhTQZ9fai/S2MgIRR5+XVv7n
 Unjn6h+xMbOAzRCAzAWYcjPj+RWvlbmFiGlbv3DfHdV3A08niDwM59e3GunZnlha4k
 x9qJrLjDrRSl8P0syb9de401gxXEI4xcmo4D85Qk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N33Il-1lCe3Q047h-013Lfi; Sat, 12
 Jun 2021 01:47:21 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/3] hw: virt: consider hw_compat_6_0
Date: Sat, 12 Jun 2021 01:46:29 +0200
Message-Id: <20210611234631.81314-2-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611234631.81314-1-xypron.glpk@gmx.de>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:znDoEkAvZdWcOR+gBVBQRClwj++qILoM1PS4XZ3m6wwJRYoDPfC
 YaNsU+nJocCSrI7TfjbBvvsLf8ryTBHCfU8ovW+PFj4bNMmxfhMni8H0CThIvGE1n1Q31oc
 U++9nrpCaxSKlwew5ZTKEgDrqucoWPnZ+/S73hTwMT8l/FPHcLSB5AHf+Ll+UR3389lCo0P
 B/ayF6bISbn5kY3zjOHMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w/ioPm30SsE=:MGKnIK9n/b0xnw5zC7ca/K
 /3C2z9S4RmXMDi1KK5S6aZa25qPolGZjXTAjoARLkuTTroGy5zZTWveJNp9ZUzjlealqQ+Q5a
 fo4T6LMDJ4h2h6WZ1oPiZMNKRxEWnkRD5e3CWzbQxr99GmEZjAksA5Y/bcoW4NjfyNNxkI2Xz
 wtHe6O2LkFvFvIkhCW+zGdaJCw7IudPQ+hW5QCiNIRHWMcq74axzdaPEUsgVqMS7XxIk5Du7l
 ogJnwHwWeWxFqBg9yDh7SEKMWo5r6uLA2cuSvNkLVCQ4hflO92t9r+OGzkwY+HYHzkYRkqXJI
 +h3aPW/Oup1Jyy2zCjKKDGigZD4/yIRIcWT2D9VcfGuXKjRiE6YLarxvckDYJVYIUsVZ7QPYI
 8dmUNky1qb+G6FBF560NlpyGwhqOOkL1uKs4ErrgXRtnd8HvI1Tp3B0uK414uaurLzhvktTMK
 AAZ86kSvD9lyDHHM87sm9h1q1coJMtKkzVdJzNki3Fqkq2m9uIX+TzGhN8RjBT/SHy5c4KUbc
 cRRNoO54Ux0n71iqefxxH/wRlv9WfaNzJVPdSyzLwGvopW682I4K+7CdcLB9bywNTdm5iQGFe
 aTX9N+tD78L1hgkkkbhgG/a+GiPmsyC1rnxsvmT4Wd/WujWSuFgxF0FhljFewwn6kIx/a91+Q
 aaam7P454D1qVxHiwbNvpXDUljXfMbWmABGfXML84w6IfXM4Cgod6MCDHOIs9zbi6qA9BRYB8
 5c3dQd8enCJHkZ7z2BH85CPLFhfJdY6UQmOifkCW5EJeo+xDRKsiKxt3NC0LzwVIY5jJZfTfr
 8UFQSaj6sR08RU8CMZilxXld4ZWryOQuYj/1R3XV5ozaiiQgGkyW09keGBj3KV8+90+08R2Br
 7+A0SXrFPptHtw2NJtaIcXVl+rN2Af8LdUFhAGfy2RMbvzSoZVhV73K9OaT3tWO5fZin9GLx5
 ojaGiG6D7sHR/9GjFpyqMCJ+gxmmvY8tAnSEmrP+YGwKi7ZfizOS8UjZHJbZ9BvY1AUxjdSCV
 GAVyT68DpSsl9F3/IQNkdZGYpbHZBpPnFyKW2nsBukuOI210GzO65Ug98zrijq9IHxBB7Qerm
 79Qv4scTEi7kmTHNWGYvVnm7Vl18s7o5Qf1
Received-SPF: pass client-ip=212.227.15.15; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L2X0Yd9TI3m1

virt-6.0 must consider hw_compat_6_0.

Fixes: da7e13c00b59 ("hw: add compat machines for 6.1")
Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
=2D--
v2:
	add missing Fixes: tag
=2D--
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d..8bc3b408fe 100644
=2D-- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2764,6 +2764,8 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)

 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    virt_machine_6_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
 DEFINE_VIRT_MACHINE(6, 0)

=2D-
2.30.2

