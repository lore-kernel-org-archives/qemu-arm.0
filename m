Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2088093lfm;
        Thu, 30 Apr 2020 09:32:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypKjKwetMe+cfVakV5OMtyELeUVU9J9sMHpBog3tuf8yte0LYtKJeGhrQjiwdRMT5/I+UAfF
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr3760635qtp.293.1588264343351;
        Thu, 30 Apr 2020 09:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588264343; cv=none;
        d=google.com; s=arc-20160816;
        b=I0WissnysS1rz1BMlcJBrdZrxHI/F4V/8pJisbUJVi+08cizObSU9MMftYAiQsASfh
         h5GEeiKCPqh7eaEXi4WxdYc1D3mT2PfypMsupp7A80WN91fwJF3a+MWFYl90pZoRwdis
         MZueGSefv4sAJUSUu3QtkFqubggzjv6uddHPndCY4xtG5zd/pHPhxG2AzhS38Z3KsqPy
         Q+jqugJ6hT2evGBCi8I3RzTEMUqYZDf2s857G4+CnITRk0OnK1+CEbD9qK09z+8JFin0
         RlB/xrd/dXVGDI07KAB3FnfNPOt9tiUIGKEB3q5ewkEmseE08zyr/mk98xStpYgOJ/FH
         v9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GbdU1HOMrG9CUFlccGTR8R68ycumC+NmUh827HgH404=;
        b=vJC/y2EPheUDEj+ro9BF9HGE/atRjYIu1WYVrd28/3C12/6i0F3FbRslrWK2N0iuki
         BG2jGzxqK4vwsShUXfrmpxWF/csSg8+shsXh67IPbStpmBwIsoyTJT8yzIVPSz6bKCcn
         O/hSHLoycxYpRwnYSeewQiKoev/vCNymSP/+7jcIwPbijabuTzJTJVWHIUqCUYPgK9cD
         v7KBWmY4ccziXcZpSDCha1dVYezwWYqiI8wj6bhqYiGwymm9IRx1dN+g9XQ1OeXZhXZm
         TpAYnnIRKIviIdo7V+1aIhtWc9rKdB5lDew+6jAfen8+yND+sM6OKpK7xQROenGjnDpr
         hKqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XEJKVB+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id v11si16597qka.274.2020.04.30.09.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 09:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XEJKVB+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUC6o-0006Ku-KR
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 12:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jUC0u-0006GP-KM
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 12:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jUC0g-0004MX-DZ
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 12:26:16 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:38556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jUBza-0002SH-GT; Thu, 30 Apr 2020 12:24:54 -0400
Received: by mail-lj1-x244.google.com with SMTP id e25so7159546ljg.5;
 Thu, 30 Apr 2020 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GbdU1HOMrG9CUFlccGTR8R68ycumC+NmUh827HgH404=;
 b=XEJKVB+2wxaGUcKtIi9DiHH5JwRbYS/dTbXLebD4+ZEpBAu+sCEZLqwiIII2FBGo7g
 7bMNzAcOGc9v/+IRAhvVzQf/UYWaEbGuqwVWyiBSvNkxIiyDeqHXQeUyu8uqHnIbbaX1
 Unmv9E7ECKkKtlr4mhjgmfFxOyrvOJxZ+kFdez1bqOViF0qL4STkNay1P6drdXTcPh7C
 qnRNr/32mVwNQTY1QwOgOW46Z9NyGAa+QstTHePHO3l3X1/MkiRm3v8oAPbFv1qvMJTs
 agK8KT5hchYFLrNVNmOEk7HGvrJjr312xtR0Oczq7URH07BGBjFcrQV3vYaFwl0cm7hL
 t8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GbdU1HOMrG9CUFlccGTR8R68ycumC+NmUh827HgH404=;
 b=AoQkOfP+cTE9JHfBk3cRu2IYJWLHIQTqhBSoNWK4y3cY2UvtHADUYzd0MK6FyhL+Vo
 CvLfGGMBlVkAL9HpmiZoU5kzw0eX4RdOnugIqgB6JRKgw7GxIfZpoKObIgzmNToOY3kz
 vAz3VaD25jk31f8s5mvVPaSSCLCPjHxGdi08Ksa1NNs+OXiPSg5XIdWmo5ILYGnyYY6D
 HKtvH62UY64zA+QJJ64lHGnkzwIYr5k1csFu6B1F6Qo/fviOcZO6HD/7W+ypWLNDBOgZ
 Y1Ah3LloOnD1SBdKjILSBsuRoQXzswgrjPdW4B2zUkX3GLqdXC4zUcEZfYjobONXLfcW
 xJFw==
X-Gm-Message-State: AGi0PuY3g4oS+epb4aor8P6+pLaUOC9ZpYiTxlNfsAHX3F6aVnr6UrtJ
 SqtpKsW3b3AcIr6JqaJl+4G/65JfVmw=
X-Received: by 2002:a2e:7215:: with SMTP id n21mr39538ljc.199.1588263892282;
 Thu, 30 Apr 2020 09:24:52 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 16sm147275ljr.55.2020.04.30.09.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 09:24:51 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 9/9] MAINTAINERS: Add myself as streams maintainer
Date: Thu, 30 Apr 2020 18:24:39 +0200
Message-Id: <20200430162439.2659-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430162439.2659-1-edgar.iglesias@gmail.com>
References: <20200430162439.2659-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::244
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, jasowang@redhat.com, alistair@alistair23.me,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com, figlesia@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yl6mofa0y3cV

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Since we're missing a maintainer, add myself.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cbc1fac2b..9f504e32df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2311,6 +2311,12 @@ F: net/slirp.c
 F: include/net/slirp.h
 T: git https://people.debian.org/~sthibault/qemu.git slirp
 
+Streams
+M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
+S: Maintained
+F: hw/core/stream.c
+F: include/hw/stream.h
+
 Stubs
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
-- 
2.20.1

