Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6658986dlb;
        Tue, 2 Jan 2024 08:04:59 -0800 (PST)
X-Received: by 2002:a7b:cb92:0:b0:40d:3ad5:7618 with SMTP id m18-20020a7bcb92000000b0040d3ad57618mr4905222wmi.183.1704211498794;
        Tue, 02 Jan 2024 08:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704211498; cv=none;
        d=google.com; s=arc-20160816;
        b=dEop0dVyBUm+b/t1BitjVNi1lVmNA8KmlJS7XLdWu4+5hJOX88LV04r1OapMuZtvVu
         Y64NDsfJQi/TvxH6lQUDC4at2LvMH9CpALUaxWlluB3rzpmS517zLKJM+rhbyAAKoGem
         kiX5IogLb1vBBnyl03gX6aLeiCVFqLSlVwwf/JIjARswbYe317nCNarCI/VY8JlgKMW2
         1am31gUfZBn7xHt9oinS4JIJ+UaIVElq13127rl0D4qt17wOgmkrvEgesFzBMnrlaCzf
         J+rQtHNmAt+Cc5kHXwpg/8VK2XSVRTfhxZFUcTC/TeHUQJX6DV3lHntOHd0zsSfv0soN
         F73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=BRQYwKaD5nL/etQUQHLcvnsdC8oyTg3NrDmrCWZHoMk=;
        fh=Fbl4rt7vNadFyu+mhE5sPZ2m5GJmVL0UTbP+h3uuTlY=;
        b=APdlVfkhsO2QOOA+hFnwE+nVrNZ0DVtAx5U1/mSVN8aIbnbylXc6Qj9dsuHn2oeGym
         OP/LXdYmQ0ATSsv4jHUlFpMkTXnzBRPJY/1bUMiFWyrImA+w9MIgsRhOtvqLgdll/cYU
         ZxvzQ8vE+LwJG/vq8PP1hiId2r6MlVagKLBSiGGwGYZFfHeNZ23rOxT3Fp7Z6m50ECbi
         UheXXlK+RqiNgEQ29uo6AkFi+vyjzWbbznUJ5qfeOA1ejVevSF+kF0k+JLPRxD7BzLmO
         CVQXgrvWw4E8Tx1OXST07/WSesqZCdCyRXkHqYd7DIk+h+wc8rA9kivl4vmYQknjDTpx
         zheA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jVm9CYZE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11-20020a05600c510b00b0040d206f950esor1149241wms.3.2024.01.02.08.04.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 08:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jVm9CYZE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704211498; x=1704816298; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRQYwKaD5nL/etQUQHLcvnsdC8oyTg3NrDmrCWZHoMk=;
        b=jVm9CYZElLprxcoSOiL8UhKpvycLHGf8vyXZyk/WhuCQk4h0l7O3hQS+A2M7jzGI6L
         aI/24GHJmiN2ZasO1I8ZtyIu9BDNlPF7UO6TRnSd/30YvIUm3tGygA6AKa/h6GSuR3Yb
         NgR3ZoiVRkMJJRIj6xdyb1xisxTNIYZfQ/s6bnEYKZgLbwbD8y4hdf/xYr50oPuEJy2B
         y1jq50DShX3AvI0QyvDV1UJ98XuUgU8SXPGgXda+PgmDFZuOXgq0JUZIfLR+91+f2QWC
         929ggONsA2sRWYEhbLQBeIJ8AyMHAXlzt5/2fMbpGAELWjohdgZpwhLhGf74lmeqxn5V
         2ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211498; x=1704816298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRQYwKaD5nL/etQUQHLcvnsdC8oyTg3NrDmrCWZHoMk=;
        b=lQbIFEjyymE1ha4kro3AGXhoVK9h3gDx18upalsSJF6zW46ncnfzvEVsUqcWXESfc8
         bhTJg9qX8TA0OBsoLQYNopRV665WAR8pNebv1/AVPUQCfNBbEiy5W5Q/7cQSBiuAwwNS
         1fZ024N+S86RLPx639ohdGDt4YUPDnpJVh/xdDWfNWj/hybUzllNq90llWaoqvyK0NiU
         zYY4jAVxDuvP41UfEAATr//shUOFE6CmTwB5eWt0pcYyX0/C1aQ5nmLPMIVP8tNAZXg6
         QaPnT+WJxCfR2fwduJwgJ9UgVWiIRx2QlOFSn/xQL0p4hwkqQwLRLOo0KaONVxSO9K1f
         L5AQ==
X-Gm-Message-State: AOJu0Yyt5B+TNuIgJl8D9P6eX3qwp0EWUVySAFZkD5r6l91SBv4JZ74v
	mM0bu8Ey0K8QB5ADDW6eJJrhYjShm3oxjMeV
X-Google-Smtp-Source: AGHT+IHQtwEk+w4KhJjo4/830fznlZXmm0bpqHzLPVNoK/axg8rCeYPG/UvnDRhCrnJNCEZZWj+TiA==
X-Received: by 2002:a05:600c:4ed3:b0:40d:4d87:39f7 with SMTP id g19-20020a05600c4ed300b0040d4d8739f7mr4417565wmq.261.1704211498296;
        Tue, 02 Jan 2024 08:04:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr. [176.184.16.71])
        by smtp.gmail.com with ESMTPSA id w10-20020adfec4a000000b00336670abdcasm28690520wrn.40.2024.01.02.08.04.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Jan 2024 08:04:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Luc Michel <luc.michel@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Frederic Konrad <fkonrad@amd.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 0/5] qdev-properties: Try to improve use of dynamic property introspection
Date: Tue,  2 Jan 2024 17:04:49 +0100
Message-ID: <20240102160455.68612-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: JPJXIIMgSeQc

Hi,

This RFC series tries to work over some limitations exposed in
https://lore.kernel.org/qemu-devel/9293e63b-8032-4ea0-b516-9db6949fb607@linaro.org/

Eventually all QDev objects would use static QOM properties,
but in some cases we can not. ARMv7MState is a such example
adding properties that might end up irrelevant.

This is just an example, but thinking long term (in particular
in the context of dynamic machines) I'm looking at how this
could be improved. Thus this series. I don't like much this
current approach (because more boiler place and complexity)
however this seems to DTRT for the user.

Philippe Mathieu-Daudé (5):
  qdev-properties: Add qdev_property_del_static()
  qdev-properties: Add OptionalBool QAPI type
  hw/arm/armv7m: Convert ARMv7MState::vfp from bool to OptionalBool
  hw/arm/armv7m: Error if trying to set unavailable ARMCPU::vfp property
  hw/arm/armv7m: Do not expose 'vfp' property if ARM CPU doesn't have it

 qapi/common.json             | 16 ++++++++++++++++
 include/hw/arm/armv7m.h      |  2 +-
 include/hw/qdev-properties.h |  7 +++++++
 hw/arm/armsse.c              |  2 +-
 hw/arm/armv7m.c              | 12 +++++++++++-
 hw/core/qdev-properties.c    | 17 +++++++++++++++++
 6 files changed, 53 insertions(+), 3 deletions(-)

-- 
2.41.0
