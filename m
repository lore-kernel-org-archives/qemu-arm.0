Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880674wro;
        Fri, 26 Oct 2018 08:31:48 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dXb8YhTe2LQCbNsegUxvL8XnbPShqjEcoq+uyESyIhivhPkGwtETimBvMfDjYCYTT65QWZ
X-Received: by 2002:adf:df8b:: with SMTP id z11-v6mr5870192wrl.118.1540567908687;
        Fri, 26 Oct 2018 08:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567908; cv=none;
        d=google.com; s=arc-20160816;
        b=EF3t/ZTHtYR2mtNvhSTAHxHHWNUajvXq0Nw5Tfj3y/Wq6o7uycPX0ziSHNnmMA4XD8
         IM+0X8VgOL2ahlZKwOqwwBYHTQDsawEqZBcMqP7eVsMv6TvBHkj5bqtXysncdsLsis0X
         G6LRVvu/alU3qDB+GClpB11ndDPzw6gIyqaKqB75CJU+jUH8m6JcohjV30fSJPBZrhdr
         RBPtJVMYHQAMdZJuzzUkl2UJg0FTgu+pYKvS7GdmttRDZ2ylN2FzRsNzaFyqyhWXGJaH
         WgAdmFqmggyco9Z1R1djymTbYpyeJ5i59G5Y7kdaE2uWuLWh34eQiSxiWr5NAXVMjm/d
         N+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PBT5D6UIuigq19dQCvDE1WktRMGE5WMPcjvrRnLCvxQ=;
        b=K1XQy9sfjCrtTxNwJ4FxUD1k75VUX/VaCTY4pIjz5LUNSJZC724oT+GViic3OjkMXX
         0ijnt1tKVO0KNMcWFuH5Eta7aLNoFOsfrcdVOAw1Gwu0fj6ktuzCrGXpP2lEHK6Cibck
         JWQliwmBmyJH1N0J64LU8281sTdBeU+mKf737PJNsvs0udigf/gapNvVjGnxvSuwmILg
         AU4S0Lthk5AyaT09E8vSGydhA877zrVdArE0V5Tb2hzZan27LD/97YLSPa03pBWsVH6s
         KmYZ/ps6bPCqxjD+uIMOWdfy2KXjcUBIOoxqIHZVa75yn9//PmmC6D1GR5dTjKgaEOL/
         3LSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.187])
        by mx.google.com with ESMTPS id r185-v6si3434071wmf.166.2018.10.26.08.31.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:31:48 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.187;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MlsWZ-1fowSp3FMh-00izzc; Fri, 26 Oct 2018 17:31:45 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MlsWZ-1fowSp3FMh-00izzc; Fri, 26 Oct 2018 17:31:45 +0200
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
	yuchenlin <yuchenlin@synology.com>
Subject: [PULL 02/20] vga_int: remove unused function protype
Date: Fri, 26 Oct 2018 17:31:07 +0200
Message-Id: <20181026153125.24738-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zBjl53BXLDe83XDR0nGwZqpIXJTfSYzSSQLcc1Ra1jlaNe34CWR
 KOkhU7t9XI7rx/kTUZ6JQIGoHDEUYDO/crW3v6gOJOTdRkiq0sf3t1QVk+pyDhuX6hfVfR4
 kHS4Xb0mY/mbilVRTy3F0UJ9pYANfzYsgWyMJsqZm+jGoBpyOuSF87ktwatxSgMuRbckFWz
 HXJU8o0zIXuiqbQwn1XlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:R69yLWdoEGY=:/6fuZA9vUDYa94U80yL7Re
 BTxE+68DjkiHBvTqKlI0jY1909EIV4woPaDZmHy5MuFOXIrBjJnzuWjcboP4ubrXU8okMPYzq
 UQTx+nRaKB3KKS8pqZZfYy0SU6pPBdfjK87EFi6iRWrFW94NBbhvvMLD2njSEulDDlrdT+RKw
 513MvxTFnfEquqWka5ORcrEbkTN4DyrODfT0OoDO0QJdGVldNjcsiC3gtaulQ6q1DYUT3kBhU
 ZstMW6xCehFfo2/g0NXPs1KFT3FtZFenLgNai9kK1ZPynGt3unahHqTgA0zCpvBXnqUI8fTx1
 D+lM+TZo1/13GZfV3H3b0N5CRb70UoBP0NeIV07euKhFqLHVDeAJYHhFz01/v5XLHgw1G/ypm
 zFi0rQmGckhn6xpkMoTI8K6CfYY70EXft1Y7Y5UAySW23pAbQ6miILtz7W/Q+YuBJdngzhLib
 d/oWJMsnezo+SAL5/RiD3hXXm5tsUmY6nPgdjj9aKoPLOnPK2ocXOHt7C5RkT3BPhEB6bFirO
 sZeQGCNX2DkaGNIy0te5gub4ztYiLUfkWfQvP6nPv4iC7dAz1Q2n7/0zPUSK/WCq9QReRT7lz
 CbPBK0YyJ9DkZZ5ckykzaZcMsYJSGWPgKJlgyFQ/p2HSAe4pG5rrrTR0y//VkeO6wc8CEFIN+
 TbBnsetVUjD8+TVrD+RQxkBm4nh8thOK6yqJP+0d6JbcJzNNHVRnrOFWLZkLTZFS0naQWG2+5
 Z7Ywxyj4PChWLkZt
X-TUID: enpuqp8uTXO6

From: yuchenlin <yuchenlin@synology.com>

Signed-off-by: yuchenlin <yuchenlin@synology.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181022080053.9379-1-yuchenlin@synology.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/vga_int.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 6e4fa48a79..55c418eab5 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -166,7 +166,6 @@ MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
                           const MemoryRegionPortio **vbe_ports);
 void vga_common_reset(VGACommonState *s);
 
-void vga_sync_dirty_bitmap(VGACommonState *s);
 void vga_dirty_log_start(VGACommonState *s);
 void vga_dirty_log_stop(VGACommonState *s);
 
-- 
2.17.2
