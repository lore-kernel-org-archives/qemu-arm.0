Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1361199ejb;
        Fri, 20 Oct 2023 09:38:35 -0700 (PDT)
X-Received: by 2002:a17:907:980d:b0:9c7:59d1:b2cc with SMTP id ji13-20020a170907980d00b009c759d1b2ccmr1675517ejc.0.1697819915718;
        Fri, 20 Oct 2023 09:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819915; cv=none;
        d=google.com; s=arc-20160816;
        b=Zo7JIJJXEHFcsJ7Kr3tq4h5aL4/+0RgsOdWwKZ4sqrEBFFGtpcHkI+lsMSJYstl7Eo
         KWQp4LsDIma9yQ112KrfMvm5ud6AY7w33kCUBu8geWRklcqxlNZEJeGSq4vTD0Do1/zc
         sQZKmax0Hb13AJAGmiOlhXB7kBt6i+xqxZot8Vs9E8DVHp2u2QOSJu+7lkhrjhw/ucK+
         Td2ecOO465XUkYNZDKfAJDuAW/sDu7IBa2rzdITYJnmzZ/AlhAzagUsuFD78BRk6nQhB
         Ysarmf8i+1PKGBvqbe0M6OC604eZ4yxeCMxCC6t+MGnneFHtByAW+enfUP3or2AiN7EG
         S2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ut1JVFvFLo+kLIKZi8qPYnpjR7G6cNfFgvYYDUExNe4=;
        fh=gg4g8D9Nh1gHdzd5AJRqv8KIYi4TWGXm16TluISzstQ=;
        b=k9Z0nNs9lhHTd7B54Tx38Ki7/9kLCCrraDZMFQEJpvRLsSrpw+FIqTBatxU0JKbmF0
         tlf2QwASOyIQb+8u4TKwDJ9rgDMzH3M1QtqL+AiRbM5LObS2erhzbHhVTkfv4oFQAfKR
         XTkZaTLWFNxXmZxSox9LG2P3T2bjtDwRfuBm5Ff9UFgepKAWGrVWquyUhb3qpjS+7NAT
         SnXr8UE0l2uDSOJNbrb0sdPyp5Fazq3euLe9BUW/kL8GQghrQDSOL7M/M2ZVUQR3jhNO
         OGkoYJs77CeOEo1REmu0F0mHMWrfvUsmnYZt7Px+foAGxWVbAMnZPeC/U/a8bOKf9RNA
         06iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WGfm+r/n";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id vo6-20020a170907a80600b009ba0a38f2a6sor695024ejc.19.2023.10.20.09.38.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WGfm+r/n";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819915; x=1698424715; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut1JVFvFLo+kLIKZi8qPYnpjR7G6cNfFgvYYDUExNe4=;
        b=WGfm+r/npAgUwmOwtBy97LURbqzEHv6ZqqSCIDav44Edn50t4e01E1tDMeP8Ru19l+
         Xu+T8xvMJEVrwNElTNqecCuXZFYuFYpbIP/onhdBXUH5kA9JHDV5jdLOxL1dtgqnWeat
         CNL0ynYxdiOc5rjm5lXdav5TbmEypa93l4G08tc1d3fWrJHiSovliTSK2/mnWfZD08va
         +XA3kSe49fM7YRGlIJtDeusWs+R8LQVSuZQPYGNaeQc3JHriUZw1FyZo8nrHdvmaUbQT
         5AlHi+XNcg+q9HZTBUDY7fe3lsRJ4w6AZxAscEQpkbDwmwDhcGH9Wbpd0fGfZEUtBcMP
         wQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819915; x=1698424715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut1JVFvFLo+kLIKZi8qPYnpjR7G6cNfFgvYYDUExNe4=;
        b=K5txZUyQ1tJdjCqAK/MYdYJgmeBmWGsJvYaF49H8NrWWGbcwHl+MC1+ncmPYYolXm7
         0+1kfRYibmzl+MsB8+GyQyIHXaKnoOtQ+TzTKJcbluqSqocod0o9mLlKLo6BdLFUwsfu
         By3u5Von1fuO3MasDWn6xBMg8wES3Z0r9CqHIqTqwcDzdSz4zVCovruRZUk5u7i5gnZ3
         zAOWewLNHIsE8bJH/G5kSff6yKXjD5dPup25W/PAoyn2E2W/SPVAJJw9/K2qcWLUG9Px
         WolAskVYpCtfeduXrQ88oZNLM286K8vm6CRyMbiZ22VpYHxjEefBifEO5tPT8l8ElU+5
         nl2w==
X-Gm-Message-State: AOJu0Yz2UXdKZQ1faxysJ4GGNQHqKttTuY76NB9Es+/KxaFXnUXdJz++
	UCObJw2fS5oR0ou4Z/s585reuWOB
X-Google-Smtp-Source: AGHT+IGl73D3b984YgVSErMYz9RgMLYGAfiCqAnw0A/C+rUAgxUldvhOIDj/46hx9nsUEPP1al9X2g==
X-Received: by 2002:a17:906:eec6:b0:9b8:8bcf:8732 with SMTP id wu6-20020a170906eec600b009b88bcf8732mr1841258ejb.43.1697819915304;
        Fri, 20 Oct 2023 09:38:35 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id kf14-20020a17090776ce00b0099bd7b26639sm1820597ejc.6.2023.10.20.09.38.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:38:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH 14/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_S390X_CPU)
Date: Fri, 20 Oct 2023 18:36:36 +0200
Message-ID: <20231020163643.86105-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RWP7pjP1c4Ly

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_S390_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/ipl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 377f43416c..1f2296f456 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -674,7 +674,7 @@ void s390_ipl_get_reset_request(CPUState **cs, enum s390_reset *reset_type)
     *cs = qemu_get_cpu(ipl->reset_cpu_index, TYPE_S390_CPU);
     if (!*cs) {
         /* use any CPU */
-        *cs = first_cpu;
+        *cs = qemu_get_cpu(0, TYPE_S390_CPU);
     }
     *reset_type = ipl->reset_type;
 }
-- 
2.41.0
