Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440029wro;
        Tue, 30 Oct 2018 04:23:54 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f8BIrayLQOYeoXiDkoyFFwvnqlsTYFzF/ZfGTVhocvrROUmtNE9I+/uPPA9zxY848y4bX2
X-Received: by 2002:a1c:b088:: with SMTP id z130-v6mr1339505wme.95.1540898634725;
        Tue, 30 Oct 2018 04:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898634; cv=none;
        d=google.com; s=arc-20160816;
        b=rcxRm0LJtOi6RcwwxsggN+MZ1238kTUjTVlHGjYw6r0A/hFvCxpU110B52rj6WRafe
         iKK8TqHe5TVcZ7dWPyHoAFU86TeJZppeT95JFAUl05oUvTvdhGOODUY1u+ixQBV3J0zQ
         H2DhejK4kaIhMQk0w4xT2Y39N8Rl1dK3pck+nqkz5iiXye3aEkiTb1rr/E8XuNTsj8Qu
         MJ83DoQZbn00gvlmsMO9pMjYg+7/vOPNFjxKz3BzJRFJnjvMsvWwwvPbQV2D/UMlB+DB
         VQXvQRP4v38cHIsN9Wdo1JU/Y+ZJ81l+GDhRewgHv2wypGDmVBCwMcfnc8l1gLJKKZyM
         9KUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PBT5D6UIuigq19dQCvDE1WktRMGE5WMPcjvrRnLCvxQ=;
        b=d4GSOWdZnHJuK8tdV/eAPjqKH61mAn/qDCwGT/7PEN5s/1a7VSlK/68yQuQUpHOt4P
         6xQgHVDOdWyVR+4xFmz3gLcMd7ZTjRbkRhNH5gsgJ8LM6dzkB+7TrdehRUPdGn+3Uyg9
         +NUq4u+S7PJPFPlHXGt4ntGRDM6241oNBrLHQCV2aBqQ5w3j6Iq12FQwA1IDNBMUxk8m
         frvo60Etyv+SlZuJhp/OMzaYQVQtmdl7AqVeiYKqBw0DpR/RG0cAhg5baEZHayNt6DfD
         2MPP8Bh+2RGPWw6tK1gp6QLVRPXUAQLtkA0EepIwtQCaJWrC7PA2Z/33gvKUUPuGE6Pu
         0gNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.135])
        by mx.google.com with ESMTPS id z3-v6si16829981wro.30.2018.10.30.04.23.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:23:54 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.135;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N6KpF-1fTHCB0FFR-016ceh; Tue, 30 Oct 2018 12:23:50 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N6KpF-1fTHCB0FFR-016ceh; Tue, 30 Oct 2018 12:23:50 +0100
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
	yuchenlin <yuchenlin@synology.com>
Subject: [PULL v2 02/20] vga_int: remove unused function protype
Date: Tue, 30 Oct 2018 12:23:19 +0100
Message-Id: <20181030112337.17973-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VdGPgtjUAK2VHmCK3f2ylcttjAeYbvGsyLbGr9yPbuJqMU1q2ZU
 pD66VUqYbTpjNKd/AXShpQsmE+2txaznUMX9R1cxelhdGolGa6WVdYyPTHRLI/1Vs8qNIvF
 I/w8nDmAsuH+PpBozNOGwq44jLIFsU+Nm7/GgcqBCOqZ1UBteQ0b1axHCUeGKnW4kHHn+m4
 +ZZgGiR40E+T6L1NV56vA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:Erk1HJDdJHg=:F/r/ZCIZlvIXgbC4fd1bF6
 3Vxwu/R8hiCysIvrSSu76BqL9kmzhaSVZAovKsGS8zRr+Vk8haasgSPT6GrGLDdVwM1eyyAkn
 7dmbHTaoAb6qNezywtGZkwRQEHq8XCfN6eXAK8Ds5GUq5H2VGrnK0BQ+9b0amcR8GzF4tyEE8
 zm3TWDuscDfb2CFis8D3g6hLsO4+jsu6PTP6hZ766hqaRcqwbqISedCk6qOJWdGTIt3T7hIyU
 6xME1bHMItSdH027YI4lduSnPN7Hj67K3e+S1dN6yA+gm6TUlIsf9q75NpeX4Fj7IE8w/XLFr
 GdOrZJ50fsLoiNIe2TBvF950a6cfT8d4N0DZ/IPLCHNb8rr8p+Cdzd8wjbYwkVqYmBK5NMwZD
 9HeJiT+sePiA9yagv07IYZLvtKEdCfaLF192QiFWazmOfk175etYOMwJSzgHszO0iOzAyn7T2
 CLc8xbMF0WScbeID7MYRdDgJeVfEy1DlS8B/QGIpwKo3D4QO9bClktVsWfWx1LKN2dX2ImR5u
 U08kN6WOcOORq4jQN/Uiy/OPWdHcFtU9gD1CV9JF1thaPAi62xRvW6Z8gxNXeFFiwcET65TIU
 Ukvpb/S4ea7yxu1VdxLleksJQsqyFQ5a5NlIKMQsHuii7P31ogsy5OEdTsMJ/cyf+NnLQZrad
 245Pj1EIt3o96jtfvz/Cop3kRHqKk5BeAM3cHhE+HwfLExrqD7JV9sG3rGEuQUgfjxOHjT4vx
 CsQuvedFqMBV01Wr
X-TUID: OXWF2gs50XfY

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
