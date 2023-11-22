Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp532627ejx;
        Wed, 22 Nov 2023 10:30:51 -0800 (PST)
X-Received: by 2002:a2e:8751:0:b0:2c5:2d16:6d93 with SMTP id q17-20020a2e8751000000b002c52d166d93mr2180746ljj.28.1700677851277;
        Wed, 22 Nov 2023 10:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677851; cv=none;
        d=google.com; s=arc-20160816;
        b=zhZ4/+tb+AoxEAn+RWWnG3wpNZQnjkcerHjXyxjqmKpRY2pwfHSwElYVlO5jGiCRki
         FDIEAq/ntHCr7RSYN2UJoEaKP5l+SWitQhTQKLV1ELiQwIDm/neanyLQEQZ34O+p697o
         MYreRrR3nNB4xOIVC7BjFIIN0TNFiiRBBY6OE8F/QNdJcWHhzzQdc/acgWJDC8Lh4xJk
         nQh9zMs97mm5XR5atJMMo0Skhi1E+NXvQhE7pNL7vQZMKREiLKmq5azoTtpz7DsquSnC
         gcxB/A75HCksu70ewqHlL1HP0ZoIY2wV9iR01IYbUIAyHZWxAsrRk8cuJVFzjMXeFus+
         9pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=7Rm3lhCAuFgUPCtL+Xe9ZOLLkN1sAT39F40LXUTGNo4=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=gXiLnaAVDYMASeYKafyEDPCmBgaL//xYstzgOYN9fLK5NBWzPHbs85b9JfBqnIsm1K
         U4pJpP5XlBnPD5L9gd91LnF36RgKtFeBRZv6+4ldT6BgXmjjj1/o4kZCMGAtXJL/TQpQ
         aXqt3HIlBSl4oPzpbmTr6e/H9x9/CYomMji74Sei+hJbEexK7fhv6CiDVBUP19gPnsg5
         agRKFXHnIO1QN25sYNHrDKBkABtrSYnRolcTiyMyJSXJMDGd7lZtHsze3DvYNdsMdfmR
         uzQ1acRD3s4bImGKuzi2dZjJYsFTGX8BQDlw1lM4rd9PwZrl+MGvoCHIFvdBUY/tjvcf
         SnnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jvnOrZ2c;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p23-20020a05600c1d9700b0040b32fb28a1sor24247wms.10.2023.11.22.10.30.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jvnOrZ2c;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677851; x=1701282651; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Rm3lhCAuFgUPCtL+Xe9ZOLLkN1sAT39F40LXUTGNo4=;
        b=jvnOrZ2cU+lmbAKcjFDHl5P0hj3aJ0y+b4glrIZgJ6NEGEKZq1gaMz0z80t1NSsLle
         v/XwQ2JWBYTHkdt09KsqZzY5niXkJb+px6KSK3oIr6+LfT8JaOHHrAMNwwfLi59ZwsRm
         CeGbU5KrCFC8xHExlHj8UCTdaMYQsykG3E88Z902CURx5/Q8GRivKGR7tfziqlTst68s
         W/oncoNoIZsiYnS4Vp2X+Xg+35wXjJ6LAmebomv0t5/xXyA8ocPwcym1asX2RuCzSR/G
         vW3EUJxTlQ/lnCOHrfg9rXvOGrwUd6kurP5TNB650CA7oxOqF0pvX/DwuBPWEKqcWuHu
         OPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677851; x=1701282651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Rm3lhCAuFgUPCtL+Xe9ZOLLkN1sAT39F40LXUTGNo4=;
        b=AG88SZG+jmlQSjwvGvAJmn81+j8vCyWcafCMeJMXv7bbGzahNgUwm66BWhjlMA6y31
         wuA8WZ1v5nyjWptGw6m+y75NJNejO07hn+hKQou9RaWlZI3RPvluHyp90cPH9FF9J9Kz
         3OFq1ofjmNkTiWE1u8pRA8PDCitWFbopRnEfMAlnZ/kfa9zZ2XxJDn9zlHo/rjpFt6A6
         kgDVnm7oYiMJxXpUMRhnAs72AlGEJmKjUW17JnHxtuvFe58jRplImaWjA4Ny+vnF41DM
         qJRPONPaFem6AUzxN/bXZyHZjuwOWrekvvdee0dt9oq+mWxEU8tvkwlerBaGdwcCaiGo
         2jeA==
