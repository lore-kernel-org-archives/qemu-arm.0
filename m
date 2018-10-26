Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880927wro;
        Fri, 26 Oct 2018 08:32:01 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fi4d+h8aP2aNDWRMQczhIzKctCM3l2Ws2C/PMNOgoU2YH26RYTQFNR5XUWivwbThJPbSGd
X-Received: by 2002:a1c:13d0:: with SMTP id 199-v6mr1855210wmt.132.1540567921627;
        Fri, 26 Oct 2018 08:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567921; cv=none;
        d=google.com; s=arc-20160816;
        b=JnqocwfS4wq2iKz9qExNL+dhEmXtjlhuHoFr0tTlHZiN8HIn2OKqXXaDTgHu5EL5YO
         292mPfmvQZQSpvtzB95SFIgcb/sMlqpBGPRB7kia5AuW4sJrGMrF75MtCWsXqVpy9yQT
         jSOQq8GH910kY7yX0fQ5M7OyyD9zvBlY9Fcdv16lbwdOnpmcNl1Jp/BonGcOSzBXg8QF
         3fudm5MabMP1cY/K9Ok3AKBvJ6WsVhMbcZLZKHLXWgWwBAl1iZQ/fNqYNMdmu2XYtJoL
         LtQT7KBx1U85qhN0MC5GNpiaSCXwvquk7roIvIhRpoQCPfTIbZS/XQxuydHY7sMD1/3g
         UKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=hUPRBk12+PjAvaLGHeJb8B74S86vAhHYQBzFS8sJjS0=;
        b=BQQOuNsl6LxZCbdiLZ29DLDGCi3IK3hG6Dyc8l7RyMqB8W0qx3vmg2JrDfVz5QPRbZ
         ThbxE1wZ0iD1Djm4r6SAp8dY3x3b24s4ff3wesDd8bk2Jdr6NxPkfh9Ako0RIoPRRAC9
         DlZo7qeLzZAgDN10ppUrq6a2YwqnEuo7RBckDnnaWWV3xoEi8mirxcirxCQq3+JcYF4k
         GuI/86f+JEIUlKWnVfYPjcnljrOqr0sdpMaAjyLVqFgpIiXSm5fIfbC3O1WKe555VboE
         TvmHNrlkpLLE3m6Ry2ClxrM2wOJ4B4+qrhSpnvJ1P7ea06kdShOTzwGXUVdbx0I3kOo+
         BhNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.134])
        by mx.google.com with ESMTPS id 30-v6si10258160wrs.162.2018.10.26.08.32.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:01 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.134;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3Gok-1fXghI38r4-010OHp; Fri, 26 Oct 2018 17:31:59 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3Gok-1fXghI38r4-010OHp; Fri, 26 Oct 2018 17:31:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 09/20] qemu-iotests: make 218 executable
Date: Fri, 26 Oct 2018 17:31:14 +0200
Message-Id: <20181026153125.24738-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:gMxyO7cWiaH3Jx8M5bWDfTmNhiRZ8d5Z+EEnmLDHlJVSZ9g4bZj
 zqBcvvzl2TYWPx/7WhLpoop4bCMqP++g9JYwv6Ri89uwvtUWF3vdETI2ZN1I++X3yLGL9OX
 s6ArVYQwsnEAPqlwLQrCaSRbaMgzNfR//jGK/mP1C+paIUcS/cDCBs/TpiVD1Jzg8BkkKaB
 7hhrZW8gYoMhvQet2cfpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:wLyk8Prc9+g=:4d34OV/M03Vrq/gr64rvqz
 fDNpJ8apH/4Rv4HxBKnTHLtM0MzqNCxjD0j+KG1kbx08dw4i3hMxHwJOKoYQDVgjFB1faSCqk
 GqAeO2zEYN6cw960JcuhIGhmIViv//bKi3FNjEeQAJgxWGuTVPHs+CrvtrvoaIj8X119vJ9YO
 ErJ4rGc9oEYKHaDrB7X+mQVtPvTKlAbCvub4WVJy+3sYkZU+l7uY6S9GE6RlGeUq5LHFwx/7h
 uC89UyxrdVvYSUgXPdG7DH4KB7ITc7VYsdmPng044RVXynctAqrFd+3l5P/CWGXmlqbKhoNHS
 dYhuvUNltKeMXlc0hXU8IuRUWxF6GpovJ7snoDi/ybu8o7dSptV/RkmE/06T1EoVmMu1LlGPu
 xhOPwCxvdN2W7RBB6+C6pYaEPTK2r1Z6vaINqQFXOpXX/YWAgfWLrkZd39o/BtdIeKZtTdwsp
 Jeli3FaSlzqe5zuw6WJgbPowY57mygF/Jeywp50C3m6HWhT733raY6vpms4QB1njTJDyMV8QZ
 Im5ivmbWw0JJBpwYel5zZ2VrFs376L/JGWQzDaeKzF1C2mva3YrKr7jySocoUe5UwV55e4a1H
 7xsxxLEHE0t3tD9/7T7Agsh4ZGyx+2lYSHqpiXa65SXRNZ7don+LbKe6K83qQkVaIlxTmqA9R
 bRDvOiag+lobbRxbL+UmnMo4gVbsQQjms5Nh73zQopuoWh2mkFhJpKWu9cEF7EbJYexY=
X-TUID: HabFGfHtzMKi

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
