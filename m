Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2742990njc;
        Mon, 18 Nov 2024 09:24:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTw2+LBKTzzdbqQ5HZ4uuViIr7aDFDnxRa19HjpA96IdGRgYoNmW+LroEsukj2Onh+zEeFnLisMKuK5A==@linaro.org
X-Received: by 2002:a17:902:ccce:b0:20b:775f:506d with SMTP id d9443c01a7336-21248a1be67mr12784685ad.34.1731950656688;
        Mon, 18 Nov 2024 09:24:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731950656; cv=none;
        d=google.com; s=arc-20240605;
        b=LOXaB+BrLDbHnOgJoIKU6FPfBYGwbG85zDiq6ynDYsIcx/6EzJ1CaOGTbipXJrqIu1
         MWGNDnps52RXEsWgKK/8geFYziE0B657hpkANgZ7xMhhpIBxJfNG6gTBfWwHNqX9gsVC
         qWYKBCUk6ENYneE/dX7kV1lX/oK6MIujppXbaLlddmWSvCW6G5Mj6KVB02xHHGjwYykO
         hL6keyThTHTtBALKoTwweHKXNSEsKIaYrzKXBvg/tupcHsupiz6MZomzJGKGO/YVdBw7
         phGhBTWtDvzY3WnIrsWNJKgci2Wn4UlKxsCpFSbDW7vyiHWm/d3sCmUPrFWce6ZEdW2e
         ynDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QaxpMkzADG4IGRoaMKuDLbk1XxCkXT1oglYVymp2yRk=;
        fh=a8VQiHFq83iVzqjxX1yCsC0biqYcl2OdijpxzWQfuJU=;
        b=jslmB48cjVHjfk5qcsJKLxUEGN8bE2I4pQJeqvwcOidKs7LGdnUXKwvYJHabggOuLb
         hDLYE7uwJ0dOvYlqOw0ighwzvjWaMX4JXDy42A9rvuRaa5XZPGfklRvekGkEZ78d+ryi
         jVR+x2b+xJCNO4szHv7vyXG8WTDj5TPUxjk3y2BTimWqOzwvzutKdSy4hRU7R+lAMfYE
         SegV5sanIWbAoNfikYcoVGOtX1g4p35Yip9zxvX+pL7qejaKu91P3otbGylZ7EVSpnCP
         s34WkNdFdqmJCzPGxMSz5ZUusAF8ZXZofaWI1FEsZKMKQHZnust5wZmEeK+8sMpJxHo+
         GDcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opqxhO+y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211e99b7ff1sor41522735ad.11.2024.11.18.09.24.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 09:24:16 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opqxhO+y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731950656; x=1732555456; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaxpMkzADG4IGRoaMKuDLbk1XxCkXT1oglYVymp2yRk=;
        b=opqxhO+yS7NnLUV+OH3P7sCcacIQcpn9QjYva4vduXXtww758o9gT5S7pKY92v7WLe
         zOxQ/1E1JjlLM/f9BNNHuzU+HzlB3tD2C2GAkjS+oTY2innujW0OspBEJ5eho7T8/1fj
         WCr0e65Q43kPVAFM4QWeHCycAgcPnvdzy1KOlfQsfVQ4gsdb8QTSainRYRCyV3XWlBmJ
         UDyWC04aRJpberQb8v/7NSlWBX99/20maOupe243jdjzZWDKNG711iGGnePil82cwKvz
         F2XCiNHe0WfLE1d7Janw+Boxn/rtIkAYEE6iY0Bvt/aJdoDYZZUP5eWypRu94g0qv1rq
         QyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950656; x=1732555456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaxpMkzADG4IGRoaMKuDLbk1XxCkXT1oglYVymp2yRk=;
        b=G74HmOvvlJYma8AtTK+xF7KlUdSzNzVXAHOiqeLhGiZR7QH7yYXghoEjfgT7lHnrQI
         tUIm/j+zFIPv+bBzdop9levSTtZNoPvKIphEjhlYpJ1sHa7Ltxk6fCaqXHXKy4jWA6S+
         fuAA1u260RFe1sW0Rjb7+M8n+y+14o4S+RmRfJ92hWYASaMYRF0pExRa+rVJW+9FpxWC
         pDXub9pAGMoGb80b26cqc2uxdjWt3DAbqZ+tdfnEK+6LdRUzwuf8OcZdvfC/eY5ObEaJ
         iWXzCASzCoi1geS4UikZQHXi5SKrZIujRul0zdsDNlBO6M2QI9uT/tQxIooUYkoBWfcT
         oSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPOcASeOHdivb5WQTuMMHCNSs9chYrNSJjT7WKXf262AbGSADlOU2O5p7TWneslNNoQ/tFX8rPjTJGOw==@linaro.org
X-Gm-Message-State: AOJu0YwkI+ge/Lfcecxdxkg/NIM6Z3r85H//RW4NRW7NexVWySlYsxWW
	Jm8B+EIIaEZzA6d/VjDDAZ8BeEy/pNo8M/zQq8Ji5UiR8rxChlRMtBZSYCNr1ocD0g==
X-Google-Smtp-Source: AGHT+IFnMWEzRgiYq/B3mYM/U/z+PUqF1APKbd5/ZA8bwDsu0j2FORNnIWlcrwKq/X5tQE+U6piRrg==
X-Received: by 2002:a17:902:d508:b0:20c:5c13:732e with SMTP id d9443c01a7336-211d0ebf9ffmr195717105ad.38.1731950656051;
        Mon, 18 Nov 2024 09:24:16 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f55d04sm59469765ad.264.2024.11.18.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:24:15 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 2/7] docs/devel: add git-publish for patch submitting
Date: Mon, 18 Nov 2024 09:23:52 -0800
Message-Id: <20241118172357.475281-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: b9L/PbU2uHpB

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 349c32ee3a9..953682f20cb 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -237,6 +237,20 @@ attachments can be used as a last resort on a first-time submission.
 
 .. _if_you_cannot_send_patch_emails:
 
+Use git-publish
+~~~~~~~~~~~~~~~
+
+If you already configured git send-email, you can simply use `git-publish
+<https://github.com/stefanha/git-publish>`__ to send series.
+
+::
+
+    $ git checkout master -b my-feature
+    $ # work on new commits, add your 'Signed-off-by' lines to each
+    $ git publish
+    $ ... more work, rebase on master, ...
+    $ git publish # will send a v2
+
 If you cannot send patch emails
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.39.5
