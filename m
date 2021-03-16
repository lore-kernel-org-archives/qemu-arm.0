Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4836006lfg;
        Tue, 16 Mar 2021 11:55:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKFrvt5lsaJ2RMQXDyswAYox3c5IQJiavR79jDrcPOl4zG1wMLlvhVi+NYAoTuX4JCWO78
X-Received: by 2002:a02:605d:: with SMTP id d29mr86530jaf.81.1615920945747;
        Tue, 16 Mar 2021 11:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615920945; cv=none;
        d=google.com; s=arc-20160816;
        b=iqEGcq0EKqbTff7hpFu43cKSVVTQg0SEJ52aLOFZKkCzEIbSYwh/8vElMR5GSvwEyo
         mpA+xjCl9+cwthwtbixlF2xgnLhl6RH/949moVFb2Y61MgjajBhJa5k6hpGfXXTG/XYN
         mFcBVKFyatrqdQ5EWsspDLlPI0Xs7DkzPC7GY/igO1vlWctJnYHBPlFdUeQuTPW+S0Vz
         UYLUo16lg3JgmTlHpQKiSmGdz01/2DKVlbtHsRfATRxmH+7noGyx5fkt4fRJs7ozGXEE
         XPTT/bNIz+Ogx8b7TbaocKKi1r4bp5rlTpenRp7P2guSGy51IUfuuPK6fGqp80hXpqHL
         jQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature:dkim-filter;
        bh=bbJmYIfUVQIpxeym60+pI3Ext9dWhJxDwEhJwRGb9R0=;
        b=yrAD3ia17BAKUzpvuRrmWu7O6Q4IDdSjndg3Jx6KdttakYdc5++2KFMVRtC9e+gDxi
         HVDHKBPW6JwT49QbBP5s+owbALedHJaFCuPjk4Fpmw2rhpUBvYCbpWswUG4b2S8qrLgn
         Vcb0q9/Dgn2wp5H/59+oxBXu7zJ66yt3kWvoei2hAnMen9saaurnaNezzREGX57Fmn6r
         crORV2qmEltsyClbegcMnVGcMr4yAT+ezoQ+8akA4eVCvmhmlzkfPGVWH+qGsHJRFVZ2
         beenHNx0TcwrrCY/xPVWOyF0RR3jutBE2o0OVdk7YKAgbXFcJC0vDtzfDKFelugNK9nZ
         RNjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nifty.com header.s=dec2015msa header.b=ENTKQZMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si387121ilv.138.2021.03.16.11.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 11:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nifty.com header.s=dec2015msa header.b=ENTKQZMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:40318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMEr3-0003J2-2d
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 14:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1lMEX9-00082Q-4w; Tue, 16 Mar 2021 14:35:15 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:55646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1lMEX4-0006jm-4s; Tue, 16 Mar 2021 14:35:10 -0400
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 12GIYWEj017022;
 Wed, 17 Mar 2021 03:34:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 12GIYWEj017022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1615919672;
 bh=bbJmYIfUVQIpxeym60+pI3Ext9dWhJxDwEhJwRGb9R0=;
 h=From:Date:Subject:To:From;
 b=ENTKQZMfjtkGZLLKMANHUbA2zD80Dy4f3N5D5jgSFyp9moLKkFhdU8+HJnGY3l5iO
 vZ0PMkO/gVpb5plewWs/1+I2QZaQdzclaTVVaNSI6fOS+5YE8NdAAiSJuaMRUiRh4a
 O12cqiHfYS5PtqMZOQSoi+EiwB3rgRZmZ0Qzx2QABBO9j9GYsqUzSmkA1DUPOst48K
 9RyuHJOvdQ4WO225LWc4K3er73zLVtNZDCwuRu16y3F/n2zuNPq2U2183ad0BFgUHC
 oB27/yDSWJywIwHCjdx2cfXkr+CuDdlfmfbBkSnJla8IPaRWHwhFXwFiV7PVN1E6K/
 YA/LnKozdKr3Q==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id e26so9407710pfd.9;
 Tue, 16 Mar 2021 11:34:32 -0700 (PDT)
X-Gm-Message-State: AOAM530x/RqsrBI1jvwvZ41cHzdw2CilxthBdKK3fZYQd+qnbddQYIDo
 gypzHxVRKI4KdapbeCjiH+MEM373VzVO1YBivLA=
X-Received: by 2002:a65:41c6:: with SMTP id b6mr874213pgq.7.1615919671845;
 Tue, 16 Mar 2021 11:34:31 -0700 (PDT)
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 17 Mar 2021 03:33:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNASNqCcTLE+hJqpohbh6_TLGZxZ0o8dm14BQSVtrCVCDDQ@mail.gmail.com>
Message-ID: <CAK7LNASNqCcTLE+hJqpohbh6_TLGZxZ0o8dm14BQSVtrCVCDDQ@mail.gmail.com>
Subject: Question about two option formats for netdev
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: softfail client-ip=210.131.2.90;
 envelope-from=masahiroy@kernel.org; helo=conssluserg-05.nifty.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gscYYVtSJZvr

Hi.

I have a question about adding
a network device.


qemu-system-arm -machine vexpress-a9 \
-net nic,model=lan9118 -net user   ...

works for me, but 'man qemu-system-arm'
says this is "Legacy option".


Is there any new (or recommended) form
to use a lan9118 device?


If I understand correctly,

-netdev user,id=<id>   \
-device <driver>,netdev=<id>

is the new option form.

For example, I can use the new form
for virtio-net-device.


But, it does not work for lan9118,
and actually I cannot see lan9118 in
"qemu-system-arm -machine vexpress-a9 -device help".


So, the two options are different worlds,
we need to choose appropriate form
to use a particular device, correct?




-- 
Best Regards
Masahiro Yamada
