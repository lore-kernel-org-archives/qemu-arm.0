Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp938242wrx;
        Fri, 22 Mar 2019 10:12:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOnDBmlkQWuK2iyq9R3u6ZNydNzoLiyEvSNQ8U+fQ/fBOCXiUxLQ2CnNOdRq5dP9jnJRJ6
X-Received: by 2002:a81:8285:: with SMTP id s127mr9189459ywf.416.1553274732760;
        Fri, 22 Mar 2019 10:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553274732; cv=none;
        d=google.com; s=arc-20160816;
        b=UbtDFe2+Wz4E29dG1aISfe/IPna5VUS2c2Us6kUzNzFPBOtVJxwmvpZZwJpTbXslDs
         B20QHL62j05hh4k4M3kzp0hjllcDw0h+J6CHz4ey9Meqe1t/jfWBG1VQ3vWWvCS/VBLG
         Gx3jn3nDY7VZ3/v0HQsT19If+oKkdvEs/eH1ALh8Q4NXcsRD6qwi7l7hRFHKcKQin/Xy
         +4nTJzcAk4QVEuJZhLY8wWUwGOfyCFplK3weUBgA6MBXRD6COjKu4i4NYPleTob6aWU8
         FClH4Zn4adScvuWZEn5kYR699umetMrQMFv2sF+fyr03J5MGF0waeM+d/sYqAp3VTLKG
         OBIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent
         :content-disposition:mime-version:message-id:to:from:date;
        bh=32dAQoSiQ+WFnDhb4+g+kwbguYyh0XPAemXlRdcwQ2M=;
        b=u+DMRjGPhAexYGLnGJ4RwJerlnfWq5bnY+XwYlf2Wmr+nsHRH/6SBRky5oaBLT1FCZ
         LPx7FsvTEwFH3euDWFFavomNPAZDd+RErRP+nsY9IqkATNHXu05TuFGXYo7IayeB+WnB
         6u361G71lHWrL3de+xlZ5hIwAoc1GlSGH5UAnz7rfxSAewk1gP+3ABVSKVauLabPaUrx
         fQCObZocIhW9k5RH1lfTllu0X0kwVYfnuLz7CyfAdVxvDcv2P1nXT5uI7oqoC3gjUjEa
         dxe8QOTYZKHP7olWlqBt6fKvCNIg3KI70Z0jsoWdKs7pR+y+JQhi9ghk3dV0gNFVzKfg
         9mcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w126si2966266ywf.339.2019.03.22.10.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 10:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7NiG-0008Al-7f
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 13:12:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7NSo-0002tX-Mx
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:56:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7NDn-0006ud-IN
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:40:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1h7NDl-0006ho-Fg; Fri, 22 Mar 2019 12:40:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36B9C309264C;
	Fri, 22 Mar 2019 16:40:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE215D788;
	Fri, 22 Mar 2019 16:40:39 +0000 (UTC)
Date: Fri, 22 Mar 2019 17:40:36 +0100
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Message-ID: <20190322164036.ajjnip2xbnrqypu2@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 22 Mar 2019 16:40:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] target/arm: kvm-unit-tests gicv2 test failures on tcg
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
Cc: peter.maydell@linaro.org, andre.przywara@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zxo67JcE0ZFF


Hi TCG GIC developers,

There are a few gicv2 test failures when running over TCG that we don't
see when running over KVM. I don't believe these are regressions - I'm
pretty sure they've been failing since Andre first introduced the tests.
I'm just pointing them out now in case anybody would like to look into
them:

  $ git clone git://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
  $ cd kvm-unit-tests
  $ ./configure --arch=arm64 --cross-prefix=aarch64-linux-gnu-
  $ make -j
  $ export QEMU=/path/to/qemu-system-aarch64
  $ ./run_tests.sh -g gic
  $ grep FAIL logs/gic*
  logs/gicv2-mmio-3p.log:FAIL: gicv2: mmio: ITARGETSR: bits for 5 non-existent CPUs masked
  logs/gicv2-mmio-3p.log:FAIL: gicv2: mmio: ITARGETSR: register content preserved (01030207 => 0103020f)
  logs/gicv2-mmio-3p.log:FAIL: gicv2: mmio: ITARGETSR: byte writes successful (0x1f => 0x011f020f)
  logs/gicv2-mmio.log:FAIL: gicv2: mmio: ITARGETSR: bits for 4 non-existent CPUs masked
  logs/gicv2-mmio.log:FAIL: gicv2: mmio: ITARGETSR: byte writes successful (0x1f => 0x011f020f)
  logs/gicv2-mmio-up.log:FAIL: gicv2: mmio: ITARGETSR: register content preserved (01010001 => 00000000)
  logs/gicv2-mmio-up.log:FAIL: gicv2: mmio: ITARGETSR: byte writes successful (0x1f => 0x00000000)

Thanks,
drew