X-Gm-Message-State: AOJu0YyR+WIWb403nUULldMupb4yKY0ijxMIe5A/x1cLlYarL4wwVEGG
	h17k7F8MoGaobv6+eg7PRmO/+RHq
X-Google-Smtp-Source: AGHT+IH+tL0hU8gQDSVNB5v+pU6ETjVTOoKxW+cgstXcmqk4L76ZnmaXyVW8119Q66gSwqjlItDtQg==
X-Received: by 2002:a5d:510c:0:b0:32f:a48f:3658 with SMTP id s12-20020a5d510c000000b0032fa48f3658mr1676083wrt.69.1700677850865;
        Wed, 22 Nov 2023 10:30:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d64c5000000b00332ce0d7300sm41010wri.92.2023.11.22.10.30.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:30:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH-for-9.0 00/11] hw/arm: Step toward building qemu-system-{arm,aarch64} altogether
Date: Wed, 22 Nov 2023 19:30:36 +0100
Message-ID: <20231122183048.17150-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 1X4hcLvRKJsP

Hi,

This series is a step toward having a single qemu-system-aarch64
binary for both ARM and Aarch64 variants.

First we add the TypeInfo::can_register() handler to QOM, to be
able to decide at runtime if a type can be registered. We'll
later use the target_aarch64_available() method to restrict some
QOM types to the aarch64 build.

Then few cleanups allow us to build the Raspi machines and its
components as target-agnostic. To do that, instead of embedding
a CPUState in its SoC container, we use a pointer to it. Since
the type is forward-declared by "cpu-qom.h", we can use that in
our hw/ headers. Then the correct CPU is instanciated by calling
object_new() instead of object_initialize_child().

Finally objects are moved to meson system_ss[] source set to be
built once.

Does that look reasonable to keep merging TARGET_ARM/AARCH64?

Thanks,

Phil.

Philippe Mathieu-Daudé (11):
  qom: Introduce the TypeInfo::can_register() handler
  target/arm: Add target_aarch64_available() helper
  target/arm: Declare ARM_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
  target/arm: Move ARM_CPU_IRQ/FIQ definitions to 'cpu-qom.h'
  target/arm: Move GTIMER definitions to 'cpu-defs.h'
  hw/arm/bcm2836: Simplify use of 'reset-cbar' property
  hw/arm/bcm2836: Simplify access to 'start-powered-off' property
  hw/arm/bcm2836: Use ARM_CPU 'mp-affinity' property
  hw/arm/bcm2836: Allocate ARM CPU state with object_new()
  hw/arm/raspi: Build bcm2836.o and raspi.o objects once
  hw/intc/meson: Simplify how arm_gicv3_kvm.o objects are built

 include/hw/arm/bcm2836.h    |  4 ++--
 include/qom/object.h        |  4 ++++
 target/arm/cpu-defs.h       | 19 ++++++++++++++++
 target/arm/cpu-qom.h        | 11 ++++++++++
 target/arm/cpu.h            | 16 +-------------
 hw/arm/bcm2836.c            | 43 ++++++++++++++++---------------------
 hw/arm/raspi.c              |  8 +++----
 hw/intc/arm_gicv3_its_kvm.c |  1 +
 hw/intc/arm_gicv3_kvm.c     |  1 +
 qom/object.c                |  3 +++
 target/arm/cpu.c            |  9 ++++++++
 hw/arm/meson.build          |  6 ++++--
 hw/intc/meson.build         |  6 ++++--
 13 files changed, 80 insertions(+), 51 deletions(-)
 create mode 100644 target/arm/cpu-defs.h

-- 
2.41.0
