Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g3-20020adffc83000000b00323293bd023sm336283wrr.6.2023.11.06.10.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:58:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5689D65765;
	Mon,  6 Nov 2023 18:51:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Timoth=C3=A9e=20Cocault?= <timothee.cocault@gmail.com>,
	fanwenjie <fanwj@mail.ustc.edu.cn>
Subject: [PATCH 21/22] mailmap: fixup some more corrupted author fields
Date: Mon,  6 Nov 2023 18:51:11 +0000
Message-Id: <20231106185112.2755262-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106185112.2755262-1-alex.bennee@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9zf0Pmq8A4Ei

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231013154424.1536392-9-alex.bennee@linaro.org>
Cc: Timothée Cocault <timothee.cocault@gmail.com>
Cc: fanwenjie <fanwj@mail.ustc.edu.cn>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 94f19a0ac9..e12e19f691 100644
--- a/.mailmap
+++ b/.mailmap
@@ -30,10 +30,12 @@ malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 # Corrupted Author fields
 Aaron Larson <alarson@ddci.com> alarson@ddci.com
 Andreas Färber <andreas.faerber@web.de> Andreas Färber <andreas.faerber>
+fanwenjie <fanwj@mail.ustc.edu.cn> fanwj@mail.ustc.edu.cn <fanwj@mail.ustc.edu.cn>
 Jason Wang <jasowang@redhat.com> Jason Wang <jasowang>
 Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.com>
 Michael Ellerman <mpe@ellerman.id.au> michael@ozlabs.org <michael@ozlabs.org>
 Nick Hudson <hnick@vmware.com> hnick@vmware.com <hnick@vmware.com>
+Timothée Cocault <timothee.cocault@gmail.com> timothee.cocault@gmail.com <timothee.cocault@gmail.com>
 
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
-- 
2.39.2
