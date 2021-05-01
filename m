Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373975lfg;
        Sat, 1 May 2021 15:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+7mcsF4qjOE1BWGbnZyvvBdS4geEodwQyfG9+eH6BobRF0831UkNR24R51v16U74pnrA8
X-Received: by 2002:a17:907:9811:: with SMTP id ji17mr10723020ejc.188.1619908654090;
        Sat, 01 May 2021 15:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908654; cv=none;
        d=google.com; s=arc-20160816;
        b=DoMNKQbvhB9mng+r+jwfuhprmFIoXB2ZHSUyFjHmA14SBtafMxeZpt8Ik8aZfRA2aW
         DOMtngdXpmWQiMwgzpYwewEpiv/9atCEdJc0s+DWK4n0m20ScmlEQZHrLmEJTqK7+e6N
         YhYgc9yJ9Nbym+fPB8pMyeTt8hlm13YWMSUaQYl7fFcXAhym4BDkxBGuiN/tgyKmXE37
         mvSSllwYHU+ee6jJxzMCTZ8CL5f9qXojqTqYGPxY2orE1j4ZuhKIgjS1N+bzLgVZEsiM
         odXxYPEmE0sJRJlHdiZO51B68dw0KmtSipYg3Oz8ZtecYiT3F3meCuVooz1fM/4CetH6
         ZUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
        b=CezON61efgoiFUmgPP9UannHgXih0beZPvKxC07DwxCMqsonrQDGJa+KNfUcBtAJZj
         5uyNajySyvcDvXgycthD+1abqpAR4N4SzX24HbcOHrZT+WkNn4Jd1n5ivKPzaIWtTIif
         ysd5V85hW5tQejZBoYG44oaBDEIWrrr4fw+D+6wuLMoWo6QZs520frXBpZusaxV3Epno
         3AtPypCcVXfw0uJ0e/xM5kKh6W+xqLDNQOw600L3LF6NhSjzovceMcuWTUSafP0RD+h8
         b/EY8JhJlwAOiqL8fHKoveNp2GTCTDBOa60UN7GGxsnnK5XreG/jcMdjn2o7VU1go8Fl
         idzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QKe1GhUw;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id bn4si7060274ejb.702.2021.05.01.15.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QKe1GhUw;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
	b=QKe1GhUw7+bYHWWEEIpotsmqDr8NDNhTNHbEdO2J/09agwKTYbQnIwPQmev/XhS3XbNUWm
	4iH5FI3BbR/dhdEcp7K7yzY366qLRU4gjfHcfN0iDYw0RdWUMxg3zE5NMbksF3BKux2sfe
	M6R8x9CG662pfWdyGOhbGOqqSHTeo+g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-MfoRAX62MBKlX00t9rJC-w-1; Sat, 01 May 2021 18:37:31 -0400
X-MC-Unique: MfoRAX62MBKlX00t9rJC-w-1
Received: by mail-wr1-f72.google.com with SMTP id 93-20020adf93e60000b029010d9bb1923eso1306588wrp.4
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
        b=YP2FwiJD9X3mwqIUuToXjAeRQHsA7In42HY1MY/kI4x2vzYg6rPSQh870kh75689YF
         rdXvNc9nghjLrL822lnKCAHgKhHOOmEX66eE0E6jkLJ6KxClI7Vqi5Jf/JSgqLCOusyU
         1Qf2VuvozzfJhBcGktmLYPlnFJh3/kSxpPh0LqROVUA8v4E5o6pGUl2yJUWX0xFiDVhC
         98+EF3evCbpImN+gutiuhhDJdqQ4ERMlMXH0SDxckxPcQwaSoq/JvyHMpsPDWnLOQNqP
         tAvzBJjpdJNEJ7eavtZwfhlboM5CbdgRw7OPqRdsa7nN+ywtcf+p52XAHi3nWeXB5OUY
         w71g==
X-Gm-Message-State: AOAM532B0wmBqpRfJNHBmUxwe1FtO4KYbS4cvCGukNDsg72psY1qDVLU
	GSFK9RI8EKkwDOKmO9T1Hfx6Z9QvdLVB0TP1dtGIgNsiZYAkoXoNZHZ9hAwiy5+XFlfXhtUGCV0
	KvSoZO3NXx4K4LpxP
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr15538110wrw.379.1619908650257;
        Sat, 01 May 2021 15:37:30 -0700 (PDT)
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr15538086wrw.379.1619908650140;
        Sat, 01 May 2021 15:37:30 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id m11sm44785wmq.33.2021.05.01.15.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:37:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v5 10/10] qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore
Date: Sun,  2 May 2021 00:36:38 +0200
Message-Id: <20210501223638.510712-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cUqp2crkYEvD

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c767389217..46de073d155 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -175,14 +175,13 @@
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
+   'bios-tables-test',
    'xlnx-can-test',
    'migration-test']
 
-- 
2.26.3
