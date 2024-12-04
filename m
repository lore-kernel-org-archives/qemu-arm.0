Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp514660njb;
        Wed, 4 Dec 2024 13:12:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9t2InUB2j2YbDcf70mOIwAIDBj+Xnd2XZrr9N/mwvzMwyi89kRBLtfVkGcU8jGUVUMg+l1HhauvuVGQ==@linaro.org
X-Received: by 2002:a05:6a00:f04:b0:725:9b69:f53e with SMTP id d2e1a72fcca58-7259b69fd7cmr2621438b3a.24.1733346765829;
        Wed, 04 Dec 2024 13:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733346765; cv=none;
        d=google.com; s=arc-20240605;
        b=ByX2rN/+7cSHhiFlX3/L1Py2OfRaxXGtIwXNCd2ygxyPH554BtO7wEGw+70F7lVBOl
         ZDRdSFkBgFTju8njNtrpYn8P9Uyfpmuo4xWpz5B22W4ClDG8JkaQCkSnWnDrbC4YbvMV
         K2leRRfV8VnVyFu2UFtFUIQ62bzSMIallJJkbB0sO6vd1rL4BtbiYZs7kV8mo7HF6MTv
         qWBB48eLdtVsIuJidK52SlfFgtBFNMXxQfYMoK18AWVcrVQ9LGblziN1dHsgGwGApbRT
         IP/gfgw+Kj02RZ6aFWbwuyWJgpf8sp+akvU5LatyZu76KTkfneo0r5oUFb3UYLlWoxRM
         X1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=8VxKFI/0y4LY07W6bm/GbHm9mzNlrCNc2KPV8KgQ4yg=;
        fh=j3wNNihk21tPJxzX9wUmw0BA0Fw0a0Pj/HjaYxwiz1A=;
        b=lIoOjQebkWkHXxdQGDgJUZAWDVXj8rWmyvSQ8Ps0mAAQV4ZeBjS75jCnxffSpzQJZu
         VRaJ6/7B5EklSNCsNp3rgyqXVoUl+FxTNSqOdCi1IzSpqhu5x5zcdT04sAW9Sbon2iMz
         w6gHE3hVoNAfIf5xFAqt2gp9VmbxIqmRvIrH7IxOtzj3qGMO+BaOn7THPs1f15+2b3XM
         S2+p1Kbi80Ua2jevdiuO/C+ayqxst15TvBDX3tLTA00vUy1DvP1bfUtt3jHyZWXmoqWF
         /63zQaKr5FS7k20UW58Gr87R6pwKdxjB+h8TC0g42Aa+2D29EgjAQnIeONDnMvEsFsEJ
         EyAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPaeu251;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-725945a5039sor806341b3a.1.2024.12.04.13.12.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 13:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPaeu251;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733346765; x=1733951565; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8VxKFI/0y4LY07W6bm/GbHm9mzNlrCNc2KPV8KgQ4yg=;
        b=OPaeu251jxOjkEv9tdfCtPgxYXyKLVJuAoOpTSxfxq2Vsvf7xmUjcBoaPUK7Rnl5gm
         XqiQLiLa6v/BvReE7ZYXKkVeLuNTvRnCnnEzlNcIrwvj3vku0KhZkRGmq+VImBIlWy/4
         x3AHOgi3k9wwQP4rcO/YcMKUyu+QVw0Jl++g92fjvqXUO2nlrrfd+6dj5iIkYnV9Q0Pr
         zw9iyFvAAB2c4a1B5gQIfLbLfuHjWNRyzUBnDX91yLV8/HuS7RBylwgGxgVBRk1hlzDS
         pomY7gKwiuUKxJvC/Zkd75gce4MrU5/cifR5/fEs4v5Us+UQZF/QFSIS/2uMmXfTGCeI
         GJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733346765; x=1733951565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VxKFI/0y4LY07W6bm/GbHm9mzNlrCNc2KPV8KgQ4yg=;
        b=SJkzlElG67rKyYAUOUypxARL12JkfHhmbDDATlnigQO2GSEECmaSCgNNzylynfP2BF
         AWzUw/ooXWFy7ObgTjfeWJ5CDB4v25qN1wDnTY1SakQ2xd/cmYtdvFSQwnbCF8B5l7Bc
         uVjsC/vTBVYSkcF+m1prhNoj5hTX1lwJA0Zwu7InPfU6JXtXsJrvkPHuDJugIqqG0b/e
         u43E+qDI0AV6a9GZOXaMWRyLuUB43PesgBC5xBONcEwrGiSF14Es8Q7mPhkqKVcQ2qnD
         ikERcwCGJ/a231mAEBBPG5dvHLfoQ2muKCTpNaR0oyNXPNDIqoFL4xF5X1z6LShN0F6K
         VDYg==
