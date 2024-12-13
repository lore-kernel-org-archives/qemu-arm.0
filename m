Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp520315njb;
        Fri, 13 Dec 2024 07:20:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyVMe9iuRbQqAmOHio44z4oja2gP6ou7gr6RFDMEH0KJOFWl/lj6IK40SdcwXMNDtYVsdzm+UcYO89uQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEbBKX19bK3dvCXGf/XHvh9TWQReVIuXMSncu2DnQ2aEgEQ8qpxBS463MmaNg4035xO8XRD
X-Received: by 2002:a05:6102:370b:b0:4b1:1caf:f61b with SMTP id ada2fe7eead31-4b25db3ae0bmr2915653137.18.1734103231725;
        Fri, 13 Dec 2024 07:20:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103231; cv=none;
        d=google.com; s=arc-20240605;
        b=OQUWgchVNtpa7yd/6eZG8jYyaw3PrFT9MitRSkv6gBY1jpjLhaZ0ebAVgCPeq5NUsi
         a3kDeyJKFhrm+zpxdREfcljZbfgNfEpWFEqFvsDXicYvnS3LeXfJr0PBn1tcHErZY51z
         lve+jV4fn0zUgRAyWr6l/RuZYplDKBvlcA62gfzsPM4ptptgBXBh+wT71+vHVwXKWU3K
         pXxXEQ4wiIJZ7qmY/B/gTXALfgn9KEOXahMBbbd398bjaWDlaBCRP1mCZMDfBxwN9h0v
         wcXaCig+x6rEjPFz0wpWfQFA5jQrjmuqImMe2Gg6DqB6HhWxhA4ofXkSg6m8ZMD1vt8W
         jygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tYWLPafzihE8PDd+NR4N69DEyaMCy4jGTA3EEV2mGPo=;
        fh=9UgoD2O283AoW8AfGTxhW2deOOzn8jhltoXXZUS8zKg=;
        b=RI3jIUq4kEMN3F+k1e8AYumhrXZQZQApN33MnFERLyx32Ww/E9mETqXXvtJS+uke5v
         91SukyABwmB8Ko/EOsXBHsB3i9MqqKGuRy/dPk/LOazDVQzYDS5TgsFSdr9ueETFqGVP
         3yYKNHeQtMlUebJVjBi0h7CJA88LPobrLpKfIHV4jJ6Yujf//Pmsuw8BVirIRkJyTsog
         kqPBXPPyvdgtNhXkRdYf5ZXvUoM2WDJK720tjQtgcPRIbaM0J4h096wBVtkS/rmCVdl6
         7VMcHpCnxGQmvBHjexEHmXBQpvVa7F9EUW2vZ72QUM9l+8kpkdoYSBnnsrDuwvl1Op2C
         ikTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=V9r+s5p1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afdeee5034si3712789137.133.2024.12.13.07.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:20:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=V9r+s5p1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7SG-0004zd-Fj; Fri, 13 Dec 2024 10:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RZ-0004QR-Cm
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:06 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RI-00056L-Ly
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:00 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso308328266b.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103127; x=1734707927;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYWLPafzihE8PDd+NR4N69DEyaMCy4jGTA3EEV2mGPo=;
 b=V9r+s5p1L4qycksOhNx+/1gf11GEMaGtWJzxAb12hwHgzr4QYeswAYbytvBVSsIlnB
 hTGDVxjUNNmb91LXQ8MK9pdw7sPffeo2P9BjwLOuNS2ub9k80Ve11CUHjjL/UDs8G85Q
 k7+8sX4LACYOmKjmCw9S1LYsKdU8GbdfM9MuUzZoB/BXNa8WN6D/tDHY8BmeitgIzl05
 g1OiuIp2XrPGKJ/g38xf9zDP2s+vbYRa2m3Mkh4RyBE/GIDl/NgMPaCK2ORtr8f2zTku
 1WA4nyCzrkpBKex/v1aZogQJMeutMjKylOy+9RUvbrwbb4eQwke/K07VW1KESmz92rsG
 eL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103127; x=1734707927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYWLPafzihE8PDd+NR4N69DEyaMCy4jGTA3EEV2mGPo=;
 b=pNO9SxD/S43iGwtj1n/D9FBrCWIflBmiuMi7aOGPZGEUNQjazAChmvCyrod32wPsvv
 8twWsUCTLS3xZTa1d7ZF6f8gbSu30FdoANgZjqS2S4yeMdJaXRsmu0GsH1pyyCUc7leR
 QVnesZPKXnbt3EJkUDzOWNnAVmNOxKJgpj9E3mngrA705qZkny9qf04UV4JyK0YfyrAo
 IZzSL7Wr+yHGQvE4FxIy7fTvTlg2mn2MFrNqxvzF6TVAQLpaCsaHHKqRWiyQcceMbP7R
 +mgoZLHRoLQf/4CBB4j7ak3kKphEW18H2tvBHOCcdmOUN7EnFP/rXsOQLbLiPFZSEmqu
 aalw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwRbPy97c9dtz7UIAMMublgo2ocpBgRNJTqee2Vsz2X6APwl07Cfe0yPLb5z/3ov5PQbdLwncn7A==@nongnu.org
X-Gm-Message-State: AOJu0YymPKVQzN7HojEQFEBGya3YK6ad7vUq1kmHx1vKJd/l6h99Pic1
 0UQ/rGZUtEc2anOCbQfMiDZ5C5pdKdcTgQ8Gom8WToXFu/ns/vsjaDU5PXFZ+A==
X-Gm-Gg: ASbGncvsqL8XlMkHjM4aUziXgreiQch/MjW39KW8h7ScPx8riZ8SHKMylsFk2hvvVPq
 Ls3VjyLni9x4Ujsk6+FokuNB3owsylGym5mTBB5l8kU4MsbghFDwLIKJul1qMmp06sUErepF/0s
 sgs9BTbCJpkSkb+yntn3Wgf1v67A51zv5TguRnmdSLmfXF1r9uNv7E57H+Ql7J4uHFe/Oa9pxMO
 sixLKXJeDetg2Bhyt6OMATV1OW7bWZR1yS414KeMa5WcbM/Ds4VLX60RCtgHVbwU22Yb1dSbIdM
 M3rtr+GCrThhBDyYIegy1+SnhwJyrQX6
X-Received: by 2002:a17:906:730b:b0:aa6:af4b:7c95 with SMTP id
 a640c23a62f3a-aab77ebc7a5mr331627466b.56.1734103126663; 
 Fri, 13 Dec 2024 07:18:46 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:46 -0800 (PST)
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
Subject: [PATCH v13 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Fri, 13 Dec 2024 16:17:55 +0100
Message-Id: <20241213151821.65748-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62f;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62f.google.com
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
X-TUID: M0bIQgTlpWFU

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

