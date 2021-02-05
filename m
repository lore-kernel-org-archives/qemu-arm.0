Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2077624lfo;
        Fri, 5 Feb 2021 06:53:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw53wCbgw/o/gof8K5J59fO/FEZHl6a+kkkUhuboD2K2cPyFkOb7F2FO+E0zWAjIG9DU20H
X-Received: by 2002:a25:2512:: with SMTP id l18mr7235958ybl.457.1612536828207;
        Fri, 05 Feb 2021 06:53:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612536828; cv=none;
        d=google.com; s=arc-20160816;
        b=pjIKbjBl1ULFu1JrssIfGD4FEYegJV6OG1OT/0c5TGr8vZ14nRehPQipxlw+1BSiE9
         nTZoohMJhkyrTt7pRJ0hc/wg9wlQdc2s5b+SOw2KniRBkoqgdLNUvOImcCiwi8peqm/b
         OBTWPp/z9ebm/JS+ygcBPiBlROLEPOuqQalJ8FHZeYUa09edxNQjvmOiRldxTvjUDKO/
         qikckefqMnonZB+/GKxSQn3ybmKf0so02R+4Va6tzkDFW5wb3RU05TYIX5iId/P22cy7
         WfgLxpatlNt0c6WDWv1H9URm5EzWYbNt8HRLvx1u5uFkhMq99fXzNhcPq79Ku+nqOjAq
         wVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VTiobrg06Kw2JYFRS+iUWcDIkvLt8aRr1C2BOmn2HFs=;
        b=xE7Nhe82ai4bycaK2q8FVxNx1aieSRQjlj8cmDt2qk7/eyiaikodivpQaw78kcCP5A
         dgE+xxiLQXvfkjbp6nk1I6XXcUs9cNIPfOiLfb/AhXJSbJPejPMjLO3dMh4BZDCycvjj
         all68GPpYjXoFi9/fQIUmR59u+aAipm6g8v81teDTKxnoM2fYdxslpcrm9epj+27kNDi
         /xPCqEME+ZCwDh39uOSBz26uUHNR8LROOXMyglHxG2kulX4BnQ8Ib+g/q0nUH0noYMAq
         /8insguWdAKrRVNOthOE7tNFVKN/lhwYV9VvHeYXmU6isaFe9v+/mjRTFNQ0e4+Mxh7d
         h0FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LZS7OU9P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si8772527ybk.322.2021.02.05.06.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 06:53:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LZS7OU9P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82UV-0004YF-Km
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 09:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LT-0002jS-CF; Fri, 05 Feb 2021 09:44:30 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LR-0002SX-Ve; Fri, 05 Feb 2021 09:44:27 -0500
Received: by mail-ej1-x62d.google.com with SMTP id w1so12246510ejf.11;
 Fri, 05 Feb 2021 06:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTiobrg06Kw2JYFRS+iUWcDIkvLt8aRr1C2BOmn2HFs=;
 b=LZS7OU9PLEL3wnLwvFERNy6JvAKSIiCAdy+xNn+oF4+zVnf+xyjHltt8vFbke76Bd7
 Hh2wGfPBvfMLbRZoPyYG87PSF4n69n8IiAws794SslNKP11Kf8+rJHniSyPk3W5vIAXf
 n0O9Qmm+iS594IcAe7pDzP9i1Yjl99VFiPFRJVypPPl6tVhWMpWokoYvV7K6h9Iaq0KX
 iRrEqDnc+lQFW27DItlBjk7BalObRKTV+6BLL/IOdHd5OX+nx8rNkKRH2bAXZJ5bA3RS
 dQ/elnXFBOFnc5TIg2eT2oTHI8iEUh+bZnyYL/4N3XFYfDcacnP3YUShwnUfXxY8GjeA
 2EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VTiobrg06Kw2JYFRS+iUWcDIkvLt8aRr1C2BOmn2HFs=;
 b=giZz8AL75TqzTFKdwCpb60DhPlVzAt9gG/wrtw/gZ1WFjOPcYh0/DSkOh92s4ReYE1
 zYf8LhKDOPmWM5vMOl/fHqo7vNtnFc7mUr1jzQ3EyilyZO1i+R4otjAgxwT4A6pTJSMz
 hvRk+bcnqnqwcieeeYe0VnZq3+QxKPOQfXXZAVacKq6jA58OsRlnxpUyYvbZUAX4HRYG
 XIrjyewwFZCro+QVRFwO1ZZjkgkTJq4jidqbBrlzYgmemJGM30KcRn4LS+QEgvN2Iajm
 c089s4c/iRjOt9vt5kTCFGRjtuv4ChY8Z4WdEL0YpvK8Hs5tk0F7xpXAcDjIa/XsTSob
 rYHg==
X-Gm-Message-State: AOAM5308ILT950ssgK9Ixpc2flD/t7Eefj0dl0Wr35+kYs36a2wdxT+O
 l0/Oc37BNqev3B6TAaOcoyMzbSv+m4E=
X-Received: by 2002:a17:906:46ce:: with SMTP id
 k14mr4448504ejs.480.1612536262018; 
 Fri, 05 Feb 2021 06:44:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x21sm3963731eje.118.2021.02.05.06.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/arm/virt: Display list of valid CPUs for the Virt
 machine
Date: Fri,  5 Feb 2021 15:43:42 +0100
Message-Id: <20210205144345.2068758-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BSC4UAnkRV5U

The Virt machine is restricted to a subset of the CPU provided
by QEMU. Instead of having the user run '--cpu help' and try
each CPUs until finding a match, display the list from start:

  $ qemu-system-aarch64 -M virt -cpu cortex-a8
  qemu-system-aarch64: mach-virt: CPU type cortex-a8 not supported
  qemu-system-aarch64: mach-virt: Please select one of the following CPU types:  cortex-a7, cortex-a15, cortex-a53, cortex-a57, cortex-a72, host, max

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7802d3a66e8..6ffe091804f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1830,9 +1830,20 @@ static void machvirt_init(MachineState *machine)
 
     if (!cpu_type_valid(machine->cpu_type)) {
         int len = strlen(machine->cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
+        g_autoptr(GString) s = g_string_new(NULL);
 
         error_report("mach-virt: CPU type %.*s not supported",
                      len, machine->cpu_type);
+
+        for (n = 0; n < ARRAY_SIZE(valid_cpus); n++) {
+            len = strlen(valid_cpus[n]) - strlen(ARM_CPU_TYPE_SUFFIX);
+            g_string_append_printf(s, " %.*s", len, valid_cpus[n]);
+            if (n + 1 < ARRAY_SIZE(valid_cpus)) {
+                g_string_append_c(s, ',');
+            }
+        }
+        error_report("mach-virt: Please select one of the following CPU types: %s",
+                     g_string_free(s, FALSE));
         exit(1);
     }
 
-- 
2.26.2