X-Forwarded-Encrypted: i=1; AJvYcCWFDpq3HT2kEPFhenTlXCCZFjy6gR4Ku1EvY5mMzYplPOmHVYpRKX39Od5iNME2qz7rOGixHwh2+i+tMg==@linaro.org
X-Gm-Message-State: AOJu0YwTPYCmcinLAqz35b5qtwTdOeqHDACiRdD7YxoZ5x/xV7JqbGWI
	aeh7SOhVpYCia6rEvVBXJXHfvnpKjZvi1Bk9HjGjPidiBMr+c0yS8ISOV7td4nYBsQ2OOuG0jK5
	EV2dYow==
X-Gm-Gg: ASbGnctFxNJPWpogAuxDuAA0z1kp4SThCc3ezvT0Qbykf+Bcs03ZkzU1j+JIQr/W5tr
	WXIoleTHXKQZ/xFDQgp80o49OX5BbCIOVTshLId1irW6XeUKngn2AWnno2brr42mGYacrVlw89G
	5kDXYwGeQJjWqbxhIZJ98qqY8O8EaOuZE1+akbk03hmH4TeH/IvZrSrJjF5XdG6gnOv6T0ICt1D
	PtPiWJkOIQKoM8v4I5yuZToUe5B2MF7zeitRdNGYWAPsEByEwVfqqltYtgbwimFEsBDuqwG7VDQ
	DQViDdA+
X-Google-Smtp-Source: AGHT+IFa7NuxkjmSlj91ppu2WcILvyQUw8fQwV6FzxvpANFnQRC9Plpj+yeak7xKC4H9v/xGIFKbmQ==
X-Received: by 2002:a17:90a:ec90:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-2ef19d02442mr8604205a91.16.1733346765423;
        Wed, 04 Dec 2024 13:12:45 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef270089b8sm1905830a91.14.2024.12.04.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:12:44 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 0/2] Change default pointer authentication algorithm on aarch64 to impdef
Date: Wed,  4 Dec 2024 13:12:32 -0800
Message-Id: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Bm6hsRohB/uM

qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
spent up to 50% of the emulation time running it (when using TCG).

Switching to pauth-impdef=on is often given as a solution to speed up execution.
Thus we talked about making it the new default.

The first patch introduce a new property (pauth-qarma5) to allow to select
current default algorithm.
The second one change the default.

Pierrick Bouvier (2):
  target/arm: add new property to select pauth-qarma5
  target/arm: change default pauth algorithm to impdef

 docs/system/arm/cpu-features.rst |  7 +++++--
 docs/system/introduction.rst     |  2 +-
 target/arm/cpu.h                 |  1 +
 target/arm/arm-qmp-cmds.c        |  2 +-
 target/arm/cpu64.c               | 30 +++++++++++++++++++-----------
 tests/qtest/arm-cpu-features.c   | 15 +++++++++++----
 6 files changed, 38 insertions(+), 19 deletions(-)

-- 
2.39.5
