Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp521288njb;
        Fri, 13 Dec 2024 07:21:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWhizK3iq9PygkhZjFp5dbSl7MLXa57/GbJb3/140UdBPxCa51l70fG08lGheXkIV/IRwJAItirM/uYpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFoy+tbsOW+vXNjc0xwemooh0NrR69dxVJqIBO2cXv8DUxa8sAVq61MZEHSMc4JXdjsVe9v
X-Received: by 2002:a05:6214:f03:b0:6d8:f50e:8036 with SMTP id 6a1803df08f44-6db0f4e049cmr77085256d6.20.1734103302456;
        Fri, 13 Dec 2024 07:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103302; cv=none;
        d=google.com; s=arc-20240605;
        b=J+icJLSzJfr+VJxwcS13bls618stecXW/PH869Uu3kp4euXa+SuPmg430HYs7Q+YkL
         9E1TsFFb+JdT7kNNaPQ86+cutTLtXqejvH9Aj9G4Ip6L1okzWs1n9VWxnCeEBpbACTFX
         zqDMZphcx3H9zCSX5gQM9wzdKIWJONr1UcEamRD9IktmsUB0P7hdwVKDR0zOjl0valik
         UCOmueQYmpjsl9q3nimJa+mUwTfSbY3+7OOcyhdnGuOoZk+9hi8V8eUirVpY8NfFSZOc
         ZFgtvlkPLkEx6bxaatji0weOZzYUS2XC2CSngQuufpHrlmK3viMDXForjyo1OfCT8dYR
         vhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tYWLPafzihE8PDd+NR4N69DEyaMCy4jGTA3EEV2mGPo=;
        fh=eD28XX2xZ3U0PExQPlhhaUkqHxuRP+VH+Ky8gOzvPUA=;
        b=RDCdB3T2+Rk28wHUQU1BD339n+2glHFPiCGND2vJAPk038BkoUZehfGK5YAg4n0pRa
         ab6WhhuatFx1Ts6H56bncgtdavsWkrCDjPDxdxrLGkoVhNgT0JNXcqSrAtaDMPxbMtVn
         N8q0CQ5+9L900VFGIiDYGC3mp9xwSM75jkIUKSbMDIXWyOrIsGQxzSozYXtHIzMn+Roa
         e6z3YCfNyTV+/85l2SdN/iCk/yUIxZeMqsgFnwDr/sKufrIORrlCZBQ92N0Gco5xyciJ
         sYt1i0D/Cttd8YZAzjomRtetQC4wvcdn+AAdpp+FTLqtwSqlgOYxSyXNiIdQIXoYzHEY
         oK+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=njNv6LB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afe8c55d1asi3312232137.510.2024.12.13.07.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:21:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=njNv6LB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7St-0006o7-Nr; Fri, 13 Dec 2024 10:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7S1-0004gR-Jk
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:35 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rn-0005KC-Mc
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:32 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso369559666b.1
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103157; x=1734707957;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYWLPafzihE8PDd+NR4N69DEyaMCy4jGTA3EEV2mGPo=;
 b=njNv6LB+GMtzbIVhYBUyvt/k8suSjIkWT/KUpHgE1uqstuXs/ziRjkOWPBRBJZBHY8
 z9UcKnrD7qwEczuTE+L3tQrPg+WYIDjzTDyEWsKiqFK3cy09H7NrJDBAzUI9IGWJf08/
 /nWzJ84/4+6CaIzdhAjRJHaFRG5+Wje22rIfW/gJTcKdP56KL954pPPNACxcLb3XzHeY
 dESonfk+GvOK0Wj2OFFwTNDeUyS+P2D2nMrQyJo6zINQwrQMYaCzes5sUE+9esN7EJze
 bejr55fPYiZvQfS+pS7Ow28L9BzP8vrkjVBDRhxsVYKRlLgtA9fCs9QiK8r3fe3uqRrn
 pV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103157; x=1734707957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYWLPafzihE8PDd+NR4N69DEyaMCy4jGTA3EEV2mGPo=;
 b=tMrx6BnNS3Dl2d+gHYHMFz5h6WKeLBFMZ3bh2pYsYAMv8pq9A+KOZj3KjdEsSlW7Iy
 Yu9TLUubpFw4Bx803o1QorW9VvD4W5kNTH7bhuOAVMNAwrCCWaa4CQ2jVJQECBm+0I28
 FgPIvFanbQSP0Alochx0QRQvImtZAQ0PiuqIuy1bsLbkTBtQxCTVDcWo69xFyJkIfp40
 TCMUFRy2Deu139XmIBmp/BoJZ+xH4Ri6qxNV0EGwWgsOoSogZAATRzcT3C8LRcVjqjb1
 8zrqCDjXDV9oBgwHCkXT3B11EVBWeZm3UenXT2gdAC2JdYMGV7jwyJscqTTA4HSWuR0l
 kQoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEVkCqHSdO7A/SpiCNWeyDc3jrjJtDxv7PlRdFUH9oEBvAkxEow0luxvm07fyM2yGRF+Cv4+Eofg==@nongnu.org
X-Gm-Message-State: AOJu0Yw5YdUIhgu0/nHHWGy+ufwFEuujWxlctxhcCDECo5vow4D0arMN
 SmO82j1wrMIuBFsQZYNWBr2WBuf/CZ9z9fWSYuWbWf8vQukPZRSHK8GyMsLvPA==
X-Gm-Gg: ASbGncsczOuV02oTExOAjH+aUI3Hjc2tsrYAdg02fb5cLJKUJ0lxh7cEeoaCCqqcQ0v
 sCXBNovhREAbLYBIWSMeU/Q3p5vvQt9nmKUIqKkf/58/0ofRgaGbYNA1Tt5HQCaAW49rBjHUkWe
 yz+KHOmTOvajby8kTW0ckXxiwvsI74ztXwK24oc7DAiFP87r1Cj4KFtEuahmSvf73FN0I6O+Oca
 AZH7GnIhbXlJ2nstYDL3nPwhfzIwDWGsZb0Yt6bmuDk8gfuJpMk+Gk+CymkiD1LyOiBDuY0W3wp
 gTa4Y/LEr3IbBb/MQJuRbH2wJaooOaln
X-Received: by 2002:a17:907:3da6:b0:aa6:79fa:b47a with SMTP id
 a640c23a62f3a-aab778c1f2emr345555966b.7.1734103157136; 
 Fri, 13 Dec 2024 07:19:17 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.19.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:19:16 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v14 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Fri, 13 Dec 2024 16:18:11 +0100
Message-Id: <20241213151821.65748-22-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::629;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x629.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: +q0G6Vbq/lg0

I'm happy to take responsibility for the macOS PV graphics code. As
HVF patches don't seem to get much attention at the moment, I'm also
adding myself as designated reviewer for HVF and x86 HVF to try and
improve that.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Roman Bolshakov <rbolshakov@ddn.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaf0505a214..09899f7407e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -507,6 +507,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -514,6 +515,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2612,6 +2614,11 @@ F: hw/display/edid*
 F: include/hw/display/edid.h
 F: qemu-edid.c
 
+macOS PV Graphics (apple-gfx)
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/display/apple-gfx*
+
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-- 
2.39.5 (Apple Git-154)

