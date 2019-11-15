Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp6971476wrr;
        Fri, 15 Nov 2019 07:49:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqx74MfNRQBSDliXfVZH+oi4v3RLMaikNdL5PBsiWsYTtAh56pVwj6T3NahfDMHvHFQLvAVs
X-Received: by 2002:a37:9f58:: with SMTP id i85mr13083321qke.279.1573832987281;
        Fri, 15 Nov 2019 07:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573832987; cv=none;
        d=google.com; s=arc-20160816;
        b=lZgdi5oBqoHDmjPG11vTnnRJ/yxMF+7CHGEplrLdJ74uIn79oHpP+TIxktf/mi02Qm
         ElbAoGZ8Fw1wXxC6Qb+EKF9QD1VUwiLXi436yb2S+zykoqPfYDIBD+D+Q39qp9ReQUIP
         pitLdSMevG8KptLa0JSDDlLOVKnPKMj2K9Mv5xivDW4SJOxhHrlgWen0fQmeFYPY0a33
         C7zS4Ps3P+/Oqr7KlMLcxfxbowx6DI/F6zZ+XwDObs80dBASPw0Cu9cGK7x/rC0gletc
         Y1iOLNZDrufUAPR/2XA7+dZsgZ4QOOE6DSFlvvD88vV995JT89p3PCo2/e6BegJBMIeZ
         UaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=kQemV5htlZ/lDDSIUnrHXnpUKezonJ/3SoZp34SlFOk=;
        b=FmqtgwOkQtONN8sCUWurGVdmW5QRaY6Rk/tvupUJJjoE361LMZDyG+DklGQ2a5mtCo
         Xg/i5dMxffTksip4tKdmN0k/64aChcZwjfetm+ZLCPHw+cynkPe2nn2NbRaO2d3cXcTL
         ObgYmzQVU38BNjg0R8JqfrXqd6RbV96ltJ1YE+Mfj6QmdrYB1bj0G60/Uii9y3cFdw9R
         XL7EDS60Wgl12lU6lgSF62SNeUrYpdEDjEq2q9BGg1/9LbqvqrOGHg8G9LMCU2HMWMJe
         XXED3afoitRBH11zBledLNmAHVrp7OXuDlaM6JhGxfkK53s7aTHAtwuvR0S0YfXp2ePZ
         EWjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u6hQL5rm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m44si5918606qtm.332.2019.11.15.07.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2019 07:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u6hQL5rm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVdr0-0006f7-Nv
	for alex.bennee@linaro.org; Fri, 15 Nov 2019 10:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iVdp3-0004yh-5m
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iVdp2-0008V1-3D
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:47:45 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51642)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1iVdp0-0008Re-U8; Fri, 15 Nov 2019 10:47:44 -0500
Received: by mail-wm1-x342.google.com with SMTP id q70so10112552wme.1;
 Fri, 15 Nov 2019 07:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQemV5htlZ/lDDSIUnrHXnpUKezonJ/3SoZp34SlFOk=;
 b=u6hQL5rm0SuXGfaoioSXKHupqNcKF3EEmBybxHVBygUM093XFTvklSWo+6ihjfPJlC
 zMmbhQMoXn02xjQk3D1iO57Q502vbQo13eytFmPzUBt1dBXwKMCOQRCM8WS55ptDLnth
 P0YGd1wk3M2ig4ufxDHwTtmpUiS0lgcOe5xHKYmOmcdTiH0lYYHSHZlT6YFrQH6hOFob
 7IpL4Ne+v2vbzEkp7ufet3zM27erO2T/KlP5O6McwjeSERN2EdgKT3jNoFfOLZVq2hFz
 ItW/V0mHpFxBXeld7sJNXq80yoRGc7FLL2SMg1xsSRTYGGeETDGpaE2A3i41Ybpv9xLb
 P2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQemV5htlZ/lDDSIUnrHXnpUKezonJ/3SoZp34SlFOk=;
 b=V+gQHRmeHh0XO4myUwbp++yn7a4PY2+865jYxHkl7heOEW7kmBtPws/tCH/eNV7ld2
 iFp5gN/KeNWqEwmrpv5URh9NjyGSlpAUn+ka0BpXmN+IoxQCA2AEb6EPqyHtZx9bMe6z
 fDaR/qEsQ6uvdQcJ8s9Rf2xVY5sGZFJkANsDtbIHeaSEq5FsHRleUprq8bqE5aV3+me9
 ciIGjwQ1SD0lsR6ZGgmX5OsArtrncoh+crJYeIHcW72mG1ABZnT8assAS9SUn18o0c9+
 nuzxWusd5fC/JP3HfKz6b40sw9Tk76bEf9p2vA8iisGPuhB7Gibuo7aJ8LHZkAc+1KSv
 JhNw==
X-Gm-Message-State: APjAAAVNYP1uUwhYR+wT0DYtcXG/JNmEJ3wM+7Nax4lIwxEZpUxr+sD0
 oBIW7mfhV4a+gI0dzZ4ZkQGK/QF/h5g=
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr7614701wml.29.1573832858863; 
 Fri, 15 Nov 2019 07:47:38 -0800 (PST)
Received: from localhost (ec2-34-244-242-0.eu-west-1.compute.amazonaws.com.
 [34.244.242.0])
 by smtp.gmail.com with ESMTPSA id y15sm11649847wrh.94.2019.11.15.07.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 07:47:38 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] hw/arm: versal: Add the CRP as unimplemented
Date: Fri, 15 Nov 2019 16:47:33 +0100
Message-Id: <20191115154734.26449-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ReOFZl47Nnh2

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Some boot-loaders will access the CRP block and bug out
if recieving bus errors. Since we're in freeze, this does
not try to add a model of the CRP instead we only add it
as unimplemented. This is enough to work around the issue.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/arm: versal: Add the CRP as unimplemented

 hw/arm/xlnx-versal.c         | 2 ++
 include/hw/arm/xlnx-versal.h | 3 +++
 2 files changed, 5 insertions(+)

-- 
2.20.1

