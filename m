Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440372wro;
        Tue, 30 Oct 2018 04:24:12 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fHhkAzKoWv8pa5Ex/OMRmuZ9yV0JGw0Pl5mBQls81USppwe8jPs6K8Q6C3Qhz+8pYJ00+n
X-Received: by 2002:a1c:e456:: with SMTP id b83-v6mr1390935wmh.143.1540898652436;
        Tue, 30 Oct 2018 04:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898652; cv=none;
        d=google.com; s=arc-20160816;
        b=qJGqowTgTTB60oN+GiXYYQFGhOIywwfrDtkGI8DvxJbjXdlmfcS6DPndQVJaYksU2x
         rRC7tcIecqZtkVtKGGtlLg2+nOZ7TESoWWePnAfEOUVUJi43Ab0TMeSRBLJr74OkBX1G
         shbFFnKxZwGnWDHCvzS4x6o+UjsyaxNi6b7OO0MvjMXKd53+X7TPs9WVHJNcqD1YiLKS
         mGnpl0EYXWPEALfSEQS4p2eviZ2KflyhEUq+MziZb8BHaU3+demXOXRzMuUHuRPzoShr
         n8wXnbqlBnaLl3Wi0H4omb3PkxMFbO+rhQvrC1FgdeOE42TY2wbrNkwtgCvCruw+4lu7
         xSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=iZ7n7YIqNgH45zuLemr8TahtXZv0wVk6BLGyQosj4mU=;
        b=e1MeJPwjo2byG16yAkdwybCriYjlEAG14OsfxKjly5ChfzHpDYMr1Gn9muV5NTEDqo
         mUDPDGtQ3F4FSErdIxUe1MhZEEyaBdpNYuMQ2vXirXx9tgvx1DWbP0WcdemP3nTeduQM
         nsIkVlXQUGLoJqUbZsqzpmwIW0f+o2eOO0l0b3Mig+xWjFQHHF9xkNouvSSWjJrt8jjW
         BkWSH5tyTF1Z/NhaHPL7NCSsWkAXZHR5lVdCxV0A9zamxzL3pFWUlQcZjWMDzFh3vWHh
         Kx+w+fifFkgo7BXiWAUnDP3XEDsJKcCM8TAM6gd3C0Ns92YLgntY0iygCV9mS4qOjQVv
         Xs3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.131])
        by mx.google.com with ESMTPS id l63-v6si13531958wma.100.2018.10.30.04.24.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:12 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.131;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MmlCY-1fsnlA1Eta-00js2W; Tue, 30 Oct 2018 12:24:06 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MmlCY-1fsnlA1Eta-00js2W; Tue, 30 Oct 2018 12:24:06 +0100
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
	Markus Armbruster <armbru@redhat.com>,
	"Emilio G. Cota" <cota@braap.org>
Subject: [PULL v2 10/20] linux-user: fix comment s/atomic_write/atomic_set/
Date: Tue, 30 Oct 2018 12:23:27 +0100
Message-Id: <20181030112337.17973-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:iduT3obFj7K1iAg6oBhUb4ixk+5svClYbEK4LAQjtywllXs7/pM
 KXdwAq9BbVsAnnocLClN5VeDPuS5pSgniB0jCgpETNrOyncCHDVNVNHf/HwfQeRwSQV52Sd
 bnDFZq3BMN2jn/YUk214peMgOqk83B7IPxVZiM6mNua6l8epS3P7+F3tt0+8oXBZfExdljW
 JpP14TVIduHIXRp5BFgHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:ZEHEYkSyeuk=:+dN7qyj6pb9jR30KZVhYzu
 FOtMRzx5/1qaHSnyB1NSWcMpuSZ/GbpA4bIK5UmyVfC2mB2jRq4VccFEnTqcVkFe5Zj/cCvKA
 9QyuzRchLb1zn8jfW2ydLrxDIzo/BOarg/yxv/xo4zPdOxJ3kZChuLXKOakzZLoKYU7t/CcuO
 rIfwVwiwxJECIVRe+mOvWVlNobvufNW4LgRj6FOkdBBVshhjR9DOKoqQl10SlVWQMAv3iO7IB
 bLMjPJquuoL9Dd6UL2RTGysrvTmfnZVuJsRsyvBeQG77UagJc4OnaiGLSLkBlEYZVJjh4nH0G
 VYAJdKPtGMb86o18DKxc3dNBIms7MInQghS7NMQ5TLw1RvgZ8n/qO4lOhbmN11kEVf1JCg5ke
 bFv5yLJXwiXCmT8EdyKejSdSWDmTGFN3cpmFw37EXw8AAe80KgRCWQATRcYTTqmeq88jWKuEd
 zxBHI++7gQL0+d8zqZh3XXd5mf/KApY2W2/JlFviGRKsMOYCL8T09qbDmEg/e2uhTZ8jQI3dR
 ML8tjymLTQJhygcxFcVjXPIMQ3lIRkZEyba7bQScKoUSO1Sw1lU3pPD3u3MyfhxEUCqZyECeE
 8D9lpJ7kU7hsXNvnacajRIPBrOT7TD0Ve2XvuH7WhbCUeYmobBjn3v4W8AlIXXTWVq1Eqi3YK
 VhO3pa8uOhf4ududqK2QQFNHBtGmCj/G/DcYCc2IIopmtM/TygbiSyzDF1lwangG0OZI=
X-TUID: YJ06Ne30wenu

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
