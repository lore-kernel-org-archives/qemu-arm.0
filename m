Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2500935lfc;
        Fri, 13 Mar 2020 11:37:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtF/2RlxInthVm/a9cpb6Un2eNV1HXoFytBvTx8I01GeZof7WO1Z7fxUS1ovUQbhbWjL3WD
X-Received: by 2002:a05:6402:17eb:: with SMTP id t11mr14624686edy.79.1584124621803;
        Fri, 13 Mar 2020 11:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124621; cv=none;
        d=google.com; s=arc-20160816;
        b=WHtu6XtwuntlSj6xY1+VraBr0wMfzrjW+bW+SgFO9kFjEPqp/nASdhMIfDHXKUfv6P
         6pb9EMl0oR4vRFGHnjQlTr0t8ORNEO2yqr58rDYUd7zze2nsKZWHO5pDFhFf6P/lmJuU
         sL+VGO8X96goW9qEZUeA8SUuVYMOmNOgk4mDxx4GhYYBW+Dyj9CF9rvGwKm1IoTBq6bU
         umRm9Zx4VY2OGb3NjXyIe2AWodW88PuWSMHY3bxw8kRoVhgMbxjUEmHx2p9hh+XQ6kuq
         PK7gekRomj9UgDDQPvS7/+ckQQnoPAUNlsIqE4iZeYs0sx9xKYU/QG3BIp01FdV0uPjx
         PKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=LlpMWUrtmzUqdAEMSyBsmvOkuEwO+0Reg5YUJ16z+Cc=;
        b=XqXMcdBmLeBGSynSy7hhR/INvPirCQ+iuCKb3/Vn7c9NJ8aOruRIaZMEFNowCnc0Ww
         AkJLq5tpS9TzsEhR/1/QHGrgfsJn/h0SMecUNrwwMBrAU1idDzYAFIpiDbfpcrh7ahNL
         6ZUsaPk4BI4hzStgHc6QgdEzNeXxLGI2a3oT5qat6nParg5pfBdb5FCaZu7teEQ5fQXb
         Wrms+c+V86kUZF6ZRoYT4zzjBD/pOvvRlP1j97kJ07jJPAes+m3UYf6wfdsbuV/rWH+n
         Oi9G6d/Y5w4cAGoRNeo71xAjLL+wRTT9Cv81/4stvCZkIT802U2FjJvfNcCFWIm1osEK
         D0Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UUbhixuf;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id m24si5839086eja.305.2020.03.13.11.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UUbhixuf;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LlpMWUrtmzUqdAEMSyBsmvOkuEwO+0Reg5YUJ16z+Cc=;
	b=UUbhixufxUESgXn2O7fHUgevqCdovQrqFU9pooIXot6NXYHesJxgpBZ6goLQkNMFDeo+BS
	fnjr9SgFk3P0Hf5vOkppyyyls/18OxAFWoNMd+fjmeqtMz9+EImHKRJtWC6gIoNA825MQE
	sZzXKEzYphMafzzGM1/YkpaHArj/ejQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-1GPBfp2jNGOyoIVYD_HVkw-1; Fri, 13 Mar 2020 14:36:57 -0400
X-MC-Unique: 1GPBfp2jNGOyoIVYD_HVkw-1
Received: by mail-wm1-f69.google.com with SMTP id a23so3783306wmm.8
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tT9l7cduJOEnaW27bPqDaHoIXT0dr05sJq/BTyFEpNQ=;
        b=E3DLZlD4EViDkYxm4JQsw6qNc2aKqPSzczcD8U/aFX+LCWY5G/UFSXTfkmlvrsX2+z
         +iYvAa8L4FXtvCxBEcMZ9/fWG0alhld8cxmUSsKEF6B7PU7t6cEJ5dJOvxp67UhOC1Nt
         FvPq1aNaPjqjMrt+kI1EOYjcyDSZaH8lbfuTxmXIB0GjQIztUybYUe1qxvOdu4MtiOgF
         +Hc2IJDTX6V/CL7u20PfzBtTpXaY+lmKj8bgDJ6GVraiMyAE2496VDVDtkQJH685E/+D
         H/KxEyy1tD/tBa26hF+tfri3ETx6DP93DtiflT3IzxSfJj5eLs8dxbHbthSFKPFLDuGW
         34kQ==
X-Gm-Message-State: ANhLgQ2UkyxTjyNORFx93jJby2hV0eteJ2+FOzQ2vcyvi2mSQbSPdSOx
	fo0cvgF7c77HxArsZLsyVZQxRSXpek5n9IieDUm/xFOU4bpwPNmhpiWsYzdpWHTBguYvktiMCaZ
	UVy7jw/CTTeYuekFy
X-Received: by 2002:adf:e883:: with SMTP id d3mr18744588wrm.75.1584124615512;
        Fri, 13 Mar 2020 11:36:55 -0700 (PDT)
X-Received: by 2002:adf:e883:: with SMTP id d3mr18744553wrm.75.1584124615257;
        Fri, 13 Mar 2020 11:36:55 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id l7sm9367538wrw.33.2020.03.13.11.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:36:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-riscv@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-arm@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 00/14] user-mode: Prune build dependencies (part 1)
Date: Fri, 13 Mar 2020 19:36:38 +0100
Message-Id: <20200313183652.10258-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FlynumE7BRFl

This is the first part of a series reducing user-mode
dependencies. By stripping out unused code, the build
and testing time is reduced (as is space used by objects).

Part 1:
- reduce user-mode object list
- remove some migration code from user-mode
- remove cpu_get_crash_info()

Philippe Mathieu-Daud=C3=A9 (14):
  Makefile: Only build virtiofsd if system-mode is enabled
  configure: Avoid building TCG when not needed
  tests/Makefile: Only display TCG-related tests when TCG is available
  tests/Makefile: Restrict some softmmu-only tests
  stubs/Makefile: Reduce the user-mode object list
  util/Makefile: Reduce the user-mode object list
  target/riscv/cpu: Restrict CPU migration to system-mode
  exec: Assert CPU migration is not used on user-only build
  exec: Drop redundant #ifdeffery
  arch_init: Remove unused 'qapi-commands-misc.h' include
  target: Restrict write_elfXX_note() handlers to system-mode
  target/i386: Restrict CpuClass::get_crash_info() to system-mode
  target/s390x: Restrict CpuClass::get_crash_info() to system-mode
  hw/core: Restrict CpuClass::get_crash_info() to system-mode

 configure                       |  4 +++
 Makefile                        |  4 +--
 include/hw/core/cpu.h           |  7 +++-
 target/arm/cpu.h                | 10 +++---
 target/i386/cpu.h               | 18 +++++-----
 target/ppc/cpu.h                |  2 --
 target/s390x/internal.h         |  3 +-
 arch_init.c                     |  1 -
 exec.c                          |  8 ++---
 hw/core/cpu.c                   |  2 ++
 target/i386/cpu.c               |  6 +++-
 target/ppc/translate_init.inc.c |  2 --
 target/riscv/cpu.c              |  6 ++--
 target/s390x/cpu.c              | 12 +++----
 stubs/Makefile.objs             | 52 +++++++++++++++++------------
 tests/Makefile.include          | 18 +++++-----
 util/Makefile.objs              | 59 +++++++++++++++++++++------------
 17 files changed, 125 insertions(+), 89 deletions(-)

--=20
2.21.1
