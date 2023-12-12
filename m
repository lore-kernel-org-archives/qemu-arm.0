Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864863ejo;
        Tue, 12 Dec 2023 04:35:02 -0800 (PST)
X-Received: by 2002:a05:600c:3648:b0:408:5a1c:9de7 with SMTP id y8-20020a05600c364800b004085a1c9de7mr3163785wmq.7.1702384502499;
        Tue, 12 Dec 2023 04:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384502; cv=none;
        d=google.com; s=arc-20160816;
        b=jWWvF/kKg0ssHsqkvY4u3e2IHMf9eSUzMbXkNGXbEkql5OoyzzXFqakbK5W0lHIN4n
         5TyD1Vc4nFpVo+HKo13hZeoNimjBbX/oMRigPYnmdXJ91wA9sHagI1bKsBH70IpBAsz+
         GXWfMx8ahsjsdyXh/Ms9+aHIWDgwCH3Du8I9pM78GMYOOPpYWLoEKKSZfTEmMvP3L53K
         b0/0I3qEdGOHKPW0hQzvmkDQaAKomi3Vsgx7hsdrZ74Q2EXaqY8gkeZELcJ46ktBX9gD
         2mk8JEGHuKaCNqcbTjbpQoa0oqI52uylPt2YfINPYJK5K5wWBcWQq1hX2iOOFhkfTWnz
         LhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=aMcOH3L+x/2/Jsykc7lC3ckxxygFlMrSjic+ETSrjfW4OBjWxK0J/erUbt/slyJSY/
         +b/RAjuHKdjsqOKuyEKaQoStpCI+BnO2qbC2NRR77xG0hYERC7CU7QYxJ2qRHTpnS8Di
         FAQNs8NZ6nlOloqdThZg+vBZy8g3PODDfmKOq3GEXqJyxKNWDyWxIWB5ktGk51P+5lDL
         Np50izPTnWbMbuBSSI63SacmpCfddQipAYURKxuNaxlFTmfEg9X/XwmmkIIBL/dJtdxI
         d2i8Wip8k31/uCq/Ir5NSdmFCUsTRSPWr4roYjYO+QdEDGD0bst+sLkSrm7fHsGe32Vp
         iK6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQFyXNKS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m31-20020a05600c3b1f00b0040a4ce176c4sor3170827wms.0.2023.12.12.04.35.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQFyXNKS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384502; x=1702989302; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
        b=iQFyXNKS0Id3vfMomLkNe56vy6/CpL4hi8zC4x4RPUGZSmnTcua7iiq/mY+mQxWf01
         D1ux6faEK+qEe74Id77r8CUhnvNus1JLcYk0Fb6eHhP4SAE4xML/lLer745E4h3YGpO+
         0QHBtX8jphkvxJpMBzeRM70AvwqFyc0H9rTUq7ChsBWV83tTs+Ifdp9PCl+PVq2PlLND
         ptwJcU2/fOe9WR2amMO0lxOGqgbxyixTdPITX5sBlBKpFD+97+R/xyamJSmwi1mpZwND
         S0Izw00e/cqiAfBTOktwxZENN9RcoUCSNTAHWxlP5WllsdoxKdnWxra3erd6V5gfuG0u
         znzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384502; x=1702989302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
        b=LnapiJOZPu9X5mHvoD2+xKr7Bpq1gjbxa7LtU3L1KK6DSJyg+HWpjiV5fRByTOLVmn
         L9mxucTShNsOqjMVfw5tBjJierPnw3ONv2Gj3l3Nsbrw5A6jEuCq475NcbVNRkZizv99
         OrodCZPF4mapTRTpSj/gI9kMOiATdITSFnB/+SY3ty6hYdALh3fT6EH+g4o1VYVZzlfB
         YE5xjzC1ifGjswbWEmvwh8yyXARE/Izv0uZfVKRKSyO7XZjBH8pqYkhnjtuG/cSY1ha9
         2321km1eBnbRGPURriXIZ5X73XGQGwzGSGZ4d7NhuQsjGUm25pZBBpDG1Gj9HD+TrzN3
         ydzA==
X-Gm-Message-State: AOJu0YyYjoMjdgWwYyVPU5s3rKTXVEhj4OnDX/JXSkySTqJ/zGioV+tH
	C+0/WgS4zM6QvWSjpB39s1aEGOOX
X-Google-Smtp-Source: AGHT+IGAESSZtH6ln3MK23t1PKoi3W/qmoRgb3hb0VMjf3EB3hN4oQZHMKkiXJGz/0Uo3HbdxEGPqQ==
X-Received: by 2002:a05:600c:141:b0:40c:3667:9e89 with SMTP id w1-20020a05600c014100b0040c36679e89mr2486829wmm.85.1702384502203;
        Tue, 12 Dec 2023 04:35:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id hu19-20020a170907a09300b00a0ad580e1b6sm6140865ejc.48.2023.12.12.04.35.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/23] host/load-extract: Include missing 'qemu/atomic.h' and 'qemu/int128.h'
Date: Tue, 12 Dec 2023 13:33:44 +0100
Message-ID: <20231212123401.37493-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: G/Me+SmET+1Y

int128_make128(), int128_getlo() and int128_urshift() are
declared in "qemu/int128.h". qatomic_read__nocheck() is
declared in "qemu/atomic.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 host/include/generic/host/load-extract-al16-al8.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/host/include/generic/host/load-extract-al16-al8.h b/host/include/generic/host/load-extract-al16-al8.h
index d95556130f..6b47339b57 100644
--- a/host/include/generic/host/load-extract-al16-al8.h
+++ b/host/include/generic/host/load-extract-al16-al8.h
@@ -8,6 +8,9 @@
 #ifndef HOST_LOAD_EXTRACT_AL16_AL8_H
 #define HOST_LOAD_EXTRACT_AL16_AL8_H
 
+#include "qemu/atomic.h"
+#include "qemu/int128.h"
+
 /**
  * load_atom_extract_al16_or_al8:
  * @pv: host address
-- 
2.41.0
