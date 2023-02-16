Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp540208ejb;
        Thu, 16 Feb 2023 06:23:41 -0800 (PST)
X-Received: by 2002:adf:f40b:0:b0:2c5:5ff8:93e5 with SMTP id g11-20020adff40b000000b002c55ff893e5mr4454982wro.44.1676557421008;
        Thu, 16 Feb 2023 06:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676557420; cv=none;
        d=google.com; s=arc-20160816;
        b=SYAa2Xm9caSs4RbGg4KGkNWhvc9tj6Xxcg7oZ7oYLdzm1XQ0PGMX5Ovb3uX0GS7ggB
         semZpfHJvObcVKhXI/aVrbtnIukjGvNGr2UE4IqGftEAh3/2VyHvHb0/GCQKMQzOxVK1
         S/m4KH5sj+nR0uhVWfc5F+sCrb+24F9sPlxalUOzHkIT886H6PyKPDuYQnG2k102zCaJ
         z05G92Njph+7v4PgLQlj/P5aUeTi2JGgAhFn16JyFN6vW7LnvmP9ttxaV6ofVnrDzpFX
         sGYXcuQnVbCxdlTrQNK2jhhi2AQbAs0FhXvbRllX7Ghb2T123D2qSxgyAWU3Up4lSPMw
         sMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=L/pc4xY0KkVf5b//iMesTSo8MZ4ZxBt4DNYQN+C1HdI=;
        b=VddPoTQP/uAUaUKbSnLkd1eqM/fI1q7fCEYZ2rY+58Y+kpHZTOmQMz0W0MEoP4Hm8w
         4vuRmXUV88DkYYGn8u1L01NK3CntiJfPtHCFR6R/9DB+aDoOKMsi6vx9H1rneyTyZNGe
         ztF9dxjDMUQ3RXIxfqAH/s3Qp5mp30TUGKQrYUKjdby9HpfzNPeqXCgyTOeYpEQIx0K0
         rdeNR7ML1mDStyllQgx5yimPLBTAMuZ9N0SMvslkk5TuBacsWuQmXI75Fr3ObEkUUxCf
         +NponlpdvzEEbVIulj5QoPz8rFtOVSPgqC96GGTbE4PM+/BF5ODNmNSIUBe6wPsCIli4
         tyjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xm3UKzv2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v5-20020adfe4c5000000b002c55ff3c06fsor678557wrm.69.2023.02.16.06.23.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 06:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xm3UKzv2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/pc4xY0KkVf5b//iMesTSo8MZ4ZxBt4DNYQN+C1HdI=;
        b=xm3UKzv2yzNgXUm886BkUe+/i+rHCY1Y6F94hYT5BZTDPkAK8FtiOU35Or0qKMpuHS
         oCwe4GFTO5IOR2cBJbV4GfPitMufN5Ofmx7g8EoIcSZqh8OsySUoL+UO+OX70VX9NEvS
         tgqixgsMLUQfsW+myb52ZJhXWYmVsJTbObv397qLE6y47/4MF0sgyyaABCubASK/Ax8F
         K1LwoTs9Err8cIvhrZyHYjHk9xPWX5iwzPxEH8txuvlGvcmV7vZyk6CL6OVbLoOuriC4
         tCQtuSF8v6pI6Q+yQOuutoI6THlPXHBhAP6WOvgNhWOPRykFRmGh8ld3BBA4z08VpD2D
         P8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/pc4xY0KkVf5b//iMesTSo8MZ4ZxBt4DNYQN+C1HdI=;
        b=vUjUylW+k9bJ8pL+lc/8iF1rmoLl1wKmjNeKrJRCt60+FlBIkMwy6yQ/f8Rkzk+hFH
         zWXLAIMzxeu2TQIeVD/YiCqKpvVnTwSB+EzGWMDfcyj2QNr+XWSlJwBFsfPi+u4R1tRI
         kRLyncWeQQJ4ehfF9v9xWidqjZWvEqpD06ZlKSn4scO0Ujd8kLJiSCbyUTa4EHIlRstX
         jW5KuGgvQ1ikEaNhG/6pq1cS0bpg9Z/FS2OoGIkYz+XQ4XoO/Z7nqR55oogveWiHC5kT
         Gdw0hDVF3okBgEYfX9MNgagTFSGCtrhmjiUFl+vqFilnbJO5i3qwPT72YyI0SvLwkO1i
         WNNg==
X-Gm-Message-State: AO0yUKWyoI9esSPmvMi3XEXtjA4iMb0GWfszuIrFaCC5ESSpsPllG7qb
	+Q3tdvbOILK4YUg06yAVKt4jSukpmHiT9H4Tksk=
X-Google-Smtp-Source: AK7set/fvHUqzq36NUA0q8wFFrhcs/+/abFpUQKRqYYLu+LTVZovh29pUc0cOK3fa5jW3o7YE0SzzA==
X-Received: by 2002:a5d:4a52:0:b0:2c5:530b:7d6d with SMTP id v18-20020a5d4a52000000b002c5530b7d6dmr4818693wrs.24.1676557420715;
        Thu, 16 Feb 2023 06:23:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c510300b003e2052bad94sm5484942wms.33.2023.02.16.06.23.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Feb 2023 06:23:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Dapeng Mi <dapeng1.mi@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Bin Meng <bin.meng@windriver.com>,
	Zhuocheng Ding <zhuocheng.ding@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Robert Hoo <robert.hu@linux.intel.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Zhao Liu <zhao1.liu@linux.intel.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 0/5] hw/cpu/cluster: Restrict CPU cluster to a particular CPU type
Date: Thu, 16 Feb 2023 15:23:33 +0100
Message-Id: <20230216142338.82982-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: lFjKfc6tsNs2

Following Alex's comment [1] on "Introduce hybrid CPU topology"
RFC [2], this series strengthen a bit the CPU cluster by
restricting it to a particular CPU type.

We'd rather have a single way of creating heterogeneous (hybrid)
CPU topology. Note the CPU cluster is not user-creatable, so few
more work is required in this area.

Based-on: <20230216122524.67212-1-philmd@linaro.org>
  [3] "Have object_child_foreach() take Error* and return boolean"

[1] https://lore.kernel.org/qemu-devel/87y1p1c18a.fsf@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20230213095035.158240-1-zhao1.liu@linux.intel.com/
[3] https://lore.kernel.org/qemu-devel/20230216122524.67212-1-philmd@linaro.org/

Philippe Mathieu-Daudé (5):
  hw/cpu: Extend CPUState::cluster_index documentation
  hw/cpu/cluster: Only add CPU objects to CPU cluster
  hw/cpu/cluster: Restrict CPU cluster to a particular CPU type
  hw/arm: Restrict CPU clusters to the expected type
  hw/riscv: Restrict CPU clusters to the expected type

 accel/tcg/tcg-accel-ops.c  | 13 ++++++++++++-
 hw/arm/armsse.c            |  1 +
 hw/arm/xlnx-zynqmp.c       |  4 ++++
 hw/cpu/cluster.c           | 33 +++++++++++++++++++++++++++------
 hw/riscv/microchip_pfsoc.c |  4 ++++
 hw/riscv/sifive_u.c        |  2 ++
 include/hw/core/cpu.h      |  2 ++
 include/hw/cpu/cluster.h   |  1 +
 8 files changed, 53 insertions(+), 7 deletions(-)

-- 
2.38.1
