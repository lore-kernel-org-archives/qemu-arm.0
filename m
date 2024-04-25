Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1278387ejb;
        Thu, 25 Apr 2024 04:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHj4QAI+ilke1oosIFt29AyVilwuiwt2NFzwKa9geC1OaqGh9OyRmixEBFz4bONriVOFfoZNszJo097cj2jGgGSpmS8hvR
X-Google-Smtp-Source: AGHT+IFaR/V1f8JoXFww8ospeFdNcpYNqSirfXPWmsZy5PYF+O7oNnla3ZETKJwn+PKtbqG1a0Y7
X-Received: by 2002:a05:6102:c03:b0:47b:b821:de42 with SMTP id x3-20020a0561020c0300b0047bb821de42mr2663179vss.15.1714042990729;
        Thu, 25 Apr 2024 04:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714042990; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoMW8+c2U+fC9Qz0ofyFuQsch2+C6/+KHhGe4YQ+T17y1tv6guzoPMJOmgaFKVKsPb
         4BwOvinbWYAWTIHTPCZiOLVRx1XU8ZqBQt3i1FSa3mfJAbrIFBt8/gDz9PAhLx4EWDEy
         N42lJOVCKkfZKOQOwjlQ8O5/lXGjW5gwHYj9CcPfbH5h8/jYuI7Hd6xj9Ii89MxZU+KY
         /at/lA62RCEHXYxIUzaFfba5W4RvVn7wznnwhp68oG/G4hl8vfwMiX9oVqL9M62OZvD+
         I6lLrNgarF1yd8f865+PdvvResn4GE+DzW8T3C0MHPEwTYGQmuPSYF4s64km+WcwcKTc
         vc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eiSgNxRXT9EJcnQ8aO7qTnStvPwh3mzz93fTZzoT/NU=;
        fh=MOKVcUN+K0+zqccHitQmp2tjlMJbVcy0Qxc3Hai1eys=;
        b=DfHN9YxoFxOwzo9oywRjZgvkJVFSx9+MOgvHZtN3rSIWnWoUkL5hDC/9JAauT2FzPW
         2VwdbgZxYGjZYL5vsBQBcN/Ajbz0OAyLBa5OSuEYjsZ3u8s90VQyidzUFlXQwJWoXXfy
         IE++fG3v/9tYBzVaD8ekx2mZYCO7TsBxYnC5E5O2BxfqPxFzj+1Jmf4ExY6Bi+cjNKAv
         5O0HKc86X0aYke2hxdei/EtB3/2e1bzXj5Pl2bC+F26DSDiYiYf6Fa0AXEpQhpWOZfod
         1cqn4y8oGYzPUJacquE0xAhZVkSRx0Scl63hdb9THOPpU8vrv8jEOAoDEpmFcXMGPyEi
         0RaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOrNwkjE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w24-20020ab055d8000000b007d6261bdc79si2622547uaa.46.2024.04.25.04.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOrNwkjE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rzwrw-0007p7-OL; Thu, 25 Apr 2024 07:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwrv-0007od-F5
 for qemu-devel@nongnu.org; Thu, 25 Apr 2024 07:02:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwrs-0008Ai-Jk
 for qemu-devel@nongnu.org; Thu, 25 Apr 2024 07:02:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34c1fff534fso204561f8f.1
 for <qemu-devel@nongnu.org>; Thu, 25 Apr 2024 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042938; x=1714647738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eiSgNxRXT9EJcnQ8aO7qTnStvPwh3mzz93fTZzoT/NU=;
 b=VOrNwkjEc18XDYZn+sCdPXF09AvzrAv6uTFbdrdv2L5DxNnyWPIyaLdVGDhpfwYsi1
 kYBOgtZo2EATtxrtPUkJk7axCF1UcOwP+sPAOi9quSXHTl/8pP0rDcaotA1ebdLE8YLn
 794fwgrGxGE0fGgraq79JHMEHJrmi6qSjh2a0ATvlUqnKDMOj16WF+qPUnEMxnjfk+6O
 Rm1Kg7UmsqEMNJI1glB2I04m1v8ab5iZVGB7p539WX/rrkpXA0eG0qzTuZ8oZFHPfUHN
 watrBGVN9V0GnLIajZHkP4DwY05b6OxQvC5xqaUW9ZPaNPJ5Qjs68BxwfXyPCpYMyxyW
 CGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042938; x=1714647738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eiSgNxRXT9EJcnQ8aO7qTnStvPwh3mzz93fTZzoT/NU=;
 b=T+dLKBBBg57vOE121PBtb/o8j/mXbN8mCL9WIqWqsOwOPrtLdviadIyaVTolw7xSho
 au1Xbyv+bmnMtC7yTR+9p2/1L4ckDlB7JhPaAWQHGYrMz6hsdeHV7xaI0EWqn6A0QzNE
 LIioyvJ/AGZR5Cx6NfKTlkqxc8n4ydPsnfV5WERE8iF72FS4FjUJmlDuP3kGgwJYTvsE
 t5uqZDZL0qEUXw0GXrtMkjsDCeoVDwykciTzEDQcTepCrjicuiygR0X/0AcBeBF96Eui
 /RgumpeF4e/2FU4my8okpdg6PMH2Pnwn3bqXOy3CRbreU7z3Q4dSbvzd8s/jor/GC98J
 9YUg==
X-Gm-Message-State: AOJu0Yw1PGSn5JAv/Mbpb4hfRvMsv2F6WNaUvW16E+XJ/UApLBpRPBZ2
 TlbFEMDfRBc9e0J1YKhp+SxgKJWMl1Ec91F9lVlZoyqcr4fYwlEba0cAdEvfZkV9gf2gd9J+YxB
 R
X-Received: by 2002:adf:f34d:0:b0:34c:233e:f40c with SMTP id
 e13-20020adff34d000000b0034c233ef40cmr522061wrp.7.1714042938701; 
 Thu, 25 Apr 2024 04:02:18 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a5d6383000000b00341b451a31asm19488279wru.36.2024.04.25.04.02.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:02:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Maksim Davydov <davydov-max@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/22] python/qemu/machine: add method to retrieve
 QEMUMachine::binary field
Date: Thu, 25 Apr 2024 13:01:36 +0200
Message-ID: <20240425110157.20328-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FoCRWl6mHt3U

From: Maksim Davydov <davydov-max@yandex-team.ru>

Add a supportive property to access the path to the QEMU binary

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240318213550.155573-4-davydov-max@yandex-team.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 python/qemu/machine/machine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 31cb9d617d..f648f6af45 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -328,6 +328,11 @@ def args(self) -> List[str]:
         """Returns the list of arguments given to the QEMU binary."""
         return self._args
 
+    @property
+    def binary(self) -> str:
+        """Returns path to the QEMU binary"""
+        return self._binary
+
     def _pre_launch(self) -> None:
         if self._qmp_set:
             if self._monitor_address is None:
-- 
2.41.0

