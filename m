Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880954wro;
        Fri, 26 Oct 2018 08:32:02 -0700 (PDT)
X-Google-Smtp-Source: AJdET5emMXIHVxbqnyeguNgp2yy95th6THZuncDTFok4eGVR9dp6W8zzmh0JZTOfvMUdNyCUsSfz
X-Received: by 2002:adf:b64e:: with SMTP id i14-v6mr6490119wre.14.1540567922426;
        Fri, 26 Oct 2018 08:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567922; cv=none;
        d=google.com; s=arc-20160816;
        b=h5lHLzEJAsItFmhy35wqYz2LvljVlzxl1LtzDPv+9U5NY0m2DZaiUYWsdfz9oTUP2J
         D1DLNhvV/EA/b6M+cCLhrSjNBVj5mNtKkNGF42L4rz3+jc4ObffI8RovImZ8ksVO2JJZ
         bvTOXBJaPB3RsjhWUF6H4mkzUfhi1Qfgy3smDcyN9voGfpEot1ag/VLqaK2rzPyUMtKV
         3PpNBxJIpfrfe78TXOE9seXZFTgJYo6PoiB4aeppzHI/NtxU4S1qWHWFenJ/FDWDGLHr
         Tklnm05KJ9Guyy9fxC4+iZCZibXw32Aa0FpZz4jW6Et1WnY3Kq8YQaG/+esqoH434Z7z
         iEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=iZ7n7YIqNgH45zuLemr8TahtXZv0wVk6BLGyQosj4mU=;
        b=l0Sp1f6oZUm5KN5kXLSoDDnawx4XTjeprWwmszVC1pPDA4DkedFpYYE89nbHCr3YyT
         9qyIIjdBN3sjeEgHrESreBilzSO5j0YRoPLUyERTk/xlGalxy2TTQT1p8p02O7G2cuTx
         ILIVQjoxQ6Oj6UE0au5h7nWDI2nSlXR/OQ25m/Y9Jf4xVqfFyFGTZz0y+zmdHN+m0L2p
         7a+xti8dg6DJWI4qPJ5rsf9oNX6UHsSuB77rxerE49hMxc9Fjaa9YgWkkZIfcT/MnyfZ
         OXDtgIKRpUI1Jz20AaONzEBxIXYRVHsWJKyEREKFtE4dXYjkpLZWjnSTSsWKzdyQj0eY
         vZ6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id a123-v6si3989687wmd.70.2018.10.26.08.32.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:02 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MHmuE-1gKxte44cI-00EtqH; Fri, 26 Oct 2018 17:32:01 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MHmuE-1gKxte44cI-00EtqH; Fri, 26 Oct 2018 17:32:01 +0200
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Emilio G. Cota" <cota@braap.org>
Subject: [PULL 10/20] linux-user: fix comment s/atomic_write/atomic_set/
Date: Fri, 26 Oct 2018 17:31:15 +0200
Message-Id: <20181026153125.24738-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:GLB0mYYnfApJP68SEo13hvBeJvGYhMbIqgqKLx71zpXu9iLI3OS
 pyPgDiUiZq/11QMNSoWCIWlXTj5eVXeHsEC0rWE5tNKXTVtVXrizW6jfthcDgGZgRbUvISQ
 xZFoh+dyVn+Qiuam6N6Mjbun89sOPq5h8UYSkyYKhwt7BX7sDV8mSz4mbjhWezrDAmaDyqZ
 1R+3xrk16csIlR2SjC5pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:vVwgMDbK/qo=:nLfGV5TAWnSor2ljWWEgnA
 gvrSqjujEC1XqVSWcERipkSOiJhtzxmLdVI4KPlFlPGEPg2L4y0jEobuoYPG7qtuvjhGo36Tv
 YyfkcgzcoXP7/8CgiCFnow4XZUtAVxFatqjqU+9+f/3B5FpyyTx04NXuNVp4L9c0m5YDcRW4s
 4Tg1W6sLyNRfa/97ZT2yS1TJlsEgOtmWQ2qM/8nYbjg/avjfgT0An2qiwv4OR1SALq3r+KjW7
 m+6YV9Hc26aDTNIiXuPp3lzQKXkw3/Z4KS+wqgj+kRcsClV03dfFzutV9FmqxvuTpCHgDmXpn
 XX4XcMnIyf7d/yg8s/9b2w8aalSYK5slskm313zazZhNUYdhCnJWGjHkLwQ6W3ECoafC9k2BD
 n4mh9xlwA0US7lU4EzlEAOgv4jaZEiO9OiksSGR+m3uaTOssKHDf5z3KuDfz2pF9VeY6M4gMa
 b+0eex/xdcFlSlIrawy7kkqkmV4+TxRYB3SaPoYzXXtQkYLLNJOnwrPUuiqaopsuRZhYgk3r1
 58HHc72V1uHvXeSmGG+mHYswq0ZiM3T8iO66sY9rIlwNh5W45v9W8fGdJKOzaiKACWicT78Yx
 Jnm/Z3EPmR5AD3LUWnFQ1WZ8MYd81f7L54S65MDvR/IZyL6lRR2gWvLOLeZl3LdBbkCKDWlwH
 ZRwt5omGI8zW3WPt87J7baxdjMiSuQR4TxXaxY8/j6uMazOoNXAYwRJOeu6HteTczpcU=
X-TUID: I7sWWJmd/p7Y

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Message-Id: <20180811211011.6277-1-cota@braap.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 1beb6a2cfc..dde3f26f5a 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -143,7 +143,7 @@ typedef struct TaskState {
     /* Nonzero if process_pending_signals() needs to do something (either
      * handle a pending signal or unblock signals).
      * This flag is written from a signal handler so should be accessed via
-     * the atomic_read() and atomic_write() functions. (It is not accessed
+     * the atomic_read() and atomic_set() functions. (It is not accessed
      * from multiple threads.)
      */
     int signal_pending;
-- 
2.17.2
