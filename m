Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2217821lfe;
        Sat, 21 Mar 2020 07:52:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vstDJL/3i5iA6Hy82AlvsUCPO6hXVflEzZS8WjvOwmYZLsRPHOHh+JL7Js+sFtUdwUezSte
X-Received: by 2002:ad4:420c:: with SMTP id k12mr13125650qvp.39.1584802334000;
        Sat, 21 Mar 2020 07:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584802333; cv=none;
        d=google.com; s=arc-20160816;
        b=eUy1ZoAVQbeqPipf8DaR8LRKwPnFpoL/ld6DkCcrvSvhbfCxvZGHNPa/tWrXc/Knur
         ryMGl4h8di/Ezj96K0cNc+TSUBmq6sqCklpdWFaQ6Agwxs14Jf6BeaTZ2q9Dri4uhfJe
         LLGzmWOZN8IIkPAvlF4b98tlQ2BqLtvscylegBJ0ha4+HQQF5uwZlSx7NAmw8ep9kxmF
         oTCPdizxq1fUmeAa9YpZuRLzOL4FGiFEQujcVujqyLXRBIirgxq9w7nZcs+ITrD/5acy
         2pWyE4Xb3BafpAZQWX0z0H+4SkX4Uf1gn4J/k4TPv2e7Z3hMJzfVqgBr5ar7Y2s6bhuw
         IjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=H2ZxNlM8IiHu0dxI+a0SAXUIREttoqtshJPpfqAJ9kA=;
        b=NU2bhZYbA4dxJb+UqIOJA1c1Bggy8o1Q7FaXJvxYCyFJ3avsNNJXvoBuf+hd8tUrwZ
         3t655jm2DF/zZW5qUs4Znd7IEGX2EZ1IqQvmFcfZnVgQpcKpTU+LkJ9TcyHhIlCwwNGV
         BTZaskJI5r+pRDoAxdFrhrrJTepZZYotCgVXbB5NOPB7FSIpjT+gBCmhIciWtkgrGGo3
         hrtUpzyypHprMJzTW50F3loGjhYDEZAQ+eyF8AcmRwVNin8A+cioNl5Lgc4swRRIb88l
         q33HWYG1O0jjqOIvvFxxibheBkhvhdSkhbsXuZwW35zDR+o1tdcbjBwLsJcBxbMc/tEt
         NvPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CbQSYqP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si5909256qvl.159.2020.03.21.07.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CbQSYqP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfTx-00047F-D0
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfKM-0006Ai-3Q
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfKK-0007r8-2A
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:17 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:24411)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfKI-0007p9-Fu
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2ZxNlM8IiHu0dxI+a0SAXUIREttoqtshJPpfqAJ9kA=;
 b=CbQSYqP0divIhSx3ibw/eLW6mVLWzEcsCXp3CDlbsuxvdAn5N7yIqn4NnPD1eAoNgvinWv
 wKpoStnKFZyCNGxC6bD1I1Lu0QU8WetAPH0eBsWVoGTH54NncQ8QlFjRZyI0ay9el0ShKP
 qSGcdqhkyQ/oF4+kUHm8rpETUay+gUE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-0VGDmUDTMMexMYqlm8QMVA-1; Sat, 21 Mar 2020 10:42:12 -0400
X-MC-Unique: 0VGDmUDTMMexMYqlm8QMVA-1
Received: by mail-wr1-f69.google.com with SMTP id d17so4340486wrs.7
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=860B2IkAp+GSKWrMYmt9BxqMmpnco8VZzzV9xEgKT/A=;
 b=hEnhAWMREght4ZFTNVBNmHHx537wugy36rYlGs321uosEsP6BZSpUBvNE+FJ8uJPpW
 P+zeJNNIIiaEgkMk/s4PjuTWW+6X2L3kxIIVmSgpcPc65AqmaOQrQhP1WMJt82hXu90x
 l0gMITdvNoa6xf8p+uIpv5OvDejzE7X584M1yXagYdIQoycHCjawnnInIqriSBMHKI5Y
 3DPNHu1DV8fnExIB9qLMRBDr1SfsJN8QirzYzBJW0oPmFvVYgW0hTW6GS3w9w7np+tL3
 rMWXUiv8XTVC/npgfX8BvEsv1dKv+MG2UU+E65FueLAK3Lm2LWaiX9qALNZRz49kF/8J
 VQRg==
X-Gm-Message-State: ANhLgQ3LoXSYCBjd5de6BhQf1dAF02YtK6i+098Sr+Umc0Ewjm+C+zX9
 X4bDbTGPVbts+LJbOoLzNfcCdZJPWVm+4+FafVKfRqiuPWcq7PuoWKFVlUUqIduZgmCsLSZTDem
 T40bYXFl2yIIf
X-Received: by 2002:a1c:5452:: with SMTP id p18mr17120546wmi.102.1584801731397; 
 Sat, 21 Mar 2020 07:42:11 -0700 (PDT)
X-Received: by 2002:a1c:5452:: with SMTP id p18mr17120502wmi.102.1584801731141; 
 Sat, 21 Mar 2020 07:42:11 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id k84sm13062950wmk.2.2020.03.21.07.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:42:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 09/11] hw/timer/stm32f2xx_timer: Remove dead
 assignment
Date: Sat, 21 Mar 2020 15:41:08 +0100
Message-Id: <20200321144110.5010-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
References: <20200321144110.5010-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iuY3Xp9+y8bd

Fix warning reported by Clang static code analyzer:

    CC      hw/timer/stm32f2xx_timer.o
  hw/timer/stm32f2xx_timer.c:225:9: warning: Value stored to 'value' is nev=
er read
          value =3D timer_val;
          ^       ~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/stm32f2xx_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index 06ec8a02c2..ba8694dcd3 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -222,7 +222,6 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr =
offset,
     case TIM_PSC:
         timer_val =3D stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
         s->tim_psc =3D value & 0xFFFF;
-        value =3D timer_val;
         break;
     case TIM_CNT:
         timer_val =3D value;
--=20
2.21.1

