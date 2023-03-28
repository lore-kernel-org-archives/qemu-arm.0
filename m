Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2823817ejb;
        Tue, 28 Mar 2023 10:31:21 -0700 (PDT)
X-Received: by 2002:adf:ce01:0:b0:2e2:730a:c7de with SMTP id p1-20020adfce01000000b002e2730ac7demr2333515wrn.24.1680024680934;
        Tue, 28 Mar 2023 10:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680024680; cv=none;
        d=google.com; s=arc-20160816;
        b=osY6zcDj22hQnU5pAfl1xKK91Ghyn/fLfYHidQYJaOpqNX/pZFEvxhwjxlfGJBs6Af
         tUlpO7RsR5soSn3oh1vWJihgGofboKw3phY2pyvgTsCVfBqSLKk1v1Gay4mOeJOvjC2/
         BpPKrCc3g2EuUMv4Y5N8EtdRGYhpMGKBguPiVOcSloxT0xtm7e2haG3S56Rq35qn6ICU
         I4SZeoIfpF2mOzr6DfMqKZzIErI0JaoZ/FyJWvKC6IZ4eNMwV9JvylkRdEn23d+oN9V6
         0ymuGLz9pCV9Exlx3M7A+aoexesDs2YztnYeg+tPABqttZF01b7ZkwaLIc0CMi77lOSp
         3kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=uAtXz3+z83jZ4XKxVvQOajUrR6GL+K0tj/4mml7wKes=;
        b=0rgXOjwDPfwQWthoC5A8srdxNRIda9reXEt+mnnprg3733+kkQbUtP6BVjHuS3Rr+m
         d7kWsoQXv0M1KdbYg+0CLu0M7+CQEN2pyuRHgUFBjWXTG/ubC6SzTg+1+S6g7ESmJVi6
         ArfuyH2bC5VjLB6hZG82lnJ2Jgbfyjd/5Mtm9bvm9vr9/9gE6wSea3GRevUTPYX2K6uT
         lD6M3kJSeVbfRxYWalGXnKvYINbzLMc1VxYXBE0iv8RuCIRpsVaZWuENJlwtlrgTaw4c
         gdQhdy9MZ1ZWZGIdDYjsvRXD46Vr7w2YfiSiNBoIxVDN13F6W3z1VU4ThNPLs5bRj6aP
         cEbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMct70HW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j18-20020adff012000000b002ce3679515esor12537064wro.18.2023.03.28.10.31.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 10:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMct70HW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680024680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAtXz3+z83jZ4XKxVvQOajUrR6GL+K0tj/4mml7wKes=;
        b=PMct70HWgBQSS8kPLkhk431pJ6oAQfReDZqw80n9NAlZF7OUqS5mrRxS0GnwL+u9Ar
         yDm2iJXKJF3/7z+HcT7TQsAsNczStWGo3hvm1ChBjCqp3NGIn/4RneXXD80OM5s5C+Ij
         KuG0UK0Kqj3vZNKjkQ0wGN8/G+itFD52lISzJEaEu/oXp80gR5r0nX5ft8YMmLaLo2LH
         dgnI1V0N/WmmnQCX0nroDrWTi2Uc6eaohp+eFkrm/d1sctxsfxoo0kUPqdPWuHyM+yzk
         5az0v9Lq78P/+QQuLr3b1ob1Dk6TugtlfBANBoKzIEvbd2213SUWsAaIC4njYEw1OxqQ
         zqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680024680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAtXz3+z83jZ4XKxVvQOajUrR6GL+K0tj/4mml7wKes=;
        b=x9K+kJvZFKT0n84T4xV18aW0tzTdEBTK00ZaZaZWPahageF/tyNc+55oqrzi6H7Qlp
         fTOaKV6ECRtN54R9p//n58Yj/ZchYhYIoX3kIzDycTO/2TwDgERYqCxese6tGT50L622
         rwhcP3RZBAy21DqJp4c7NWx3GqDPSRInIyx58h9vroakqBOn39eapibtf1xBSToEZ6Z7
         CQZ9HuiDl/UgXSTxuolC/F/HhoCOXZSBGChq1v/8b+Cpz8AEg4gQ0BUqoRh4vBXLISTl
         83JswvQzn7mzrmJ6g1Z6cGf0Th4LikSjcXnh+tR9fC3y2ajfbx/E+cuFjsFG9xMxgcDQ
         wtVQ==
X-Gm-Message-State: AAQBX9fk8mQVZrDZmbXL7bhY5yYGqCBGKV06Ri0bjRPl5iOKNkGMYwek
	pTQXP8uxKh/FkJE0AyFO5V+h/Bn8
X-Google-Smtp-Source: AKy350Y0vKkd2d/Lw5hqDKOcKFrPz7QPtN81Whiu4WPgwDE9O5P8ogWhZfwvQ+iyCoJtHQ3Cm+wnZQ==
X-Received: by 2002:a5d:4848:0:b0:2ce:a9e9:490b with SMTP id n8-20020a5d4848000000b002cea9e9490bmr12156949wrs.31.1680024680638;
        Tue, 28 Mar 2023 10:31:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id z8-20020adfec88000000b002c5691f13eesm28014319wrn.50.2023.03.28.10.31.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 10:31:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-ppc@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	kvm@vger.kernel.org,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH-for-8.0 v2 0/3] softmmu: Restore use of CPU watchpoint for non-TCG accelerators
Date: Tue, 28 Mar 2023 19:31:14 +0200
Message-Id: <20230328173117.15226-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: kjVxjfIBu8u5

Commit 2609ec2868 ("softmmu: Extract watchpoint API from physmem.c")
restricted CPU watchpoints to TCG accelerator. This is wrong, as
other accelerators such KVM do use watchpoints. Revert (partially)
this commit.

Since v1:
- Include "hw/core/tcg-cpu-ops.h" where cpu_check_watchpoint()
  and cpu_watchpoint_address_matches() are called.

Philippe Mathieu-Daudé (3):
  softmmu: Restrict cpu_check_watchpoint / address_matches to TCG accel
  softmmu/watchpoint: Add missing 'qemu/error-report.h' include
  softmmu: Restore use of CPU watchpoint for all accelerators

 include/hw/core/cpu.h         | 39 +------------------------------
 include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
 softmmu/watchpoint.c          |  5 ++++
 target/arm/tcg/mte_helper.c   |  1 +
 target/arm/tcg/sve_helper.c   |  1 +
 target/s390x/tcg/mem_helper.c |  1 +
 softmmu/meson.build           |  2 +-
 7 files changed, 53 insertions(+), 39 deletions(-)

-- 
2.38.1
