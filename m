Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440267wro;
        Tue, 30 Oct 2018 04:24:07 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cE0+M8nVUWwUCIPQxgehNlQEjzIp5fMdHmh4F2r8rH0fW01A/IiJumD1noSYjK/ogFL9Sv
X-Received: by 2002:a5d:410d:: with SMTP id l13-v6mr17670470wrp.61.1540898647006;
        Tue, 30 Oct 2018 04:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898647; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFrTF5AN4eMmz4Vt5GynSTPW3xpJkJJCu2Tvx0KT1slfQ26CETYhwynyye7kT5eWKB
         0UwO81eqDXKlgcbUte4XaDcT8yI+zo+e8CX+l8KSfut4w0KVKgxucLfq6QYFrVNj77x5
         oMV8dxWoaDQtrMYN7yT2lyx9OiGjdVQJVoW1qfHgkCYNBKhIzorU8t/gp0y9fruOFx0N
         WlsibJj6rBevqpGMT7PQD9efpxyVwzdJ9VgfxLeIqZ/oNJP8KQP35Dlu8+A0mcwEuL6X
         lwsZn4ZKl0Y749TnBl15vMwRiU9lsg6cvXoohAe4b8cFsjoMc9vR5aRSynY4zm1XOseV
         HMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=hUPRBk12+PjAvaLGHeJb8B74S86vAhHYQBzFS8sJjS0=;
        b=ZxZykyDyCLGEKd0B2e0OTDQwdxTx10waM2+Cyj8WCAw7Dp+FJQ+qnN3BIRqWFklPha
         6b0oqlD4I35d28K2HfJ2v21JL/7dhNl8OOnSAalUiY5X4kGFKBRueWZxvoOwiMVUjCn4
         IlD2Ot9u5UCwD40FfMCeATg/zY0/ABGrIMje8idiL1lMh6qBXJTgIcYH4pVEJwjueMIR
         2TzRFH/EXRXI2HYYhFYpt7yrO3yi9SwDeWRQ/xYyIAHsTB+qzQYHeX6Js3Ic5Iba6yrY
         YVhUtwqlHTLewecAyJcQlACKYiE7Jfo2FoBBbZaXNwD8hfN29JyOubNitqac2fqZ+vde
         wvFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id t63-v6si12013890wmb.136.2018.10.30.04.24.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:06 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MS43X-1g7Ii04BtD-00TS9B; Tue, 30 Oct 2018 12:24:04 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MS43X-1g7Ii04BtD-00TS9B; Tue, 30 Oct 2018 12:24:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 09/20] qemu-iotests: make 218 executable
Date: Tue, 30 Oct 2018 12:23:26 +0100
Message-Id: <20181030112337.17973-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:fRXDuC7A+9gUdg2j7rbgPGWEzu26PAaeJ3msJENwEZyMBuht2XZ
 +vOUYRgnozCOMELkhIeuNQz1yzaBNsGxsneK5EruGaaVC/HLrSwQ70ROeGVhpqmOCMBFCo/
 z1I096nvniR7qD+aCEKNSbY7sYzfL/uCaaKCfY+91VGPUmCFRWN7UMsHYrw31MMbktHm5Q9
 BvYJmAqzKjwdHTOerJwcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:orvFnjlgs3U=:CUwiEiQns+64lQSW6CWlzC
 VYDiXoWcsXGwECHonjRY5d+VSnxWorYYtviVFe0jIoXpvdfLAMJR7kDFT64OvHnXWqwKAMebD
 FHszgeIb3sWnCMryki7XXjO6m6BByK16UO/ydbCOLPtPdDDrT1V4JtuybO8RVUXD0YJ2kwcwF
 JADyEXW4tB4AvW28Q1kysvCTb8XfbWZ5AiAPYLkPMVPBPGUJcnT92WUa70rSoEsilep9PxLME
 ys8EHT14Q2QLZiEM84KQRUHBaou9TEedkLMABiNAr3vS4Koi6aCgnb1hkLRfHMNBoLx3RHR9x
 2726J59rdfjIqEHxSbfJYDWHVR9/by++0tsvQgzRCa3j9S3tshq3Bx7wwNtcM5FXzTClhVSDR
 4UHVddBo/tg5TLWngQ3somVoByE2ep8bfljZCIkMd4MYP4E+np0Y4gLCt/EjskovP4A/UKNED
 dZQWU1SHEmBCjj/zfsOTLHJrIurD/TgGIfP13HAjpZIBpJBHKRd4sKj8iNld7fCCUpLvnsoSI
 Fl8djWyaWxQ/8dW6O/3Fc0jgtmV9Ff//eoSiftM6t+81YcIy8axBC0hFkuK4Z42kXtKFlemHy
 t/ewlPTEf40aWTzL/3+IdFdMicfAEVsKTnQVQ1HdTjkDetZTqfcUdoacCxANxRHwtws4oozHN
 zjOUHU13jL+89Ni6Wu2QLvCXbsftYsdMIbj3v9sn0SkT8gKkDOOkRVbhIytIpzqchsl8=
X-TUID: fZGfWh5XF4iI

From: Cleber Rosa <crosa@redhat.com>

Commit 990dc39c made all tests executable at the time, but 218 came in
later, and missing those permissions.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20181004161852.11673-4-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qemu-iotests/218 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/218

diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
old mode 100644
new mode 100755
-- 
2.17.2
