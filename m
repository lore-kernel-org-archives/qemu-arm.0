Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5701264lfm;
        Tue, 28 Apr 2020 09:12:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypKlF7Z+RxPZdBXdHYcbhpbgrzUd2E1RTA7ozxoXC29qcciXv3Nm5a1OpsbR5Lml2YeQJG1W
X-Received: by 2002:aed:2d27:: with SMTP id h36mr29508488qtd.228.1588090337414;
        Tue, 28 Apr 2020 09:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588090337; cv=none;
        d=google.com; s=arc-20160816;
        b=F6MIY+9BPr1z5Q9FfoJMw2Epa5eiTR4s8EyhZu8aHvhFmjpyJ9nGPjxh69XT0TEIJt
         62pwCGYXiujjB+E8mLpW2wAyRfHIGqedan6Oygc4So/azI0W1PsI7jrNkDXigQztQDhC
         LmLyJexnqVAylnXaNT+BPZyVmgBW+GJP5GjcxQ6qUFfUwdH2YCIV2ps2A9feh16Agp4+
         J/hXNcOiHCpQEn2ZeeJgCpN2RjhTxu15+7J0hnllBDXK1335dlocN+I7r2T8Dcv7Ih1j
         o7CeLLAhWdFqZKt2z32AELT52LY7+GYQ6/f/Ji2PjdtLQhU+vPtwVnDA2u+8Eg7ke7jJ
         ueLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yArlMeJLEqclMBk/jDgf3oGNxTygsUNwmienflwMm3k=;
        b=v/5iHWquLs3Mpige+B5R0xVyEIdGp/euBJctumGT2Anco3avZLO+clWlE/QTLV82zB
         IYEa2nN5tTsbjgDcgN9JiZ6toHor3etlsaxxKV3GDra1KiBoBEkBVFfzs86l0Fr9KiAa
         dQQo7cDsFBB/t5ns3dIQJqp1d73ePZdH4fyoXb8pSZBx1B/9w3s7E4OF84XTYiG47C1T
         JxN1RZOCD5U6O5QGl4Tgg2ZsV6vUZKmosOA9VM50NJqkbihNyhZSviGyjGGPSU+AJdmU
         mNUjJRcbjJfWvWnLexZOoQpkPpgo8mIVlvDwBwO2RBKY7zqyE0INUf2C9+wO1VT66jC1
         nfgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j0mWZZYF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j27si11230798qtl.57.2020.04.28.09.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 09:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j0mWZZYF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTSqG-0006vv-KK
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 12:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jTSkV-0001Ld-3t
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:10:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jTSiB-0004gB-4B
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:06:18 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:36470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jTSiA-0004aX-HS; Tue, 28 Apr 2020 12:03:54 -0400
Received: by mail-lf1-x144.google.com with SMTP id w145so17363542lff.3;
 Tue, 28 Apr 2020 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yArlMeJLEqclMBk/jDgf3oGNxTygsUNwmienflwMm3k=;
 b=j0mWZZYFnSxj3FZOvyV8jT/ElcHRTsSkFi9e9vfxEedeYPKf3WmKh1wLrg2WXr7Gsz
 pxJNO0LzXHE0H038NF88DlJdrJ9vVONRPsShOgBd3kazspxf8AGr0HqlXmNEKz9MPXAT
 lExW3MMLqxGmfugQkmRtwX7auUGlz+5RZUoXd7FEAEdGUP/GXb7Y0ZXDQG8Qy8IzNtyr
 F0UKCHlJXerP1am8gi8nDmV/DzEWOchrYpD4JvGC4pZ6336MvcAJmmKPsPtHK0mgiHQ+
 Rz3ww2dWWJOPl3iEWgjmgy4Q2o2nKmqSNWmiMfVKrEnrUi2FeK4mVgnewx2xkVXtciCJ
 MsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yArlMeJLEqclMBk/jDgf3oGNxTygsUNwmienflwMm3k=;
 b=A/OOpr+4irl6YBVbutvz8sWwTRd2NKbL7rDRllZoLON8nClr0/TkSoTbBNssJTmz5Q
 rBbGfHQ6MC2e0dqhASlbnHdd05dOHFh3MmpwU0qEenN+EmN5Cc4pZg3TsgFgmgUXkrXw
 baSOegRmgTRsIkR+vbPMFvMv6ZTylfsDPzEppRndltFcqbTeTf7fhpvHbKWucgm5ZpYt
 Ld8yvTeLU3hcXvtTRV+jNTKOQlw8teR15yqwayN5EJKftm3jieJT96mwSOMAH8momys7
 6YufsZmXyPLXrfffSkZg+uPzXE0Thk3/bWAaATBfB5kAxWJT3E/86KG/2p9oTVmBHXNf
 LfMQ==
X-Gm-Message-State: AGi0PuYb2UkE84TeoxjqnnKaxSnDfhN8mkqO43v8tS/prCzfZz6P307a
 xtWGt7IQQenfVIYKv5alIIkYWdXb7lg=
X-Received: by 2002:a19:42c3:: with SMTP id p186mr1473618lfa.194.1588089831760; 
 Tue, 28 Apr 2020 09:03:51 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q125sm13024013ljb.34.2020.04.28.09.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:03:50 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] target/arm: Remove access_el3_aa32ns()
Date: Tue, 28 Apr 2020 18:03:49 +0200
Message-Id: <20200428160350.10030-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::144
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LXdnKcYRK69x

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

Laurent reported hitting the assert in access_el3_aa32ns()
when accessing 32-bit versions of some of the virtualization
regs when EL3 is 64-bit.

I think we got this wrong back then and it seems to me like
we should remove direct usage of access_el3_aa32ns() and
always call access_el3_aa32ns_aa64_any() to handle both
the aa32-only cases and the mixed aa32/aa64.

Cheers,
Edgar

Edgar E. Iglesias (1):
  target/arm: Drop access_el3_aa32ns()

 target/arm/helper.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

-- 
2.20.1

